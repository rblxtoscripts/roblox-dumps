-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Parent.Packages.Roact)
local Colors = require(v1.Utility.Colors)
local Math = require(v1.Utility.Math)
local StandaloneSelectionBox = require(v1.Components.StandaloneSelectionBox)
local roundRotation = require(v1.Utility.roundRotation)
local snapRotationToPrimaryDirection = require(v1.Utility.snapRotationToPrimaryDirection)
local RotateHandleView = require(v1.Components.RotateHandleView)
local SummonHandlesNote = require(v1.Components.SummonHandlesNote)
local SummonHandlesHider = require(v1.Components.SummonHandlesHider)
local DraggedPivot = require(v1.Components.DraggedPivot)
local getEngineFeatureModelPivotVisual = require(v1.Flags.getEngineFeatureModelPivotVisual)
local getFFlagSummonPivot = require(v1.Flags.getFFlagSummonPivot)
local t = {}
t.__index = t
local t2 = {
	XAxis = {
		RadiusOffset = 0,
		HideWhenTempPart = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1)),
		Color = Colors.X_AXIS
	},
	YAxis = {
		RadiusOffset = 0.01,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0)),
		Color = Colors.Y_AXIS
	},
	ZAxis = {
		RadiusOffset = 0.02,
		HideWhenTempPart = true,
		Offset = CFrame.fromMatrix(Vector3.new(), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)),
		Color = Colors.Z_AXIS
	}
}
local function isRightAngle(p1) --[[ isRightAngle | Line: 59 ]]
	return math.abs(math.floor(p1 / 1.5707963267948966 + 0.5) * 1.5707963267948966 - p1) < 0.001
end
local function getRotationTransform(p1, p2, p3, p4) --[[ getRotationTransform | Line: 64 | Upvalues: roundRotation (copy) ]]
	local v2 = CFrame.fromAxisAngle(p1:VectorToObjectSpace(p2), p3)
	if p4 > 0 and math.abs(math.floor(p3 / 1.5707963267948966 + 0.5) * 1.5707963267948966 - p3) < 0.001 then
		v2 = roundRotation(v2)
	end
	return p1 * v2 * p1:Inverse()
end
local function rotationAngleFromRay(p1, p2) --[[ rotationAngleFromRay | Line: 87 | Upvalues: Math (copy) ]]
	local v1 = Math.intersectRayPlane(p2.Origin, p2.Direction, p1.Position, p1.RightVector)
	if not (v1 >= 0) then
		return nil
	end
	local Unit = (p2.Origin + p2.Direction * v1 - p1.Position).Unit
	local v2 = p1.LookVector:Dot(Unit)
	local v4 = math.atan2(p1.UpVector:Dot(Unit), v2)
	if v4 < 0 then
		return 6.283185307179586 + v4
	else
		return v4
	end
end
local function snapToRotateIncrementIfNeeded(p1, p2) --[[ snapToRotateIncrementIfNeeded | Line: 107 ]]
	if not (p2 > 0) then
		return p1
	end
	local v1 = math.rad(p2)
	local v2 = math.floor(p1 / v1 + 0.5) * v1
	if math.abs(p1 - 6.283185307179586) < math.abs(p1 - v2) then
		return 0
	else
		return v2
	end
end
function t.new(p1, p2, p3) --[[ new | Line: 127 | Upvalues: t (copy) ]]
	local t2 = {
		_draggerContext = p1,
		_handles = {}
	}
	t2._props = if p2 then p2 else {
	Summonable = true
}
	t2._implementation = p3
	t2._tabKeyDown = false
	return setmetatable(t2, t)
end
function t._summonHandles(p1) --[[ _summonHandles | Line: 140 | Upvalues: snapRotationToPrimaryDirection (copy) ]]
	if not p1._props.Summonable then
		return false
	end
	local v1 = p1._draggerContext:getMouseRay()
	local _, v2, v3 = p1._schema.getMouseTarget(p1._draggerContext, v1, {})
	if not v2 then
		return
	end
	local v4 = v1.Origin + v1.Direction.Unit * v3
	p1._summonBasisOffset = CFrame.new(p1._boundingBox.CFrame:PointToObjectSpace(v4))
	if not p1._implementation.findSummonSnap then
		return
	end
	local v5, v6 = p1._implementation:findSummonSnap(v4, v2)
	if not v5 then
		return
	end
	local v7 = p1._boundingBox.CFrame:ToObjectSpace(v5)
	p1._summonBasisOffset = v7 * snapRotationToPrimaryDirection(v7:Inverse() * p1._summonBasisOffset)
	p1._summonWasSnapped = true
	p1._summonWasSnappedToSurface = v6
end
function t._endSummon(p1) --[[ _endSummon | Line: 165 ]]
	if not p1._summonBasisOffset then
		return
	end
	p1._summonBasisOffset = nil
	p1._summonWasSnapped = false
	p1._summonWasSnappedToSurface = false
end
function t._getBasisOffset(p1) --[[ _getBasisOffset | Line: 173 ]]
	return p1._summonBasisOffset or p1._basisOffset
