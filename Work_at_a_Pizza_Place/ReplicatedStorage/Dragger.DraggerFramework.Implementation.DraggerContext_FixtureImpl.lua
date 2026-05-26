-- https://lua.expert/
local StudioService = game:GetService("StudioService")
local ChangeHistoryService = game:GetService("ChangeHistoryService")
local v1 = script.Parent.Parent
local Colors = require(v1.Utility.Colors)
local MockAnalytics = require(v1.Utility.MockAnalytics)
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 26 | Upvalues: t (copy) ]]
	assert(if p2 == nil then false else true)
	return setmetatable({
		_useLocalSpace = false,
		_areCollisionsEnabled = true,
		_areConstraintsEnabled = false,
		_areConstraintDetailsShown = false,
		_drawConstraintsOnTop = false,
		_shouldJoinSurfaces = true,
		_cameraSize = 10,
		_mouseIcon = "",
		_isSimulating = false,
		_gridSize = 1,
		_rotateIncrement = 0.5235987755982988,
		_isAltDown = false,
		_isCtrlDown = false,
		_isShiftDown = false,
		_guiTarget = p1,
		_mouseLocation = Vector2.new(),
		_mouseUnitRay = Ray.new(Vector3.new(), (Vector3.new())),
		_cameraCFrame = CFrame.new(),
		_selection = p2,
		_undoWaypoints = {},
		_settingValues = {}
	}, t)
end
function t.getGuiParent(p1) --[[ getGuiParent | Line: 54 ]]
	return p1._guiTarget
end
function t.setHoverInstance(p1, p2) --[[ setHoverInstance | Line: 58 ]]
	p1._hoverInstance = p2
end
function t.expectHoverInstance(p1, p2) --[[ expectHoverInstance | Line: 62 ]]
	if p1._hoverInstance == p2 then
		return
	end
	local v1 = if p2 then p2:GetFullName() or "nil" else "nil"
	error("Wrong hover instance,\n    Expected: " .. v1 .. "\n    Got: " .. (p1._hoverInstance and p1._hoverInstance:GetFullName() or "nil"))
end
function t.shouldUseLocalSpace(p1) --[[ shouldUseLocalSpace | Line: 70 ]]
	return p1._useLocalSpace
end
function t.setUseLocalSpace(p1, p2) --[[ setUseLocalSpace | Line: 74 ]]
	p1._useLocalSpace = p2
end
function t.areCollisionsEnabled(p1) --[[ areCollisionsEnabled | Line: 78 ]]
	return p1._areCollisionsEnabled
end
function t.setCollisionsEnabled(p1, p2) --[[ setCollisionsEnabled | Line: 82 ]]
	p1._areCollisionsEnabled = p2
end
function t.areConstraintsEnabled(p1) --[[ areConstraintsEnabled | Line: 86 ]]
	return p1._areConstraintsEnabled
end
function t.setConstraintsEnabled(p1, p2) --[[ setConstraintsEnabled | Line: 90 ]]
	p1._areConstraintsEnabled = p2
end
function t.areConstraintDetailsShown(p1) --[[ areConstraintDetailsShown | Line: 94 ]]
	return p1._areConstraintDetailsShown
end
function t.setConstraintDetailsShown(p1, p2) --[[ setConstraintDetailsShown | Line: 98 ]]
	p1._areConstraintDetailsShown = p2
end
function t.shouldDrawConstraintsOnTop(p1) --[[ shouldDrawConstraintsOnTop | Line: 102 ]]
	return p1._drawConstraintsOnTop
end
function t.setDrawConstraintsOnTop(p1, p2) --[[ setDrawConstraintsOnTop | Line: 106 ]]
	p1._drawConstraintsOnTop = p2
end
function t.shouldJoinSurfaces(p1) --[[ shouldJoinSurfaces | Line: 110 ]]
	return p1._shouldJoinSurfaces
end
function t.setJoinSurfaces(p1, p2) --[[ setJoinSurfaces | Line: 114 ]]
	assert(if typeof(p2) == "boolean" then true else false)
	p1._shouldJoinSurfaces = p2
end
function t.shouldShowHover(p1) --[[ shouldShowHover | Line: 119 ]]
	return true
end
function t.shouldAnimateHover(p1) --[[ shouldAnimateHover | Line: 123 ]]
	return true
