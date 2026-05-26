-- https://lua.expert/
local admins = require(game.ServerScriptService.Modules.admins)
return function(p1, p2) --[[ Line: 2 | Upvalues: admins (copy) ]]
	local v1 = game.ReplicatedStorage.data:FindFirstChild(p1.UserId)
	return admins.admins[p1.UserId] or game:GetService("BadgeService"):UserHasBadgeAsync(p1.UserId, 2124518596) or v1.beat_ttoh.Value
end