-- https://lua.expert/
return {
	GetEquippedTowers = function(p1) --[[ GetEquippedTowers | Line: 5 ]]
		if not p1 then
			return {}
		end
		local t = {}
		for v1, v2 in p1.Towers do
			if v2.Equipped then
				table.insert(t, v2)
			end
		end
		return t
	end,
	GetEquipped = function(p1) --[[ GetEquipped | Line: 18 ]]
		if not p1 then
			return 0
		end
		local count = 0
		for v1, v2 in p1.Towers do
			if v2.Equipped then
				count = count + 1
			end
		end
		return count
	end,
	GetMaxEquipped = function(p1) --[[ GetMaxEquipped | Line: 31 ]]
		return 6
	end,
	GetStorage = function(p1) --[[ GetStorage | Line: 35 ]]
		if not p1 then
			return 0
		end
		local count = 0
		for k, v in pairs(p1.Towers) do
			count = count + 1
		end
		return count
	end,
	GetMaxStorage = function() --[[ GetMaxStorage | Line: 47 ]]
		if game.PlaceId == 17770150441 then
			return 99999
		else
			return 2000
		end
	end
}