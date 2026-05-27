-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("spr")
local v5 = Sonar("Global")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("TableUtils")
local v8 = Sonar("InputTypeService")
local v9 = Sonar("EventUtils")
local v10 = Sonar("Button")
local v11 = v6.GetConfig("ToolTip")()
local LocalPlayer = game:GetService("Players").LocalPlayer
local v12 = v2.GetPlayerGui("ToolTipGui")
local v13 = LocalPlayer:GetMouse()
local v14 = nil
local t2 = {}
local v15 = 0
local v16 = false
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 39 | Upvalues: v15 (ref) ]]
	if p1.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	v15 = v15 + 1
end)
UserInputService.InputEnded:Connect(function(p1) --[[ Line: 45 | Upvalues: v15 (ref), v16 (ref) ]]
	if p1.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	v15 = math.max(0, v15 - 1)
	if v15 ~= 0 then
		return
	end
	v16 = false
end)
function t.new(p1) --[[ new | Line: 54 | Upvalues: t (copy), v1 (copy), v14 (ref), v8 (copy), v15 (ref), v16 (ref) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.TipMaid = v1.new()
	v2.Maid:GiveTask(v2.TipMaid)
	v2.Config = p1
	local v3, v4 = v2:_getPreset()
	v2.Preset = v3
	v2.PresetName = v4
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 ToolTip, Instance is required for tooltip", p1)
		return v2
	end
	if v2:_getSetting("Persistent") then
		v2:_show()
	else
		v2.Maid:GiveTask(v2.Instance:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 76 | Upvalues: v2 (copy), v14 (ref), v8 (ref) ]]
			if v2:_getSetting("ClickToOpen") then
				if not v2:_canShow() then
					return
				end
				if v2.Instance.GuiState ~= Enum.GuiState.Press then
					return
				end
				if v14 then
					v14:_clear()
				end
				if v14 == v2 then
					return
				end
				v2:_show()
			else
				if v2:_getSetting("HoldToOpen") then
					return
				end
				if v8.IsMobileInputType() then
					return
				end
				if v2.Instance.GuiState == Enum.GuiState.Idle then
					if not v2:_getSetting("Persistent") then
						v2:_clear()
					end
				else
					if v2.Instance.GuiState ~= Enum.GuiState.Hover then
						return
					end
					v2:_waitForHover()
				end
			end
		end))
		v2.Maid:GiveTask(v2.Instance.InputBegan:Connect(function(p1) --[[ Line: 114 | Upvalues: v2 (copy), v15 (ref), v16 (ref) ]]
			if v2:_getSetting("ClickToOpen") then
				return
			end
			if v2:_getSetting("HoldToOpen") then
				if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if p1.UserInputType == Enum.UserInputType.Touch and (v15 > 0 and not v16) then
					return
				end
			else
				if p1.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				if v15 > 0 and not v16 then
					return
				end
			end
			v16 = true
			v2.HoldTriggered = true
			v2:_waitForHover(v2:_getSetting("HoldDuration"))
		end))
		v2.Maid:GiveTask(v2.Instance.InputEnded:Connect(function(p1) --[[ Line: 142 | Upvalues: v2 (copy) ]]
			if v2:_getSetting("ClickToOpen") then
				return
			end
			if v2:_getSetting("HoldToOpen") then
				if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch or v2:_getSetting("HoldStaysOpen") then
					return
				end
			elseif p1.UserInputType ~= Enum.UserInputType.Touch or v2:_getSetting("HoldStaysOpen") then
				return
			end
			v2:_clear()
		end))
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 167 | Upvalues: t2 (copy), v3 (copy) ]]
	if t2[p1.Instance] == p1 then
		t2[p1.Instance] = nil
	end
	p1:_clear()
	v3(p1)
end
function t._getPreset(p1) --[[ _getPreset | Line: 175 | Upvalues: v11 (copy) ]]
	local v1 = p1.Config.Type and v11.Presets[p1.Config.Type] or nil
	if v1 then
		return v1, p1.Config.Type
	end
	for v2, v3 in v11.Presets do
		if p1.Config[v2] then
			return v3, v2
		end
	end
	return v11.Presets.Default, "Default"
