-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("RacesManager", {
	Deferred = true
})
return function(p1) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	v1.Reset()
end