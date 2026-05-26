-- https://lua.expert/
local DraggerToolModel = require(script.Parent.Parent.Implementation.DraggerToolModel)
local t = {}
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 13 | Upvalues: t (copy), DraggerToolModel (copy) ]]
	local v3 = setmetatable({
		_viewBoundsDirty = true,
		_selectionBoundsDirty = true,
		_draggerContext = p1
	}, t)
	v3._draggerToolModel = DraggerToolModel.new(p1, p2, p3 or {}, function() --[[ Line: 27 ]] end, function() --[[ Line: 28 | Upvalues: v3 (copy) ]]
		v3._viewBoundsDirty = true
	end, function() --[[ Line: 29 | Upvalues: v3 (copy) ]]
		v3._selectionBoundsDirty = true
	end)
	return v3
end
function t.getModel(p1) --[[ getModel | Line: 34 ]]
	return p1._draggerToolModel
end
function t._update(p1) --[[ _update | Line: 38 ]]
	if p1._selectionBoundsDirty then
		p1._selectionBoundsDirty = false
		p1._draggerToolModel:_processSelectionChanged()
	end
	if not p1._viewBoundsDirty then
		return
	end
	p1._viewBoundsDirty = false
	p1._draggerToolModel:_processViewChanged()
end
function t.select(p1) --[[ select | Line: 49 ]]
	assert(not p1._selected, "select called while already selected")
	p1._selected = true
	p1._draggerToolModel:_processSelected()
	p1:_update()
end
function t.mouseDown(p1) --[[ mouseDown | Line: 56 ]]
	assert(p1._selected, "must call select before beginDrag")
	p1._draggerToolModel:_processMouseDown()
	p1:_update()
end
function t.mouseMove(p1, p2, p3) --[[ mouseMove | Line: 62 ]]
	assert(p1._selected, "must call select before moveMouse")
	local v1 = p1._draggerContext:getViewportSize()
	p1._draggerContext:setMouseLocation(Vector2.new(v1.X * p2, v1.Y * p3))
	p1._draggerToolModel:_processViewChanged()
	p1:_update()
end
function t.mouseUp(p1) --[[ mouseUp | Line: 71 ]]
	assert(p1._selected, "must call select before endDrag")
	p1._draggerToolModel:_processMouseUp()
	p1:_update()
end
function t.keyPress(p1, p2) --[[ keyPress | Line: 77 ]]
	assert(if typeof(p2) == "EnumItem" then true else false, "keyPress takes an Enum.KeyCode")
	assert(p1._selected, "must call select before keyPress")
	p1._draggerToolModel:_processKeyDown(p2)
	p1:_update()
	p1._draggerToolModel:_processKeyUp(p2)
	p1:_update()
end
function t.deselect(p1) --[[ deselect | Line: 86 ]]
	assert(p1._selected, "deselect called while not selected")
	p1._selected = false
	p1._draggerToolModel:_processDeselected()
	p1:_update()
end
return t