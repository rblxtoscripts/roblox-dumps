-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("StorageUtils")
local t = {}
local tbl = {}
tbl.TestModifier = {
	Type = "Buff",
	StaminaDrain = -3,
	Unblockable = true,
	DefaultDuration = 1,
	ModifierTargets = { "Damage" },
	OnGet = function(p1, p2, p3, p4) --[[ Line: 40 | Upvalues: tbl (copy) ]]
		if p1 == "Damage" then
			return p2 * tbl.TestModifier.DamageMultiplier
		else
			return p2
		end
	end,
	OnServerTick = function(p1, p2) --[[ Line: 49 ]] end,
	OnClientTick = function(p1, p2) --[[ Line: 51 ]] end,
	OnAdd = function(p1, p2) --[[ Line: 56 ]] end,
	OnRemove = function(p1, p2) --[[ Line: 58 ]] end
}
tbl.BoostLongModifier = {
	Image = "rbxassetid://16034920003",
	AttributeIsValue = true,
	DisplayDescriptor = "",
	StarsMultiplier = 0.5,
	UIStrokeColor = Color3.fromRGB(85, 0, 0),
	TargetStats = { "StarsMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 75 | Upvalues: tbl (copy) ]]
		return p2 + tbl.BoostLongModifier[p1] * p3
	end
}
tbl.BoostShortModifier = {
	Image = "rbxassetid://16034920003",
	AttributeIsValue = true,
	DisplayDescriptor = "",
	StarsMultiplier = 0.25,
	UIStrokeColor = Color3.fromRGB(85, 0, 0),
	TargetStats = { "StarsMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 92 | Upvalues: tbl (copy) ]]
		return p2 + tbl.BoostShortModifier[p1] * p3
	end
}
tbl.LimberMutation = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	Speed = 1.1,
	ModifierTargets = { "Speed" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 110 | Upvalues: tbl (copy) ]]
		return p2 * tbl.LimberMutation.Speed
	end
}
tbl.LungsMutation = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	Stamina = 1.25,
	ModifierTargets = { "Stamina" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 128 | Upvalues: tbl (copy) ]]
		return p2 * tbl.LungsMutation.Stamina
	end
}
tbl.MuscleMutation = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	HarvestStrength = 1.1,
	ModifierTargets = { "HarvestStrength" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 146 | Upvalues: tbl (copy) ]]
		return p2 * tbl.MuscleMutation.HarvestStrength
	end
}
tbl.JumpMutation = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	JumpHeight = 1.1,
	ModifierTargets = { "JumpHeight" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 164 | Upvalues: tbl (copy) ]]
		return p2 * tbl.JumpMutation.JumpHeight
	end
}
tbl.TurnMutation = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	TurnSpeed = 1.5,
	ModifierTargets = { "TurnSpeed" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 182 | Upvalues: tbl (copy) ]]
		return p2 * tbl.TurnMutation.TurnSpeed
	end
}
tbl.DoubleStamina = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	ModifierTargets = { "Stamina" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 200 ]]
		return p2 * 2
	end
}
tbl.VeryFertile = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	GestationTimeMultiplier = 0.75,
	ModifierTargets = { "GestationTimeMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 218 | Upvalues: tbl (copy) ]]
		return p2 * tbl.VeryFertile[p1]
	end
}
tbl.Mutated = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	MutationInheritanceMultiplier = 1.25,
	ModifierTargets = { "MutationInheritanceMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 236 | Upvalues: tbl (copy) ]]
		return p2 * tbl.Mutated[p1]
	end
}
tbl.Intelligence = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	ModifierTargets = { "AgilityExperience", "StrengthExperience", "FertilityExperience", "JumpExperience", "BondExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 257 ]]
		return p2 * 1.25
	end
}
tbl.CloseBond = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	ModifierTargets = { "Bond" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 274 ]]
		return p2 * 1.25
	end
}
tbl.DoubleJump = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	ModifierTargets = {}
}
tbl.TraitBoostPotion = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	TraitInheritanceMultiplier = 1.25,
	ModifierTargets = { "TraitInheritanceMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 305 | Upvalues: tbl (copy) ]]
		return p2 * tbl.TraitBoostPotion.TraitInheritanceMultiplier
	end
}
tbl.MustangOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	GestationTimeMultiplier = 0.85,
	ModifierTargets = { "GestationTimeMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 323 | Upvalues: tbl (copy) ]]
		return p2 * tbl.MustangOrigin[p1]
	end
}
tbl.AlphaOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	GestationTimeMultiplier = 0.5,
	FertilityExperience = 1.5,
	ModifierTargets = { "GestationTimeMultiplier", "FertilityExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 341 | Upvalues: tbl (copy) ]]
		return p2 * tbl.AlphaOrigin[p1]
	end
}
tbl.MutatedOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	GestationTimeMultiplier = 5,
	Stamina = 1.75,
	AgilityExperience = 1.25,
	ModifierTargets = { "GestationTimeMultiplier", "Stamina", "AgilityExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 361 | Upvalues: tbl (copy) ]]
		return p2 * tbl.MutatedOrigin[p1]
	end
}
tbl.RearedOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	Stamina = 1.15,
	ModifierTargets = { "Stamina" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 378 | Upvalues: tbl (copy) ]]
		return p2 * tbl.RearedOrigin[p1]
	end
}
tbl.PurebredOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	Stamina = 1.5,
	AgilityExperience = 1.5,
	ModifierTargets = { "Stamina", "AgilityExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 397 | Upvalues: tbl (copy) ]]
		return p2 * tbl.PurebredOrigin[p1]
	end
}
tbl.ImportedOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	HarvestStrength = 1.5,
	StrengthExperience = 1.5,
	ModifierTargets = { "HarvestStrength", "StrengthExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 416 | Upvalues: tbl (copy) ]]
		return p2 * tbl.ImportedOrigin[p1]
	end
}
tbl.SpiritOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	AgilityExperience = 1.1,
	StrengthExperience = 1.1,
	FertilityExperience = 1.1,
	JumpExperience = 1.1,
	ModifierTargets = { "AgilityExperience", "JumpExperience", "StrengthExperience", "FertilityExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 440 | Upvalues: tbl (copy) ]]
		return p2 * tbl.SpiritOrigin[p1]
	end
}
tbl.DevOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	AgilityExperience = 1.5,
	StrengthExperience = 1.5,
	JumpExperience = 1.5,
	ModifierTargets = { "AgilityExperience", "JumpExperience", "StrengthExperience" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 461 | Upvalues: tbl (copy) ]]
		return p2 * tbl.DevOrigin[p1]
	end
}
tbl.DeityOrigin = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	HarvestStrength = 1.1,
	GestationTimeMultiplier = 0.9,
	JumpHeight = 1.1,
	Stamina = 2,
	ModifierTargets = { "HarvestStrength", "GestationTimeMultiplier", "JumpHeight", "Stamina" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 487 | Upvalues: tbl (copy) ]]
		if p1 == "UnlimitedStamina" then
			return true
		else
			return p2 * tbl.DeityOrigin[p1]
		end
	end
}
tbl.ElderModifier = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 9000000000,
	Stamina = 1.25,
	Speed = 1.25,
	FlyStaminaMultiplier = 1.25,
	ModifierTargets = { "Stamina", "Speed", "FlyStaminaMultiplier" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 514 | Upvalues: tbl (copy) ]]
		return p2 * tbl.ElderModifier[p1]
	end
}
local v2 = v1.GetConfig("Events")()
local v4 = v2.EventsData[v2.Event]
if v4 then
	local EventCurrencyImage = v4.Data.EventCurrencyImage
	local EventCurrencyName = v4.Data.EventCurrencyName;
	("%*Multiplier"):format(EventCurrencyName);
	("%*BoostPerPurchase"):format(EventCurrencyName)
	if EventCurrencyName then
		for v5, v6 in v4.Products do
			if v6.ProductType == "CurrencyBoost" then
				local t2 = {}
				for v8, v9 in v6.Stats do
					t2[v8] = v9
				end
				t2.AttributeIsValue = true
				t2.Image = EventCurrencyImage
				t2.TargetStats = v6.TargetStats
				function t2.OnGet(p1, p2, p3) --[[ Line: 548 | Upvalues: t2 (copy) ]]
					return p2 + t2[p1] * p3
				end
				tbl[v6.Name .. "Modifier"] = t2
			end
		end
	end
end
for k, v in pairs(tbl) do
	v.Name = k
	if not v.Image or #v.Image <= 0 then
		v.IsDefaultImage = true
		if v.Type == "Buff" or v.Type then
			v.Image = "rbxassetid://14582849209"
		end
	end
	if v.Image and tonumber(v.Image) then
		v.Image = "rbxassetid://" .. v.Image
		v.ImageSize = v.ImageSize or t[v.Image]
	end
end
return tbl