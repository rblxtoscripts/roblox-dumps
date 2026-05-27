-- https://lua.expert/
local t = {}
local v1 = Random.new()
function t.getRandomFromTable(p1, p2) --[[ getRandomFromTable | Line: 12 | Upvalues: v1 (copy) ]]
	if #p1 <= 1 then
		return p1[1]
	end
	local v12 = type(p2) == "number" and Random.new(p2) or p2
	local v2 = if v12 then v12:NextInteger(1, #p1) else v1:NextInteger(1, #p1)
	return p1[v2], v2
end
function t.getRandomWeightedItem(p1, p2, ...) --[[ getRandomWeightedItem | Line: 38 | Upvalues: t (copy) ]]
	local v1 = t.getWeightedItems(p1, ...)
	return t.getRandomFromTable(v1, p2), v1
end
function t.getWeightedItems(p1, p2) --[[ getWeightedItems | Line: 57 ]]
	local t = {}
	local sum = 0
	local t2 = {}
	for k, v in pairs(p1) do
		local sum_2 = typeof(v) == "table" and v.P or v
		local v1 = nil
		local v2 = nil
		if type(p2) == "function" then
			local v3, v4 = p2(v, sum_2, k)
			v2 = v4
			v1 = v3
		elseif type(p2) == "string" then
			v1 = v[p2]
		end
		if v2 then
			sum_2 = 0
		elseif v1 then
			sum_2 = sum_2 + v1
		end
		if sum_2 and (type(sum_2) == "number" and sum_2 > 0) then
			sum = sum + sum_2 * 100
			t2[#t2 + 1] = sum
			t[#t + 1] = k
		end
	end
	if next(p1) and sum == 0 then
		return p1
	end
	local t3 = {}
	local t4 = {
		__index = function(p1, p2) --[[ Line: 96 | Upvalues: sum (ref), t2 (copy), t (copy) ]]
			local v1 = tonumber(p2)
			if v1 == nil then
				return nil
			end
			if v1 < 1 or sum < v1 then
				return nil
			end
			local v2 = #t2
			local v3 = 1
			while v3 <= v2 do
				local v4 = math.floor((v3 + v2) / 2)
				if v1 <= t2[v4] then
					if v4 == 1 or t2[v4 - 1] < v1 then
						return t[v4]
					end
					v2 = v4 - 1
				else
					v3 = v4 + 1
				end
			end
			return nil
		end,
		__len = function(p1) --[[ Line: 120 | Upvalues: sum (ref) ]]
			return sum
		end
	}
	setmetatable(t3, t4)
	return t3
end
function t.getNormalizedProbability(p1, p2) --[[ getNormalizedProbability | Line: 137 ]]
	local t = {}
	local sum = 0
	local t2 = {}
	for k, v in pairs(p1) do
		local sum_2 = typeof(v) == "table" and v.P or v
		local v1 = nil
		local v2 = nil
		if type(p2) == "function" then
			local v3, v4 = p2(v, sum_2)
			v2 = v4
			v1 = v3
		elseif type(p2) == "string" then
			v1 = v[p2]
		end
		if v2 then
			sum_2 = 0
		elseif v1 then
			sum_2 = sum_2 + v1
		end
		if sum_2 and (type(sum_2) == "number" and sum_2 > 0) then
			local v5 = sum_2 * 100
			t[k] = v5
			sum = sum + v5
			continue
		end
		t[k] = 0
	end
	for k, v in pairs(p1) do
		t2[k] = if sum == 0 then 0 else t[k] / sum
	end
	return t2
end
function t.getRandomInsertAndRemove(p1, p2, p3) --[[ getRandomInsertAndRemove | Line: 176 ]]
	local v1 = p3:NextInteger(1, #p1)
	table.insert(p2, p1[v1])
	table.remove(p1, v1)
end
function t.getRandomAndRemove(p1, p2) --[[ getRandomAndRemove | Line: 182 ]]
	local v1 = p2:NextInteger(1, #p1)
	table.remove(p1, v1)
	return p1[v1]
end
for i = 1, 1000 do
	v1:NextInteger(1, 1000)
end
return t