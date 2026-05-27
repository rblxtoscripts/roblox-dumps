-- https://lua.expert/
local t = {}
local HorseTextures = game:GetService("MaterialService"):WaitForChild("HorseTextures")
t.SmoothPlastic = {
	P = 75,
	Region = nil,
	Material = Enum.Material.SmoothPlastic
}
t.Glass = {
	P = 50,
	Region = nil,
	Material = Enum.Material.Glass
}
t.Trophy = {
	P = 0,
	Region = nil,
	Material = HorseTextures.Trophy
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
t.Concrete = {
	P = 50,
	Material = Enum.Material.Concrete,
	Region = { "Hoof", "Keratin" }
}
t.Marble = {
	P = 50,
	Material = Enum.Material.Marble,
	Region = { "Hoof", "Keratin" }
}
t.Granite = {
	P = 50,
	Material = Enum.Material.Granite,
	Region = { "Hoof", "Keratin" }
}
t.Slate = {
	P = 50,
	Material = Enum.Material.Slate,
	Region = { "Hoof", "Keratin" }
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