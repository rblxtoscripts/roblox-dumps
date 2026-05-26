-- https://lua.expert/
local Destructor = require(script.Parent.Destructor)
local v1 = table.freeze({
	AbsolutePosition = true,
	AbsoluteSize = true,
	AbsoluteContentSize = true
})
local t = {}
local t2 = {}
t2.__index = t2
local function sendWrite(p1, p2) --[[ sendWrite | Line: 56 | Upvalues: t (copy) ]]
	t[p1] = true
	local _dtor = p1._dtor
	_dtor:destroy()
	p1._value = p2
	for v1 in p1._bindings do
		task.spawn(v1, p2, _dtor)
	end
	t[p1] = nil
end
local function setRaw(p1, p2) --[[ setRaw | Line: 70 | Upvalues: t (copy), sendWrite (copy) ]]
	if t[p1] then
		error("cyclic dependency", 2)
	end
	sendWrite(p1, p2)
	for v1, v2 in p1._combinedBindings do
		task.spawn(v2)
	end
end
local function applyDeferredProperty(p1, p2, p3) --[[ applyDeferredProperty | Line: 82 | Upvalues: t (copy), setRaw (copy) ]]
	if t[p3] then
		error("cyclic dependency", 2)
	end
	task.wait()
	local v1 = p1[p2]
	if v1 == p3._value then
		return
	end
	setRaw(p3, v1)
end
local function setNoCombined(p1, p2) --[[ setNoCombined | Line: 93 | Upvalues: t (copy), sendWrite (copy) ]]
	if p1._readonly then
		error("writing to readonly state", 3)
	end
	if t[p1] then
		error("cyclic dependency", 3)
	end
	if p2 == p1._value then
		return
	end
	sendWrite(p1, p2)
end
function t2.new(p1) --[[ new | Line: 106 | Upvalues: Destructor (copy), t2 (copy) ]]
	return setmetatable({
		_instance = nil,
		_attribute = nil,
		_property = nil,
		_instanceChanged = nil,
		_instanceDestroyed = nil,
		_sourceSubscription = nil,
		_readonly = nil,
		_value = p1,
		_bindings = {},
		_combinedBindings = {},
		_dtor = Destructor.new()
	}, t2)
end
function t2.derive(p1, p2) --[[ derive | Line: 125 | Upvalues: t2 (copy), setRaw (copy) ]]
	local v1 = t2.new(p2(p1:get()))
	v1._readonly = true
	v1._sourceSubscription = p1:subscribe(function(p1) --[[ Line: 132 | Upvalues: p2 (copy), v1 (copy), setRaw (ref) ]]
		local v12 = p2(p1)
		if v12 == v1._value then
			return
		end
		setRaw(v1, v12)
	end)
	return v1
