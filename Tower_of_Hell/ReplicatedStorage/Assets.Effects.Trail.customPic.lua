-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function() --[[ Line: 4 | Upvalues: v1 (copy) ]]
	local v12 = script.ImageLabel:Clone()
	local v2 = script.ImageLabel:Clone()
	v2.ZIndex = v2.ZIndex + 1
	v12.Image = "rbxassetid://4507869909"
	v12.ImageColor3 = v1
	v12.BackgroundColor3 = v1
	v12.ImageTransparency = 0.25
	v2.Image = "rbxassetid://4507869874"
	v2.ImageColor3 = Color3.new(153/255, 153/255, 153/255)
	return { v12, v2 }
end