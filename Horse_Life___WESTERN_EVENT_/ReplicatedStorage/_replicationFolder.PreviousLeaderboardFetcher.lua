-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("DataStore", "Server")
local t = {}
local v2 = 60
local t2 = {}
local t3 = {}
local v3 = false
local t4 = {}
local t5 = {}
local function _takeTokens(p1) --[[ _takeTokens | Line: 19 | Upvalues: v2 (ref) ]]
	v2 = math.min(60, v2 + 0.2)
	if p1 <= v2 then
		v2 = v2 - p1
		return true
	else
		return false
	end
end
local function _popTask() --[[ _popTask | Line: 28 | Upvalues: t2 (copy) ]]
	if #t2 == 0 then
		return nil
	else
		return table.remove(t2, 1)
	end
end
local function _keyOf(p1) --[[ _keyOf | Line: 34 ]]
	local v1 = tostring(p1.DataStoreName)
	return v1 .. ":" .. tostring(p1.Seed)
end
local function _startDispatcher() --[[ _startDispatcher | Line: 38 | Upvalues: v3 (ref), t2 (copy), v2 (ref), t5 (copy), v1 (copy), t4 (copy), t3 (copy) ]]
	if not v3 then
		v3 = true
		task.spawn(function() --[[ Line: 42 | Upvalues: t2 (ref), v2 (ref), t5 (ref), v1 (ref), t4 (ref), t3 (ref) ]]
			repeat
				local v12, v22
				v12 = if #t2 == 0 then nil else table.remove(t2, 1)
				if v12 then
					local v4 = tostring(v12.DataStoreName)
					local v5 = v4 .. ":" .. tostring(v12.Seed)
					v2 = math.min(60, v2 + 0.2)
					if v2 >= 1 then
						v2 = v2 - 1
						v22 = true
					else
						v22 = false
					end
					if v22 then
						local v7 = t5[v5] or v12
						local v8, v9 = v1.new(v7.DataStoreName, {
							OrderedDataStore = true
						}):GetSorted(false, v7.MaxEntries)
						if v9 then
							local t6 = {}
							for i = 1, #v8 do
								local v10 = v8[i]
								local t6_2 = {}
								t6_2.UserId = tonumber(v10.key)
								t6_2.Score = v10.value
								t6[i] = t6_2
							end
							local v11 = t4[v5]
							if v11 then
								for j = 1, #v11 do
									local v13_2, v14 = pcall(v11[j], t6, v7)
									if not v13_2 then
										warn("\226\157\140 PreviousLeaderboardFetcher, Critical error with callback:", v14)
									end
								end
							end
						end
						t3[v5] = nil
						t4[v5] = nil
						t5[v5] = nil
					else
						table.insert(t2, 1, v12)
					end
				end
				task.wait(0.2)
			until not v12
		end)
	end
end
function t.Enqueue(p1) --[[ Enqueue | Line: 80 | Upvalues: t4 (copy), t3 (copy), t5 (copy), t2 (copy), v3 (ref), v2 (ref), v1 (copy) ]]
	if not p1 or #p1 == 0 then
		return
	end
	for i = 1, #p1 do
		local v12 = p1[i]
		local v22 = tostring(v12.DataStoreName)
		local v32 = v22 .. ":" .. tostring(v12.Seed)
		t4[v32] = t4[v32] or {}
		if v12.OnResult then
			table.insert(t4[v32], v12.OnResult)
		end
		if not t3[v32] then
			t3[v32] = true
			t5[v32] = {
				DataStoreName = v12.DataStoreName,
				MaxEntries = v12.MaxEntries
			}
			table.insert(t2, t5[v32])
		end
	end
	if not v3 then
		v3 = true
		task.spawn(function() --[[ Line: 42 | Upvalues: t2 (ref), v2 (ref), t5 (ref), v1 (ref), t4 (ref), t3 (ref) ]]
			repeat
				local v12, v22
				v12 = if #t2 == 0 then nil else table.remove(t2, 1)
				if v12 then
					local v4 = tostring(v12.DataStoreName)
					local v5 = v4 .. ":" .. tostring(v12.Seed)
					v2 = math.min(60, v2 + 0.2)
					if v2 >= 1 then
						v2 = v2 - 1
						v22 = true
					else
						v22 = false
					end
					if v22 then
						local v7 = t5[v5] or v12
						local v8, v9 = v1.new(v7.DataStoreName, {
							OrderedDataStore = true
						}):GetSorted(false, v7.MaxEntries)
						if v9 then
							local t6 = {}
							for i = 1, #v8 do
								local v10 = v8[i]
								local t6_2 = {}
								t6_2.UserId = tonumber(v10.key)
								t6_2.Score = v10.value
								t6[i] = t6_2
							end
							local v11 = t4[v5]
							if v11 then
								for j = 1, #v11 do
									local v13_2, v14 = pcall(v11[j], t6, v7)
									if not v13_2 then
										warn("\226\157\140 PreviousLeaderboardFetcher, Critical error with callback:", v14)
									end
								end
							end
						end
						t3[v5] = nil
						t4[v5] = nil
						t5[v5] = nil
					else
						table.insert(t2, 1, v12)
					end
				end
				task.wait(0.2)
			until not v12
		end)
	end
end
return t