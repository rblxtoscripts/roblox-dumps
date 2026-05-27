-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Module3D")
local v2 = Sonar("ItemDataService")
local t2 = {
	Tool = function(p1) --[[ Tool | Line: 15 ]]
		local Model = Instance.new("Model")
		for k, v in pairs(p1:GetChildren()) do
			if v:IsA("BasePart") then
				v.Parent = Model
			end
		end
		Model.Name = p1.Name
		p1:Destroy()
		return Model
	end,
	MeshPart = function(p1) --[[ MeshPart | Line: 26 ]]
		local Model = Instance.new("Model")
		Model.Name = Model.Name
		p1.Parent = Model
		return Model
	end,
	Part = function(p1) --[[ Part | Line: 32 ]]
		local Model = Instance.new("Model")
		Model.Name = Model.Name
		p1.Parent = Model
		return Model
	end,
	Model = function(p1) --[[ Model | Line: 38 ]]
		return p1
	end
}
local function setViewportAdornFrame(p1, p2, p3, p4) --[[ setViewportAdornFrame | Line: 44 ]]
	local AdornFrame = p1.AdornFrame
	AdornFrame.Visible = true
	AdornFrame.Size = UDim2.new(1, 0, 1, 0)
	AdornFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	AdornFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	AdornFrame.BackgroundColor3 = p2.BackgroundColor3
	AdornFrame.ClipsDescendants = false
	AdornFrame.ZIndex = p2.ZIndex + 1
	if p4 then
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = p4
		UICorner.Parent = AdornFrame
	end
	if not p3 then
		return
	end
	local v1 = type(p3) == "boolean" and UDim2.new(0.49, 0, 0.51, 0) or p3
	local v2 = p1.AdornFrame:Clone()
	local v3 = v2:FindFirstChildWhichIsA("Model")
	v2.ImageColor3 = Color3.fromRGB(0, 0, 0)
	v2.Ambient = Color3.fromRGB(255, 255, 255)
	v2.LightColor = Color3.fromRGB(255, 255, 255)
	v2.Position = v1
	v2.Size = UDim2.new(1.02, 0, 1.02, 0)
	v2.ZIndex = AdornFrame.ZIndex - 1
	v2.Parent = AdornFrame
	return v3
end
local function getPrimaryPartOfViewportModel(p1) --[[ getPrimaryPartOfViewportModel | Line: 78 ]]
	if p1:FindFirstChild("ViewportPart") then
		return p1.ViewportPart, true
	end
	return p1.PrimaryPart or p1:FindFirstChildWhichIsA("BasePart")
end
function t.GetMinimumDistanceForViewport(p1, p2, p3, p4) --[[ GetMinimumDistanceForViewport | Line: 87 ]]
	local v1, v2 = p1:GetBoundingBox()
	if p3 then
		v1 = p3.CFrame:lerp(v1, 0.35)
	end
	local v4 = (v1 - v1.p):inverse()
	local v6 = v4 * v2
	local v10 = Vector3.new(math.abs(v6.x), math.abs(v6.y), (math.abs(v6.z)))
	local v11 = math.max(v10.x, v10.y, v10.z)
	local v14 = math.tan((math.rad(if p4 then p4 else p2.FieldOfView / 2)))
	return v11 / 2 / v14 + (if v11 == v10.x then math.sqrt(v10.y * v10.y + v10.z * v10.z) / 2 elseif v11 == v10.y then math.sqrt(v10.x * v10.x + v10.z * v10.z) / 2 else math.sqrt(v10.x * v10.x + v10.y * v10.y) / 2), v1 * v4
end
function t.CreateViewportModelForItem(p1) --[[ CreateViewportModelForItem | Line: 116 | Upvalues: t (copy), v2 (copy) ]]
	if p1.ViewportModel then
		return p1.ViewportModel
	else
		return t.CreateViewportFromModel(v2.GetByName(p1.Name))
	end
end
function t.CreateViewportFromModel(p1) --[[ CreateViewportFromModel | Line: 125 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1.ClassName]
	local v2 = if v1 then v1((p1:Clone())) else p1
	local v4, v5
	if v2:FindFirstChild("ViewportPart") then
		v4 = v2.ViewportPart
		v5 = true
	else
		v4 = v2.PrimaryPart
		if not v4 then
			v4 = v2:FindFirstChildWhichIsA("BasePart")
		end
		v5 = nil
	end
	v2.PrimaryPart = v4
	return v2, v5
end
function t.CreateItemViewport(p1, p2, p3) --[[ CreateItemViewport | Line: 139 | Upvalues: v2 (copy), t (copy) ]]
	local v1 = if type(p2) == "table" and p2 then p2 else v2.GetByName(p2)
	if not v1 then
		warn("Item Data cannot be found for " .. p2)
	end
	local ViewportModel = v1.ViewportModel
	local v22
	if ViewportModel then
		v22 = false
	else
		local v3, v4 = t.CreateViewportModelForItem(v1)
		v1.ViewportModel = v3
		ViewportModel = v3
		v22 = v4
	end
	return t.CreateViewport(p1, ViewportModel, p3, v22)
end
function t.CreateItemImage(p1, p2, ...) --[[ CreateItemImage | Line: 156 | Upvalues: v2 (copy), t (copy) ]]
	return t.CreateImage(p1, (if type(p2) == "table" and p2 then p2 else v2.GetByName(p2)).Image, ...)
end
function t.GetItemImage(p1) --[[ GetItemImage | Line: 163 | Upvalues: v2 (copy) ]]
	return (if type(p1) == "table" and p1 then p1 else v2.GetByName(p1)).Image
end
function t.CreateImage(p1, p2, p3, p4) --[[ CreateImage | Line: 169 ]]
	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	ImageLabel.SizeConstraint = Enum.SizeConstraint.RelativeXX
	ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel.Image = p2 or "rbxassetid://7122284879"
	ImageLabel.ZIndex = p1.ZIndex + 1
	if not p4 then
		script.UIGradient:Clone().Parent = ImageLabel
	end
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.Parent = p1
	if p3 then
		local v1 = if type(p3) == "boolean" then UDim2.new(0.49, 0, 0.51, 0) or p3 else p3
		local v2 = ImageLabel:Clone()
		v2.ImageColor3 = Color3.fromRGB(0, 0, 0)
		v2.Position = v1
		v2.Size = UDim2.new(1.02, 0, 1.02, 0)
		v2.ZIndex = ImageLabel.ZIndex - 1
		v2.Parent = ImageLabel
	end
	return ImageLabel
end
function t.CopyImage(p1, p2) --[[ CopyImage | Line: 201 ]]
	p1.Image = p2
	local v1 = p1:FindFirstChild("ShadowLabel") or p1:FindFirstChildWhichIsA("ImageLabel")
	if not v1 then
		return
	end
	v1.Image = p2
end
function t.CreateViewport(p1, p2, p3, p4) --[[ CreateViewport | Line: 211 | Upvalues: v1 (copy), t (copy), setViewportAdornFrame (copy) ]]
	local v12 = p2:Clone()
	local v2 = v1:Attach3D(p1, v12)
	local v3 = CFrame.fromEulerAnglesYXZ(0, 1, 0)
	v2.Camera.FieldOfView = 20
	local v5, v6 = t.GetMinimumDistanceForViewport(v12, v2.Camera, if p4 then v12.PrimaryPart else p4)
	v2.Camera.CFrame = v6 * v3 * CFrame.new(0, 0, v5)
	setViewportAdornFrame(v2, p1, p3)
	return v2
end
return t