end
function t._getSetting(p1, p2) --[[ _getSetting | Line: 190 | Upvalues: v8 (copy), v11 (copy) ]]
	local v1 = p1.Config[p2]
	if v1 ~= nil then
		return v1
	end
	local v2 = p1.Preset[p2]
	if v2 ~= nil then
		return v2
	end
	if v8.IsMobileInputType() then
		if p1.Preset.TouchOverrides then
			local v3 = p1.Preset.TouchOverrides[p2]
			if v3 ~= nil then
				return v3
			end
		end
		local TouchOverrides = v11.TouchOverrides
		if TouchOverrides then
			local v4 = TouchOverrides[p2]
			if v4 ~= nil then
				return v4
			end
		end
	end
	return v11[p2]
end
function t._findAncestorButton(p1) --[[ _findAncestorButton | Line: 221 | Upvalues: v10 (copy) ]]
	local v1 = p1.Instance.Parent
	while v1 and not v1:IsA("ScreenGui") do
		if v10:GetButton(v1) then
			return v1
		end
		v1 = v1.Parent
	end
	return nil
end
function t._getScreenScale(p1) --[[ _getScreenScale | Line: 233 | Upvalues: v12 (copy) ]]
	local v1 = p1:_getSetting("ScaleBaseWidth") or 1920
	local v2 = p1:_getSetting("MinScale") or 0.5
	return math.clamp(math.sqrt((math.clamp(v12.AbsoluteSize.X / v1, 0, 1))), v2, 1)
end
function t._canShow(p1) --[[ _canShow | Line: 241 | Upvalues: UserInputService (copy), v2 (copy), v5 (copy) ]]
	if UserInputService:GetFocusedTextBox() then
		return
	end
	if not v2.IsVisibleOnScreen(p1.Instance) then
		return
	end
	if v5.IsDraggingGui then
	else
		return true
	end
end
function t._waitForHover(p1, p2) --[[ _waitForHover | Line: 260 ]]
	if p1.Frame then
		return
	end
	if p1.NextHoverTick and p1.NextHoverTick > tick() then
		return
	end
	local v1 = tick()
	p1.TipHoverTick = v1
	local v2 = task.wait
	v2(if p2 then p2 else p1:_getSetting("HoverDuration"))
	if v1 ~= p1.TipHoverTick then
		return
	end
	if p1:_canShow() then
		p1:_show()
	end
end
function t._show(p1) --[[ _show | Line: 285 | Upvalues: t2 (copy), v14 (ref), RunService (copy), v4 (copy) ]]
	if p1:_getSetting("Persistent") then
		t2[p1.Instance] = p1
	else
		if v14 then
			v14:_clear()
		end
		v14 = p1
		local v1 = t2[p1.Instance]
		if v1 and v1.Frame then
			v1.Frame.Visible = false
		end
	end
	if p1.HoldTriggered then
		p1.Instance:SetAttribute("ToolTipSinkInput", true)
		local v2 = p1:_findAncestorButton()
		if v2 then
			v2:SetAttribute("ToolTipSinkInput", true)
			p1.ConsumedButton = v2
		end
	end
	p1.MovedFirst = false
	local v3, v42 = p1:_createFrame()
	p1.Frame = v3
	p1.TipMaid:GiveTask(function() --[[ Line: 316 | Upvalues: p1 (copy), v42 (ref) ]]
		local Frame = p1.Frame
		p1.Frame = nil
		if not (Frame or v42 and v42.Destroy) then
			return
		end
		v42:Destroy()
		v42 = nil
	end)
	local v5 = p1:_getSetting("Direction") ~= nil
	local v6 = nil
	task.defer(function() --[[ Line: 332 | Upvalues: p1 (copy), v5 (copy), v6 (ref) ]]
		if not p1.Frame then
			return
		end
		if not p1.Frame:FindFirstChild("UIScale") then
			return
		end
		if v5 then
			p1.Frame.Position = UDim2.new(2, 0, 2, 0)
			p1.Frame.Visible = true
			task.wait()
			if not p1.Frame then
				return
			end
			local v1 = p1:_getPosition()
			p1.Frame.Position = v1
			v6 = v1
			p1:_updateTail()
		else
			local v2 = p1:_getPosition()
			p1.Frame.Position = v2
			v6 = v2
			p1.Frame.Visible = true
		end
		local UIScale = p1.Frame:FindFirstChild("UIScale")
		if not UIScale then
			return
		end
		p1:_getScreenScale()
		UIScale.Scale = 1
	end)
	p1.TipMaid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 364 | Upvalues: p1 (copy), v6 (ref), v5 (copy), v4 (ref) ]]
		if not (p1.Frame and v6) then
			return
		end
		if p1:_canShow() then
			if not p1.Frame.Visible then
				p1.Frame.Visible = true
			end
			local v1 = p1:_getPosition()
			if v1 ~= v6 then
				if v5 then
					p1.Frame.Position = v1
				else
					v4.target(p1.Frame, 0.5, 3, {
						Position = v1
					})
				end
				v6 = v1
			end
			if not v5 then
				return
			end
			p1:_updateTail()
		elseif p1:_getSetting("Persistent") then
			p1.Frame.Visible = false
		else
			p1:_clear()
		end
	end))
