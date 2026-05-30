-- https://lua.expert/
return function(p1, p2, p3, p4) --[[ Line: 3 ]]
	if not (p1 and p2) then
		return
	end
	if p3 and p4 then
		sum = p2
		sum_2 = 1
		while sum <= p1 do
			sum = sum + p2
			sum_2 = sum_2 + p4
		end
		return sum_2
	else
		local sum = p2
		while sum <= p1 do
			sum = sum + p2
		end
		return sum
	end
end