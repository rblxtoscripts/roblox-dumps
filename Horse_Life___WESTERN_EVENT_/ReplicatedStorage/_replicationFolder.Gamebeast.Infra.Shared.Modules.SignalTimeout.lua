-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local v1 = shared.GBMod("Signal")
local v2 = shared.GBMod("Cleaner")
function t.new(p1, p2, p3) --[[ new | Line: 38 | Upvalues: t (copy), v2 (copy), v1 (copy), RunService (copy) ]]
	local v22 = setmetatable({}, t)
	v22._cleaner = v2.new()
	v22._timeoutSeconds = p1
	v22._validator = p3
	v22._startTick = tick()
	v22._timedOutSignal = v1.new()
	v22._targetSignal = p2
	v22._cleaner:Add(v22._timedOutSignal)
	v22._cleaner:Add(RunService.Heartbeat:Connect(function() --[[ Line: 49 | Upvalues: v22 (copy) ]]
		if not (tick() - v22._startTick >= v22._timeoutSeconds) then
			return
		end
		v22._timedOutSignal:Fire(true)
		v22:Destroy()
	end))
	v22._cleaner:Add(v22._targetSignal:Connect(function(...) --[[ Line: 56 | Upvalues: v22 (copy) ]]
		if not v22._validator or v22._validator(...) then
			v22._timedOutSignal:Fire(false, ...)
			v22:Destroy()
		end
	end))
	return v22
end
function t.Wait(p1) --[[ Wait | Line: 70 ]]
	return p1._timedOutSignal:Wait()
end
function t.Once(p1, p2) --[[ Once | Line: 74 ]]
	return p1._timedOutSignal:Connect(p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 78 ]]
	p1._cleaner:Destroy()
end
return t