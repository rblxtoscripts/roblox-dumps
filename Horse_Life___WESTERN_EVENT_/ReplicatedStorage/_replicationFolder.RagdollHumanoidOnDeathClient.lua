-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local v1 = Sonar("BaseObject")
local v2 = Sonar("RagdollBindersClient")
local v3 = Sonar("CharacterUtils")
local v4 = Sonar("RagdollRigging")
local v5 = setmetatable({}, v1)
v5.ClassName = "RagdollHumanoidOnDeathClient"
v5.__index = v5
function v5.new(p1) --[[ new | Line: 19 | Upvalues: v1 (copy), v5 (copy) ]]
	local v3 = setmetatable(v1.new(p1), v5)
	if v3._obj:GetState() == Enum.HumanoidStateType.Dead then
		v3:_handleDeath()
	else
		v3._maid._diedEvent = v3._obj.Died:Connect(function() --[[ Line: 25 | Upvalues: v3 (copy) ]]
			v3:_handleDeath(v3._obj)
		end)
	end
	return v3
end
function v5._getPlayer(p1) --[[ _getPlayer | Line: 33 | Upvalues: v3 (copy) ]]
	return v3.getPlayerFromCharacter(p1._obj)
end
function v5._handleDeath(p1) --[[ _handleDeath | Line: 37 | Upvalues: Players (copy), v2 (copy), Workspace (copy), v4 (copy) ]]
	p1._maid._diedEvent = nil
	if p1:_getPlayer() == Players.LocalPlayer then
		v2.Ragdoll:BindClient(p1._obj)
	end
	local v1 = p1._obj.Parent
	delay(Players.RespawnTime - 0.5, function() --[[ Line: 46 | Upvalues: v1 (copy), Workspace (ref), v4 (ref) ]]
		if v1:IsDescendantOf(Workspace) then
			v4.disableParticleEmittersAndFadeOutYielding(v1, 0.4)
		end
	end)
end
return v5