end
function t._clear(p1, p2) --[[ _clear | Line: 396 | Upvalues: t2 (copy), v14 (ref) ]]
	if p2 then
		p1.NextHoverTick = tick() + p2
	end
	if p1.HoldTriggered then
		p1.HoldTriggered = false
		p1.Instance:SetAttribute("ToolTipSinkInput", nil)
		if p1.ConsumedButton then
			p1.ConsumedButton:SetAttribute("ToolTipSinkInput", nil)
			p1.ConsumedButton = nil
		end
	end
	p1.TipHoverTick = nil
	p1.TipMaid:DoCleaning()
	if p1:_getSetting("Persistent") then
		if t2[p1.Instance] == p1 then
			t2[p1.Instance] = nil
		end
	else
		if v14 == p1 then
			v14 = nil
		end
		local v1 = t2[p1.Instance]
		if not (v1 and v1.Frame) then
			return
		end
		v1.Frame.Visible = true
	end
end
function t._createFrame(p1) --[[ _createFrame | Line: 429 | Upvalues: v1 (copy), v12 (copy), v2 (copy), v7 (copy), v8 (copy), UserInputService (copy), v9 (copy), v5 (copy) ]]
	local v13 = v1.new()
	local v3 = (v12:FindFirstChild(p1.PresetName) or v12:FindFirstChild("Default")):Clone()
	v3.Name = p1.PresetName
	v3.Name = tick()
	p1.ToolTipInstance = v3
	local v4 = nil
	local v52 = v2.FindElement(v3, "Contents")
	if not v52 then
		warn("\226\154\160\239\184\143 ToolTip, ContentsFrame is required for tooltip", p1.PresetName, p1.Instance)
	end
	for v72, v82 in p1.Preset.Create(p1, p1.Config, v2) do
		local v6
		local v92, v10, AutoSize_2, v11
		if v82.Instance then
			v92 = v82.Instance
			v92.LayoutOrder = v82.LayoutOrder or v72
			v92.Visible = true
			v92.Parent = v52
			v13:GiveTask(v92)
			if v82.Maid then
				v13:GiveTask(v82.Maid)
			end
			if v82.OnCreated then
				v10 = v82.OnCreated(v92)
				if v10 and v10.Destroy then
					v13:GiveTask(v10)
				end
			end
			v6 = function(p1_2, p2_2) --[[ applyProperties | Line: 474 | Upvalues: v2 (ref), v6 (copy) ]]
				for v1, v22 in p2_2 do
					if type(v22) == "table" then
						local v3 = v2.FindElement(p1_2, v1)
						if v3 then
							v6(v3, v22)
						end
						continue
					end
					p1_2[v1] = v22
				end
			end
			if v82.Properties then
				v6(v92, v82.Properties)
			end
			if not (v82.Type and v82.Type:find("Divider")) then
				local AutoSize_2 = v82.AutoSize
			end
			if v82.GuiObject then
				for v122, v132 in v82.GuiObject do
					v11 = v7.Merge(v132, {
						DoNotShowToolTip = true,
						Instance = v92,
						DisplayType = v122
					})
					v13:GiveTask(v2.AddComponent("GuiObject", v11))
				end
			end
			if v82.MinimumWidth then
				v4 = v82.MinimumWidth
			end
		else
			local v14 = v2.FindElement(v52, v82.Type)
			if v14 then
				v92 = v2.CloneTemplate(v14)
				v92.LayoutOrder = v82.LayoutOrder or v72
				v92.Visible = true
				v92.Parent = v52
				v13:GiveTask(v92)
				if v82.Maid then
					v13:GiveTask(v82.Maid)
				end
				if v82.OnCreated then
					v10 = v82.OnCreated(v92)
					if v10 and v10.Destroy then
						v13:GiveTask(v10)
					end
				end
				v6 = function(p1_2, p2_2) --[[ applyProperties | Line: 474 | Upvalues: v2 (ref), v6 (copy) ]]
					for v1, v22 in p2_2 do
						if type(v22) == "table" then
							local v3 = v2.FindElement(p1_2, v1)
							if v3 then
								v6(v3, v22)
							end
							continue
						end
						p1_2[v1] = v22
					end
				end
				if v82.Properties then
					v6(v92, v82.Properties)
				end
				if not (v82.Type and v82.Type:find("Divider")) then
					local AutoSize_2 = v82.AutoSize
				end
				if v82.GuiObject then
					for v122, v132 in v82.GuiObject do
						v11 = v7.Merge(v132, {
							DoNotShowToolTip = true,
							Instance = v92,
							DisplayType = v122
						})
						v13:GiveTask(v2.AddComponent("GuiObject", v11))
					end
				end
				if v82.MinimumWidth then
					v4 = v82.MinimumWidth
				end
				continue
			end
			warn("\226\154\160\239\184\143 ToolTip, Gui Object not found inside ContentsFrame", p1.PresetName, p1.Instance)
		end
	end
	local v16 = v2.FindElement(v52, "UIListLayout")
	local v17 = v2.FindElement(v52, "UIPadding")
	local v18 = v2.FindElement(v3, "MinimumWidth")
	if v18 and v4 then
		if not v18 then
			local MinimumWidth = Instance.new("Frame")
			MinimumWidth.Name = "MinimumWidth"
			MinimumWidth.Size = UDim2.fromOffset(v4, 0)
			MinimumWidth.BackgroundTransparency = 1
			MinimumWidth.Parent = v3
			v13:GiveTask(MinimumWidth)
			v18 = MinimumWidth
		end
		v18.Size = UDim2.fromOffset(v4, 0)
		v18.Visible = true
		if v17 and v16 then
			v17.PaddingTop = UDim.new(v17.PaddingTop.Scale, v17.PaddingBottom.Offset - v16.Padding.Offset)
		end
	elseif v18 then
		v18.Size = UDim2.fromOffset(0, 0)
		v18.Visible = false
		if v17 then
			v17.PaddingTop = UDim.new(v17.PaddingTop.Scale, v17.PaddingBottom.Offset / 2)
		end
	end
	for v19, v20 in v52:GetChildren() do
		if v20:HasTag("WrapText") and v20:IsA("TextLabel") then
			p1:_wrapText(v20, p1:_getSetting("MaxFrameWidth"))
		end
	end
	for v21, v222 in v52:GetChildren() do
		if v222:HasTag("AutomaticContentSize") then
			local function updateSize() --[[ updateSize | Line: 547 | Upvalues: v222 (copy), v52 (copy) ]]
				v222.Size = UDim2.new(v222.Size.X.Scale, v52.UIListLayout.AbsoluteContentSize.X, v222.Size.Y.Scale, v222.Size.Y.Offset)
			end
			v13:GiveTask(v52.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 550 | Upvalues: updateSize (copy) ]]
				task.defer(updateSize)
			end))
			v222.Size = UDim2.new(v222.Size.X.Scale, v52.UIListLayout.AbsoluteContentSize.X, v222.Size.Y.Scale, v222.Size.Y.Offset)
		end
	end
	if not v3:FindFirstChild("UIScale") then
		local UIScale = Instance.new("UIScale")
		UIScale.Name = "UIScale"
		UIScale.Parent = v3
		v13:GiveTask(UIScale)
	end
	local v23 = v2.FindElement(v3, "InputClearLabel")
	if p1:_getSetting("InputBeganClears") and not p1:_getSetting("Persistent") then
		if v23 then
			local v24 = v8.IsMobileInputType()
			v23.Text = string.format("(%s anywhere to close)", if v24 then "Tap" else "Click")
			v23.Visible = v24
		end
		local v27 = tick()
		v13:GiveTask(UserInputService.InputBegan:Connect(function(p12) --[[ Line: 572 | Upvalues: v27 (copy), v8 (ref), v9 (ref), p1 (copy) ]]
			if tick() - v27 < 0.1 then
				return
			end
			if not v8.IsMobileInputType() then
				return
			end
			if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and (p12.UserInputType ~= Enum.UserInputType.Touch and (p12.UserInputType ~= Enum.UserInputType.Gamepad1 or p12.KeyCode ~= Enum.KeyCode.ButtonX)) then
				return
			end
			v9.safeMethod(p1, "_clear")
		end))
	elseif v23 then
		v23.Visible = false
	end
	v13:GiveTask(v5:GetStateChangedSignal("NotificationPrompt"):Connect(function() --[[ Line: 595 | Upvalues: v5 (ref), v9 (ref), p1 (copy) ]]
		if not v5.NotificationPrompt then
			return
		end
		v9.safeMethod(p1, "_clear", 2)
	end))
	p1.TailLabel = v2.FindElement(v3, "TailLabel")
	if not p1.TailLabel then
		v3.Parent = v12
		v13:GiveTask(v3)
		return v3, v13
	end
	p1.TailLabel.Visible = false
	v3.Parent = v12
	v13:GiveTask(v3)
	return v3, v13
