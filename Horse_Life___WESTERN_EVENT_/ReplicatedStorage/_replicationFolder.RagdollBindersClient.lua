-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("BinderProvider")
local v2 = Sonar("Binder")
return v1.new(function(p1) --[[ Line: 10 | Upvalues: v2 (copy), Sonar (copy) ]]
	p1:Add(v2.new("Ragdoll", Sonar("RagdollClient")))
	p1:Add(v2.new("Ragdollable", Sonar("RagdollableClient")))
end)