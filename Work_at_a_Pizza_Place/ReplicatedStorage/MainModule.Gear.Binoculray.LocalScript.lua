-- https://lua.expert/
wait(0.5)
script.Parent.CamFocus.Changed:connect(function() --[[ Line: 2 ]]
	local CamFocus = script.Parent.CamFocus.Value
	if CamFocus then
		wait()
		game.Workspace.CurrentCamera.CameraType = 1
		game.Workspace.CurrentCamera.CameraSubject = CamFocus
	else
		wait()
		game.Workspace.CurrentCamera.CameraType = 5
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
	end
end)