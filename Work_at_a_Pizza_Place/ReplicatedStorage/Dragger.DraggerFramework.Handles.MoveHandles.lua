-- https://lua.expert/
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Parent.Packages.Roact)
local Math = require(v1.Utility.Math)
local Colors = require(v1.Utility.Colors)
local StandaloneSelectionBox = require(v1.Components.StandaloneSelectionBox)
local MoveHandleView = require(v1.Components.MoveHandleView)
local SummonHandlesNote = require(v1.Components.SummonHandlesNote)
local SummonHandlesHider = require(v1.Components.SummonHandlesHider)
local DraggedPivot = require(v1.Components.DraggedPivot)
local getEngineFeatureModelPivotVisual = require(v1.Flags.getEngineFeatureModelPivotVisual)
local computeDraggedDistance = require(v1.Utility.computeDraggedDistance)
local getFFlagSummonPivot = require(v1.Flags.getFFlagSummonPivot)
local getFFlagFixDraggerMovingInWrongDirection = require(v1.Flags.getFFlagFixDraggerMovingInWrongDirection)
local t = {}
t.__index = t
local t2 = {
	MinusZ = {
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)),
		Color = Colors.Z_AXIS
	},
	PlusZ = {
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, -1, 0)),
		Color = Colors.Z_AXIS
	},
	MinusY = {
		HideWhenTempPart = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0)),
		Color = Colors.Y_AXIS
	},
	PlusY = {
		HideWhenTempPart = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), Vector3.new(-1, 0, 0)),
		Color = Colors.Y_AXIS
	},
	MinusX = {
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1)),
		Color = Colors.X_AXIS
	},
	PlusX = {
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), Vector3.new(0, 0, -1)),
		Color = Colors.X_AXIS
	}
}
function t.new(p1, p2, p3) --[[ new | Line: 57 | Upvalues: t (copy) ]]
	local t2 = {
		_handles = {}
	}
	t2._props = if p2 then p2 else {
	Summonable = true
}
	t2._draggerContext = p1
	t2._implementation = p3
	t2._tabKeyDown = false
	return setmetatable(t2, t)
end
function t.update(p1, p2, p3) --[[ update | Line: 69 | Upvalues: getFFlagSummonPivot (copy) ]]
	if not p1._draggingHandleId then
		if getFFlagSummonPivot() and not p1._tabKeyDown then
			p1:_endSummon()
		end
		local v1, v2, v3 = p3:getBoundingBox()
		p1._basisOffset = CFrame.new(-v2)
		p1._boundingBox = {
			Size = v3,
			CFrame = v1 * CFrame.new(v2)
		}
		p1._schema = p2:getSchema()
		p1._selectionWrapper = p2:getSelectionWrapper()
		p1._selectionInfo = p3
	end
	p1:_updateHandles()
end
function t._summonHandles(p1) --[[ _summonHandles | Line: 92 ]]
	if not p1._props.Summonable then
		return false
	end
	local v1 = p1._draggerContext:getMouseRay()
	local _, _2, v2 = p1._schema.getMouseTarget(p1._draggerContext, v1, {})
	if not v2 then
		return
	end
	p1._summonBasisOffset = CFrame.new(p1._boundingBox.CFrame:PointToObjectSpace(v1.Origin + v1.Direction.Unit * v2))
end
function t._endSummon(p1) --[[ _endSummon | Line: 105 ]]
	if not p1._summonBasisOffset then
		return
	end
	p1._summonBasisOffset = nil
end
function t._getBasisOffset(p1) --[[ _getBasisOffset | Line: 111 ]]
	return p1._summonBasisOffset or p1._basisOffset
end
function t.shouldBiasTowardsObjects(p1) --[[ shouldBiasTowardsObjects | Line: 115 ]]
	return false
end
function t.hitTest(p1, p2, p3) --[[ hitTest | Line: 119 | Upvalues: MoveHandleView (copy) ]]
	local v1 = (1 / 0)
	local v2 = nil
	for k, v in pairs(p1._handles) do
		local v3 = MoveHandleView.hitTest(v, p2)
		if v3 and v3 < v1 then
			v1 = v3
			v2 = k
		end
	end
	return v2, v1, true
