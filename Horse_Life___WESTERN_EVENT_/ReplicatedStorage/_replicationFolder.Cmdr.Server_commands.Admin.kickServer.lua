-- https://lua.expert/
return function(p1, p2) --[[ Line: 1 ]]
	for k, v in pairs(p2) do
		v:Kick("Kicked by admin.")
	end
	return ("Kicked %d players."):format(#p2)
end