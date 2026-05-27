-- https://lua.expert/
return function() --[[ Line: 3 ]]
	local SoftShutdownGui = Instance.new("ScreenGui")
	SoftShutdownGui.Name = "SoftShutdownGui"
	SoftShutdownGui.DisplayOrder = 600
	local Frame = Instance.new("Frame")
	Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	Frame.Position = UDim2.new(-0.5, 0, -0.5, 0)
	Frame.Size = UDim2.new(2, 0, 2, 0)
	Frame.ZIndex = 9
	Frame.Parent = SoftShutdownGui
	local t = {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Font = "FredokaOne",
		TextScaled = true,
		TextStrokeTransparency = 0,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeColor3 = Color3.fromRGB(23, 5, 59),
		Parent = Frame,
		AnchorPoint = Vector2.new(0, 0)
	}
	local function CreateTextLabel(p1) --[[ CreateTextLabel | Line: 32 | Upvalues: t (copy) ]]
		local TextLabel = Instance.new("TextLabel")
		for k, v in pairs(p1) do
			TextLabel[k] = p1[k]
		end
		for k, v in pairs(t) do
			TextLabel[k] = p1[k] or v
		end
		return TextLabel
	end
	local v1 = CreateTextLabel({
		Text = "ATTENTION",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeColor3 = Color3.fromRGB(65, 10, 13),
		Position = UDim2.new(0.25, 0, 0.4, 0),
		Size = UDim2.new(0.5, 0, 0.1, 0)
	})
	CreateTextLabel({
		Text = "ATTENTION",
		ZIndex = 9,
		TextColor3 = Color3.fromRGB(65, 10, 13),
		TextStrokeColor3 = Color3.fromRGB(65, 10, 13),
		Position = UDim2.new(0.5, 0, 0.525, 0),
		Size = UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = v1
	})
	local UIGradient = Instance.new("UIGradient")
	UIGradient.Rotation = -90
	UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(245, 145, 1)), ColorSequenceKeypoint.new(0.71, Color3.fromRGB(254, 207, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 217, 67)) })
	UIGradient.Parent = v1
	local v2 = CreateTextLabel({
		Text = "Horse Life is being updated!",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeColor3 = Color3.fromRGB(23, 5, 59),
		Position = UDim2.new(0.25, 0, 0.475, 0),
		Size = UDim2.new(0.5, 0, 0.05, 0)
	})
	CreateTextLabel({
		Text = "Horse Life is being updated!",
		ZIndex = 9,
		TextColor3 = Color3.fromRGB(23, 5, 59),
		TextStrokeColor3 = Color3.fromRGB(23, 5, 59),
		Position = UDim2.new(0.5, 0, 0.525, 0),
		Size = UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = v2
	})
	local v3 = CreateTextLabel({
		Text = "Please wait...",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextStrokeColor3 = Color3.fromRGB(23, 5, 59),
		Position = UDim2.new(0.25, 0, 0.55, 0),
		Size = UDim2.new(0.5, 0, 0.03, 0)
	})
	CreateTextLabel({
		Text = "Please wait...",
		ZIndex = 9,
		TextColor3 = Color3.fromRGB(23, 5, 59),
		TextStrokeColor3 = Color3.fromRGB(23, 5, 59),
		Position = UDim2.new(0.5, 0, 0.525, 0),
		Size = UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = v3
	})
	return SoftShutdownGui, Frame
end