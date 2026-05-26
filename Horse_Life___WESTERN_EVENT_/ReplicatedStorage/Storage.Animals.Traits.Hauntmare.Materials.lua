-- https://lua.expert/
local t = {}
local HorseTextures = game:GetService("MaterialService"):WaitForChild("HorseTextures")
t.Long = {
	P = 25,
	Region = nil,
	Material = HorseTextures:WaitForChild("Long")
}
t.Short = {
	P = 50,
	Region = nil,
	Material = HorseTextures.Short
}
t.Coarse = {
	P = 50,
	Region = nil,
	Material = HorseTextures.Coarse
}
t.Ice = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Ice
}
t.Rose = {
	P = 0,
	Region = nil,
	Material = HorseTextures.Rose
}
t.Trophy = {
	P = 0,
	Region = nil,
	Material = HorseTextures.Trophy
}
t.Crystals = {
	P = 0,
	Material = HorseTextures.Crystals
}
t.Leather = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Leather
}
t.Rubber = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Rubber
}
t.Snow = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Snow
}
t.Plaster = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Plaster
}
t.Kaiju = {
	P = 0,
	Material = HorseTextures.Kaiju
}
t.Glaring = {
	P = 0,
	Material = HorseTextures.Glaring
}
t.Glass = {
	P = 50,
	Material = Enum.Material.Glass,
	Region = { "Hoof", "Keratin" }
}
t.Plaster = {
	P = 50,
	Region = "Keratin",
	Material = Enum.Material.Plaster
}
t.SmoothPlastic = {
	P = 50,
	Material = Enum.Material.SmoothPlastic,
	Region = { "Hoof", "keratin" }
}
t.Metal = {
	P = 50,
	Region = "Hoof",
	Material = Enum.Material.Metal
}
t.ForceField = {
	P = 65,
	Material = Enum.Material.ForceField,
	Region = { "Hair", "Paint" }
}
t.Neon = {
	P = 35,
	Material = Enum.Material.Neon,
	Region = { "Hair", "Paint" }
}
t.Sand = {
	P = 100,
	Region = "Nose",
	Material = Enum.Material.Sand
}
t.Concrete = {
	P = 100,
	Region = "Nose",
	Material = Enum.Material.Concrete
}
t.Plaster = {
	P = 100,
	Region = "Nose",
	Material = Enum.Material.Plaster
}
local t2 = {
	All = {}
}
for v1, v2 in t do
	v2.Name = v1
	local v3 = typeof(v2.Region) == "table" and v2.Region or v2.Region and { v2.Region }
	if v3 then
		for v4, v5 in v3 do
			if v5 then
				if not t2[v5] then
					t2[v5] = {}
				end
				t2[v5][v1] = v2
			end
		end
		continue
	end
	t2.All[v1] = v2
end
for v6, v7 in require(game.ReplicatedStorage:WaitForChild("Sonar"))("Constants").DefaultMaterials do
	if t[v6] == nil then
		t[v6] = v7
	end
end
return {
	Materials = t,
	MaterialsMapped = t2
}