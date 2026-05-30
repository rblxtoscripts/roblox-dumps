-- https://lua.expert/
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
function toInteger(p1) --[[ toInteger | Line: 6 ]]
	local v2 = math.floor(p1.r * 255) * 65536
	local v4 = v2 + math.floor(p1.g * 255) * 256
	return v4 + math.floor(p1.b * 255)
end
function toHex(p1) --[[ toHex | Line: 10 ]]
	local v2, v3, v4 = toInteger(p1), { "A", "B", "C", "D", "E", "F" }, ""
	while true do
		local v5 = v2 % 16
		local v6 = tostring(v5)
		if v5 >= 10 then
			v6 = v3[1 + v5 - 10]
		end
		local v7 = math.floor(v2 / 16)
		v4 = v4 .. v6
		if v7 <= 0 then
			break
		end
		v2 = v7
	end
	return "#" .. string.reverse(v4)
end
function TextChatService.OnIncomingMessage(p1) --[[ Line: 34 | Upvalues: Players (copy), ClientState (copy) ]]
	local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
	if p1.TextSource then
		local v1 = Players:GetPlayerByUserId(p1.TextSource.UserId)
		local v2 = ""
		ClientState.GetData()
		if v1.UserId == 116298455 then
			v2 = v2 .. "<font color=\'rgb(255,208,37)\'>[GLORIOUS KING]</font>  "
		end
		if game.ReplicatedStorage.Remotes.Misc.HasPass:InvokeServer(v1, "VIP") then
			v2 = v2 .. "<font color=\'rgb(255,255,0)\'>[VIP]</font>  "
		end
		if v1:GetRankInGroup(33298472) == 20 then
			v2 = v2 .. "<font color=\'rgb(66,179,255)\'>[TESTER]</font>  "
		elseif v1:GetRankInGroup(33298472) == 15 then
			v2 = v2 .. "<font color=\'rgb(200,13,16)\'>[CONTENT CREATOR]</font>  "
		elseif v1:GetRankInGroup(33298472) == 255 then
			v2 = v2 .. "<font color=\'rgb(255,10,14)\'>[OWNER]</font>  "
		elseif v1:GetRankInGroup(33298472) == 254 then
			v2 = v2 .. "<font color=\'rgb(255,10,14)\'>[DEVELOPER]</font>  "
		elseif v1:GetRankInGroup(33298472) == 55 then
			v2 = v2 .. "<font color=\'rgb(53,201,255)\'>[DC MANAGER]</font>  "
		end
		TextChatMessageProperties.PrefixText = v2 .. p1.PrefixText
		TextChatMessageProperties.Text = p1.Text
	end
	return TextChatMessageProperties
end
local Chat = game.ReplicatedStorage.Remotes.Misc.Chat
local RBXSystem = TextChatService.TextChannels.RBXSystem
function toHex1(p1) --[[ toHex1 | Line: 77 ]]
	return string.format("#%02X%02X%02X", math.floor(p1.R * 255 + 0.5), math.floor(p1.G * 255 + 0.5), (math.floor(p1.B * 255 + 0.5)))
end
Chat.OnClientEvent:Connect(function(p1, p2) --[[ Line: 84 | Upvalues: RBXSystem (copy) ]]
	if p2 then
		RBXSystem:DisplaySystemMessage(string.format("<font color=\'%s\'>[System]: %s</font>", toHex1(p2), p1))
	else
		RBXSystem:DisplaySystemMessage("<font color=\'rgb(255,23,27)\'><b>[System]: </b></font>" .. string.format("<font color=\'rgb(255,23,27)\'><b>%s</b></font>", p1))
	end
end)
while task.wait(1200) do
	RBXSystem:DisplaySystemMessage("<font color=\'rgb(255,23,27)\'><b>[System]: </b></font><font color=\'rgb(255,23,27)\'><b>Be Sure To Like & Favorite The Game!</b></font>")
end