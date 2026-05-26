-- https://lua.expert/
local t = {}
t.__index = t
local SignalConnection = require(script.SignalConnection)
local function v1(p1) --[[ DeepCopy | Line: 34 | Upvalues: v1 (copy) ]]
	if type(p1) ~= "table" then
		return p1
	end
	local t = {}
	for k, v in pairs(p1) do
		if type(v) == "table" then
			t[k] = v1(v)
			continue
		end
		t[k] = v
	end
	return t
end
function t.new() --[[ new | Line: 52 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2._callbacks = {}
	return v2
end
function t._createConnection(p1, p2, p3) --[[ _createConnection | Line: 62 | Upvalues: SignalConnection (copy) ]]
	local t = {
		isOnce = p2,
		callback = p3
	}
	t.connection = SignalConnection.new(function() --[[ Line: 68 | Upvalues: p1 (copy), t (copy) ]]
		local v1 = table.find(p1._callbacks, t)
		if not v1 then
			return
		end
		table.remove(p1._callbacks, v1)
	end)
	table.insert(p1._callbacks, t)
	return t.connection
end
function t.Connect(p1, p2) --[[ Connect | Line: 81 ]]
	return p1:_createConnection(false, p2)
end
function t.Once(p1, p2) --[[ Once | Line: 85 ]]
	return p1:_createConnection(true, p2)
end
function t.Wait(p1) --[[ Wait | Line: 89 ]]
	local v1 = false
	local v2 = nil
	local t = {
		isOnce = false,
		callback = function(...) --[[ callback | Line: 95 | Upvalues: v1 (ref), v2 (ref) ]]
			v1 = true
			v2 = table.pack(...)
		end
	}
	table.insert(p1._callbacks, t)
	repeat
		task.wait()
	until v1
	local v3 = table.find(p1._callbacks, t)
	if not v3 then
		return table.unpack(v2)
	end
	table.remove(p1._callbacks, v3)
	return table.unpack(v2)
end
function t.Fire(p1, ...) --[[ Fire | Line: 112 | Upvalues: v1 (copy) ]]
	local v12 = select("#", ...)
	local v2 = #p1._callbacks
	local sum = 1
	while sum <= #p1._callbacks do
		local v3 = p1._callbacks[sum]
		local v4 = table.create(v12)
		for i = 1, v12 do
			v4[i] = v1((select(i, ...)))
		end
		task.spawn(v3.callback, table.unpack(v4, 1, v12))
		if v3.isOnce then
			v3.connection:Disconnect()
		end
		local v5 = #p1._callbacks
		sum, v2 = sum + (1 - (v2 - v5)), v5
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 135 ]]
	for i, v in ipairs(p1._callbacks) do
		if v.connection then
			v.connection:Disconnect()
		end
	end
end
return t