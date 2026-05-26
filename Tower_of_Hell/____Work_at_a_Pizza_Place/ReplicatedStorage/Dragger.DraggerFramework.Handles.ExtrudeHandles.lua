-- https://lua.expert/
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Parent.Packages.Roact)
local Colors = require(v1.Utility.Colors)
local Math = require(v1.Utility.Math)
local StandaloneSelectionBox = require(v1.Components.StandaloneSelectionBox)
local ScaleHandleView = require(v1.Components.ScaleHandleView)
local DraggedPivot = require(v1.Components.DraggedPivot)
local computeDraggedDistance = require(v1.Utility.computeDraggedDistance)
local getEngineFeatureModelPivotVisual = require(v1.Flags.getEngineFeatureModelPivotVisual)
local getFFlagSummonPivot = require(v1.Flags.getFFlagSummonPivot)
local getFFlagLimitScaling = require(v1.Flags.getFFlagLimitScaling)
local getFFlagFixDraggerMovingInWrongDirection = require(v1.Flags.getFFlagFixDraggerMovingInWrongDirection)
require(script.Parent.Parent.Parent.Parent.RoadManager)
local t = {}
t.__index = t
local t2 = {
	X_AXIS = 1,
	Y_AXIS = 2,
	Z_AXIS = 3
}
local t3 = {
	MinusX = {
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1)),
		Color = Colors.X_AXIS,
		NormalId = t2.X_AXIS
	},
	PlusX = {
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), Vector3.new(0, 0, -1)),
		Color = Colors.X_AXIS,
		NormalId = t2.X_AXIS
	},
	MinusY = {
		HideWhenRoad = true,
		HideWhenIntersection = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0)),
		Color = Colors.Y_AXIS,
		NormalId = t2.Y_AXIS
	},
	PlusY = {
		HideWhenRoad = true,
		HideWhenIntersection = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), Vector3.new(-1, 0, 0)),
		Color = Colors.Y_AXIS,
		NormalId = t2.Y_AXIS
	},
	MinusZ = {
		HideWhenRoad = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)),
		Color = Colors.Z_AXIS,
		NormalId = t2.Z_AXIS
	},
	PlusZ = {
		HideWhenRoad = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, -1, 0)),
		Color = Colors.Z_AXIS,
		NormalId = t2.Z_AXIS
	}
}
local t4 = {
	Vector3.new(0.5, 0.5, 0.5),
	Vector3.new(0.5, 0.5, -0.5),
	Vector3.new(0.5, -0.5, 0.5),
	Vector3.new(0.5, -0.5, -0.5),
	Vector3.new(-0.5, 0.5, 0.5),
	Vector3.new(-0.5, 0.5, -0.5),
	Vector3.new(-0.5, -0.5, 0.5),
	Vector3.new(-0.5, -0.5, -0.5)
}
local function nextNormalId(p1) --[[ nextNormalId | Line: 85 ]]
	return p1 % 3 + 1
end
function t.new(p1, p2, p3) --[[ new | Line: 89 | Upvalues: t (copy) ]]
	local t2 = {
		_handles = {}
	}
	t2._props = if p2 then p2 else {}
	t2._draggerContext = p1
	t2._implementation = p3
	return setmetatable(t2, t)