end
function t.update(p1, p2, p3) --[[ update | Line: 177 | Upvalues: getFFlagSummonPivot (copy), getEngineFeatureModelPivotVisual (copy) ]]
	if not p1._draggingHandleId then
		if getFFlagSummonPivot() and not p1._tabKeyDown then
			p1:_endSummon()
		end
		local v1, v2, v3 = p3:getBoundingBox()
		p1._boundingBox = {
			Size = v3,
			CFrame = v1 * CFrame.new(v2)
		}
		p1._basisOffset = CFrame.new(-v2)
		p1._selectionInfo = p3
		p1._selectionWrapper = p2:getSelectionWrapper()
		p1._schema = p2:getSchema()
		if getEngineFeatureModelPivotVisual() then
			if getFFlagSummonPivot() then
				p1._scale = p1._draggerContext:getHandleScale((p1._boundingBox.CFrame * p1:_getBasisOffset()).Position)
			else
				p1._scale = p1._draggerContext:getHandleScale(v1.Position)
			end
		else
			p1._scale = p1._draggerContext:getHandleScale(p1._boundingBox.CFrame.Position)
		end
	end
	p1:_updateHandles()
end
function t.shouldBiasTowardsObjects(p1) --[[ shouldBiasTowardsObjects | Line: 205 ]]
	return false
end
function t.hitTest(p1, p2, p3) --[[ hitTest | Line: 209 | Upvalues: RotateHandleView (copy) ]]
	local v1 = (1 / 0)
	local v2 = nil
	for k, v in pairs(p1._handles) do
		local v3 = RotateHandleView.hitTest(v, p2)
		if v3 and v3 < v1 then
			v1 = v3
			v2 = k
		end
	end
	return v2, v1, true
