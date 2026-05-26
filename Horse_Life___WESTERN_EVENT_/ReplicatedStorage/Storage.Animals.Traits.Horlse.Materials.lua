-- https://lua.expert/
local t = {}
game:GetService("MaterialService"):WaitForChild("HorseTextures")
t.SmoothPlastic = {
	P = 100,
	Material = Enum.Material.SmoothPlastic
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