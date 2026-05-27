-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Table")
ReplicatedStorage:WaitForChild("Storage")
local t = {
	Horse = {
		Animations = {
			Walk = {
				ID = "15719946956",
				Speed = 2.5,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Run = {
				ID = "15739096701",
				Speed = 1.45,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Gallop = {
				ID = "15719818350",
				Speed = 1.1,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Idle = {
				ID = "15707335363",
				Speed = 1,
				Priority = Enum.AnimationPriority.Idle
			},
			Lay = {
				Idle = true,
				ID = "15841678580",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			HeadShake = {
				Idle = true,
				ID = "15853866224",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			HoofDig = {
				Idle = true,
				ID = "15853934772",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			Blink = {
				ID = "16142584742",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			},
			Buck = {
				ID = "15743233075",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			},
			Charge = {
				ID = "15743233075",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			}
		},
		AttackSequences = {
			Slam = {
				ID = "16541638529",
				Speed = 1,
				WarningLength = 4,
				AttackDuration = 2.15,
				Hitbox = "Slam",
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Sound = "Bump"
				}
			},
			Fireball = {
				Tier = 3,
				ID = "18323633376",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Meteor = {
				ID = "15742148491",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Jump = {
				ID = "15743138561",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			SpikeSpawn = {
				Tier = 2,
				ID = "86034371092880",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Spin = {
				Tier = 3,
				ID = "78701587678037",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				MaxSpawn = 2,
				Cooldown = 10,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			}
		}
	},
	Foal = {
		Animations = {
			Walk = {
				ID = "15719946956",
				Speed = 2.5,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Run = {
				ID = "15739096701",
				Speed = 1.45,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Gallop = {
				ID = "15719818350",
				Speed = 1.1,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Idle = {
				ID = "15707335363",
				Speed = 1,
				Priority = Enum.AnimationPriority.Idle
			},
			Lay = {
				Idle = true,
				ID = "90970304993664",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			HeadShake = {
				Idle = true,
				ID = "92458670712229",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			HoofDig = {
				Idle = true,
				ID = "92458670712229",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			Blink = {
				ID = "16142584742",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			},
			Buck = {
				ID = "15743233075",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			},
			Charge = {
				ID = "15743233075",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			}
		},
		AttackSequences = {
			Slam = {
				ID = "15743233075",
				Speed = 1,
				WarningLength = 4,
				AttackDuration = 2.15,
				Hitbox = "Slam",
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Sound = "Bump"
				}
			},
			Fireball = {
				Tier = 3,
				ID = "18323633376",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Meteor = {
				ID = "15742148491",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Jump = {
				ID = "15743138561",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Spin = {
				Tier = 2,
				ID = "78701587678037",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Cooldown = 10,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			SpikeSpawn = {
				ID = "86034371092880",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			}
		}
	},
	Felorse = {
		Animations = {
			Walk = {
				ID = "77598542225227",
				Speed = 2.5,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Run = {
				ID = "105553295971648",
				Speed = 1.45,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Gallop = {
				ID = "105553295971648",
				Speed = 1.1,
				ReverseWhenFacingTarget = true,
				ScaleWithSpeed = true,
				Priority = Enum.AnimationPriority.Movement
			},
			Idle = {
				ID = "121312281963401",
				Speed = 1,
				Priority = Enum.AnimationPriority.Idle
			},
			Lay = {
				Idle = true,
				ID = "79009122256736",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			HeadShake = {
				Idle = true,
				ID = "97209549455624",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			HoofDig = {
				Idle = true,
				ID = "97209549455624",
				Speed = 1,
				Priority = Enum.AnimationPriority.Movement
			},
			Blink = {
				ID = "16142584742",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			},
			Buck = {
				ID = "15743233075",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			},
			Charge = {
				ID = "15743233075",
				Speed = 1,
				Priority = Enum.AnimationPriority.Action4
			}
		},
		AttackSequences = {
			Slam = {
				ID = "15743233075",
				Speed = 1,
				WarningLength = 4,
				AttackDuration = 2.15,
				Hitbox = "Slam",
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Sound = "Bump"
				}
			},
			Fireball = {
				Tier = 3,
				ID = "18323633376",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Meteor = {
				ID = "15742148491",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Jump = {
				ID = "15743138561",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			Spin = {
				Tier = 2,
				ID = "78701587678037",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Cooldown = 10,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			},
			SpikeSpawn = {
				ID = "86034371092880",
				Speed = 1,
				WarningLength = 1.1,
				AttackDuration = 2.15,
				CanMove = true,
				Priority = Enum.AnimationPriority.Action,
				CameraShakeKeyframes = {
					Projectile = "Bump"
				}
			}
		}
	}
}
t.Unicorn = t.Horse
t.Kirin = t.Horse
t.AkhalTeke = t.Horse
t.Gargoyle = t.Horse
t.Celestial = t.Horse
t.Wolper = t.Horse
t.Fae = t.Horse
t.Saurequine = t.Horse
t.Flora = t.Horse
t.Equus = t.Horse
t.Bisorse = t.Horse
t.Pony = t.Horse
t.Caprine = t.Horse
t.Kelpie = t.Horse
t.Ghoulsteed = t.Horse
t.Alces = t.Horse
t.Plush = t.Horse
t.Cybred = t.Horse
t.Pastrequine = t.Horse
t.Hippocampus = t.Horse
t.Carousel = t.Horse
t.Cactaline = t.Horse
t.Clydesdale = t.Horse
t.Crystallion = t.Horse
t.Equenari = t.Horse
t.Hauntmare = t.Horse
t.Seraph = t.Horse
t.Nephyrian = t.Horse
t.Anticorn = t.Horse
t.Hollyhoof = t.Horse
t.Friesian = t.Horse
t.Heartbane = t.Horse
t.Horlse = t.Horse
t.Fjord = t.Horse
t.Honeytrot = t.Horse
t.Caniquine = t.Horse
t.Peryton = {
	Animations = {
		FlyForward = {
			ID = "16621455978",
			Speed = 1,
			ReverseWhenFacingTarget = true,
			ScaleWithSpeed = true,
			Priority = Enum.AnimationPriority.Movement
		},
		FlyIdle = {
			ID = "16621573019",
			Speed = 1.1,
			ReverseWhenFacingTarget = true,
			ScaleWithSpeed = true,
			Priority = Enum.AnimationPriority.Movement
		}
	},
	AttackSequences = t.Horse.AttackSequences
}
t.Fairy = {
	Animations = {
		FlyForward = {
			ID = "125157032898393",
			Speed = 1,
			ReverseWhenFacingTarget = true,
			ScaleWithSpeed = true,
			Priority = Enum.AnimationPriority.Movement
		},
		FlyIdle = {
			ID = "82048700929569",
			Speed = 1.1,
			ReverseWhenFacingTarget = true,
			ScaleWithSpeed = true,
			Priority = Enum.AnimationPriority.Movement
		}
	},
	AttackSequences = t.Horse.AttackSequences
}
v1.Merge(t.Peryton, t.Horse)
v1.Merge(t.Fairy, t.Horse)
return t