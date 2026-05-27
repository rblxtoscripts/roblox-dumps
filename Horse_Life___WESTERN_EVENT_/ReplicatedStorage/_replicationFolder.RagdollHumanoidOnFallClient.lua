-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local Players = game:GetService("Players")
local v1 = Sonar("BaseObject")
local v2 = Sonar("BindableRagdollHumanoidOnFall")
local v3 = Sonar("CharacterUtils")
local v4 = Sonar("RagdollBindersClient")
local v5 = setmetatable({}, v1)
v5.ClassName = "RagdollHumanoidOnFallClient"
v5.__index = v5
function v5.new(p1) --[[ new | Line: 20 | Upvalues: v1 (copy), v5 (copy), v3 (copy), Players (copy), v2 (copy), v4 (copy) ]]
	local v32 = setmetatable(v1.new(p1), v5)
	if v3.getPlayerFromCharacter(v32._obj) == Players.LocalPlayer then
		v32._ragdollLogic = v2.new(v32._obj, v4.Ragdoll)
		v32._maid:GiveTask(v32._ragdollLogic)
		v32._maid:GiveTask(v32._ragdollLogic.ShouldRagdoll.Changed:Connect(function() --[[ Line: 28 | Upvalues: v32 (copy) ]]
			v32:_update()
		end))
	end
	return v32
end
function v5._update(p1) --[[ _update | Line: 36 | Upvalues: v4 (copy) ]]
	if not p1._ragdollLogic.ShouldRagdoll.Value then
		return
	end
	v4.Ragdoll:BindClient(p1._obj)
	p1:PromiseRemoteEvent():Then(function(p1) --[[ Line: 39 ]]
		p1:FireServer(true)
	end)
end
return v5