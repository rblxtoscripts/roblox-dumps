-- https://lua.expert/
local UserService = game:GetService("UserService")
local t = {
	BATCH_MAX = 100,
	RESULTS_PER_MIN = 250,
	DISPATCH_INTERVAL = 0.2,
	CACHE_TTL = 300,
	QUEUE_CAP = 20000,
	RETRY = {
		INITIAL_BACKOFF = 1,
		MAX_BACKOFF = 8,
		FACTOR = 2,
		JITTER = 0.25,
		SHRINK = 0.5,
		MIN_BATCH = 1
	}
}
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local RESULTS_PER_MIN = t.RESULTS_PER_MIN
local v1 = RESULTS_PER_MIN
local v2 = RESULTS_PER_MIN / 60
local v3 = false
local v4 = 0
local BATCH_MAX = t.BATCH_MAX
local function now() --[[ now | Line: 116 ]]
	return os.clock()
end
local function randomJitter(p1) --[[ randomJitter | Line: 120 ]]
	return 1 + (math.random() * 2 - 1) * p1
end
local function takeTokens(p1) --[[ takeTokens | Line: 126 | Upvalues: v1 (ref), RESULTS_PER_MIN (ref), v2 (ref), t (copy) ]]
	v1 = math.min(RESULTS_PER_MIN, v1 + v2 * t.DISPATCH_INTERVAL)
	if p1 <= v1 then
		v1 = v1 - p1
		return true
	else
		return false
	end
