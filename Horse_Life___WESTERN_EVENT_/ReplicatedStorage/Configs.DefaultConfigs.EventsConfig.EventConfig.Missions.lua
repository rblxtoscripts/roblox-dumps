-- https://lua.expert/
local t = {
	Metadata = {}
}
for v1, v2 in script:GetChildren() do
	for v3, v4 in require(v2) do
		t[v3] = v4
	end
end
return t