-- https://lua.expert/
return function() --[[ Line: 1 ]]
	local v1 = script.ImageLabel:Clone()
	v1.BackgroundColor3 = script.Parent.Handle.Color
	return { v1 }
end