end
function t2.deriveMulti(p1, p2) --[[ deriveMulti | Line: 143 | Upvalues: t2 (copy), setRaw (copy) ]]
	local v1 = table.create(#p1)
	for v2, v3 in p1 do
		v1[v2] = v3._value
	end
	local v4 = t2.new(p2(table.unpack(v1)))
	v4._readonly = true
	v4._sourceSubscription = t2.subscribeMulti(p1, function(...) --[[ Line: 155 | Upvalues: p2 (copy), v4 (copy), setRaw (ref) ]]
		local v1 = p2(...)
		if v1 == v4._value then
			return
		end
		setRaw(v4, v1)
	end)
	return v4
end
function t2.fromAttribute(p1, p2) --[[ fromAttribute | Line: 165 | Upvalues: t2 (copy), setRaw (copy) ]]
	local v1 = t2.new(p1:GetAttribute(p2))
	v1._readonly = true
	v1._instance = p1
	v1._attribute = p2
	v1._instanceChanged = p1:GetAttributeChangedSignal(p2):Connect(function() --[[ Line: 171 | Upvalues: setRaw (ref), v1 (copy), p1 (copy), p2 (copy) ]]
		setRaw(v1, p1:GetAttribute(p2))
	end)
	v1._instanceDestroyed = p1.Destroying:Connect(function() --[[ Line: 175 | Upvalues: v1 (copy) ]]
		v1:destroy()
	end)
	return v1
end
function t2.fromProperty(p1, p2) --[[ fromProperty | Line: 182 | Upvalues: t2 (copy), v1 (copy), applyDeferredProperty (copy), setRaw (copy) ]]
	local v12 = t2.new(p1[p2])
	v12._readonly = true
	v12._instance = p1
	v12._property = p2
	v12._instanceChanged = p1:GetPropertyChangedSignal(p2):Connect(function() --[[ Line: 188 | Upvalues: v1 (ref), p2 (copy), applyDeferredProperty (ref), p1 (copy), v12 (copy), setRaw (ref) ]]
		if v1[p2] then
			task.spawn(applyDeferredProperty, p1, p2, v12)
		else
			setRaw(v12, p1[p2])
		end
	end)
	v12._instanceDestroyed = p1.Destroying:Connect(function() --[[ Line: 196 | Upvalues: v12 (copy) ]]
		v12:destroy()
	end)
	return v12
end
function t2.get(p1) --[[ get | Line: 203 ]]
	return p1._value
end
function t2.set(p1, p2) --[[ set | Line: 207 | Upvalues: t (copy), setRaw (copy) ]]
	if p1._readonly then
		error("writing to readonly state", 2)
	end
	if t[p1] then
		error("cyclic dependency", 2)
	end
	if p2 == p1._value then
		return
	end
	setRaw(p1, p2)
end
function t2.changed(p1, p2) --[[ changed | Line: 220 ]]
	assert(p1._bindings[p2] == nil)
	p1._bindings[p2] = true
	return function() --[[ Line: 224 | Upvalues: p1 (copy), p2 (copy) ]]
		p1._bindings[p2] = nil
	end
end
function t2.subscribe(p1, p2) --[[ subscribe | Line: 229 ]]
	task.spawn(p2, p1._value, p1._dtor)
	return p1:changed(p2)
end
function t2.subscribeMulti(p1, p2) --[[ subscribeMulti | Line: 234 ]]
	local v1 = newproxy(true)
	local function getValues() --[[ getValues | Line: 237 | Upvalues: p1 (copy) ]]
		local v1 = table.create(#p1)
		for v2, v3 in p1 do
			v1[v2] = v3._value
		end
		return table.unpack(v1)
	end
	local function binding() --[[ binding | Line: 245 | Upvalues: p2 (copy), getValues (copy) ]]
		task.spawn(p2, getValues())
	end
	for v2, v3 in p1 do
		v3._combinedBindings[v1] = binding
	end
	task.spawn(p2, getValues())
	return function() --[[ Line: 255 | Upvalues: p1 (copy), v1 (copy) ]]
		for v12, v2 in p1 do
			v2._combinedBindings[v1] = nil
		end
	end
end
function t2.setMulti(...) --[[ setMulti | Line: 262 | Upvalues: t (copy), sendWrite (copy) ]]
	local t2 = { ... }
	local v1 = table.create(#t2)
	for v2, v3 in t2 do
		v1[v2] = v3[1]._value
		local v4 = v3[1]
		local v5 = v3[2]
		if v4._readonly then
			error("writing to readonly state", 3)
		end
		if t[v4] then
			error("cyclic dependency", 3)
		end
		if v5 ~= v4._value then
			sendWrite(v4, v5)
		end
	end
	local v6 = false
	for v7, v8 in t2 do
		v6 = if v6 then v6 else v1[v7] ~= v8[1]._value
	end
	if not v6 then
		return
	end
	local t3 = {}
	for v11, v12 in t2 do
		for v13, v14 in v12[1]._combinedBindings do
			t3[v13] = v14
		end
	end
	for v15, v16 in t3 do
		v16()
	end
end
function t2.destroy(p1) --[[ destroy | Line: 297 ]]
	p1._dtor:destroy()
	table.clear(p1._bindings)
	table.clear(p1._combinedBindings)
	if p1._instanceChanged then
		p1._instanceChanged:Disconnect()
		p1._instanceChanged = nil
	end
	if p1._instanceDestroyed then
		p1._instanceDestroyed:Disconnect()
		p1._instanceDestroyed = nil
	end
	if not p1._sourceSubscription then
		return
	end
	p1._sourceSubscription()
	p1._sourceSubscription = nil
end
function t2.Destroy(p1) --[[ Destroy | Line: 318 ]]
	p1:destroy()
end
t2.bind = t2.subscribe
t2.combine = t2.subscribeMulti
return table.freeze(t2)