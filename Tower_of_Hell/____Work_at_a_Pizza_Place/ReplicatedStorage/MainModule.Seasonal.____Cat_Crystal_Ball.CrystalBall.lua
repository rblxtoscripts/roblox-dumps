-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = Random.new()
local v3 = script:WaitForChild("ObjectPointer").Value
workspace.Main.Chatted.Chatted.Event:connect(function(p1) --[[ Line: 5 | Upvalues: v1 (copy), v3 (copy), v2 (copy) ]]
	if string.sub(p1, -1, -1) ~= "?" or not v1:ProxyCheck(game.Players.LocalPlayer, v3.BallExterior.Position, 10) then
		return
	end
	local v12 = v2:NextInteger(1, 3)
	local Chat = game:GetService("Chat")
	Chat:Chat(v3.BallExterior, if v12 == 1 then "Yes definitely" elseif v12 == 2 then "Don\'t count on it" elseif v12 == 3 then "Reply hazy, try again" else false)
end)