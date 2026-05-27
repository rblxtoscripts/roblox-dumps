-- https://lua.expert/
return function(p1, p2) --[[ Line: 1 ]]
	for k, v in pairs(p2) do
		if v.Character then
			v:LoadCharacter()
		end
	end
	return ("Respawned %d players."):format(#p2)
end