-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("SettingsService")
local v2 = Sonar("PlayerWrapper").GetClient()
local t = {}
t.__index = t
local profilebegin = debug.profilebegin
local profileend = debug.profileend
local v3 = Vector3.new
local v4 = CFrame.new
local Angles = CFrame.Angles
local rad = math.rad
local v5 = v3()
local v6 = Sonar(script.CameraShakeInstance)
local CameraShakeState = v6.CameraShakeState
t.CameraShakeInstance = v6
t.Presets = Sonar(script.CameraShakePresets)
local t2 = {}
local function canShake() --[[ canShake | Line: 90 | Upvalues: v1 (copy), v2 (copy) ]]
	return v1.GetSetting(v2, "CameraSmoothing")
end
function t.new(p1, p2, p3) --[[ new | Line: 94 | Upvalues: v5 (copy), t (copy), t2 (copy) ]]
	assert(if type(p1) == "number" then true else false, "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)")
	assert(if type(p3) == "function" then true else false, "Callback must be a function")
	local v4 = setmetatable({
		_running = false,
		_renderName = p2,
		_renderPriority = p1,
		_posAddShake = v5,
		_rotAddShake = v5,
		_camShakeInstances = {},
		_removeInstances = {},
		_callback = p3
	}, t)
	t2[v4] = true
	return v4
end
function t.Destroy(p1) --[[ Destroy | Line: 116 | Upvalues: t2 (copy) ]]
	t2[p1] = nil
	p1:Stop()
	setmetatable(p1, nil)
end
function t.StopAll(p1) --[[ StopAll | Line: 122 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		if not k._permanent then
			k:Stop()
		end
	end
end
function t.Start(p1) --[[ Start | Line: 131 | Upvalues: profilebegin (copy), profileend (copy) ]]
	if not p1._running then
		p1._running = true
		local _callback = p1._callback
		game:GetService("RunService"):BindToRenderStep(p1._renderName, p1._renderPriority, function(p12) --[[ Line: 135 | Upvalues: profilebegin (ref), p1 (copy), profileend (ref), _callback (copy) ]]
			profilebegin("CameraShakerUpdate")
			local v1 = p1:Update((math.clamp(p12, 0, 0.035)))
			profileend()
			_callback(v1)
		end)
	end
end
function t.Stop(p1) --[[ Stop | Line: 144 ]]
	if p1._running then
		pcall(function() --[[ Line: 146 | Upvalues: p1 (copy) ]]
			game:GetService("RunService"):UnbindFromRenderStep(p1._renderName)
		end)
		p1._running = false
	end
end
function t.StopSustained(p1, p2) --[[ StopSustained | Line: 153 ]]
	for k, v in pairs(p1._camShakeInstances) do
		if v.fadeOutDuration == 0 then
			v:StartFadeOut(if p2 then p2 else v.fadeInDuration)
		end
	end
end
function t.Update(p1, p2) --[[ Update | Line: 162 | Upvalues: v5 (copy), CameraShakeState (copy), v4 (copy), Angles (copy), rad (copy) ]]
	local sum = v5
	local sum_2 = v5
	local _camShakeInstances = p1._camShakeInstances
	for i = 1, #_camShakeInstances do
		local v1 = _camShakeInstances[i]
		local v2 = v1:GetState()
		if v2 == CameraShakeState.Inactive and v1.DeleteOnInactive then
			p1._removeInstances[#p1._removeInstances + 1] = i
			continue
		end
		if v2 ~= CameraShakeState.Inactive then
			local v3 = v1:UpdateShake(p2)
			sum = sum + v3 * v1.PositionInfluence
			sum_2 = sum_2 + v3 * v1.RotationInfluence
		end
	end
	for j = #p1._removeInstances, 1, -1 do
		table.remove(_camShakeInstances, p1._removeInstances[j])
		p1._removeInstances[j] = nil
	end
	return v4(sum) * Angles(0, rad(sum_2.Y), 0) * Angles(rad(sum_2.X), 0, (rad(sum_2.Z)))
end
function t.Shake(p1, p2) --[[ Shake | Line: 197 | Upvalues: v1 (copy), v2 (copy) ]]
	if not v1.GetSetting(v2, "CameraSmoothing") then
		return
	end
	assert(if type(p2) == "table" then p2._camShakeInstance else false, "ShakeInstance must be of type CameraShakeInstance")
	p1._camShakeInstances[#p1._camShakeInstances + 1] = p2
	return p2
end
function t.ShakeSustain(p1, p2) --[[ ShakeSustain | Line: 207 | Upvalues: v1 (copy), v2 (copy) ]]
	if not v1.GetSetting(v2, "CameraSmoothing") then
		return
	end
	assert(if type(p2) == "table" then p2._camShakeInstance else false, "ShakeInstance must be of type CameraShakeInstance")
	p1._camShakeInstances[#p1._camShakeInstances + 1] = p2
	p2:StartFadeIn(p2.fadeInDuration)
	return p2
end
function t.ShakeOnce(p1, p2, p3, p4, p5, p6, p7) --[[ ShakeOnce | Line: 218 | Upvalues: v1 (copy), v2 (copy), v6 (copy) ]]
	if not v1.GetSetting(v2, "CameraSmoothing") then
		return
	end
	local v12 = v6.new(p2, p3, p4, p5)
	v12.PositionInfluence = if typeof(p6) == "Vector3" and p6 then p6 else Vector3.new(0.15, 0.15, 0.15)
	v12.RotationInfluence = if typeof(p7) == "Vector3" and p7 then p7 else Vector3.new(1, 1, 1)
	p1._camShakeInstances[#p1._camShakeInstances + 1] = v12
	return v12
end
function t.StartShake(p1, p2, p3, p4, p5, p6) --[[ StartShake | Line: 230 | Upvalues: v1 (copy), v2 (copy), v6 (copy) ]]
	if not v1.GetSetting(v2, "CameraSmoothing") then
		return
	end
	local v12 = v6.new(p2, p3, p4)
	v12.PositionInfluence = if typeof(p5) == "Vector3" and p5 then p5 else Vector3.new(0.15, 0.15, 0.15)
	v12.RotationInfluence = if typeof(p6) == "Vector3" and p6 then p6 else Vector3.new(1, 1, 1)
	v12:StartFadeIn(p4)
	p1._camShakeInstances[#p1._camShakeInstances + 1] = v12
	return v12
end
return t