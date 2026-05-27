-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("BanService")
return function(p1, p2) --[[ Line: 11 | Upvalues: v1 (copy) ]]
	local count = 0
	if v1.Unban(p2) then
		count = count + 1
	end
	return ("Unbanned %d players."):format(count)
end