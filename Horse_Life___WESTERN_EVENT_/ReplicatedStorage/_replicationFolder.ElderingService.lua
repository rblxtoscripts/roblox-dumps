-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("DataUtils")
local v4 = Sonar("AnimalDataService")
local v5 = Sonar("StableClubsManager", {
	Deferred = true
})
local v6 = Sonar("PlaceTypeService")
local ElderingStats = Sonar("Constants").ElderingStats
local t = {
	CanElder = function(p1, p2) --[[ CanElder | Line: 17 | Upvalues: v4 (copy) ]]
		if p2.Eldering.Completed.Value then
			return false, "AlreadyEldered"
		end
		if p2.Eldering.Started.Value then
			return false, "AlreadyStarted"
		end
		if v4.IsToyHorse(p2) then
			return false, "ToyHorseCannotElder"
		else
			return true
		end
	end,
	GivePoints = function(p1, p2) --[[ GivePoints | Line: 25 | Upvalues: ElderingStats (copy) ]]
		if not (p1 and (p1:FindFirstChild("Eldering") and p1.Eldering:FindFirstChild("Started"))) then
			return
		end
		local v1 = if type(p2) == "number" and p2 then p2 else ElderingStats[p2]
		if not p1.Eldering.Started.Value or p1.Eldering.Completed.Value then
			return
		end
		p1.Eldering.Points.Value = math.clamp(p1.Eldering.Points.Value + v1, 0, ElderingStats.PointsNeeded)
	end
}
local t2 = {
	StartEldering = function(p1, p2, p3) --[[ StartEldering | Line: 36 | Upvalues: v2 (copy), t (copy), v5 (copy) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if not v1 then
			return "Error"
		end
		local v22 = false
		for v3, v4 in v1.PlayerData.Animals:GetChildren() do
			if v4.Eldering.Started.Value == true then
				if v4.Eldering.Started.Value and v4.Eldering.Completed.Value then
					v4.Eldering.Started.Value = false
					continue
				end
				v22 = true
			end
		end
		for v52, v6 in v1.PlayerData.MarketStallSales:GetChildren() do
			local Eldering = v6.Item:FindFirstChild("Eldering")
			if Eldering and Eldering.Started.Value == true then
				v22 = true
				break
			end
		end
		if v22 then
			return false, "AlreadyStarted"
		end
		local v7 = v1.PlayerData.Animals:FindFirstChild(p3)
		if not v7 then
			return "Error"
		end
		local v8, v9 = t.CanElder(v1, v7)
		if v8 then
			v7.Eldering.Started.Value = true
			v1.PlayerData.Eldering.Value = true
			v5.AddClubPoints(v1, 200, "Elder")
			return true
		else
			return v8, v9
		end
	end,
	ClaimEldering = function(p1, p2, p3) --[[ ClaimEldering | Line: 83 | Upvalues: v2 (copy), v6 (copy), ElderingStats (copy), v4 (copy), v3 (copy) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if not v1 then
			return false, "Error"
		end
		local v22 = v1.PlayerData.Animals:FindFirstChild(p3)
		if not v22 then
			return false, "Error"
		end
		if v22.Eldering.Completed.Value then
			return false, "AlreadyCompleted"
		end
		if not v22.Eldering.Started.Value then
			return false, "NotStarted"
		end
		if v22.Eldering.Points.Value < (if v6.IsTestGame() then 2 else ElderingStats.PointsNeeded) then
			return false, "NotReadyToElder"
		end
		v22.Eldering.Completed.Value = true
		v22.Eldering.Started.Value = false
		if #v22.Mutations:GetChildren() < v4.GetMaxMutationSlots(v22) and not v22.Eldering.MutationClaimed.Value then
			local v42 = v3.CreateDataValueFromType("Mutations")
			v42.Name = v3.getIndexOfValue(v22.Mutations)
			v42.FromEldering.Value = true
			v42.Value = "Elder"
			v42.Level.Value = 1
			v42.Parent = v22.Mutations
			v22.Eldering.MutationClaimed.Value = true
		end
		v1:UpdateDiscovery({
			Objects = {
				Elder = true
			},
			Replicate = v22.Name
		})
		v1:IncrementMission({
			Type = "ElderHorse",
			Amount = 1,
			Data = { v22.Species.Value }
		})
		return true
	end,
	RemoveEldering = function(p1, p2, p3) --[[ RemoveEldering | Line: 127 | Upvalues: v2 (copy) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if not v1 then
			return false, "Error"
		end
		local v22 = v1.PlayerData.Animals:FindFirstChild(p3)
		if not v22 then
			return false, "Error"
		end
		if v22.Eldering.Completed.Value then
			return false, "AlreadyCompleted"
		end
		if v22.Eldering.Started.Value then
			v22.Eldering.Started.Value = false
			v22.Eldering.Points.Value = 0
			return true
		else
			return false, "NotStarted"
		end
	end
}
function t.Init() --[[ Init | Line: 144 | Upvalues: RunService (copy), v1 (copy), t2 (copy) ]]
	if not RunService:IsServer() then
		return
	end
	v1.GetRemoteFunction("ElderingEvent").OnServerInvoke = function(p1, p2, p3) --[[ Line: 146 | Upvalues: t2 (ref) ]]
		if t2[p2] then
			return t2[p2](p1, p2, p3)
		end
	end
end
t.Init()
return t