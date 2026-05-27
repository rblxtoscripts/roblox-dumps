-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ClassicNameColors")
local v2 = Sonar("PlayerOverhead")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("T")
local v6 = Sonar("TitlesService")
local v7 = Sonar("TranslationHelper")
Sonar("ChatConfig")
local v8 = Sonar("Constants")
local BubbleDuration = TextChatService.BubbleChatConfiguration.BubbleDuration
local Configs = Sonar("Gamebeast"):GetService("Configs")
local t2 = {}
Configs:Observe("ChatFilter", function(p1) --[[ Line: 32 | Upvalues: t2 (ref) ]]
	t2 = string.split(p1, ",")
end)
local v9 = v4.GetRemoteEvent("BroadcastChatMessage")
local LocalPlayer = Players.LocalPlayer
local function GetWrapperFromTextChatMessage(p1) --[[ GetWrapperFromTextChatMessage | Line: 41 | Upvalues: Players (copy), v3 (copy) ]]
	local v1 = p1.TextSource and p1.TextSource.UserId or nil
	local v2 = v1 and Players:GetPlayerByUserId(v1) or nil
	if not v2 then
		local v32
		if v1 then
			v32 = v1
		else
			local match = string.match
			v32 = match(v2 and v2.UserId or p1.Text, "%b__")
		end
		local v6 = tonumber((string.sub(v32 or "", 2, -2)))
		if v6 then
			v2 = Players:GetPlayerByUserId(v6)
		end
	end
	return v3.getWrapperFromPlayer(v2)
end
local function HandleWhisperPrefix(p1, p2, p3) --[[ HandleWhisperPrefix | Line: 60 | Upvalues: v8 (copy), LocalPlayer (copy), v7 (copy), v1 (copy), Players (copy) ]]
	local v12 = v8.PresetColors.Default.TextColor:ToHex()
	if not (if LocalPlayer == p1 then true else false) then
		return string.format("<font color=\'#%s\'><b>[%s]</b></font>", v12, v7.Translate("From")) .. " " .. string.format("<font color=\'#%s\'><b>%s</b></font>", v1(p1):ToHex(), p2)
	end
	local TextChannel = p3.TextChannel
	if not TextChannel then
		return ""
	end
	local v3 = nil
	for v4, v5 in TextChannel:GetDescendants() do
		if v5:IsA("TextSource") then
			local UserId = v5.UserId
			if UserId ~= LocalPlayer.UserId then
				v3 = Players:GetPlayerByUserId(UserId)
				break
			end
		end
	end
	if not v3 then
		v3 = {
			DisplayName = v7.Translate("Unknown")
		}
	end
	return string.format("<font color=\'#%s\'><b>[%s]</b></font>", v12, (("%* %*"):format(v7.Translate("To"), (string.gsub(v3.DisplayName, ":", ""))))) .. ":"
end
local function AddTagsToMessage(p1, p2) --[[ AddTagsToMessage | Line: 102 | Upvalues: TextChatService (copy), v6 (copy), HandleWhisperPrefix (copy), v1 (copy) ]]
	p1.Text = string.gsub(p1.Text, "tradeAnnouncement_%d+_", "")
	local Player = p2.Player
	local DisplayName = Player.DisplayName
	local v12 = TextChatService.ChatWindowConfiguration:DeriveNewMessageProperties()
	local v2 = v6.GetChatMessageColor(Player)
	local isNotTranslation = p1.Translation ~= ""
	local v3 = p1.TextChannel and string.find(p1.TextChannel.Name, "Whisper")
	local v4 = nil
	local v5 = (if v4 then v4 elseif v3 then HandleWhisperPrefix(Player, DisplayName, p1) else nil) or string.format("<font color=\'#%s\'><b>%s</b></font>", v1(Player):ToHex(), DisplayName)
	local v62 = p2.SettingsFolder and p2.SettingsFolder:FindFirstChild("Title")
	local v7 = v62 and v62.Value or ""
	local v9 = v7 and v7 ~= "" and v6.GetTitleFromName(v7) or nil
	if not v9 then
		for v10, v11 in { "Developer", "Moderator" } do
			if p2:HasPermission(v11) then
				v9 = v6.GetTitleFromName(v11)
				break
			end
		end
	end
	local v13 = v2:ToHex()
	local v14 = string.format("<font color=\'#%s\'>%s</font>", v13, p1.Translation)
	local v15 = string.format("<font color=\'#%s\'>%s</font>", v13, p1.Text)
	if v3 or not v9 then
		v12.PrefixText = v5
		v12.Text = v15
		v12.Translation = if isNotTranslation then v14 else ""
	else
		v12.Translation = if isNotTranslation then ("%* %*"):format(v5, v14) else ""
		v12.Text = ("%* %*"):format(v5, v15)
		v12.PrefixTextProperties = TextChatService.ChatWindowConfiguration:DeriveNewMessageProperties()
		v12.PrefixText = string.format("<font color=\'#%s\'><b>[%s]</b></font>", (v9.TextColor or v9.Color):ToHex(), v9.DisplayName or v9.Title)
		if v9.Gradient then
			v9.Gradient:Clone().Parent = v12.PrefixTextProperties
		end
	end
	return v12
