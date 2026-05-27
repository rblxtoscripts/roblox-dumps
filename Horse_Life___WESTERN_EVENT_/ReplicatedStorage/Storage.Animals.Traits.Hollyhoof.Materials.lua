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
t.Trophy = {
	P = 0,
	Region = nil,
	Material = HorseTextures.Trophy
}
t.Neon = {
	P = 0,
	Material = Enum.Material.Neon
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
t.Foil = {
	P = 50,
	Material = Enum.Material.Foil,
	Region = { "Pattern", "Paint", "Keratin", "Hoof", "Sock", "Nose", "CoatBottom", "CoatTop" }
}
t.Glacier = {
	P = 50,
	Material = Enum.Material.Glacier,
	Region = { "Pattern", "Paint", "Keratin", "Hoof", "Sock", "Nose", "CoatBottom", "CoatTop" }
}
t.Glass = {
	P = 50,
	Material = Enum.Material.Glass,
	Region = { "Pattern", "Paint", "Keratin", "Hoof", "Sock", "Nose", "CoatBottom", "CoatTop" }
}
t.Ice = {
	P = 50,
	Material = Enum.Material.Ice,
	Region = { "Pattern", "Paint", "Keratin", "Hoof", "Sock", "Nose", "CoatBottom", "CoatTop" }
}
t.SmoothPlastic = {
	P = 50,
	Material = Enum.Material.SmoothPlastic,
	Region = { "Pattern", "Paint", "Keratin", "Hoof", "Sock", "Nose", "CoatBottom", "CoatTop" }
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