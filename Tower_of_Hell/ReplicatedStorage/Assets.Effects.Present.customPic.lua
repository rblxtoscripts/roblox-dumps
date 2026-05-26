-- https://lua.expert/
return function() --[[ Line: 1 ]]
	local v1 = require(script.Parent.colors)(game.Players.LocalPlayer.UserId)
	local v2 = script.ImageLabel:Clone()
	local v3 = script.ImageLabel:Clone()
	local v4 = script.ImageLabel:Clone()
	v3.ZIndex = v2.ZIndex + 1
	v4.ZIndex = v2.ZIndex + 2
	v2.Image = "rbxassetid://8152213648"
	v2.ImageColor3 = v1.box
	v2.BackgroundColor3 = v1.box
	v3.Image = "rbxassetid://8152213447"
	v3.ImageColor3 = v1.lid
	v3.BackgroundColor3 = v1.lid
	v4.Image = "rbxassetid://8152213253"
	v4.ImageColor3 = v1.band
	v4.BackgroundColor3 = v1.band
	return { v2, v3, v4 }
end