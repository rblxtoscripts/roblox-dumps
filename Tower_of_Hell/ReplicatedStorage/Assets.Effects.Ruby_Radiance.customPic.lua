-- https://lua.expert/
require(game.ReplicatedStorage.Library.Utility.colorFromId)(game.Players.LocalPlayer.UserId)
return function() --[[ Line: 4 ]]
	local v1 = script.ImageLabel:Clone()
	v1.BackgroundColor3 = script.Parent.Color.Keypoints[1].Value
	v1.ImageColor3 = script.Parent.Color.Keypoints[1].Value
	return { v1 }
end