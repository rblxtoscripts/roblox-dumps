-- https://lua.expert/
local TextChatService = game:GetService("TextChatService")
local colorFromId = require(game.ReplicatedStorage.Library.Utility.colorFromId)
local ChatWindowConfiguration = TextChatService.ChatWindowConfiguration
function TextChatService.OnChatWindowAdded(p1) --[[ Line: 22 | Upvalues: ChatWindowConfiguration (copy), colorFromId (copy) ]]
	local v1 = ChatWindowConfiguration:DeriveNewMessageProperties()
	if p1.TextSource then
		v1.PrefixTextProperties = ChatWindowConfiguration:DeriveNewMessageProperties()
		v1.PrefixTextProperties.TextColor3 = colorFromId(p1.TextSource.UserId)
		v1.PrefixText = "[" .. p1.PrefixText:sub(0, #p1.PrefixText - 1) .. "]:"
	end
	return v1
end