end
function t._getPosition(p1) --[[ _getPosition | Line: 612 | Upvalues: v12 (copy) ]]
	local v1 = p1:_getSetting("Direction")
	if v1 then
		return p1:_getDirectionalPosition(v1)
	end
	local v2 = p1:_getTargetPosition()
	local AbsoluteSize = v12.AbsoluteSize
	local AbsoluteSize_2 = p1.Frame.AbsoluteSize
	local AnchorPoint = p1.Frame.AnchorPoint
	local v3 = AbsoluteSize_2.X * AnchorPoint.X
	local v4 = AbsoluteSize_2.Y * AnchorPoint.Y
	local v5 = v2 + UDim2.fromOffset(v3, v4)
	local v6 = v2.X.Offset + AbsoluteSize_2.X
	local v7 = v2.Y.Offset + AbsoluteSize_2.Y
	local Offset = v5.X.Offset
	if AbsoluteSize.X < v6 then
		local v8 = v2.X.Offset - AbsoluteSize_2.X + v3
		Offset = if v8 >= 0 then v8 else v5.X.Offset - (v6 - AbsoluteSize.X)
	end
	local Offset_2 = v5.Y.Offset
	local v9
	if AbsoluteSize.Y < v7 then
		local v10 = v2.Y.Offset - AbsoluteSize_2.Y + v4
		v9 = if v10 >= 0 then v10 else v5.Y.Offset - (v7 - AbsoluteSize.Y)
	else
		v9 = v5.Y.Offset
	end
	return UDim2.new(0, Offset, 0, v9)
