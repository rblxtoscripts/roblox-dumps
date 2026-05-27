-- https://lua.expert/
local t = {
	new = function(p1) --[[ new | Line: 57 ]]
		local v1 = CFrame.new()
		local v2 = 1
		local t = {
			Object3D = p1
		}
		if p1:IsA("BasePart") then
			local Model3D = Instance.new("Model")
			Model3D.Name = "Model3D"
			p1.Parent = Model3D
			Model3D.PrimaryPart = p1
			p1 = Model3D
			t.Object3D = Model3D
		end
		local ViewportFrame = Instance.new("ViewportFrame")
		ViewportFrame.BackgroundTransparency = 1
		t.AdornFrame = ViewportFrame
		ViewportFrame.LightColor = Color3.fromRGB(138, 138, 138)
		ViewportFrame.LightDirection = Vector3.new(-1, -1, -1)
		local Camera = Instance.new("Camera")
		Camera.Parent = ViewportFrame
		ViewportFrame.CurrentCamera = Camera
		local PrimaryPart = p1.PrimaryPart
		if not PrimaryPart then
			p1.PrimaryPart = p1:FindFirstChildWhichIsA("BasePart", true)
		end
		if p1.PrimaryPart then
			p1:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, 10000, 0) - p1.PrimaryPart.Position) * p1.PrimaryPart.CFrame)
			p1.PrimaryPart = PrimaryPart
		end
		p1.Parent = ViewportFrame
		local function UpdateCFrame() --[[ UpdateCFrame | Line: 104 | Upvalues: p1 (ref), Camera (copy), v2 (ref), v1 (ref) ]]
			local v12, v22 = p1:GetBoundingBox()
			local v3 = math.max(v22.X, v22.Y, v22.Z)
			local v5 = v3 / math.tan((math.rad(Camera.FieldOfView))) * v2
			local v6 = CFrame.new(v12.p)
			Camera.CFrame = v6 * v1 * CFrame.new(0, 0, v3 / 2 + v5)
			Camera.Focus = v6
		end
		function t.Update(p1) --[[ Update | Line: 119 | Upvalues: UpdateCFrame (copy) ]]
			UpdateCFrame()
		end
		function t.SetActive(p1, p2) --[[ SetActive | Line: 126 | Upvalues: ViewportFrame (copy) ]]
			ViewportFrame.Visible = p2
		end
		function t.GetActive(p1) --[[ GetActive | Line: 133 | Upvalues: ViewportFrame (copy) ]]
			return ViewportFrame.Visible
		end
		function t.SetCFrame(p1, p2) --[[ SetCFrame | Line: 140 | Upvalues: v1 (ref), UpdateCFrame (copy) ]]
			v1 = p2
			UpdateCFrame()
		end
		function t.GetCFrame(p1) --[[ GetCFrame | Line: 148 | Upvalues: v1 (ref) ]]
			return v1
		end
		function t.SetDepthMultiplier(p1, p2) --[[ SetDepthMultiplier | Line: 155 | Upvalues: v2 (ref), UpdateCFrame (copy) ]]
			v2 = p2
			UpdateCFrame()
		end
		function t.GetDepthMultiplier(p1) --[[ GetDepthMultiplier | Line: 163 | Upvalues: v2 (ref) ]]
			return v2
		end
		function t.Destroy(p1) --[[ Destroy | Line: 170 ]]
			p1.AdornFrame:Destroy()
			p1.Object3D:Destroy()
		end
		function t.End(p1) --[[ End | Line: 178 ]]
			p1:Destroy()
		end
		local t2 = {}
		setmetatable(t, t2)
		function t2.__index(p1, p2) --[[ Line: 185 | Upvalues: ViewportFrame (copy), t (copy) ]]
			if p2 == "Camera" then
				return ViewportFrame.CurrentCamera
			end
			local v2 = rawget(t, p2)
			if v2 == nil then
				return ViewportFrame[p2]
			else
				return v2
			end
		end
		function t2.__newindex(p1, p2, p3) --[[ Line: 200 | Upvalues: ViewportFrame (copy) ]]
			if pcall(function() --[[ Line: 201 | Upvalues: ViewportFrame (ref), p2 (copy) ]]
				return ViewportFrame[p2]
			end) then
				ViewportFrame[p2] = p3
			end
		end
		UpdateCFrame()
		return t
	end
}
function t.Attach3D(p1, p2, p3) --[[ Attach3D | Line: 216 | Upvalues: t (copy) ]]
	local v1 = t.new(p3)
	v1.AnchorPoint = Vector2.new(0.5, 0.5)
	v1.Position = UDim2.new(0.5, 0, 0.5, 0)
	v1.Visible = false
	v1.Parent = p2
	local Destroy = v1.Destroy
	local function NewDesstroy(p1) --[[ NewDesstroy | Line: 237 | Upvalues: Destroy (copy) ]]
		Destroy(p1)
	end
	rawset(v1, "Destroy", NewDesstroy)
	return v1
end
return t