-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local v1 = 0
local v2 = 0
script.Parent.Humanoid.StateChanged:connect(function(p1, p2) --[[ Line: 8 | Upvalues: v2 (ref), v1 (ref) ]]
	if p2 == Enum.HumanoidStateType.Freefall then
		v2 = script.multiJumpCount.Value
		return
	end
	if p2 ~= Enum.HumanoidStateType.Landed then
		return
	end
	v1 = 0
	v2 = 0
end)
script:WaitForChild("multiJumpCount").Changed:Connect(function() --[[ Line: 16 | Upvalues: LocalPlayer (copy), v2 (ref) ]]
	if script.Parent.Parent ~= LocalPlayer.Character then
		return
	end
	local v1 = script.Parent.Parent.Humanoid:GetState()
	if v1 ~= Enum.HumanoidStateType.Running and (v1 ~= Enum.HumanoidStateType.RunningNoPhysics and (v1 ~= Enum.HumanoidStateType.Climbing and v1 ~= Enum.HumanoidStateType.Landed)) then
		return
	end
	v2 = script.multiJumpCount.Value
end)
local v3 = false
UserInputService.JumpRequest:connect(function() --[[ Line: 26 | Upvalues: v3 (ref), v2 (ref), v1 (ref) ]]
	if not script:IsDescendantOf(workspace) then
		return
	end
	if v3 then
		return
	end
	v3 = true
	spawn(function() --[[ Line: 30 | Upvalues: v3 (ref) ]]
		wait(0.15)
		v3 = false
	end)
	local v12 = script.Parent
	if not (v12 and v12:FindFirstChild("Humanoid")) then
		return
	end
	if not (v1 < math.min(v2, script.multiJumpCount.Value)) then
		return
	end
	v1 = v1 + 1
	v12.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	require(script.spawnDoubleJumpParticleEffect)(v12)
end)
local v4 = 0
local function update() --[[ update | Line: 48 | Upvalues: v4 (ref) ]]
	script.multiJumpCount.Value = script.multiJumpCount.Value + game.ReplicatedStorage.GameValues.globalJumps.Value - v4
	v4 = game.ReplicatedStorage.GameValues.globalJumps.Value
end
script.multiJumpCount.Value = script.multiJumpCount.Value + game.ReplicatedStorage.GameValues.globalJumps.Value - v4
v4 = game.ReplicatedStorage.GameValues.globalJumps.Value
game.ReplicatedStorage.GameValues.globalJumps.Changed:Connect(update)