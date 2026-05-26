-- https://lua.expert/
local admins = require(game.ServerScriptService.Modules.admins)
return function(p1, p2) --[[ Line: 2 | Upvalues: admins (copy) ]]
	if admins.admins[p1.UserId] then
		return true
	end
	for k, v in pairs({ 2124505884, 2124505885, 2124505886, 2124505887, 2124512012, 2124530161, 2124530162, 1118891334474135 }) do
		local v1, v2 = pcall(function() --[[ Line: 5 | Upvalues: p1 (copy), v (copy) ]]
			return game:GetService("BadgeService"):UserHasBadgeAsync(p1.UserId, v)
		end)
		if not (v1 and v2) then
			return false
		end
	end
	return true
end