end
function t.render(p1, p2) --[[ render | Line: 131 | Upvalues: getEngineFeatureModelPivotVisual (copy), Roact (copy), MoveHandleView (copy), Colors (copy), getFFlagSummonPivot (copy), StandaloneSelectionBox (copy), DraggedPivot (copy), SummonHandlesHider (copy), SummonHandlesNote (copy) ]]
	local t = {}
	local v1 = getEngineFeatureModelPivotVisual()
	if p1._draggingHandleId and p1._handles[p1._draggingHandleId] then
		local v2 = p1._handles[p1._draggingHandleId]
		local t2 = {
			AlwaysOnTop = true,
			Hovered = false,
			Axis = v2.Axis
		}
		t2.AxisOffset = not v1 and v2.AxisOffset or nil
		t2.Outset = v2.Outset
		t2.Color = v2.Color
		t2.Scale = v2.Scale
		t[p1._draggingHandleId] = Roact.createElement(MoveHandleView, t2)
		for k, v in pairs(p1._handles) do
			if k ~= p1._draggingHandleId then
				local t3 = {
					AlwaysOnTop = true,
					Thin = true,
					Axis = v.Axis
				}
				t3.AxisOffset = not v1 and v.AxisOffset or nil
				t3.Outset = v2.Outset
				t3.Color = Colors.makeDimmed(v.Color)
				t3.Scale = v.Scale
				t[k] = Roact.createElement(MoveHandleView, t3)
			end
		end
		if getFFlagSummonPivot() then
			t.ImplementationRendered = p1._implementation:render(p1._lastGlobalTransformForRender)
		else
			t.ImplementationRendered = p1._implementation:render(p1._boundingBox.CFrame * p1:_getBasisOffset())
		end
	else
		for k, v in pairs(p1._handles) do
			local Color = v.Color
			local v7 = if k == p2 then true else false
			if not v7 then
				Color = Colors.makeDimmed(Color)
			end
			local t2 = {
				AlwaysOnTop = true,
				Axis = v.Axis
			}
			t2.AxisOffset = not v1 and v.AxisOffset or nil
			t2.Outset = v.Outset
			t2.Color = Color
			t2.Scale = v.Scale
			t2.Hovered = v7
			t[k] = Roact.createElement(MoveHandleView, t2)
		end
	end
	if p1._props.ShowBoundingBox and #p1._selectionWrapper:get() > 1 then
		t.SelectionBoundingBox = Roact.createElement(StandaloneSelectionBox, {
			CFrame = p1._boundingBox.CFrame,
			Size = p1._boundingBox.Size,
			Color = p1._draggerContext:getSelectionBoxColor(),
			LineThickness = p1._draggerContext:getHoverLineThickness(),
			Container = p1._draggerContext:getGuiParent()
		})
	end
	if getEngineFeatureModelPivotVisual() and (getFFlagSummonPivot() and p1._props.Summonable) then
		if p1._summonBasisOffset then
			local t2 = {
				DraggerContext = p1._draggerContext,
				CFrame = p1._boundingBox.CFrame * p1:_getBasisOffset()
			}
			t2.IsActive = p1._draggerContext:shouldShowActiveInstanceHighlight() and (if #p1._selectionWrapper:get() == 1 then true else false)
			t.SummonedPivot = Roact.createElement(DraggedPivot, t2)
		end
		if not p1._draggingHandleId then
			if p1._summonBasisOffset then
				t.SummonHandlesHider = Roact.createElement(SummonHandlesHider, {
					DraggerContext = p1._draggerContext
				})
			elseif not SummonHandlesHider.hasSeenEnough(p1._draggerContext) then
				local v13, v14 = p1._draggerContext:worldToViewportPoint((p1._boundingBox.CFrame * p1._basisOffset).Position)
				if v13.Z > 0 then
					t.SummonHandlesNote = Roact.createElement(SummonHandlesNote, {
						Position = Vector2.new(v13.X, v13.Y),
						InView = v14,
						DraggerContext = p1._draggerContext
					})
				end
			end
		end
	end
	return Roact.createElement("Folder", {}, t)
end
function t.mouseDown(p1, p2, p3) --[[ mouseDown | Line: 229 | Upvalues: getEngineFeatureModelPivotVisual (copy), MoveHandleView (copy) ]]
	p1._draggingHandleId = p3
	p1._draggingOriginalBoundingBoxCFrame = p1._boundingBox.CFrame
	if p1._handles[p3] then
		p1:_setupMoveAtCurrentBoundingBox(p2)
		local v1 = p1._handles[p3]
		if getEngineFeatureModelPivotVisual() then
			local v2, v3 = MoveHandleView.getHandleDimensionForScale(v1.Scale, p1._props.Outset)
			p1._draggingHandleFrac = (p1._startDistance - v2) / v3
		else
			local v4, v5 = MoveHandleView.getHandleDimensionForScale(v1.Scale)
			p1._draggingHandleFrac = (p1._startDistance - v4 - v1.AxisOffset) / v5
		end
	end
	p1._implementation:beginDrag(p1._selectionWrapper:get(), p1._selectionInfo)
end
function t._setupMoveAtCurrentBoundingBox(p1, p2) --[[ _setupMoveAtCurrentBoundingBox | Line: 254 | Upvalues: t2 (copy), getFFlagFixDraggerMovingInWrongDirection (copy) ]]
	p1._axis = (p1._boundingBox.CFrame * t2[p1._draggingHandleId].Offset).LookVector
	local v1, v2 = p1:_getDistanceAlongAxis(p2)
	if getFFlagFixDraggerMovingInWrongDirection() then
		p1._startDistance = if v1 and v2 then v2 else 0
	else
		assert(v1)
		p1._startDistance = v2
	end
	p1._lastGlobalTransformForRender = CFrame.new()
end
function t._setMidMoveBoundingBox(p1, p2) --[[ _setMidMoveBoundingBox | Line: 271 ]]
	p1._boundingBox.CFrame = p2
end
function t._getDistanceAlongAxis(p1, p2) --[[ _getDistanceAlongAxis | Line: 278 | Upvalues: getFFlagFixDraggerMovingInWrongDirection (copy), getEngineFeatureModelPivotVisual (copy), computeDraggedDistance (copy), Math (copy) ]]
	if getFFlagFixDraggerMovingInWrongDirection() then
		local _draggingOriginalBoundingBoxCFrame = p1._draggingOriginalBoundingBoxCFrame
		if getEngineFeatureModelPivotVisual() then
			_draggingOriginalBoundingBoxCFrame = _draggingOriginalBoundingBoxCFrame * p1:_getBasisOffset()
		end
		return computeDraggedDistance(_draggingOriginalBoundingBoxCFrame.Position, p1._axis.Unit, p2)
	elseif getEngineFeatureModelPivotVisual() then
		return Math.intersectRayRay((p1._draggingOriginalBoundingBoxCFrame * p1:_getBasisOffset()).Position, p1._axis, p2.Origin, p2.Direction.Unit)
	else
		return Math.intersectRayRay(p1._draggingOriginalBoundingBoxCFrame.Position, p1._axis, p2.Origin, p2.Direction.Unit)
	end
end
function t._solveForAdjustedDistance(p1, p2) --[[ _solveForAdjustedDistance | Line: 316 | Upvalues: getEngineFeatureModelPivotVisual (copy), t2 (copy), getFFlagSummonPivot (copy), MoveHandleView (copy) ]]
	local v1 = getEngineFeatureModelPivotVisual()
	local v2 = nil
	local v3 = nil
	if v1 then
		v3 = p1._handles[p1._draggingHandleId].OffsetInHandleSpace
	else
		v2 = p1._handles[p1._draggingHandleId].AxisOffset
	end
	local Offset = t2[p1._draggingHandleId].Offset
	local function getScaleForDistance(p12) --[[ getScaleForDistance | Line: 331 | Upvalues: p1 (copy), v1 (copy), getFFlagSummonPivot (ref), Offset (copy), v3 (ref), v2 (ref) ]]
		local v12 = p1._draggingOriginalBoundingBoxCFrame + p1._axis * (p12 - p1._startDistance)
		return p1._draggerContext:getHandleScale((if v1 and getFFlagSummonPivot() then v12 * p1:_getBasisOffset() * Offset else v1 and v12 * Offset * v3 or v12 * Offset * CFrame.new(0, 0, -v2)).Position)
	end
	local function getHandleFracForDistance(p12) --[[ getHandleFracForDistance | Line: 347 | Upvalues: getScaleForDistance (copy), v1 (copy), MoveHandleView (ref), p1 (copy), p2 (copy), v2 (ref) ]]
		local v12 = getScaleForDistance(p12)
		if v1 then
			local v22, v3 = MoveHandleView.getHandleDimensionForScale(v12, p1._props.Outset)
			return (p2 - (p12 - p1._startDistance + v22)) / v3
		else
			local v4, v5 = MoveHandleView.getHandleDimensionForScale(v12)
			return (p2 - p12 + p1._startDistance - v4 - v2) / v5
		end
	end
	local function getHandleLengthForDistance(p12) --[[ getHandleLengthForDistance | Line: 364 | Upvalues: v1 (copy), MoveHandleView (ref), getScaleForDistance (copy), p1 (copy) ]]
		if v1 then
			local _, v12 = MoveHandleView.getHandleDimensionForScale(getScaleForDistance(p12), p1._props.Outset)
			return v12
		else
			local _, v2 = MoveHandleView.getHandleDimensionForScale(getScaleForDistance(p12))
			return v2
		end
	end
	local v4
	if v1 then
		local _, v5 = MoveHandleView.getHandleDimensionForScale(getScaleForDistance(0), p1._props.Outset)
		v4 = v5
	else
		local _, v6 = MoveHandleView.getHandleDimensionForScale(getScaleForDistance(0))
		v4 = v6
	end
	local v7
	if v1 then
		local _, v8 = MoveHandleView.getHandleDimensionForScale(getScaleForDistance(p2), p1._props.Outset)
		v7 = v8
	else
		local _, v9 = MoveHandleView.getHandleDimensionForScale(getScaleForDistance(p2))
		v7 = v9
	end
	local v10 = math.max(v4, v7)
	local v11 = p2 - v10
	local v12 = p2 + v10
	local v13 = getHandleFracForDistance(v11)
	local v14 = getHandleFracForDistance(v12)
	while math.abs(v11 - v12) > 0.0001 do
		local v15 = 0.5 * (v11 + v12)
		local v16 = getHandleFracForDistance(v15)
		if (p1._draggingHandleFrac - v16) * (v14 - v13) > 0 then
			v11 = v15
			v13 = v16
		else
			v12 = v15
			v14 = v16
		end
	end
	return v11
end
function t._getSnappedDelta(p1, p2) --[[ _getSnappedDelta | Line: 407 ]]
	local v1 = if p1._implementation.getSnapPoints then p1._implementation:getSnapPoints() else nil
	if not v1 then
		return p1._draggerContext:snapToGridSize(p2)
	end
	local Position = (p1._draggingOriginalBoundingBoxCFrame * p1._basisOffset).Position
	local _axis = p1._axis
	local v3 = (1 / 0)
	local v4 = (-1 / 0)
	local v5 = (1 / 0)
	local v6 = (1 / 0)
	for i, v in ipairs(v1) do
		local v7 = (v.Position - Position):Dot(_axis)
		local v8 = math.max(v4, v7)
		local v9 = math.min(v5, v7)
		local v10 = math.abs(v7 - p2)
		if v10 < v3 then
			v3 = v10
			v4 = v8
			v5 = v9
			v6 = v7
			continue
		end
		v4, v5 = v8, v9
	end
	if not (v4 < p2 or p2 < v5) then
		return v6
	end
	local v11 = p1._draggerContext:snapToGridSize(p2)
	if v3 < math.abs(v11 - p2) then
		return v6
	else
		return v11
	end
end
function t.mouseDrag(p1, p2) --[[ mouseDrag | Line: 453 | Upvalues: getEngineFeatureModelPivotVisual (copy) ]]
	local v1, v2 = p1:_getDistanceAlongAxis(p2)
	if not v1 then
		return
	end
	if not p1._handles[p1._draggingHandleId] then
		return
	end
	local v3 = p1:_solveForAdjustedDistance(v2) - p1._startDistance
	local v7 = p1._implementation:updateDrag(CFrame.new(p1._axis * (if getEngineFeatureModelPivotVisual() then p1:_getSnappedDelta(v3) else p1._draggerContext:snapToGridSize(v3))))
	assert(v7 ~= nil, "Did not return a transform from updateDrag.")
	p1:_setMidMoveBoundingBox(v7 * p1._draggingOriginalBoundingBoxCFrame)
	p1._lastGlobalTransformForRender = v7
end
function t.mouseUp(p1, p2) --[[ mouseUp | Line: 484 | Upvalues: getFFlagSummonPivot (copy) ]]
	p1._draggingHandleId = nil
	local v1 = p1._implementation:endDrag()
	p1._schema.addUndoWaypoint(p1._draggerContext, "Axis Move Selection")
	if not getFFlagSummonPivot() or p1._tabKeyDown then
		return v1
	end
	p1:_endSummon()
	return v1
end
function t._updateHandles(p1) --[[ _updateHandles | Line: 494 | Upvalues: t2 (copy) ]]
	if p1._selectionInfo:isEmpty() then
		p1._handles = {}
		return
	end
	for k, v in pairs(t2) do
		local v1 = p1._boundingBox.CFrame * p1:_getBasisOffset() * v.Offset
		local HideWhenTempPart = v.HideWhenTempPart
		p1._handles[k] = {
			AlwaysOnTop = true,
			Outset = p1._props.Outset,
			Axis = v1,
			Color = v.Color,
			Scale = p1._draggerContext:getHandleScale(v1.Position)
		}
	end
end
if getEngineFeatureModelPivotVisual() and getFFlagSummonPivot() then
	function t.keyDown(p1, p2) --[[ keyDown | Line: 517 ]]
		if p2 ~= Enum.KeyCode.Tab then
			return false
		end
		p1._tabKeyDown = true
		if p1._draggingHandleId then
			return false
		else
			p1:_summonHandles()
			return true
		end
	end
	function t.keyUp(p1, p2) --[[ keyUp | Line: 528 ]]
		if p2 ~= Enum.KeyCode.Tab then
			return false
		end
		p1._tabKeyDown = false
		if p1._draggingHandleId then
			return true
		end
		p1:_endSummon()
		return true
	end
end
return t