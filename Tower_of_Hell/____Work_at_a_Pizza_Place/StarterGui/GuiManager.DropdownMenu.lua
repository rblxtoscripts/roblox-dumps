-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
local MainGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local GuiService = game:GetService("GuiService")
require(game.ReplicatedStorage:WaitForChild("Enums"))
t.__index = t
Color3.fromRGB(150, 150, 150)
function t.GetSelectedOptionText(p1) --[[ GetSelectedOptionText | Line: 15 ]]
	return p1.SelectedOptionValue
end
function t.new(p1, p2) --[[ new | Line: 19 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = p1
	t2.Type = "DropDownMenu"
	t2.WindowData = p2
	t2.List = {}
	t2.TextButtons = {}
	t2.ScrollingFrame = p1:WaitForChild("ScrollingFrame")
	t2.SelectedOption = p1:WaitForChild("SelectedOption")
	t2.SelectedOptionValue = nil
	t2.Template = p1:WaitForChild("Template")
	t2.MaxScreenCoverageScaleY = 0.5
	t2.Template.Visible = false
	t2.Object.MouseButton1Down:connect(function() --[[ Line: 35 | Upvalues: t2 (copy) ]]
		t2:Open()
	end)
	return t2
end
function t.Open(p1) --[[ Open | Line: 44 | Upvalues: UIEvents (copy), GuiService (copy), MainGui (copy) ]]
	local ScrollingFrame = p1.ScrollingFrame
	local Template = p1.Template
	local Object = p1.Object
	UIEvents.DropDownMenuOpened:Fire(p1.WindowData.Object)
	if ScrollingFrame.Visible then
		p1:Close()
	else
		ScrollingFrame.Visible = true
		for i, v in ipairs(p1.List) do
			local v1 = Template:clone()
			v1.Size = UDim2.new(1, 0, 0, Object.AbsoluteSize.Y)
			v1.OptionName.Text = v
			v1.Parent = ScrollingFrame
			v1.Visible = true
			v1.Selectable = true
			if v1:FindFirstChild("Icon") then
				if p1.IconIdList == nil then
					v1.UIListLayout:Destroy()
					v1.Icon:Destroy()
				else
					v1.Icon.Image = "rbxassetid://" .. p1.IconIdList[v]
				end
			end
			if _G.GamepadEnabled then
				local v2 = p1.TextButtons[i - 1]
				if v2 then
					v1.NextSelectionUp = v2
					v2.NextSelectionDown = v1
				end
				if v1.OptionName.Text == p1.SelectedOption.Text then
					GuiService.SelectedObject = v1
				end
			end
			local BackgroundColor3 = v1.BackgroundColor3
			local TextColor3 = v1.OptionName.TextColor3
			v1.MouseButton1Click:connect(function() --[[ Line: 91 | Upvalues: GuiService (ref), Object (copy), p1 (copy), v (copy), UIEvents (ref) ]]
				if _G.GamepadEnabled then
					GuiService.SelectedObject = Object
				end
				p1.SelectedOption.Text = v
				p1.SelectedOptionValue = v
				if not p1.IconIdList then
					p1:Close()
					UIEvents.DropDownMenuOptionSelected:Fire(p1.WindowData.Object, p1.Object, v)
					return
				end
				p1.SelectedOption.Parent.SelectedIcon.Image = "rbxassetid://" .. p1.IconIdList[v]
				p1:Close()
				UIEvents.DropDownMenuOptionSelected:Fire(p1.WindowData.Object, p1.Object, v)
			end)
			v1.MouseEnter:connect(function() --[[ Line: 104 | Upvalues: v1 (copy) ]]
				v1.BackgroundColor3 = Color3.new(152/255, 152/255, 152/255)
				v1.OptionName.TextColor3 = Color3.new(255/255, 255/255, 255/255)
				if not v1:FindFirstChild("Icon") then
					return
				end
				v1.Icon.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
			end)
			v1.MouseLeave:connect(function() --[[ Line: 112 | Upvalues: v1 (copy), BackgroundColor3 (copy), TextColor3 (copy) ]]
				v1.BackgroundColor3 = BackgroundColor3
				v1.OptionName.TextColor3 = TextColor3
				if not v1:FindFirstChild("Icon") then
					return
				end
				v1.Icon.ImageColor3 = TextColor3
			end)
			table.insert(p1.TextButtons, v1)
		end
		local v3 = p1.TextButtons[1]
		if v3 then
			math.ceil(v3.AbsoluteSize.Y)
		end
		local Y = ScrollingFrame.AbsoluteCanvasSize.Y
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, Y)
		if Y < MainGui.AbsoluteSize.Y * p1.MaxScreenCoverageScaleY then
			ScrollingFrame.Size = UDim2.new(1, -12, 0, Y)
		elseif ScrollingFrame.AbsolutePosition.Y + MainGui.AbsoluteSize.Y * p1.MaxScreenCoverageScaleY < MainGui.AbsoluteSize.Y then
			ScrollingFrame.Size = UDim2.new(1, -12, 0, MainGui.AbsoluteSize.Y * p1.MaxScreenCoverageScaleY)
		else
			ScrollingFrame.Size = UDim2.new(1, -12, 0, MainGui.AbsoluteSize.Y - ScrollingFrame.AbsolutePosition.Y)
		end
		if ScrollingFrame.AbsoluteSize.Y + ScrollingFrame.AbsolutePosition.Y > MainGui.AbsoluteSize.Y then
			ScrollingFrame.Size = UDim2.new(1, -12, 0, MainGui.AbsoluteSize.Y - ScrollingFrame.AbsolutePosition.Y)
		end
	end
end
function t.SetList(p1, p2, p3, p4, p5) --[[ SetList | Line: 154 ]]
	if not p2 then
		return
	end
	p1.List = p2
	p1.IconIdList = p4
	p1:Close()
	p1.SelectedOption.Text = if p3 then p3 else p2[1] or ""
	p1.SelectedOptionValue = if p3 then p3 else p2[1] or ""
	if not p4 then
		return
	end
	local SelectedIcon = p1.SelectedOption.Parent.SelectedIcon
	SelectedIcon.Image = if p4 then "rbxassetid://" .. p5 or "" else ""
	p1.SelectedOption.Position = UDim2.new(0, SelectedIcon.AbsoluteSize.X, 0.5, 0)
end
function t.Close(p1) --[[ Close | Line: 169 ]]
	p1.ScrollingFrame.Visible = false
	for i, v in ipairs(p1.TextButtons) do
		v:Destroy()
	end
	p1.TextButtons = {}
end
return t