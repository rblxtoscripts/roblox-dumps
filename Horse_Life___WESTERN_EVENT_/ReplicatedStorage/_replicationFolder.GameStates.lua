-- https://lua.expert/
local t = {}
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Global")
local v2 = Sonar("Constants")
function t.Get(p1, p2) --[[ Get | Line: 54 | Upvalues: v1 (copy) ]]
	if not p2:find("Disable_") and v1[p2] == nil then
		return true
	end
	return v1[p2] or false
end
function t.Set(p1, p2, p3) --[[ Set | Line: 64 | Upvalues: t (copy), v1 (copy) ]]
	if type(p2) ~= "table" then
		v1[p2] = p3
		return
	end
	for v12, v2 in p2 do
		t:Set(v12, v2)
	end
end
function t.IsDisabled(p1, p2, p3) --[[ IsDisabled | Line: 74 | Upvalues: t (copy), v2 (copy), Sonar (copy) ]]
	local v1 = if p2:find("Disable_") then true else false
	local v22 = t:Get(p2)
	if v22 ~= v1 then
		return false
	end
	if not v2.IS_CLIENT or p3 == false then
		return true
	end
	if not p3 then
		p3 = {
			Preset = "Response",
			Message = "You cannot do that right now!",
			Type = p2 .. tostring(v22)
		}
	end
	if not p1.NotificationsService then
		p1.NotificationsService = Sonar("NotificationsService")
	end
	p1.NotificationsService.Notify(p3)
	return true
end
function t.GetChangedSignal(p1, p2) --[[ GetChangedSignal | Line: 101 | Upvalues: v1 (copy) ]]
	return v1:GetStateChangedSignal(p2)
end
function t.Init(p1) --[[ Init | Line: 105 | Upvalues: v2 (copy), t (copy) ]]
	if not v2.DefaultGameStates then
		return
	end
	t:Set(v2.DefaultGameStates)
end
return t