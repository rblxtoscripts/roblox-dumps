-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
Library:Load("SoundFX")
local v2 = Library:Load("Timer")
local v3 = Library:Load("Throttle")
local v4 = Library:Load("Network")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
game:GetService("Chat")
local Library_2 = require(game.ReplicatedStorage:WaitForChild("Library"))
local BubbleChatLocal = require(game.ReplicatedStorage:WaitForChild("BubbleChatLocal"))
local v6 = Library_2:Load("Events")
local TextChatService = game:GetService("TextChatService")
local v7 = v2.new(3)
local v8 = script.Parent
local Chat = v8:WaitForChild("Chat")
local ConsoleChatHelp = v8:WaitForChild("ConsoleChatHelp")
local ExpandButton = v8.Parent:WaitForChild("ExpandButton")
local ScrollingFrame = v8:WaitForChild("ScrollingFrame")
local MessageTemplate = v8:WaitForChild("MessageTemplate")
local Bar = v8:WaitForChild("Bar")
local TextBox = Bar:WaitForChild("TextBox"):WaitForChild("TextBox")
v8.Position = UDim2.new(0, 5, 0, 0)
if MainGui.AbsoluteSize.Y < 500 then
	v8.Size = UDim2.new(0.4, 0, 0.35, 0)
end
local v9 = if v5.GamepadEnabled then 28 else 20
local v10 = MainGui.AbsoluteSize.Y / v9 * 3
local t = {}
local v11 = "Open"
MessageTemplate.Size = UDim2.new(1, -5, 0, v9)
v8.Size = UDim2.new(v8.Size.X.Scale, v8.Size.X.Offset, 0, v1:Round(v8.AbsoluteSize.Y, v9))
local v12 = GuiManager:RegisterWindow(v8)
v12.IsCoreGuiWindow = true
local t2 = {}
workspace.Main.PlayerHasVIP.OnClientEvent:connect(function(p1) --[[ Line: 86 | Upvalues: t2 (copy) ]]
	t2[p1] = true
end)
local SourceSansBold = Enum.Font.SourceSansBold
spawn(function() --[[ Line: 92 | Upvalues: v5 (copy), MessageTemplate (copy), TextBox (copy) ]]
	if v5.Localization:GetLanguageId() ~= "ru" then
		return
	end
	MessageTemplate.MessageLineTemplate.Font = Enum.Font.ArialBold
	MessageTemplate.Speaker.Font = Enum.Font.ArialBold
	TextBox.Font = Enum.Font.ArialBold
end)
function SetChatButtonVisible(p1) --[[ SetChatButtonVisible | Line: 100 | Upvalues: v5 (copy), Chat (copy), ConsoleChatHelp (copy) ]]
	if not v5.GamepadEnabled then
		Chat.Visible = p1
	end
	if not v5.GamepadEnabled then
		return
	end
	ConsoleChatHelp.Visible = p1
end
if v5.GamepadEnabled then
	Chat.Visible = false
	ConsoleChatHelp.Visible = true
end
local function SetWindowState(p1) --[[ SetWindowState | Line: 114 | Upvalues: v11 (ref) ]]
	if p1 == "Scrolling" then
		v11 = "Scrolling"
		ScrollingEnabled(true)
		return
	end
	if p1 ~= "Open" then
		return
	end
	v11 = "Open"
	ScrollingEnabled(false)
end
local v13 = Color3.fromHex("2DEB5C")
local v14 = Color3.fromHex("3394d4")
local v15 = Color3.fromHex("9678c6")
local t3 = {
	DEV = v14,
	CM = Color3.fromHex("fa0101"),
	MOD = v13,
	QA = v15
}
local function getRank(p1) --[[ getRank | Line: 140 | Upvalues: t3 (copy) ]]
	if p1:FindFirstChild("Incognito") then
		return
	end
	local _rankLoaded = p1:FindFirstChild("_rankLoaded")
	if not _rankLoaded then
		return
	end
	if _rankLoaded.Value == "None" then
	else
		return _rankLoaded.Value, t3[_rankLoaded.Value]
	end
