-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 33 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	for v3, v4 in p1 do
		if type(v4.type) == "string" then
			v4.type = { v4.type }
		end
		local t2 = {}
		for i, v in ipairs(v4.type) do
			t2[v] = true
		end
		v4.type = t2
	end
	v2._structure = p1
	return v2
end
function t.GetDefault(p1) --[[ GetDefault | Line: 56 ]]
	local t = {}
	for k, v in pairs(p1._structure) do
		if type(v.default) == "function" then
			t[k] = v.default()
			continue
		end
		t[k] = v.default
	end
	return t
end
function t.GetDefaultForKey(p1, p2) --[[ GetDefaultForKey | Line: 70 ]]
	local v1 = p1._structure[p2]
	if not v1 then
		error("Key \'" .. p2 .. "\' does not exist in schema.")
	end
	if type(v1.default) == "function" then
		return v1.default()
	else
		return v1.default
	end
end
function t.HasKey(p1, p2) --[[ HasKey | Line: 83 ]]
	return p1._structure[p2] ~= nil
end
function t.Sanitize(p1, p2) --[[ Sanitize | Line: 87 ]]
	for k, v in pairs(p2) do
		if p1._structure[k] == nil then
			p2[k] = nil
		end
		if not p1._structure[k].type[type(v)] then
			p2[k] = nil
		end
	end
	return p2
end
function t.Destroy(p1) --[[ Destroy | Line: 101 ]] end
return t