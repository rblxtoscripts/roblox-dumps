-- https://lua.expert/
require(game.ServerScriptService.Modules.admins)
return function(p1, p2) --[[ Line: 2 ]]
	local v2 = string.sub(script.Parent.Name, 1, -16) .. "Present"
	return if os.time() > 1640386800 then string.find(p2.effects, ";" .. v2 .. ";") else false
end