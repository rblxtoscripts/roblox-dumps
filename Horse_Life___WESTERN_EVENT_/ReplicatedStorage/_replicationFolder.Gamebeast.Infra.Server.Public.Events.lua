-- https://lua.expert/
local t = {}
local v1 = shared.GBMod("EventsManager")
local v2 = shared.GBMod("InternalConfigs")
function t.GetEventData(p1, p2) --[[ GetEventData | Line: 36 | Upvalues: v2 (copy) ]]
	return v2:GetEventData(p2)
end
function t.OnStart(p1, p2, p3) --[[ OnStart | Line: 40 | Upvalues: v1 (copy) ]]
	return v1:OnStart(p2, p3)
end
function t.OnEnd(p1, p2, p3) --[[ OnEnd | Line: 44 | Upvalues: v1 (copy) ]]
	return v1:OnEnd(p2, p3)
end
return t