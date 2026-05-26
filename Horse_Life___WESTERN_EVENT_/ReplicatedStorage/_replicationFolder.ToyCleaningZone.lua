-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InteractZone")
local t = {}
local v2 = Sonar("State").new(false)
local v3 = nil
function t.ZoneStateChanged(p1) --[[ ZoneStateChanged | Line: 12 ]] end
function t.GetZoneState() --[[ GetZoneState | Line: 16 | Upvalues: v2 (copy) ]]
	return v2:get()
end
function t.GetZoneRoot() --[[ GetZoneRoot | Line: 20 | Upvalues: v3 (ref) ]]
	return v3 and v3:FindFirstChild("CleaningZone")
end
function t.Init() --[[ Init | Line: 24 | Upvalues: v1 (copy), v2 (copy), v3 (ref), t (copy) ]]
	local v12 = v1.GetOrCreateZone({
		Type = "CleaningZone",
		OnEntered = function() --[[ OnEntered | Line: 27 | Upvalues: v2 (ref) ]]
			v2:set(true)
		end,
		OnLeave = function() --[[ OnLeave | Line: 30 | Upvalues: v2 (ref) ]]
			v2:set(false)
		end
	})
	local InteractZones = workspace:FindFirstChild("InteractZones")
	if InteractZones and InteractZones:FindFirstChild("CafeZone") then
		v1.GetOrCreateZone({
			Type = "CafeZone",
			OnEntered = function() --[[ OnEntered | Line: 49 ]] end,
			OnLeave = function() --[[ OnLeave | Line: 50 ]] end
		})
	elseif InteractZones then
		task.defer(function() --[[ Line: 38 | Upvalues: InteractZones (copy), v1 (ref) ]]
			InteractZones:WaitForChild("CafeZone")
			v1.GetOrCreateZone({
				Type = "CafeZone",
				OnEntered = function() --[[ OnEntered | Line: 42 ]] end,
				OnLeave = function() --[[ OnLeave | Line: 43 ]] end
			})
		end)
	end
	if v12 then
		v3 = v12.ZoneFolder
	end
	v2:subscribe(t.ZoneStateChanged)
end
t.Init()
return t