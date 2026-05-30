-- https://lua.expert/
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Modules.PlayerData.ClientState)
function toInteger(p1) --[[ toInteger | Line: 7 ]]
	local v2 = math.floor(p1.r * 255) * 65536
	local v4 = v2 + math.floor(p1.g * 255) * 256
	return v4 + math.floor(p1.b * 255)
end
function toHex(p1) --[[ toHex | Line: 11 ]]
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
function TextChatService.OnIncomingMessage(p1) --[[ Line: 35 | Upvalues: Players (copy), ReplicatedStorage (copy) ]]
	local TextChatMessageProperties = Instance.new("TextChatMessageProperties")
	if p1.TextSource then
		local v1 = Players:GetPlayerByUserId(p1.TextSource.UserId)
		local v2 = ""
		if v1.UserId == 116298455 then
			v2 = v2 .. "<font color=\'rgb(255,208,37)\'>[GLORIOUS KING]</font>  "
		elseif v1.UserId == 996945439 then
			v2 = v2 .. "<font color=\'rgb(75,207,255)\'>[250 MGT]</font>  "
		end
		if ReplicatedStorage.Remotes.Misc.HasPass:InvokeServer(v1, "VIP") then
			v2 = v2 .. "<font color=\'rgb(255,255,0)\'>[VIP]</font>  "
		end
		local v3 = v1:GetRankInGroup(33298472)
		if v3 == 20 then
			v2 = v2 .. "<font color=\'rgb(66,179,255)\'>[TESTER]</font>  "
		elseif v3 == 56 then
			v2 = v2 .. "<font color=\'rgb(218,70,255)\'>[CONTRIBUTOR]</font>  "
		elseif v3 == 15 then
			v2 = v2 .. "<font color=\'rgb(200,13,16)\'>[CONTENT CREATOR]</font>  "
		elseif v3 == 255 then
			v2 = v2 .. "<font color=\'rgb(255,10,14)\'>[BIGBOSS]</font>  "
		elseif v3 == 254 or v3 == 66 then
			v2 = v2 .. "<font color=\'rgb(255,10,14)\'>[DEVELOPER]</font>  "
		elseif v3 == 55 or v1.UserId == 607249713 then
			v2 = v2 .. "<font color=\'rgb(53,201,255)\'>[MANAGER]</font>  "
		elseif v3 == 30 then
			v2 = v2 .. "<font color=\'rgb(53,201,255)\'>[MOD]</font>  "
		elseif v3 == 1 then
			v2 = v2 .. "<font color=\'rgb(239,180,255)\'>[MEMBER]</font>  "
		end
		if v1:FindFirstChild("LeaderboardTag") then
			local TagName = v1.LeaderboardTag.TagName.Value
			local v4 = ""
			if TagName == "Playtime" then
				v4 = "\226\140\155"
			elseif TagName == "Wins" then
				v4 = "\240\159\143\134"
			end
			v2 = v2 .. string.format("%s<font color=\'rgb(255,255,255)\'>%s</font>  ", v4, "[#" .. v1.LeaderboardTag.Place.Value .. "]")
		end
		TextChatMessageProperties.PrefixText = v2 .. p1.PrefixText
		TextChatMessageProperties.Text = p1.Text
	end
	return TextChatMessageProperties
end
local RBXSystem = TextChatService.TextChannels.RBXSystem
function toHex1(p1) --[[ toHex1 | Line: 100 ]]
	return string.format("#%02X%02X%02X", math.floor(p1.R * 255 + 0.5), math.floor(p1.G * 255 + 0.5), (math.floor(p1.B * 255 + 0.5)))
end
ReplicatedStorage.Remotes.Misc.ChatMessage.OnClientEvent:Connect(function(p1, p2) --[[ Line: 107 | Upvalues: RBXSystem (copy) ]]
	if p2 then
		RBXSystem:DisplaySystemMessage(string.format("<font color=\'%s\'>[System]: %s</font>", toHex1(p2), p1))
	else
		RBXSystem:DisplaySystemMessage("<font color=\'rgb(255,23,27)\'><b>[System]: </b></font>" .. string.format("<font color=\'rgb(255,23,27)\'><b>%s</b></font>", p1))
	end
end)
while task.wait(1200) do
	RBXSystem:DisplaySystemMessage("<font color=\'rgb(255,23,27)\'><b>[System]: </b></font><font color=\'rgb(255,23,27)\'><b>Be Sure To Like & Favorite The Game!</b></font>")
end