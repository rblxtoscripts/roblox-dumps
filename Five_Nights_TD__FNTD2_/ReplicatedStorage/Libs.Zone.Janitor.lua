-- https://lua.expert/
local v1 = setmetatable({}, {
	__tostring = function() --[[ __tostring | Line: 14 ]]
		return "IndicesReference"
	end
})
local v2 = setmetatable({}, {
	__tostring = function() --[[ __tostring | Line: 20 ]]
		return "LinkToInstanceIndex"
	end
})
local t3 = {
	ClassName = "Janitor",
	CurrentlyCleaning = true,
	SuppressInstanceReDestroy = false,
	[v1] = nil
}
t3.__index = t3
local t4 = {
	["function"] = true,
	thread = true,
	RBXScriptConnection = "Disconnect"
}
function t3.new() --[[ new | Line: 71 | Upvalues: v1 (copy), t3 (copy) ]]
	return setmetatable({
		CurrentlyCleaning = false,
		[v1] = nil
	}, t3)
end
function t3.Is(p1) --[[ Is | Line: 84 | Upvalues: t3 (copy) ]]
	return if type(p1) == "table" then getmetatable(p1) == t3 else false
end
t3.instanceof = t3.Is
function t3.Add(p1, p2, p3, p4) --[[ Add | Line: 178 | Upvalues: v1 (copy), t4 (copy) ]]
	if p4 then
		p1:Remove(p4)
		local v12 = p1[v1]
		if not v12 then
			v12 = {}
			p1[v1] = v12
		end
		v12[p4] = p2
	end
	local v2 = typeof(p2)
	local v3 = if p3 then p3 else t4[v2] or "Destroy"
	if v2 == "function" or v2 == "thread" then
		if v3 ~= true then
			warn(string.format("Object is a %* and as such expected `true?` for the method name and instead got %*. Traceback: %*", v2, ("%*"):format(v3), debug.traceback(nil, 2)))
		end
	elseif not p2[v3] then
		warn(string.format("Object %* doesn\'t have method %*, are you sure you want to add it? Traceback: %*", ("%*"):format(p2), ("%*"):format(v3), debug.traceback(nil, 2)))
	end
	p1[p2] = v3
	return p2, p4
end
function t3.AddObject(p1, p2, p3, p4, ...) --[[ AddObject | Line: 235 ]]
	return p1:Add(p2.new(...), p3, p4)
end
function t3.Remove(p1, p2) --[[ Remove | Line: 264 | Upvalues: v1 (copy) ]]
	local v12 = p1[v1]
	if v12 then
		local v2 = v12[p2]
		if v2 then
			local v3 = p1[v2]
			if v3 then
				if v3 == true then
					if type(v2) == "function" then
						v2()
					elseif not (if coroutine.running() == v2 then nil else pcall(function() --[[ Line: 280 | Upvalues: v2 (copy) ]]
	task.cancel(v2)
end)) then
						task.defer(function() --[[ Line: 286 | Upvalues: v2 (copy) ]]
							if not v2 then
								return
							end
							task.cancel(v2)
						end)
					end
				else
					local v6 = v2[v3]
					if v6 and (p1.SuppressInstanceReDestroy and (v3 == "Destroy" and typeof(v2) == "Instance")) then
						pcall(v6, v2)
					elseif v6 then
						v6(v2)
					end
				end
				p1[v2] = nil
			end
			v12[p2] = nil
		end
	end
	return p1
end
function t3.RemoveNoClean(p1, p2) --[[ RemoveNoClean | Line: 347 | Upvalues: v1 (copy) ]]
	local v12 = p1[v1]
	if v12 then
		local v2 = v12[p2]
		if v2 then
			p1[v2] = nil
		end
		v12[p2] = nil
	end
	return p1
end
function t3.RemoveList(p1, ...) --[[ RemoveList | Line: 403 | Upvalues: v1 (copy) ]]
	if p1[v1] then
		local v12 = select("#", ...)
		if v12 == 1 then
			return p1:Remove(...)
		end
		for i = 1, v12 do
			p1:Remove((select(i, ...)))
		end
	end
	return p1
