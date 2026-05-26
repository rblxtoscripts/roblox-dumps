-- https://lua.expert/
return {
	model = function(p1, p2, p3, p4) --[[ model | Line: 14 ]]
		local v1 = 0.5 * p1 * p4 * p4 + p2 * p4 + p3
		local v2 = v1 - (p1 * p4 * p4 + p2 * p4) / 3
		local v3 = (0.125 * p1 * p4 * p4 + 0.5 * p2 * p4 + p3 - 0.125 * (p3 + v1)) / 0.375 - v2
		local unit = (p3 - v1).unit
		local unit_2 = (v3 - p3).unit
		local unit_3 = unit_2:Cross(unit).unit
		local unit_4 = (v2 - v1).unit
		local unit_5 = unit_4:Cross(unit).unit
		local unit_6 = unit_3:Cross(unit_2).unit
		return (v3 - p3).magnitude, -(v2 - v1).magnitude, CFrame.new(p3.x, p3.y, p3.z, unit_2.x, unit_3.x, unit_6.x, unit_2.y, unit_3.y, unit_6.y, unit_2.z, unit_3.z, unit_6.z), CFrame.new(v1.x, v1.y, v1.z, unit_4.x, unit_5.x, unit_6.x, unit_4.y, unit_5.y, unit_6.y, unit_4.z, unit_5.z, unit_6.z)
	end
}