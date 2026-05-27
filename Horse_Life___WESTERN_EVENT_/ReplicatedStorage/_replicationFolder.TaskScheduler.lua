-- https://lua.expert/
local RunService = game:GetService("RunService")
local t = {
	REMOVE_ME = newproxy(true)
}
local t2 = {}
local t3 = {}
local v1 = Instance.new("BindableEvent")
v1.Event:connect(function() --[[ Line: 10 | Upvalues: t3 (copy) ]]
	table.remove(t3)()
	assert(#t3 == 0, "There were leftover tasks after spawn")
end)
function t.Heartbeat(p1) --[[ Heartbeat | Line: 16 | Upvalues: t2 (copy), t (copy) ]]
	if not next(t2) then
		return
	end
	for k in pairs(t2) do
		if k.__callback(p1) == t.REMOVE_ME then
			k:Destroy()
		end
	end
end
function t.QueueHeartbeat(p1) --[[ QueueHeartbeat | Line: 28 | Upvalues: t2 (copy) ]]
	local v1 = Instance.new("BindableEvent")
	local v2 = nil
	v2 = {
		__callback = p1,
		Disconnected = v1.Event,
		Destroy = function() --[[ Destroy | Line: 37 | Upvalues: t2 (ref), v2 (ref), v1 (copy) ]]
			if not t2[v2] then
				return
			end
			t2[v2] = nil
			v1:Fire()
		end
	}
	t2[v2] = true
	return v2
end
function t.QueueHeartbeatSeconds(p1, p2) --[[ QueueHeartbeatSeconds | Line: 51 | Upvalues: t (copy) ]]
	local v1 = 0
	local v2 = nil
	v2 = t.QueueHeartbeat(function(p12) --[[ Line: 54 | Upvalues: p2 (copy), v1 (ref), p1 (copy), v2 (ref) ]]
		p2(p12)
		v1 = v1 + p12
		if not (p1 <= v1) then
			return
		end
		v2:Destroy()
	end)
	return v2
end
function t.Interval(p1, p2, p3, p4) --[[ Interval | Line: 66 | Upvalues: t (copy) ]]
	local v1 = p3 or (1 / 0)
	local v2 = 0
	local v3 = nil
	v3 = t.QueueHeartbeat(function(p12) --[[ Line: 71 | Upvalues: v2 (ref), v1 (ref), p1 (copy), p4 (ref), p2 (copy), t (ref), v3 (ref) ]]
		v2 = v2 + p12
		while v1 > 0 and p1 <= v2 or p4 do
			p4 = false
			if p2() == t.REMOVE_ME then
				return t.REMOVE_ME
			end
			v2 = v2 - p1
			v1 = v1 - p1
		end
		if not (v1 <= 0) then
			return
		end
		v3:Destroy()
	end)
	return v3
end
function t.FastSpawn(p1) --[[ FastSpawn | Line: 94 | Upvalues: t3 (copy), v1 (copy) ]]
	t3[#t3 + 1] = p1
	v1:Fire()
end
function t.Delay(p1, p2) --[[ Delay | Line: 99 | Upvalues: t (copy) ]]
	return t.Interval(p1, p2, p1)
end
RunService.Heartbeat:connect(t.Heartbeat)
return t