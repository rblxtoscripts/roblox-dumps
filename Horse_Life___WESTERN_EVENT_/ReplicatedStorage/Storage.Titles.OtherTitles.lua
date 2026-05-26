-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Sonar"))("Constants")
return {
	{
		Title = "Divine Tamer",
		Category = "Other",
		Description = "Tame 20,000 Horses!",
		Color = Color3.fromRGB(255, 188, 149)
	},
	{
		Title = "Growing Herd",
		Category = "Other",
		Description = "Foal 1,000 Horses!",
		Color = Color3.fromRGB(255, 149, 177)
	},
	{
		Title = "Gaming Addict",
		Category = "Other",
		Description = "Play 250 hours!",
		Color = Color3.fromRGB(199, 153, 255)
	},
	{
		Title = "Loyal",
		Category = "Other",
		Description = "Play 100 days!",
		Color = Color3.fromRGB(255, 216, 138)
	},
	{
		Title = "Extractor",
		Category = "Other",
		Description = "Harvest 10,000 Nodes!",
		Color = Color3.fromRGB(165, 255, 149)
	},
	{
		Title = "Trail Blazer",
		Category = "Other",
		Description = "Complete 100 Races!",
		Color = Color3.fromRGB(255, 137, 98)
	},
	{
		Title = "Legend",
		Category = "Other",
		Description = "Spend 100,000 Coins!",
		Color = Color3.fromRGB(150, 58, 255)
	},
	{
		Title = "Warden",
		Category = "Other",
		Description = "Spend 1,000,000 Coins!",
		Color = Color3.fromRGB(101, 255, 237)
	},
	{
		Title = "Ghoulish",
		Category = "Other",
		Description = "Own the Ghoulsteed breeding license!",
		Color = Color3.fromRGB(85, 255, 142),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 74 ]]
				return p1:GetItemValue("GhoulsteedBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 80 ]]
				return p1:GetItemValue("GhoulsteedBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Undead",
		Category = "Other",
		Description = "Own the Hauntmare breeding license!",
		Color = Color3.fromRGB(85, 255, 142),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 95 ]]
				return p1:GetItemValue("HauntmareBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 101 ]]
				return p1:GetItemValue("HauntmareBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Holly",
		Category = "Other",
		Description = "Own the Hollyhoof breeding license!",
		Color = Color3.fromRGB(177, 18, 21),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 116 ]]
				return p1:GetItemValue("HollyhoofBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 122 ]]
				return p1:GetItemValue("HollyhoofBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Frosty",
		Category = "Other",
		Description = "Own the Alces breeding license!",
		Color = Color3.fromRGB(156, 215, 236),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 137 ]]
				return p1:GetItemValue("AlcesBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 143 ]]
				return p1:GetItemValue("AlcesBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Scrumptious",
		Category = "Other",
		Description = "Own the Pastrequine breeding license!",
		Color = Color3.fromRGB(255, 151, 210),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 158 ]]
				return p1:GetItemValue("PastrequineBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 164 ]]
				return p1:GetItemValue("PastrequineBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Heartbroken",
		Category = "Other",
		Description = "Own the Heartbane breeding license!",
		Color = Color3.fromRGB(255, 151, 210),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 179 ]]
				return p1:GetItemValue("HeartbaneBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 185 ]]
				return p1:GetItemValue("HeartbaneBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Eggstravagant",
		Category = "Other",
		Description = "Own the Wolper breeding license!",
		Color = Color3.fromRGB(255, 237, 101),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 200 ]]
				return p1:GetItemValue("WolperBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 206 ]]
				return p1:GetItemValue("WolperBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Clown",
		Category = "Other",
		Description = "Own the Carousel breeding license!",
		Color = Color3.fromRGB(255, 66, 132),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 221 ]]
				return p1:GetItemValue("CarouselBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 227 ]]
				return p1:GetItemValue("CarouselBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Crystalized",
		Category = "Other",
		Description = "Own the Crystallion breeding license!",
		Color = Color3.fromRGB(0, 130, 255),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 242 ]]
				return p1:GetItemValue("CrystallionBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 248 ]]
				return p1:GetItemValue("CrystallionBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "BeeCatcher",
		Category = "Other",
		Description = "Own the Honeytrot breeding license!",
		Color = Color3.fromRGB(239, 233, 0),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 263 ]]
				return p1:GetItemValue("HoneytrotBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 269 ]]
				return p1:GetItemValue("HoneytrotBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Cosmic Entity",
		Category = "Other",
		Description = "Own the Equenari breeding license!",
		Color = Color3.fromRGB(0, 242, 255),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 284 ]]
				return p1:GetItemValue("EquenariBreedingLicense").Value
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 290 ]]
				return p1:GetItemValue("EquenariBreedingLicense"):GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Equestrian Elite",
		Category = "Other",
		Description = "Be Top 100 on the Tame Leaderboard!",
		Color = Color3.fromRGB(97, 229, 255),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 305 ]]
				local Leaderboard = game.ReplicatedStorage.Leaderboards.Tames.Leaderboard.Value
				local v1, v2 = pcall(function() --[[ Line: 307 | Upvalues: Leaderboard (copy) ]]
					return game.HttpService:JSONDecode(Leaderboard)
				end)
				if not v1 then
					return
				end
				local UserId = p1.Player.UserId
				local v3 = false
				for v4, v5 in v2 do
					if v5.UserId == UserId then
						if v4 <= 100 then
							v3 = true
						end
						break
					end
				end
				if v3 then
					return 1
				else
					return 0
				end
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 329 ]]
				return game.ReplicatedStorage.Leaderboards.Tames.Leaderboard:GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Foal Whisperer",
		Category = "Other",
		Description = "Be Top 100 on the Foal Leaderboard!",
		Color = Color3.fromRGB(255, 189, 83),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 345 ]]
				local Leaderboard = game.ReplicatedStorage.Leaderboards.Foals.Leaderboard.Value
				local v1, v2 = pcall(function() --[[ Line: 347 | Upvalues: Leaderboard (copy) ]]
					return game.HttpService:JSONDecode(Leaderboard)
				end)
				if not v1 then
					return
				end
				local UserId = p1.Player.UserId
				local v3 = false
				for v4, v5 in v2 do
					if v5.UserId == UserId then
						if v4 <= 100 then
							v3 = true
						end
						break
					end
				end
				if v3 then
					return 1
				else
					return 0
				end
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 369 ]]
				return game.ReplicatedStorage.Leaderboards.Foals.Leaderboard:GetPropertyChangedSignal("Value")
			end
		}
	},
	{
		Title = "Fieldmaster",
		Category = "Other",
		Description = "Be Top 100 on the Harvest Leaderboard!",
		Color = Color3.fromRGB(255, 189, 83),
		Requirement = {
			EndGoal = 1,
			Stat = function(p1) --[[ Stat | Line: 385 ]]
				local Leaderboard = game.ReplicatedStorage.Leaderboards.Harvests.Leaderboard.Value
				local v1, v2 = pcall(function() --[[ Line: 387 | Upvalues: Leaderboard (copy) ]]
					return game.HttpService:JSONDecode(Leaderboard)
				end)
				if not v1 then
					return
				end
				local UserId = p1.Player.UserId
				local v3 = false
				for v4, v5 in v2 do
					if v5.UserId == UserId then
						if v4 <= 100 then
							v3 = true
						end
						break
					end
				end
				if v3 then
					return 1
				else
					return 0
				end
			end,
			UpdateSignal = function(p1) --[[ UpdateSignal | Line: 408 ]]
				return game.ReplicatedStorage.Leaderboards.Harvests.Leaderboard:GetPropertyChangedSignal("Value")
			end
		}
	}
}