end
function t.shouldSelectScopeByDefault(p1) --[[ shouldSelectScopeByDefault | Line: 127 ]]
	return true
end
function t.getHoverAnimationSpeedInSeconds(p1) --[[ getHoverAnimationSpeedInSeconds | Line: 131 ]]
	return 0.5
end
function t.getHoverBoxColor(p1, p2) --[[ getHoverBoxColor | Line: 135 ]]
	return Color3.new()
end
function t.getHoverLineThickness(p1) --[[ getHoverLineThickness | Line: 139 ]]
	return 0.04
end
function t.getSelectionBoxColor(p1, p2) --[[ getSelectionBoxColor | Line: 143 ]]
	return Color3.new()
end
function t.getGeometrySnapColor(p1) --[[ getGeometrySnapColor | Line: 147 ]]
	return Color3.new()
end
function t.getCameraCFrame(p1) --[[ getCameraCFrame | Line: 151 ]]
	return p1._cameraCFrame
end
function t.setCamera(p1, p2, p3) --[[ setCamera | Line: 155 ]]
	p1._cameraCFrame = p2
	p1._cameraSize = p3 or 10
end
function t.getHandleScale(p1, p2) --[[ getHandleScale | Line: 160 ]]
	return 1
end
function t.getMouseUnitRay(p1) --[[ getMouseUnitRay | Line: 164 ]]
	return p1:viewportPointToRay(p1._mouseLocation)
end
function t.getMouseRay(p1) --[[ getMouseRay | Line: 168 ]]
	local v1 = p1:getMouseUnitRay()
	return Ray.new(v1.Origin, v1.Direction * 10000)
end
function t.getMouseLocation(p1) --[[ getMouseLocation | Line: 173 ]]
	return p1._mouseLocation
end
function t.setMouseLocation(p1, p2) --[[ setMouseLocation | Line: 177 ]]
	p1._mouseLocation = p2
end
function t.viewportPointToRay(p1, p2) --[[ viewportPointToRay | Line: 181 ]]
	return Ray.new(p1._cameraCFrame:PointToWorldSpace((Vector3.new((p2.X / 1000 - 0.5) * p1._cameraSize, (p2.Y / 1000 - 0.5) * p1._cameraSize, 0))), p1._cameraCFrame.LookVector)
end
function t.worldToViewportPoint(p1, p2) --[[ worldToViewportPoint | Line: 188 ]]
	local v1 = p1._cameraCFrame:Inverse() * p2
	local v2 = (v1.X / p1._cameraSize + 0.5) * 1000
	local v3 = (v1.Y / p1._cameraSize + 0.5) * 1000
	local v4 = if v2 >= 0 and (v2 <= 1000 and (v3 >= 0 and v3 <= 1000)) then if v1.Z < 0 then true else false else false
	return Vector2.new(v2, v3), v4
end
function t.getViewportSize(p1) --[[ getViewportSize | Line: 199 ]]
	return Vector2.new(1000, 1000)
end
function t.setMouseIcon(p1, p2) --[[ setMouseIcon | Line: 203 ]]
	p1._mouseIcon = p2
end
function t.expectMouseIcon(p1, p2) --[[ expectMouseIcon | Line: 207 ]]
	if p1._mouseIcon == p2 then
		return
	end
	error("Wrong mouse icon,\n    Expected: " .. (p2 or "nil") .. "\n    Got: " .. (p1._mouseIcon or "nil"))
end
function t.getSelection(p1) --[[ getSelection | Line: 215 ]]
	return p1._selection
end
function t.isSimulating(p1) --[[ isSimulating | Line: 221 ]]
	return p1._isSimulating
end
function t.setSimulating(p1, p2) --[[ setSimulating | Line: 225 ]]
	p1._isSimulating = p2
end
function t.isAltKeyDown(p1) --[[ isAltKeyDown | Line: 229 ]]
	return p1._isAltDown
end
function t.isCtrlKeyDown(p1) --[[ isCtrlKeyDown | Line: 233 ]]
	return p1._isCtrlDown
end
function t.isShiftKeyDown(p1) --[[ isShiftKeyDown | Line: 237 ]]
	return p1._isShiftDown
end
function t.shouldExtendSelection(p1) --[[ shouldExtendSelection | Line: 241 ]]
	return p1:isCtrlKeyDown() or p1:isShiftKeyDown()
