-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TeleportService")
local v2 = Sonar("TutorialService")
local v3 = Sonar("Constants")
local v4 = Sonar("PlayerWrapper").GetClient()
function t.Init(p1) --[[ Init | Line: 17 | Upvalues: v3 (copy), v2 (copy), v1 (copy), v4 (copy) ]]
	v3.ResetBindable.Event:Connect(function() --[[ Line: 18 | Upvalues: v2 (ref), v1 (ref), v4 (ref) ]]
		if not v2.CanDoActionInTutorial("ResetButtonCallback") then
			return
		end
		if _G.LastCheckpoint then
			v1:Teleport({
				Type = "ToLastCheckpoint",
				Transition = false
			})
			return
		end
		if v4.Bucking then
			local v12 = tick() + 4
			while v4.Bucking and tick() < v12 do
				task.wait(0.1)
			end
		end
		if v4.Character and v4.Character.Humanoid.SeatPart then
			v4.Character.Humanoid.Sit = false
			v4.Character.Humanoid.Jump = true
			task.wait()
		end
		v1:Teleport({
			Type = "ToSpawn",
			Transition = true
		})
	end)
end
t:Init()
return t