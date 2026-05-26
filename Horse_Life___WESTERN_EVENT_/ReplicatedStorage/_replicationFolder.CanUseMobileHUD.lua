-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InputType")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("State")
local v4 = v2.GetClient()
local v5 = v3.deriveMulti({ v1, v4.PlayerCohorts.MobileHUD }, function(p1, p2) --[[ Line: 16 ]]
	local v1 = nil
	return (if v1 then v1 else p1 == "Touch") and true
end)
v4.CanUseMobileHUD = v5
return v5