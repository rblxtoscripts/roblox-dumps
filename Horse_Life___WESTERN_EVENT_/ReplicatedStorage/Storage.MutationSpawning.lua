-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IsTestGame = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").IsTestGame
local t = {
	MaxMutationsSpawned = 4,
	SpeciesToSpawn = {
		Horse = {
			P = 10
		},
		Pony = {
			P = 10
		},
		Equus = {
			P = 10
		},
		Caprine = {
			P = 10
		},
		Bisorse = {
			P = 10
		},
		Celestial = {
			P = 10
		},
		Fae = {
			P = 10
		},
		Cybred = {
			P = 10
		},
		Flora = {
			P = 10
		},
		Gargoyle = {
			P = 10
		},
		Kelpie = {
			P = 10
		},
		Peryton = {
			P = 10
		},
		Saurequine = {
			P = 10
		},
		Unicorn = {
			P = 10
		},
		Plush = {
			P = 10
		},
		Hippocampus = {
			P = 10
		},
		Kirin = {
			P = 10
		},
		Clydesdale = {
			P = 10
		},
		Cactaline = {
			P = 10
		},
		Felorse = {
			P = 10
		},
		AkhalTeke = {
			P = 10
		},
		Seraph = {
			P = 10
		},
		Anticorn = {
			P = 10
		},
		Friesian = {
			P = 10
		},
		Nephyrian = {
			P = 10
		},
		Fjord = {
			P = 10
		},
		Caniquine = {
			P = 10
		}
	},
	Mutations = {
		{
			Name = "Solar",
			P = 1,
			SpawnPreset = "SunMutation",
			Requirements = {
				Time = "Day"
			},
			ChatMessages = {
				Spawned = { "Super rare \'Solar\' mutation has spawned in the world!" },
				Found = { "\'Solar\' mutated horse has been found by %s, keep your eyes out for more!" }
			},
			GuiMessages = {
				Spawned = { "Super rare \'Solar\' mutation has spawned in the world!" },
				Found = { "\'Solar\' mutated horse has been found, keep your eyes out for more!" }
			}
		},
		{
			Name = "Heavenly",
			P = 0.5,
			SpawnPreset = "Heavenly",
			Requirements = {
				Time = "Day"
			},
			ChatMessages = {
				Spawned = { "Super rare \'Heavenly\' mutation has spawned in the world!" },
				Found = { "\'Heavenly\' mutated horse has been found by %s, keep your eyes out for more!" }
			},
			GuiMessages = {
				Spawned = { "Super rare \'Heavenly\' mutation has spawned in the world!" },
				Found = { "\'Heavenly\' mutated horse has been found, keep your eyes out for more!" }
			}
		},
		{
			Name = "Astral",
			P = 0.25,
			SpawnPreset = "AstralColor",
			Requirements = {
				Time = "Night"
			},
			ChatMessages = {
				Spawned = { "Super rare \'Astral\' mutation has spawned in the world!" },
				Found = { "\'Astral\' mutated horse has been found by %s, keep your eyes out for more!" }
			},
			GuiMessages = {
				Spawned = { "Super rare \'Astral\' mutation has spawned in the world!" },
				Found = { "\'Astral\' mutated horse has been found, keep your eyes out for more!" }
			}
		},
		{
			Name = "Lunar",
			P = 1,
			SpawnPreset = "MoonMutation",
			Requirements = {
				Time = "Night"
			},
			ChatMessages = {
				Spawned = { "Super rare \'Lunar\' mutation has spawned in the world!" },
				Found = { "\'Lunar\' mutated horse has been found by %s, keep your eyes out for more!" }
			},
			GuiMessages = {
				Spawned = { "Super rare \'Lunar\' mutation has spawned in the world!" },
				Found = { "\'Lunar\' mutated horse has been found, keep your eyes out for more!" }
			}
		},
		{
			Name = "Void",
			P = 0.5,
			SpawnPreset = "Void",
			Requirements = {
				Time = "Night"
			},
			ChatMessages = {
				Spawned = { "Super rare \'Void\' mutation has spawned in the world!" },
				Found = { "\'Void\' mutated horse has been found by %s, keep your eyes out for more!" }
			},
			GuiMessages = {
				Spawned = { "Super rare \'Void\' mutation has spawned in the world!" },
				Found = { "\'Void\' mutated horse has been found, keep your eyes out for more!" }
			}
		}
	}
}
t.ChanceToSpawn = if IsTestGame then 100 else 0.1
t.TimeToSpawn = if IsTestGame then 20 else 600
for v3, v4 in t.Mutations do
	v4.Index = v3
end
return t