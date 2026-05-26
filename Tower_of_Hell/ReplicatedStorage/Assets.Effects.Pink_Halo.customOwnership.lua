-- https://lua.expert/
local admins = require(game.ServerScriptService.Modules.admins)
return function(p1, p2) --[[ Line: 2 | Upvalues: admins (copy) ]]
	return admins.admins[p1.UserId] or game:GetService("BadgeService"):UserHasBadgeAsync(p1.UserId, 2124512012)
end