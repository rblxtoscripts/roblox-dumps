-- https://lua.expert/
local t = {}
for i = 1, 127 do
	local v1 = string.char(i)
	t[v1] = i - 1
	t[i - 1] = v1
end
local function copy(p1) --[[ copy | Line: 7 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[k] = v
	end
	return t
end
local function tobase127(p1) --[[ tobase127 | Line: 15 | Upvalues: t (copy) ]]
	local v1 = ""
	repeat
		local v2 = p1 % 127
		v1 = t[v2] .. v1
		p1 = (p1 - v2) / 127
	until p1 == 0
	return v1
end
local function tobase10(p1) --[[ tobase10 | Line: 25 | Upvalues: t (copy) ]]
	local sum = 0
	for i = 1, #p1 do
		sum = sum + 127 ^ (i - 1) * t[p1:sub(-i, -i)]
	end
	return sum
end
return {
	Compress = function(p1) --[[ compress | Line: 33 | Upvalues: t (copy) ]]
		local v1 = t
		local t2 = {}
		for k, v in pairs(v1) do
			t2[k] = v
		end
		local v2 = t2
		local v3 = ""
		local t3 = {}
		local count = #v2
		local v4 = 1
		local t4 = {}
		local count_2 = 0
		local function listkey(p1) --[[ listkey | Line: 37 | Upvalues: v2 (copy), t (ref), v4 (ref), count_2 (ref), t4 (copy), t3 (copy) ]]
			local v1 = v2[p1]
			local v22 = ""
			repeat
				local v3 = v1 % 127
				v22 = t[v3] .. v22
				v1 = (v1 - v3) / 127
			until v1 == 0
			if v4 < #v22 then
				local v5 = v4
				local v6 = count_2
				v4 = #v22
				count_2 = 0
				t4[v5] = v6
			end
			local v7 = v22
			t3[#t3 + 1] = ("\1"):rep(v4 - #v7) .. v7
			count_2 = count_2 + 1
		end
		for i = 1, #p1 do
			local v5 = p1:sub(i, i)
			local v6 = v3 .. v5
			if v2[v6] then
				v3 = v6
				continue
			end
			local v7 = v2[v3]
			local v8 = ""
			repeat
				local v9 = v7 % 127
				v8 = t[v9] .. v8
				v7 = (v7 - v9) / 127
			until v7 == 0
			if v4 < #v8 then
				t4[v4] = count_2
				v4 = #v8
				count_2 = 0
			end
			local v10 = v8
			t3[#t3 + 1] = ("\1"):rep(v4 - #v10) .. v10
			count_2 = count_2 + 1
			count = count + 1
			v2[v6] = count
			v2[count] = v6
			v3 = v5
		end
		local v11 = v2[v3]
		local v12 = ""
		repeat
			local v13 = v11 % 127
			v12 = t[v13] .. v12
			v11 = (v11 - v13) / 127
		until v11 == 0
		if v4 < #v12 then
			t4[v4] = count_2
			v4 = #v12
			count_2 = 0
		end
		local v14 = v12
		t3[#t3 + 1] = ("\1"):rep(v4 - #v14) .. v14
		count_2 = count_2 + 1
		t4[v4] = count_2
		return table.concat(t4, ",") .. "|" .. table.concat(t3)
	end,
	Decompress = function(p1) --[[ decompress | Line: 61 | Upvalues: t (copy), tobase10 (copy) ]]
		local t2 = {}
		for k, v in pairs(t) do
			t2[k] = v
		end
		local v2, v3 = p1:match("(.-)|(.*)")
		local t3, sum, v4, v5 = {}, 1, {}, t2
		for v6 in v2:gmatch("%d+") do
			local v7 = #t3 + 1
			t3[v7] = v3:sub(sum, sum + v6 * v7 - 1)
			sum = sum + v6 * v7
		end
		local v8 = nil
		for i = 1, #t3 do
			for v9 in t3[i]:gmatch(("."):rep(i)) do
				local v10 = v5[tobase10(v9)]
				if v8 then
					if v10 then
						v4[#v4 + 1] = v10
						v5[#v5 + 1] = v8 .. v10:sub(1, 1)
					else
						v10 = v8 .. v8:sub(1, 1)
						v4[#v4 + 1] = v10
						v5[#v5 + 1] = v10
					end
				else
					v4[1] = v10
				end
				v8 = v10
			end
		end
		return table.concat(v4)
	end
}