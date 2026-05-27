-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local ActivityUpgrades = Sonar("Constants").ActivityUpgrades
local v3 = RunService:IsServer()
local v4 = Sonar("AnalyticsService", "Server")
local t = {
	CanStartActivityUpgrade = function(p1) --[[ CanStartActivityUpgrade | Line: 17 ]]
		local count = 0
		for v1, v2 in p1.PlayerData.ActivityUpgrades:GetChildren() do
			if v2.Started.Value and not v2.Completed.Value then
				count = count + 1
			end
		end
		if count >= 2 then
			return false, "Cannot start more than 2 activity upgrades"
		else
			return true
		end
	end,
	GetUpgradeData = function(p1) --[[ GetUpgradeData | Line: 32 | Upvalues: ActivityUpgrades (copy) ]]
		return ActivityUpgrades[p1]
	end,
	GetUpgradeDataFromActivityUnlock = function(p1, p2) --[[ GetUpgradeDataFromActivityUnlock | Line: 36 | Upvalues: ActivityUpgrades (copy) ]]
		for v1, v2 in ActivityUpgrades[p1].Upgrades do
			if v2.Name == p2 then
				return v2
			end
		end
		return nil
	end,
	GetBoostForType = function(p1, p2, p3) --[[ GetBoostForType | Line: 48 | Upvalues: ActivityUpgrades (copy) ]]
		local v1 = p1.PlayerData.ActivityUpgrades[p2]
		local sum = 0
		for v2, v3 in ActivityUpgrades[p2].Upgrades do
			if v1.Upgrades[v3.Name].Value and v3.Value[p3] then
				sum = sum + v3.Value[p3]
			end
		end
		return sum
	end
}
function t.Init(p1) --[[ Init | Line: 64 | Upvalues: v3 (copy), v1 (copy), v2 (copy), ActivityUpgrades (copy), t (copy), v4 (copy) ]]
	if not v3 then
		return
	end
	v1.GetRemoteFunction("StartActivityUpgradesRemote").OnServerInvoke = function(p12, p2, p3) --[[ Line: 66 | Upvalues: v2 (ref), ActivityUpgrades (ref), p1 (copy) ]]
		local v1 = v2.getWrapperFromPlayer(p12)
		if not v1 then
			return false, "An internal error occurred, try again."
		end
		local v22 = ActivityUpgrades[p2]
		if v22.SpeciesRequired and not v1.PlayerData.Missions.SpeciesUnlocks[v22.SpeciesRequired].Completed.Value then
			return false, "You must complete the " .. v22.SpeciesRequired .. " quest first!"
		end
		local v3, v4 = p1.CanStartActivityUpgrade(v1)
		if v3 then
			v1.PlayerData.ActivityUpgrades[p2].Started.Value = true
			return true
		else
			return false, v4
		end
	end
	v1.GetRemoteFunction("CancelActivityUpgradeRemote").OnServerInvoke = function(p1, p2) --[[ Line: 91 | Upvalues: v2 (ref) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if v1 then
			v1.PlayerData.ActivityUpgrades[p2].Started.Value = false
			return true
		else
			return false, "An internal error occurred, try again."
		end
	end
	v1.GetRemoteFunction("UpgradeActivityUpgradesRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 103 | Upvalues: v2 (ref), t (ref), v4 (ref) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if not v1 then
			return false, "An internal error occurred, try again."
		end
		local v22 = v1.PlayerData.ActivityUpgrades[p2]
		if not v22 then
			return false, "An internal error occurred, try again."
		end
		if not v22.Upgrades[p3] then
			return false, "An internal error occurred, try again."
		end
		local Cost = t.GetUpgradeDataFromActivityUnlock(p2, p3).Cost
		if not v1:CanAfford(Cost, "Coins") then
			return false, "You do not have enough coins to upgrade this activity."
		end
		if not v1.PlayerData.ActivityUpgrades[p2].Started.Value then
			return false, "You must start the activity upgrade first."
		end
		local v3 = v1:GetCurrencyValue("Coins")
		v3.Value = v3.Value - Cost
		v4.ReportResourceEvent(v1.Player, "Sink", "Currency", "Coins", "ActivityUpgrade", Cost)
		v22.Upgrades[p3].Value = true
		local v42 = true
		for v5, v6 in v22.Upgrades:GetChildren() do
			if not v6.Value then
				v42 = false
			end
		end
		if not v42 then
			return true
		end
		v22.Completed.Value = true
		return true
	end
end
t:Init()
return t