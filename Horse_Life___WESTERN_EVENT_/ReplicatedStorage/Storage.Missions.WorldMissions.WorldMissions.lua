-- https://lua.expert/
local t = {}
for v1, v2 in script.Parent.Missions:GetChildren() do
	if v2:IsA("ModuleScript") then
		t[v2.Name] = require(v2)
	end
end
return t