end
local function getCached(p1) --[[ getCached | Line: 136 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]
	if v1 and v1.expires > os.clock() then
		return v1.data
	else
		t2[p1] = nil
		return nil
	end
end
local function setCache(p1, p2) --[[ setCache | Line: 145 | Upvalues: t (copy), t2 (copy) ]]
	local v3 = os.clock() + (if p2 then p2 else t.CACHE_TTL)
	for i, v in ipairs(p1) do
		t2[v.Id] = {
			data = v,
			expires = v3
		}
	end
end
local function enqueue(p1) --[[ enqueue | Line: 152 | Upvalues: t4 (copy), t5 (ref), t (copy) ]]
	for i, v in ipairs(p1) do
		if not t4[v] then
			if #t5 >= t.QUEUE_CAP then
				warn("[UserInfoFetcher] Queue full; dropping id:", v)
				continue
			end
			t4[v] = true
			table.insert(t5, v)
		end
	end
end
local function popBatch(p1) --[[ popBatch | Line: 165 | Upvalues: t5 (ref), t4 (copy) ]]
	if p1 <= 0 or #t5 == 0 then
		return {}
	end
	local v2 = table.create((math.min(p1, #t5)))
	local count = 0
	for i = 1, #t5 do
		local v3 = t5[i]
		if t4[v3] then
			table.insert(v2, v3)
			t4[v3] = false
			count = count + 1
			if p1 <= count then
				break
			end
		end
	end
	if count == 0 then
		return {}
	end
	local t = {}
	for i, v in ipairs(t5) do
		if t4[v] then
			table.insert(t, v)
		end
	end
	t5 = t
	return v2
end
local function notifySuccess(p1) --[[ notifySuccess | Line: 188 | Upvalues: t3 (copy) ]]
	for k, v in pairs(t3) do
		local v1 = p1[k]
		if v1 then
			for i, v2 in ipairs(v) do
				v2:Fire(true, v1)
				v2:Destroy()
			end
			t3[k] = nil
		end
	end
end
local function notifyError(p1, p2) --[[ notifyError | Line: 201 | Upvalues: t3 (copy) ]]
	for i, v in ipairs(p1) do
		local v1 = t3[v]
		if v1 then
			for i2, v2 in ipairs(v1) do
				v2:Fire(false, p2)
				v2:Destroy()
			end
			t3[v] = nil
		end
	end
end
local function fetch(p1) --[[ fetch | Line: 214 | Upvalues: UserService (copy) ]]
	return pcall(function() --[[ Line: 215 | Upvalues: UserService (ref), p1 (copy) ]]
		return UserService:GetUserInfosByUserIdsAsync(p1)
	end)
end
local function doAttempt(p1, p2, p3) --[[ doAttempt | Line: 220 | Upvalues: v1 (ref), RESULTS_PER_MIN (ref), v2 (ref), t (copy), t4 (copy), t5 (ref), UserService (copy), setCache (copy), notifySuccess (copy), v4 (ref), BATCH_MAX (ref), notifyError (copy) ]]
	local v12 = #p1
	v1 = math.min(RESULTS_PER_MIN, v1 + v2 * t.DISPATCH_INTERVAL)
	local v42
	if v12 <= v1 then
		v1 = v1 - v12
		v42 = true
	else
		v42 = false
	end
	if v42 then
		local v5, v6, v7 = pcall(function() --[[ Line: 215 | Upvalues: UserService (ref), p1 (copy) ]]
			return UserService:GetUserInfosByUserIdsAsync(p1)
		end)
		if v5 and v6 then
			setCache(v6)
			local t2 = {}
			for i, v in ipairs(v6) do
				t2[v.Id] = v
			end
			for i, v in ipairs(p1) do
				if not t2[v] then
					t2[v] = {
						Username = "",
						DisplayName = "",
						Id = v
					}
					setCache({ t2[v] }, 60)
				end
			end
			notifySuccess(t2)
		else
			local v8 = v6
			local v10 = tostring(if v8 then v8 elseif v7 then v7 else "Unknown error")
			if not string.find(v10, "429") then
				warn("[UserInfoFetcher] GetUserInfos failed: ", v10)
				notifyError(p1, v10)
				return
			end
			local v122 = math.min(t.RETRY.MAX_BACKOFF, t.RETRY.INITIAL_BACKOFF * t.RETRY.FACTOR ^ (p3 - 1))
			local v13 = v122 * (1 + (math.random() * 2 - 1) * t.RETRY.JITTER)
			v4 = math.max(v4, os.clock() + v13)
			local v18 = math.max(t.RETRY.MIN_BATCH, (math.floor(p2 * t.RETRY.SHRINK)))
			for i = #p1, 1, -1 do
				local v19 = p1[i]
				if not t4[v19] then
					table.insert(t5, 1, v19)
					t4[v19] = true
				end
			end
			BATCH_MAX = v18
		end
	else
		for i, v in ipairs(p1) do
			if not t4[v] then
				table.insert(t5, 1, v)
				t4[v] = true
			end
		end
	end
end
local function startDispatcher() --[[ startDispatcher | Line: 278 | Upvalues: v3 (ref), v4 (ref), t (copy), t5 (ref), popBatch (copy), BATCH_MAX (ref), doAttempt (copy) ]]
	if not v3 then
		v3 = true
		task.spawn(function() --[[ Line: 282 | Upvalues: v4 (ref), t (ref), t5 (ref), popBatch (ref), BATCH_MAX (ref), doAttempt (ref) ]]
			local count_2 = 1
			while true do
				local v1, v2, v3, v42, v5, v6, v7
				if v4 > 0 then
					local v8 = v4 - os.clock()
					if v8 > 0 then
						local v9 = task.wait
						v9((math.min(v8, t.DISPATCH_INTERVAL)))
					else
						v4 = 0
						count_2 = 1
						if #t5 > 0 then
							v1 = BATCH_MAX
							v2 = #t5
							v3 = popBatch((math.min(v1, v2)))
							if #v3 > 0 then
								doAttempt(v3, BATCH_MAX, count_2)
								if v4 > 0 then
									count_2 = count_2 + 1
								else
									v42 = t.BATCH_MAX
									v5 = BATCH_MAX * 1.25
									v6 = math.floor(v5)
									v7 = math.max(1, v6)
									BATCH_MAX = math.min(v42, v7)
									count_2 = 1
								end
							end
						end
						if #t5 == 0 then
							task.wait(t.DISPATCH_INTERVAL)
							continue
						end
						task.wait(t.DISPATCH_INTERVAL)
					end
				else
					if #t5 > 0 then
						v1 = BATCH_MAX
						v2 = #t5
						v3 = popBatch((math.min(v1, v2)))
						if #v3 > 0 then
							doAttempt(v3, BATCH_MAX, count_2)
							if v4 > 0 then
								count_2 = count_2 + 1
							else
								v42 = t.BATCH_MAX
								v5 = BATCH_MAX * 1.25
								v6 = math.floor(v5)
								v7 = math.max(1, v6)
								BATCH_MAX = math.min(v42, v7)
								count_2 = 1
							end
						end
					end
					task.wait(t.DISPATCH_INTERVAL)
				end
			end
		end)
	end
end
return {
	Get = function(p1) --[[ Get | Line: 331 | Upvalues: t2 (copy), t5 (ref), BATCH_MAX (ref), v1 (ref), RESULTS_PER_MIN (ref), v2 (ref), t (copy), UserService (copy), setCache (copy), enqueue (copy), v3 (ref), v4 (ref), popBatch (copy), doAttempt (copy) ]]
		local t3 = {}
		local t4 = {}
		for i, v in ipairs(p1) do
			local v12
			local v22 = t2[v]
			if v22 and v22.expires > os.clock() then
				v12 = v22.data
			else
				t2[v] = nil
				v12 = nil
			end
			if v12 then
				t3[v] = v12
				continue
			end
			table.insert(t4, v)
		end
		if #t4 > 0 then
			local t6 = {}
			if #t5 == 0 then
				local v42 = math.min(BATCH_MAX, #t4)
				local t7 = {}
				for i = 1, v42 do
					table.insert(t7, t4[i])
				end
				local v6 = #t7
				v1 = math.min(RESULTS_PER_MIN, v1 + v2 * t.DISPATCH_INTERVAL)
				local v9
				if v6 <= v1 then
					v1 = v1 - v6
					v9 = true
				else
					v9 = false
				end
				local v10, v11
				if v9 then
					local v122, v13, _ = pcall(function() --[[ Line: 215 | Upvalues: UserService (ref), t7 (copy) ]]
						return UserService:GetUserInfosByUserIdsAsync(t7)
					end)
					v10 = v122
					v11 = v13
				else
					v10 = false
					v11 = nil
				end
				if v10 and v11 then
					setCache(v11)
					for i, v in ipairs(v11) do
						t3[v.Id] = v
					end
					if v42 < #t4 then
						for j = v42 + 1, #t4 do
							table.insert(t6, t4[j])
						end
					end
				else
					t6 = t4
				end
			else
				t6 = t4
			end
			if #t6 > 0 then
				enqueue(t6)
				if v3 then
					return t3
				end
				v3 = true
				task.spawn(function() --[[ Line: 282 | Upvalues: v4 (ref), t (ref), t5 (ref), popBatch (ref), BATCH_MAX (ref), doAttempt (ref) ]]
					local count_2 = 1
					while true do
						local v1, v2, v3, v42, v5, v6, v7
						if v4 > 0 then
							local v8 = v4 - os.clock()
							if v8 > 0 then
								local v9 = task.wait
								v9((math.min(v8, t.DISPATCH_INTERVAL)))
							else
								v4 = 0
								count_2 = 1
								if #t5 > 0 then
									v1 = BATCH_MAX
									v2 = #t5
									v3 = popBatch((math.min(v1, v2)))
									if #v3 > 0 then
										doAttempt(v3, BATCH_MAX, count_2)
										if v4 > 0 then
											count_2 = count_2 + 1
										else
											v42 = t.BATCH_MAX
											v5 = BATCH_MAX * 1.25
											v6 = math.floor(v5)
											v7 = math.max(1, v6)
											BATCH_MAX = math.min(v42, v7)
											count_2 = 1
										end
									end
								end
								if #t5 == 0 then
									task.wait(t.DISPATCH_INTERVAL)
									continue
								end
								task.wait(t.DISPATCH_INTERVAL)
							end
						else
							if #t5 > 0 then
								v1 = BATCH_MAX
								v2 = #t5
								v3 = popBatch((math.min(v1, v2)))
								if #v3 > 0 then
									doAttempt(v3, BATCH_MAX, count_2)
									if v4 > 0 then
										count_2 = count_2 + 1
									else
										v42 = t.BATCH_MAX
										v5 = BATCH_MAX * 1.25
										v6 = math.floor(v5)
										v7 = math.max(1, v6)
										BATCH_MAX = math.min(v42, v7)
										count_2 = 1
									end
								end
							end
							task.wait(t.DISPATCH_INTERVAL)
						end
					end
				end)
			end
		end
		return t3
	end,
	GetOne = function(p1) --[[ GetOne | Line: 387 | Upvalues: t2 (copy), enqueue (copy), v3 (ref), v4 (ref), t (copy), t5 (ref), popBatch (copy), BATCH_MAX (ref), doAttempt (copy) ]]
		local v1 = t2[p1]
		local v2
		if v1 and v1.expires > os.clock() then
			v2 = v1.data
		else
			t2[p1] = nil
			v2 = nil
		end
		if v2 then
			return v2
		end
		enqueue({ p1 })
		if v3 then
			return {
				Username = "",
				DisplayName = "",
				Id = p1
			}
		end
		v3 = true
		task.spawn(function() --[[ Line: 282 | Upvalues: v4 (ref), t (ref), t5 (ref), popBatch (ref), BATCH_MAX (ref), doAttempt (ref) ]]
			local count_2 = 1
			while true do
				local v1, v2, v3, v42, v5, v6, v7
				if v4 > 0 then
					local v8 = v4 - os.clock()
					if v8 > 0 then
						local v9 = task.wait
						v9((math.min(v8, t.DISPATCH_INTERVAL)))
					else
						v4 = 0
						count_2 = 1
						if #t5 > 0 then
							v1 = BATCH_MAX
							v2 = #t5
							v3 = popBatch((math.min(v1, v2)))
							if #v3 > 0 then
								doAttempt(v3, BATCH_MAX, count_2)
								if v4 > 0 then
									count_2 = count_2 + 1
								else
									v42 = t.BATCH_MAX
									v5 = BATCH_MAX * 1.25
									v6 = math.floor(v5)
									v7 = math.max(1, v6)
									BATCH_MAX = math.min(v42, v7)
									count_2 = 1
								end
							end
						end
						if #t5 == 0 then
							task.wait(t.DISPATCH_INTERVAL)
							continue
						end
						task.wait(t.DISPATCH_INTERVAL)
					end
				else
					if #t5 > 0 then
						v1 = BATCH_MAX
						v2 = #t5
						v3 = popBatch((math.min(v1, v2)))
						if #v3 > 0 then
							doAttempt(v3, BATCH_MAX, count_2)
							if v4 > 0 then
								count_2 = count_2 + 1
							else
								v42 = t.BATCH_MAX
								v5 = BATCH_MAX * 1.25
								v6 = math.floor(v5)
								v7 = math.max(1, v6)
								BATCH_MAX = math.min(v42, v7)
								count_2 = 1
							end
						end
					end
					task.wait(t.DISPATCH_INTERVAL)
				end
			end
		end)
		return {
			Username = "",
			DisplayName = "",
			Id = p1
		}
	end,
	Warm = function(p1, p2) --[[ Warm | Line: 400 | Upvalues: setCache (copy) ]]
		setCache(p1, p2)
	end,
	Configure = function(p1) --[[ Configure | Line: 406 | Upvalues: t (copy), RESULTS_PER_MIN (ref), v2 (ref), BATCH_MAX (ref) ]]
		for k, v in pairs(p1) do
			if t[k] == nil then
				if k == "RETRY" and type(v) == "table" then
					for k2, v3 in pairs(v) do
						if t.RETRY[k2] ~= nil then
							t.RETRY[k2] = v3
						end
					end
					continue
				end
				warn("[UserInfoFetcher] Unknown config key:", k)
				continue
			end
			t[k] = v
		end
		RESULTS_PER_MIN = t.RESULTS_PER_MIN
		v2 = RESULTS_PER_MIN / 60
		BATCH_MAX = math.min(BATCH_MAX, t.BATCH_MAX)
	end,
	Reset = function() --[[ Reset | Line: 427 | Upvalues: t2 (copy), t3 (copy), t4 (copy), t5 (ref), v1 (ref), RESULTS_PER_MIN (ref), v4 (ref), BATCH_MAX (ref), t (copy) ]]
		for k in pairs(t2) do
			t2[k] = nil
		end
		for k, v in pairs(t3) do
			for i, v2 in ipairs(v) do
				v2:Fire(false, "Reset")
				v2:Destroy()
			end
			t3[k] = nil
		end
		table.clear(t4)
		table.clear(t5)
		v1 = RESULTS_PER_MIN
		v4 = 0
		BATCH_MAX = t.BATCH_MAX
	end
}