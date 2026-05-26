-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local v1 = shared.GBMod("Signal")
local v2 = shared.GBMod("Cleaner")
function t.new(p1) --[[ new | Line: 38 | Upvalues: t (copy), v2 (copy), v1 (copy), RunService (copy) ]]
	local v22 = setmetatable({}, t)
	v22._cleaner = v2.new()
	v22._startTick = tick()
	v22._timedOutSignal = v1.new()
	v22._cleaner:Add(v22._timedOutSignal)
	v22._cleaner:Add(RunService.Heartbeat:Connect(function() --[[ Line: 46 | Upvalues: v22 (copy), p1 (copy) ]]
		if not (p1 <= tick() - v22._startTick) then
			return
		end
		v22._timedOutSignal:Fire(true)
		v22:Destroy()
	end))
	return v22
end
function t.OnEnd(p1, p2) --[[ OnEnd | Line: 58 ]]
	return p1._timedOutSignal:Once(function(p1, ...) --[[ Line: 59 | Upvalues: p2 (copy) ]]
		if not p1 then
			return
		end
		p2(...)
	end)
end
function t.Destroy(p1) --[[ Destroy | Line: 66 ]]
	p1._cleaner:Destroy()
end
return t