-- https://lua.expert/
local t = {}
local t2 = {
	Color = "TextColor3",
	StrokeColor = "TextStrokeColor3",
	ImageColor = "ImageColor3"
}
t.ColorShortcuts = {}
t.ColorShortcuts.White = Color3.new(255/255, 255/255, 255/255)
t.ColorShortcuts.Black = Color3.new(0/255, 0/255, 0/255)
t.ColorShortcuts.Red = Color3.new(255/255, 102/255, 102/255)
t.ColorShortcuts.Green = Color3.new(102/255, 255/255, 102/255)
t.ColorShortcuts.Blue = Color3.new(102/255, 102/255, 255/255)
t.ColorShortcuts.Cyan = Color3.new(0.4, 0.85, 1)
t.ColorShortcuts.Orange = Color3.new(1, 0.5, 0.2)
t.ColorShortcuts.Yellow = Color3.new(1, 0.9, 0.2)
t.ImageShortcuts = {}
t.ImageShortcuts.Eggplant = 639588687
t.ImageShortcuts.Thinking = 955646496
t.ImageShortcuts.Sad = 947900188
t.ImageShortcuts.Happy = 414889555
t.ImageShortcuts.Despicable = 711674643
local t3 = {
	ContainerHorizontalAlignment = "Left",
	ContainerVerticalAlignment = "Center",
	TextYAlignment = "Bottom",
	TextScaled = false,
	TextScaleRelativeTo = "Frame",
	TextScale = 0.3,
	TextSize = 24,
	Font = "SourceSans",
	TextColor3 = "White",
	TextStrokeColor3 = "Black",
	TextTransparency = 0,
	TextStrokeTransparency = 1,
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	ImageColor3 = "White",
	ImageTransparency = 0,
	ImageRectOffset = "0,0",
	ImageRectSize = "0,0",
	AnimateStepTime = 0,
	AnimateStepGrouping = "Letter",
	AnimateStepFrequency = 2,
	AnimateYield = 0,
	AnimateStyle = "Appear",
	AnimateStyleTime = 0.5,
	AnimateStyleNumPeriods = 3,
	AnimateStyleAmplitude = 0.5
}
local t4 = {
	Appear = function(p1) --[[ Appear | Line: 225 ]]
		p1.Visible = true
	end,
	Fade = function(p1, p2, p3) --[[ Fade | Line: 229 ]]
		p1.Visible = true
		if p1:IsA("TextLabel") then
			p1.TextTransparency = 1 - p2 * (1 - p3.TextTransparency)
			return
		end
		if not p1:IsA("ImageLabel") then
			return
		end
		p1.ImageTransparency = 1 - p2 * (1 - p3.ImageTransparency)
	end,
	Wiggle = function(p1, p2, p3) --[[ Wiggle | Line: 238 ]]
		p1.Visible = true
		p1.Position = p3.InitialPosition + UDim2.new(0, 0, 0, math.sin(p2 * math.pi * 2 * p3.AnimateStyleNumPeriods) * (p3.InitialSize.Y.Offset * (1 - p2) * p3.AnimateStyleAmplitude) / 2)
	end,
	Swing = function(p1, p2, p3) --[[ Swing | Line: 244 ]]
		p1.Visible = true
		p1.Rotation = math.sin(p2 * math.pi * 2 * p3.AnimateStyleNumPeriods) * (90 * (1 - p2) * p3.AnimateStyleAmplitude)
	end,
	Spin = function(p1, p2, p3) --[[ Spin | Line: 250 ]]
		p1.Visible = true
		p1.Position = p3.InitialPosition + UDim2.new(0, p3.InitialSize.X.Offset / 2, 0, p3.InitialSize.Y.Offset / 2)
		p1.AnchorPoint = Vector2.new(0.5, 0.5)
		p1.Rotation = p2 * p3.AnimateStyleNumPeriods * 360
	end,
	Rainbow = function(p1, p2, p3) --[[ Rainbow | Line: 257 ]]
		p1.Visible = true
		local v1 = Color3.fromHSV(p2 * p3.AnimateStyleNumPeriods % 1, 1, 1)
		if p1:IsA("TextLabel") then
			local v2 = getColorFromString(p3.TextColor3)
			p1.TextColor3 = Color3.new(v1.r + p2 * (v2.r - v1.r), v1.g + p2 * (v2.g - v1.g), v1.b + p2 * (v2.b - v1.b))
		else
			local v3 = getColorFromString(p3.ImageColor3)
			p1.ImageColor3 = Color3.new(v1.r + p2 * (v3.r - v1.r), v1.g + p2 * (v3.g - v1.g), v1.b + p2 * (v3.b - v1.b))
		end
	end
}
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")
local v1 = 0
function getLayerCollector(p1) --[[ getLayerCollector | Line: 276 ]]
	if not p1 then
		return nil
	end
	if p1:IsA("LayerCollector") then
		return p1
	end
	if p1 and p1.Parent then
		return getLayerCollector(p1.Parent)
	else
		return nil
	end