end
function t3.RemoveListNoClean(p1, ...) --[[ RemoveListNoClean | Line: 461 | Upvalues: v1 (copy) ]]
	local v12 = p1[v1]
	if v12 then
		local v2 = select("#", ...)
		if v2 == 1 then
			return p1:RemoveNoClean(...)
		end
		for i = 1, v2 do
			local v3 = select(i, ...)
			local v4 = v12[v3]
			if v4 then
				p1[v4] = nil
			end
			v12[v3] = nil
		end
	end
	return p1
end
function t3.Get(p1, p2) --[[ Get | Line: 509 | Upvalues: v1 (copy) ]]
	local v12 = p1[v1]
	if v12 then
		return v12[p2]
	else
		return nil
	end
end
function t3.GetAll(p1) --[[ GetAll | Line: 539 | Upvalues: v1 (copy) ]]
	local v12 = p1[v1]
	if v12 then
		return table.freeze(table.clone(v12))
	else
		return {}
	end
end
local function GetFenv(p1) --[[ GetFenv | Line: 544 | Upvalues: v1 (copy) ]]
	return function() --[[ Line: 545 | Upvalues: p1 (copy), v1 (ref) ]]
		for v12, v2 in next, p1 do
			if v12 ~= v1 and v12 ~= "SuppressInstanceReDestroy" then
				return v12, v2
			end
		end
	end
end
function t3.Cleanup(p1) --[[ Cleanup | Line: 572 | Upvalues: v1 (copy) ]]
	if p1.CurrentlyCleaning then
		return
	end
	p1.CurrentlyCleaning = nil
	local function f1() --[[ Line: 545 | Upvalues: p1 (copy), v1 (ref) ]]
		for v12, v2 in next, p1 do
			if v12 ~= v1 and v12 ~= "SuppressInstanceReDestroy" then
				return v12, v2
			end
		end
	end
	local v2, v3 = f1()
	while v2 and v3 do
		local v4
		if v3 == true then
			if type(v2) == "function" then
				v2()
			else
				v4 = if coroutine.running() == v2 then nil else pcall(function() --[[ Line: 586 | Upvalues: v2 (ref) ]]
	task.cancel(v2)
end)
				if not v4 then
					task.defer(function() --[[ Line: 592 | Upvalues: v2 (ref) ]]
						if not v2 then
							return
						end
						task.cancel(v2)
					end)
				end
			end
		else
			local v6 = v2[v3]
			if v6 and (p1.SuppressInstanceReDestroy and (v3 == "Destroy" and typeof(v2) == "Instance")) then
				pcall(v6, v2)
			elseif v6 then
				v6(v2)
			end
		end
		p1[v2] = nil
		local v7, v8 = f1()
		v2, v3 = v7, v8
	end
	local v9 = p1[v1]
	if v9 then
		table.clear(v9)
		p1[v1] = {}
	end
	p1.CurrentlyCleaning = false
end
function t3.Destroy(p1) --[[ Destroy | Line: 631 ]]
	p1:Cleanup()
end
t3.__call = t3.Cleanup
function t3.LinkToInstance(p1, p2, p3) --[[ LinkToInstance | Line: 680 | Upvalues: v2 (copy) ]]
	local v1 = if p3 then newproxy(false) else v2
	return p1:Add(p2.Destroying:Connect(function() --[[ Line: 683 | Upvalues: p1 (copy) ]]
		p1:Cleanup()
	end), "Disconnect", v1)
end
t3.LegacyLinkToInstance = t3.LinkToInstance
function t3.LinkToInstances(p1, ...) --[[ LinkToInstances | Line: 696 | Upvalues: t3 (copy) ]]
	local v1 = t3.new()
	for i = 1, select("#", ...) do
		local v2 = select(i, ...)
		if typeof(v2) == "Instance" then
			v1:Add(p1:LinkToInstance(v2, true), "Disconnect")
		end
	end
	return v1
end
function t3.__tostring(p1) --[[ __tostring | Line: 710 ]]
	return "Janitor"
end
return table.freeze(t3)