-- https://lua.expert/
local t = {
	Append = function(p1, p2) --[[ Append | Line: 10 ]]
		for k, v in pairs(p2) do
			p1[#p1 + 1] = v
		end
		return p1
	end,
	Insert = function(p1, p2) --[[ Insert | Line: 18 ]]
		table.insert(p1, p2)
	end
}
function t.InsertAt(p1, p2, p3) --[[ InsertAt | Line: 22 | Upvalues: t (copy) ]]
	local v1 = t.Copy(p1)
	for i = p2, #v1 do
		p1[i + 1] = v1[i]
	end
	p1[p2] = p3
end
function t.GetFirst(p1) --[[ GetFirst | Line: 31 ]]
	for k, v in pairs(p1) do
		return k, v
	end
end
function t.Shuffle(p1, p2) --[[ Shuffle | Line: 37 | Upvalues: t (copy) ]]
	local v1 = t.Copy(p1)
	local v2 = type(p2) == "number" and Random.new(p2) or p2
	for i = 1, #p1 do
		if v2 then
			p1[i] = table.remove(v1, v2:NextInteger(1, #v1))
			continue
		end
		p1[i] = table.remove(v1, math.random(1, #v1))
	end
	return p1
end
function t.Merge(p1, p2) --[[ Merge | Line: 55 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[k] = v
	end
	for k, v in pairs(p2) do
		t[k] = v
	end
	return t
end
function t.MergeOriginal(p1, p2) --[[ MergeOriginal | Line: 66 ]]
	for k, v in pairs(p2) do
		p1[k] = v
	end
	return p1
end
function t.Sync(p1, p2) --[[ Sync | Line: 103 | Upvalues: t (copy) ]]
	if p1 == nil then
		p1 = {}
	end
	assert(if type(p1) == "table" then true else false, "First argument must be a table")
	assert(if type(p2) == "table" then true else false, "Second argument must be a table")
	local v3 = table.clone(p1)
	for k, v in pairs(v3) do
		local v4 = p2[k]
		if typeof(v) == "table" and not getmetatable(v) then
			if v4 == nil then
				v4 = {}
			end
			v3[k] = t.Sync(v, v4)
		end
	end
	for k, v in pairs(p2) do
		if v3[k] == nil then
			if type(v) == "table" then
				v3[k] = t.DeepCopy(v)
				continue
			end
			v3[k] = v
		end
	end
	return v3
end
function t.MergeLists(p1, p2) --[[ MergeLists | Line: 158 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, v)
	end
	for k, v in pairs(p2) do
		table.insert(t, v)
	end
	return t
end
function t.MergeOriginalLists(p1, p2) --[[ MergeOriginalLists | Line: 169 ]]
	for k, v in pairs(p2) do
		table.insert(p1, v)
	end
	return p1
end
function t.SwapKeyValue(p1) --[[ SwapKeyValue | Line: 180 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[v] = k
	end
	return t
end
function t.ToList(p1) --[[ ToList | Line: 191 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, v)
	end
	return t
end
function t.ToListByIndex(p1) --[[ ToListByIndex | Line: 202 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, k)
	end
	return t
end
function t.ToListByValue(p1, p2) --[[ ToListByValue | Line: 213 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, type(v) == "table" and v[p2] or v)
	end
	return t
end
function t.PickRandom(p1) --[[ PickRandom | Line: 224 | Upvalues: t (copy) ]]
	local v1 = t.ToListByIndex(p1)
	return v1[math.random(#v1)]
end
function t.Count(p1) --[[ Count | Line: 233 ]]
	local count = 0
	for k, v in pairs(p1) do
		count = count + 1
	end
	return count
end
function t.Copy(p1) --[[ Copy | Line: 244 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[k] = v
	end
	return t
end
local function v1(p1) --[[ DeepCopy | Line: 256 | Upvalues: v1 (copy) ]]
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	for k, v in pairs(p1) do
		t[v1(k)] = v1(v)
	end
	return setmetatable(t, v1((getmetatable(p1))))
end
t.DeepCopy = v1
local function v2(p1, p2) --[[ DeepOverwrite | Line: 274 | Upvalues: v2 (copy) ]]
	for k, v in pairs(p2) do
		if type(p1[k]) == "table" and type(v) == "table" then
			p1[k] = v2(p1[k], v)
			continue
		end
		p1[k] = v
	end
	return p1
end
t.DeepOverwrite = v2
function t.GetIndex(p1, p2) --[[ GetIndex | Line: 291 ]]
	for k, v in pairs(p1) do
		if p2 == v then
			return k
		end
	end
	return nil
end
local function v3(p1, p2, p3) --[[ Stringify | Line: 306 | Upvalues: v3 (copy) ]]
	local v2, v32 = p2 or 0, if p3 then p3 else tostring(p1)
	for k, v in pairs(p1) do
		local v4 = "\n" .. string.rep("  ", v2) .. tostring(k) .. ": "
		if type(v) == "table" then
			v32 = v3(v, k + 1, v32 .. v4)
			continue
		end
		v32 = v32 .. v4 .. tostring(v)
	end
	return v32
end
t.Stringify = v3
function t.Contains(p1, p2) --[[ Contains | Line: 326 ]]
	for k, v in pairs(p1) do
		if v == p2 then
			return true
		end
	end
	return false
end
function t.ContainsRepeats(p1) --[[ ContainsRepeats | Line: 336 ]]
	for k, v in pairs(p1) do
		for k2, v2 in pairs(p1) do
			if k2 ~= k and v2 == p1[k] then
				return true
			end
		end
	end
end
function t.Reverse(p1) --[[ Reverse | Line: 346 | Upvalues: t (copy) ]]
	local v1 = t.DeepCopy(p1)
	local v2 = v1
	for i = 1, math.floor(#v1 / 2) do
		local v3 = #v2 - i + 1
		local v5 = v2[i]
		v2[i] = v2[v3]
		v2[v3] = v5
	end
	return v2
end
function t.Overwrite(p1, p2) --[[ Overwrite | Line: 359 ]]
	for k, v in pairs(p2) do
		p1[k] = v
	end
	return p1
end
function t.ReadOnly(p1) --[[ ReadOnly | Line: 371 ]]
	return setmetatable(p1, {
		__index = function(p1, p2) --[[ __index | Line: 373 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end,
		__newindex = function(p1, p2, p3) --[[ __newindex | Line: 376 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end
	})
end
function t.DeepReadOnly(p1) --[[ DeepReadOnly | Line: 385 | Upvalues: t (copy) ]]
	for k, v in pairs(p1) do
		if type(v) == "table" then
			t.DeepReadOnly(v)
		end
	end
	return t.ReadOnly(p1)
end
function t.RemoveInstancesFromTable(p1) --[[ RemoveInstancesFromTable | Line: 395 ]]
	if not p1 then
		return
	end
	for k, v in pairs(p1) do
		if typeof(k) == "Instance" or typeof(v) == "Instance" then
			p1[k] = nil
		end
	end
end
function t.getNeighborsWithMinimum(p1, p2) --[[ getNeighborsWithMinimum | Line: 405 ]]
	local t = {}
	if p2 < 1 or #p1 < p2 then
		return nil, "Invalid index."
	end
	local sum = p2 - 2
	local sum_2 = p2 + 2
	if sum < 1 then
		sum = 1
		sum_2 = sum_2 + (1 - sum)
	elseif #p1 < sum_2 then
		sum = sum - (sum_2 - #p1)
		sum_2 = #p1
	end
	for i = sum, sum_2 do
		table.insert(t, i)
	end
	return t
end
function t.Find(p1, p2) --[[ Find | Line: 433 ]]
	for v1, v2 in p1 do
		if p2(v1, v2) then
			return v1, v2
		end
	end
end
function t.Map(p1, p2) --[[ Map | Line: 441 ]]
	local t = {}
	for k, v in pairs(p1) do
		local v1, v2 = p2(k, v)
		if v2 then
			t[v2] = v1
			continue
		end
		t[k] = v1
	end
	return t
end
return t