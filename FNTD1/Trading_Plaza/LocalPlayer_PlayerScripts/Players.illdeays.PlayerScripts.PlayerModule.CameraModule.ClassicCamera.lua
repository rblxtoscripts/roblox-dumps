-- https://lua.expert/
Vector2.new(0, 0)
local v1 = 0
local v2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local UserFixCameraFPError = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserFixCameraFPError")
local Players = game:GetService("Players")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local v3 = setmetatable({}, BaseCamera)
v3.__index = v3
function v3.new() --[[ new | Line: 39 | Upvalues: BaseCamera (copy), v3 (copy), CameraUtils (copy) ]]
	local v32 = setmetatable(BaseCamera.new(), v3)
	v32.isFollowCamera = false
	v32.isCameraToggle = false
	v32.lastUpdate = tick()
	v32.cameraToggleSpring = CameraUtils.Spring.new(5, 0)
	return v32
end
function v3.GetCameraToggleOffset(p1, p2) --[[ GetCameraToggleOffset | Line: 50 | Upvalues: CameraInput (copy), CameraUtils (copy) ]]
	if not p1.isCameraToggle then
		return Vector3.new()
	end
	local currentSubjectDistance = p1.currentSubjectDistance
	if CameraInput.getTogglePan() then
		p1.cameraToggleSpring.goal = math.clamp(CameraUtils.map(currentSubjectDistance, 0.5, p1.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1)
	else
		p1.cameraToggleSpring.goal = 0
	end
	local v3 = math.clamp(CameraUtils.map(currentSubjectDistance, 0.5, 64, 0, 1), 0, 1) + 1
	return Vector3.new(0, p1.cameraToggleSpring:step(p2) * v3, 0)
end
function v3.SetCameraMovementMode(p1, p2) --[[ SetCameraMovementMode | Line: 68 | Upvalues: BaseCamera (copy) ]]
	BaseCamera.SetCameraMovementMode(p1, p2)
	p1.isFollowCamera = p2 == Enum.ComputerCameraMovementMode.Follow
	p1.isCameraToggle = p2 == Enum.ComputerCameraMovementMode.CameraToggle
end
function v3.Update(p1, p2) --[[ Update | Line: 75 | Upvalues: v2 (copy), Players (copy), CameraInput (copy), v1 (ref), CameraUtils (copy), UserFixCameraFPError (copy) ]]
	local v12 = tick()
	local CurrentCamera = workspace.CurrentCamera
	local v22 = CurrentCamera.CFrame
	local Focus = CurrentCamera.Focus
	local v3
	if p1.resetCameraAngle then
		local v4 = p1:GetHumanoidRootPart()
		v3 = if v4 then (v4.CFrame * v2).lookVector else v2.lookVector
		p1.resetCameraAngle = false
	else
		v3 = nil
	end
	local v5 = p1:GetHumanoid()
	local CameraSubject = CurrentCamera.CameraSubject
	local v6 = if CameraSubject then CameraSubject:IsA("VehicleSeat") else CameraSubject
	local v7 = if CameraSubject then CameraSubject:IsA("SkateboardPlatform") else CameraSubject
	local v8 = if v5 then if v5:GetState() == Enum.HumanoidStateType.Climbing then true else false else v5
	if p1.lastUpdate == nil or p2 > 1 then
		p1.lastCameraTransform = nil
	end
	local sum = CameraInput.getRotation(p2)
	p1:StepZoom()
	local v9 = p1:GetCameraHeight()
	if sum ~= Vector2.new() then
		v1 = 0
		p1.lastUserPanCamera = tick()
	end
	local v10 = if v12 - p1.lastUserPanCamera < 2 then true else false
	local sum_2 = p1:GetSubjectPosition()
	if sum_2 and (Players.LocalPlayer and CurrentCamera) then
		local v11 = p1:GetCameraToSubjectDistance()
		if v11 < 0.5 then
			v11 = 0.5
		end
		if p1:GetIsMouseLocked() and not p1:IsInFirstPerson() then
			local v122 = p1:CalculateNewLookCFrameFromArg(v3, sum)
			local sum_3 = p1:GetMouseLockOffset()
			if v5 then
				sum_3 = sum_3 + v5.CameraOffset
			end
			local v13 = sum_3.X * v122.RightVector + sum_3.Y * v122.UpVector + sum_3.Z * v122.LookVector
			if CameraUtils.IsFiniteVector3(v13) then
				sum_2 = sum_2 + v13
			end
		elseif not (if sum == Vector2.new() then false else true) and p1.lastCameraTransform then
			local v15 = p1:IsInFirstPerson()
			if (v6 or (v7 or p1.isFollowCamera and v8)) and (p1.lastUpdate and (v5 and v5.Torso)) then
				if v15 then
					if p1.lastSubjectCFrame and (v6 or v7) and CameraSubject:IsA("BasePart") then
						local v18 = -CameraUtils.GetAngleBetweenXZVectors(p1.lastSubjectCFrame.lookVector, CameraSubject.CFrame.lookVector)
						if CameraUtils.IsFinite(v18) then
							sum = sum + Vector2.new(v18, 0)
						end
						v1 = 0
					end
				elseif not v10 then
					v1 = math.clamp(v1 + 3.839724354387525 * p2, 0, 4.363323129985824)
					local v21 = math.clamp(v1 * p2, 0, 1)
					if p1:IsInFirstPerson() and not (p1.isFollowCamera and p1.isClimbing) then
						v21 = 1
					end
					local v222 = CameraUtils.GetAngleBetweenXZVectors(v5.Torso.CFrame.lookVector, p1:GetCameraLookVector())
					if CameraUtils.IsFinite(v222) and math.abs(v222) > 0.0001 then
						sum = sum + Vector2.new(v222 * v21, 0)
					end
				end
			else
				local v16, v17
				if p1.isFollowCamera and not (v15 or v10) then
					v16 = -(p1.lastCameraTransform.p - sum_2)
					v17 = CameraUtils.GetAngleBetweenXZVectors(v16, p1:GetCameraLookVector())
					if CameraUtils.IsFinite(v17) and (math.abs(v17) > 0.0001 and 0.4 * p2 < math.abs(v17)) then
						sum = sum + Vector2.new(v17, 0)
					end
				end
			end
		end
		local v23, v24
		if p1.isFollowCamera then
			local v25 = p1:CalculateNewLookVectorFromArg(v3, sum)
			local v26 = CFrame.new(sum_2)
			if UserFixCameraFPError then
				v23, v24 = v26, CFrame.lookAlong(v26.p - v11 * v25, v25)
			else
				v24 = CFrame.new(v26.p - v11 * v25, v26.p) + Vector3.new(0, v9, 0)
				v23 = v26
			end
		else
			local v28 = CFrame.new(sum_2)
			local p = v28.p
			local v29 = p1:CalculateNewLookVectorFromArg(v3, sum)
			if UserFixCameraFPError then
				v23, v24 = v28, CFrame.lookAlong(p - v11 * v29, v29)
			else
				v23, v24 = v28, CFrame.new(p - v11 * v29, p)
			end
		end
		local v32 = p1:GetCameraToggleOffset(p2)
		Focus = v23 + v32
		v22 = v24 + v32
		p1.lastCameraTransform = v22
		p1.lastCameraFocus = Focus
		if (v6 or v7) and CameraSubject:IsA("BasePart") then
			p1.lastSubjectCFrame = CameraSubject.CFrame
		else
			p1.lastSubjectCFrame = nil
		end
	end
	p1.lastUpdate = v12
	return v22, Focus
end
return v3