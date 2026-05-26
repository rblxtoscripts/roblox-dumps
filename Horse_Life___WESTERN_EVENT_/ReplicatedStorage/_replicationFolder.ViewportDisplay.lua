-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local t2 = {
	Tool = function(p1) --[[ Tool | Line: 16 ]]
		local Model = Instance.new("Model")
		for k, v in pairs(p1:GetChildren()) do
			if v:IsA("BasePart") then
				v.Parent = Model
			end
		end
		Model.Name = p1.Name
		if Model:FindFirstChild("Handle") then
			Model.PrimaryPart = Model.Handle
		end
		p1:Destroy()
		return Model
	end,
	Accessory = function(p1) --[[ Accessory | Line: 30 ]]
		local Model = Instance.new("Model")
		for k, v in pairs(p1:GetChildren()) do
			if v:IsA("BasePart") then
				v.Parent = Model
			end
		end
		Model.Name = p1.Name
		if Model:FindFirstChild("Handle") then
			Model.PrimaryPart = Model.Handle
		end
		p1:Destroy()
		return Model
	end,
	BasePart = function(p1) --[[ BasePart | Line: 44 ]]
		local Model = Instance.new("Model")
		Model.Name = Model.Name
		p1.Parent = Model
		return Model
	end
}
function t.new(p1) --[[ new | Line: 53 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 ViewportDisplay, Instance is required for viewport display", p1)
		return v2
	end
	v2.ViewportModel = v2:_createViewportModel()
	v2.Maid:GiveTask(v2.ViewportModel)
	v2.ViewportFrame = v2:_getOrCreateViewportFrame()
	if not v2.ViewportFrame:IsA("ViewportFrame") then
		warn("\226\154\160\239\184\143 ViewportDisplay, ViewportFrame is not a ViewportFrame", v2.Config)
		return v2
	end
	v2.CopyEffectsInstance = v2.CopyEffectsInstance or (v2.Instance:IsA("ViewportFrame") and v2.Instance or v2.Instance.Parent)
	v2.ViewportCamera = v2:_getOrCreateViewportCamera()
	if v2.Config.WorldModel then
		v2.WorldModel = Instance.new("WorldModel")
		v2.WorldModel.Parent = v2.ViewportFrame
		v2.Maid:GiveTask(v2.WorldModel)
	end
	local v4 = v2:_getEffects("UIGradient")
	if v4 then
		v2.UIGradient = v4:Clone()
		v2.UIGradient.Parent = v2.ViewportFrame
		v2.Maid:GiveTask(v2.UIGradient)
	end
	local v5 = v2:_getEffects("UICorner")
	if v5 then
		v2.UICorner = v5:Clone()
		v2.UICorner.Parent = v2.ViewportFrame
		v2.Maid:GiveTask(v2.UICorner)
	end
	v2.ViewportFrame.BackgroundColor3 = v2.Config.BackgroundColor or v2.ViewportFrame.Parent.BackgroundColor3
	v2:_setCameraCFrame()
	v2.ViewportModel.Parent = v2.WorldModel or v2.ViewportFrame
	if v2.Config.OnParent then
		v2.Config.OnParent(v2)
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 118 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._getEffects(p1, p2) --[[ _getEffects | Line: 122 ]]
	local v2 = if typeof(p1.Config[p2]) == "Instance" then p1.Config[p2] else false
	if v2 then
		return v2
	end
	local v3 = p1.CopyEffectsInstance and p1.CopyEffectsInstance:FindFirstChild(p2)
	if v3 then
		return v3
	end
	local v4 = p1.Instance:FindFirstChild(p2)
	if v4 then
		return v4
	end
	if not p1.Instance.Parent then
		return nil
	end
	local v5 = p1.Instance.Parent:FindFirstChild(p2)
	if v5 then
		return v5
	else
		return nil
	end
end
function t._getOrCreateViewportFrame(p1) --[[ _getOrCreateViewportFrame | Line: 148 ]]
	if p1.Instance:IsA("ViewportFrame") then
		return p1.Instance
	else
		local ViewportFrame = Instance.new("ViewportFrame")
		ViewportFrame.Name = "ViewportFrame"
		ViewportFrame.BackgroundTransparency = 1
		ViewportFrame.Size = UDim2.new(1, 0, 1, 0)
		ViewportFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		ViewportFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		ViewportFrame.Parent = p1.Instance
		return ViewportFrame
	end
end
function t._getOrCreateViewportCamera(p1) --[[ _getOrCreateViewportCamera | Line: 165 ]]
	local Camera = Instance.new("Camera")
	Camera.FieldOfView = p1.Config.FOV or 20
	Camera.Parent = p1.ViewportFrame
	p1.ViewportFrame.CurrentCamera = Camera
	p1.Maid:GiveTask(Camera)
	return Camera
end
function t._createViewportModel(p1) --[[ _createViewportModel | Line: 176 | Upvalues: t2 (copy) ]]
	local v1, v2
	if type(p1.Config.Model) == "function" then
		v1 = p1.Config.Model(p1)
		if not v1 then
			v2 = p1.Config.Model
			v1 = if typeof(v2) == "Instance" then p1.Config.Model else false
		end
	else
		v2 = p1.Config.Model
		v1 = if typeof(v2) == "Instance" then p1.Config.Model else false
	end
	if not v1 then
		warn("\226\154\160\239\184\143 ViewportDisplay, Model is required for viewport display", p1.Config)
		return
	end
	if v1.ClassName ~= "Model" then
		local v3 = t2[v1.ClassName]
		if v3 then
			v1 = v3(v1)
		else
			warn("\226\154\160\239\184\143 ViewportDisplay, Model is not a model", p1.Config)
		end
	end
	if not v1:IsA("Model") then
		v1.PivotOffset = CFrame.new(0, 0, 0)
		v1.PivotTo(CFrame.new())
		return v1
	end
	if v1.PrimaryPart then
		v1:SetPrimaryPartCFrame(CFrame.new())
	else
		warn("\226\154\160\239\184\143 ViewportDisplay, Model has no primary part", v1, p1.Config)
		v1:PivotTo(CFrame.new())
	end
	return v1
end
function t._setCameraCFrame(p1) --[[ _setCameraCFrame | Line: 209 ]]
	local v1 = CFrame.fromEulerAnglesYXZ(0, 3.7524578917878086, 0)
	local v2, v3 = p1.ViewportModel:GetBoundingBox()
	p1.ViewportFrame.LightDirection = p1.Config.LightDirection or p1.ViewportCamera.CFrame.LookVector
	p1.ViewportFrame.LightColor = p1.Config.LightColor or Color3.fromRGB(255, 255, 255)
	p1.ViewportFrame.Ambient = p1.Config.AmbientColor or Color3.fromRGB(255, 255, 255)
	local v7
	if p1.Config.GetCameraCFrame then
		v7 = p1.Config.GetCameraCFrame(p1, p1.ViewportModel, v2, v3)
	else
		local v9 = p1.ViewportModel:QueryDescendants("Attachment#CameraLocation")
		if #v9 > 0 then
			local v10 = CFrame.lookAt(v9[1].WorldCFrame.Position, v2.Position)
			v2, v1 = CFrame.new(v2.Position), v10
		end
		local v12 = p1.ViewportModel:FindFirstChild("Head", true) or (p1.ViewportModel.PrimaryPart or p1.ViewportModel:FindFirstChildOfClass("BasePart"))
		if v12 then
			local v13 = nil
			if v12:IsA("BasePart") then
				v13 = v12.CFrame
			elseif v12:IsA("Bone") or v12:IsA("Attachment") then
				v13 = v12.WorldCFrame
			end
			v2 = v13:lerp(v2, 0.35)
		end
		local v15 = (v2 - v2.p):inverse()
		local v17 = v15 * v3
		local v21 = Vector3.new(math.abs(v17.x), math.abs(v17.y), (math.abs(v17.z)))
		local v22 = math.max(v21.x, v21.y, v21.z)
		local v25 = math.tan((math.rad(p1.ViewportCamera.FieldOfView / 2)))
		v7 = v2 * v15 * v1 * CFrame.new(0, 0, v22 / 2 / v25 + (if v22 == v21.x then math.sqrt(v21.y * v21.y + v21.z * v21.z) / 2 elseif v22 == v21.y then math.sqrt(v21.x * v21.x + v21.z * v21.z) / 2 else math.sqrt(v21.x * v21.x + v21.y * v21.y) / 2))
	end
	p1.ViewportCamera.CFrame = v7
end
return t