end
function t._getDirectionalPosition(p1, p2) --[[ _getDirectionalPosition | Line: 659 | Upvalues: v12 (copy) ]]
	local v1 = p1:_getSetting("DirectionOffset")
	local v2 = if v1 or p1.TailLabel then 0 else p1:_getSetting("DirectionPadding") or 8
	local v3 = v1 or 0
	local AbsolutePosition = p1.Instance.AbsolutePosition
	local AbsoluteSize = p1.Instance.AbsoluteSize
	local AbsoluteSize_2 = p1.Frame.AbsoluteSize
	local AbsoluteSize_3 = v12.AbsoluteSize
	local AnchorPoint = p1.Frame.AnchorPoint
	local v4 = nil
	local v5 = nil
	if p2 == "Down" then
		v4 = AbsolutePosition.X + AbsoluteSize.X / 2 - AbsoluteSize_2.X / 2
		v5 = AbsolutePosition.Y + AbsoluteSize.Y + v2 + AbsoluteSize.Y * v3
		if v5 + AbsoluteSize_2.Y > AbsoluteSize_3.Y then
			v5 = AbsolutePosition.Y - AbsoluteSize_2.Y - v2 - AbsoluteSize.Y * v3
			p1.ResolvedDirection = "Up"
		else
			p1.ResolvedDirection = "Down"
		end
	elseif p2 == "Up" then
		v4 = AbsolutePosition.X + AbsoluteSize.X / 2 - AbsoluteSize_2.X / 2
		v5 = AbsolutePosition.Y - AbsoluteSize_2.Y - v2 - AbsoluteSize.Y * v3
		if v5 < 0 then
			v5 = AbsolutePosition.Y + AbsoluteSize.Y + v2 + AbsoluteSize.Y * v3
			p1.ResolvedDirection = "Down"
		else
			p1.ResolvedDirection = "Up"
		end
	elseif p2 == "Right" then
		v4 = AbsolutePosition.X + AbsoluteSize.X + v2 + AbsoluteSize.X * v3
		v5 = AbsolutePosition.Y + AbsoluteSize.Y / 2 - AbsoluteSize_2.Y / 2
		if v4 + AbsoluteSize_2.X > AbsoluteSize_3.X then
			v4 = AbsolutePosition.X - AbsoluteSize_2.X - v2 - AbsoluteSize.X * v3
			p1.ResolvedDirection = "Left"
		else
			p1.ResolvedDirection = "Right"
		end
	elseif p2 == "Left" then
		v4 = AbsolutePosition.X - AbsoluteSize_2.X - v2 - AbsoluteSize.X * v3
		v5 = AbsolutePosition.Y + AbsoluteSize.Y / 2 - AbsoluteSize_2.Y / 2
		if v4 < 0 then
			v4 = AbsolutePosition.X + AbsoluteSize.X + v2 + AbsoluteSize.X * v3
			p1.ResolvedDirection = "Right"
		else
			p1.ResolvedDirection = "Left"
		end
	end
	return UDim2.fromOffset(math.clamp(v4, 0, AbsoluteSize_3.X - AbsoluteSize_2.X) + AbsoluteSize_2.X * AnchorPoint.X, math.clamp(v5, 0, AbsoluteSize_3.Y - AbsoluteSize_2.Y) + AbsoluteSize_2.Y * AnchorPoint.Y)
