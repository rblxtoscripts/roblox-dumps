-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local t = {}
local t2 = {}
function t.FindElement(p1, p2, p3) --[[ FindElement | Line: 9 ]]
	if typeof(p1) == "string" then
		warn("[GuiEffectsService] FindElement called with string instance:", p1)
		return nil
	end
	if p3 and p3.GetAllDescendants then
		local t = {}
		for v1, v2 in p1:GetDescendants() do
			if v2.Name == p2 then
				table.insert(t, v2)
			end
		end
		return t
	else
		return p1:FindFirstChild(p2, true)
	end
end
function t.CloneTemplate(p1) --[[ CloneTemplate | Line: 28 ]]
	local v1 = p1:Clone()
	v1.Visible = true
	return v1
end
function t.GetProperties(p1, p2) --[[ GetProperties | Line: 34 ]]
	local t = {}
	for v1, v2 in p2 do
		t[v2] = p1[v2]
	end
	return t
end
function t.GetPropertiesOfDescendants(p1, p2) --[[ GetPropertiesOfDescendants | Line: 42 | Upvalues: t (copy) ]]
	local t2 = {}
	local t3 = {}
	if p2.Exclude then
		for v1, v2 in p2.Exclude do
			t3[v2] = true
		end
	end
	for v3, v4 in { p1, unpack(p1:GetDescendants()) } do
		if not (t3[v4] or t3[v4.Parent]) then
			local v5 = p2[v4.ClassName]
			if v5 then
				t2[v4] = t.GetProperties(v4, v5)
			end
		end
	end
	return t2
end
function t.SetPropertiesOfDescendants(p1, p2) --[[ SetPropertiesOfDescendants | Line: 66 ]]
	local t = {}
	local t2 = {}
	if p2.Exclude then
		for v1, v2 in p2.Exclude do
			t2[v2] = true
		end
	end
	for v3, v4 in { p1, unpack(p1:GetDescendants()) } do
		if not (t2[v4] or t2[v4.Parent]) then
			local v5 = p2[v4.ClassName]
			if v5 then
				local t3 = {}
				for v6, v7 in v5 do
					t3[v6] = v4[v6]
					v4[v6] = v7
				end
				t[v4] = t3
			end
		end
	end
	return t
end
function t.PlayEffect(p1, p2) --[[ PlayEffect | Line: 95 | Upvalues: t2 (copy), t (copy) ]]
	local v1 = t2[p1]
	if v1 then
		return v1(p2, t)
	else
		warn("[GuiEffectsService] Effect not found:", p1)
	end
end
for v1, v2 in script.Effects:GetChildren() do
	if v2:IsA("ModuleScript") then
		t2[v2.Name] = Sonar(v2)
	end
end
return t