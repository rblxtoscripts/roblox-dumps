-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("RemoteUtils")
function t.Init(p1) --[[ Init | Line: 11 | Upvalues: v1 (copy), v2 (copy) ]]
	v1.IntroSignal:Connect(function() --[[ Line: 12 | Upvalues: v2 (ref) ]]
		if not game.Players.LocalPlayer.Character then
			game.Players.LocalPlayer.CharacterAdded:Wait()
		end
		v2.GetRemoteFunction("SpawnEquippedAnimalsRemote"):InvokeServer()
	end)
end
t:Init()
return t