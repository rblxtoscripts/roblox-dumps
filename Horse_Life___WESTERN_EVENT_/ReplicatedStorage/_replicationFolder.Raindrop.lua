-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("Lighting")
game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("Maid")
local v1 = Sonar("InstanceUtils")
local v2 = Sonar("MathUtils")
local v3 = Sonar("spr")
local t = {}
local LocalPlayer = Players.LocalPlayer
local t2 = {}
local v4 = Random.new()
local v5 = false
local v6 = nil
local CurrentCamera = workspace.CurrentCamera
local Glass = Enum.Material.Glass
local v7 = Color3.new(0.858824, 0.898039, 1)
local v8 = v1.Create("Part", {
	Name = "Raindrop",
	Transparency = 0.5,
	Anchored = true,
	CanCollide = false,
	CanTouch = false,
	CanQuery = false,
	Size = Vector3.new(0.005, 0.005, 0.0002),
	Shape = Enum.PartType.Ball,
	Material = Glass,
	Color = v7,
	Children = {
		{
			ClassName = "SpecialMesh",
			Name = "SpecialMesh",
			Scale = Vector3.new(1, 1, 1),
			MeshType = Enum.MeshType.Sphere
		}
	}
})
function t.Enable(p1, p2) --[[ Enable | Line: 58 | Upvalues: v5 (ref), v6 (ref), t2 (ref) ]]
	if p2 then
		v5 = true
		v6 = if type(p2) == "table" and p2 then p2 else nil
	else
		v5 = false
		v6 = nil
		for v2, v3 in t2 do
			v3.Raindrop:Destroy()
		end
		t2 = {}
	end
end
function t.MakeRaindrop(p1, p2) --[[ MakeRaindrop | Line: 80 | Upvalues: v5 (ref), v8 (copy), v6 (ref), Glass (copy), v7 (copy), CurrentCamera (copy), v4 (copy), v3 (copy), v2 (copy), TweenService (copy), t2 (ref) ]]
	if not (v5 or p2) then
		return
	end
	local t = {}
	local v1 = v8:Clone()
	local v32 = v6 and v6.Transparency or 0.5
	v1.Material = v6 and v6.Material or Glass
	v1.Color = v6 and v6.Color or v7
	local v62 = Vector2.new(math.random(0, CurrentCamera.ViewportSize.X), math.random(0, CurrentCamera.ViewportSize.Y))
	t.Transparency = v4:NextNumber(v32, v32 + 0.25)
	local v72 = v1.Size * v4:NextNumber(0.25, 2) * (v6 and v6.SizeMultiplier or 1)
	v1.Size = v72 * 0.5
	v1.Transparency = 1
	v3.target(v1, 0.6, 5, {
		Size = v72,
		Transparency = t.Transparency
	})
	local v9 = CurrentCamera.CFrame:PointToObjectSpace(CurrentCamera:ViewportPointToRay(v62.X, v62.Y).Origin)
	local v10 = CFrame.new(v9.X, v9.Y, CurrentCamera.NearPlaneZ - v1.Size.X)
	t.Offset = v10
	t.Raindrop = v1
	t.AnimationValue = Instance.new("NumberValue")
	t.Scale = Vector3.new(1, v4:NextNumber(1, 1.25), 1)
	t.MinSpeed = v4:NextNumber(0.01, 0.075) * 0.025
	t.EndScale = t.Scale * Vector3.new(v4:NextNumber(0.5, 0.85), v4:NextNumber(1.15, 1.35), 0.5)
	t.EndOffset = v10 * CFrame.new(0, -1, 0)
	t.VelocityFactor = v4:NextNumber(0.1, 1)
	v1.CFrame = CurrentCamera.CFrame * v10
	v1.SpecialMesh.Scale = t.Scale
	v1.Transparency = t.Transparency
	v1.Reflectance = math.random(1, 10)
	local v14 = math.asin(CurrentCamera.CFrame.LookVector.Y)
	local v15 = v2.map(v14, 0, 1.5, 0.1, 1.25, true)
	local v16 = v2.map(v14, 0, 1.5, 1, 2, true)
	task.delay(v15 * v4:NextNumber(0.2, 0.85), function() --[[ Line: 133 | Upvalues: TweenService (ref), t (copy), v16 (copy) ]]
		TweenService:Create(t.AnimationValue, TweenInfo.new(v16, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
			Value = 1
		}):Play()
	end)
	table.insert(t2, t)
	v1.Parent = CurrentCamera
