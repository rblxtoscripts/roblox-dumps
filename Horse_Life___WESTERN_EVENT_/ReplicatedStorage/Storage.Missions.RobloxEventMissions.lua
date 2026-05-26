-- https://lua.expert/
return {
	{
		Name = "Easy Mission",
		Type = "Tame",
		Amount = 20,
		Description = "Tame 20 Horses of any Species!"
	},
	{
		Name = "Medium Mission",
		Type = "HorseTraining",
		Amount = 12,
		Description = "Complete the Training Course 12 times!"
	},
	{
		Name = "Hard Mission",
		Type = "Tame",
		Amount = 6,
		Description = "Tame 6 Unique Species!",
		Check = function(p1, p2, p3) --[[ Check | Line: 21 ]]
			if not table.find({
				"Equus",
				"Bisorse",
				"Caprine",
				"Horse",
				"Gargoyle",
				"Unicorn",
				"Peryton",
				"Cactaline",
				"Hippocampus",
				"Kelpie",
				"Flora",
				"Fae",
				"Pony",
				"Equenari",
				"Felorse",
				"Clydesdale",
				"Celestial",
				"Cybred",
				"Kirin",
				"Saurequine"
			}, p1) then
				return false
			end
			if p3.PlayerData.RobloxEventSpeciesTamed:FindFirstChild(p1) then
				return false
			else
				local v1 = Instance.new("BoolValue")
				v1.Value = true
				v1.Name = p1
				v1.Parent = p3.PlayerData.RobloxEventSpeciesTamed
				return true
			end
		end
	},
	{
		Name = "Ludicrous Mission",
		Type = "HorseBondInteraction",
		Amount = 10,
		Description = "Complete Bond Request 10 Times!"
	}
}