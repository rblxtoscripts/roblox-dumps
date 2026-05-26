-- https://lua.expert/
local TypedPromise = require(game.ReplicatedStorage.Library.Modules.TypedPromise)
local RetrieveCommands = game.ReplicatedStorage.Remotes.Chat.RetrieveCommands
local FireChatCommand = game.ReplicatedStorage.Remotes.Chat.FireChatCommand
local v1 = if game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService and game.TextChatService.CreateDefaultCommands then game.TextChatService:WaitForChild("TextChatCommands") else nil
local RBXGeneral = game.TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
local LocalCommands = Instance.new("Folder")
LocalCommands.Name = "LocalCommands"
LocalCommands.Parent = game.TextChatService
local t = {
	["&amp;"] = "&"
}
local function PromiseCommandList() --[[ PromiseCommandList | Line: 41 | Upvalues: TypedPromise (copy), RetrieveCommands (copy) ]]
	return TypedPromise.new(function(p1, p2) --[[ Line: 42 | Upvalues: RetrieveCommands (ref) ]]
		local v1, v2 = pcall(function() --[[ Line: 43 | Upvalues: RetrieveCommands (ref) ]]
			return table.pack(RetrieveCommands:InvokeServer())
		end)
		if v1 then
			p1(table.unpack(v2))
		else
			p2(v2)
		end
	end)
end
local function DecodeHTMLMarkup(p1) --[[ DecodeHTMLMarkup | Line: 56 | Upvalues: t (copy) ]]
	for k, v in pairs(t) do
		p1 = p1:gsub(k, v)
	end
	return p1
end
TypedPromise.retry(PromiseCommandList, 5):andThen(function(p1, p2) --[[ Line: 65 | Upvalues: FireChatCommand (copy), t (copy), LocalCommands (ref), RBXGeneral (copy) ]]
	for k, v in pairs(p1) do
		local TextChatCommand = Instance.new("TextChatCommand")
		TextChatCommand.Name = k
		TextChatCommand.PrimaryAlias = p2 .. k
		TextChatCommand.AutocompleteVisible = v
		TextChatCommand.Triggered:Connect(function(p1, p22) --[[ Line: 73 | Upvalues: FireChatCommand (ref), k (copy), p2 (copy), t (ref) ]]
			local v3 = p22:sub(#k + #p2 + 2)
			for k2, v in pairs(t) do
				v3 = v3:gsub(k2, v)
			end
			FireChatCommand:FireServer(k, v3)
		end)
		TextChatCommand.Parent = LocalCommands
	end
	function RBXGeneral.OnIncomingMessage(p1) --[[ Line: 80 | Upvalues: p2 (copy), RBXGeneral (ref) ]]
		if p1.Text:sub(0, #p2) ~= p2 then
			return
		end
		p1.Text = ""
		RBXGeneral:DisplaySystemMessage("<font color=\"rgb(255, 0, 0)\">Missing Permissions</font>")
	end
end)
if v1 then
	for k, v in pairs(v1:GetChildren()) do
		v.AutocompleteVisible = false
		if v.Name == "RBXTeamCommand" then
			v.Enabled = false
		end
	end
end
local v2
if game:IsLoaded() then
	task.wait(3)
	v2 = Instance.new("TextChatCommand")
	v2.AutocompleteVisible = false
	v2.PrimaryAlias = "//"
	v2.Parent = game.TextChatService
	task.defer(v2.Destroy, v2)
	return
end
game.Loaded:Wait()
task.wait(3)
v2 = Instance.new("TextChatCommand")
v2.AutocompleteVisible = false
v2.PrimaryAlias = "//"
v2.Parent = game.TextChatService
task.defer(v2.Destroy, v2)