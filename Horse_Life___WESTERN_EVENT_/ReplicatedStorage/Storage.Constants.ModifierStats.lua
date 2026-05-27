-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("FormatNumber")
return {
	TraitInheritanceMultiplier = {
		DisplayName = "TraitInheritance",
		Image = "rbxassetid://16450269627",
		Color = Color3.fromRGB(255, 185, 207),
		Format = function(p1) --[[ Format | Line: 11 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	MutationInheritanceMultiplier = {
		DisplayName = "MutationInheritance",
		Image = "rbxassetid://16450269627",
		Color = Color3.fromRGB(220, 79, 255),
		Format = function(p1) --[[ Format | Line: 19 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	Speed = {
		Image = "rbxassetid://16450269627",
		Format = function(p1) --[[ Format | Line: 25 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	TurnSpeed = {
		Image = "rbxassetid://16450269627",
		Format = function(p1) --[[ Format | Line: 31 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	HarvestStrength = {
		ForcedDisplayName = "Damage to Forageables",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 39 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	StrengthExperience = {
		DisplayName = "StrengthExperience",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 46 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	GestationTimeMultiplier = {
		DisplayName = "GestationTime",
		Image = "rbxassetid://16190566666",
		Format = function(p1) --[[ Format | Line: 53 | Upvalues: v1 (copy) ]]
			return (if p1 > 1 then "+" else "") .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	FertilityExperience = {
		DisplayName = "FertilityExperience",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 61 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	Stamina = {
		DisplayName = "Stamina",
		Image = "rbxassetid://16190564664",
		Format = function(p1) --[[ Format | Line: 68 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	AgilityExperience = {
		DisplayName = "AgilityExperience",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 75 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	JumpHeight = {
		DisplayName = "JumpHeight",
		Image = "rbxassetid://16190568719",
		Format = function(p1) --[[ Format | Line: 82 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	JumpExperience = {
		DisplayName = "JumpExperience",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 89 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	BondExperience = {
		DisplayName = "BondExperience",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 97 | Upvalues: v1 (copy) ]]
			return "+" .. v1.percentage((p1 - 1) * 100) .. "%"
		end
	},
	UnlimitedStamina = {
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 104 ]]
			return "[+]"
		end
	},
	FlyStaminaMultiplier = {
		DisplayName = "FlyStaminaMultiplier",
		Image = "rbxassetid://16190565520",
		Format = function(p1) --[[ Format | Line: 112 ]]
			return ""
		end
	}
}