-- https://lua.expert/
return {
	updatePositionToSmallestDistOnCircle = function(p1, p2, p3) --[[ updatePositionToSmallestDistOnCircle | Line: 9 ]]
		assert(if p2 >= 0 then if p2 <= p3 then true else false else false, "Target must be between 0 and circumference")
		if math.abs(p1 - p2) <= math.pi then
			return p1
		end
		local v2 = p1 % p3
		local v3 = math.abs(p2 - v2)
		local v4 = math.abs(p2 - v2 + p3)
		local v5 = math.abs(p2 - v2 - p3)
		if v3 < v4 and v3 < v5 then
			return v2
		end
		if v4 < v5 then
			return v2 - p3
		else
			return v2 + p3
		end
	end
}