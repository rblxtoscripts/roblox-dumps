-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
require(ReplicatedStorage:WaitForChild("Sonar"))("ItemDataService", {
	Deferred = true
})
local _ = RunService:IsStudio() and true
local function optionallyWithinEndTime(p1, p2) --[[ optionallyWithinEndTime | Line: 15 | Upvalues: Workspace (copy) ]]
	local EndTime = p2.TaskData.EndTime
	local v1 = nil or true
	return if v1 then if EndTime == nil then true else Workspace:GetServerTimeNow() < EndTime else v1
end
local function hasCompletedPrimaryTutorial(p1) --[[ hasCompletedPrimaryTutorial | Line: 26 ]]
	local v1 = nil
	local v2 = if v1 then v1 else p1:HasCompletedPrimaryTutorial()
	return if v2 == true then true else v2 == "Complete"
end
local function complexEquivalenceFactory(...) --[[ complexEquivalenceFactory | Line: 37 | Upvalues: hasCompletedPrimaryTutorial (copy), optionallyWithinEndTime (copy) ]]
	local t = { hasCompletedPrimaryTutorial, optionallyWithinEndTime }
	local v1 = ...
	local v2
	if typeof(v1) == "table" and v1.Queries then
		local PreQueryCallbacks = v1.PreQueryCallbacks
		if PreQueryCallbacks then
			table.move(PreQueryCallbacks, 1, #PreQueryCallbacks, #t + 1, t)
		end
		v2 = v1.Queries
	else
		v2 = { ... }
	end
	return function(p1, p2, ...) --[[ Line: 54 | Upvalues: t (copy), v2 (ref) ]]
		local t2 = { ... }
		local v1 = false
		for v22, v3 in t do
			if not v3(p1, p2) then
				return false
			end
		end
		if #v2 == 0 then
			warn((("Zero queries in complexEquivalenceFactory for %*"):format(p2.TaskData.Type)))
		end
		for v4, v5 in v2 do
			local v6 = table.remove(t2, 1)
			local v8 = nil or true
			local v9 = (if v8 then if v6 == nil then false else true else v8) and p2.TaskData[v5] == v6
			v1 = v9
			if v9 then
			else
				break
			end
		end
		return v1
	end
end
return {
	BreedAnySpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Breed {amount} of any horse species",
		ShortDescription = "Breed {amount} horse(s)",
		Type = "BreedAnySpecies"
	},
	BreedSpecificSpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Breed {amount} {species} horse(s)",
		ShortDescription = "Breed {amount} {species}",
		Type = "BreedSpecificSpecies",
		Check = complexEquivalenceFactory("Species")
	},
	CompeteInAnyCompetitorHub = {
		Amount = 1,
		AutoClaim = true,
		Description = "Compete in the Competitor Hub {amount} time(s)",
		ShortDescription = "Compete {amount} time(s)",
		Type = "CompeteInAnyCompetitorHub"
	},
	CompeteInSpecificCompetitorHub = {
		Amount = 1,
		AutoClaim = true,
		Description = "Compete in the {minigame} Competitor Hub {amount} time(s)",
		ShortDescription = "Compete in the {minigame} Competitor Hub {amount} time(s)",
		Type = "CompeteInSpecificCompetitorHub",
		Check = complexEquivalenceFactory("Minigame")
	},
	CompeteInAnyContest = {
		Amount = 1,
		AutoClaim = true,
		Description = "Compete in any contest {amount} time(s)",
		ShortDescription = "Compete in any contest {amount} time(s)",
		Type = "CompeteInAnyContest"
	},
	CompeteInSpecificContest = {
		Amount = 1,
		AutoClaim = true,
		Description = "Compete in the {contest} contest {amount} time(s)",
		ShortDescription = "Compete in the {contest} contest {amount} time(s)",
		Type = "CompeteInSpecificContest",
		Check = complexEquivalenceFactory("Contest")
	},
	CompleteAnyCompetitorHub = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete any Competitor Hub {amount} time(s)",
		ShortDescription = "Complete any Competitor Hub {amount} time(s)",
		Type = "CompleteAnyCompetitorHub"
	},
	CompleteSpecificCompetitorHub = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete a {minigame} Competitor Hub {amount} time(s)",
		ShortDescription = "Complete a {minigame} Competitor Hub {amount} time(s)",
		Type = "CompleteSpecificCompetitorHub",
		Check = complexEquivalenceFactory("Minigame")
	},
	CompleteAnyMinigame = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete {amount} minigame(s)",
		ShortDescription = "Complete {amount} minigame(s)",
		Type = "CompleteAnyMinigame"
	},
	CompleteAnyEventMinigame = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete {amount} event minigame(s)",
		ShortDescription = "Complete {amount} event minigame(s)",
		Type = "CompleteAnyEventMinigame"
	},
	CompleteSpecificMinigame = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete {amount} {minigame} minigame(s)",
		ShortDescription = "Complete {amount} {minigame} minigame(s)",
		Type = "CompleteSpecificMinigame",
		Check = complexEquivalenceFactory("Minigame")
	},
	CompleteAnySpeciesQuest = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete any {amount} species quest(s)",
		ShortDescription = "Complete any {amount} species quest(s)",
		Type = "CompleteAnySpeciesQuest"
	},
	CompleteSpecificSpeciesQuest = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete {amount} {species} species quest(s)",
		ShortDescription = "Complete {amount} {species} species quest(s)",
		Type = "CompleteSpecificSpeciesQuest",
		Check = complexEquivalenceFactory("Species")
	},
	CompleteAnySpeciesReplayQuest = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete any {species} species replay quest(s)",
		ShortDescription = "Complete any {species} species replay quest(s)",
		Type = "CompleteAnySpeciesReplayQuest",
		Check = function(p1, p2, p3) --[[ Check | Line: 207 ]]
			local v1 = nil or true
			return if v1 then p3 == true else v1
		end
	},
	CompleteSpecificSpeciesReplayQuest = {
		Amount = 1,
		AutoClaim = true,
		Description = "Complete a {species} species replay quest(s)",
		ShortDescription = "Complete a {species} species replay quest(s)",
		Type = "CompleteSpecificSpeciesReplayQuest",
		Check = function(p1, p2, p3, p4) --[[ Check | Line: 224 ]]
			local v1 = nil or true
			return (if v1 then p2.TaskData.Species == p3 else v1) and p4 == true
		end
	},
	DefeatAnyTierBoss = {
		Amount = 1,
		AutoClaim = true,
		Description = "Defeat a Boss {amount} time(s)",
		ShortDescription = "Defeat a Boss {amount} time(s)",
		Type = "DefeatAnyTierBoss"
	},
	DefeatMinimumTierBoss = {
		Amount = 1,
		AutoClaim = true,
		Description = "Defeat any Tier {tier}+ Boss {amount} time(s)",
		ShortDescription = "Defeat any Tier {tier}+ Boss {amount} time(s)",
		Type = "DefeatMinimumTierBoss",
		Check = function(p1, p2, p3) --[[ Check | Line: 251 ]]
			return p2.TaskData.Tier <= p3
		end
	},
	DefeatSpecificTierBoss = {
		Amount = 1,
		AutoClaim = true,
		Description = "Defeat a Tier {tier} Boss {amount} time(s)",
		ShortDescription = "Defeat a Tier {tier} Boss {amount} time(s)",
		Type = "DefeatSpecificTierBoss",
		Check = complexEquivalenceFactory("Tier")
	},
	FoalAnySpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Foal {amount} of any species horse(s)",
		ShortDescription = "Foal {amount} horse(s)",
		Type = "FoalAnySpecies"
	},
	FoalSpecificSpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Foal {amount} {species} horse(s)",
		ShortDescription = "Foal {amount} {species} horse(s)",
		Type = "FoalSpecificSpecies",
		Check = complexEquivalenceFactory("Species")
	},
	HarvestAnyForageable = {
		Amount = 1,
		AutoClaim = true,
		Description = "Harvest {amount} of any forageable(s)",
		ShortDescription = "Harvest {amount} forageable(s)",
		Type = "HarvestAnyForageable"
	},
	HarvestSpecificForageable = {
		Amount = 1,
		AutoClaim = true,
		Description = "Harvest {amount} {forageable} forageable(s)",
		ShortDescription = "Harvest {amount} {forageable} forageable(s)",
		Type = "HarvestSpecificForageable",
		Check = complexEquivalenceFactory("Forageable")
	},
	InspectAnyLore = {
		Amount = 1,
		AutoClaim = true,
		Description = "Inspect {amount} piece(s) of lore",
		ShortDescription = "Inspect {amount} piece(s) of lore",
		Type = "InspectAnyLore"
	},
	JumpOverAnyObstacle = {
		Amount = 1,
		AutoClaim = true,
		Description = "Jump over any obstacle {amount} time(s)",
		ShortDescription = "Jump over any obstacle {amount} time(s)",
		Type = "JumpOverAnyObstacle"
	},
	LevelAnySpeciesAnySkill = {
		Amount = 1,
		AutoClaim = true,
		Description = "Level any horse\'s skills {amount} time(s)",
		ShortDescription = "Level any skills {amount} time(s)",
		Type = "LevelAnySpeciesAnySkill"
	},
	LevelAnySpeciesSpecificSkill = {
		Amount = 1,
		AutoClaim = true,
		Description = "Level any species\' {skill} skill {amount} time(s)",
		ShortDescription = "Level any species\' {skill} skill {amount} time(s)",
		Type = "LevelAnySpeciesSpecificSkill",
		Check = complexEquivalenceFactory("Skill")
	},
	LevelSpecificSpeciesAnySkill = {
		Amount = 1,
		AutoClaim = true,
		Description = "Level any {species} species\' skills {amount} time(s)",
		ShortDescription = "Level any {species} species\' skills {amount} time(s)",
		Type = "LevelSpecificSpeciesAnySkill",
		Check = complexEquivalenceFactory("Species")
	},
	LevelSpecificSpeciesSpecificSkill = {
		Amount = 1,
		AutoClaim = true,
		Description = "Level a {species}\'s {skill} skill {amount} time(s)",
		ShortDescription = "Level a {species}\'s {skill} skill {amount} time(s)",
		Type = "LevelSpecificSpeciesSpecificSkill",
		Check = complexEquivalenceFactory("Species", "Skill")
	},
	SellAnySpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Sell any species horse {amount} time(s)",
		ShortDescription = "Sell {amount} horse(s)",
		Type = "SellAnySpecies"
	},
	SellSpecificSpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Sell {amount} {species} horse(s)",
		ShortDescription = "Sell {amount} {species} horse(s)",
		Type = "SellSpecificSpecies",
		Check = complexEquivalenceFactory("Species")
	},
	TameAnySpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Tame any horse species {amount} time(s)",
		ShortDescription = "Tame {amount} time(s)",
		Type = "TameAnySpecies"
	},
	TameSpecificSpecies = {
		Amount = 1,
		AutoClaim = true,
		Description = "Tame a {species} horse {amount} time(s)",
		ShortDescription = "Tame a {species} {amount} time(s)",
		Type = "TameSpecificSpecies",
		Check = complexEquivalenceFactory("Species")
	}
}