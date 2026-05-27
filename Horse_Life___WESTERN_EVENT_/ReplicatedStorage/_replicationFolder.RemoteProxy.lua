-- https://lua.expert/
local t = {}
local t2 = {
	FireServer = true,
	FireClient = true,
	FireAllClients = true,
	InvokeServer = true,
	InvokeClient = true
}
local t3 = {
	OnServerEvent = true,
	OnClientEvent = true
}
local t4 = {
	OnServerInvoke = true,
	OnClientInvoke = true
}
local t5 = {
	Connect = true,
	Once = true
}
function t.__newindex(p1, p2, p3) --[[ __newindex | Line: 109 | Upvalues: t4 (copy) ]]
	if t4[p2] then
		p1.RemoteInstance[p2] = function(...) --[[ Line: 111 | Upvalues: p1 (copy), p3 (copy) ]]
			if not (p1.RemoteCallbacks and p1.RemoteCallbacks.RemoteFunction) then
				return p3(...)
			end
			for v1, v2 in p1.RemoteCallbacks.RemoteFunction do
				task.spawn(v2, p1.RemoteInstance.Name, ...)
			end
			return p3(...)
		end
	else
		rawset(p1, p2, p3)
	end
end
function t.__index(p1, p2) --[[ __index | Line: 126 | Upvalues: t2 (copy), t3 (copy), t (copy) ]]
	if t2[p2] then
		return function(p12, ...) --[[ Line: 128 | Upvalues: p1 (copy), p2 (copy) ]]
			return p1.RemoteInstance[p2](p1.RemoteInstance, ...)
		end
	end
	if t3[p2] then
		return p1:_createEventMethods(p2)
	end
	local v2 = rawget(t, p2)
	if v2 == nil then
		return p1.RemoteInstance[p2]
	else
		return v2
	end
end
function t.new(p1, p2) --[[ new | Line: 145 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.RemoteInstance = p1
	v2.RemoteCallbacks = p2
	return v2
end
function t._runRemoteCallbacks(p1, ...) --[[ _runRemoteCallbacks | Line: 154 ]]
	local ClassName = p1.RemoteInstance.ClassName
	if not (p1.RemoteCallbacks and p1.RemoteCallbacks[ClassName]) then
		return
	end
	for v1, v2 in p1.RemoteCallbacks[ClassName] do
		task.spawn(v2, p1.RemoteInstance.Name, ...)
	end
end
function t._createEventMethods(p1, p2) --[[ _createEventMethods | Line: 163 | Upvalues: t5 (copy) ]]
	local t = {}
	for v1 in t5 do
		t[v1] = function(p12, p22) --[[ Line: 167 | Upvalues: p1 (copy), p2 (copy), v1 (copy) ]]
			return p1.RemoteInstance[p2][v1](p1.RemoteInstance[p2], function(...) --[[ Line: 168 | Upvalues: p1 (ref), p22 (copy) ]]
				p1:_runRemoteCallbacks(...)
				p22(...)
			end)
		end
	end
	return t
end
function t.Destroy(p1) --[[ Destroy | Line: 179 ]]
	p1.RemoteInstance:Destroy()
	table.clear(p1)
	setmetatable(p1, nil)
end
return t