-- https://lua.expert/
local ZoomController = require(script.Parent:WaitForChild("ZoomController"))
local t = {}
t.__index = t
local v1 = CFrame.new()
local function cframeToAxis(p1) --[[ cframeToAxis | Line: 12 ]]
	local v1, v2 = p1:toAxisAngle()
	return v1 * v2
end
local function axisToCFrame(p1) --[[ axisToCFrame | Line: 17 | Upvalues: v1 (copy) ]]
	local magnitude = p1.magnitude
	if magnitude > 0.00001 then
		return CFrame.fromAxisAngle(p1, magnitude)
	else
		return v1
	end
end
local function extractRotation(p1) --[[ extractRotation | Line: 25 ]]
	local _, _2, _3, v1, v2, v3, v4, v5, v6, v7, v8, v9 = p1:components()
	return CFrame.new(0, 0, 0, v1, v2, v3, v4, v5, v6, v7, v8, v9)
end
function t.new() --[[ new | Line: 30 | Upvalues: t (copy) ]]
	return setmetatable({
		lastCFrame = nil
	}, t)
end
function t.Step(p1, p2, p3) --[[ Step | Line: 36 | Upvalues: v1 (copy) ]]
	local v12 = p1.lastCFrame or p3
	p1.lastCFrame = p3
	local Position = p3.Position
	local _, _2, _3, v2, v3, v4, v5, v6, v7, v8, v9, v10 = p3:components()
	local v11 = CFrame.new(0, 0, 0, v2, v3, v4, v5, v6, v7, v8, v9, v10)
	local _4, _5, _6, v122, v13, v14, v15, v16, v17, v18, v19, v20 = v12:components()
	local v21 = (Position - v12.p) / p2
	local v22, v23 = (v11 * CFrame.new(0, 0, 0, v122, v13, v14, v15, v16, v17, v18, v19, v20):inverse()):toAxisAngle()
	local v24 = v22 * v23 / p2
	return {
		extrapolate = function(p1) --[[ extrapolate | Line: 51 | Upvalues: v21 (copy), Position (copy), v24 (copy), v1 (ref), v11 (copy) ]]
			local v2 = v24 * p1
			local magnitude = v2.magnitude
			return (if magnitude > 0.00001 then CFrame.fromAxisAngle(v2, magnitude) else v1) * v11 + (v21 * p1 + Position)
		end,
		posVelocity = v21,
		rotVelocity = v24
	}
end
function t.Reset(p1) --[[ Reset | Line: 64 ]]
	p1.lastCFrame = nil
end
local BaseOcclusion = require(script.Parent:WaitForChild("BaseOcclusion"))
local v2 = setmetatable({}, BaseOcclusion)
v2.__index = v2
function v2.new() --[[ new | Line: 74 | Upvalues: BaseOcclusion (copy), v2 (copy), t (copy) ]]
	local v3 = setmetatable(BaseOcclusion.new(), v2)
	v3.focusExtrapolator = t.new()
	return v3
end
function v2.GetOcclusionMode(p1) --[[ GetOcclusionMode | Line: 80 ]]
	return Enum.DevCameraOcclusionMode.Zoom
end
function v2.Enable(p1, p2) --[[ Enable | Line: 84 ]]
	p1.focusExtrapolator:Reset()
end
function v2.Update(p1, p2, p3, p4, p5) --[[ Update | Line: 88 | Upvalues: ZoomController (copy) ]]
	local v1 = CFrame.new(p4.p, p3.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	return v1 * CFrame.new(0, 0, (ZoomController.Update(p2, v1, (p1.focusExtrapolator:Step(p2, v1))))), p4
end
function v2.CharacterAdded(p1, p2, p3) --[[ CharacterAdded | Line: 101 ]] end
function v2.CharacterRemoving(p1, p2, p3) --[[ CharacterRemoving | Line: 105 ]] end
function v2.OnCameraSubjectChanged(p1, p2) --[[ OnCameraSubjectChanged | Line: 108 ]] end
return v2