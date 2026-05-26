-- https://lua.expert/
local v1 = script.Parent
local Humanoid = v1.Humanoid
function Ragdoll(p1, p2) --[[ Ragdoll | Line: 19 | Upvalues: Humanoid (copy), v1 (copy) ]]
	local v12 = if Humanoid:GetState() == Enum.HumanoidStateType.Physics then false else true
	Humanoid:ChangeState((p1 or Humanoid.Health == 0) and Enum.HumanoidStateType.Physics or Enum.HumanoidStateType.GettingUp)
	v1.Animate.Disabled = v12
	if not v12 then
		return
	end
	for k, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
		v:Stop(0)
	end
	if not p2 then
		return
	end
	v1.HumanoidRootPart.Velocity = p2 * 20
end
game.ReplicatedStorage.RagdollEnabled.OnClientEvent:Connect(Ragdoll)
game.ReplicatedStorage.RagdollEnabled.RagdollEnabled.Event:Connect(Ragdoll)