-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script:WaitForChild("ObjectPointer").Value
local Owner = script:WaitForChild("HousePointer").Value.Owner.Value
_G.LikedHouse = _G.LikedHouse or {}
local function ChangeColor() --[[ ChangeColor | Line: 11 | Upvalues: v2 (copy), Owner (copy) ]]
	v2.Button.MobileTouchDetector.Value = false
	_G.LikedHouse[Owner] = true
	v2.Button.SG.LightInfluence = 1
	v2.Button.Color = Color3.fromRGB(248, 248, 248)
	v2.Button.SG.ImageLabel.ImageColor3 = Color3.fromRGB(9, 137, 207)
end
workspace.Main.LikeButtonPressed.OnClientEvent:connect(function() --[[ Line: 19 | Upvalues: ChangeColor (copy) ]]
	ChangeColor()
end)
if not (_G.LikedHouse[Owner] or v1:SendData("HasLikedHouse", "PlayerChannel", 10, Owner)) then
	return
end
ChangeColor()