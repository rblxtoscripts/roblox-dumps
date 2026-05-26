-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("MessagingService")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("ModerationService")
local v6 = Sonar("PlaceTypeService")
local v7 = Sonar("GamePermissionsService")
Sonar("TextChatClient", "Client")
local v8 = game:GetService("RunService"):IsServer()
local v9 = game:GetService("RunService"):IsStudio()
local v10 = v4.GetConfig("TextChat")()
local SystemMessageChannel = v10.SystemMessageChannel
if v6.IsTestGame() or v9 then
	SystemMessageChannel = SystemMessageChannel .. "_TEST"
end
local v11 = v2.GetRemoteEvent("BroadcastChatMessage")
local CustomChannels
if v8 then
	CustomChannels = TextChatService:FindFirstChild("CustomChannels")
	if not CustomChannels then
		CustomChannels = Instance.new("Folder")
		CustomChannels.Name = "CustomChannels"
		CustomChannels.Parent = TextChatService
	end
else
	CustomChannels = TextChatService:WaitForChild("CustomChannels")
end
local CustomCommands
if v8 then
	CustomCommands = TextChatService:FindFirstChild("CustomCommands")
	if not CustomCommands then
		CustomCommands = Instance.new("Folder")
		CustomCommands.Name = "CustomCommands"
		CustomCommands.Parent = TextChatService
	end
else
	CustomCommands = TextChatService:WaitForChild("CustomCommands")
end
local t2 = {}
local function getWrapperFromTextSource(p1) --[[ getWrapperFromTextSource | Line: 126 | Upvalues: Players (copy), v3 (copy) ]]
	local UserId = p1.UserId
	if not UserId then
		return
	end
	local v1 = Players:GetPlayerByUserId(UserId)
	if v1 then
		return v3.getWrapperFromPlayer(v1)
	end
end
local function canExecuteTextChatCommand(p1, p2) --[[ canExecuteTextChatCommand | Line: 136 | Upvalues: v7 (copy) ]]
	if p2.CanExecute and not p2.CanExecute(p1) then
		return false
	end
	return v7.CanRunCommand(p1.Player, p2) and true or false
end
local function messageReceived(p1, p2) --[[ messageReceived | Line: 151 | Upvalues: t2 (copy), t (copy) ]]
	local Data = p1.Data
	if Data.Job == game.JobId then
		return
	end
	local Callback = Data.Callback
	if Callback and t2[Callback] ~= nil then
		task.defer(t2[Callback], Data)
	end
	if p2 == nil then
		return t.BroadcastMessage(Data)
	else
		return t.BroadcastMessageToClient(p2, Data)
	end
end
local function textChannelAdded(p1) --[[ textChannelAdded | Line: 174 | Upvalues: Players (copy), v5 (copy) ]]
	if p1:IsA("TextChannel") then
		function p1.ShouldDeliverCallback(p1, p2) --[[ Line: 177 | Upvalues: Players (ref), v5 (ref) ]]
			local v1 = Players:GetPlayerByUserId(p1.TextSource.UserId)
			if v1 then
				return not v5.HasActiveModeration(v1, "Muted")
			else
				return true
			end
		end
	end
end
function t.BroadcastGlobalMessage(p1) --[[ BroadcastGlobalMessage | Line: 193 | Upvalues: t2 (copy), t (copy), v1 (copy), SystemMessageChannel (ref) ]]
	local t3 = {
		Job = game.JobId,
		Message = p1.Message,
		Type = p1.Type,
		Callback = p1.Callback,
		Sender = p1.Sender
	}
	local Callback = t3.Callback
	if Callback and t2[Callback] ~= nil then
		task.defer(t2[Callback], t3)
	end
	t.BroadcastMessage(t3)
	v1.Publish(SystemMessageChannel, t3)