end
function t._updateTail(p1) --[[ _updateTail | Line: 719 ]]
	if not (p1.TailLabel and p1.ResolvedDirection) then
		return
	end
	p1.TailLabel.Visible = true
	local v1 = p1:_getSetting("TailSize")
	if v1 then
		p1.TailLabel.Size = UDim2.fromOffset(v1, v1)
	end
	local UIScale = p1.Frame:FindFirstChild("UIScale")
	local v2 = if UIScale then UIScale.Scale else 1
	local AbsolutePosition = p1.Instance.AbsolutePosition
	local AbsoluteSize = p1.Instance.AbsoluteSize
	local AbsolutePosition_2 = p1.Frame.AbsolutePosition
	local AbsoluteSize_2 = p1.Frame.AbsoluteSize
	local AbsoluteSize_3 = p1.TailLabel.AbsoluteSize
	if p1.ResolvedDirection == "Down" then
		p1.TailLabel.Position = UDim2.new(0, math.clamp(AbsolutePosition.X + AbsoluteSize.X / 2 - AbsolutePosition_2.X, AbsoluteSize_3.X / 2, AbsoluteSize_2.X - AbsoluteSize_3.X / 2) / v2, 0, 0)
		p1.TailLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		p1.TailLabel.Rotation = 0
		return
	end
	if p1.ResolvedDirection == "Up" then
		p1.TailLabel.Position = UDim2.new(0, math.clamp(AbsolutePosition.X + AbsoluteSize.X / 2 - AbsolutePosition_2.X, AbsoluteSize_3.X / 2, AbsoluteSize_2.X - AbsoluteSize_3.X / 2) / v2, 1, 0)
		p1.TailLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		p1.TailLabel.Rotation = 180
		return
	end
	if p1.ResolvedDirection == "Right" then
		p1.TailLabel.Position = UDim2.new(0, 0, 0, math.clamp(AbsolutePosition.Y + AbsoluteSize.Y / 2 - AbsolutePosition_2.Y, AbsoluteSize_3.Y / 2, AbsoluteSize_2.Y - AbsoluteSize_3.Y / 2) / v2)
		p1.TailLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		p1.TailLabel.Rotation = 270
		return
	end
	if p1.ResolvedDirection ~= "Left" then
		return
	end
	p1.TailLabel.Position = UDim2.new(0, AbsoluteSize_2.X / v2, 0, math.clamp(AbsolutePosition.Y + AbsoluteSize.Y / 2 - AbsolutePosition_2.Y, AbsoluteSize_3.Y / 2, AbsoluteSize_2.Y - AbsoluteSize_3.Y / 2) / v2)
	p1.TailLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	p1.TailLabel.Rotation = 90
