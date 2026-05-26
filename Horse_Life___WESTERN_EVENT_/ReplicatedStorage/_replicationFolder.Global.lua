-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("Signal")
local t2 = {}
local t3 = {}
function t.new() --[[ new | Line: 37 | Upvalues: t (copy) ]]
	return setmetatable({}, t)
end
function t.GetStateChangedSignal(p1, p2) --[[ GetStateChangedSignal | Line: 47 | Upvalues: t3 (copy), v1 (copy) ]]
	if not t3[p2] then
		t3[p2] = v1.new()
	end
	return t3[p2]
end
function t.ObserveState(p1, p2, p3) --[[ ObserveState | Line: 61 | Upvalues: t2 (copy) ]]
	local v1 = p1:GetStateChangedSignal(p2):Connect(p3)
	task.spawn(p3, t2[p2], nil)
	return v1
end
function t.__index(p1, p2) --[[ __index | Line: 74 | Upvalues: t (copy), t2 (copy) ]]
	return t[p2] or t2[p2]
end
function t.__newindex(p1, p2, p3) --[[ __newindex | Line: 86 | Upvalues: t2 (copy), t3 (copy) ]]
	local v1 = t2[p2]
	t2[p2] = p3
	if not t3[p2] then
		return
	end
	t3[p2]:Fire(p3, v1)
end
return t.new()