-- https://lua.expert/
local t = {}
local HorseTextures = game:GetService("MaterialService"):WaitForChild("HorseTextures")
t.Long = {
	P = 25,
	Region = nil,
	Material = HorseTextures:WaitForChild("Long")
}
t.Curly = {
	P = 15,
	Region = nil,
	Material = HorseTextures.Curly
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
t.Rose = {
	P = 0,
	Region = nil,
	Material = HorseTextures.Rose
}
t.Crystals = {
	P = 0,
	Material = HorseTextures.Crystals
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
	Region = { "Hoof", "Keratin", "Sock" }
}
t.SmoothPlastic = {
	P = 50,
	Material = Enum.Material.SmoothPlastic,
	Region = { "Hoof", "Keratin", "Sock" }
}
t.Metal = {
	P = 25,
	Material = Enum.Material.Metal,
	Region = { "Hoof", "Keratin", "Sock" }
}
t.Trophy = {
	P = 10,
	Material = HorseTextures.Trophy,
	Region = { "Hoof", "Keratin", "Sock" }
}
t.Neon = {
	P = 0,
	Material = Enum.Material.Neon
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