-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("BanService")
return function(p1, p2, p3) --[[ Line: 9 | Upvalues: RunService (copy), v1 (copy) ]]
	if RunService:IsStudio() then
		return "Banning in studio isn\'t allowed. Join a public server"
	end
	if game.PrivateServerId ~= "" then
		return "Banning by username doesn\'t work in private servers, try joining a public server"
	end
	local v12, v2 = pcall(v1.Ban, tostring(p2), true, false, p3, false)
	if v12 then
		return ("Banned userId (%*)"):format(p2)
	end
	if string.find(v2, "429") then
		return ("Failed to ban userId (%*); you\'re being rate-limited, try again later"):format(p2)
	else
		return ("Failed to ban userId (%*); something went wrong"):format(p2)
	end
end