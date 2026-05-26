-- https://lua.expert/
BaseUrl = "http://www.roblox.com/asset/?id="
RbxUtility = require(game.ReplicatedStorage:WaitForChild("RBXUtility"))
Create = RbxUtility.Create
BasePart = Create("Part")({
	Size = Vector3.new(0.2, 0.2, 0.2),
	Anchored = false,
	CanCollide = true,
	Locked = true,
	Material = Enum.Material.Plastic,
	Shape = Enum.PartType.Block,
	TopSurface = Enum.SurfaceType.Smooth,
	BottomSurface = Enum.SurfaceType.Smooth,
	FormFactor = Enum.FormFactor.Custom
})
MeshData = {
	TextureId = 168119260,
	Meshes = {
		Body = 168119200,
		Wheel = 168119240
	}
}
function CreateVehicle() --[[ CreateVehicle | Line: 28 ]]
	local t = {}
	local Body = BasePart:Clone()
	Body.Name = "Body"
	Body.Size = Vector3.new(1, 5.5, 6)
	Create("SpecialMesh")({
		Scale = Vector3.new(1.25, 1.25, 1.25),
		VertexColor = Vector3.new(1, 1, 1),
		Offset = Vector3.new(0, 0, 0),
		MeshType = Enum.MeshType.FileMesh,
		MeshId = MeshData.Meshes.Body,
		TextureId = MeshData.TextureId,
		Parent = Body
	})
	local v1 = BasePart:Clone()
	v1.Size = Vector3.new(0.5, 1, 1)
	v1.CanCollide = false
	Create("SpecialMesh")({
		MeshId = "",
		Scale = Vector3.new(1.25, 1.25, 1.25),
		VertexColor = Vector3.new(1, 1, 1),
		Offset = Vector3.new(0, 0, 0),
		MeshType = Enum.MeshType.FileMesh,
		TextureId = MeshData.TextureId,
		Parent = v1
	})
	local FrontWheel = v1:Clone()
	FrontWheel.Name = "FrontWheel"
	FrontWheel.Mesh.MeshId = MeshData.Meshes.Wheel
	local BackWheel = v1:Clone()
	BackWheel.Name = "BackWheel"
	BackWheel.Mesh.MeshId = MeshData.Meshes.Wheel
	local SmokePart = BasePart:Clone()
	SmokePart.Name = "SmokePart"
	SmokePart.Transparency = 1
	Create("Smoke")({
		Name = "ExhaustSmoke",
		Size = 0.1,
		RiseVelocity = 0.01,
		Enabled = true,
		Color = Color3.new(127/255, 127/255, 127/255),
		Parent = SmokePart
	})
	local LightPart = BasePart:Clone()
	LightPart.Name = "LightPart"
	LightPart.Transparency = 1
	Create("SpotLight")({
		Name = "Light",
		Brightness = 50,
		Angle = 45,
		Range = 20,
		Shadows = false,
		Enabled = false,
		Color = Color3.new(255/255, 252/255, 153/255),
		Parent = LightPart
	})
	local v2 = FrontWheel:Clone()
	v2.Parent = Body
	Create("Motor6D")({
		Name = "FrontMotor",
		Part0 = Body,
		Part1 = v2,
		C0 = CFrame.new(0, -2.05, -2.2) * CFrame.Angles(0, 1.5707963267948966, 0),
		C1 = CFrame.new() * CFrame.Angles(0, -1.5707963267948966, 0),
		Parent = Body
	})
	local v3 = BackWheel:Clone()
	v3.Parent = Body
	Create("Motor6D")({
		Name = "BackMotor",
		Part0 = Body,
		Part1 = v3,
		C0 = CFrame.new(0, -2.05, 2) * CFrame.Angles(0, 1.5707963267948966, 0),
		C1 = CFrame.new() * CFrame.Angles(0, -1.5707963267948966, 0),
		Parent = Body
	})
	local v4 = LightPart:Clone()
	v4.Parent = Body
	table.insert(t, v4.Light)
	local t2 = {}
	local t3 = {}
	for k, v in pairs(v4:GetChildren()) do
		if v:IsA("Sparkles") then
			table.insert(t2, v)
		end
	end
	Create("Weld")({
		Part0 = Body,
		Part1 = v4,
		C0 = CFrame.new(0, 1.25, -1.9) * CFrame.Angles(0, 0, 0),
		Parent = v4
	})
	local ExhaustPipe = SmokePart:Clone()
	ExhaustPipe.Name = "ExhaustPipe"
	ExhaustPipe.Parent = Body
	table.insert(t3, ExhaustPipe.ExhaustSmoke)
	Create("Weld")({
		C0 = CFrame.new(0, 1, -2.7) * CFrame.Angles(0, 0, 0),
		Part0 = ExhaustPipe,
		Part1 = Body,
		Parent = ExhaustPipe
	})
	return {
		Vehicle = Body,
		Tables = {
			ExhaustSmoke = t3,
			Lights = t,
			Sparkles = t2
		}
	}
end
for k, v in pairs(MeshData) do
	if type(v) == "table" then
		for k2, v2 in pairs(v) do
			if type(v2) == "string" or type(v2) == "number" then
				MeshData[k][k2] = BaseUrl .. tostring(v2)
			end
		end
		continue
	end
	if type(v) == "string" or type(v) == "number" then
		MeshData[k] = BaseUrl .. tostring(v)
	end
end
return {
	BaseUrl = BaseUrl,
	MeshData = MeshData,
	CreateVehicle = CreateVehicle
}