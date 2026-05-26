-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local v1 = shared.GBMod("InternalConfigs")
function t.Get(p1, p2) --[[ Get | Line: 37 | Upvalues: v1 (copy) ]]
	return v1:Get(nil, p2)
end
function t.GetForPlayer(p1, p2, p3) --[[ GetForPlayer | Line: 41 | Upvalues: v1 (copy) ]]
	return v1:Get(p2, p3)
end
function t.Observe(p1, p2, p3) --[[ Observe | Line: 45 ]]
	local v1 = p1:OnChanged(p2, p3)
	task.spawn(function() --[[ Line: 48 | Upvalues: p1 (copy), p2 (copy), v1 (copy), p3 (copy) ]]
		local v12 = p1:Get(p2)
		if not v1.Connected then
			return
		end
		p3(v12, nil)
	end)
	return v1
end
function t.ObserveForPlayer(p1, p2, p3, p4) --[[ ObserveForPlayer | Line: 59 ]]
	local v1 = p1:OnChangedForPlayer(p2, p3, p4)
	task.spawn(function() --[[ Line: 62 | Upvalues: p1 (copy), p2 (copy), p3 (copy), v1 (copy), p4 (copy) ]]
		local v12 = p1:GetForPlayer(p2, p3)
		if not v1.Connected then
			return
		end
		p4(v12, nil)
	end)
	return v1
end
function t.OnChanged(p1, p2, p3) --[[ OnChanged | Line: 72 | Upvalues: v1 (copy) ]]
	return v1:OnChanged(nil, p2, p3)
end
function t.OnChangedForPlayer(p1, p2, p3, p4) --[[ OnChangedForPlayer | Line: 76 | Upvalues: v1 (copy) ]]
	return v1:OnChanged(p2, p3, p4)
end
function t.OnReady(p1, p2) --[[ OnReady | Line: 80 | Upvalues: v1 (copy) ]]
	return v1:OnReady(p2)
end
function t.IsReady(p1) --[[ IsReady | Line: 84 | Upvalues: v1 (copy) ]]
	return v1:IsReady()
end
return t