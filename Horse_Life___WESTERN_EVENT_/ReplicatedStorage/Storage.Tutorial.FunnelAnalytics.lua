-- https://lua.expert/
return {
	StartedSelection = function(p1) --[[ StartedSelection | Line: 10 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "StartedSelection",
			progression03 = "",
			score = p1
		}
	end,
	SetupSelectionGui = function(p1) --[[ SetupSelectionGui | Line: 19 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "SetupSelectionGui",
			progression03 = "",
			score = p1
		}
	end,
	ViewingSelectionGui = function(p1) --[[ ViewingSelectionGui | Line: 28 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "ViewingSelectionGui",
			progression03 = "",
			score = p1
		}
	end,
	HorseSelected = function(p1, p2) --[[ HorseSelected | Line: 37 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "HorseSelected",
			progression03 = "Slot-" .. tostring(p2),
			score = p1
		}
	end,
	TameHorse = function(p1) --[[ TameHorse | Line: 48 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "TameHorse",
			progression03 = "",
			score = p1
		}
	end,
	GotOnHorse = function(p1) --[[ GotOnHorse | Line: 57 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "GotOnHorse",
			progression03 = "",
			score = p1
		}
	end,
	EquippedLasso = function(p1) --[[ EquippedLasso | Line: 66 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "EquippedLasso",
			progression03 = "",
			score = p1
		}
	end,
	InRangeOfHorse = function(p1) --[[ InRangeOfHorse | Line: 75 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "InRangeOfHorse",
			progression03 = "",
			score = p1
		}
	end,
	StartedTaming = function(p1) --[[ StartedTaming | Line: 84 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "StartedTaming",
			progression03 = "",
			score = p1
		}
	end,
	FinishedTaming = function(p1) --[[ FinishedTaming | Line: 93 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "FinishedTaming",
			progression03 = "",
			score = p1
		}
	end,
	BreedingHorse = function(p1) --[[ BreedingHorse | Line: 104 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "BreedingHorse",
			progression03 = "",
			score = p1
		}
	end,
	ClosedTamedHorseGui = function(p1) --[[ ClosedTamedHorseGui | Line: 113 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "ClosedTamedHorseGui",
			progression03 = "",
			score = p1
		}
	end,
	StablesGuiOpened = function(p1) --[[ StablesGuiOpened | Line: 122 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "StablesGuiOpened",
			progression03 = "",
			score = p1
		}
	end,
	StablesHorseSelected = function(p1) --[[ StablesHorseSelected | Line: 131 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "StablesHorseSelected",
			progression03 = "",
			score = p1
		}
	end,
	BreedingGuiOpened = function(p1) --[[ BreedingGuiOpened | Line: 140 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "BreedingGuiOpened",
			progression03 = "",
			score = p1
		}
	end,
	BreedingHorsesSelected = function(p1) --[[ BreedingHorsesSelected | Line: 149 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "BreedingHorsesSelected",
			progression03 = "",
			score = p1
		}
	end,
	BreedButtonPressed = function(p1) --[[ BreedButtonPressed | Line: 158 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "BreedButtonPressed",
			progression03 = "",
			score = p1
		}
	end,
	PregnantHorseSelected = function(p1) --[[ PregnantHorseSelected | Line: 167 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "PregnantHorseSelected",
			progression03 = "",
			score = p1
		}
	end,
	ClaimChildButtonPressed = function(p1) --[[ ClaimChildButtonPressed | Line: 176 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "ClaimChildButtonPressed",
			progression03 = "",
			score = p1
		}
	end,
	ClosedClaimedChildGui = function(p1) --[[ ClosedClaimedChildGui | Line: 185 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "ClosedClaimedChildGui",
			progression03 = "",
			score = p1
		}
	end,
	BabyHorseSelected = function(p1) --[[ BabyHorseSelected | Line: 194 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "BabyHorseSelected",
			progression03 = "",
			score = p1
		}
	end,
	EquipButtonPressed = function(p1) --[[ EquipButtonPressed | Line: 203 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "EquipButtonPressed",
			progression03 = "",
			score = p1
		}
	end,
	TutorialMissions = function(p1) --[[ TutorialMissions | Line: 214 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "TutorialMissions",
			progression03 = "",
			score = p1
		}
	end,
	TrackedTamedHorseObjective = function(p1) --[[ TrackedTamedHorseObjective | Line: 223 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "TrackedTamedHorseObjective",
			progression03 = "",
			score = p1
		}
	end,
	TamedHorse = function(p1) --[[ TamedHorse | Line: 232 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "TamedHorse",
			progression03 = "",
			score = p1
		}
	end,
	SoldHorse = function(p1) --[[ SoldHorse | Line: 241 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "SoldHorse",
			progression03 = "",
			score = p1
		}
	end,
	AnyTutorialMissionClaimed = function(p1) --[[ AnyTutorialMissionClaimed | Line: 250 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "AnyTutorialMissionClaimed",
			progression03 = "",
			score = p1
		}
	end,
	BreedingTutorialMissionCompleted = function(p1) --[[ BreedingTutorialMissionCompleted | Line: 259 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "BreedingTutorialMissionCompleted",
			progression03 = "",
			score = p1
		}
	end,
	ForageFeeding = function(p1) --[[ ForageFeeding | Line: 270 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "ForageAndFeed",
			progression03 = "",
			score = p1
		}
	end,
	StartedHarvesting = function(p1) --[[ StartedHarvesting | Line: 279 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "StartedHarvesting",
			progression03 = "",
			score = p1
		}
	end,
	FinishedHarvesting = function(p1) --[[ FinishedHarvesting | Line: 288 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "FinishedHarvesting",
			progression03 = "",
			score = p1
		}
	end,
	InventoryGuiOpened = function(p1) --[[ InventoryGuiOpened | Line: 297 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "InventoryGuiOpened",
			progression03 = "",
			score = p1
		}
	end,
	InventoryItemSelected = function(p1) --[[ InventoryItemSelected | Line: 306 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "InventoryItemSelected",
			progression03 = "",
			score = p1
		}
	end,
	FeedButtonPressed = function(p1) --[[ FeedButtonPressed | Line: 315 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "FeedButtonPressed",
			progression03 = "",
			score = p1
		}
	end,
	QuickFeedHorseSelected = function(p1) --[[ QuickFeedHorseSelected | Line: 324 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "QuickFeedHorseSelected",
			progression03 = "",
			score = p1
		}
	end,
	QuickFeedItemUsed = function(p1) --[[ QuickFeedItemUsed | Line: 333 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "QuickFeedItemUsed",
			progression03 = "",
			score = p1
		}
	end,
	InventoryGuiClosed = function(p1) --[[ InventoryGuiClosed | Line: 342 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "InventoryGuiClosed",
			progression03 = "",
			score = p1
		}
	end,
	AnyHorseMissionClaimed = function(p1) --[[ AnyHorseMissionClaimed | Line: 351 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "AnyHorseMissionClaimed",
			progression03 = "",
			score = p1
		}
	end,
	LearnQuests = function(p1) --[[ LearnQuests | Line: 362 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "LearnQuests",
			progression03 = "",
			score = p1
		}
	end,
	QuestsGuiButtonPressed = function(p1) --[[ QuestsGuiButtonPressed | Line: 371 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "QuestsGuiButtonPressed",
			progression03 = "",
			score = p1
		}
	end,
	OpenedQuestsGui = function(p1) --[[ OpenedQuestsGui | Line: 380 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "OpenedQuestsGui",
			progression03 = "",
			score = p1
		}
	end,
	UnlockQuestsGuiOpened = function(p1) --[[ UnlockQuestsGuiOpened | Line: 389 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "UnlockQuestsGuiOpened",
			progression03 = "",
			score = p1
		}
	end,
	StartSpeciesButtonPressed = function(p1) --[[ StartSpeciesButtonPressed | Line: 398 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "StartSpeciesButtonPressed",
			progression03 = "",
			score = p1
		}
	end,
	ClosedQuestsGui = function(p1) --[[ ClosedQuestsGui | Line: 407 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "ClosedQuestsGui",
			progression03 = "",
			score = p1
		}
	end,
	CompletedTutorial = function(p1) --[[ CompletedTutorial | Line: 418 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "NatTutorial",
			progression02 = "CompletedTutorial",
			progression03 = "",
			score = p1
		}
	end
}