end
local function OnChatWindowAdded(p1) --[[ OnChatWindowAdded | Line: 161 | Upvalues: GetWrapperFromTextChatMessage (copy), AddTagsToMessage (copy) ]]
	local v1 = GetWrapperFromTextChatMessage(p1)
	if v1 then
		return AddTagsToMessage(p1, v1)
	end
end
local function OnIncomingMessage(p1) --[[ OnIncomingMessage | Line: 171 | Upvalues: LocalPlayer (copy), t2 (ref) ]]
	local TextSource = p1.TextSource
	if not TextSource then
		return
	end
	if TextSource.UserId == LocalPlayer.UserId then
		return
	end
	local v1 = p1.Text:lower()
	for v2, v3 in t2 do
		if string.find(v1, v3:lower()) then
			p1.Text = ""
			return
		end
	end
end
TextChatService.OnChatWindowAdded = OnChatWindowAdded
TextChatService.OnIncomingMessage = OnIncomingMessage
local function ShouldShowBroadcastedMessage(p1) --[[ ShouldShowBroadcastedMessage | Line: 192 ]]
	return true
end
local function DisplayBroadcastedMessage(p1, p2, p3) --[[ DisplayBroadcastedMessage | Line: 196 | Upvalues: v5 (copy), TextChatService (copy), v8 (copy) ]]
	local v1, _ = v5.string(p1)
	if not v1 then
		return
	end
	local RBXSystem = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")
	local v2 = (if p2 then v8.TextChatThemes[p2] else p2) or {}
	local v3 = v2.NameColor or Color3.fromRGB(85, 150, 255)
	local v4 = v2.ChatColor or Color3.fromRGB(255, 208, 66)
	RBXSystem:DisplaySystemMessage(string.format("<font color=\'#%s\'><b>[%s]</b></font>", v3:ToHex(), v2.Name or (v2.Title or "Server")) .. " " .. string.format("<font color=\'#%s\'><b>%s</b></font>", v4:ToHex(), p1))
end
v9.OnClientEvent:Connect(DisplayBroadcastedMessage)
function TextChatService.OnBubbleAdded(p1) --[[ OnBubbleAdded | Line: 231 | Upvalues: GetWrapperFromTextChatMessage (copy), v2 (copy), BubbleDuration (copy) ]]
	local v1 = GetWrapperFromTextChatMessage(p1)
	if not v1 then
		return
	end
	local v22 = v2:Get(v1.Character)
	if v22 then
		local function SetChatting(p1) --[[ SetChatting | Line: 242 | Upvalues: v22 (copy) ]]
			v22.Chatting = p1
			v22.ChattedSignal:Fire()
		end
		v22.Chatting = true
		v22.ChattedSignal:Fire()
		v1.Maid.TextChatBubbleDisappearDuration = task.delay(BubbleDuration + 0.6, function() --[[ Line: 249 | Upvalues: v22 (copy) ]]
			v22.Chatting = false
			v22.ChattedSignal:Fire()
		end)
	end
end
t.DisplayBroadcastedMessage = DisplayBroadcastedMessage
local function HandleShowChannelTabs() --[[ HandleShowChannelTabs | Line: 257 | Upvalues: TextChatService (copy), LocalPlayer (copy) ]]
	local TextChannels = TextChatService:WaitForChild("TextChannels")
	local function onTextChannelChanged() --[[ onTextChannelChanged | Line: 260 | Upvalues: TextChannels (copy), LocalPlayer (ref), TextChatService (ref) ]]
		local v1 = false
		for v2, v3 in TextChannels:GetChildren() do
			local v4 = v3.Name:sub(1, 3) == "RBX"
			if not v4 and v3:FindFirstChild(LocalPlayer.Name) then
				v1 = true
				break
			end
		end
		TextChatService.ChannelTabsConfiguration.Enabled = v1
	end
	TextChannels.DescendantAdded:Connect(onTextChannelChanged)
	TextChannels.DescendantRemoving:Connect(function() --[[ Line: 281 | Upvalues: onTextChannelChanged (copy) ]]
		task.defer(onTextChannelChanged)
	end)
	onTextChannelChanged()
end
task.defer(HandleShowChannelTabs)
return t