end
function t._summonHandles(p1) --[[ _summonHandles | Line: 99 | Upvalues: t4 (copy) ]]
	if not p1._props.Summonable then
		return false
	end
	local v1 = p1._draggerContext:getMouseRay()
	local _, v2, v3 = p1._schema.getMouseTarget(p1._draggerContext, v1, {})
	if v2 and p1._selectionInfo:doesContainItem(v2) then
		local v5 = p1._boundingBox.CFrame:PointToObjectSpace(v1.Origin + v1.Direction.Unit * v3)
		local v6 = p1._boundingBox.Size / 2
		p1._summonBasisOffset = CFrame.new(v5:Max(-v6):Min(v6))
		return
	end
	local v7 = p1._draggerContext:getMouseLocation()
	local v8 = (1 / 0)
	local v9 = nil
	for i, v in ipairs(t4) do
		local v10 = p1._boundingBox.CFrame * CFrame.new(p1._boundingBox.Size * v)
		local v11, v12 = p1._draggerContext:worldToViewportPoint(v10.Position)
		local Magnitude = (v7 - Vector2.new(v11.X, v11.Y)).Magnitude
		if v12 and Magnitude < v8 then
			v8 = Magnitude
			v9 = v10
		end
	end
	if not v9 then
		return
	end
	p1._summonBasisOffset = p1._boundingBox.CFrame:ToObjectSpace(v9)
end
function t._endSummon(p1) --[[ _endSummon | Line: 131 ]]
	if not p1._summonBasisOffset then
		return
	end
	p1._summonBasisOffset = nil
end
function t._getBasisOffset(p1) --[[ _getBasisOffset | Line: 137 ]]
	return p1._summonBasisOffset or p1._basisOffset
end
function t.update(p1, p2, p3) --[[ update | Line: 141 | Upvalues: getEngineFeatureModelPivotVisual (copy) ]]
	if not p1._draggingHandleId then
		p1._selectionInfo = p3
		p1._schema = p2:getSchema()
		p1._selectionWrapper = p2:getSelectionWrapper()
		local v1, v2, v3 = p1._implementation:getBoundingBox(p1._selectionWrapper:get(), p1._selectionInfo)
		if getEngineFeatureModelPivotVisual() then
			p1._basisOffset = CFrame.new(-v2)
		end
		p1._boundingBox = {
			Size = v3,
			CFrame = v1 * CFrame.new(v2)
		}
	end
	p1:_updateHandles()
end
function t.shouldBiasTowardsObjects(p1) --[[ shouldBiasTowardsObjects | Line: 164 ]]
	return true
end
function t._rememberCurrentBoundsAsOriginal(p1) --[[ _rememberCurrentBoundsAsOriginal | Line: 168 | Upvalues: getFFlagSummonPivot (copy) ]]
	p1._originalBoundingBoxSize = p1._boundingBox.Size
	p1._originalBoundingBoxCFrame = p1._boundingBox.CFrame
	if getFFlagSummonPivot() then
		p1._originalBasisOffset = p1:_getBasisOffset().Position
	else
		p1._originalBasisOffset = p1._basisOffset.Position
	end
	local Axis = p1._handles[p1._draggingHandleId].Axis
	local _originalBasisOffset = p1._originalBasisOffset
	p1._perpendicularMovement = _originalBasisOffset - Axis * _originalBasisOffset:Dot(Axis)
end
function t._refreshDrag(p1) --[[ _refreshDrag | Line: 184 | Upvalues: getEngineFeatureModelPivotVisual (copy) ]]
	p1._committedDeltaSize = p1._lastDeltaSize
	p1._committedOffset = p1._lastOffset
	if getEngineFeatureModelPivotVisual() then
		p1:_rememberCurrentBoundsAsOriginal()
	else
		p1._originalBoundingBoxSize = p1._boundingBox.Size
		p1._originalBoundingBoxCFrame = p1._boundingBox.CFrame
	end
	local v1, v2 = p1:_getDistanceAlongAxis(p1._draggerContext:getMouseRay())
	p1._startDistance = if v1 and v2 then v2 else 0
end
function t._getExtrudeMode(p1) --[[ _getExtrudeMode | Line: 204 ]]
	return p1._implementation:shouldKeepAspectRatio(p1._selectionWrapper:get(), p1._selectionInfo, p1._normalId), p1._implementation:shouldScaleFromCenter(p1._selectionWrapper:get(), p1._selectionInfo, p1._normalId)
