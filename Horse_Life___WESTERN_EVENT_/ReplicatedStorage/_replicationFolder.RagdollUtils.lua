-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local v1 = Sonar("Maid")
local v2 = Sonar("promiseChild")
local v3 = Sonar("RagdollRigging")
local v4 = Sonar("CharacterUtils")
local t = {}
local function f5() --[[ Line: 16 ]] end
function t.setupState(p1) --[[ setupState | Line: 18 | Upvalues: v1 (copy), v4 (copy), Players (copy) ]]
	local v12 = v1.new()
	local function updateState() --[[ updateState | Line: 21 | Upvalues: p1 (copy) ]]
		if p1:GetState() == Enum.HumanoidStateType.Dead then
			return
		end
		p1:ChangeState(Enum.HumanoidStateType.Physics)
	end
	local function teleportRootPartToUpperTorso() --[[ teleportRootPartToUpperTorso | Line: 30 | Upvalues: v4 (ref), p1 (copy), Players (ref) ]]
		if v4.getPlayerFromCharacter(p1) ~= Players.LocalPlayer then
			return
		end
		local RootPart = p1.RootPart
		if not RootPart then
			return
		end
		local v1 = p1.Parent
		if not v1 then
			return
		end
		local UpperTorso = v1:FindFirstChild("UpperTorso")
		if UpperTorso then
			RootPart.CFrame = UpperTorso.CFrame
		end
	end
	v12:GiveTask(function() --[[ Line: 55 | Upvalues: v12 (copy), v4 (ref), p1 (copy), Players (ref) ]]
		v12:DoCleaning()
		if v4.getPlayerFromCharacter(p1) ~= Players.LocalPlayer then
			p1:ChangeState(Enum.HumanoidStateType.GettingUp)
			return
		end
		local RootPart = p1.RootPart
		if not RootPart then
			p1:ChangeState(Enum.HumanoidStateType.GettingUp)
			return
		end
		local v1 = p1.Parent
		if not v1 then
			p1:ChangeState(Enum.HumanoidStateType.GettingUp)
			return
		end
		local UpperTorso = v1:FindFirstChild("UpperTorso")
		if not UpperTorso then
			p1:ChangeState(Enum.HumanoidStateType.GettingUp)
			return
		end
		RootPart.CFrame = UpperTorso.CFrame
		p1:ChangeState(Enum.HumanoidStateType.GettingUp)
	end)
	v12:GiveTask(p1.StateChanged:Connect(updateState))
	if p1:GetState() == Enum.HumanoidStateType.Dead then
		return v12
	end
	p1:ChangeState(Enum.HumanoidStateType.Physics)
	return v12
end
function t.preventAnimationTransformLoop(p1) --[[ preventAnimationTransformLoop | Line: 68 | Upvalues: v1 (copy), v2 (copy), RunService (copy) ]]
	local v12 = v1.new()
	if p1.Parent then
		v12:GivePromise(v2(p1.Parent, "LowerTorso")):Then(function(p1) --[[ Line: 78 | Upvalues: v2 (ref) ]]
			return v2(p1, "Root")
		end):Then(function(p1) --[[ Line: 81 | Upvalues: v12 (copy), RunService (ref) ]]
			local Transform = p1.Transform
			v12:GiveTask(RunService.Stepped:Connect(function() --[[ Line: 86 | Upvalues: p1 (copy), Transform (copy) ]]
				p1.Transform = Transform
			end))
		end)
	else
		warn("[RagdollUtils.preventAnimationTransformLoop] - No character")
	end
	return v12
end
function t.setupMotors(p1) --[[ setupMotors | Line: 94 | Upvalues: v3 (copy) ]]
	local v2 = v3.disableMotors(p1.Parent, p1.RigType)
	local v32 = p1:FindFirstChildWhichIsA("Animator")
	if v32 then
		v32:ApplyJointVelocities(v2)
	end
	return function() --[[ Line: 131 | Upvalues: v2 (copy) ]]
		for k, v in pairs(v2) do
			v.Enabled = true
		end
	end
end
function t.setupHead(p1) --[[ setupHead | Line: 138 | Upvalues: f5 (copy), v1 (copy), v2 (copy) ]]
	local v12 = p1.Parent
	if not v12 then
		return f5
	end
	local Head = v12:FindFirstChild("Head")
	if not Head then
		return f5
	end
	if Head:IsA("MeshPart") then
		return f5
	end
	local OriginalSize = Head:FindFirstChild("OriginalSize")
	if not OriginalSize then
		return f5
	end
	local v22 = Head:FindFirstChildWhichIsA("SpecialMesh")
	if not v22 then
		return f5
	end
	if v22.MeshType == Enum.MeshType.Head then
		local v3 = v1.new()
		v3:GivePromise(v2(p1, "HeadScale")):Then(function(p1) --[[ Line: 171 | Upvalues: Head (copy), v3 (copy), OriginalSize (copy) ]]
			local function updateHeadSize() --[[ updateHeadSize | Line: 172 | Upvalues: Head (ref), p1 (copy) ]]
				Head.Size = Vector3.new(1, 1, 1) * p1.Value
			end
			v3:GiveTask(p1.Changed:Connect(updateHeadSize))
			Head.Size = Vector3.new(1, 1, 1) * p1.Value
			v3:GiveTask(function() --[[ Line: 179 | Upvalues: Head (ref), OriginalSize (ref), p1 (copy) ]]
				Head.Size = OriginalSize.Value * p1.Value
			end)
		end)
		return v3
	else
		return f5
	end
end
return t