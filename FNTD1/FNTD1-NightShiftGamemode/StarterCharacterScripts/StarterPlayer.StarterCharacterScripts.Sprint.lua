-- https://lua.expert/
local LocalPlayer = game:GetService("Players").LocalPlayer
local Humanoid = workspace:WaitForChild(LocalPlayer.Name):WaitForChild("Humanoid")
local v1 = game.StarterPlayer.CharacterWalkSpeed * 1.75
local CharacterWalkSpeed = game.StarterPlayer.CharacterWalkSpeed
local v2 = nil
local v3 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v4 = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, v3, {
	FieldOfView = 80
})
local v5 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local v6 = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, v5, {
	FieldOfView = 70
})
function Handler(p1, p2) --[[ Handler | Line: 18 | Upvalues: v2 (ref), Humanoid (copy), v1 (copy), v4 (copy), CharacterWalkSpeed (copy), v6 (copy) ]]
	if p2 == Enum.UserInputState.Begin and p1 == "RunBind" then
		v2 = true
		Humanoid.WalkSpeed = v1
		v4:Play()
		return
	end
	if p2 ~= Enum.UserInputState.End or p1 ~= "RunBind" then
		if p2 == Enum.UserInputState.Begin and p1 == "RunBind2" then
			v2 = true
			Humanoid.WalkSpeed = v1
			v4:Play()
			return
		end
		if p2 ~= Enum.UserInputState.End or p1 ~= "RunBind2" then
			return
		end
	end
	v2 = false
	Humanoid.WalkSpeed = CharacterWalkSpeed
	v6:Play()
end
Humanoid.Running:connect(function(p1) --[[ Line: 38 | Upvalues: v2 (ref), Humanoid (copy), v1 (copy), v4 (copy), CharacterWalkSpeed (copy), v6 (copy) ]]
	if p1 >= 10 and v2 then
		Humanoid.WalkSpeed = v1
		v4:Play()
		return
	end
	if (not (p1 >= 10) or v2) and not (p1 < 10) then
		return
	end
	Humanoid.WalkSpeed = CharacterWalkSpeed
	v6:Play()
end)
game:GetService("ContextActionService"):BindAction("RunBind", Handler, true, Enum.KeyCode.LeftShift)
game:GetService("ContextActionService"):BindAction("RunBind2", Handler, true, Enum.KeyCode.ButtonL3)