end
local v16 = 1
function ShowMessage(p1, p2, p3, p4) --[[ ShowMessage | Line: 152 | Upvalues: BubbleChatLocal (copy), MessageTemplate (copy), v9 (copy), v16 (ref), ScrollingFrame (copy), t3 (copy), v5 (copy), t2 (copy), t (copy), v10 (copy) ]]
	if p2 == nil then
		return
	end
	local t4 = {
		DoTranslation = false,
		PlayPopSound = p4
	}
	if p1 and (p1.Parent and (p1.Character and (p1.Character:FindFirstChild("Head") and (p1.Character.Parent == workspace and p2 ~= "")))) then
		BubbleChatLocal:ShowChatBubbleLocal(p1.Character.Head, p2, t4)
		if p3 then
			return
		end
	end
	local Message = MessageTemplate:clone()
	Message.Visible = true
	Message.Name = "Message"
	Message.Size = UDim2.new(1, 0, 0, v9)
	Message.LayoutOrder = v16
	Message.Parent = ScrollingFrame
	v16 = v16 + 1
	local Speaker = Message.Speaker
	local Line1 = Message.MessageLineTemplate
	local v1 = nil
	local v2 = nil
	local v3 = false
	if p1 then
		local v4, v52
		if p1:FindFirstChild("Incognito") then
			v4 = nil
			v52 = nil
		else
			local _rankLoaded = p1:FindFirstChild("_rankLoaded")
			if _rankLoaded and _rankLoaded.Value ~= "None" then
				v4 = _rankLoaded.Value
				v52 = t3[_rankLoaded.Value]
			else
				v4 = nil
				v52 = nil
			end
		end
		Speaker.TextColor3 = if v52 then v52 else p1.TeamColor.Color
		Speaker.TextSize = v9
		local v7
		if v4 then
			v7 = ("[%*] "):format(v4) .. p1.DisplayName .. ":"
			v1 = v4
			v2 = v52
		else
			v1 = v4
			v2 = v52
			v7 = p1.DisplayName .. ":"
		end
		Speaker.Text = v7
		Speaker.Size = UDim2.new(0, Speaker.TextBounds.X, 0, v9)
		Speaker.Visible = true
	else
		Speaker.Visible = false
		Speaker.Text = ""
		Speaker.Size = UDim2.new(0, 0, 0, v9)
		Line1.TextColor3 = Color3.new(199/255, 199/255, 199/255)
		if type(p2) == "table" then
			v3 = false
			if p2[1] == "ServerNotification" then
				p2 = p2[2]
				Line1.TextColor3 = Color3.fromRGB(255, 255, 0)
			elseif p2[1] == "PlayerUnwrappedRare" then
				Line1.TextColor3 = v5.CapsuleTypeToColor.Rare
				p2 = v5.Translate(p2[1], nil, p2[2], p2[3], p2[4])
			elseif p2[1] == "PlayerUnwrappedLegendary" then
				Line1.TextColor3 = v5.CapsuleTypeToColor.Legendary
				p2 = v5.Translate(p2[1], nil, p2[2], p2[3], p2[4])
			elseif p2[1] == "PlayerFired" then
				Line1.TextColor3 = Color3.new(255/255, 0/255, 0/255)
				p2 = p2[2] .. " was fired by the manager and has been removed from the game"
			elseif p2[1] == "fromC00lkidd" then
				Line1.TextColor3 = Color3.new(255/255, 0/255, 0/255)
				p2 = p2[2]
			else
				p2 = v5.Translate(p2[1], nil, p2[2], p2[3], p2[4])
			end
		else
			v3 = true
		end
	end
	local t5 = {}
	Line1.Visible = true
	Line1.AutoLocalize = v3
	Line1.Name = "Line1"
	Line1.TextSize = v9
	Line1.Position = UDim2.new(0, Speaker.AbsoluteSize.X + 3, 0, 0)
	Line1.Size = UDim2.new(1, -Speaker.AbsoluteSize.X - 3, 0, v9)
	Line1.Parent = Message
	Line1.Text = p2
	table.insert(t5, Line1)
	if t2[p1] then
		Line1.TextColor3 = Color3.fromRGB(255, 230, 87)
	end
	local v11 = Line1
	if v1 then
		v11.TextColor3 = v2
	end
	local v12 = ""
	local count = 2
	local v13 = ""
	local v14 = 1
	for v15 in string.gmatch(p2, "%S+") do
		v12 = v12 .. " " .. v15
	end
	for v162 in string.gmatch(v12, "%S+") do
		v11.Text = v13 .. " " .. v162
		if v11.TextFits then
			v13 = v13 .. " " .. v162
			continue
		end
		v14 = v14 + string.len(v13) + 1
		v11.Text = v13
		local v17 = Line1:clone()
		v17.Visible = true
		v17.TextSize = v9
		v17.Position = UDim2.new(0, 0, 0, (count - 1) * v9)
		v17.Size = UDim2.new(1, 0, 0, v9)
		v17.Parent = Message
		v17.Text = v162
		v17.Name = "Line" .. tostring(count)
		Message.Size = UDim2.new(1, -5, 0, count * v9)
		table.insert(t5, v17)
		if t2[p1] then
			v17.TextColor3 = Color3.fromRGB(255, 230, 87)
		end
		v11 = v17
		if v1 then
			v17.TextColor3 = v2
		end
		count, v13 = count + 1, v162
	end
	table.insert(t, 1, Message)
	if not (v10 < #t) then
		return
	end
	table.remove(t, #t):Destroy()
end
local t4 = {}
function IsFlooded() --[[ IsFlooded | Line: 356 | Upvalues: t4 (copy) ]]
	while #t4 > 0 and tick() - t4[1] > 15 do
		table.remove(t4, 1)
	end
	return #t4 > 7
end
function RefreshLayout() --[[ RefreshLayout | Line: 371 ]] end
function EditTextEnabled(p1) --[[ EditTextEnabled | Line: 383 | Upvalues: v11 (ref), Bar (copy), TextBox (copy) ]]
	if p1 and v11 == "Closed" then
		v11 = "Open"
		ScrollingEnabled(false)
	end
	if p1 then
		SetChatButtonVisible(false)
		Bar.Visible = true
		task.wait()
		TextBox:CaptureFocus()
	else
		Bar.Visible = false
		SetChatButtonVisible(true)
	end
end
function _G.Chat(p1, p2, p3) --[[ Line: 402 | Upvalues: t4 (copy), TextChatService (copy) ]]
	workspace.Main.Chatted:FireServer(p1, p2)
	workspace.Main.Chatted.Chatted:Fire(p1)
	if p2 then
		TextChatService.TextChannels.RBXGeneral:SendAsync(p1)
		return
	end
	table.insert(t4, tick())
	TextChatService.TextChannels.RBXGeneral:SendAsync(p1)
end
function SendMessage(p1) --[[ SendMessage | Line: 418 | Upvalues: TextBox (copy) ]]
	EditTextEnabled(false)
	if TextBox.Text == "" then
		return
	end
	local v1 = IsFlooded()
	if p1 and not v1 then
		_G.Chat(TextBox.Text, false, true)
	else
		if not v1 then
			TextBox.Text = ""
			return
		end
		ShowMessage(nil, "Too many messages")
		RefreshLayout()
	end
	TextBox.Text = ""
end
if v5.GamepadEnabled then
	TextBox:GetPropertyChangedSignal("Text"):connect(function() --[[ Line: 439 | Upvalues: TextBox (copy) ]]
		if TextBox.Text ~= "" then
			SendMessage(true)
			TextBox:ReleaseFocus()
		end
	end)
else
	TextBox.FocusLost:connect(function(p1) --[[ Line: 447 ]]
		SendMessage(p1)
	end)
end
local v17 = false
v7:OnFinished(function() --[[ Line: 456 | Upvalues: v17 (ref), v4 (copy) ]]
	v17 = false
	v4:FireServer("DotAnimEnabled", false)
end)
local v18 = 0
TextBox.Changed:connect(function(p1) --[[ Line: 463 | Upvalues: v17 (ref), v4 (copy), TextBox (copy), v7 (copy), v18 (ref), Bar (copy) ]]
	if p1 ~= "Text" then
		return
	end
	if not v17 then
		v4:FireServer("DotAnimEnabled", true)
	end
	if TextBox.Text == "" then
		v17 = false
		v4:FireServer("DotAnimEnabled", false)
	else
		v17 = true
	end
	v7:Start()
	if string.len(TextBox.Text) > 200 then
		TextBox.Text = string.sub(TextBox.Text, 1, 200)
		return
	end
	if string.len(TextBox.Text) < v18 then
		Bar.Size = UDim2.new(1, 14, 0, 30)
		for i = 1, 5 do
			if TextBox.TextFits then
				break
			end
			Bar.Size = UDim2.new(1, 14, 0, i * 18 + 40)
		end
	elseif not TextBox.TextFits then
		Bar.Size = UDim2.new(1, 14, 0, Bar.Size.Y.Offset + 18)
	end
	v18 = string.len(TextBox.Text)
end)
TextChatService.TextChannels.RBXGeneral.MessageReceived:connect(function(p1) --[[ Line: 507 ]]
	if p1.Status ~= Enum.TextChatMessageStatus.Success then
		return
	end
	local v1 = p1.TextSource and game.Players:GetPlayerByUserId(p1.TextSource.UserId)
	if not v1 then
		return
	end
	if p1.Metadata ~= "true" then
		local isMetadata = p1.Metadata == nil
	end
	ShowMessage(v1, if p1.Translation == "" then p1.Text else p1.Translation or p1.Text, false, true)
	RefreshLayout()
end)
local v19 = v3.new(3, 15)
v19.ThrottlePenaltySeconds = 30
workspace.Main.DisplaySystemMessage.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 525 | Upvalues: v5 (copy), v19 (copy), LocalPlayer (copy) ]]
	if p1 and (p1.Character and p1.Character:FindFirstChild("Head")) then
		for k, v in pairs(v5.EmoteToEmoji) do
			if p2 == v and (not v19:CallCheck(p1) or LocalPlayer:DistanceFromCharacter(p1.Character.Head.Position) > 100) then
				return
			end
		end
	end
	ShowMessage(p1, p2, p3, true)
	RefreshLayout()