end
function t._getTargetPosition(p1) --[[ _getTargetPosition | Line: 767 | Upvalues: v13 (copy), GuiService (copy) ]]
	local v1 = v13
	if GuiService.SelectedObject == p1.Instance or (p1:_getSetting("ClickToOpen") or p1:_getSetting("HoldToOpen")) then
		v1 = p1.Instance.AbsolutePosition + Vector2.new(p1.Instance.AbsoluteSize.X, 0)
	end
	return UDim2.new(0, v1.X, 0, v1.Y) + p1:_getSetting("MouseOffset")
end
function t._wrapText(p1, p2, p3) --[[ _wrapText | Line: 776 ]]
	local TextService = game:GetService("TextService")
	local Text = p2.Text
	local TextSize = p2.TextSize
	local FontFace = p2.FontFace
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = Text
	GetTextBoundsParams.Font = FontFace
	GetTextBoundsParams.Size = TextSize
	GetTextBoundsParams.Width = (1 / 0)
	local v1 = TextService:GetTextBoundsAsync(GetTextBoundsParams)
	GetTextBoundsParams:Destroy()
	if not (p3 < v1.X) then
		return
	end
	local v3 = ""
	for i, v in ipairs((string.split(Text, " "))) do
		local v4
		v4 = if v3 == "" and v then v else v3 .. " " .. v
		local GetTextBoundsParams_2 = Instance.new("GetTextBoundsParams")
		GetTextBoundsParams_2.Text = v4
		GetTextBoundsParams_2.Font = FontFace
		GetTextBoundsParams_2.Size = TextSize
		GetTextBoundsParams_2.Width = (1 / 0)
		local v5 = TextService:GetTextBoundsAsync(GetTextBoundsParams_2)
		GetTextBoundsParams_2:Destroy()
		v3 = if p3 < v5.X then v3 .. "\n" .. v else v4
	end
	p2.Text = v3
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 819 ]]
	p1.TipMaid:GiveTask(...)
end
function t.Clear(p1) --[[ Clear | Line: 823 ]]
	p1:_clear()
end
function t.Init(p1) --[[ Init | Line: 827 | Upvalues: v12 (copy) ]]
	v12.Enabled = true
	v12.IgnoreGuiInset = false
	for v1, v2 in v12:GetChildren() do
		v2.Visible = false
	end
end
t:Init()
return t