-- https://lua.expert/
local t = {}
local v1 = shared.GBMod("ClientConfigs")
function t.Get(p1, p2) --[[ Get | Line: 35 | Upvalues: v1 (copy) ]]
	return v1:Get(p2)
end
function t.Observe(p1, p2, p3) --[[ Observe | Line: 39 ]]
	local v1 = p1:OnChanged(p2, p3)
	task.spawn(function() --[[ Line: 42 | Upvalues: p1 (copy), p2 (copy), v1 (copy), p3 (copy) ]]
		local v12 = p1:Get(p2)
		if not v1.Connected then
			return
		end
		p3(v12, nil)
	end)
	return v1
end
function t.OnChanged(p1, p2, p3) --[[ OnChanged | Line: 53 | Upvalues: v1 (copy) ]]
	return v1:OnChanged(p2, p3)
end
function t.OnReady(p1, p2) --[[ OnReady | Line: 57 | Upvalues: v1 (copy) ]]
	return v1:OnReady(p2)
end
function t.IsReady(p1) --[[ IsReady | Line: 61 | Upvalues: v1 (copy) ]]
	return v1:IsReady()
end
function t.GetForPlayer(p1, p2, p3) --[[ GetForPlayer | Line: 67 ]]
	error("Configs:GetForPlayer is a server-only method. Use :Get instead.")
end
function t.ObserveForPlayer(p1, p2, p3, p4) --[[ ObserveForPlayer | Line: 71 ]]
	error("Configs:ObserveForPlayer is a server-only method. Use :Observe instead.")
end
function t.OnChangedForPlayer(p1, p2, p3, p4) --[[ OnChangedForPlayer | Line: 75 ]]
	error("Configs:OnChangedForPlayer is a server-only method. Use :OnChanged instead.")
end
return t