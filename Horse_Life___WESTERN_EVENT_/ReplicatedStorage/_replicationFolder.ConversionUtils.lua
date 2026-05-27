-- https://lua.expert/
local t = {}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("DataConversion")
local t2 = {}
local t3 = {}
function t.NameToCode(p1) --[[ NameToCode | Line: 13 | Upvalues: t2 (copy) ]]
	if type(p1) == "string" then
		return t2[p1] or p1
	else
		return p1
	end
end
function t.CodeToName(p1) --[[ CodeToName | Line: 22 | Upvalues: t3 (copy) ]]
	if type(p1) == "string" then
		return t3[p1] or p1
	else
		return p1
	end
end
function t.Init(p1) --[[ Init | Line: 31 | Upvalues: v1 (copy), t2 (copy), t3 (copy) ]]
	for i, v in ipairs(v1) do
		if t2[v[1]] then
			warn("Name already added for compression", v[1], v[2])
		else
			t2[v[1]] = v[2]
		end
		if t3[v[2]] then
			warn("Key already used for", v[1], v[2])
			continue
		end
		t3[v[2]] = v[1]
	end
end
t:Init()
return t