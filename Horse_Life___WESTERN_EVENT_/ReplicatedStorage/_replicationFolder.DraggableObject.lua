-- https://lua.expert/
local v1 = UDim2.new
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy) ]]
	local t2 = {
		Object = p1,
		DragStarted = nil,
		DragEnded = nil,
		Dragged = nil,
		Dragging = false
	}
	setmetatable(t2, t)
	return t2
end
function t.Enable(p1) --[[ Enable | Line: 32 | Upvalues: CurrentCamera (copy), v1 (copy), UserInputService (copy) ]]
	local Object = p1.Object
	local v12 = nil
	local v2 = nil
	local v3 = nil
	local v4 = false
	local function update(p1) --[[ update | Line: 40 | Upvalues: CurrentCamera (ref), Object (copy), v2 (ref), v3 (ref), v1 (ref) ]]
		local _ = Object.AbsoluteSize + (CurrentCamera.ViewportSize - Object.AbsoluteSize)
		local v12 = p1.Position - v2
		local v22 = Object.AbsoluteSize.Y * 0.5
		local v9 = v1(v3.X.Scale, math.clamp(v3.X.Offset + v12.X, 0, CurrentCamera.ViewportSize.X - Object.AbsoluteSize.X), v3.Y.Scale, (math.clamp(v3.Y.Offset + v12.Y, 0 - v22 - 36, CurrentCamera.ViewportSize.Y - v22 * 3.4)))
		Object.Position = v9
		return v9
	end
	p1.InputBegan = Object.InputBegan:Connect(function(p12) --[[ Line: 60 | Upvalues: v4 (ref), p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		v4 = true
		local v1 = nil
		v1 = p12.Changed:Connect(function() --[[ Line: 73 | Upvalues: p12 (copy), p1 (ref), v4 (ref), v1 (ref) ]]
			if p12.UserInputState ~= Enum.UserInputState.End or not (p1.Dragging or v4) then
				return
			end
			p1.Dragging = false
			v1:Disconnect()
			if p1.DragEnded and not v4 then
				p1.DragEnded()
			end
			v4 = false
		end)
	end)
	p1.InputChanged = Object.InputChanged:Connect(function(p1) --[[ Line: 88 | Upvalues: v12 (ref) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseMovement and p1.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		v12 = p1
	end)
	p1.InputChanged2 = UserInputService.InputChanged:Connect(function(p12) --[[ Line: 94 | Upvalues: Object (copy), p1 (copy), v4 (ref), v2 (ref), v3 (ref), v12 (ref), update (copy) ]]
		if not p12.Position then
			return
		end
		if Object.Parent == nil then
			p1:Disable()
			return
		end
		if v4 then
			v4 = false
			if p1.DragStarted then
				p1.DragStarted()
			end
			p1.Dragging = true
			v2 = p12.Position
			v3 = Object.Position
		end
		if p12 ~= v12 or not p1.Dragging then
			return
		end
		local v1 = update(p12)
		if not p1.Dragged then
			return
		end
		p1.Dragged(v1)
	end)
end
function t.Disable(p1) --[[ Disable | Line: 125 ]]
	if p1.InputBegan then
		p1.InputBegan:Disconnect()
		p1.InputChanged:Disconnect()
		p1.InputChanged2:Disconnect()
	end
	if not p1.Dragging then
		return
	end
	p1.Dragging = false
	if not p1.DragEnded then
		return
	end
	p1.DragEnded()
end
return t