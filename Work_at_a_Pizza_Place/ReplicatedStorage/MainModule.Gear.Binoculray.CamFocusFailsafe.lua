-- https://lua.expert/
wait()
script.Tool.Value.Changed:connect(function(p1) --[[ Line: 5 ]]
	if p1 ~= "Parent" or script.Tool.Value.Parent ~= game.Workspace then
		return
	end
	game.Workspace.CurrentCamera.CameraType = 5
	game.Workspace.CurrentCamera.CameraSubject = script.Target.Value
end)
script.Tool.Value.Unequipped:connect(function() --[[ Line: 15 ]]
	wait(0.5)
	script:remove()
end)
print("PaperPlaneGear :: CamFocusFailsafe loaded")