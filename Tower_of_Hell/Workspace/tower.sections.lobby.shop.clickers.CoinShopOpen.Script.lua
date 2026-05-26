-- https://lua.expert/
script.Parent:WaitForChild("ClickDetector").MouseClick:Connect(function() --[[ Line: 1 ]]
	game.Players.LocalPlayer.PlayerGui.shop_mutators.open.Value = false
	game.Players.LocalPlayer.PlayerGui.shop_gears.open.Value = false
	game.Players.LocalPlayer.PlayerGui.shop_coins.open.Value = true
	local CameraMinZoomDistance = game.Players.LocalPlayer.CameraMinZoomDistance
	game.Players.LocalPlayer.CameraMinZoomDistance = 2
	game.Players.LocalPlayer.CameraMinZoomDistance = CameraMinZoomDistance
end)