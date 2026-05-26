-- https://lua.expert/
local admins = require(game.ServerScriptService.Modules.admins)
return function(p1, p2) --[[ Line: 2 | Upvalues: admins (copy) ]]
	return admins.admins[p1.UserId] or (admins.mods[p1.UserId] or game:GetService("MarketplaceService"):PlayerOwnsAsset(p1, 12586954912))
end