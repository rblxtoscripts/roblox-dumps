-- https://lua.expert/
return function() --[[ Line: 1 ]]
	local v1 = script.ImageLabel:Clone()
	local v2 = script.ImageLabel:Clone()
	v2.ZIndex = v1.ZIndex + 1
	v1.Image = "rbxassetid://4509719321"
	v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
	v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
	v1.ImageTransparency = 0.25
	v2.Image = "rbxassetid://4507869874"
	return { v1, v2 }
end