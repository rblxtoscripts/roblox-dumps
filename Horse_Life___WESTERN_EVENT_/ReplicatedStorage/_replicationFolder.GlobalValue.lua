-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local MemoryStoreService = game:GetService("MemoryStoreService")
local MessagingService = game:GetService("MessagingService")
local v1 = RunService:IsServer()
local t2 = {}
local v2 = MemoryStoreService:GetSortedMap("GlobalValues")
function t.new(p1, p2) --[[ new | Line: 33 | Upvalues: v1 (copy), t2 (copy), t (copy), MessagingService (copy) ]]
	if not v1 then
		return nil
	end
	if t2[p1] then
		return t2[p1]
	else
		local v2 = setmetatable({}, t)
		v2.Key = p1
		v2._value = p2
		v2._pendingDecrement = 0
		v2._lastSync = 0
		v2._destroyed = false
		v2._callbacks = {}
		task.spawn(function() --[[ Line: 53 | Upvalues: v2 (copy), p2 (copy) ]]
			v2:_initialize(p2)
			v2:_startSyncLoop()
		end)
		v2._subscription = MessagingService:SubscribeAsync(p1, function(p1) --[[ Line: 60 | Upvalues: v2 (copy) ]]
			if not (p1.Data and p1.Data.Value) then
				return
			end
			v2:_onRemoteUpdate(p1.Data.Value)
		end)
		t2[p1] = v2
		return v2
	end
end
function t._startSyncLoop(p1) --[[ _startSyncLoop | Line: 71 ]]
	task.spawn(function() --[[ Line: 72 | Upvalues: p1 (copy) ]]
		while not p1._destroyed do
			task.wait(2)
			if not (p1._pendingDecrement > 0 and p1:_syncToMemoryStore(p1._value, false)) then
				continue
			end
			p1:_broadcastUpdate()
		end
	end)
end
function t._initialize(p1, p2) --[[ _initialize | Line: 87 ]]
	p1:_syncToMemoryStore(p2, true)
	p1._value = p2
	p1:_fireCallbacks()
end
function t._syncToMemoryStore(p1, p2, p3) --[[ _syncToMemoryStore | Line: 94 | Upvalues: v1 (copy), v2 (copy) ]]
	if not v1 or p1._destroyed then
		return
	end
	local count = 0
	local v12 = false
	while count < 3 and not v12 do
		count = count + 1
		local v22 = pcall(function() --[[ Line: 105 | Upvalues: v2 (ref), p1 (copy), p3 (copy), p2 (copy) ]]
			v2:UpdateAsync(p1.Key, function(p12) --[[ Line: 106 | Upvalues: p3 (ref), p2 (ref), p1 (ref) ]]
				if p3 then
					return p2
				end
				if p12 then
					return math.max(0, p12 - p1._pendingDecrement)
				else
					return p2
				end
			end, 3600)
		end)
		if not v22 and count < 3 then
			task.wait(count * 0.1)
		end
		v12 = v22
	end
	if not v12 then
		return v12
	end
	p1._pendingDecrement = 0
	p1._lastSync = tick()
	return v12
end
function t._broadcastUpdate(p1) --[[ _broadcastUpdate | Line: 132 | Upvalues: v1 (copy), MessagingService (copy) ]]
	if v1 and not p1._destroyed then
		pcall(function() --[[ Line: 137 | Upvalues: MessagingService (ref), p1 (copy) ]]
			MessagingService:PublishAsync(p1.Key, {
				Value = p1._value,
				Timestamp = tick()
			})
		end)
	end
end
function t._onRemoteUpdate(p1, p2) --[[ _onRemoteUpdate | Line: 145 ]]
	if p1._destroyed then
		return
	end
	local _value = p1._value
	p1._value = p2
	if _value == p2 then
		return
	end
	p1:_fireCallbacks()
end
function t._fireCallbacks(p1) --[[ _fireCallbacks | Line: 158 ]]
	for v1, v2 in p1._callbacks do
		task.spawn(v2, p1._value)
	end
end
function t.Get(p1) --[[ Get | Line: 164 ]]
	return p1._value
end
function t.Set(p1, p2) --[[ Set | Line: 168 | Upvalues: v1 (copy) ]]
	if v1 then
		p1._value = p2
		p1._pendingDecrement = 0
		p1:_syncToMemoryStore(p2, true)
		p1:_broadcastUpdate()
		p1:_fireCallbacks()
	end
end
function t.Decrement(p1, p2) --[[ Decrement | Line: 182 | Upvalues: v1 (copy) ]]
	if not v1 then
		return
	end
	if not (p2 <= 0) then
		p1._pendingDecrement = p1._pendingDecrement + p2
		p1._value = math.max(0, p1._value - p2)
		p1:_fireCallbacks()
	end
end
function t.Increment(p1, p2) --[[ Increment | Line: 196 | Upvalues: v1 (copy), v2 (copy) ]]
	if not v1 then
		return
	end
	if p2 <= 0 then
		return
	end
	if not pcall(function() --[[ Line: 204 | Upvalues: v2 (ref), p1 (copy), p2 (copy) ]]
		v2:UpdateAsync(p1.Key, function(p1) --[[ Line: 205 | Upvalues: p2 (ref) ]]
			return (p1 or 0) + p2
		end, 3600)
	end) then
		return
	end
	p1._value = p1._value + p2
	p1:_broadcastUpdate()
	p1:_fireCallbacks()
end
function t.OnChanged(p1, p2) --[[ OnChanged | Line: 217 ]]
	table.insert(p1._callbacks, p2)
	task.spawn(p2, p1._value)
	return function() --[[ Line: 222 | Upvalues: p1 (copy), p2 (copy) ]]
		local v1 = table.find(p1._callbacks, p2)
		if not v1 then
			return
		end
		table.remove(p1._callbacks, v1)
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 230 | Upvalues: t2 (copy) ]]
	p1._destroyed = true
	if p1._subscription then
		p1._subscription:Disconnect()
	end
	table.clear(p1._callbacks)
	t2[p1.Key] = nil
	setmetatable(p1, nil)
end
function t.GetActive(p1) --[[ GetActive | Line: 244 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
return t