-- https://lua.expert/
local getLastWordFromPascalCase = require(script.Parent:WaitForChild("getLastWordFromPascalCase"))
local t = {
	Hand = "Arm",
	Foot = "Leg"
}
function getLimbType(p1) --[[ getLimbType | Line: 43 | Upvalues: getLastWordFromPascalCase (copy), t (copy) ]]
	local v1 = getLastWordFromPascalCase(p1)
	return t[v1] or v1
end
function getLimbs(p1, p2) --[[ getLimbs | Line: 72 ]]
	local t = {}
	local t2 = {}
	local t3 = {}
	local function v1(p1, p22) --[[ parsePart | Line: 77 | Upvalues: t (copy), t3 (copy), t2 (copy), p2 (copy), v1 (copy) ]]
		if p1.Name ~= "HumanoidRootPart" then
			local v12 = getLimbType(p1.Name)
			t[v12] = t[v12] or {}
			table.insert(t[v12], p1)
			local _ = t[v12]
			if v12 ~= p22 then
				t3[v12] = t3[v12] or {}
				if p22 then
					t3[v12][p22] = true
				end
				table.insert(t2, {
					Part = p1,
					Type = v12
				})
				p22 = v12
			end
		end
		for k, v in pairs(p1:GetChildren()) do
			if v:isA("Attachment") and p2[v.Name] then
				local v8 = p2[v.Name].Attachment1.Parent
				if v8 and v8 ~= p1 then
					v1(v8, p22)
				end
			end
		end
	end
	v1(p1)
	return t, t2, t3
end
function createNoCollision(p1, p2) --[[ createNoCollision | Line: 110 ]]
	local NoCollisionConstraint = Instance.new("NoCollisionConstraint")
	NoCollisionConstraint.Name = p1.Name .. "<->" .. p2.Name
	NoCollisionConstraint.Part0 = p1
	NoCollisionConstraint.Part1 = p2
	return NoCollisionConstraint
end
return function(p1, p2) --[[ Line: 119 ]]
	local NoCollisionConstraints = Instance.new("Folder")
	NoCollisionConstraints.Name = "NoCollisionConstraints"
	local v1, v2, v3 = getLimbs(p2, p1)
	for i = 1, #v2 do
		for j = i + 1, #v2 do
			local Type = v2[i].Type
			local Type_2 = v2[j].Type
			if not (v3[Type][Type_2] or v3[Type_2][Type]) then
				createNoCollision(v2[i].Part, v2[j].Part).Parent = NoCollisionConstraints
			end
		end
	end
	for k, v in pairs(v1) do
		for k2, v4 in pairs(v3[k]) do
			for k3, v5 in pairs(v1[k2]) do
				for k4, v6 in pairs(v) do
					createNoCollision(v6, v5).Parent = NoCollisionConstraints
				end
			end
		end
	end
	return NoCollisionConstraints
end