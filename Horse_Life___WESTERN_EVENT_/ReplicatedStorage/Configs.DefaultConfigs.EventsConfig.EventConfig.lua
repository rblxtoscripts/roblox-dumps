-- https://lua.expert/
local t = {}
for v1, v2 in script:GetChildren() do
	local v3 = v2.Name
	if v2:IsA("Folder") then
		t[v3] = {}
		for v4, v5 in v2:GetChildren() do
			t[v3][v5.Name] = v5
		end
		continue
	end
	if v2:IsA("ModuleScript") then
		t[v3] = require(v2)
	end
end
return t