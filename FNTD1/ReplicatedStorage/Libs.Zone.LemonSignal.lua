-- https://lua.expert/
local t = {}
local function runCallback(p1, p2, ...) --[[ runCallback | Line: 25 | Upvalues: t (copy) ]]
	p1(...)
	table.insert(t, p2)
end
local function yielder() --[[ yielder | Line: 30 | Upvalues: runCallback (copy) ]]
	while true do
		runCallback(coroutine.yield())
	end
end
local t2 = {}
t2.__index = t2
local function disconnect(p1) --[[ disconnect | Line: 39 ]]
	if not p1.Connected then
		return
	end
	p1.Connected = false
	local _next = p1._next
	local _prev = p1._prev
	if _next then
		_next._prev = _prev
	end
	if _prev then
		_prev._next = _next
	end
	local _signal = p1._signal
	if _signal._head ~= p1 then
		return
	end
	_signal._head = _next
end
local function reconnect(p1) --[[ reconnect | Line: 61 ]]
	if p1.Connected then
		return
	end
	p1.Connected = true
	local _signal = p1._signal
	local _head = _signal._head
	if _head then
		_head._prev = p1
	end
	_signal._head = p1
	p1._next = _head
	p1._prev = false
end
t2.Disconnect = disconnect
t2.Reconnect = reconnect
local t3 = {}
t3.__index = t3
local v1, v2
if task then
	local v3 = Instance.new("BindableEvent")
	v1 = v3.Event.Connect
	v2 = v3.Event:Connect(function() --[[ Line: 90 ]] end).Disconnect
	v3:Destroy()
else
	v2 = nil
	v1 = nil
end
local function connect(p1, p2, ...) --[[ connect | Line: 95 | Upvalues: t2 (copy) ]]
	local _head = p1._head
	local t = {
		Connected = true,
		_prev = false,
		_signal = p1,
		_fn = p2
	}
	t._varargs = if ... then { ... } else false
	t._next = _head
	local v3 = setmetatable(t, t2)
	if _head then
		_head._prev = v3
	end
	p1._head = v3
	return v3
end
local function once(p1, p2, ...) --[[ once | Line: 114 | Upvalues: connect (copy) ]]
	local v1 = nil
	v1 = connect(p1, function(...) --[[ Line: 116 | Upvalues: v1 (ref), p2 (copy) ]]
		local v12 = v1
		if not v12.Connected then
			p2(...)
			return
		end
		v12.Connected = false
		local _next = v12._next
		local _prev = v12._prev
		if _next then
			_next._prev = _prev
		end
		if _prev then
			_prev._next = _next
		end
		local _signal = v12._signal
		if _signal._head ~= v12 then
			p2(...)
			return
		end
		_signal._head = _next
		p2(...)
	end, ...)
	return v1
end
local v4 = if task then function(p1) --[[ Line: 124 | Upvalues: connect (copy) ]]
	local v1 = coroutine.running()
	local v2 = nil
	v2 = connect(p1, function(...) --[[ Line: 127 | Upvalues: v2 (ref), v1 (copy) ]]
		local v12 = v2
		if v12.Connected then
			v12.Connected = false
			local _next = v12._next
			local _prev = v12._prev
			if _next then
				_next._prev = _prev
			end
			if _prev then
				_prev._next = _next
			end
			local _signal = v12._signal
			if _signal._head == v12 then
				_signal._head = _next
			end
		end
		task.spawn(v1, ...)
	end)
	return coroutine.yield()
end else function(p1) --[[ Line: 133 | Upvalues: connect (copy) ]]
	local v1 = coroutine.running()
	local v2 = nil
	v2 = connect(p1, function(...) --[[ Line: 136 | Upvalues: v2 (ref), v1 (copy) ]]
		local v12 = v2
		if v12.Connected then
			v12.Connected = false
			local _next = v12._next
			local _prev = v12._prev
			if _next then
				_next._prev = _prev
			end
			if _prev then
				_prev._next = _next
			end
			local _signal = v12._signal
			if _signal._head == v12 then
				_signal._head = _next
			end
		end
		local v22, v3 = coroutine.resume(v1, ...)
		if v22 then
			return
		end
		error(v3, 0)
	end)
	return coroutine.yield()