end
local function areAxesSame(p1, p2) --[[ areAxesSame | Line: 212 ]]
	return if p1 == p2 then true elseif p1 then if p2 then if not p1.X == not p2.X and not p1.Y == not p2.Y then not p1.Z == not p2.Z else false else p2 else p1
end
function t._updateExtrudeMode(p1) --[[ _updateExtrudeMode | Line: 230 ]]
	local v1 = p1._selectionWrapper:get()
	local _selectionInfo = p1._selectionInfo
	local _normalId = p1._normalId
	local v2 = p1._implementation:shouldScaleFromCenter(v1, _selectionInfo, _normalId)
	local v3 = p1._implementation:axesToScale(_selectionInfo, _normalId)
	local v4, v5 = p1._implementation:getMinMaxSizes(_selectionInfo, v3, p1._boundingBox.Size)
	p1._minimumSize = v4
	p1._maximumSize = v5
	local _lastAxesToScale = p1._lastAxesToScale
	local v7 = not (if v3 == _lastAxesToScale then true elseif v3 then if _lastAxesToScale then if not v3.X == not _lastAxesToScale.X and not v3.Y == not _lastAxesToScale.Y then if not v3.Z == not _lastAxesToScale.Z then true else false else false else _lastAxesToScale else v3)
	local v8 = if v2 == p1._lastResizeFromCenter then false else true
	p1._lastAxesToScale = v3
	p1._lastResizeFromCenter = v2
	return v7 or v8
end
function t._refreshDragIfNeeded(p1) --[[ _refreshDragIfNeeded | Line: 245 | Upvalues: getFFlagLimitScaling (copy) ]]
	if getFFlagLimitScaling() then
		local v1 = p1:_updateExtrudeMode()
		if not (v1 and p1._handles[p1._draggingHandleId]) then
			return v1
		end
		p1:_refreshDrag()
		return v1
	else
		local v2, v3 = p1:_getExtrudeMode()
		if v2 == p1._lastKeepAspectRatio and v3 == p1._lastResizeFromCenter then
			return false
		end
		if p1._handles[p1._draggingHandleId] then
			p1:_refreshDrag()
		end
		p1._lastKeepAspectRatio = v2
		p1._lastResizeFromCenter = v3
		return true
	end
end
function t.keyDown(p1, p2) --[[ keyDown | Line: 269 ]]
	return p1:_refreshDragIfNeeded()
end
function t.keyUp(p1, p2) --[[ keyUp | Line: 273 ]]
	return p1:_refreshDragIfNeeded()
end
function t.hitTest(p1, p2, p3) --[[ hitTest | Line: 277 | Upvalues: ScaleHandleView (copy) ]]
	local v1 = (1 / 0)
	local v2 = nil
	for k, v in pairs(p1._handles) do
		local v3 = ScaleHandleView.hitTest(v, p2)
		if v3 and v3 < v1 then
			v1 = v3
			v2 = k
		end
	end
	if v2 then
		return v2, 0
	end
	if p3 then
		return nil, 0
	end
	for k, v in pairs(p1._handles) do
		local v4 = ScaleHandleView.distanceFromHandle(v, p2)
		if v4 < v1 then
			v1 = v4
			v2 = k
		end
	end
	if v1 < 0 then
		return v2, 0
	else
		return nil, 0
	end
end
function t._getBoundingBoxColor(p1) --[[ _getBoundingBoxColor | Line: 311 | Upvalues: Colors (copy) ]]
	if p1._scalingLimitReachedUpper or (p1._scalingLimitReachedLower or p1._resizeWasConstrained) then
		return Colors.SizeLimitReached
	else
		return p1._draggerContext:getSelectionBoxColor()
	end
end
function t._getBoundingBoxThickness(p1) --[[ _getBoundingBoxThickness | Line: 321 ]]
	return p1._draggerContext:getHoverLineThickness()