end
function t.BroadcastGlobalMessageToClient(p1, p2) --[[ BroadcastGlobalMessageToClient | Line: 211 | Upvalues: Players (copy), t (copy), v1 (copy), SystemMessageChannel (ref) ]]
	local v12 = typeof(p1) == "number" and Players:GetPlayerByUserId(p1) or p1
	if v12 then
		return t.BroadcastMessageToClient(v12, p2)
	else
		return v1.Publish(("%*_%*"):format(SystemMessageChannel, v12.UserId), {
			Job = game.JobId,
			Message = p2.Message,
			Type = p2.Type,
			Sender = p2.Sender
		})
	end
end
function t.BroadcastMessage(p1) --[[ BroadcastMessage | Line: 227 | Upvalues: v11 (copy) ]]
	v11:FireAllClients(p1.Message, p1.Type, p1.Sender)
end
function t.BroadcastMessageToClient(p1, p2) --[[ BroadcastMessageToClient | Line: 231 | Upvalues: v11 (copy) ]]
	v11:FireClient(p1, p2.Message, p2.Type, p2.Sender)
end
function t.AddChatCallback(p1, p2) --[[ AddChatCallback | Line: 235 | Upvalues: t2 (copy) ]]
	if t2[p1] == nil then
		t2[p1] = p2
	else
		warn("\226\154\160\239\184\143 TextChatService: Callback with type", p1, "is already registered")
	end
end
function t.AddTextChannel(p1, p2) --[[ AddTextChannel | Line: 244 | Upvalues: t (copy), CustomChannels (ref) ]]
	if t.GetTextChannel(p1) then
		warn("\226\154\160\239\184\143 TextChatService: Channel with name", p1, "already exists")
		return
	end
	local TextChannel = Instance.new("TextChannel")
	TextChannel.Name = p1
	if p2.Color then
		TextChannel:SetAttribute("Color", p2.Color)
	end
	local v1 = TextChannel
	v1.Parent = CustomChannels
	if p2.Players then
		for v2, v3 in p2.Players do
			t.AddPlayerToTextChannel(p1, v3)
		end
	end
	return v1
end
function t.RemoveTextChannel(p1) --[[ RemoveTextChannel | Line: 267 | Upvalues: t (copy) ]]
	local v1 = t.GetTextChannel(p1)
	if v1 then
		v1:Destroy()
	else
		warn("\226\154\160\239\184\143 TextChatService: Channel with name", p1, "does not exist")
	end
end
function t.GetTextChannel(p1) --[[ GetTextChannel | Line: 277 | Upvalues: CustomChannels (ref) ]]
	return CustomChannels:FindFirstChild(p1)
end
function t.AddPlayerToTextChannel(p1, p2) --[[ AddPlayerToTextChannel | Line: 281 | Upvalues: t (copy) ]]
	local v1 = t.GetTextChannel(p1)
	if not v1 then
		warn("\226\154\160\239\184\143 TextChatService: Channel with name", p1, "does not exist")
		return
	end
	v1:AddUserAsync(typeof(p2) == "Instance" and p2:IsA("Player") and p2.UserId or p2)
end
function t.RemovePlayerFromTextChannel(p1, p2) --[[ RemovePlayerFromTextChannel | Line: 291 | Upvalues: t (copy), Players (copy) ]]
	local v1 = t.GetTextChannel(p1)
	if not v1 then
		warn("\226\154\160\239\184\143 TextChatService: Channel with name", p1, "does not exist")
		return
	end
	local v2 = if typeof(p2) == "Player" and p2 then p2 else Players:GetPlayerByUserId(p2)
	if not v2 then
		warn("\226\154\160\239\184\143 TextChatService: Player with id", v2, "does not exist")
		return
	end
	local v3 = v1:FindFirstChild(v2.Name)
	if v3 then
		v3:Destroy()
	else
		warn("\226\154\160\239\184\143 TextChatService: Player with name", v2.Name, "does not exist in channel", p1)
	end