end
local v5 = if task then function(p1, ...) --[[ Line: 147 | Upvalues: t (copy), yielder (copy) ]]
	local _head = p1._head
	while _head do
		local v1
		if #t > 0 then
			v1 = t[#t]
			t[#t] = nil
		else
			local v2 = coroutine.create(yielder)
			coroutine.resume(v2)
			v1 = v2
		end
		if _head._varargs then
			local _varargs = _head._varargs
			local v3 = #_varargs
			local count = v3
			for v4, v5 in { ... } do
				count = count + 1
				_varargs[count] = v5
			end
			task.spawn(v1, _head._fn, v1, table.unpack(_varargs))
			for i = count, v3 + 1, -1 do
				_varargs[i] = nil
			end
		else
			task.spawn(v1, _head._fn, v1, ...)
		end
		_head = _head._next
	end
end else function(p1, ...) --[[ Line: 180 | Upvalues: t (copy), yielder (copy) ]]
	local _head = p1._head
	while _head do
		local v1
		if #t > 0 then
			v1 = t[#t]
			t[#t] = nil
		else
			local v2 = coroutine.create(yielder)
			coroutine.resume(v2)
			v1 = v2
		end
		if _head._varargs then
			local _varargs = _head._varargs
			local v3 = #_varargs
			local count = v3
			for v4, v5 in { ... } do
				count = count + 1
				_varargs[count] = v5
			end
			local v6, v7 = coroutine.resume(v1, _head._fn, v1, table.unpack(_varargs))
			if not v6 then
				print(string.format("%s\nstacktrace:\n%s", v7, debug.traceback()))
			end
			for i = count, v3 + 1, -1 do
				_varargs[i] = nil
			end
		else
			local v8, v9 = coroutine.resume(v1, _head._fn, v1, ...)
			if not v8 then
				print(string.format("%s\nstacktrace:\n%s", v9, debug.traceback()))
			end
		end
		_head = _head._next
	end
end
local function disconnectAll(p1) --[[ disconnectAll | Line: 220 ]]
	local _head = p1._head
	while _head do
		if _head.Connected then
			_head.Connected = false
			local _next = _head._next
			local _prev = _head._prev
			if _next then
				_next._prev = _prev
			end
			if _prev then
				_prev._next = _next
			end
			local _signal = _head._signal
			if _signal._head == _head then
				_signal._head = _next
			end
		end
		_head = _head._next
	end
end
local function destroy(p1) --[[ destroy | Line: 228 | Upvalues: v2 (ref) ]]
	local _head = p1._head
	while _head do
		if _head.Connected then
			_head.Connected = false
			local _next = _head._next
			local _prev = _head._prev
			if _next then
				_next._prev = _prev
			end
			if _prev then
				_prev._next = _next
			end
			local _signal = _head._signal
			if _signal._head == _head then
				_signal._head = _next
			end
		end
		_head = _head._next
	end
	local v1 = p1.RBXScriptConnection
	if not v1 then
		return
	end
	v2(v1)
	p1.RBXScriptConnection = nil
end
function t3.new() --[[ new | Line: 238 | Upvalues: t3 (copy) ]]
	return setmetatable({
		_head = false
	}, t3)
end
function t3.wrap(p1) --[[ wrap | Line: 242 | Upvalues: t3 (copy), v1 (ref), v5 (copy) ]]
	local v2 = setmetatable({
		_head = false
	}, t3)
	v2.RBXScriptConnection = v1(p1, function(...) --[[ Line: 244 | Upvalues: v5 (ref), v2 (copy) ]]
		v5(v2, ...)
	end)
	return v2
end
t3.Connect = connect
t3.Once = once
t3.Wait = v4
t3.Fire = v5
t3.DisconnectAll = disconnectAll
t3.Destroy = destroy
return {
	new = t3.new,
	wrap = t3.wrap
}