end
function t.render(p1, p2) --[[ render | Line: 223 | Upvalues: Roact (copy), RotateHandleView (copy), t2 (copy), Colors (copy), getFFlagSummonPivot (copy), StandaloneSelectionBox (copy), getEngineFeatureModelPivotVisual (copy), Workspace (copy), DraggedPivot (copy), SummonHandlesHider (copy), SummonHandlesNote (copy) ]]
	local t = {}
	local v1 = p1._draggerContext:getRotateIncrement()
	local v2 = if v1 >= 5 then math.rad(v1) else nil
	if p1._draggingHandleId and p1._handles[p1._draggingHandleId] then
		local v4 = p1._handles[p1._draggingHandleId]
		t[p1._draggingHandleId] = Roact.createElement(RotateHandleView, {
			Hovered = false,
			HandleCFrame = v4.HandleCFrame,
			Color = v4.Color,
			StartAngle = p1._startAngle - p1._draggingLastGoodDelta,
			EndAngle = p1._startAngle,
			Scale = p1._scale,
			RadiusOffset = v4.RadiusOffset,
			TickAngle = v2
		})
		for k, v in pairs(p1._handles) do
			if k ~= p1._draggingHandleId then
				t[k] = Roact.createElement(RotateHandleView, {
					Thin = true,
					HandleCFrame = p1._boundingBox.CFrame * t2[k].Offset,
					Color = Colors.makeDimmed(v.Color),
					Scale = p1._scale,
					RadiusOffset = v4.RadiusOffset
				})
			end
		end
		if getFFlagSummonPivot() then
			t.ImplementationRendered = p1._implementation:render(p1._lastGlobalTransformForRender)
		else
			t.ImplementationRendered = p1._implementation:render(p1._boundingBox.CFrame * p1._basisOffset)
		end
	else
		for k, v in pairs(p1._handles) do
			local Color = v.Color
			local v5 = if k == p2 then true else false
			local v6 = nil
			if v5 then
				v6 = v2
			else
				Color = Colors.makeDimmed(Color)
			end
			t[k] = Roact.createElement(RotateHandleView, {
				HandleCFrame = v.HandleCFrame,
				Color = Color,
				Scale = p1._scale,
				Hovered = v5,
				RadiusOffset = v.RadiusOffset,
				TickAngle = v6
			})
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
			if p1._summonWasSnapped then
				local t3 = {
					ZIndex = 0,
					Adornee = Workspace.Terrain,
					Color3 = p1._draggerContext:getGeometrySnapColor(),
					CFrame = p1._boundingBox.CFrame * p1._summonBasisOffset,
					Size = Vector3.new(0.5, 0.5, 0.5) * p1._scale,
					AlwaysOnTop = not p1._summonWasSnappedToSurface
				}
				t3.Transparency = if p1._summonWasSnappedToSurface then 0 else 0.5
				t.SummonSnap = Roact.createElement("BoxHandleAdornment", t3)
			else
				local t3 = {
					DraggerContext = p1._draggerContext,
					CFrame = p1._boundingBox.CFrame * p1:_getBasisOffset()
				}
				t3.IsActive = p1._draggerContext:shouldShowActiveInstanceHighlight() and (if #p1._selectionWrapper:get() == 1 then true else false)
				t.SummonedPivot = Roact.createElement(DraggedPivot, t3)
			end
		end
		if not p1._draggingHandleId then
			if p1._summonBasisOffset then
				t.SummonHandlesHider = Roact.createElement(SummonHandlesHider, {
					DraggerContext = p1._draggerContext
				})
			elseif not SummonHandlesHider.hasSeenEnough(p1._draggerContext) then
				local v12, v13 = p1._draggerContext:worldToViewportPoint((p1._boundingBox.CFrame * p1._basisOffset).Position)
				if v12.Z > 0 then
					t.SummonHandlesNote = Roact.createElement(SummonHandlesNote, {
						Position = Vector2.new(v12.X, v12.Y),
						InView = v13,
						DraggerContext = p1._draggerContext
					})
				end
			end
		end
	end
	return Roact.createElement("Folder", {}, t)
end
function t.mouseDown(p1, p2, p3) --[[ mouseDown | Line: 341 | Upvalues: getEngineFeatureModelPivotVisual (copy), t2 (copy), rotationAngleFromRay (copy) ]]
	if not p1._handles[p3] then
		return
	end
	local v1 = if getEngineFeatureModelPivotVisual() then p1._handles[p3].HandleCFrame else p1._boundingBox.CFrame * t2[p3].Offset
	local v2 = rotationAngleFromRay(v1, p2.Unit)
	if not v2 then
		return
	end
	p1._draggingHandleId = p3
	p1._handleCFrame = v1
	p1._lastGlobalTransformForRender = CFrame.new()
	p1._draggingLastGoodDelta = 0
	p1._originalBoundingBoxCFrame = p1._boundingBox.CFrame
	local v3 = p1._draggerContext:getRotateIncrement()
	local v4
	if v3 > 0 then
		local v5 = math.rad(v3)
		local v6 = math.floor(v2 / v5 + 0.5) * v5
		v4 = if math.abs(v2 - 6.283185307179586) < math.abs(v2 - v6) then 0 else v6
	else
		v4 = v2
	end
	p1._startAngle = v4
	p1._implementation:beginDrag(p1._selectionWrapper:get(), p1._selectionInfo)
end
function t.mouseDrag(p1, p2) --[[ mouseDrag | Line: 374 | Upvalues: rotationAngleFromRay (copy), getRotationTransform (copy), getEngineFeatureModelPivotVisual (copy) ]]
	if not p1._handles[p1._draggingHandleId] then
		return
	end
	local v1 = rotationAngleFromRay(p1._handleCFrame, p2.Unit)
	if not v1 then
		return
	end
	local v2 = p1._draggerContext:getRotateIncrement()
	local v3
	if v2 > 0 then
		local v4 = math.rad(v2)
		local v5 = math.floor(v1 / v4 + 0.5) * v4
		v3 = if math.abs(v1 - 6.283185307179586) < math.abs(v1 - v5) then 0 else v5
	else
		v3 = v1
	end
	local v10 = p1._implementation:updateDrag((getRotationTransform(getEngineFeatureModelPivotVisual() and p1._handleCFrame or p1._originalBoundingBoxCFrame, p1._handleCFrame.RightVector, v3 - p1._startAngle, p1._draggerContext:getRotateIncrement())))
	p1._boundingBox.CFrame = v10 * p1._originalBoundingBoxCFrame
	p1._lastGlobalTransformForRender = v10
	local v11 = v10:VectorToObjectSpace(p1._handleCFrame.LookVector)
	p1._draggingLastGoodDelta = -math.atan2(p1._handleCFrame.UpVector:Dot(v11), (p1._handleCFrame.LookVector:Dot(v11)))
end
function t.mouseUp(p1, p2) --[[ mouseUp | Line: 409 | Upvalues: getFFlagSummonPivot (copy) ]]
	if not p1._draggingHandleId then
		return
	end
	if getFFlagSummonPivot() and not p1._tabKeyDown then
		p1:_endSummon()
	end
	p1._draggingHandleId = nil
	local v1 = p1._implementation:endDrag()
	p1._schema.addUndoWaypoint(p1._draggerContext, "Axis Rotate Selection")
	return v1
end
function t._updateHandles(p1) --[[ _updateHandles | Line: 424 | Upvalues: t2 (copy), getEngineFeatureModelPivotVisual (copy) ]]
	if p1._selectionInfo:isEmpty() then
		p1._handles = {}
		return
	end
	for k, v in pairs(t2) do
		local HideWhenTempPart = v.HideWhenTempPart
		local t = {}
		t.HandleCFrame = getEngineFeatureModelPivotVisual() and p1._boundingBox.CFrame * p1:_getBasisOffset() * v.Offset or p1._boundingBox.CFrame * v.Offset
		t.Color = v.Color
		t.RadiusOffset = v.RadiusOffset
		t.Scale = p1._scale
		p1._handles[k] = t
	end
end
if getEngineFeatureModelPivotVisual() and getFFlagSummonPivot() then
	function t.keyDown(p1, p2) --[[ keyDown | Line: 446 ]]
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
	function t.keyUp(p1, p2) --[[ keyUp | Line: 457 ]]
		if p2 ~= Enum.KeyCode.Tab then
			return false
		end
		p1._tabKeyDown = false
		if p1._draggingHandleId then
			return false
		else
			p1:_endSummon()
			return true
		end
	end
end
return t