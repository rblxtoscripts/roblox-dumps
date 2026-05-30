-- https://lua.expert/
return {
	{
		Enemy = "Bonnie",
		Cost = 400,
		Health = 2400,
		Speed = 9,
		Cooldown = 1.5
	},
	{
		Enemy = "Chica",
		Cost = 600,
		Health = 4000,
		Speed = 9,
		Cooldown = 1.5,
		HalfMoney = true
	},
	{
		Enemy = "Foxy",
		Cost = 2000,
		Health = 6000,
		Speed = 15,
		Cooldown = 1.5,
		HalfMoney = true,
		Wave = 4
	},
	{
		Enemy = "Mangle",
		Cost = 5000,
		Health = 45000,
		Speed = 12,
		Cooldown = 1.5,
		HalfMoney = true,
		Wave = 10,
		Regeneration = 0.05
	},
	{
		Enemy = "Freddy",
		Cost = 75000,
		Health = 400000,
		Speed = 12,
		Cooldown = 1.5,
		Damage = 40,
		HalfMoney = true,
		Wave = 25,
		NoSlow = true,
		Large = true,
		Regeneration = 0.1
	},
	{
		Enemy = "Ultimatum",
		Cost = 500000,
		Health = 2000000,
		Speed = 8,
		Cooldown = 1.5,
		Damage = 100,
		HalfMoney = true,
		Wave = 31,
		NoSlow = true,
		Large = true,
		Regeneration = 0.1
	}
}