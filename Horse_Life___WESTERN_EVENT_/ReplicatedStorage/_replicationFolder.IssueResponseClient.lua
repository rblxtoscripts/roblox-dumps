-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("PlayerUtils")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("FormatNumber")
local t2 = {
	CantSellFavorited = "You can\'t sell a favorite horse!",
	CantSellLastHorse = "You cannot sell your last horse!",
	CantSubmitLastHorse = "You cannot submit your last horse!",
	AtAnimalLimit = "\226\154\160\239\184\143 You cannot own anymore horses! \226\154\160\239\184\143",
	MaxAnimals = "\226\154\160\239\184\143 You cannot own anymore horses! \226\154\160\239\184\143",
	MaxInventory = "\226\154\160\239\184\143 You are at max inventory space! \226\154\160\239\184\143",
	MaxEquipped = "You cannot equip anymore horses, try upgrading!",
	CantAffordStableUpgrade = "You cannot afford to upgrade!",
	CantAffordInventoryUpgrade = "You cannot afford to upgrade!",
	CantAffordPlotSlot = "You cannot afford to purchase an extra slot!",
	NotEnoughStats = "You haven\'t finished all the tasks to upgrade!",
	NoNameTag = "You do not own a name tag!",
	CannotCraftBuilding = "This item cannot be crafted!",
	CraftingLimitReached = "You cannot own anymore of this item!",
	CannotAffordToCraft = "You do not have the materials to craft this!",
	CannotPlaceAnymore = "You cannot place anymore buildings!",
	PlacementLimitReached = "You cannot place anymore of this building!",
	AtBuildingLimit = "You cannot craft anymore buildings!",
	RideNotSettingEveryone = function(p1) --[[ RideNotSettingEveryone | Line: 39 | Upvalues: v2 (copy) ]]
		return string.format("%s is not allowing anyone to ride their horse!", v2.GetPlayerName(p1))
	end,
	RideNotSettingFriends = function(p1) --[[ RideNotSettingFriends | Line: 42 | Upvalues: v2 (copy) ]]
		return string.format("%s is only allowing friends to ride their horse!", v2.GetPlayerName(p1))
	end,
	CannotAffordToPredict = "You cannot afford this!",
	CannotAfford = "You cannot afford this!",
	NoOwnAnymore = "You don\'t have anymore of this item!",
	OnLoadCooldown = function(p1) --[[ OnLoadCooldown | Line: 50 | Upvalues: v3 (copy) ]]
		return string.format("You cannot do that for another %s!", v3.FormatString(p1))
	end,
	Related = "Horse(s) are related and cannot breed!",
	TooYoung = "Horse(s) are not old enough to do that!",
	PregnantTimer = "Horses(s) cannot breed yet!",
	Pregnant = "Horse(s) already have a child!",
	BreedCooldown = "Horses(s) cannot breed yet!",
	BreedWait = "Horse(s) cannot breed yet!",
	Infertile = "You can\'t breed infertile horse(s)!",
	InfertileOrigin = "This horse origin is permanently infertile!",
	ToyHorseCannotBreed = "You can\'t breed LEGO\194\174 Horses!",
	SameSlot = "This horse can\'t breed with itself!",
	NoBreedPermission = "You do not have the breeding license to do this!",
	NotSameSpecies = "You can only breed this horse with the same species!",
	NotUnlocked = "You cannot breed species that are not yet unlocked!",
	ToyHorseCannotUsePotion = "You cannot use potions on LEGO\194\174 Horses!",
	LegoWingPotionNotToyHorse = "This potion can only be used on LEGO\194\174 Horses!",
	AlreadyHasToyWings = "This LEGO\194\174 Horse already has wings!",
	ToyHorseCannotCoRide = "You cannot co-ride LEGO\194\174 Horses!",
	CannotCoRideWhileOnHorse = "You cannot co-ride another horse while riding your own!",
	CannotEquipOnSpecies = "You cannot equip this onto this species!",
	AlreadyEquippedItem = "This item is already equipped!",
	NotAdult = "Your horse must be an adult to equip items!",
	ToyHorseNonToyAccessory = "LEGO\194\174 Horses can only wear LEGO\194\174 accessories!",
	ToyAccessoryNonToyHorse = "LEGO\194\174 accessories can only be worn by LEGO\194\174 Horses!",
	CannotEditTheme = "You cannot edit theme accessories!",
	NotColorEditable = "This accessory cannot be edited!",
	NoColorDye = "You do not own any color dye!",
	NoEditedColors = "You have not edited any color regions!",
	ContestEnded = "The contest has currently ended!",
	NotCorrectSpecies = "You cannot submit this species!",
	NotReceivedInWeek = "Only horses obtained in the contest week can be submitted!",
	NoSimilarAttributes = "You cannot submit a horse without any matches!",
	LessThanSubmit = "This horse\'s rating is less than your current score!",
	CannotAffordPredictFoalPotion = "You need a \'Predict Foal Potion\' to do that!",
	CantAffordMutationRoll = "You need a \'Mutation Potion\' to do that!",
	ToyHorseCannotRerollMutation = "You cannot reroll mutations on LEGO\194\174 Horses!",
	CantDonateLastHorse = "You cannot donate your last horse!",
	CantDonateFavoriteHorse = "You can\'t donate a favorite horse!",
	CantPurchaseRightNow = "You can\'t purchase this right now!",
	CantPickup = "You can\'t pick this up!",
	CantStartMinigame = "Cannot start minigame right now!",
	NotHoldingAnything = "You aren\'t holding anything!",
	MaxMaterialsPurchased = "You cannot purchase anymore materials until the next cycle!",
	TooFast = "You\'re doing this action too quickly.",
	PlotLocked = "This plot is locked!",
	AlreadyPlanted = "There is already a plant here!",
	NoPlot = "No plot found!",
	NoSeedPlanted = "This plot has no seeds!",
	NotGrown = "This plant is not ready to claim!",
	AlreadyUnlocked = "This plot is already unlocked!",
	CannotBossEquip = "You cannot equip more than 1 horse during a boss fight!",
	CannotEquipHorses = "You cannot equip horses right now!",
	MaxAnimalStorage = "You cannot put anymore horses in storage!",
	LastAnimal = "You cannot put your last horse in storage!",
	SlotInAuction = "You cannot store a horse that is in auction!",
	CantSellInAuction = "You cannot sell a horse that is in auction!",
	InStorage = "You cannot equip a horse that is in storage!",
	AnErrorOccurred = "An error occurred, try again later.",
	RateLimited = "You\'re doing that too fast, please wait a moment.",
	InvalidCharacters = "Your input contains invalid characters!",
	InvalidIcon = "The selected icon is invalid!",
	InvalidBanner = "The selected banner is invalid!",
	InvalidStatus = "The selected status is invalid!",
	InvalidPrivacy = "The selected privacy setting is invalid!",
	NameIsFiltered = "Your club name contains filtered words!",
	NameContainsRestrictedTerm = "Your club name contains a restricted term!",
	AboutIsFiltered = "Your club about contains filtered words!",
	NameIsNotUnique = "This club name is already taken!",
	NameIsTooShort = "Your club name is too short!",
	NameIsTooLong = "Your club name is too long!",
	AboutIsTooShort = "Your club about is too short!",
	AboutIsTooLong = "Your club about is too long!",
	AlreadyHasClub = "You already have a club!",
	NotInClub = "You are not in a club!",
	NoPermission = "You do not have permission to do that!",
	ClubIsFull = "This club is full!",
	ClubNotFound = "This club does not exist!",
	AlreadyInClub = "You are already in a club!",
	InviteOnly = "This club is invite only!",
	FriendsOnly = "This club is friends only!",
	NoJoinRequest = "This player has not requested to join!",
	NoInvite = "You do not have an invite to this club!",
	NotInGame = "This player is not in the game!",
	CantAfford = "You cannot afford this!",
	ClubTierNotUnlocked = "This tier is not unlocked yet!",
	NotEligible = "You are not eligible for this reward!",
	AlreadyClaimed = "You have already claimed this reward!",
	TheyAlreadyHaveClub = "They already have a club!",
	InvalidCode = "This invite code is invalid or expired!",
	NoPreviousSeed = "No previous leaderboard data available!",
	NotOnLeaderboard = "Your club was not on the leaderboard!",
	PositionNotEligible = "Your club\'s position does not qualify for rewards!",
	JoinedTooRecently = "You joined this club too recently to claim rewards!",
	NoContribution = "You did not contribute points during the previous week!",
	MaxCapacity = "Your club is already at max capacity!",
	NotEnoughCoins = function(p1) --[[ NotEnoughCoins | Line: 164 | Upvalues: v4 (copy) ]]
		return string.format("You do not have enough coins to create a club! (Need %s Coins)", v4.splice(p1))
	end,
	NoOwnership = "You do not own this item!",
	NpcSellInvalid = "Something went wrong.",
	NpcSellInvalidAmount = "Enter a valid amount to sell.",
	NpcSellNotOffered = "This NPC isn\'t buying that item.",
	NpcSellBondTooLow = "Your bond isn\'t high enough to sell this item.",
	NpcSellFailed = "Couldn\'t complete the sale. Try again.",
	AnnounceCooldown = "You must wait before announcing again!"
}
function t.GetIssueFromReason(p1, ...) --[[ GetIssueFromReason | Line: 179 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]
	if type(v1) == "string" then
		return v1
	end
	if type(v1) == "function" then
		return v1(...)
	end
end
function t.NotifyIssue(p1, ...) --[[ NotifyIssue | Line: 189 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = t.GetIssueFromReason(p1, ...)
	if v12 then
		v1.Notify({
			Preset = "Red",
			Message = v12,
			Type = p1
		})
	else
		warn("No message can be found for", p1)
	end
end
function t.AddResponses(p1) --[[ AddResponses | Line: 202 | Upvalues: t2 (copy) ]]
	for k, v in pairs(p1) do
		t2[k] = v
	end
end
return t