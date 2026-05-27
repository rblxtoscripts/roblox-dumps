-- https://lua.expert/
return function(p1) --[[ Line: 1 ]]
	warn(p1)
	return {
		Destroy = function() --[[ Destroy | Line: 5 ]]
			return nil
		end
	}
end