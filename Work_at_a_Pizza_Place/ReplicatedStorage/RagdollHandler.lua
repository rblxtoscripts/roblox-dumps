-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local t = {
	[Enum.HumanoidStateType.Dead] = true,
	[Enum.HumanoidStateType.Physics] = true
}
local t2 = {}
function setRagdollEnabled(p1, p2) --[[ setRagdollEnabled | Line: 19 ]]
	local RagdollConstraints = p1.Parent:FindFirstChild("RagdollConstraints")
	if not RagdollConstraints then
		return
	end
	for k, v in pairs(RagdollConstraints:GetChildren()) do
		if v:IsA("Constraint") then
			local RigidJoint = v.RigidJoint.Value
			local v1 = if p2 or v.Attachment1 == nil then nil else v.Attachment1.Parent or nil
			if RigidJoint and RigidJoint.Part1 ~= v1 then
				RigidJoint.Part1 = v1
			end
		end
	end
end
function hasRagdollOwnership(p1) --[[ hasRagdollOwnership | Line: 35 | Upvalues: RunService (copy), Players (copy) ]]
	if RunService:IsServer() then
		return true
	end
	local isLocalPlayer = Players:GetPlayerFromCharacter(p1.Parent) == Players.LocalPlayer
	return isLocalPlayer
end
function ragdollAdded(p1) --[[ ragdollAdded | Line: 47 | Upvalues: t2 (copy), t (copy) ]]
	t2[p1] = p1.StateChanged:Connect(function(p12, p2) --[[ Line: 48 | Upvalues: p1 (copy), t (ref) ]]
		if not hasRagdollOwnership(p1) then
			return
		end
		if t[p2] then
			if p1.Parent:FindFirstChild("Bike") then
				p1.BreakJointsOnDeath = true
				p1.Health = 0
				p1.Parent:BreakJoints()
			else
				setRagdollEnabled(p1, true)
			end
		else
			setRagdollEnabled(p1, false)
		end
	end)
end
function ragdollRemoved(p1) --[[ ragdollRemoved | Line: 65 | Upvalues: t2 (copy) ]]
	t2[p1]:Disconnect()
	t2[p1] = nil
end
CollectionService:GetInstanceAddedSignal("Ragdoll"):Connect(ragdollAdded)
CollectionService:GetInstanceRemovedSignal("Ragdoll"):Connect(ragdollRemoved)
for k, v in pairs(CollectionService:GetTagged("Ragdoll")) do
	ragdollAdded(v)
end
return nil