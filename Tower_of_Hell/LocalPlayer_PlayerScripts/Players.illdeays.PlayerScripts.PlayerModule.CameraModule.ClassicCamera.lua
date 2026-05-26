-- https://lua.expert/
Vector2.new(0, 0)
local v1 = 0
local v2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local v3 = setmetatable({}, BaseCamera)
v3.__index = v3
function v3.new() --[[ new | Line: 34 | Upvalues: BaseCamera (copy), v3 (copy), CameraUtils (copy) ]]
	local v32 = setmetatable(BaseCamera.new(), v3)
	v32.isFollowCamera = false
	v32.isCameraToggle = false
	v32.lastUpdate = tick()
	v32.cameraToggleSpring = CameraUtils.Spring.new(5, 0)
	return v32
end
function v3.GetCameraToggleOffset(p1, p2) --[[ GetCameraToggleOffset | Line: 45 | Upvalues: CameraInput (copy), CameraUtils (copy) ]]
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
function v3.SetCameraMovementMode(p1, p2) --[[ SetCameraMovementMode | Line: 63 | Upvalues: BaseCamera (copy) ]]
	BaseCamera.SetCameraMovementMode(p1, p2)
	p1.isFollowCamera = p2 == Enum.ComputerCameraMovementMode.Follow
	p1.isCameraToggle = p2 == Enum.ComputerCameraMovementMode.CameraToggle
end
function v3.Update(p1) --[[ Update | Line: 70 | Upvalues: v2 (copy), Players (copy), CameraInput (copy), v1 (ref), CameraUtils (copy), VRService (copy) ]]
	local v12 = tick()
	local v22 = v12 - p1.lastUpdate
	local CurrentCamera = workspace.CurrentCamera
	local sum = CurrentCamera.CFrame
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
	if p1.lastUpdate == nil or v22 > 1 then
		p1.lastCameraTransform = nil
	end
	local sum_2 = CameraInput.getRotation()
	p1:StepZoom()
	local v9 = p1:GetCameraHeight()
	if CameraInput.getRotation() ~= Vector2.new() then
		v1 = 0
		p1.lastUserPanCamera = tick()
	end
	local v10 = if v12 - p1.lastUserPanCamera < 2 then true else false
	local sum_3 = p1:GetSubjectPosition()
	if sum_3 and (Players.LocalPlayer and CurrentCamera) then
		local v11 = p1:GetCameraToSubjectDistance()
		if v11 < 0.5 then
			v11 = 0.5
		end
		if p1:GetIsMouseLocked() and not p1:IsInFirstPerson() then
			local v122 = p1:CalculateNewLookCFrameFromArg(v3, sum_2)
			local v13 = p1:GetMouseLockOffset()
			local v14 = v13.X * v122.RightVector + v13.Y * v122.UpVector + v13.Z * v122.LookVector
			if CameraUtils.IsFiniteVector3(v14) then
				sum_3 = sum_3 + v14
			end
		elseif not (if CameraInput.getRotation() == Vector2.new() then false else true) and p1.lastCameraTransform then
			local v16 = p1:IsInFirstPerson()
			if (v6 or (v7 or p1.isFollowCamera and v8)) and (p1.lastUpdate and (v5 and v5.Torso)) then
				if v16 then
					if p1.lastSubjectCFrame and (v6 or v7) and CameraSubject:IsA("BasePart") then
						local v19 = -CameraUtils.GetAngleBetweenXZVectors(p1.lastSubjectCFrame.lookVector, CameraSubject.CFrame.lookVector)
						if CameraUtils.IsFinite(v19) then
							sum_2 = sum_2 + Vector2.new(v19, 0)
						end
						v1 = 0
					end
				elseif not v10 then
					v1 = math.clamp(v1 + 3.839724354387525 * v22, 0, 4.363323129985824)
					local v222 = math.clamp(v1 * v22, 0, 1)
					if p1:IsInFirstPerson() and not (p1.isFollowCamera and p1.isClimbing) then
						v222 = 1
					end
					local v23 = CameraUtils.GetAngleBetweenXZVectors(v5.Torso.CFrame.lookVector, p1:GetCameraLookVector())
					if CameraUtils.IsFinite(v23) and math.abs(v23) > 0.0001 then
						sum_2 = sum_2 + Vector2.new(v23 * v222, 0)
					end
				end
			else
				local v17, v18
				if p1.isFollowCamera and not (v16 or (v10 or VRService.VREnabled)) then
					v17 = -(p1.lastCameraTransform.p - sum_3)
					v18 = CameraUtils.GetAngleBetweenXZVectors(v17, p1:GetCameraLookVector())
					if CameraUtils.IsFinite(v18) and (math.abs(v18) > 0.0001 and 0.4 * v22 < math.abs(v18)) then
						sum_2 = sum_2 + Vector2.new(v18, 0)
					end
				end
			end
		end
		local v24
		if p1.isFollowCamera then
			local v25 = p1:CalculateNewLookVectorFromArg(v3, sum_2)
			v24 = if VRService.VREnabled then p1:GetVRFocus(sum_3, v22) else CFrame.new(sum_3)
			sum = CFrame.new(v24.p - v11 * v25, v24.p) + Vector3.new(0, v9, 0)
		else
			local VREnabled = VRService.VREnabled
			v24 = if VREnabled then p1:GetVRFocus(sum_3, v22) else CFrame.new(sum_3)
			local p = v24.p
			if VREnabled and not p1:IsInFirstPerson() then
				local magnitude = (sum_3 - CurrentCamera.CFrame.p).magnitude
				if v11 < magnitude or sum_2.x ~= 0 then
					local v31 = math.min(magnitude, v11)
					local v32 = p1:CalculateNewLookVectorFromArg(nil, sum_2) * v31
					local v33 = p - v32
					local lookVector = CurrentCamera.CFrame.lookVector
					if sum_2.x ~= 0 then
						lookVector = v32
					end
					local v36 = Vector3.new(v33.x + lookVector.x, v33.y, v33.z + lookVector.z)
					sum = CFrame.new(v33, v36) + Vector3.new(0, v9, 0)
				end
			else
				sum = CFrame.new(p - v11 * p1:CalculateNewLookVectorFromArg(v3, sum_2), p)
			end
		end
		local v39 = p1:GetCameraToggleOffset(v22)
		Focus = v24 + v39
		sum = sum + v39
		p1.lastCameraTransform = sum
		p1.lastCameraFocus = Focus
		if (v6 or v7) and CameraSubject:IsA("BasePart") then
			p1.lastSubjectCFrame = CameraSubject.CFrame
		else
			p1.lastSubjectCFrame = nil
		end
	end
	p1.lastUpdate = v12
	return sum, Focus
end
function v3.EnterFirstPerson(p1) --[[ EnterFirstPerson | Line: 244 ]]
	p1.inFirstPerson = true
	p1:UpdateMouseBehavior()
end
function v3.LeaveFirstPerson(p1) --[[ LeaveFirstPerson | Line: 249 ]]
	p1.inFirstPerson = false
	p1:UpdateMouseBehavior()
end
return v3