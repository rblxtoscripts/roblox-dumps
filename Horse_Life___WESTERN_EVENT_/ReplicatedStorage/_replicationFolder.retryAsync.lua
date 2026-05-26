-- https://lua.expert/
return function(p1, ...) --[[ retryAsync | Line: 2 ]]
	local v1 = if typeof(p1) == "function" then p1 else p1.callback
	local v2
	if typeof(v1) == "table" then
		local t = { select(2, table.unpack(v1)) }
		v1, v2 = table.unpack(v1), t
	else
		v2 = { ... }
	end
	local v4 = nil
	local v5 = nil
	local v7 = (if typeof(p1) == "function" then 5 else p1.maxAttempts) or 5
	local v9 = (if typeof(p1) == "function" then 1 else p1.pauseConstant) or 0
	local _ = if typeof(p1) == "function" then 2 else p1.pauseExponent
	local v10 = v9 + 2 ^ (v7 - 1)
	local count = 0
	local v11 = 0
	while count < v7 and not v4 do
		if count > 0 then
			task.wait(v9 + v11)
		end
		local v12, v13 = pcall(v1, table.unpack(v2))
		count, v4, v5, v11 = count + 1, v12, v13, math.clamp(v11 * 2, 1, v10)
	end
	return v4, v5
end