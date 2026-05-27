-- https://lua.expert/
return {
	new = function() --[[ new | Line: 8 ]]
		return {
			first = 0,
			last = -1,
			len = 0,
			push = function(p1, p2) --[[ push | Line: 15 ]]
				p1.last = p1.last + 1
				p1[p1.last] = p2
				p1.len = p1.len + 1
			end,
			pop = function(p1) --[[ pop | Line: 21 ]]
				local first = p1.first
				if p1.last < first then
				else
					local v1 = p1[first]
					p1[first] = nil
					p1.first = p1.first + 1
					p1.len = p1.len - 1
					return v1
				end
			end
		}
	end
}