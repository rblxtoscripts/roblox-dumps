-- https://lua.expert/
local t = {}
t.__index = t
function t.new() --[[ new | Line: 13 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.cameras = require(script:WaitForChild("CameraModule"))
	v2.controls = require(script:WaitForChild("ControlModule"))
	return v2
end
function t.GetCameras(p1) --[[ GetCameras | Line: 21 ]]
	return p1.cameras
end
function t.GetControls(p1) --[[ GetControls | Line: 25 ]]
	return p1.controls
end
function t.GetClickToMoveController(p1) --[[ GetClickToMoveController | Line: 29 ]]
	return p1.controls:GetClickToMoveController()
end
return t.new()