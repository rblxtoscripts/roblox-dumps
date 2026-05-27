-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("ItemDataService")
local v3 = Sonar("MutationUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("AnimalDataService")
local v7 = Sonar("DataUtils")
local v8 = not v1 and Sonar("IssueResponseClient")
local v9 = v1 and Sonar("AnimalManager")
local v10 = Sonar("AnalyticsService", "Server")
local v11 = v1 and Sonar("CarService")
local v12 = Sonar("NotificationsService")
local v13 = Sonar("PatternUtils")
local v14 = Sonar("Constants")
local v15 = Sonar("PlaceTypeService")
local v16 = Sonar("LevelUtils")
local v17 = Sonar("HornUtils")
local v18 = Sonar(Sonar("StorageUtils").Get("UpgradeStats"))
local t2 = {}
local v19 = not v1 and v4.GetClient()
local t3 = {
	NoUpgradePotion = "You do not have enough potions to upgrade!",
	MaxMutationLevel = "You cannot upgrade this mutation anymore!",
	NoMutationFound = function(p1) --[[ NoMutationFound | Line: 39 ]]
		if p1.TargetMutationType == "Wings" then
			return "You can only use this on horses that have the Wing Mutation!"
		end
		if p1.Name == "TrophyUpgradePotion" then
			return "You can only use this on horses that have the Trophy Mutation!"
		else
			return "Nil"
		end
	end,
	NoChildForSlot = "You can only feed this to horses on breeding cooldown!",
	NoBirthCooldownLeft = "You can only feed this to horses on breeding cooldown!",
	AlreadyHasWingMutation = "This horse already has a Wing Mutation!",
	AlreadyHasHalloweenMutation = "This horse already has a Halloween Mutation!",
	NoEmptyMutationSlot = "This horse doesn\'t have an Empty Mutation slot!",
	AlreadyHasMutation = "his horse already this Mutation!",
	HasMaxTrait = "This horse already has the max number of the target trait type!",
	AlreadyInfertile = "This horse is already infertile!",
	NoChild = "This horse doesn\'t have a foal!",
	HasChild = "You can\'t use this while your horse has a foal!",
	IsOnBirthCooldown = "You can\'t use this while your horse is on breed cooldown!",
	AlreadyBigender = "You can\'t use this on an already bi-gender horse!",
	CannotDeleteWingsOnPeryton = "You cannot remove the wings from this species!",
	DoesNotHaveUpliftedWings = "This horse does not have uplifted wings!",
	AlreadyHasUpliftedWings = "This horse already has uplifted wings!",
	HasNoWingMutation = "You can only use this on horses that have the Wing Mutation!",
	InAuction = "You cannot use this on horses that are being auctioned!",
	MaxMutationSlots = "This horse has the max amount of mutation slots!",
	NoPossibleMutations = "This horse already has all possible mutations from this!",
	AlreadyForeverYouth = "This horse already is youthful forever!",
	AlreadyDownScaled = "This horse has already been down sized!",
	AlreadyMaxAge = "Thise horse is already at the max age!",
	MaxLevel = "This horse is already got skills at the max level!",
	MaxLevelTrohpy = "This horse\'s Trophy mutation is already at the max level!",
	NoTrophy = "This horse does not have the Trophy mutation!",
	NoHornsFound = "This species doesn\'t have any Horns!",
	AlreadyHasHorn = "This horse already has a Horn!",
	NotGhoulsteed = "This species is not compatible!",
	AlreadyHasExternalBones = "This already has the trait!",
	WrongItem = "This is not the correct item!",
	NoAnimalFound = "No animal found",
	ToyHorseCannotUsePotion = "You cannot use potions on LEGO\194\174 Horses!",
	LegoWingPotionNotToyHorse = "This potion can only be used on LEGO\194\174 Horses!",
	AlreadyHasToyWings = "This LEGO\194\174 Horse already has wings!"
}
local t4 = {
	SkipGestation = {
		Run = function(p1, p2, p3, p4) --[[ Run | Line: 96 | Upvalues: v2 (copy), Sonar (copy), v6 (copy) ]]
			local v1 = p4 or 1
			local v22 = nil or p2.Starter.Value
			local v3 = (if v22 then if p2.LastBreed.Value == 0 then true else false else v22) and p1.PlayerCohorts.NewTutorial:get() and not p1.PlayerData.NewTutorialComplete.Value
			local v4 = v2.GetByName(p3)
			local v5 = p1:GetItemValue(v4.Name)
			local v62 = p1.EquippedAnimalsFolder:FindFirstChild(p2.Name)
			if v62 and v62.Data:GetAttribute("BondEvent") then
				if v1 <= 0 then
					return
				end
				v5.Value = v5.Value - p1:GetAmountToUse(v5, 1)
				Sonar("BondInteractionService").CompleteDelivery(p1.Player, {
					Name = p3
				})
			else
				local v8 = v6.GetBirthTimeLeft(p1, p2)
				local v10 = math.ceil(v8 / v4.Gestation)
				local v11 = v6.IsToyHorse(p2)
				local v12, v13
				if v11 and v8 <= 0 then
					v12, v13 = math.min(v1, 1), v3
				else
					v13 = v3
					v12 = math.min(v1, v10)
				end
				local v16 = p1:GetAmountToUse(v5, v12)
				if v16 <= 0 and not v13 then
					return
				end
				v5.Value = v5.Value - v16
				if v13 then
					p2.LastBreed.Value = workspace:GetServerTimeNow()
				elseif not v11 then
					local LastBreed = p2.LastBreed
					LastBreed.Value = LastBreed.Value - v4.Gestation * v16
				end
			end
			p1:IncrementStat({
				Type = "HorsesFed",
				Amount = 1
			})
			p1:IncrementMission({
				Type = "FeedYourHorse",
				Amount = 1,
				Data = { p2.Species.Value, p3 }
			})
			return true
		end,
		Check = function(p1, p2, p3, p4) --[[ Check | Line: 161 | Upvalues: v6 (copy) ]]
			local v1 = nil or p2.Starter.Value
			local v2 = (if v1 then if p2.LastBreed.Value == 0 then true else false else v1) and p1.PlayerCohorts.NewTutorial:get() and not p1.PlayerData.NewTutorialComplete.Value
			local v3 = p1.EquippedAnimalsFolder:FindFirstChild(p2.Name)
			if v3 and (v3.Data:GetAttribute("BondEvent") and v3.Data:GetAttribute("BondEvent") == p3) then
				return true
			end
			if v3 and (v3.Data:GetAttribute("BondEvent") and v3.Data:GetAttribute("BondEvent") ~= p3) then
				return "WrongItem"
			end
			if v6.GetBirthTimeLeft(p1, p2) <= 0 and not (v2 or v6.IsToyHorse(p2)) then
				return "NoBirthCooldownLeft"
			else
				return true
			end
		end
	},
	Boost = {
		Run = function(p1, p2, p3, p4) --[[ Run | Line: 196 | Upvalues: v2 (copy), v7 (copy) ]]
			local v1 = v2.GetByName(p3)
			local v22 = p1:GetItemValue(v1.Name)
			local v3 = p1:GetAmountToUse(v22, p4 or 1)
			if v3 <= 0 then
				return
			end
			v22.Value = v22.Value - v3
			local v4 = p2.ActiveBoosts:FindFirstChild(p3)
			if v4 then
				local v6 = math.floor((workspace:GetServerTimeNow()))
				v4.Value = math.max(v6, v4.Value) + v3 * v1.Duration
			else
				local v8 = v7.CreateDataValueFromType("ActiveBoosts")
				v8.Name = p3
				v8.Value = math.floor((workspace:GetServerTimeNow())) + v3 * v1.Duration
				v8.Start.Value = workspace:GetServerTimeNow()
				v8.Parent = p2.ActiveBoosts
			end
			return true
		end,
		Check = function(p1, p2, p3, p4) --[[ Check | Line: 222 ]]
			return true
		end
	},
	MutationDeletePotion = {
		Run = function(p1, p2, p3, p4) --[[ Run | Line: 228 | Upvalues: v9 (copy) ]]
			local v1 = p2.Mutations:FindFirstChild(p4)
			if not v1 then
				return
			end
			local v2 = p1:GetItemValue(p3)
			if v2.Value <= 0 then
			else
				v2.Value = v2.Value - 1
				v1.Value = ""
				v9.RefreshAnimal(p1, p2)
				return true
			end
		end,
		Check = function(p1, p2, p3, p4, p5) --[[ Check | Line: 246 | Upvalues: v6 (copy), v3 (copy) ]]
			local v1 = p2.Mutations:FindFirstChild(p4)
			if not v1 then
				return "NoMutationFound"
			end
			if v6.IsToyHorse(p2) then
				return "ToyHorseCannotUsePotion"
			end
			if v3.GetMutation(v1.Value).Type == "Wings" and p2.Species.Value == "Peryton" then
				return "CannotDeleteWingsOnPeryton"
			end
			if p5 and not p1:HasEnoughOfItem(1, p3) then
				return "NoOwnAnymore"
			else
				return true
			end
		end
	},
	MutationSlotPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 270 | Upvalues: v7 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				local v2 = v7.CreateDataValueFromType("Mutations")
				v2.Name = v7.getIndexOfValue(p2.Mutations)
				v2.Value = ""
				v2.Level.Value = 1
				v2.Parent = p2.Mutations
				v1.Value = v1.Value - 1
				return true
			end
		end,
		Check = function(p1, p2, p3, p4) --[[ Check | Line: 286 | Upvalues: v6 (copy) ]]
			if #p2.Mutations:GetChildren() >= v6.GetMaxMutationSlots(p2) then
				return "MaxMutationSlots"
			end
			if p4 and not p1:HasEnoughOfItem(1, p3) then
				return "NoOwnAnymore"
			else
				return true
			end
		end
	},
	UpgradeMutation = {
		Run = function(p1, p2, p3, p4) --[[ Run | Line: 299 | Upvalues: v3 (copy) ]]
			local v1 = p2.Mutations:FindFirstChild(p4)
			local v2 = p1:GetItemValue(p3)
			if v2.Value <= 0 then
			else
				v2.Value = v2.Value - 1
				local Level = v1.Level
				Level.Value = Level.Value + 1
				p1:IncrementMission({
					Type = "UpgradeMutation",
					Amount = 1,
					Data = { v3.GetMutation(v1.Value).Type, v1.Value, v1.Level.Value }
				})
				return true
			end
		end,
		Check = function(p1, p2, p3, p4, p5) --[[ Check | Line: 317 | Upvalues: v2 (copy), v3 (copy) ]]
			local v1 = v2.GetByName(p3)
			local v22, v32
			if p4 then
				local v4 = if typeof(p4) == "Instance" and p4 then p4 else p2.Mutations:FindFirstChild(p4)
				v22, v32 = v4, v3.GetMutation(v4.Value)
			else
				local v6, v7 = v3.GetMutationOfType(p2, v1.TargetMutationType)
				v22 = v7
				v32 = v6
			end
			if p5 and not p1:HasEnoughOfItem(1, p3) then
				return "NoOwnAnymore"
			end
			if not v22 then
				return "NoMutationFound", v1
			end
			if not v1.TargetMutationType then
				return "NoMutationFound", v1
			end
			if not v32 then
				return "NoMutationFound", v1
			end
			if v32.Type ~= v1.TargetMutationType then
				return "NoMutationFound", v1
			end
			if v22.Level.Value >= v32.MaxLevel then
				return "MaxMutationLevel"
			else
				return true
			end
		end
	},
	RandomMutation = {
		Run = function(p1, p2, p3) --[[ Run | Line: 353 | Upvalues: v2 (copy), v3 (copy), v9 (copy), v12 (copy) ]]
			local v1 = v2.GetByName(p3)
			local v22 = v3.GetEmptyMutationSlot(p2)
			if not v22 then
				return
			end
			local v32 = p1:GetItemValue(p3)
			if v32.Value <= 0 then
				return
			end
			local v4 = if v1.SpecificPullTable then v3.GetMutation(v1.SpecificPullTable[math.random(1, #v1.SpecificPullTable)]).Name else v3.GetRandomMutationOfType(v1.TargetMutationType, p2)
			v32.Value = v32.Value - 1
			v22.Value = v4
			v22.Level.Value = 1
			if v1.TargetMutationType == "Wings" then
				v9.RefreshAnimal(p1, p2)
			end
			v12.NotifyPlayer(p1.Player, "RandomMutation", p2.Name, v22.Value)
			return true
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 386 | Upvalues: v2 (copy), v3 (copy) ]]
			local v1 = v2.GetByName(p3)
			if not v3.GetEmptyMutationSlot(p2) then
				return "NoEmptyMutationSlot"
			end
			if not (v1.TargetMutationType or v1.SpecificPullTable) then
				return "WrongItem"
			end
			local v22 = false
			if v1.SpecificPullTable then
				for v32, v4 in v1.SpecificPullTable do
					local v5 = v3.HasMutation(p2, v4)
					v22 = v5
					if v5 then
						break
					end
				end
			end
			if v22 then
				return "AlreadyHasMutation"
			end
			if v1.TargetMutationType and v1.TargetMutationType == "Wings" then
				if v3.GetMutationOfType(p2, "Wings") then
					return "AlreadyHasWingMutation"
				end
			else
				if not v1.TargetMutationType then
					return true
				end
				if not next((v3.GetPotentialRandomMutationOfType(v1.TargetMutationType, p2))) then
					return "NoPossibleMutations"
				end
			end
			return true
		end
	},
	Mutation = {
		Run = function(p1, p2, p3) --[[ Run | Line: 433 | Upvalues: v2 (copy), v3 (copy), v9 (copy), v12 (copy) ]]
			local v1 = v2.GetByName(p3)
			local v22 = v3.GetEmptyMutationSlot(p2)
			if not v22 then
				return
			end
			local v32 = v3.GetMutation(v1.TargetMutation)
			local v4 = p1:GetItemValue(p3)
			if v4.Value <= 0 then
				return
			end
			v4.Value = v4.Value - 1
			v22.Value = v32.Name
			v22.Level.Value = 1
			if v32.Type == "Wings" then
				v9.RefreshAnimal(p1, p2)
			end
			v12.NotifyPlayer(p1.Player, "GaveMutation", p2.Name, v32.Name)
			return true
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 458 | Upvalues: v2 (copy), v3 (copy) ]]
			local v1 = v2.GetByName(p3)
			if not v3.GetEmptyMutationSlot(p2) then
				return "NoEmptyMutationSlot"
			end
			local v22 = v3.GetMutation(v1.TargetMutation)
			if not v22 then
				return "WrongItem"
			end
			if v22.Type == "Wings" and v3.GetMutationOfType(p2, "Wings") then
				return "AlreadyHasWingMutation"
			else
				return true
			end
		end
	},
	RandomPattern = {
		Run = function(p1, p2, p3) --[[ Run | Line: 481 | Upvalues: v13 (copy), v12 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
				return
			end
			local v2 = v13.GetRandomPattern(p2.Species.Value, nil, {
				BigSpots = 1
			}).Name
			local v3 = p2.Patterns:FindFirstChild(v2)
			if v3 then
				v1.Value = v1.Value - 1
				v3.Value = v2
				v12.NotifyPlayer(p1.Player, "RandomTrait", p2.Name, v2)
				return true
			end
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 499 | Upvalues: v6 (copy), v2 (copy), v14 (copy) ]]
			local _, v1 = v6.GetTotalTraits(p2)
			local v22 = v2.GetByName(p2.Species.Value)
			if v1.Patterns and (v22 and v22.MaxTraits and v22.MaxTraits.Pattern or v14.MaxPatternsPerSlot) <= v1.Patterns then
				return "HasMaxTrait"
			else
				return true
			end
		end
	},
	UpliftedWings = {
		Run = function(p1, p2, p3) --[[ Run | Line: 511 | Upvalues: v12 (copy), v9 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
				return
			end
			v1.Value = v1.Value - 1
			p2.UpliftedWings.Value = p3 == "LiftedWingPotion"
			v12.NotifyPlayer(p1.Player, "SetUpliftedWings", p2.UpliftedWings.Value)
			v9.RefreshAnimal(p1, p2)
			return true
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 525 | Upvalues: v3 (copy) ]]
			if not v3.GetMutationOfType(p2, "Wings") then
				return "HasNoWingMutation"
			end
			if p3 == "LiftedWingPotion" then
				if p2.UpliftedWings.Value then
					return "AlreadyHasUpliftedWings"
				end
			elseif not p2.UpliftedWings.Value then
				return "DoesNotHaveUpliftedWings"
			end
			return true
		end
	},
	Infertility = {
		Run = function(p1, p2, p3) --[[ Run | Line: 543 | Upvalues: v12 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				v1.Value = v1.Value - 1
				p2.Infertile.Value = true
				v12.NotifyPlayer(p1.Player, "GaveInfertility")
				return true
			end
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 555 ]]
			if p2.Infertile.Value then
				return "AlreadyInfertile"
			else
				return true
			end
		end
	},
	InstantFoal = {
		Run = function(p1, p2, p3) --[[ Run | Line: 563 | Upvalues: v12 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				v1.Value = v1.Value - 1
				p2.LastBreed.Value = 0
				v12.NotifyPlayer(p1.Player, "InstantFoal")
				return true
			end
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 575 | Upvalues: v6 (copy) ]]
			if p2.Child.Value == "" then
				return "NoChild"
			end
			if v6.GetBirthTimeLeft(p1, p2) <= 0 then
				return "NoBirthCooldownLeft"
			else
				return true
			end
		end
	},
	GenderSwap = {
		Run = function(p1, p2, p3) --[[ Run | Line: 586 | Upvalues: v6 (copy), v12 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
				return
			end
			v1.Value = v1.Value - 1
			if v6.GetBreedCooldown(p1, p2) == 0 then
				p2.LastBreed.Value = workspace:GetServerTimeNow() - 80000
			end
			p2.Gender.Value = if p2.Gender.Value == "Male" then "Female" else "Male"
			v12.NotifyPlayer(p1.Player, "GenderSwap")
			return true
		end,
		Check = function(p1, p2) --[[ Check | Line: 605 | Upvalues: v6 (copy) ]]
			if p2.Child.Value ~= "" then
				return "HasChild"
			end
			if v6.GetBirthTimeLeft(p1, p2) > 0 then
				return "IsOnBirthCooldown"
			end
			if p2.Gender.Value == "Both" then
				return "AlreadyBigender"
			end
			if p2.Infertile.Value then
				return "AlreadyInfertile"
			else
				return true
			end
		end
	},
	Bigender = {
		Run = function(p1, p2, p3) --[[ Run | Line: 622 | Upvalues: v12 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				v1.Value = v1.Value - 1
				p2.Gender.Value = "Both"
				v12.NotifyPlayer(p1.Player, "GenderSwap")
				return true
			end
		end,
		Check = function(p1, p2) --[[ Check | Line: 634 | Upvalues: v6 (copy) ]]
			if p2.Child.Value ~= "" then
				return "HasChild"
			end
			if v6.GetBirthTimeLeft(p1, p2) > 0 then
				return "IsOnBirthCooldown"
			end
			if p2.Gender.Value == "Both" then
				return "AlreadyBigender"
			end
			if p2.Infertile.Value then
				return "AlreadyInfertile"
			else
				return true
			end
		end
	},
	GrowthPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 652 | Upvalues: v12 (copy), v9 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				v1.Value = v1.Value - 1
				p2.Age.Value = 100
				p2.CannotAge.Value = false
				v12.NotifyPlayer(p1.Player, "GrowthPotion")
				v9.RefreshAnimal(p1, p2)
				return true
			end
		end,
		Check = function(p1, p2) --[[ Check | Line: 667 ]]
			if p2.Age.Value == 100 then
				return "AlreadyMaxAge"
			else
				return true
			end
		end
	},
	YouthPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 676 | Upvalues: v12 (copy), v9 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				v1.Value = v1.Value - 1
				p2.Age.Value = 0
				p2.CannotAge.Value = true
				v12.NotifyPlayer(p1.Player, "YouthPotion")
				v9.RefreshAnimal(p1, p2)
				return true
			end
		end,
		Check = function(p1, p2) --[[ Check | Line: 691 ]]
			if p2.Age.Value == 0 and p2.CannotAge.Value == true then
				return "AlreadyForeverYouth"
			else
				return true
			end
		end
	},
	MiniPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 701 | Upvalues: v12 (copy), v9 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
			else
				v1.Value = v1.Value - 1
				p2.DownScaled.Value = true
				v12.NotifyPlayer(p1.Player, "MiniPotion")
				v9.RefreshAnimal(p1, p2)
				return true
			end
		end,
		Check = function(p1, p2) --[[ Check | Line: 715 ]]
			if p2.DownScaled.Value == true then
				return "AlreadyDownScaled"
			else
				return true
			end
		end
	},
	TrainingPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 725 | Upvalues: v12 (copy), v18 (copy), v16 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
				return
			end
			v1.Value = v1.Value - 1
			v12.NotifyPlayer(p1.Player, "YouthPotion")
			for v2, v3 in p2:FindFirstChild("Upgrades"):GetChildren() do
				if not (v3.Value >= v18[v3.Name].MaxLevel) then
					local v4 = v16.GetNextLevelExperience(v3.Value, "Stats")
					local Experience = v3.Experience
					Experience.Value = Experience.Value + v4
					v16.UpdateLevel(p2, v3.Name, v4)
				end
			end
			return true
		end,
		Check = function(p1, p2) --[[ Check | Line: 744 | Upvalues: v18 (copy) ]]
			local v1 = true
			for v2, v3 in p2:FindFirstChild("Upgrades"):GetChildren() do
				if v3.Value < v18[v3.Name].MaxLevel then
					v1 = false
					break
				end
			end
			if v1 then
				return "MaxLevel"
			else
				return true
			end
		end
	},
	TrophyUpgradePotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 761 | Upvalues: v3 (copy), v9 (copy) ]]
			local _, v1 = v3.GetMutationOfName(p2, "Trophy")
			if not v1 then
				return
			end
			local v2 = p1:GetItemValue(p3)
			if v2.Value <= 0 then
			else
				v2.Value = v2.Value - 1
				local Level = v1.Level
				Level.Value = Level.Value + 1
				v9.RefreshAnimal(p1, p2)
				return true
			end
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 779 | Upvalues: v2 (copy), v3 (copy) ]]
			local v1 = v2.GetByName(p3)
			local _, v22 = v3.GetMutationOfName(p2, "Trophy")
			if not v22 then
				return "NoMutationFound", v1
			end
			if v22.Level.Value >= 5 then
				return "MaxMutationLevel"
			else
				return true
			end
		end
	},
	HornGrowthPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 795 | Upvalues: v17 (copy), v9 (copy) ]]
			local v1 = v17.GetRandomHorn(p2.Species.Value)
			if not v1 or v1.Name == "Nothing" then
				return
			end
			local v2 = p1:GetItemValue(p3)
			if v2.Value <= 0 then
			else
				v2.Value = v2.Value - 1
				p2.MiscCosmetics.Horn.Value = v1.Name
				v9.RefreshAnimal(p1, p2)
				return true
			end
		end,
		Check = function(p1, p2, p3) --[[ Check | Line: 817 | Upvalues: v2 (copy) ]]
			local t = {}
			for v1, v22 in v2.GetByType(p2.Species.Value, "Animals").Traits.Horns do
				if not table.find(t, v22.Name) then
					table.insert(t, v22.Name)
				end
			end
			if #t == 1 and t[1] == "Nothing" then
				return "NoHornsFound"
			end
			if p2.MiscCosmetics.Horn.Value == "Nothing" then
				return true
			else
				return "AlreadyHasHorn"
			end
		end
	},
	ExternalBonesTraitPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 842 | Upvalues: v9 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
				return
			end
			v1.Value = v1.Value - 1
			local ExternalBones = p2.Cosmetics:FindFirstChild("ExternalBones") or Instance.new("BoolValue")
			ExternalBones.Name = "ExternalBones"
			ExternalBones.Value = true
			ExternalBones.Parent = p2.Cosmetics
			v9.RefreshAnimal(p1, p2)
		end,
		Check = function(p1, p2) --[[ Check | Line: 856 ]]
			if p2.Species.Value ~= "Ghoulsteed" then
				return "NotGhoulsteed"
			end
			if p2.Cosmetics:FindFirstChild("ExternalBones") then
				return "AlreadyHasExternalBones"
			else
				return true
			end
		end
	},
	LegoWingPotion = {
		Run = function(p1, p2, p3) --[[ Run | Line: 868 | Upvalues: v3 (copy), v6 (copy), v7 (copy), v9 (copy) ]]
			local v1 = p1:GetItemValue(p3)
			if v1.Value <= 0 then
				return
			end
			v1.Value = v1.Value - 1
			local v2 = v3.GetEmptyMutationSlot(p2)
			if not v2 and (v6.IsToyHorse(p2) and #p2.Mutations:GetChildren() < v6.GetMaxMutationSlots(p2)) then
				local v32 = v7.CreateDataValueFromType("Mutations")
				v32.Name = v7.getIndexOfValue(p2.Mutations)
				v32.Value = ""
				v32.Level.Value = 1
				v32.Parent = p2.Mutations
				v2 = v32
			end
			if not v2 then
				return
			end
			v2.Value = "LEGOWings"
			v2.Level.Value = 5
			local LEGOWingAttachment = p2.Cosmetics:FindFirstChild("LEGOWingAttachment") or Instance.new("BoolValue")
			LEGOWingAttachment.Name = "LEGOWingAttachment"
			LEGOWingAttachment.Value = true
			LEGOWingAttachment.Parent = p2.Cosmetics
			v9.RefreshAnimal(p1, p2)
			return true
		end,
		Check = function(p1, p2) --[[ Check | Line: 900 | Upvalues: v6 (copy), v3 (copy) ]]
			if not v6.IsToyHorse(p2) then
				return "LegoWingPotionNotToyHorse"
			end
			if v3.GetMutationOfName(p2, "LEGOWings") then
				return "AlreadyHasToyWings"
			end
			if v3.GetMutationOfType(p2, "Wings") then
				return "AlreadyHasToyWings"
			end
			if v3.GetEmptyMutationSlot(p2) or not (#p2.Mutations:GetChildren() >= v6.GetMaxMutationSlots(p2)) then
				return true
			else
				return "NoEmptyMutationSlot"
			end
		end
	},
	Wheel = {
		Run = function(p1, p2, p3) --[[ Run | Line: 919 | Upvalues: v15 (copy), v2 (copy), v11 (copy) ]]
			local v1 = os.date("!*t")
			if not v15.IsTestGame() and (not p1:HasPermission("Developer") and (v1.month ~= 4 or v1.day ~= 1)) then
				return
			end
			local v22 = p1:GetItemValue(v2.GetByName(p3).Name)
			if v22.Value <= 0 then
			else
				v22.Value = v22.Value - 1
				v11.SpawnCar(p1.Player)
				return true
			end
		end,
		Check = function(p1) --[[ Check | Line: 937 | Upvalues: v15 (copy) ]]
			local v1 = os.date("!*t")
			if v15.IsTestGame() or (p1:HasPermission("Developer") or v1.month == 4 and v1.day == 1) then
				return true
			else
				return "WrongItem"
			end
		end
	}
}
function t.GetConsumableType(p1) --[[ GetConsumableType | Line: 947 | Upvalues: v2 (copy), t4 (copy) ]]
	local v1 = if type(p1) == "table" and p1 then p1 else v2.GetByName(p1)
	return t4[v1.Name] or t4[v1.ConsumableType]
end
function t.CanGiveConsumable(p1) --[[ CanGiveConsumable | Line: 953 | Upvalues: v19 (copy), t (copy), v6 (copy), t4 (copy), v8 (copy), v15 (copy), Sonar (copy) ]]
	p1.Data = p1.Data or {}
	p1.Slot = typeof(p1.Slot) == "Instance" and p1.Slot or v19:GetAnimalSlot(p1.Slot)
	local v3 = t.GetConsumableType(p1.Item)
	if not v3 then
		return
	end
	if v6.IsToyHorse(p1.Slot) and (v3 ~= t4.SkipGestation and v3 ~= t4.LegoWingPotion) then
		if not p1.Notify then
			return "ToyHorseCannotUsePotion"
		end
		v8.NotifyIssue("ToyHorseCannotUsePotion")
		return "ToyHorseCannotUsePotion"
	elseif v15.IsMarketWorld() and Sonar("AuctionService").IsItemInAuction(p1.Slot) then
		if not p1.Notify then
			return "InAuction"
		end
		v8.NotifyIssue("InAuction")
		return "InAuction"
	else
		local v5, v62 = v3.Check(v19, p1.Slot, p1.Item, table.unpack(p1.Data))
		if v5 == true then
			return true
		end
		if p1.Notify then
			v8.NotifyIssue(v5, v62)
		end
		return v5, v62
	end
end
function t.GiveWater(p1) --[[ GiveWater | Line: 988 | Upvalues: t (copy), v5 (copy) ]]
	p1.Item = "WaterBucket"
	if not t.GetConsumableType("FreshWater") then
		return
	end
	if not p1.PromptDoNotCheck and t.CanGiveConsumable(p1) ~= true then
		return
	end
	return v5.GetRemoteFunction("GiveWaterRemote"):InvokeServer(p1.Slot.Name, "FreshWater")
end
function t.GiveConsumable(p1) --[[ GiveConsumable | Line: 1005 | Upvalues: v19 (copy), t (copy), v5 (copy) ]]
	p1.Data = p1.Data or {}
	p1.Slot = typeof(p1.Slot) == "Instance" and p1.Slot or v19:GetAnimalSlot(p1.Slot)
	local v3 = t.GetConsumableType(p1.Item)
	if not v3 then
		return
	end
	if not p1.PromptDoNotCheck and t.CanGiveConsumable(p1) ~= true then
		return
	end
	if (p1.Prompt or p1.PromptDoNotCheck) and v3.ClientPrompt then
		if p1.OnClientPrompt then
			p1.OnClientPrompt()
		end
		return v3.ClientPrompt(p1.Slot, p1.Item, table.unpack(p1.Data))
	end
	return v5.GetRemoteFunction("GiveConsumableRemote"):InvokeServer(p1.Slot.Name, p1.Item, table.unpack(p1.Data))
end
function t.AddFunction(p1) --[[ AddFunction | Line: 1031 | Upvalues: t4 (copy) ]]
	t4[p1.Type][p1.Name] = p1.Function
end
function t.GetMostAppropriateGestationFood(p1, p2) --[[ GetMostAppropriateGestationFood | Line: 1036 | Upvalues: v6 (copy), t2 (copy) ]]
	local v1 = v6.GetBirthTimeLeft(p1, p2)
	local t = {}
	for v2, v3 in t2 do
		local v4 = p1:GetItemValue(v2)
		if v4 and not (v4.Value <= 0) then
			t[#t + 1] = {
				Gestation = v3.Gestation,
				ItemValue = v4
			}
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 1055 | Upvalues: v1 (copy) ]]
		local v2 = math.abs(p1.Gestation - v1)
		return v2 < math.abs(p2.Gestation - v1)
	end)
	local v5 = t[1]
	if v5 then
		return v5.ItemValue.Name
	end
