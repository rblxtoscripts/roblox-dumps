-- https://lua.expert/
local function date(p1, p2, p3, p4, p5) --[[ date | Line: 14 ]]
	return DateTime.fromUniversalTime(p1, p2, p3, p4 or 0, p5 or 0)
end
return {
	New_Map = {
		Name = "New Map Poll",
		Description = "What do you want to see in the new map?",
		CloseDate = DateTime.fromUniversalTime(2026, 4, 3, 0, 0),
		Options = { "Giant magical crystal caves", "Atlantis city and reefs", "Sky castle and floating islands", "Desolated, specter forest", "Frozen peaks/forest", "Mystical and mysterious forest" }
	},
	Stock_Horse_3_20_26 = {
		Name = "Stock Horse Poll",
		Description = "How often should stock horses be available?",
		CloseDate = DateTime.fromUniversalTime(2026, 4, 3, 0, 0),
		Options = { "Only during special events", "Once per month", "Every 2 weeks", "Every week" }
	},
	Stock_Items_3_20_26 = {
		Name = "Stock Items Poll",
		Description = "How often should stock items be available?",
		CloseDate = DateTime.fromUniversalTime(2026, 4, 3, 0, 0),
		Options = { "Only during special events", "Once per month", "Every 2 weeks", "Every week" }
	},
	Player_Suggestions_3_20_26 = {
		Name = "Player Suggestions Poll",
		Description = "Vote for your favorite idea:",
		CloseDate = DateTime.fromUniversalTime(2026, 4, 17, 0, 0),
		Options = { "Sell items to an NPC", "Group tack together in event shops", "Teleportation areas", "Real-world mutations (Albino)" }
	},
	Horse_Breed_3_27_26 = {
		Name = "New Horse Breed Poll",
		Description = "Which new horse breed do you want most?",
		OpenDate = DateTime.fromUniversalTime(2026, 3, 27, 0, 0),
		CloseDate = DateTime.fromUniversalTime(2026, 4, 10, 0, 0),
		Options = { "Lusitano", "Morgan", "Noriker", "Mule", "Camel" }
	}
}