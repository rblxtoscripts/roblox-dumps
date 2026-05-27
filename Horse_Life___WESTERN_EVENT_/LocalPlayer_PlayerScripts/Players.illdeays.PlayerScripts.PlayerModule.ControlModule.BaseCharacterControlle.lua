-- https://lua.expert/
local t = {}
t.__index = t
function t.new() --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.enabled = false
	v2.moveVector = Vector3.new(0, 0, 0)
	v2.moveVectorIsCameraRelative = true
	v2.isJumping = false
	return v2
end
function t.OnRenderStepped(p1, p2) --[[ OnRenderStepped | Line: 24 ]] end
function t.GetMoveVector(p1) --[[ GetMoveVector | Line: 28 ]]
	return p1.moveVector
end
function t.IsMoveVectorCameraRelative(p1) --[[ IsMoveVectorCameraRelative | Line: 32 ]]
	return p1.moveVectorIsCameraRelative
end
function t.GetIsJumping(p1) --[[ GetIsJumping | Line: 36 ]]
	return p1.isJumping
end
function t.Enable(p1, p2) --[[ Enable | Line: 42 ]]
	error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
end
return t