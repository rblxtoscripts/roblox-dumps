-- https://lua.expert/
Vector2.new()
require(script.Parent:WaitForChild("CameraUtils"))
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local Players = game:GetService("Players")
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local v1 = setmetatable({}, BaseCamera)
v1.__index = v1
function v1.new() --[[ new | Line: 21 | Upvalues: BaseCamera (copy), v1 (copy) ]]
	local v3 = setmetatable(BaseCamera.new(), v1)
	v3.cameraType = Enum.CameraType.Fixed
	v3.lastUpdate = tick()
	v3.lastDistanceToSubject = nil
	return v3
end
function v1.GetModuleName(p1) --[[ GetModuleName | Line: 31 ]]
	return "LegacyCamera"
end
function v1.SetCameraToSubjectDistance(p1, p2) --[[ SetCameraToSubjectDistance | Line: 36 | Upvalues: BaseCamera (copy) ]]
	return BaseCamera.SetCameraToSubjectDistance(p1, p2)
end
function v1.Update(p1, p2) --[[ Update | Line: 40 | Upvalues: Players (copy), CameraInput (copy) ]]
	if not p1.cameraType then
		return nil, nil
	end
	local v1 = tick()
	local CurrentCamera = workspace.CurrentCamera
	local v3 = CurrentCamera.CFrame
	local Focus = CurrentCamera.Focus
	local LocalPlayer = Players.LocalPlayer
	if p1.lastUpdate == nil or v1 - p1.lastUpdate > 1 then
		p1.lastDistanceToSubject = nil
	end
	local v4 = p1:GetSubjectPosition()
	if p1.cameraType == Enum.CameraType.Fixed then
		if v4 and (LocalPlayer and CurrentCamera) then
			local v5 = p1:GetCameraToSubjectDistance()
			local v6 = p1:CalculateNewLookVectorFromArg(nil, CameraInput.getRotation())
			Focus = CurrentCamera.Focus
			v3 = CFrame.new(CurrentCamera.CFrame.p, CurrentCamera.CFrame.p + v5 * v6)
		end
	elseif p1.cameraType == Enum.CameraType.Attach then
		local v8 = p1:GetSubjectCFrame()
		local v9 = CurrentCamera.CFrame:ToEulerAnglesYXZ()
		local _, v10 = v8:ToEulerAnglesYXZ()
		local v12 = math.clamp(v9 - CameraInput.getRotation().Y, -1.3962634015954636, 1.3962634015954636)
		Focus = CFrame.new(v8.p) * CFrame.fromEulerAnglesYXZ(v12, v10, 0)
		v3 = Focus * CFrame.new(0, 0, p1:StepZoom())
	else
		if p1.cameraType ~= Enum.CameraType.Watch then
			return CurrentCamera.CFrame, CurrentCamera.Focus
		end
		if v4 and (LocalPlayer and CurrentCamera) then
			local v13 = nil
			if v4 == CurrentCamera.CFrame.p then
				warn("Camera cannot watch subject in same position as itself")
				return CurrentCamera.CFrame, CurrentCamera.Focus
			end
			local v14 = p1:GetHumanoid()
			if v14 and v14.RootPart then
				local v15 = v4 - CurrentCamera.CFrame.p
				v13 = v15.unit
				if p1.lastDistanceToSubject and p1.lastDistanceToSubject == p1:GetCameraToSubjectDistance() then
					p1:SetCameraToSubjectDistance(v15.magnitude)
				end
			end
			local v16 = p1:GetCameraToSubjectDistance()
			local v17 = p1:CalculateNewLookVectorFromArg(v13, CameraInput.getRotation())
			local v18 = CFrame.new(v4)
			local v19 = CFrame.new(v4 - v16 * v17, v4)
			p1.lastDistanceToSubject = v16
			v3 = v19
			Focus = v18
		end
	end
	p1.lastUpdate = v1
	return v3, Focus
end
return v1