end)
task.spawn(function() --[[ Line: 538 | Upvalues: v6 (copy), Bar (copy), v8 (copy) ]]
	if _G.CanChat == nil then
		v6:Wait("CanChat")
	end
	if _G.CanChat then
		game:GetService("UserInputService").InputBegan:connect(function(p1, p2) --[[ Line: 545 | Upvalues: Bar (ref) ]]
			if p1.UserInputType ~= Enum.UserInputType.Keyboard or (p1.KeyCode ~= Enum.KeyCode.Slash or Bar.Visible) then
				return
			end
			wait()
			EditTextEnabled(true)
		end)
		game:GetService("ContextActionService"):BindAction("ConsoleChat", function(p1, p2, p3) --[[ Line: 554 | Upvalues: v8 (ref) ]]
			if p2 ~= Enum.UserInputState.Begin or not v8.Visible then
				return
			end
			EditTextEnabled(true)
		end, false, Enum.KeyCode.DPadUp)
	else
		SetChatButtonVisible(false)
	end
end)
function ScrollingEnabled(p1) --[[ ScrollingEnabled | Line: 600 | Upvalues: v8 (copy), ScrollingFrame (copy) ]]
	if p1 then
		v8.Size = UDim2.new(0.3, 0, 1, -75)
		v8.Transparency = 0.3
		ScrollingFrame.ScrollingEnabled = true
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
		ScrollingFrame.CanvasPosition = Vector2.new(0, ScrollingFrame.AbsoluteCanvasSize.Y)
	else
		v8.Transparency = 1
		v8.Size = UDim2.new(0.3, 0, 0.25, 0)
		ScrollingFrame.ScrollingEnabled = false
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	end
end
function ButtonPressed(p1) --[[ ButtonPressed | Line: 673 | Upvalues: Chat (copy), ExpandButton (copy), v11 (ref), v8 (copy) ]]
	if p1 == Chat then
		EditTextEnabled(true)
		return
	end
	if p1 ~= ExpandButton then
		return
	end
	if v11 == "Open" then
		v11 = "Scrolling"
		ScrollingEnabled(true)
		ExpandButton.Icon.ImageColor3 = Color3.fromRGB(20, 185, 255)
		ExpandButton.Icon.Rotation = 180
		ExpandButton.Icon.ImageTransparency = 0
		ExpandButton.BackgroundTransparency = 0
		v8.Transparency = 0.5
		return
	end
	if v11 ~= "Scrolling" then
		return
	end
	v11 = "Open"
	ScrollingEnabled(false)
	ExpandButton.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
	ExpandButton.Icon.Rotation = 0
	ExpandButton.Icon.ImageTransparency = 0.5
	ExpandButton.BackgroundTransparency = 0.5
	v8.Transparency = 1
end
Chat.MouseButton1Click:Connect(function() --[[ Line: 728 | Upvalues: Chat (copy) ]]
	ButtonPressed(Chat)
end)
ExpandButton.MouseButton1Click:Connect(function() --[[ Line: 731 | Upvalues: ExpandButton (copy) ]]
	ButtonPressed(ExpandButton)
end)
if LocalPlayer.Name == "Dued1" then
	game.Players.PlayerAdded:Connect(function(p1) --[[ Line: 736 ]]
		task.delay(10, function() --[[ Line: 737 | Upvalues: p1 (copy) ]]
			if not p1:FindFirstChild("IsNewPlayer") then
				return
			end
			ShowMessage(nil, p1.Name .. " is a new player")
		end)
	end)
end
wait(1)
if Debug.Enabled and not Debug.IntroEnabled then
	v12:SetVisible(false)
	v12:SetVisible(true)
end
if not v5.IntroSequenceEnabled or v5.PlaceSettings.SkipIntro then
	v12:SetVisible(false)
	v12:SetVisible(true)
end
if not v5.IsPartyServer then
	return
end
v12:SetVisible(true)