-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = v1 and Sonar("AnalyticsService")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("LevelUtils")
local v6 = Sonar("TimeUtils")
local v7 = Sonar("ItemDataService")
local v8 = Sonar("PlaceTypeService")
Sonar("Constants")
local v9 = if v8.IsTestGame() then 60 else 600
local v10 = if v8.IsTestGame() then 60 else 600
function t.CanPetSlot(p1, p2, p3) --[[ CanPetSlot | Line: 24 | Upvalues: t (copy), v6 (copy) ]]
	local v1 = p2.PlayerData.Animals:FindFirstChild(p3)
	if not v1 then
		return
	end
	local v2 = v1.LastBondPet.Value + t.TimeBetweenPet - v6.Get()
	if v2 > 0 then
		return "OnCooldown", nil, v2
	else
		return true, v1, 0
	end
end
function t.CanDoCleaningMinigame(p1, p2, p3, p4) --[[ CanDoCleaningMinigame | Line: 36 | Upvalues: v7 (copy), t (copy), v6 (copy) ]]
	local v1 = p2.PlayerData.Animals:FindFirstChild(p3)
	if not v1 then
		return
	end
	local v2 = v7.GetByName(p4)
	if not v2 then
		return
	end
	if p2:GetItemValue(p4).Value <= 0 then
		return "NoTool"
	end
	local v3 = v1.LastBond.Value + t.TimeBetweenBond - v6.Get()
	if v3 > 0 then
		return "OnCooldown", nil, v3
	else
		return true, v1, 0, v2
	end
end
function t.Init(p1) --[[ Init | Line: 55 | Upvalues: t (copy), v9 (copy), v10 (copy), v1 (copy), v3 (copy), v4 (copy), Sonar (copy), v6 (copy), v2 (copy), v5 (copy) ]]
	t.TimeBetweenPet = v9
	t.TimeBetweenBond = v10
	if not v1 then
		return
	end
	v3.GetRemoteFunction("CleanMinigameRemote").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 60 | Upvalues: v4 (ref), Sonar (ref), t (ref), v6 (ref), v2 (ref), v5 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v22 = v1.EquippedAnimals[p2]
		if not v22 then
			return
		end
		if v22.AnimalData:Get("BondEvent") == p3 then
			Sonar("BondInteractionService").CompleteDelivery(v1.Player, {
				Name = p3
			})
		end
		local v3, v42, _, v52 = t:CanDoCleaningMinigame(v1, p2, p3)
		if v3 ~= true then
			return
		end
		v42.LastBond.Value = v6.Get()
		local v62 = v1:GetItemValue(v52.Name)
		v62.Value = v62.Value - 1
		v2.ReportResourceEvent(v1.Player, "Sink", "Miscellaneous", v52.Name, "BondInteraction", 1)
		v1:IncrementMission({
			Type = "BondWithHorse",
			Amount = 1,
			Data = { v42.Species.Value, p3 }
		})
		if p4 then
			v1:IncrementMission({
				Type = "CleanHorseToy",
				Amount = 1,
				Data = { v42.Species.Value, p3 }
			})
		end
		v5.GiveExperience(v1, {
			Stat = "Bond",
			Amount = v52.Experience,
			Slot = v42
		})
		v2.ReportDesignEvent(p1, "HorseBond", {
			{
				Key = "Type",
				Value = "CleanMinigame"
			},
			{
				Key = "Species",
				Value = v42.Species.Value
			},
			{
				Key = "Tool",
				Value = p3
			},
			{
				Key = "ExperienceGained",
				Value = v52.Experience
			}
		}, 1)
		return true
	end
	v3.GetRemoteFunction("PetHorseRemote").OnServerInvoke = function(p1, p2) --[[ Line: 108 | Upvalues: v4 (ref), t (ref), v6 (ref), v5 (ref), v2 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if not v1.EquippedAnimals[p2] then
			return
		end
		local v22, v3 = t:CanPetSlot(v1, p2)
		if v22 == true then
			v3.LastBondPet.Value = v6.Get()
			v5.GiveExperience(v1, {
				Stat = "Bond",
				Amount = 20,
				Slot = v3
			})
			v2.ReportDesignEvent(p1, "HorseBond", {
				{
					Key = "Type",
					Value = "PetMinigame"
				},
				{
					Key = "Species",
					Value = v3.Species.Value
				},
				{
					Key = "ExperienceGained",
					Value = 20
				}
			}, 1)
			return true
		end
	end
end
t:Init()
return t