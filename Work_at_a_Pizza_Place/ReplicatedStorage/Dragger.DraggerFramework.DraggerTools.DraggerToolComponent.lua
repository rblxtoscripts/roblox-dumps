-- https://lua.expert/
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local DraggerToolModel = require(v1.Implementation.DraggerToolModel)
local ViewChangeDetector = require(v1.Utility.ViewChangeDetector)
local shouldDragAsFace = require(v1.Utility.shouldDragAsFace)
local getFFlagSummonPivot = require(v1.Flags.getFFlagSummonPivot)
local getFFlagTemporaryPatchDraggerEvents = require(v1.Flags.getFFlagTemporaryPatchDraggerEvents)
local v3 = Roact.PureComponent:extend("DraggerToolComponent")
function v3.init(p1) --[[ init | Line: 29 ]]
	p1:setup(p1.props)
end
function v3.didMount(p1) --[[ didMount | Line: 33 ]] end
function v3.willUnmount(p1) --[[ willUnmount | Line: 36 ]]
	p1:teardown()
end
function v3.willUpdate(p1, p2, p3) --[[ willUpdate | Line: 40 ]]
	if p2 == p1.props then
		return
	end
	p1:teardown()
	p1:setup(p2)
end
function v3.render(p1) --[[ render | Line: 47 ]]
	return p1._draggerToolModel:render()
end
function v3.setup(p1, p2) --[[ setup | Line: 51 | Upvalues: HttpService (copy), DraggerToolModel (copy), getFFlagTemporaryPatchDraggerEvents (copy), UserInputService (copy), getFFlagSummonPivot (copy), shouldDragAsFace (copy), ViewChangeDetector (copy), RunService (copy) ]]
	assert(p2.DraggerContext)
	assert(p2.DraggerSchema)
	assert(p2.DraggerSettings)
	p1._selectionBoundsAreDirty = false
	p1._viewBoundsAreDirty = false
	p1._bindName = "DraggerToolViewUpdate"
	p1._bindName = p1._bindName .. HttpService:GenerateGUID(false)
	local function requestRender() --[[ requestRender | Line: 63 | Upvalues: p1 (copy) ]]
		if not p1._isMounted then
			return
		end
		p1:setState({})
	end
	p1._draggerToolModel = DraggerToolModel.new(p2.DraggerContext, p2.DraggerSchema, p2.DraggerSettings, requestRender, function() --[[ Line: 75 | Upvalues: p1 (copy) ]]
		p1._viewBoundsAreDirty = true
	end, function() --[[ Line: 76 | Upvalues: p1 (copy) ]]
		p1._selectionBoundsAreDirty = true
	end)
	p1._draggerToolModel:_processSelected()
	local function bailedAndWarnedHack(p12) --[[ bailedAndWarnedHack | Line: 83 | Upvalues: p1 (copy) ]]
		return not p1._isMounted
	end
	local Mouse = p2.Mouse
	p1._mouseDownConnection = Mouse.Button1Down:Connect(function() --[[ Line: 92 | Upvalues: getFFlagTemporaryPatchDraggerEvents (ref), p1 (copy) ]]
		if not getFFlagTemporaryPatchDraggerEvents() then
			p1._draggerToolModel:_processMouseDown()
			return
		end
		if not not p1._isMounted then
			p1._draggerToolModel:_processMouseDown()
		end
	end)
	p1._mouseUpConnection = Mouse.Button1Up:Connect(function() --[[ Line: 98 | Upvalues: getFFlagTemporaryPatchDraggerEvents (ref), p1 (copy) ]]
		if not getFFlagTemporaryPatchDraggerEvents() then
			p1._draggerToolModel:_processMouseUp()
			return
		end
		if not not p1._isMounted then
			p1._draggerToolModel:_processMouseUp()
		end
	end)
	p1._keyDownConnection = UserInputService.InputBegan:Connect(function(p12, p2) --[[ Line: 104 | Upvalues: getFFlagTemporaryPatchDraggerEvents (ref), p1 (copy) ]]
		if getFFlagTemporaryPatchDraggerEvents() and not p1._isMounted then
			return
		end
		if p12.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end
		p1._draggerToolModel:_processKeyDown(p12.KeyCode)
	end)
	if getFFlagSummonPivot() then
		p1._keyUpConnection = UserInputService.InputEnded:Connect(function(p12, p2) --[[ Line: 113 | Upvalues: getFFlagTemporaryPatchDraggerEvents (ref), p1 (copy) ]]
			if getFFlagTemporaryPatchDraggerEvents() and not p1._isMounted then
				return
			end
			if p12.UserInputType ~= Enum.UserInputType.Keyboard then
				return
			end
			p1._draggerToolModel:_processKeyUp(p12.KeyCode)
		end)
	end
	local function dragEnterFunc(p12) --[[ dragEnterFunc | Line: 123 | Upvalues: getFFlagTemporaryPatchDraggerEvents (ref), p1 (copy), shouldDragAsFace (ref) ]]
		if getFFlagTemporaryPatchDraggerEvents() and not p1._isMounted then
			return
		end
		if not (#p12 > 0) then
			return
		end
		if #p12 == 1 and shouldDragAsFace(p12[1]) then
			p1._draggerToolModel:_processToolboxInitiatedFaceDrag(p12)
			return
		end
		p1._draggerToolModel:_processToolboxInitiatedFreeformSelectionDrag()
	end
	p1._dragEnterConnection = Mouse.DragEnter:Connect(dragEnterFunc)
	local v2 = ViewChangeDetector.new(Mouse)
	local v3 = p2.DraggerContext:shouldUseLocalSpace()
	RunService:BindToRenderStep(p1._bindName, Enum.RenderPriority.First.Value, function() --[[ Line: 139 | Upvalues: p1 (copy), v2 (copy), p2 (copy), v3 (ref) ]]
		if not p1._isMounted then
			return
		end
		p1._draggerToolModel:update()
		local v1 = false
		local v22 = v2:poll() and true or false
		if p1._selectionBoundsAreDirty then
			p1._selectionBoundsAreDirty = false
			v1 = true
		end
		if p1._viewBoundsAreDirty then
			p1._viewBoundsAreDirty = false
			v22 = true
		end
		local v32 = p2.DraggerContext:shouldUseLocalSpace()
		if v32 ~= v3 then
			v1 = true
		end
		if v1 then
			p1._draggerToolModel:_processSelectionChanged()
		end
		if v22 then
			p1._draggerToolModel:_processViewChanged()
		end
		v3 = v32
	end)
	if p2.InitialMouseDown then
		task.defer(function() --[[ Line: 180 | Upvalues: p1 (copy) ]]
			if not p1._isMounted then
				return
			end
			p1._draggerToolModel:_processMouseDown()
		end)
	end
	p1._isMounted = true
end
function v3.teardown(p1) --[[ teardown | Line: 190 | Upvalues: getFFlagSummonPivot (copy), RunService (copy) ]]
	p1._isMounted = false
	p1._mouseDownConnection:Disconnect()
	p1._mouseDownConnection = nil
	p1._mouseUpConnection:Disconnect()
	p1._mouseUpConnection = nil
	p1._keyDownConnection:Disconnect()
	p1._keyDownConnection = nil
	if getFFlagSummonPivot() then
		p1._keyUpConnection:Disconnect()
		p1._keyUpConnection = nil
	end
	p1._dragEnterConnection:Disconnect()
	p1._dragEnterConnection = nil
	RunService:UnbindFromRenderStep(p1._bindName)
	p1._draggerToolModel:_processDeselected()
end
return v3