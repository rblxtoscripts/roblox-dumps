-- https://lua.expert/
local t = {
	ClassName = "Maid"
}
function t.new() --[[ new | Line: 55 | Upvalues: t (copy) ]]
	return setmetatable({
		_tasks = {}
	}, t)
end
function t.isMaid(p1) --[[ isMaid | Line: 76 ]]
	return if type(p1) == "table" then p1.ClassName == "Maid" else false
end
function t.__index(p1, p2) --[[ __index | Line: 96 | Upvalues: t (copy) ]]
	if t[p2] then
		return t[p2]
	else
		return p1._tasks[p2]
	end
end
function t.__newindex(p1, p2, p3) --[[ __newindex | Line: 124 | Upvalues: t (copy) ]]
	if t[p2] ~= nil then
		error(string.format("Cannot use \'%s\' as a Maid key", (tostring(p2))), 2)
	end
	local _tasks = p1._tasks
	local v1 = _tasks[p2]
	if v1 == p3 then
		return
	end
	_tasks[p2] = p3
	if not v1 then
		return
	end
	if typeof(v1) == "function" then
		v1()
		return
	end
	if typeof(v1) == "table" then
		if type(v1.Destroy) == "function" then
			v1:Destroy()
		end
	else
		if typeof(v1) == "Instance" and v1:IsA("Tween") then
			v1:Cancel()
			return
		end
		if typeof(v1) == "Instance" then
			v1:Destroy()
			return
		end
		if typeof(v1) == "Tween" then
			v1:Cancel()
			return
		end
		if typeof(v1) == "thread" then
			if not (if coroutine.running() == v1 then nil else pcall(function() --[[ Line: 155 | Upvalues: v1 (copy) ]]
	task.cancel(v1)
end)) then
				task.defer(function() --[[ Line: 161 | Upvalues: v1 (copy) ]]
					task.cancel(v1)
				end)
			end
		else
			if typeof(v1) ~= "RBXScriptConnection" then
				return
			end
			v1:Disconnect()
		end
	end
end
function t.Add(p1, p2) --[[ Add | Line: 178 ]]
	if not p2 then
		error("Task cannot be false or nil", 2)
	end
	p1[#p1._tasks + 1] = p2
	if type(p2) == "table" and not p2.Destroy then
		warn("[Maid.Add] - Gave table task without .Destroy\n\n" .. debug.traceback())
	end
	return p2
end
function t.GiveTask(p1, p2) --[[ GiveTask | Line: 199 ]]
	if not p2 then
		error("Task cannot be false or nil", 2)
	end
	p1[#p1._tasks + 1] = p2
	if type(p2) == "table" and not p2.Destroy then
		warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback())
	end
	return p2
end
function t.GivePromise(p1, p2) --[[ GivePromise | Line: 221 ]]
	return p2
end
function t.DoCleaning(p1) --[[ DoCleaning | Line: 256 ]]
	local _tasks = p1._tasks
	for v1, v2 in _tasks do
		if typeof(v2) == "RBXScriptConnection" then
			_tasks[v1] = nil
			v2:Disconnect()
		end
	end
	local v3, v4 = next(_tasks)
	while v4 ~= nil do
		local v5
		_tasks[v3] = nil
		if typeof(v4) == "function" then
			v4()
		else
			local v6, v7
			if typeof(v4) == "table" then
				local Destroy = v4.Destroy
				if type(Destroy) == "function" or typeof(v4) == "Instance" then
					v4:Destroy()
				elseif typeof(v4) == "thread" then
					if coroutine.running() == v4 then
						v5 = nil
					else
						v6 = pcall(function() --[[ Line: 280 | Upvalues: v4 (ref) ]]
							task.cancel(v4)
						end)
						v5 = v6
					end
					if not v5 then
						v7 = v4
						task.defer(function() --[[ Line: 287 | Upvalues: v7 (copy) ]]
							task.cancel(v7)
						end)
					end
				elseif typeof(v4) == "RBXScriptConnection" then
					v4:Disconnect()
				end
			elseif typeof(v4) == "Instance" then
				v4:Destroy()
			elseif typeof(v4) == "thread" then
				if coroutine.running() == v4 then
					v5 = nil
				else
					v6 = pcall(function() --[[ Line: 280 | Upvalues: v4 (ref) ]]
						task.cancel(v4)
					end)
					v5 = v6
				end
				if not v5 then
					v7 = v4
					task.defer(function() --[[ Line: 287 | Upvalues: v7 (copy) ]]
						task.cancel(v7)
					end)
				end
			elseif typeof(v4) == "RBXScriptConnection" then
				v4:Disconnect()
			end
		end
		local v8, v9 = next(_tasks)
		v4, v3 = v9, v8
	end
end
t.Destroy = t.DoCleaning
return t