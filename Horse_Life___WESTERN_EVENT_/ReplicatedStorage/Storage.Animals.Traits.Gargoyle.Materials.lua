-- https://lua.expert/
local t = {}
local HorseTextures = game:GetService("MaterialService"):WaitForChild("HorseTextures")
t.Concrete = {
	P = 0,
	Region = nil,
	Material = Enum.Material.Concrete
}
t.Basalt = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Basalt
}
t.Cobblestone = {
	P = 25,
	Region = nil,
	Material = Enum.Material.Cobblestone
}
t.Granite = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Granite
}
t.Slate = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Slate
}
t.Marble = {
	P = 25,
	Region = nil,
	Material = Enum.Material.Marble
}
t.CrackedLava = {
	P = 0,
	Region = nil,
	Material = Enum.Material.CrackedLava
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
t.Neon = {
	P = 0,
	Material = Enum.Material.Neon
}
t.Kaiju = {
	P = 0,
	Material = HorseTextures.Kaiju
}
t.Glaring = {
	P = 0,
	Material = HorseTextures.Glaring
}
t.Rose = {
	P = 0,
	Region = nil,
	Material = HorseTextures.Rose
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
	Region = { "Hoof", "Keratin" }
}
t.Metal = {
	P = 50,
	Region = "Hoof",
	Material = Enum.Material.Metal
}
t.Grass = {
	P = 50,
	Region = "Paint",
	Material = Enum.Material.Grass
}
t.Asphalt = {
	P = 50,
	Region = "Paint",
	Material = Enum.Material.Asphalt
}
t.LeafyGrass = {
	P = 50,
	Region = "Paint",
	Material = Enum.Material.LeafyGrass
}
t.Snow = {
	P = 50,
	Region = "Paint",
	Material = Enum.Material.LeafyGrass
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