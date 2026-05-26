-- https://lua.expert/
local t = {}
t.__index = t
function t.new() --[[ new | Line: 63 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.keys = {}
	v2.bindable = Instance.new("BindableEvent")
	v2.Changed = v2.bindable.Event
	return v2
end
function t.Lock(p1, p2) --[[ Lock | Line: 73 ]]
	local v1 = p2 or "Default"
	if p1.keys[v1] then
		return
	end
	local v2 = p1:IsLocked()
	p1.keys[v1] = true
	if v2 then
		return
	end
	p1.bindable:Fire(true)
end
function t.Unlock(p1, p2) --[[ Unlock | Line: 87 ]]
	local v1 = p2 or "Default"
	if p1.keys[v1] == nil then
		return
	end
	p1.keys[v1] = nil
	if p1:IsLocked() then
		return
	end
	p1.bindable:Fire(false)
end
function t.SetLock(p1, p2, p3) --[[ SetLock | Line: 100 ]]
	if p3 then
		p1:Lock(p2)
	else
		p1:Unlock(p2)
	end
end
function t.UnlockAll(p1) --[[ UnlockAll | Line: 108 ]]
	if not p1:IsLocked() then
		return
	end
	table.clear(p1.keys)
	p1.bindable:Fire(false)
end
function t.HasLock(p1, p2) --[[ HasLock | Line: 115 ]]
	return p1.keys[p2] or false
end
function t.GetLocks(p1) --[[ GetLocks | Line: 119 ]]
	local t = {}
	for v1, v2 in p1.keys do
		table.insert(t, v1)
	end
	return t
end
function t.IsLocked(p1) --[[ IsLocked | Line: 127 ]]
	return next(p1.keys) ~= nil
end
function t.BindToLock(p1, p2) --[[ BindToLock | Line: 131 ]]
	task.spawn(p2, p1:IsLocked())
	return p1.Changed:Connect(p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 136 ]]
	p1.bindable:Destroy()
	table.clear(p1)
	setmetatable(p1, nil)
end
return t