end
function t.Init(p1) --[[ Init | Line: 145 | Upvalues: CurrentCamera (copy), RunService (copy), v5 (ref), t2 (ref), LocalPlayer (copy), t (copy), v2 (copy) ]]
	local v1 = tick()
	local v22 = Vector3.new(0, 0, 0)
	local v3, v4 = CurrentCamera.CFrame:ToOrientation()
	RunService.RenderStepped:Connect(function(p12) --[[ Line: 149 | Upvalues: v5 (ref), t2 (ref), LocalPlayer (ref), t (ref), CurrentCamera (ref), v1 (ref), v2 (ref), p1 (copy), v22 (ref), v4 (ref), v3 (ref) ]]
		if not v5 and #t2 == 0 then
			return
		end
		local Character = LocalPlayer.Character
		if not Character and v5 then
			t:Enable(false)
		end
		local v12 = math.asin(CurrentCamera.CFrame.LookVector.Y)
		if v5 and (v12 > -0.5 and tick() - v1 > v2.map(v12, -0.5, 1.5, 0.5, 0.05, true)) then
			p1:MakeRaindrop()
			v1 = tick()
		end
		local v23
		if Character and Character.PrimaryPart then
			v23 = (Character.PrimaryPart.Position - v22) * p12 * 0.5
			v22 = Character.PrimaryPart.Position
		else
			v23 = Vector3.new(0, 0, 0)
		end
		local v32, v42 = CurrentCamera.CFrame:ToOrientation()
		local v52 = v2.normalizeAngles(v42, v4) * p12 * 0.1
		v4 = v42
		local v6 = v2.normalizeAngles(v32, v3) * p12 * 0.5
		v3 = v32
		if v23.Y < 0 then
			v23 = Vector3.new(0, 0, 0)
		end
		if v6 < 0 then
			v6 = 0
		end
		local v7 = v2.map(v12, 0, 1.5, 0.1, 0.05, true)
		local v8 = CurrentCamera.CFrame:VectorToObjectSpace(workspace.GlobalWind)
		local v9 = Vector3.new(v8.X, v8.Y, 0) * p12 * 0.0005
		for v10, v11 in t2 do
			local Raindrop = v11.Raindrop
			local Offset = v11.Offset
			local AnimationValue = v11.AnimationValue.Value
			local v122 = v11.Scale:lerp(v11.EndScale, AnimationValue)
			local v13 = v2.lerp(v11.Transparency, 0.9, AnimationValue)
			Raindrop.CFrame = CurrentCamera.CFrame * Offset
			Raindrop.SpecialMesh.Scale = Raindrop.SpecialMesh.Scale:lerp(v122, 0.05)
			Raindrop.Transparency = v2.lerp(Raindrop.Transparency, v13, 0.1)
			Raindrop.Reflectance = v2.lerp(Raindrop.Reflectance, 0.1, 0.055)
			local Position = Offset.Position
			local v17 = Vector3.new(Offset.X - v52 + v9.X, Offset.Y - math.max(v7 * AnimationValue * 0.5 * p12, v11.MinSpeed * p12) - v23.Y * v11.VelocityFactor - v6 + v9.Y, Offset.Z)
			local v18 = v17 - Position
			if v18.Magnitude > 0.00001 then
				local v19 = math.atan2(v18.Y, v18.X) - 1.5707963267948966
				v11.Offset = CFrame.new(v17) * CFrame.Angles(0, 0, v19)
			else
				v11.Offset = CFrame.new(v17) * (Offset - Position)
			end
			if AnimationValue >= 1 and not v11._kill then
				v11._kill = task.delay(4, function() --[[ Line: 231 | Upvalues: v11 (copy), t2 (ref) ]]
					v11.Raindrop:Destroy()
					table.remove(t2, table.find(t2, v11))
				end)
			end
		end
	end)
end
t:Init()
return t