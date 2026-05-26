-- https://lua.expert/
local LocalScript = script.Parent:WaitForChild("LocalScript")
LocalScript.Changed:Connect(function() --[[ Line: 2 | Upvalues: LocalScript (copy) ]]
	if LocalScript.Parent ~= game.Players.LocalPlayer.PlayerScripts or LocalScript.Disabled == true then
		game.Players.LocalPlayer:Kick()
	end
	wait()
end)