end
function t.setCtrlAltShift(p1, p2, p3, p4) --[[ setCtrlAltShift | Line: 245 ]]
	p1._isCtrlDown = p2
	p1._isAltDown = p3
	p1._isShiftDown = p4
end
function t.getGridSize(p1) --[[ getGridSize | Line: 251 ]]
	return p1._gridSize
end
function t.snapToGridSize(p1, p2) --[[ snapToGridSize | Line: 255 ]]
	if p1._gridSize > 0 then
		return math.floor(p2 / p1._gridSize + 0.5) * p1._gridSize
	else
		return p2
	end
end
function t.getRotateIncrement(p1) --[[ getRotateIncrement | Line: 265 ]]
	return p1._rotateIncrement
end
function t.setGridSize(p1, p2) --[[ setGridSize | Line: 269 ]]
	p1._gridSize = math.max(p2, 0.001)
end
function t.setRotateIncrement(p1, p2) --[[ setRotateIncrement | Line: 273 ]]
	p1._rotateIncrement = p2
end
function t.getAnalytics(p1) --[[ getAnalytics | Line: 277 | Upvalues: MockAnalytics (copy) ]]
	return MockAnalytics
end
function t.gizmoRaycast(p1, p2, p3, p4) --[[ gizmoRaycast | Line: 281 | Upvalues: StudioService (copy) ]]
	return StudioService:GizmoRaycast(p2, p3, p4)
end
function t.setInsertPoint(p1, p2) --[[ setInsertPoint | Line: 285 ]]
	p1._insertPoint = p2
end
function t.expectInsertPoint(p1, p2) --[[ expectInsertPoint | Line: 289 ]]
	if p1._insertPoint == p2 then
		return
	end
	local v1 = tostring(p2)
	error("Wrong insert point,\n    Expected: " .. v1 .. "\n    Got: " .. tostring(p1._insertPoint))
end
function t.shouldShowActiveInstanceHighlight(p1) --[[ shouldShowActiveInstanceHighlight | Line: 297 ]]
	return true
end
function t.shouldAlignDraggedObjects(p1) --[[ shouldAlignDraggedObjects | Line: 301 ]]
	return true
end
function t.addUndoWaypoint(p1, p2, p3) --[[ addUndoWaypoint | Line: 305 | Upvalues: ChangeHistoryService (copy) ]]
	if ChangeHistoryService then
		ChangeHistoryService:SetWaypoint(p2)
	end
	table.insert(p1._undoWaypoints, p2)
	while #p1._undoWaypoints > 20 do
		table.remove(p1._undoWaypoints, 1)
	end
end
function t.expectMostRecentUndoWaypoint(p1, p2) --[[ expectMostRecentUndoWaypoint | Line: 315 ]]
	local v1 = p1._undoWaypoints[#p1._undoWaypoints]
	if v1 == p2 then
		return
	end
	error("Wrong last undo waypoint,\n    Expected: " .. p2 .. "\n    Got: " .. (v1 or "<none>"))
end
function t.expectAndUndo(p1, p2) --[[ expectAndUndo | Line: 323 | Upvalues: ChangeHistoryService (copy) ]]
	p1:expectMostRecentUndoWaypoint(p2)
	p1._undoWaypoints[#p1._undoWaypoints] = nil
	if not ChangeHistoryService then
		return
	end
	ChangeHistoryService:Undo()
end
function t.getText(p1, p2, p3, p4) --[[ getText | Line: 331 ]]
	if p4 then
		return ("%s.%s (%s)").format(p2, p3, table.concat(p4, ","))
	else
		return ("%s.%s").format(p2, p3)
	end
end
function t.getThemeColor(p1, p2) --[[ getThemeColor | Line: 339 | Upvalues: Colors (copy) ]]
	if p2 == Enum.StudioStyleGuideColor.MainBackground then
		return Colors.WHITE
	else
		return Colors.BLACK
	end
end
function t.getSetting(p1, p2) --[[ getSetting | Line: 347 ]]
	return p1._settingValues[p2]
end
function t.setSetting(p1, p2, p3) --[[ setSetting | Line: 351 ]]
	p1._settingValues[p2] = p3
end
function t.setPivotIndicator(p1, p2) --[[ setPivotIndicator | Line: 355 ]]
	return false
end
return t