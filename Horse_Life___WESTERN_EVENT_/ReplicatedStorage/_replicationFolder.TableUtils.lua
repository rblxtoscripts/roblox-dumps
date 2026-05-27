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
function t.MergeOriginal(p1, p2, p3) --[[ MergeOriginal | Line: 66 ]]
	for k, v in pairs(p2) do
		if p3 then
			if p1[k] == nil then
				p1[k] = v
			end
			continue
		end
		p1[k] = v
	end
	return p1
end
function t.MergeLists(p1, p2) --[[ MergeLists | Line: 84 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, v)
	end
	for k, v in pairs(p2) do
		table.insert(t, v)
	end
	return t
end
function t.MergeOriginalLists(p1, p2) --[[ MergeOriginalLists | Line: 95 ]]
	for k, v in pairs(p2) do
		table.insert(p1, v)
	end
	return p1
end
function t.SwapKeyValue(p1) --[[ SwapKeyValue | Line: 106 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[v] = k
	end
	return t
end
function t.ToList(p1) --[[ ToList | Line: 117 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, v)
	end
	return t
end
function t.ToListByIndex(p1) --[[ ToListByIndex | Line: 128 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, k)
	end
	return t
end
function t.ToListByValue(p1, p2) --[[ ToListByValue | Line: 139 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, type(v) == "table" and v[p2] or v)
	end
	return t
end
function t.ToListSortedByValue(p1, p2) --[[ ToListSortedByValue | Line: 151 | Upvalues: t (copy) ]]
	local v1 = t.ToList(p1)
	table.sort(v1, function(p1, p22) --[[ Line: 153 | Upvalues: p2 (copy) ]]
		return p1[p2] < p22[p2]
	end)
	return v1
end
function t.ToListByValueNotRequired(p1, p2) --[[ ToListByValueNotRequired | Line: 162 ]]
	local t = {}
	for k, v in pairs(p1) do
		if type(v) == "table" and v[p2] or v then
			table.insert(t, v)
		end
	end
	return t
end
function t.PickRandom(p1) --[[ PickRandom | Line: 176 | Upvalues: t (copy) ]]
	local v1 = t.ToListByIndex(p1)
	return v1[math.random(#v1)]
end
function t.Count(p1) --[[ Count | Line: 185 ]]
	local count = 0
	for k, v in pairs(p1) do
		count = count + 1
	end
	return count
end
function t.Copy(p1) --[[ Copy | Line: 196 ]]
	local t = {}
	for k, v in pairs(p1) do
		t[k] = v
	end
	return t
end
local function v1(p1, p2) --[[ DeepCopy | Line: 208 | Upvalues: v1 (copy) ]]
	if type(p1) ~= "table" then
		return p1
	end
	local v12 = if p2 then p2 else {}
	if v12[p1] then
		return v12[p1]
	end
	local t = {}
	v12[p1] = t
	local v2 = v12
	for k, v in pairs(p1) do
		t[v1(k, v2)] = v1(v, v2)
	end
	local v3 = getmetatable(p1)
	if type(v3) == "table" then
		setmetatable(t, v1(v3, v2))
	end
	return t
end
t.DeepCopy = v1
local function v2(p1, p2, p3) --[[ DeepOverwrite | Line: 234 | Upvalues: v2 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v22 = v1[p1]
	if not v22 then
		v22 = {}
		v1[p1] = v22
	end
	local v3 = v1
	if v22[p2] then
		return p1
	end
	v22[p2] = true
	for k, v in pairs(p2) do
		if type(p1[k]) == "table" and type(v) == "table" then
			p1[k] = v2(p1[k], v, v3)
			continue
		end
		p1[k] = v
	end
	return p1
end
t.DeepOverwrite = v2
function t.GetIndex(p1, p2) --[[ GetIndex | Line: 261 ]]
	for k, v in pairs(p1) do
		if p2 == v then
			return k
		end
	end
	return nil
end
local function v3(p1, p2, p3) --[[ Stringify | Line: 276 | Upvalues: v3 (copy) ]]
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
function t.Contains(p1, p2) --[[ Contains | Line: 296 ]]
	for k, v in pairs(p1) do
		if v == p2 then
			return true
		end
	end
	return false
end
function t.ContainsRepeats(p1) --[[ ContainsRepeats | Line: 306 ]]
	for k, v in pairs(p1) do
		for k2, v2 in pairs(p1) do
			if k2 ~= k and v2 == p1[k] then
				return true
			end
		end
	end
end
function t.Reverse(p1) --[[ Reverse | Line: 316 | Upvalues: t (copy) ]]
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
function t.Overwrite(p1, p2) --[[ Overwrite | Line: 329 ]]
	for k, v in pairs(p2) do
		p1[k] = v
	end
	return p1
end
function t.ReadOnly(p1) --[[ ReadOnly | Line: 341 ]]
	return setmetatable(p1, {
		__index = function(p1, p2) --[[ __index | Line: 343 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end,
		__newindex = function(p1, p2, p3) --[[ __newindex | Line: 346 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end
	})
end
function t.DeepReadOnly(p1) --[[ DeepReadOnly | Line: 355 | Upvalues: t (copy) ]]
	for k, v in pairs(p1) do
		if type(v) == "table" then
			t.DeepReadOnly(v)
		end
	end
	return t.ReadOnly(p1)
end
function t.RemoveInstancesFromTable(p1) --[[ RemoveInstancesFromTable | Line: 365 ]]
	if not p1 then
		return
	end
	for k, v in pairs(p1) do
		if typeof(k) == "Instance" or typeof(v) == "Instance" then
			p1[k] = nil
		end
	end
end
function t.strip(p1, p2) --[[ strip | Line: 375 ]]
	local t = {}
	for k, v in pairs(p1) do
		if not table.find(p2, k) then
			t[k] = v
		end
	end
	return t
end
function t.getNeighborsWithMinimum(p1, p2) --[[ getNeighborsWithMinimum | Line: 385 ]]
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
function t.Map(p1, p2) --[[ Map | Line: 413 ]]
	local t = {}
	for k, v in pairs(p1) do
		local v1, v2 = p2(k, v)
		if v2 then
			t[v2] = v1
			continue
		end
		if v2 == false then
			table.insert(t, v1)
			continue
		end
		t[k] = v1
	end
	return t
end
function t.GetDescendants(p1) --[[ GetDescendants | Line: 431 ]]
	local t = {}
	local function v1(p1) --[[ traverse | Line: 434 | Upvalues: t (copy), v1 (copy) ]]
		for k, v in pairs(p1) do
			t[k] = v
			if type(v) == "table" then
				v1(v)
			end
		end
	end
	v1(p1)
	return t
end
function t.Trim(p1, p2) --[[ Trim | Line: 447 ]]
	if #p1 <= p2 then
		return p1
	end
	local t = {}
	for i = 1, p2 do
		t[i] = p1[i]
	end
	return t
end
function t.Find(p1, p2) --[[ Find | Line: 459 ]]
	for v1, v2 in p1 do
		if p2(v1, v2) then
			return v1, v2
		end
	end
end
function t.Filter(p1, p2) --[[ Filter | Line: 467 ]]
	local t = {}
	for v1, v2 in p1 do
		if p2(v1, v2) then
			t[v1] = v2
		end
	end
	return t
end
function t.GetRandom(p1) --[[ GetRandom | Line: 477 ]]
	local t = {}
	local t2 = {}
	for v1, v2 in p1 do
		t[#t + 1] = v2
		t2[#t2 + 1] = v1
	end
	local v3 = math.random(1, #t)
	return t[v3], t2[v3]
end
function t.GetUniquePropertyValues(p1, p2) --[[ GetUniquePropertyValues | Line: 490 | Upvalues: t (copy) ]]
	local t2 = {}
	for v1, v2 in p1 do
		if not t2[v2[p2]] then
			t2[v2[p2]] = true
		end
	end
	return t.ToListByIndex(t2)
end
function t.AssignOrderedIds(p1, p2) --[[ AssignOrderedIds | Line: 502 | Upvalues: t (copy) ]]
	local v1 = t.ToListByIndex(p1)
	table.sort(v1, p2)
	local t2 = {}
	for v2, v3 in v1 do
		local v4 = p1[v3]
		v4.Id = v2
		t2[v3] = v4
	end
	return t2
end
function t.GetItemFromId(p1, p2) --[[ GetItemFromId | Line: 516 | Upvalues: t (copy) ]]
	return t.Find(p1, function(p1, p22) --[[ Line: 517 | Upvalues: p2 (copy) ]]
		return p22.Id == p2
	end)
end
function t.GetHighestIndex(p1) --[[ GetHighestIndex | Line: 522 | Upvalues: t (copy) ]]
	local v1 = t.ToListByIndex(p1)
	table.sort(v1)
	return v1[#v1]
end
function t.GetHighestValue(p1, p2) --[[ GetHighestValue | Line: 528 ]]
	local v1 = true
	local v2 = nil
	local v3 = nil
	for v4, v5 in p1 do
		if v1 then
			v1 = false
			v2 = v5
			v3 = v4
			continue
		end
		if p2 then
			if p2(v5, v2) then
				v2 = v5
				v3 = v4
			end
			continue
		end
		if v2 < v5 then
			v2 = v5
			v3 = v4
		end
	end
	return v2, v3
end
function t.LogTable(p1) --[[ LogTable | Line: 552 ]]
	local t = {}
	for k, v in pairs(p1.Table) do
		local v1
		v1 = if type(v) == "string" and v then v else k
		table.insert(t, string.format("\"%s\",", v1))
	end
	local v2 = p1.Output or print
	if not (#t > 0) then
		return
	end
	v2(p1.Message)
	v2(table.concat(t, "\n"))
end
function t.Concat(p1, p2, p3, p4, p5) --[[ Concat | Line: 572 ]]
	local t = {}
	for k, v in pairs(p1) do
		table.insert(t, p3 and tostring(p3(v, k)) or tostring(v))
	end
	return table.concat(t, p2, p4, p5)
end
function t.Average(p1) --[[ Average | Line: 581 ]]
	local sum = 0
	local count = 0
	for v1, v2 in p1 do
		if typeof(v2) == "number" then
			sum = sum + v2
			count = count + 1
		end
	end
	return sum / count
end
function t.IsArray(p1) --[[ IsArray | Line: 594 ]]
	local count = 0
	for v1 in p1 do
		count = count + 1
	end
	return count == #p1
end
local function v4(p1, p2) --[[ DeepEqual | Line: 603 | Upvalues: v4 (copy) ]]
	if p1 == p2 then
		return true
	end
	if type(p1) ~= type(p2) then
		return false
	end
	if type(p1) ~= "table" then
		return false
	end
	local count = 0
	for v1 in p1 do
		count = count + 1
	end
	local v2 = if count == #p1 then true else false
	local count_2 = 0
	for v3 in p2 do
		count_2 = count_2 + 1
	end
	if v2 ~= (if count_2 == #p2 then true else false) then
		return false
	end
	if v2 then
		if #p1 ~= #p2 then
			return false
		end
		for i = 1, #p1 do
			if not v4(p1[i], p2[i]) then
				return false
			end
		end
		return true
	else
		for v5, v6 in p1 do
			if not v4(p1[v5], p2[v5]) then
				return false
			end
		end
		local count_3 = 0
		for v7 in p1 do
			count_3 = count_3 + 1
		end
		local count_4 = 0
		for v8 in p2 do
			count_4 = count_4 + 1
		end
		return count_3 == count_4
	end
end
t.DeepEqual = v4
return t