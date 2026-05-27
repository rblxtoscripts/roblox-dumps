-- https://lua.expert/
local v1 = setmetatable
local v2 = tostring
local v3 = tonumber
local concat = table.concat
local gsub = string.gsub
local sub = string.sub
local match = string.match
local v4 = typeof
local v5 = Color3.new
local v6 = Vector3.new
local v7 = CFrame.new
local v8 = Ray.new
local v9 = BrickColor.new
local t = {
	{ "\8", "\\b" },
	{ "\t", "\\t" },
	{ "\n", "\\n" },
	{ "\f", "\\f" },
	{ "\r", "\\r" },
	{ "\"", "\\\"" },
	{ "\\", "\\\\" }
}
local t2 = {}
local t3 = {}
local t4 = {}
for i = 1, #t do
	local v10 = t[i]
	t2[v10[1]] = v10[2]
	t3[v10[2]] = v10[1]
end
local t5 = {
	__index = function(p1, p2) --[[ __index | Line: 41 | Upvalues: match (copy) ]]
		local v1 = match(p1[1], p2)
		p1[2] = v1
		return v1
	end
}
local function SafeString(p1, p2) --[[ SafeString | Line: 50 | Upvalues: gsub (copy), t2 (copy), t3 (copy) ]]
	if p2 then
		return gsub(p1, "[\8\t\n\f\r\\\"]", t2)
	else
		return gsub(p1, "\\.", t3)
	end
end
local function Extract(p1) --[[ Extract | Line: 58 | Upvalues: t5 (copy), v1 (copy), t4 (copy), gsub (copy), t3 (copy), v9 (copy), match (copy), v8 (copy), v6 (copy), v7 (copy), v5 (copy), v3 (copy) ]]
	local v12 = v1({ p1 }, t5)
	if v12["^%[.-%]$"] then
		return t4:Decode(v12[2])
	end
	if v12["^\"(.-)\"$"] then
		return gsub(v12[2], "\\.", t3)
	end
	if v12["^true$"] then
		return true
	end
	if v12["^false$"] then
		return false
	end
	if v12["^B%[(%d+)%]$"] then
		return v9(v12[2])
	end
	if v12["^R%[(.+)%]$"] then
		local v2, v32, v4, v52, v62, v72 = match(v12[2], "(.+),(.+),(.+),(.+),(.+),(.+)")
		return v8(v6(v2, v32, v4), (v6(v52, v62, v72)))
	end
	if v12["^CF%[(.+)%]$"] then
		return v7(match(v12[2], "(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+),(.+)"))
	end
	if v12["^V3%[(.+)%]$"] then
		return v6(match(v12[2], "(.+),(.+),(.+)"))
	end
	if v12["^C3%[(.+)%]$"] then
		return v5(match(v12[2], "(.+),(.+),(.+)"))
	else
		return v3(p1)
	end
end
function Round(p1, p2) --[[ Round | Line: 86 ]]
	local v1 = p2 and 10 ^ p2 or 1
	return (p1 * v1 + 0.5 - (p1 * v1 + 0.5) % 1) / v1
end
function t4.Encode(p1, p2, p3) --[[ Encode | Line: 91 | Upvalues: v4 (copy), concat (copy), gsub (copy), t2 (copy), v2 (copy), t4 (copy) ]]
	local t = {}
	local v1 = if p3 then p3 else {}
	for v3, v42 in next, p2 do
		local v22
		local v5 = "null"
		local v6 = v4(v42)
		v22 = if v4(v3) == "string" then concat({ "\"", gsub(v3, "[\8\t\n\f\r\\\"]", t2), "\":" }) else ""
		if v6 == "number" or v6 == "boolean" then
			v5 = v2(v42)
		elseif v6 == "string" then
			v5 = concat({ "\"", gsub(v42, "[\8\t\n\f\r\\\"]", t2), "\"" })
		elseif v6 == "table" and not v1[v42] then
			v1[v42] = true
			v5 = t4:Encode(v42, v1)
		elseif v6 == "BrickColor" then
			v5 = concat({ "B[", v42.Number, "]" })
		elseif v6 == "Ray" then
			local Origin = v42.Origin
			local Direction = v42.Direction
			v5 = concat({ "R[", concat({
					Origin.X,
					Origin.Y,
					Origin.Z,
					Direction.X,
					Direction.Y,
					Direction.Z
				}, ","), "]" })
		elseif v6 == "CFrame" then
			v5 = concat({ "CF[", concat({ v42:components() }, ","), "]" })
		elseif v6 == "Vector3" then
			v5 = concat({ "V3[", concat({ v42.X, v42.Y, v42.Z }, ","), "]" })
		elseif v6 == "Color3" then
			v5 = concat({ "C3[", concat({ Round(v42.r, 3), Round(v42.g, 3), Round(v42.b, 3) }, ","), "]" })
		end
		t[#t + 1] = v22 .. v5
	end
	return concat({ "[", concat(t, ";"), "]" })
end
function t4.Decode(p1, p2) --[[ Decode | Line: 131 | Upvalues: sub (copy), concat (copy), match (copy), gsub (copy), t3 (copy), Extract (ref) ]]
	local v1 = #p2
	local v2 = nil
	local v3 = nil
	local v4 = nil
	local count = 0
	local t = {}
	for i = 1, v1 do
		local v5 = sub(p2, i, i)
		if v2 then
			v2[#v2 + 1] = v5
		elseif not v2 and i ~= 1 then
			v2 = { v5 }
		end
		if v3 then
			v3 = false
			continue
		end
		if v5 == "\\" then
			v3 = true
			continue
		end
		if v5 == "\"" then
			v4 = not v4
			continue
		end
		local v6, v7, v8
		if v4 or (v5 ~= ";" or count ~= 1) then
			if i == v1 then
				v6 = concat(v2)
				if match(gsub(v6, "\\\"", ""), "^\".-\":.+$") then
					v7 = false
					for j = 2, #v2 do
						v8 = v2[j]
						if v7 then
							v7 = false
							continue
						end
						if v8 == "\"" then
							v7 = j - 1
							break
						end
						v7 = v8 == "\\"
					end
					t[gsub(sub(v6, 2, v7), "\\.", t3)] = Extract((sub(v6, v7 + 3, -2)))
				else
					t[#t + 1] = Extract((sub(v6, 1, -2)))
				end
				v2 = nil
				continue
			end
			if not v4 then
				if v5 == "[" then
					count = count + 1
					continue
				end
				if v5 == "]" then
					count = count - 1
				end
			end
		else
			v6 = concat(v2)
			if match(gsub(v6, "\\\"", ""), "^\".-\":.+$") then
				v7 = false
				for j = 2, #v2 do
					v8 = v2[j]
					if v7 then
						v7 = false
						continue
					end
					if v8 == "\"" then
						v7 = j - 1
						break
					end
					v7 = v8 == "\\"
				end
				t[gsub(sub(v6, 2, v7), "\\.", t3)] = Extract((sub(v6, v7 + 3, -2)))
			else
				t[#t + 1] = Extract((sub(v6, 1, -2)))
			end
			v2 = nil
		end
	end
	return t
end
return t4