end
function shallowCopy(p1) --[[ shallowCopy | Line: 288 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[k] = v
	end
	return t
end
function getColorFromString(p1) --[[ getColorFromString | Line: 296 | Upvalues: t (copy) ]]
	if t.ColorShortcuts[p1] then
		return t.ColorShortcuts[p1]
	else
		local v1, v2, v3 = p1:match("(%d+),(%d+),(%d+)")
		return Color3.new(v1 / 255, v2 / 255, v3 / 255)
	end
end
function getVector2FromString(p1) --[[ getVector2FromString | Line: 305 ]]
	local v1, v2 = p1:match("(%d+),(%d+)")
	return Vector2.new(v1, v2)
end
function setHorizontalAlignment(p1, p2) --[[ setHorizontalAlignment | Line: 310 ]]
	if p2 == "Left" then
		p1.AnchorPoint = Vector2.new(0, 0)
		p1.Position = UDim2.new(0, 0, 0, 0)
		return
	end
	if p2 == "Center" then
		p1.AnchorPoint = Vector2.new(0.5, 0)
		p1.Position = UDim2.new(0.5, 0, 0, 0)
		return
	end
	if p2 ~= "Right" then
		return
	end
	p1.AnchorPoint = Vector2.new(1, 0)
	p1.Position = UDim2.new(1, 0, 0, 0)
end
function t.New(p1, p2, p3, p4, p5, p6) --[[ New | Line: 323 | Upvalues: t2 (copy), t3 (copy), TextService (copy), t (copy), v1 (ref), RunService (copy), t4 (copy) ]]
	for k, v in pairs(p2:GetChildren()) do
		v:Destroy()
	end
	if p5 == nil then
		p5 = true
	end
	local tbl = {}
	local t5 = {}
	if p6 then
		p3 = p6.Text
		p4 = p6.StartingProperties
	end
	local tbl2 = {}
	local t6 = {}
	local t7 = {}
	local v12 = 0
	local v2 = false
	local TextLabel = Instance.new("TextLabel")
	TextLabel.ZIndex = 2
	local ImageLabel = Instance.new("ImageLabel")
	local v3 = getLayerCollector(p2)
	local v4 = nil
	local v5 = nil
	local function applyMarkup(p1, p2) --[[ applyMarkup | Line: 351 | Upvalues: t2 (ref), t5 (copy), tbl (ref), v4 (ref), tbl2 (copy), t3 (ref), v5 (ref) ]]
		local v1 = t2[p1] or p1
		if p2 == "/" and t5[v1] then
			p2 = t5[v1]
		elseif p2 == "/" then
			warn("Attempt to default <" .. v1 .. "> to value with no default")
		end
		if tonumber(p2) then
			p2 = tonumber(p2)
		elseif p2 == "false" or p2 == "true" then
			p2 = if p2 == "true" then true else false
		end
		tbl[v1] = p2
		if v4(v1, p2) then
			return true
		end
		if v1 == "ContainerHorizontalAlignment" and tbl2[#tbl2] then
			setHorizontalAlignment(tbl2[#tbl2].Container, p2)
		else
			if t3[v1] then
				return true
			end
			if v1 ~= "Img" then
				return false
			end
			v5(p2)
		end
		return true
	end
	v4 = function(p1, p2, p3) --[[ applyProperty | Line: 382 | Upvalues: TextLabel (copy), ImageLabel (copy) ]]
		local v1 = nil
		local v2 = false
		for v5, v6 in pairs(p3 and { p3 } or { TextLabel, ImageLabel }) do
			if pcall(function() --[[ Line: 386 | Upvalues: v1 (ref), v6 (copy), p1 (copy) ]]
				v1 = typeof(v6[p1])
			end) then
				if v1 == "Color3" then
					v6[p1] = getColorFromString(p2)
				elseif v1 == "Vector2" then
					v6[p1] = getVector2FromString(p2)
				else
					v6[p1] = p2
				end
				v2 = true
			end
		end
		return v2
	end
	for k, v in pairs(t3) do
		applyMarkup(k, v)
		t5[t2[k] or k] = tbl[t2[k] or k]
	end
	for v8, v9 in pairs(p4 or {}) do
		applyMarkup(v8, v9)
		t5[t2[v8] or v8] = tbl[t2[v8] or v8]
	end
	if p6 then
		tbl = p6.OverflowPickupProperties
		for k, v in pairs(tbl) do
			applyMarkup(k, v)
		end
	end
	local function getTextSize() --[[ getTextSize | Line: 419 | Upvalues: tbl (ref), v3 (copy), p2 (copy) ]]
		if tbl.TextScaled ~= true then
			return tbl.TextSize
		end
		local v1 = nil
		if tbl.TextScaleRelativeTo == "Screen" then
			v1 = v3.AbsoluteSize.Y
		elseif tbl.TextScaleRelativeTo == "Frame" then
			v1 = p2.AbsoluteSize.Y
		end
		return math.min(tbl.TextScale * v1, 100)
	end
	local v10 = 0
	local function newLine() --[[ newLine | Line: 435 | Upvalues: tbl2 (copy), v10 (ref), p5 (ref), tbl (ref), v3 (copy), p2 (copy), v2 (ref), t6 (copy), v12 (ref) ]]
		local v1 = tbl2[#tbl2]
		local v22, Container, v32
		if not v1 then
			v22 = Instance.new("Frame")
			v22.Name = string.format("Line%03d", #tbl2 + 1)
			v22.Size = UDim2.new(0, 0, 0, 0)
			v22.BackgroundTransparency = 1
			Container = Instance.new("Frame", v22)
			Container.Name = "Container"
			Container.Size = UDim2.new(0, 0, 0, 0)
			Container.BackgroundTransparency = 1
			setHorizontalAlignment(Container, tbl.ContainerHorizontalAlignment)
			v22.Parent = p2
			v32 = tbl2
			table.insert(tbl2, v22)
			t6[#tbl2] = {}
			v12 = 0
			return
		end
		v10 = v10 + v1.Size.Y.Offset
		if p5 then
			v22 = Instance.new("Frame")
			v22.Name = string.format("Line%03d", #tbl2 + 1)
			v22.Size = UDim2.new(0, 0, 0, 0)
			v22.BackgroundTransparency = 1
			Container = Instance.new("Frame", v22)
			Container.Name = "Container"
			Container.Size = UDim2.new(0, 0, 0, 0)
			Container.BackgroundTransparency = 1
			setHorizontalAlignment(Container, tbl.ContainerHorizontalAlignment)
			v22.Parent = p2
			v32 = tbl2
			table.insert(tbl2, v22)
			t6[#tbl2] = {}
			v12 = 0
			return
		end
		local v5
		if tbl.TextScaled == true then
			local v6 = nil
			if tbl.TextScaleRelativeTo == "Screen" then
				v6 = v3.AbsoluteSize.Y
			elseif tbl.TextScaleRelativeTo == "Frame" then
				v6 = p2.AbsoluteSize.Y
			end
			v5 = math.min(tbl.TextScale * v6, 100)
		else
			v5 = tbl.TextSize
		end
		if v10 + v5 > p2.AbsoluteSize.Y then
			v2 = true
		else
			v22 = Instance.new("Frame")
			v22.Name = string.format("Line%03d", #tbl2 + 1)
			v22.Size = UDim2.new(0, 0, 0, 0)
			v22.BackgroundTransparency = 1
			Container = Instance.new("Frame", v22)
			Container.Name = "Container"
			Container.Size = UDim2.new(0, 0, 0, 0)
			Container.BackgroundTransparency = 1
			setHorizontalAlignment(Container, tbl.ContainerHorizontalAlignment)
			v22.Parent = p2
			v32 = tbl2
			table.insert(tbl2, v22)
			t6[#tbl2] = {}
			v12 = 0
		end
	end
	newLine()
	local function addFrameProperties(p1) --[[ addFrameProperties | Line: 461 | Upvalues: t7 (copy), tbl (ref) ]]
		t7[p1] = shallowCopy(tbl)
		t7[p1].InitialSize = p1.Size
		t7[p1].InitialPosition = p1.Position
		t7[p1].InitialAnchorPoint = p1.AnchorPoint
	end
	local function formatLabel(p1, p22, p3, p4) --[[ formatLabel | Line: 468 | Upvalues: tbl2 (copy), tbl (ref), v12 (ref), p2 (copy), t6 (copy), newLine (copy), t7 (copy) ]]
		local v1 = tbl2[#tbl2]
		local v2 = tostring(tbl.TextYAlignment)
		if v2 == "Top" then
			p1.Position = UDim2.new(0, v12, 0, 0)
			p1.AnchorPoint = Vector2.new(0, 0)
		elseif v2 == "Center" then
			p1.Position = UDim2.new(0, v12, 0.5, 0)
			p1.AnchorPoint = Vector2.new(0, 0.5)
		elseif v2 == "Bottom" then
			p1.Position = UDim2.new(0, v12, 1, 0)
			p1.AnchorPoint = Vector2.new(0, 1)
		end
		v12 = v12 + p3
		if v12 > p2.AbsoluteSize.X and v12 ~= p3 then
			p1:Destroy()
			local v3 = t6[#tbl2][#t6[#tbl2]]
			if not v3:IsA("TextLabel") or v3.Text ~= " " then
				newLine()
				p4()
				return
			end
			v1.Container.Size = UDim2.new(0, v12 - p3 - v3.Size.X.Offset, 1, 0)
			v3:Destroy()
			table.remove(t6[#tbl2])
			newLine()
			p4()
		else
			p1.Size = UDim2.new(0, p3, 0, p22)
			v1.Container.Size = UDim2.new(0, v12, 1, 0)
			local v4 = UDim2.new
			v1.Size = v4(1, 0, 0, (math.max(v1.Size.Y.Offset, p22)))
			p1.Name = string.format("Group%03d", #t6[#tbl2] + 1)
			p1.Parent = v1.Container
			table.insert(t6[#tbl2], p1)
			t7[p1] = shallowCopy(tbl)
			t7[p1].InitialSize = p1.Size
			t7[p1].InitialPosition = p1.Position
			t7[p1].InitialAnchorPoint = p1.AnchorPoint
			tbl.AnimateYield = 0
		end
	end
	local function v11(p1) --[[ printText | Line: 508 | Upvalues: newLine (copy), v12 (ref), tbl (ref), v3 (copy), p2 (copy), TextService (ref), TextLabel (copy), t7 (copy), formatLabel (ref), v2 (ref), v11 (ref) ]]
		if p1 == "\n" then
			newLine()
			return
		end
		if p1 == " " and v12 == 0 then
			return
		end
		local v1
		if tbl.TextScaled == true then
			local v22 = nil
			if tbl.TextScaleRelativeTo == "Screen" then
				v22 = v3.AbsoluteSize.Y
			elseif tbl.TextScaleRelativeTo == "Frame" then
				v22 = p2.AbsoluteSize.Y
			end
			v1 = math.min(tbl.TextScale * v22, 100)
		else
			v1 = tbl.TextSize
		end
		local X = TextService:GetTextSize(p1, v1, TextLabel.Font, Vector2.new(v3.AbsoluteSize.X, v1)).X
		local v5 = TextLabel:Clone()
		v5.TextScaled = false
		v5.TextSize = v1
		v5.Text = p1
		v5.TextTransparency = 1
		v5.TextStrokeTransparency = 1
		v5.TextWrapped = false
		local count = 1
		local sum = 0
		for v6, v7 in utf8.graphemes(p1) do
			local v8 = string.sub(p1, v6, v7)
			local X_2 = TextService:GetTextSize(v8, v1, TextLabel.Font, Vector2.new(v3.AbsoluteSize.X, v1)).X
			local v9 = TextLabel:Clone()
			v9.Text = v8
			v9.TextScaled = false
			v9.TextSize = v1
			v9.Position = UDim2.new(0, sum, 0, 0)
			v9.Size = UDim2.new(0, X_2, 0, v1)
			v9.Name = string.format("Char%03d", count)
			v9.Parent = v5
			v9.Visible = false
			t7[v9] = shallowCopy(tbl)
			t7[v9].InitialSize = v9.Size
			t7[v9].InitialPosition = v9.Position
			t7[v9].InitialAnchorPoint = v9.AnchorPoint
			count = count + 1
			sum = sum + X_2
		end
		formatLabel(v5, v1, X, function() --[[ Line: 547 | Upvalues: v2 (ref), v11 (ref), p1 (copy) ]]
			if v2 then
				return
			end
			v11(p1)
		end)
	end
	v5 = function(p1) --[[ printImage | Line: 550 | Upvalues: tbl (ref), v3 (copy), p2 (copy), ImageLabel (copy), t (ref), formatLabel (ref), v2 (ref), v5 (ref) ]]
		local v1
		if tbl.TextScaled == true then
			local v22 = nil
			if tbl.TextScaleRelativeTo == "Screen" then
				v22 = v3.AbsoluteSize.Y
			elseif tbl.TextScaleRelativeTo == "Frame" then
				v22 = p2.AbsoluteSize.Y
			end
			v1 = math.min(tbl.TextScale * v22, 100)
		else
			v1 = tbl.TextSize
		end
		local v52 = ImageLabel:Clone()
		if t.ImageShortcuts[p1] then
			v52.Image = typeof(t.ImageShortcuts[p1]) == "number" and "rbxassetid://" .. t.ImageShortcuts[p1] or t.ImageShortcuts[p1]
		else
			v52.Image = "rbxassetid://" .. p1
		end
		v52.Size = UDim2.new(0, v1, 0, v1)
		v52.Visible = false
		formatLabel(v52, v1, v1, function() --[[ Line: 564 | Upvalues: v2 (ref), v5 (ref), p1 (copy) ]]
			if v2 then
				return
			end
			v5(p1)
		end)
	end
	local function printSeries(p1) --[[ printSeries | Line: 567 | Upvalues: applyMarkup (ref), v11 (ref) ]]
		for k, v in pairs(p1) do
			local v1, v2 = string.match(v, "<(.+)=(.+)>")
			if v1 and v2 then
				if not applyMarkup(v1, v2) then
					warn("Could not apply markup: ", v)
				end
				continue
			end
			v11(v)
		end
	end
	local v122 = #p3
	local t8 = {}
	local v13 = if p6 then p6.OverflowPickupIndex else 1
	while v13 and v13 <= v122 do
		local v14, v15
		local v16, v17 = string.find(p3, "<.->", v13)
		local v18, v19 = string.find(p3, "[ \t\n]", v13)
		local v20 = nil
		if v16 and (v17 and (not v18 or v16 < v18)) then
			v14 = v16
			v15 = v17
		else
			v14 = v18 or v122 + 1
			v20 = true
			v15 = v19 or v122 + 1
		end
		local v23 = v13 < v14 and string.sub(p3, v13, v14 - 1) or nil
		local v24 = v14 <= v122 and string.sub(p3, v14, v15) or nil
		table.insert(t8, v23)
		if v20 then
			printSeries(t8)
			if v2 then
				break
			end
			printSeries({ v24 })
			if v2 then
				v13 = v14
				break
			end
			t8 = {}
		else
			table.insert(t8, v24)
		end
		v13 = v15 + 1
	end
	if not v2 then
		printSeries(t8)
	end
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.HorizontalAlignment = tbl.ContainerHorizontalAlignment
	UIListLayout.VerticalAlignment = tbl.ContainerVerticalAlignment
	UIListLayout.Parent = p2
	local X = p2.AbsoluteSize.X
	local sum = 0
	local v25 = 0
	for k, v in pairs(tbl2) do
		sum = sum + v.Size.Y.Offset
		local Container = v.Container
		local v26 = nil
		local v27 = nil
		if Container.AnchorPoint.X == 0 then
			v26 = Container.Position.X.Offset
			v27 = Container.Size.X.Offset
		elseif Container.AnchorPoint.X == 0.5 then
			v26 = v.AbsoluteSize.X / 2 - Container.Size.X.Offset / 2
			v27 = v.AbsoluteSize.X / 2 + Container.Size.X.Offset / 2
		elseif Container.AnchorPoint.X == 1 then
			v26 = v.AbsoluteSize.X - Container.Size.X.Offset
			v27 = v.AbsoluteSize.X
		end
		local v28 = math.min(X, v26)
		X, v25 = v28, math.max(v25, v27)
	end
	v1 = v1 + 1
	local v30 = false
	local v31 = false
	local v32 = false
	local v33 = "TextAnimation" .. v1
	local t9 = {}
	local function updateAnimations() --[[ updateAnimations | Line: 665 | Upvalues: v31 (ref), t9 (ref), v30 (ref), RunService (ref), v33 (copy), t4 (ref) ]]
		if v31 and #t9 == 0 or v30 then
			v30 = true
			RunService:UnbindFromRenderStep(v33)
			t9 = {}
			return
		end
		local v1 = tick()
		for i = #t9, 1, -1 do
			local v2 = t9[i]
			local Settings = v2.Settings
			local v3 = t4[Settings.AnimateStyle]
			if not v3 then
				warn("No animation style found for: ", Settings.AnimateStyle, ", defaulting to Appear")
				v3 = t4.Appear
			end
			local v5 = math.min((v1 - v2.Start) / Settings.AnimateStyleTime, 1)
			v3(v2.Char, v5, Settings)
			if v5 >= 1 then
				table.remove(t9, i)
			end
		end
	end
	local function setFrameToDefault(p1) --[[ setFrameToDefault | Line: 690 | Upvalues: t7 (copy), v4 (ref) ]]
		p1.Position = t7[p1].InitialPosition
		p1.Size = t7[p1].InitialSize
		p1.AnchorPoint = t7[p1].InitialAnchorPoint
		for k, v in pairs(t7[p1]) do
			v4(k, v, p1)
		end
	end
	local function setGroupVisible(p1, p2) --[[ setGroupVisible | Line: 699 | Upvalues: setFrameToDefault (copy) ]]
		p1.Visible = p2
		for k, v in pairs(p1:GetChildren()) do
			v.Visible = p2
			if p2 then
				setFrameToDefault(v)
			end
		end
		if not (p2 and p1:IsA("ImageLabel")) then
			return
		end
		setFrameToDefault(p1)
	end
	local function animate(p1) --[[ animate | Line: 712 | Upvalues: v30 (ref), RunService (ref), v33 (copy), updateAnimations (copy), t6 (copy), t9 (ref), v32 (ref), t7 (copy), v31 (ref) ]]
		v30 = false
		RunService:BindToRenderStep(v33, Enum.RenderPriority.Last.Value, updateAnimations)
		local count = nil
		local v1 = nil
		local v2 = nil
		local v3 = nil
		for k, v in pairs(t6) do
			for k2, v4 in pairs(v) do
				v4.Visible = false
				for k3, v5 in pairs(v4:GetChildren()) do
					v5.Visible = false
				end
			end
		end
		local function animateCharacter(p1, p2) --[[ animateCharacter | Line: 728 | Upvalues: t9 (ref) ]]
			table.insert(t9, {
				Char = p1,
				Settings = p2,
				Start = tick()
			})
		end
		local function yield() --[[ yield | Line: 732 | Upvalues: v32 (ref), count (ref), v1 (ref), v2 (ref) ]]
			if v32 or (count % v1 ~= 0 or not (v2 >= 0)) then
				return
			end
			wait(if v2 > 0 then v2 or nil else nil)
		end
		for k, v in pairs(t6) do
			for k2, v4 in pairs(v) do
				local v42 = t7[v4]
				if v42.AnimateStepGrouping ~= v3 or v42.AnimateStepFrequency ~= v1 then
					count = 0
				end
				v3 = v42.AnimateStepGrouping
				local AnimateStepTime = v42.AnimateStepTime
				v1 = v42.AnimateStepFrequency
				if v42.AnimateYield > 0 then
					wait(v42.AnimateYield)
				end
				if v3 == "Word" or v3 == "All" then
					if v4:IsA("TextLabel") then
						v4.Visible = true
						for k3, v5 in pairs(v4:GetChildren()) do
							table.insert(t9, {
								Char = v5,
								Settings = t7[v5],
								Start = tick()
							})
						end
					else
						table.insert(t9, {
							Char = v4,
							Settings = v42,
							Start = tick()
						})
					end
					if v3 == "Word" then
						count = count + 1
						if not v32 and (count % v1 == 0 and AnimateStepTime >= 0) then
							wait(if AnimateStepTime > 0 then AnimateStepTime or nil else nil)
						end
					end
				elseif v3 == "Letter" then
					if v4:IsA("TextLabel") then
						v4.Visible = true
						local Text = v4.Text
						local count_2 = 1
						while true do
							local v8 = v4:FindFirstChild(string.format("Char%03d", count_2))
							if not v8 then
								break
							end
							table.insert(t9, {
								Char = v8,
								Settings = t7[v8],
								Start = tick()
							})
							count = count + 1
							if not v32 and (count % v1 == 0 and AnimateStepTime >= 0) then
								wait(AnimateStepTime > 0 and AnimateStepTime or nil)
							end
							if v30 then
								return
							end
							count_2 = count_2 + 1
						end
					else
						table.insert(t9, {
							Char = v4,
							Settings = v42,
							Start = tick()
						})
						count = count + 1
						if not v32 and (count % v1 == 0 and AnimateStepTime >= 0) then
							wait(if AnimateStepTime > 0 then AnimateStepTime or nil else nil)
						end
					end
				else
					warn("Invalid step grouping: ", v3)
				end
				if v30 then
					return
				end
			end
		end
		v31 = true
		if p1 then
			while #t9 > 0 do
				RunService.RenderStepped:Wait()
			end
		end
	end
	local t10 = {
		Overflown = v2,
		OverflowPickupIndex = v13,
		StartingProperties = p4,
		OverflowPickupProperties = tbl,
		Text = p3
	}
	if p6 then
		p6.NextTextObject = t10
	end
	t10.ContentSize = Vector2.new(v25 - X, sum)
	function t10.Animate(p1, p2) --[[ Animate | Line: 833 | Upvalues: animate (copy) ]]
		if p2 then
			animate()
		else
			coroutine.wrap(animate)()
		end
		if not p1.NextTextObject then
			return
		end
		p1.NextTextObject:Animate(p2)
	end
	function t10.Show(p1, p2) --[[ Show | Line: 844 | Upvalues: v32 (ref), v30 (ref), t6 (copy), setFrameToDefault (copy) ]]
		if p2 then
			v32 = true
		else
			v30 = true
			for k, v in pairs(t6) do
				for k2, v2 in pairs(v) do
					v2.Visible = true
					for k3, v3 in pairs(v2:GetChildren()) do
						v3.Visible = true
						setFrameToDefault(v3)
					end
					if v2:IsA("ImageLabel") then
						setFrameToDefault(v2)
					end
				end
			end
		end
		if not p1.NextTextObject then
			return
		end
		p1.NextTextObject:Show(p2)
	end
	function t10.Hide(p1) --[[ Hide | Line: 860 | Upvalues: v30 (ref), t6 (copy) ]]
		v30 = true
		for k, v in pairs(t6) do
			for k2, v2 in pairs(v) do
				v2.Visible = false
				for k3, v3 in pairs(v2:GetChildren()) do
					v3.Visible = false
				end
			end
		end
		if not p1.NextTextObject then
			return
		end
		p1.NextTextObject:Hide()
	end
	return t10
end
function t.ContinueOverflow(p1, p2, p3) --[[ ContinueOverflow | Line: 876 | Upvalues: t (copy) ]]
	return t:New(p2, nil, nil, false, p3)
end
return t