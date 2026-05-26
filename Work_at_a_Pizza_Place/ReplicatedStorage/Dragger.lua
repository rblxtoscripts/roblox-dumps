-- https://lua.expert/
local t = {}
t.__index = t
local DragHelper = require(script.DraggerFramework.Utility.DragHelper)
function t.new(p1, p2) --[[ new | Line: 6 | Upvalues: t (copy) ]]
	local v2 = setmetatable({
		mouseDown = false,
		ignoreCharacters = p2
	}, t)
	if p1 and p1 ~= 0 then
		function v2.snapFunction(p12) --[[ Line: 17 | Upvalues: p1 (copy) ]]
			return math.floor(p12 / p1 + 0.5) * p1
		end
	else
		function v2.snapFunction(p1) --[[ Line: 13 ]]
			return p1
		end
	end
	return v2
end
local function getBasisPoint(p1, p2) --[[ getBasisPoint | Line: 25 ]]
	return p1.Size * 0.5 * p2:Sign()
end
function t.MouseDown(p1, p2, p3, p4) --[[ MouseDown | Line: 29 ]]
	if p1.mouseDown then
		error("Call to LuaDragger::mouseDown when already dragging")
	end
	p1.mouseDown = true
	p1.bbSize = p2.Size
	p1.bbCFrame = p2.CFrame
	p1.bbOffset = Vector3.new(0, 0, 0)
	p1.tiltRotate = CFrame.new()
	p1.clickPoint = p3
	p1.basisPoint = p2.Size * 0.5 * p3:Sign()
	p1.selection = p4
	p1.offsetMap = {}
	for v1, v2 in p4 do
		p1.offsetMap[v2] = p1.bbCFrame:ToObjectSpace(v2.CFrame)
	end
	p1.lastTargetMat = nil
	p1.alignRotation = true
	p1.lastMouseRay = nil
end
local function snapFunction(p1) --[[ snapFunction | Line: 51 ]]
	return math.floor(p1 + 0.5)
end
local function noSnapFunction(p1) --[[ noSnapFunction | Line: 55 ]]
	return p1
end
function t._getIgnore(p1) --[[ _getIgnore | Line: 59 ]]
	if not p1.ignoreCharacters then
		return p1.selection
	end
	local v1 = table.clone(p1.selection)
	for v2, v3 in game.Players:GetChildren() do
		if v3.Character then
			table.insert(v1, v3.Character)
		end
	end
	return v1
end
function t._update(p1, p2) --[[ _update | Line: 73 | Upvalues: DragHelper (copy) ]]
	local v2 = DragHelper.getDragTarget(Ray.new(p2.Origin, p2.Direction * 10000), p1.snapFunction, p1.clickPoint, p1:_getIgnore(), p1.bbCFrame, p1.basisPoint, p1.bbSize, p1.bbOffset, p1.tiltRotate, p1.lastTargetMat, p1.alignRotation, p1.bbSize)
	p1.lastTargetMat = v2.targetMatrix
	p1.lastMouseRay = p2
	local mainCFrame = v2.mainCFrame
	for v3, v4 in p1.offsetMap do
		v3.CFrame = mainCFrame * v4
	end
end
function t.MouseMove(p1, p2) --[[ MouseMove | Line: 98 ]]
	if p1.mouseDown then
		p1:_update(p2)
		return
	end
	error("Call to LuaDragger::mouseMove without mouseDown")
end
local function convertAxis(p1) --[[ convertAxis | Line: 105 ]]
	if p1 == Enum.Axis.X then
		return Vector3.new(1, 0, 0)
	end
	if p1 == Enum.Axis.Y then
		return Vector3.new(0, 1, 0)
	else
		return Vector3.new(0, 0, 1)
	end
end
function t.AxisRotateOLD(p1, p2) --[[ AxisRotateOLD | Line: 115 | Upvalues: DragHelper (copy) ]]
	if not p1.mouseDown then
		error("Call to LuaDragger::axisRotate without mouseDown")
	end
	if not p1.lastMouseRay then
		return
	end
	p1.tiltRotate = DragHelper.updateTiltRotate(workspace.CurrentCamera.CFrame, p1.lastMouseRay, p1.selection, p1.bbCFrame, p1.lastTargetMat, p1.tiltRotate, if p2 == Enum.Axis.X then Vector3.new(1, 0, 0) elseif p2 == Enum.Axis.Y then Vector3.new(0, 1, 0) else Vector3.new(0, 0, 1))
	p1:_update(p1.lastMouseRay)
end
function t.AxisRotate(p1, p2) --[[ AxisRotate | Line: 137 ]]
	if not p1.mouseDown then
		error("Call to LuaDragger::axisRotate without mouseDown")
	end
	if not p1.lastMouseRay then
		return
	end
	if p2 == Enum.Axis.Y then
		p1.bbCFrame = CFrame.Angles(0, 1.5707963267948966, 0) * p1.bbCFrame
	end
	if p2 == Enum.Axis.X then
		p1.bbCFrame = CFrame.Angles(1.5707963267948966, 0, 0) * p1.bbCFrame
	end
	if p2 == Enum.Axis.Z then
		p1.bbCFrame = CFrame.Angles(0, 0, 1.5707963267948966) * p1.bbCFrame
	end
	p1:_update(p1.lastMouseRay)
end
function t.MouseUp(p1) --[[ MouseUp | Line: 163 ]]
	if p1.mouseDown then
		p1.mouseDown = false
		return
	end
	error("Call to LuaDragger::mouseUp without mouseDown")
end
return t