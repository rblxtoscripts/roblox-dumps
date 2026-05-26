-- https://lua.expert/
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local function waitForChildOfClass(p1, p2) --[[ waitForChildOfClass | Line: 10 ]]
	local v1 = p1:FindFirstChildOfClass(p2)
	while not v1 or v1.ClassName ~= p2 do
		v1 = p1.ChildAdded:Wait()
	end
	return v1
end
local v1 = waitForChildOfClass(LocalPlayer, "PlayerGui")
local v2 = UDim2.new(0, 326, 0, 58)
local v3 = UDim2.new(0, 80, 0, 58)
local v4 = Color3.fromRGB(32, 32, 32)
local v5 = Color3.fromRGB(200, 200, 200)
local function create(p1) --[[ create | Line: 28 ]]
	return function(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: p1 (copy) ]]
		local v1 = Instance.new(p1)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end
end
local v6 = false
local v7 = nil
local v8 = nil
local v9 = nil
local v10 = nil
local v11 = nil
local function initializeUI() --[[ initializeUI | Line: 54 | Upvalues: v6 (ref), v7 (ref), v3 (copy), v4 (copy), v5 (copy), v1 (copy), v8 (ref), v9 (ref), v10 (ref), v11 (ref) ]]
	assert(not v6)
	local v2 = "ScreenGui"
	local function f3(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v2 (copy) ]]
		local v1 = Instance.new(v2)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end
	local t = {
		Name = "RbxCameraUI",
		AutoLocalize = false,
		Enabled = true,
		DisplayOrder = -1,
		IgnoreGuiInset = false,
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}
	local v42 = "ImageLabel"
	local function f5(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v42 (copy) ]]
		local v1 = Instance.new(v42)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end
	local t2 = {
		Name = "Toast",
		Visible = false,
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0, 8),
		Size = v3,
		Image = "rbxasset://textures/ui/Camera/CameraToast9Slice.png",
		ImageColor3 = v4,
		ImageRectSize = Vector2.new(6, 6),
		ImageTransparency = 1,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(3, 3, 3, 3),
		ClipsDescendants = true
	}
	local v62 = "Frame"
	local function f7(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v62 (copy) ]]
		local v1 = Instance.new(v62)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end
	local t3 = {
		Name = "IconBuffer",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 80, 1, 0)
	}
	local v82 = "ImageLabel"
	t3[1] = (function(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v82 (copy) ]]
		local v1 = Instance.new(v82)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end)({
		Name = "Icon",
		BackgroundTransparency = 1,
		ZIndex = 2,
		Image = "rbxasset://textures/ui/Camera/CameraToastIcon.png",
		ImageTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 48, 0, 48),
		ImageColor3 = v5
	})
	local v92 = f7(t3)
	local v102 = "Frame"
	local function f11(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v102 (copy) ]]
		local v1 = Instance.new(v102)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end
	local t4 = {
		Name = "TextBuffer",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 80, 0, 0),
		Size = UDim2.new(1, -80, 1, 0),
		ClipsDescendants = true
	}
	local v122 = "TextLabel"
	local v13 = "TextLabel"
	t4[1] = (function(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v122 (copy) ]]
		local v1 = Instance.new(v122)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end)({
		Name = "Upper",
		BackgroundTransparency = 1,
		Text = "Camera control enabled",
		TextTransparency = 1,
		TextSize = 19,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0, 19),
		Font = Enum.Font.GothamMedium,
		TextColor3 = v5,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center
	})
	t4[2] = (function(p12_2_2_2_2_2_2_2) --[[ Line: 29 | Upvalues: v13 (copy) ]]
		local v1 = Instance.new(v13)
		local v2_2 = p12_2_2_2_2_2_2_2.Parent
		p12_2_2_2_2_2_2_2.Parent = nil
		for k2, v in pairs(p12_2_2_2_2_2_2_2) do
			if type(k2) == "string" then
				v1[k2] = v
				continue
			end
			v.Parent = v1
		end
		v1.Parent = v2_2
		return v1
	end)({
		Name = "Lower",
		BackgroundTransparency = 1,
		Text = "Right mouse button to toggle",
		TextTransparency = 1,
		TextSize = 15,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0.5, 3),
		Size = UDim2.new(1, 0, 0, 15),
		Font = Enum.Font.Gotham,
		TextColor3 = v5,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center
	})
	t2[1] = v92
	t2[2] = f11(t4)
	t[1] = f5(t2)
	t.Parent = v1
	v7 = f3(t)
	v8 = v7.Toast
	v9 = v8.IconBuffer.Icon
	v10 = v8.TextBuffer.Upper
	v11 = v8.TextBuffer.Lower
	v6 = true
end
local t = {}
function t.setCameraModeToastEnabled(p1) --[[ setCameraModeToastEnabled | Line: 157 | Upvalues: v6 (ref), initializeUI (copy), v8 (ref), t (copy) ]]
	if not (p1 or v6) then
		return
	end
	if not v6 then
		initializeUI()
	end
	v8.Visible = p1
	if p1 then
		return
	end
	t.setCameraModeToastOpen(false)
end
local v12 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
function t.setCameraModeToastOpen(p1) --[[ setCameraModeToastOpen | Line: 175 | Upvalues: v6 (ref), TweenService (copy), v8 (ref), v12 (copy), v2 (copy), v3 (copy), v9 (ref), v10 (ref), v11 (ref) ]]
	assert(v6)
	local t = {}
	t.Size = p1 and v2 or v3
	t.ImageTransparency = if p1 then 0.4 else 1
	TweenService:Create(v8, v12, t):Play()
	local t2 = {}
	t2.ImageTransparency = if p1 then 0 else 1
	TweenService:Create(v9, v12, t2):Play()
	local t3 = {}
	t3.TextTransparency = if p1 then 0 else 1
	TweenService:Create(v10, v12, t3):Play()
	local t4 = {}
	t4.TextTransparency = if p1 then 0 else 1
	TweenService:Create(v11, v12, t4):Play()
end
return t