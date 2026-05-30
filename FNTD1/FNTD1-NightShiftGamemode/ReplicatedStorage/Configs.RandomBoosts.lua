-- https://lua.expert/
local t = {
	Boosts = {
		Vengeful = {
			Name = "Vengeful",
			Image = "rbxassetid://127246842767446",
			Description = "+20% Enemy HP",
			Modifier = true
		},
		Reanimation = {
			Name = "Reanimation",
			Image = "rbxassetid://71546231405873",
			Description = "+5% Enemy Regeneration",
			Modifier = true
		},
		PiratesCove = {
			Name = "Pirate\'s Cove",
			Image = "rbxassetid://126325877100773",
			Description = "+25% Enemy Speed",
			Modifier = true
		},
		HellMode = {
			Name = "Hell Mode",
			Image = "rbxassetid://74267444338768",
			Description = "#@$)#&!$",
			Modifier = true
		},
		Trick = {
			Name = "Trick",
			Image = "rbxassetid://89233634644067",
			Description = "Next 10 waves will be harder",
			Modifier = { "99_10" }
		},
		Treat = {
			Name = "Treat",
			Image = "rbxassetid://82234946411923",
			Description = "+25% rewards",
			Modifier = { "99_10" }
		},
		Naughty = {
			Name = "Naughty",
			Image = "",
			Description = "Harder waves, but extra special present luck",
			Modifier = { "99_20" }
		},
		Nice = {
			Name = "Nice",
			Image = "",
			Description = "+25% rewards",
			Modifier = { "99_20" }
		},
		HealthT1 = {
			Name = "Health 1",
			Image = "rbxassetid://75008241872276",
			Description = "+20% enemy health",
			Modifier = { "99_50" }
		},
		HealthT2 = {
			Name = "Health 2",
			Image = "rbxassetid://75008241872276",
			Description = "+35% enemy health",
			Modifier = { "99_50" }
		},
		HealthT3 = {
			Name = "Health 3",
			Image = "rbxassetid://75008241872276",
			Description = "+50% enemy health",
			Modifier = { "99_50" }
		},
		ReducedRangeT1 = {
			Name = "Reduced Range 1",
			Image = "rbxassetid://97930944762977",
			Description = "-15% tower range",
			Modifier = { "99_50" }
		},
		ReducedRangeT2 = {
			Name = "Reduced Range 2",
			Image = "rbxassetid://97930944762977",
			Description = "-20% tower range",
			Modifier = { "99_50" }
		},
		ReducedRangeT3 = {
			Name = "Reduced Range 3",
			Image = "rbxassetid://97930944762977",
			Description = "-25% tower range",
			Modifier = { "99_50" }
		},
		MoreCDT1 = {
			Name = "More Cooldown 1",
			Image = "rbxassetid://86374027155843",
			Description = "+10% tower cooldown",
			Modifier = { "99_50" }
		},
		MoreCDT2 = {
			Name = "More Cooldown 2",
			Image = "rbxassetid://86374027155843",
			Description = "+15% tower cooldown",
			Modifier = { "99_50" }
		},
		MoreCDT3 = {
			Name = "More Cooldown 3",
			Image = "rbxassetid://86374027155843",
			Description = "+20% tower cooldown",
			Modifier = { "99_50" }
		},
		EnemySpeedT1 = {
			Name = "Enemy Speed 1",
			Image = "rbxassetid://135880959595482",
			Description = "+20% enemy speed",
			Modifier = { "99_50" }
		},
		EnemySpeedT2 = {
			Name = "Enemy Speed 2",
			Image = "rbxassetid://135880959595482",
			Description = "+35% enemy speed",
			Modifier = { "99_50" }
		},
		EnemySpeedT3 = {
			Name = "Enemy Speed 3",
			Image = "rbxassetid://135880959595482",
			Description = "+50% enemy speed",
			Modifier = { "99_50" }
		},
		ReducedPlacementsT1 = {
			Name = "Reduced Total Placements 1",
			Image = "rbxassetid://133650833567136",
			Description = "-2 max tower placement",
			Modifier = { "99_50" }
		},
		ReducedPlacementsT2 = {
			Name = "Reduced Total Placements 2",
			Image = "rbxassetid://133650833567136",
			Description = "-3 max tower placement",
			Modifier = { "99_50" }
		},
		ReducedPlacementsT3 = {
			Name = "Reduced Total Placements 3",
			Image = "rbxassetid://133650833567136",
			Description = "-5 max tower placement",
			Modifier = { "99_50" }
		},
		Cooldown1 = {
			Name = "Cooldown 1",
			Image = "rbxassetid://135880959595482",
			Description = "-3% cooldown",
			Chance = 5,
			Modifier = { "99_51" }
		},
		Cooldown2 = {
			Name = "Cooldown 2",
			Image = "rbxassetid://135880959595482",
			Description = "-4% cooldown",
			Chance = 5,
			Modifier = { "99_51" }
		},
		Cooldown3 = {
			Name = "Cooldown 3",
			Image = "rbxassetid://135880959595482",
			Description = "-5% cooldown",
			Chance = 6,
			Modifier = { "99_51" }
		},
		Damage1 = {
			Name = "Damage 1",
			Image = "rbxassetid://86374027155843",
			Description = "+5% damage",
			Chance = 5,
			Modifier = { "99_51" }
		},
		Damage2 = {
			Name = "Damage 2",
			Image = "rbxassetid://86374027155843",
			Description = "+10% damage",
			Chance = 5,
			Modifier = { "99_51" }
		},
		Damage3 = {
			Name = "Damage 3",
			Image = "rbxassetid://86374027155843",
			Description = "+15% damage",
			Chance = 6,
			Modifier = { "99_51" }
		},
		Range1 = {
			Name = "Range 1",
			Image = "rbxassetid://97930944762977",
			Description = "+5% range",
			Chance = 5,
			Modifier = { "99_51" }
		},
		Range2 = {
			Name = "Range 2",
			Image = "rbxassetid://97930944762977",
			Description = "+10% range",
			Chance = 5,
			Modifier = { "99_51" }
		},
		Range3 = {
			Name = "Range 3",
			Image = "rbxassetid://97930944762977",
			Description = "+15% range",
			Chance = 6,
			Modifier = { "99_51" }
		},
		Overtime = {
			Name = "Overtime",
			Image = "rbxassetid://137732023319069",
			Description = "-10% cooldown, -20% damage",
			Max = 1,
			Chance = 7,
			Modifier = { "99_51" }
		},
		Springlocked = {
			Name = "Springlocked",
			Image = "rbxassetid://80223070079492",
			Description = "+30% damage, +10% cooldown",
			Max = 1,
			Chance = 7,
			Modifier = { "99_51" }
		},
		TrueAgony = {
			Name = "True Agony",
			Image = "rbxassetid://89233634644067",
			Description = "+40% damage, -15% cooldown, -30% range",
			Max = 1,
			Chance = 8,
			Modifier = { "99_51" }
		},
		Consequences = {
			Name = "Consequences",
			Image = "rbxassetid://74267444338768",
			Description = "-1 Placement for all units, +35% damage, -25% cooldown, +30% range",
			Max = 1,
			Chance = 7,
			Modifier = { "99_51" }
		},
		CrazySlots = {
			Name = "Crazy Slots",
			Image = "rbxassetid://123941222895903",
			Description = "+1 Placement for all units, -25% damage, -25% range",
			Max = 1,
			Chance = 8,
			Modifier = { "99_51" }
		},
		Corrupted = {
			Name = "Glitched",
			Image = "rbxassetid://84940263243390",
			Description = "+30% range, +100% damage, +50% cooldown",
			Max = 1,
			Chance = 8,
			Modifier = { "99_51" }
		},
		PuppetsBlessing = {
			Name = "Puppet\'s Blessing",
			Image = "rbxassetid://17487016572",
			Description = "+15% range, +15% damage",
			Max = 1,
			Chance = 7,
			Modifier = { "99_51" }
		},
		Cooldown1_SpecialEndless = {
			Name = "Cooldown 1",
			Image = "rbxassetid://135880959595482",
			Description = "-3% cooldown",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Cooldown2_SpecialEndless = {
			Name = "Cooldown 2",
			Image = "rbxassetid://135880959595482",
			Description = "-4% cooldown",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Cooldown3_SpecialEndless = {
			Name = "Cooldown 3",
			Image = "rbxassetid://135880959595482",
			Description = "-5% cooldown",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Damage1_SpecialEndless = {
			Name = "Damage 1",
			Image = "rbxassetid://86374027155843",
			Description = "+5% damage",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Damage2_SpecialEndless = {
			Name = "Damage 2",
			Image = "rbxassetid://86374027155843",
			Description = "+10% damage",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Damage3_SpecialEndless = {
			Name = "Damage 3",
			Image = "rbxassetid://86374027155843",
			Description = "+15% damage",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Range1_SpecialEndless = {
			Name = "Range 1",
			Image = "rbxassetid://97930944762977",
			Description = "+5% range",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Range2_SpecialEndless = {
			Name = "Range 2",
			Image = "rbxassetid://97930944762977",
			Description = "+10% range",
			Chance = 10,
			Modifier = { "99_24" }
		},
		Range3_SpecialEndless = {
			Name = "Range 3",
			Image = "rbxassetid://97930944762977",
			Description = "+15% range",
			Chance = 10,
			Modifier = { "99_24" }
		},
		bear5 = {
			Name = "bear5",
			Image = "rbxassetid://136397733459056",
			Description = "-negative 99% range",
			Chance = 30,
			Modifier = { "99_22" }
		}
	}
}
function t.PickBoosts(p1, p2) --[[ PickBoosts | Line: 70 | Upvalues: t (copy) ]]
	local tbl = {}
	for k, v in pairs(t.Boosts) do
		if v.Nights then
			for k2, v2 in pairs(v.Nights) do
				if k2 == p1 then
					tbl[k] = v2
				end
			end
		end
	end
	local t2 = {}
	for k, v in pairs(tbl) do
		if Random.new():NextNumber(0, 100) <= v then
			table.insert(t2, k)
		end
	end
	return t2
end
return t