end
function t._shouldDrawBoundingBox(p1) --[[ _shouldDrawBoundingBox | Line: 325 ]]
	return p1._scalingLimitReachedLower or (p1._scalingLimitReachedUpper or (p1._resizeWasConstrained or p1._props.ShowBoundingBox and #p1._selectionWrapper:get() > 1))
end
function t.render(p1, p2) --[[ render | Line: 332 | Upvalues: Roact (copy), ScaleHandleView (copy), Colors (copy), getFFlagLimitScaling (copy), StandaloneSelectionBox (copy), getEngineFeatureModelPivotVisual (copy), getFFlagSummonPivot (copy), DraggedPivot (copy) ]]
	local t = {}
	if p1._draggingHandleId and p1._handles[p1._draggingHandleId] then
		local v1 = p1._handles[p1._draggingHandleId]
		t[p1._draggingHandleId] = Roact.createElement(ScaleHandleView, {
			HandleCFrame = v1.HandleCFrame,
			Color = v1.Color,
			Scale = v1.Scale
		})
		for k, v in pairs(p1._handles) do
			if k ~= p1._draggingHandleId then
				t[k] = Roact.createElement(ScaleHandleView, {
					Thin = true,
					HandleCFrame = v.HandleCFrame,
					Color = Colors.makeDimmed(v.Color),
					Scale = v.Scale
				})
			end
		end
		t.ImplementationRendered = p1._implementation:render(p1._lastDeltaSize, p1._lastOffset)
	else
		for k, v in pairs(p1._handles) do
			local Color = v.Color
			local v2 = k == p2
			if not v2 then
				Color = Colors.makeDimmed(v.Color)
			end
			t[k] = Roact.createElement(ScaleHandleView, {
				HandleCFrame = v.HandleCFrame,
				Color = Color,
				Scale = v.Scale,
				Hovered = v2
			})
		end
	end
	if getFFlagLimitScaling() then
		if p1:_shouldDrawBoundingBox() then
			t.SelectionBoundingBox = Roact.createElement(StandaloneSelectionBox, {
				CFrame = p1._boundingBox.CFrame,
				Size = p1._boundingBox.Size,
				Color = p1:_getBoundingBoxColor(),
				LineThickness = p1:_getBoundingBoxThickness(),
				Container = p1._draggerContext:getGuiParent()
			})
		end
	elseif p1._props.ShowBoundingBox and #p1._selectionWrapper:get() > 1 then
		t.SelectionBoundingBox = Roact.createElement(StandaloneSelectionBox, {
			CFrame = p1._boundingBox.CFrame,
			Size = p1._boundingBox.Size,
			Color = p1._draggerContext:getSelectionBoxColor(),
			LineThickness = p1._draggerContext:getHoverLineThickness(),
			Container = p1._draggerContext:getGuiParent()
		})
	end
	if getEngineFeatureModelPivotVisual() and (getFFlagSummonPivot() and (p1._props.Summonable and p1._summonBasisOffset)) then
		local t2 = {
			DraggerContext = p1._draggerContext,
			CFrame = p1._boundingBox.CFrame * p1:_getBasisOffset()
		}
		t2.IsActive = p1._draggerContext:shouldShowActiveInstanceHighlight() and #p1._selectionWrapper:get() == 1
		t.SummonedPivot = Roact.createElement(DraggedPivot, t2)
	end
	return Roact.createElement("Folder", {}, t)
end
function t.mouseDown(p1, p2, p3) --[[ mouseDown | Line: 408 | Upvalues: getEngineFeatureModelPivotVisual (copy), getFFlagLimitScaling (copy), getFFlagFixDraggerMovingInWrongDirection (copy) ]]
	p1._draggingHandleId = p3
	if not p1._handles[p3] then
		return
	end
	p1._normalId = p1._handles[p3].NormalId
	p1._handleCFrame = p1._handles[p3].HandleCFrame
	if getEngineFeatureModelPivotVisual() then
		p1:_rememberCurrentBoundsAsOriginal()
	else
		p1._originalBoundingBoxCFrame = p1._boundingBox.CFrame
		p1._originalBoundingBoxSize = p1._boundingBox.Size
	end
	if getFFlagLimitScaling() then
		p1:_updateExtrudeMode()
	else
		local v1, v2 = p1:_getExtrudeMode()
		p1._lastKeepAspectRatio = v1
		p1._lastResizeFromCenter = v2
		p1._minimumSize = p1._implementation:getMinimumSize(p1._selectionWrapper:get(), p1._selectionInfo, p1._normalId)
	end
	local v3, v4 = p1:_getDistanceAlongAxis(p2)
	if getFFlagFixDraggerMovingInWrongDirection() then
		p1._startDistance = if v3 and v4 then v4 else 0
	else
		assert(v3)
		p1._startDistance = v4
	end
	p1._committedDeltaSize = Vector3.new()
	p1._committedOffset = Vector3.new()
	p1._lastDeltaSize = Vector3.new()
	p1._lastOffset = Vector3.new()
	p1._implementation:beginScale(p1._selectionWrapper:get(), p1._selectionInfo, p1._normalId)
end
local function computeDeltaSize(p1, p2, p3, p4) --[[ computeDeltaSize | Line: 454 ]]
	local t = { p1.X, p1.Y, p1.Z }
	local t2 = {
		0,
		0,
		0,
		[p3] = p2
	}
	if p4 then
		local v1 = p2 / t[p3]
		t2[p3 % 3 + 1] = t[p3 % 3 + 1] * v1
		t2[(p3 % 3 + 1) % 3 + 1] = t[(p3 % 3 + 1) % 3 + 1] * v1
	end
	return Vector3.new(unpack(t2))
end
local function clampWithStep(p1, p2, p3, p4) --[[ clampWithStep | Line: 470 ]]
	if p1 < p2 then
		if p4 > 0 then
			return p2 + (p4 - (p2 - p1) % p4)
		else
			return p2
		end
	else
		if not (p3 < p1) then
			return p1
		end
		if p4 > 0 then
			return p3 - (p4 - (p1 - p3) % p4)
		else
			return p3
		end
	end
end
local function computeDeltaSizeMultiaxis(p1, p2, p3, p4, p5, p6, p7) --[[ computeDeltaSizeMultiaxis | Line: 487 | Upvalues: Math (copy) ]]
	if p5 < 0.01 then
		p5 = 0
	end
	local v1 = Math.vectorToArray(p1)
	local v2 = Math.vectorToArray(p6 - p1)
	local v3 = Math.vectorToArray(p7 - p1)
	local v4 = v2[p3]
	local v5 = v3[p3]
	local v6 = if p2 < v4 then if p5 > 0 then v4 + (p5 - (v4 - p2) % p5) else v4 elseif v5 < p2 then if p5 > 0 then v5 - (p5 - (p2 - v5) % p5) else v5 else p2
	return p1 * Math.setToVector3(p4) * (v6 / v1[p3]), v6
end
local function maxComponent(p1) --[[ maxComponent | Line: 500 ]]
	return math.max(math.abs(p1.X), math.abs(p1.Y), (math.abs(p1.Z)))
end
function t.mouseDrag(p1, p2) --[[ mouseDrag | Line: 504 | Upvalues: getEngineFeatureModelPivotVisual (copy), getFFlagSummonPivot (copy), getFFlagLimitScaling (copy), Math (copy), computeDeltaSizeMultiaxis (copy), computeDeltaSize (copy) ]]
	if not p1._draggingHandleId then
		return
	end
	if not p1._handles[p1._draggingHandleId] then
		return
	end
	p1:_refreshDragIfNeeded()
	local v1, v2 = p1:_getDistanceAlongAxis(p2)
	if not v1 then
		return
	end
	local v4 = p1._draggerContext:snapToGridSize(v2 - p1._startDistance)
	local v5 = p1._handles[p1._draggingHandleId]
	local NormalId = v5.NormalId
	local Axis = v5.Axis
	local sum
	if p1._lastResizeFromCenter then
		v4, sum = v4 * 2, Vector3.new()
	else
		sum = Axis * 0.5 * v4
	end
	if getEngineFeatureModelPivotVisual() then
		local v7 = v4 / ({ p1._originalBoundingBoxSize.X, p1._originalBoundingBoxSize.Y, p1._originalBoundingBoxSize.Z })[NormalId]
		if getFFlagSummonPivot() then
			if getFFlagLimitScaling() then
				sum = sum - p1._perpendicularMovement * (v7 * Math.setToVector3(p1._lastAxesToScale))
			elseif p1._lastKeepAspectRatio then
				sum = sum - p1._perpendicularMovement * v7
			end
		else
			sum = sum - p1._perpendicularMovement * v7
		end
	end
	local _originalBoundingBoxSize = p1._originalBoundingBoxSize
	local v9
	if getFFlagLimitScaling() then
		local v10, v11 = computeDeltaSizeMultiaxis(_originalBoundingBoxSize, v4, NormalId, p1._lastAxesToScale, p1._draggerContext:getGridSize(), p1._minimumSize, p1._maximumSize)
		local v12
		if v4 == 0 then
			v12 = v11
		else
			v12, sum = v11, sum * (v11 / v4)
		end
		local v13
		v9 = v10
		v13 = if v4 - v12 > 0 then true else false
		p1._scalingLimitReachedUpper = v13
		p1._scalingLimitReachedLower = if v12 - v4 > 0 then true else false
	else
		local v15 = computeDeltaSize(_originalBoundingBoxSize, v4, NormalId, p1._lastKeepAspectRatio)
		local v16 = _originalBoundingBoxSize + v15
		local v17 = p1._minimumSize:Max(v16)
		if v16 == v17 then
			v9 = v15
		else
			if p1._lastKeepAspectRatio then
				return
			end
			local v18 = v17 - p1._originalBoundingBoxSize
			local v22 = math.max(math.abs(v15.X), math.abs(v15.Y), (math.abs(v15.Z)))
			v9, sum = v18, sum * (v22 > 0 and math.max(math.abs(v18.X), math.abs(v18.Y), (math.abs(v18.Z))) / v22 or 0)
		end
	end
	local v27 = v9 + p1._committedDeltaSize
	local v28 = sum + p1._committedOffset
	if v27:FuzzyEq((Vector3.new())) then
		v27 = Vector3.new()
	end
	if v28:FuzzyEq((Vector3.new())) then
		v28 = Vector3.new()
	end
	local v31, v32 = p1._implementation:updateScale(v27, v28)
	p1._lastDeltaSize = v31
	p1._lastOffset = v32
	p1._resizeWasConstrained = if v27 == p1._lastDeltaSize then false else true
	p1._boundingBox.CFrame = p1._originalBoundingBoxCFrame * CFrame.new(p1._lastOffset - p1._committedOffset)
	p1._boundingBox.Size = _originalBoundingBoxSize + (p1._lastDeltaSize - p1._committedDeltaSize)
	if not getEngineFeatureModelPivotVisual() then
		return
	end
	if getFFlagSummonPivot() and p1._summonBasisOffset then
		p1._summonBasisOffset = CFrame.new(p1._originalBasisOffset / p1._originalBoundingBoxSize * p1._boundingBox.Size)
		return
	end
	p1._basisOffset = CFrame.new(p1._originalBasisOffset / p1._originalBoundingBoxSize * p1._boundingBox.Size)
end
function t.mouseUp(p1, p2) --[[ mouseUp | Line: 623 | Upvalues: getFFlagSummonPivot (copy) ]]
	if p1._handles[p1._draggingHandleId] then
		p1._implementation:endScale()
	end
	p1._draggingHandleId = nil
	p1._scalingLimitReachedUpper = false
	p1._scalingLimitReachedLower = false
	p1._resizeWasConstrained = false
	if getFFlagSummonPivot() and not p1._tabKeyDown then
		p1:_endSummon()
	end
	p1._schema.addUndoWaypoint(p1._draggerContext, "Scale Selection")
end
function t._getDistanceAlongAxis(p1, p2) --[[ _getDistanceAlongAxis | Line: 639 | Upvalues: getFFlagFixDraggerMovingInWrongDirection (copy), getEngineFeatureModelPivotVisual (copy), computeDraggedDistance (copy), Math (copy) ]]
	if getFFlagFixDraggerMovingInWrongDirection() then
		local _originalBoundingBoxCFrame = p1._originalBoundingBoxCFrame
		if getEngineFeatureModelPivotVisual() then
			_originalBoundingBoxCFrame = _originalBoundingBoxCFrame * CFrame.new(p1._originalBasisOffset)
		end
		return computeDraggedDistance(_originalBoundingBoxCFrame.Position, p1._handleCFrame.LookVector, p2)
	else
		local LookVector = p1._handleCFrame.LookVector
		if getEngineFeatureModelPivotVisual() then
			return Math.intersectRayRay((p1._originalBoundingBoxCFrame * CFrame.new(p1._originalBasisOffset)).Position, LookVector, p2.Origin, p2.Direction.Unit)
		else
			return Math.intersectRayRay(p1._originalBoundingBoxCFrame.Position, LookVector, p2.Origin, p2.Direction.Unit)
		end
	end
end
function t._updateHandles(p1) --[[ _updateHandles | Line: 661 | Upvalues: t3 (copy), getEngineFeatureModelPivotVisual (copy), getFFlagSummonPivot (copy) ]]
	if p1._selectionInfo:isEmpty() or p1._boundingBox.Size:FuzzyEq((Vector3.new())) then
		p1._handles = {}
	else
		for k, v in pairs(t3) do
			local v1
			local Offset = v.Offset
			if getEngineFeatureModelPivotVisual() then
				local v2 = Offset:Inverse()
				local Z = v2:VectorToWorldSpace(p1._boundingBox.Size).Z
				local v3 = math.abs(Z) * 0.5
				v1 = if getFFlagSummonPivot() then v2:VectorToWorldSpace(p1:_getBasisOffset().Position) else v2:VectorToWorldSpace(p1._basisOffset.Position)
				local v6 = p1._boundingBox.CFrame * Offset * CFrame.new(v1.X, v1.Y, -v3)
				local v7 = false
				local v8 = false
				if not p1._lastKeepAspectRatio and p1._selectionInfo:isRoad() then
					if p1._selectionInfo:isIntersection() then
						v8 = true
					else
						v7 = true
					end
				end
				if v.HideWhenRoad and v7 then
					p1._handles[k] = nil
				else
					if v.HideWhenIntersection and v8 then
						p1._handles[k] = nil
						continue
					end
					p1._handles[k] = {
						Color = v.Color,
						Axis = Offset.LookVector,
						HandleCFrame = v6,
						NormalId = v.NormalId,
						Scale = p1._draggerContext:getHandleScale(v6.Position)
					}
				end
				continue
			end
			local Z = Offset:Inverse():VectorToWorldSpace(p1._boundingBox.Size).Z
			local v10 = p1._boundingBox.CFrame * Offset * CFrame.new(0, 0, -(math.abs(Z) * 0.5))
			p1._handles[k] = {
				Color = v.Color,
				Axis = Offset.LookVector,
				HandleCFrame = v10,
				NormalId = v.NormalId,
				Scale = p1._draggerContext:getHandleScale(v10.Position)
			}
		end
	end
end
if getEngineFeatureModelPivotVisual() and getFFlagSummonPivot() then
	function t.keyDown(p1, p2) --[[ keyDown | Line: 723 ]]
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
	function t.keyUp(p1, p2) --[[ keyUp | Line: 734 ]]
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