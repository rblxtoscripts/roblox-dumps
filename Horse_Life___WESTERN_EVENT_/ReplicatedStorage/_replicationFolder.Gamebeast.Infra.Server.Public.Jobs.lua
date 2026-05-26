-- https://lua.expert/
local t = {}
local v1 = shared.GBMod("RequestFunctionHandler")
function t.SetCallback(p1, p2, p3) --[[ SetCallback | Line: 35 | Upvalues: v1 (copy) ]]
	return v1:SetCallback(p2, p3)
end
return t