end
function t.Init(p1) --[[ Init | Line: 313 | Upvalues: v8 (copy), v10 (copy), TextChatService (copy), textChannelAdded (copy), v1 (copy), SystemMessageChannel (ref), messageReceived (copy), v3 (copy), v9 (copy), t (copy), Players (copy), v7 (copy), CustomCommands (ref) ]]
	if v8 then
		for v12, v2 in v10.TextChatServiceProperties do
			if typeof(v2) == "table" then
				for v32, v4 in v2 do
					TextChatService[v12][v32] = v4
				end
				continue
			end
			for v5, v6 in v2 do
				TextChatService[v12] = v6
			end
		end
		TextChatService.DescendantAdded:Connect(textChannelAdded)
		for v72, v82 in TextChatService:GetDescendants() do
			task.spawn(textChannelAdded, v82)
		end
		v1.Subscribe(SystemMessageChannel, messageReceived)
		v3.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 334 | Upvalues: v1 (ref), SystemMessageChannel (ref), messageReceived (ref) ]]
				p2.Maid:GivePromise(v1.Subscribe(("%*_%*"):format(SystemMessageChannel, p1.UserId), function(p12) --[[ Line: 336 | Upvalues: messageReceived (ref), p1 (copy) ]]
					messageReceived(p12, p1)
				end)):andThen(function(p1) --[[ Line: 338 | Upvalues: p2 (copy) ]]
					p2.Maid:GiveTask(p1)
				end)
			end
		})
		if v9 and (v10.TestBroadcastThemes and v10.BroadcastThemes) then
			task.delay(10, function() --[[ Line: 345 | Upvalues: v10 (ref), t (ref) ]]
				for v1, v2 in v10.BroadcastThemes do
					t.BroadcastMessage({
						Message = ("Test broadcast for theme \"%*\""):format(v1),
						Type = v1
					})
				end
			end)
		end
	end
	for v102, v11 in v10.TextCommands do
		local v92
		if v8 then
			local TextChatCommand = Instance.new("TextChatCommand")
			TextChatCommand.Name = v102
			TextChatCommand.PrimaryAlias = v11.PrimaryAlias
			TextChatCommand.Enabled = true
			TextChatCommand.AutocompleteVisible = false
			if v11.OnExecute then
				TextChatCommand.Triggered:Connect(function(p1, p2) --[[ Line: 367 | Upvalues: Players (ref), v3 (ref), v11 (copy), v7 (ref) ]]
					local UserId = p1.UserId
					local v1
					if UserId then
						local v2 = Players:GetPlayerByUserId(UserId)
						v1 = if v2 then v3.getWrapperFromPlayer(v2) else nil
					else
						v1 = nil
					end
					if not v1 then
						return
					end
					local v4 = v11
					if not (if v4.CanExecute and not v4.CanExecute(v1) then false elseif v7.CanRunCommand(v1.Player, v4) then true else false) then
						return
					end
					local v6, v72 = pcall(v11.OnExecute, p2, v1)
					if v6 then
						return
					end
					warn("\226\154\160\239\184\143 ChatCommandsService, Error executing command:", v11.PrimaryAlias, v72)
				end)
			end
			TextChatCommand.Parent = CustomCommands
			continue
		end
		local v12 = CustomCommands:WaitForChild(v102)
		if v11.AutocompleteVisible == nil then
			local v13 = v3.GetClient()
			v92 = if v11.CanExecute and not v11.CanExecute(v13) then false elseif v7.CanRunCommand(v13.Player, v11) then true else false
			v12.AutocompleteVisible = v92
		else
			v12.AutocompleteVisible = type(v11.AutocompleteVisible) == "function" and v11.AutocompleteVisible(v3.GetClient()) or v11.AutocompleteVisible
		end
		if v11.OnClientExecute then
			v12.Triggered:Connect(function(p1, p2) --[[ Line: 395 | Upvalues: v3 (ref), v11 (copy), v7 (ref) ]]
				local v1 = v3.GetClient()
				if not v1 then
					return
				end
				local v2 = v11
				if not (if v2.CanExecute and not v2.CanExecute(v1) then false elseif v7.CanRunCommand(v1.Player, v2) then true else false) then
					return
				end
				local v4, v5 = pcall(v11.OnClientExecute, p2, v1)
				if v4 then
					return
				end
				warn("\226\154\160\239\184\143 ChatCommandsService, Error executing client command:", v11.PrimaryAlias, v5)
			end)
		end
	end
end
t:Init()
return t