end
function t.Init(p1) --[[ Init | Line: 1067 | Upvalues: v2 (copy), t (copy), t2 (copy), v1 (copy), v5 (copy), v4 (copy), v10 (copy), Sonar (copy), v6 (copy), t4 (copy), v8 (copy), t3 (copy) ]]
	for k, v in pairs(v2.GetAll()) do
		if v.ToolType == "Consumable" then
			if v.Gestation then
				v.ConsumableType = "SkipGestation"
			elseif v.Duration then
				v.ConsumableType = "Boost"
			end
			if not t.GetConsumableType(v) then
				warn("No consumable type can be found for", v.Name)
			end
			if v.Gestation then
				t2[k] = v
			end
		end
	end
	if v1 then
		v5.GetRemoteFunction("GiveWaterRemote").OnServerInvoke = function(p1, p2, p3, ...) --[[ Line: 1091 | Upvalues: v4 (ref), v2 (ref), t (ref), v10 (ref), Sonar (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			local v22 = v2.GetByName(p3)
			local v3 = v1:GetAnimalSlot(p2)
			local v42 = t.GetConsumableType(p3)
			if not v42 then
				return
			end
			if v42.Check(v1, v3, "WaterBucket") ~= true then
				return
			end
			local v6, v7, v8
			if v22 then
				v6 = v22.ItemType
				if v6 then
					v7 = p1
					v8 = v3
				else
					v7 = p1
					v6 = "Potions"
					v8 = v3
				end
			else
				v7 = p1
				v6 = "Potions"
				v8 = v3
			end
			v10.ReportResourceEvent(v7, "Sink", v6, p3, "Consumable", 1)
			local t2 = {
				{
					Key = "UpgradeType",
					Value = p3
				}
			}
			local t3 = {
				Key = "Species"
			}
			local v102, v11
			if v8 and v8.Species then
				v102 = v8.Species.Value
				if v102 then
					v11 = p1
				else
					v102 = "Unknown"
					v11 = p1
				end
			else
				v102 = "Unknown"
				v11 = p1
			end
			t3.Value = v102
			t2[2] = t3
			v10.ReportDesignEvent(v11, "HorseUpgraded", t2, 1)
			Sonar("BondInteractionService").CompleteDelivery(v1.Player, {
				Name = "WaterBucket"
			})
			return true
		end
		v5.GetRemoteFunction("GiveConsumableRemote").OnServerInvoke = function(p1, p2, p3, ...) --[[ Line: 1117 | Upvalues: v4 (ref), t (ref), v6 (ref), t4 (ref), v2 (ref), v10 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			local v22 = v1:GetAnimalSlot(p2)
			local LastPing = v1.LastPing
			if LastPing and workspace:GetServerTimeNow() - 0.25 < LastPing then
				return
			end
			v1.LastPing = workspace:GetServerTimeNow()
			if not v22 then
				return
			end
			local v3 = t.GetConsumableType(p3)
			if not v3 then
				return
			end
			if v6.IsToyHorse(v22) and (v3 ~= t4.SkipGestation and v3 ~= t4.LegoWingPotion) then
				return
			end
			if not v1:HasEnoughOfItem(1, p3) then
				return
			end
			if v3.Check(v1, v22, p3, ...) ~= true then
				return
			end
			local v42 = v1:GetItemValue(p3)
			local v5, v62
			if v42 then
				v5 = v42.Value
				if v5 then
					v62 = v22
				else
					v62 = v22
					v5 = 0
				end
			else
				v62 = v22
				v5 = 0
			end
			local v7 = v3.Run(v1, v62, p3, ...)
			if v7 then
				if v42 then
					local v8 = v5 - v42.Value
					if v8 > 0 then
						local v9 = v2.GetByName(p3)
						local v11, v12
						if v9 then
							v11 = v9.ItemType
							if v11 then
								v12 = p1
							else
								v12 = p1
								v11 = "Potions"
							end
						else
							v12 = p1
							v11 = "Potions"
						end
						v10.ReportResourceEvent(v12, "Sink", v11, p3, "Consumable", v8)
					end
				end
				local t2 = {
					{
						Key = "UpgradeType",
						Value = p3
					}
				}
				local t3 = {
					Key = "Species"
				}
				local v14, v15
				if v62 and v62.Species then
					v14 = v62.Species.Value
					if v14 then
						v15 = p1
					else
						v14 = "Unknown"
						v15 = p1
					end
				else
					v14 = "Unknown"
					v15 = p1
				end
				t3.Value = v14
				t2[2] = t3
				v10.ReportDesignEvent(v15, "HorseUpgraded", t2, 1)
			end
			return v7
		end
		v5.GetRemoteFunction("FeedOtherPlayerHorseRemote").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 1172 | Upvalues: v4 (ref), t (ref), t4 (ref), v6 (ref), v2 (ref), v10 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = game.Players:GetPlayerByUserId(p2)
			if not v22 then
				return
			end
			local v3 = v4.getWrapperFromPlayer(v22)
			if not v3 then
				return
			end
			local v42 = v3:GetAnimalSlot(p3)
			if not v42 then
				return
			end
			local LastPing = v1.LastPing
			if LastPing and workspace:GetServerTimeNow() - 0.25 < LastPing then
				return
			end
			v1.LastPing = workspace:GetServerTimeNow()
			local v5 = t.GetConsumableType(p4)
			if not v5 or v5 ~= t4.SkipGestation then
				return
			end
			if v6.IsToyHorse(v42) then
				return
			end
			if v5.Check(v3, v42, p4, 1) ~= true then
				return
			end
			if not v1:HasEnoughOfItem(1, p4) then
				return
			end
			local v62 = v2.GetByName(p4)
			if not (v62 and v62.Gestation) then
				return
			end
			local v7 = v6.GetBirthTimeLeft(v3, v42)
			if v7 <= 0 then
				return
			end
			local v8 = v1:GetItemValue(v62.Name)
			local v12 = v1:GetAmountToUse(v8, (math.min(1, math.ceil(v7 / v62.Gestation), v8.Value)))
			if not (v12 <= 0) then
				v8.Value = v8.Value - v12
				local LastBreed = v42.LastBreed
				LastBreed.Value = LastBreed.Value - v62.Gestation * v12
				v10.ReportResourceEvent(p1, "Sink", v62.ItemType or "Potions", p4, "FeedOtherHorse", v12)
				v1:IncrementStat({
					Type = "HorsesFed",
					Amount = 1
				})
				v1:IncrementStat({
					Type = "FeedOtherHorse",
					Amount = 1
				})
				v1:IncrementMission({
					Type = "FeedPlayerHorse",
					Amount = 1,
					Data = { v42.Species.Value, p4 }
				})
				return true
			end
		end
	else
		v8.AddResponses(t3)
	end
end
t:Init()
return t