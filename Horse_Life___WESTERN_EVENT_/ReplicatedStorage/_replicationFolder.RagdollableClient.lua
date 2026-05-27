-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local Players = game:GetService("Players")
local v1 = Sonar("BaseObject")
local v2 = Sonar("CharacterUtils")
local v3 = Sonar("RagdollRigging")
local v4 = Sonar("Maid")
local v5 = Sonar("RagdollBindersClient")
local v6 = Sonar("RagdollUtils")
local v7 = setmetatable({}, v1)
v7.ClassName = "RagdollableClient"
v7.__index = v7
function v7.new(p1) --[[ new | Line: 20 | Upvalues: v1 (copy), v7 (copy), v2 (copy), Players (copy) ]]
	local v3 = setmetatable(v1.new(p1), v7)
	v3._player = v2.getPlayerFromCharacter(v3._obj)
	if v3._player == Players.LocalPlayer then
		v3._localPlayerRemoteEvent = p1:WaitForChild("RagdollRemoteEvent")
	end
	v3:_setupLocal()
	return v3
end
function v7._setupLocal(p1) --[[ _setupLocal | Line: 35 | Upvalues: v5 (copy) ]]
	p1._maid:GiveTask(v5.Ragdoll:ObserveInstance(p1._obj, function() --[[ Line: 36 | Upvalues: p1 (copy) ]]
		p1:_onRagdollChanged()
	end))
	p1:_onRagdollChanged()
end
function v7._onRagdollChanged(p1) --[[ _onRagdollChanged | Line: 42 | Upvalues: v5 (copy) ]]
	if v5.Ragdoll:Get(p1._obj) then
		p1._maid._ragdoll = p1:_ragdollLocal()
		if p1._localPlayerRemoteEvent then
			p1._localPlayerRemoteEvent:FireServer(true)
		end
	else
		p1._maid._ragdoll = nil
		if not p1._localPlayerRemoteEvent then
			return
		end
		p1._localPlayerRemoteEvent:FireServer(false)
	end
end
function v7._ragdollLocal(p1) --[[ _ragdollLocal | Line: 60 | Upvalues: v4 (copy), v3 (copy), v6 (copy) ]]
	local v1 = v4.new()
	v3.createRagdollJoints(p1._obj.Parent, p1._obj.RigType)
	v1:GiveTask(v6.setupState(p1._obj))
	v1:GiveTask(v6.setupMotors(p1._obj))
	v1:GiveTask(v6.setupHead(p1._obj))
	v1:GiveTask(p1._obj.AnimationPlayed:Connect(function(p1) --[[ Line: 73 ]]
		p1:Stop(0)
	end))
	v1:GiveTask(v6.preventAnimationTransformLoop(p1._obj))
	return v1
end
return v7