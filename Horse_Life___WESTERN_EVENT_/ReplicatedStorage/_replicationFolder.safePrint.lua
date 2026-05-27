-- https://lua.expert/
local function _countTableSize(p1) --[[ _countTableSize | Line: 17 ]]
	if type(p1) ~= "table" then
		return 0
	end
	local v1 = 0
	local v2 = if pcall(function() --[[ Line: 23 | Upvalues: p1 (copy), v1 (ref) ]]
	for k2 in pairs(p1) do
		v1 = v1 + 1
		if v1 > 30 then
			break
		end
	end
end) then v1 or 0 else 0
	return v2
end
local function v1(p1, p2, p3) --[[ _createSafeTable | Line: 40 | Upvalues: v1 (copy) ]]
	if type(p1) ~= "table" then
		return p1
	end
	if p2[p1] then
		return "[Circular Reference]"
	end
	if p3 >= 1 then
		return "[Nested Table]"
	end
	p2[p1] = true
	local t = {}
	local v12 = 0
	local v2 = 0
	local v3
	if type(p1) == "table" then
		local v4 = 0
		v3 = if pcall(function() --[[ Line: 23 | Upvalues: p1 (copy), v4 (ref) ]]
	for k2 in pairs(p1) do
		v4 = v4 + 1
		if v4 > 30 then
			break
		end
	end
end) then v4 or 0 else 0
	else
		v3 = 0
	end
	local v5 = if v3 < 30 then true else false
	local v6, v7 = pcall(function() --[[ Line: 61 | Upvalues: p1 (copy), v12 (ref), t (copy), v2 (ref), p3 (copy), v5 (copy), v1 (ref), p2 (copy) ]]
		for k, v in pairs(p1) do
			if v12 >= 50 then
				t["..."] = ("(%*+ more items)"):format(50)
				return
			end
			local v13, v22 = pcall(function() --[[ Line: 69 | Upvalues: k (copy) ]]
				if type(k) == "string" then
					if #k > 200 then
						return ("%*... (%* chars)"):format(string.sub(k, 1, 200), #k)
					else
						return k
					end
				else
					if type(k) == "number" then
						return k
					end
					if type(k) == "boolean" then
						return k
					end
					local v5, v6 = pcall(tostring, k)
					if not v5 then
						return "[Invalid Key]"
					end
					if #v6 > 200 then
						return ("%*..."):format((string.sub(v6, 1, 200)))
					else
						return v6
					end
				end
			end)
			if v13 then
				local v3, v4 = pcall(function() --[[ Line: 93 | Upvalues: v (copy), p3 (ref), v5 (ref), v1 (ref), p2 (ref) ]]
					local v2 = typeof(v)
					if v2 == "table" then
						if p3 >= 1 then
							return "[Nested Table]"
						end
						local v3 = v
						local v4
						if type(v3) == "table" then
							local v52 = 0
							v4 = if pcall(function() --[[ Line: 23 | Upvalues: v3 (copy), v52 (ref) ]]
	for k2 in pairs(v3) do
		v52 = v52 + 1
		if v52 > 30 then
			break
		end
	end
end) then v52 or 0 else 0
						else
							v4 = 0
						end
						if v5 and not (v4 >= 30) then
							return v1(v, p2, p3 + 1)
						else
							return "[Nested Table]"
						end
					elseif v2 == "string" then
						if #v > 200 then
							return ("%*... (%* chars)"):format(string.sub(v, 1, 200), #v)
						else
							return v
						end
					else
						if v2 == "function" then
							return "[Function]"
						end
						if v2 == "userdata" then
							local v7, v8 = pcall(tostring, v)
							if not v7 then
								return "[Userdata]"
							end
							if #v8 > 200 then
								return ("%*..."):format((string.sub(v8, 1, 200)))
							else
								return v8
							end
						else
							if v == nil then
								return nil
							end
							local v9, v10 = pcall(tostring, v)
							if not v9 then
								return "[Unable to convert]"
							end
							if #v10 > 200 then
								return ("%*..."):format((string.sub(v10, 1, 200)))
							else
								return v10
							end
						end
					end
				end)
				if v3 then
					t[v22] = v4
					v12 = v12 + 1
					continue
				end
				v2 = v2 + 1
				continue
			end
			v2 = v2 + 1
		end
	end)
	if v6 then
		if v2 > 0 then
			t["[Skipped]"] = ("%* item(s) skipped due to errors"):format(v2)
		end
	else
		t["[Error]"] = ("Iterating table: %*"):format((tostring(v7)))
	end
	p2[p1] = nil
	return t
end
local function _processValue(p1) --[[ _processValue | Line: 160 | Upvalues: v1 (copy) ]]
	if p1 == nil then
		return "nil"
	end
	if typeof(p1) ~= "table" then
		return p1
	end
	local v12, v2 = pcall(function() --[[ Line: 168 | Upvalues: v1 (ref), p1 (copy) ]]
		return v1(p1, {}, 0)
	end)
	if v12 then
		return v2
	else
		return ("[Table - Error during processing: %*]"):format((tostring(v2)))
	end
end
function safePrint(...) --[[ safePrint | Line: 190 | Upvalues: _processValue (copy) ]]
	local t = { ... }
	if #t == 0 then
		return
	end
	local v1 = nil
	local t2 = {}
	if type(t[1]) == "string" then
		v1 = t[1]
		for i = 2, #t do
			table.insert(t2, (_processValue(t[i])))
		end
	else
		for j = 1, #t do
			table.insert(t2, (_processValue(t[j])))
		end
	end
	local t3 = {}
	if v1 then
		table.insert(t3, v1)
	end
	for v5, v6 in t2 do
		table.insert(t3, v6)
	end
	if not (#t3 > 0) then
		return
	end
	print(table.unpack(t3))
end
return safePrint