-- https://lua.expert/
return {
	makeStateless = function(p1) --[[ makeStateless | Line: 3 ]]
		p1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		local v1 = Enum.HumanoidStateType:GetEnumItems()
		for i = 1, #v1 do
			if v1[i].Name ~= "None" then
				p1:SetStateEnabled(v1[i], false)
			end
		end
	end
}