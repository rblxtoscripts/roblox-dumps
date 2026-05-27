-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper").GetClient()
local v3 = Sonar("Confetti")
local v4 = Sonar("NotificationsClient")
function t.Init(p1) --[[ Init | Line: 14 | Upvalues: v1 (copy), v2 (copy), v4 (copy), v3 (copy), RunService (copy) ]]
	v1.GetRemoteEvent("AbuseRemote").OnClientEvent:Connect(function(p1) --[[ Line: 17 | Upvalues: v2 (ref), v4 (ref), v3 (ref), RunService (ref) ]]
		if p1 == "fling" then
			v2:FlingPlayer()
			v4.Notify({
				Message = "HAHAHA I FLUNG YOU!"
			})
			return
		end
		if p1 == "confetti" then
			if v2.PlayerData.Settings.States.ScreenFlashes.Value then
				v3.Emit(100)
				v4.Notify({
					Message = "BOO!"
				})
			end
		else
			if p1 ~= "spin" then
				return
			end
			local v1 = v2:GetCurrentAnimal()
			if not (v1 and (v1.Model and v1.Model.PrimaryPart)) then
				return
			end
			local v22 = tick()
			local v32 = nil
			v32 = RunService.Heartbeat:Connect(function(p1) --[[ Line: 41 | Upvalues: v22 (copy), v32 (ref), v1 (copy) ]]
				if tick() - v22 >= 5 then
					v32:Disconnect()
				else
					v1.Model.PrimaryPart.CFrame = v1.Model.PrimaryPart.CFrame * CFrame.Angles(0, 12.566370614359172 * p1, 0)
				end
			end)
			v4.Notify({
				Message = "SPIN SPIN SPIN!"
			})
		end
	end)
end
t:Init()
return t