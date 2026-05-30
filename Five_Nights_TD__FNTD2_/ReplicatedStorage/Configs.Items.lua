-- https://lua.expert/
local Misc = require(game.ReplicatedStorage.Configs.Misc)
return table.freeze({
	Souls = {
		Name = "Souls",
		Rarity = "Epic",
		Image = "rbxassetid://17758801602",
		Description = ("Used to enchant units. Maximum: %*"):format(Misc.SoulsCap)
	},
	UncommonRemnant = {
		Name = "Uncommon Remnant",
		Rarity = "Uncommon",
		Image = "rbxassetid://17645435518",
		Usable = true,
		Description = "Make any uncommon unit shiny"
	},
	RareRemnant = {
		Name = "Rare Remnant",
		Rarity = "Rare",
		Image = "rbxassetid://17645357275",
		Usable = true,
		Description = "Make any rare unit shiny"
	},
	EpicRemnant = {
		Name = "Epic Remnant",
		Rarity = "Epic",
		Image = "rbxassetid://17628866369",
		Usable = true,
		Description = "Make any epic unit shiny"
	},
	MythicRemnant = {
		Name = "Mythic Remnant",
		Rarity = "Mythic",
		Image = "rbxassetid://17645359361",
		Usable = true,
		Description = "Make any mythic unit shiny"
	},
	SecretRemnant = {
		Name = "Secret Remnant",
		Rarity = "Secret",
		Image = "rbxassetid://17645427747",
		Usable = true,
		Description = "Make any secret unit shiny"
	},
	PremiumPassTicket = {
		Name = "Premium Pass Ticket",
		Rarity = "Nightmare",
		Image = "rbxassetid://17487016572",
		Usable = true,
		Description = "Gives the premium season pass. If the pass is completed, it restarts the pass."
	},
	VIPTicket = {
		Name = "VIP Ticket",
		Rarity = "Nightmare",
		Image = "rbxassetid://16780640693",
		Usable = true,
		Description = "Gives the VIP gamepass"
	},
	SheriffPass = {
		Name = "Sheriff\'s Pass Ticket",
		Rarity = "Nightmare",
		Image = "rbxassetid://116535100767452",
		Usable = true,
		Description = "Gives the wild west premium pass"
	},
	EventPass = {
		Name = "Summer Pass Ticket",
		Rarity = "Nightmare",
		Image = "rbxassetid://80499518681399",
		Usable = true,
		Description = "Gives the summer premium pass. If the pass is completed, it restarts the pass."
	},
	LuckPotion = {
		Name = "Luck Potion",
		Rarity = "Secret",
		Image = "rbxassetid://125363591801391",
		Usable = true,
		Description = "Gives 1.5x luck for 30 minutes (NOT STACKABLE)"
	},
	SuperLuckPotion = {
		Name = "Super Luck Potion",
		Rarity = "Secret",
		Image = "rbxassetid://74599300000097",
		Usable = true,
		Description = "Gives 2x luck for 30 minutes (NOT STACKABLE)"
	},
	ShinyHunter = {
		Name = "Shiny Hunter",
		Rarity = "Nightmare",
		Image = "rbxassetid://118971383682792",
		Usable = true,
		Description = "Gives greater shiny luck"
	},
	QuickOpen = {
		Name = "Quick Open",
		Rarity = "Nightmare",
		Image = "rbxassetid://135870025060588",
		Usable = true,
		Description = "Gives access to open x25 presents and x50 summons"
	},
	StatChips = {
		Name = "Stat Chips",
		Rarity = "Secret",
		Image = "rbxassetid://84729344070974",
		Description = "Used to reroll stats on units."
	},
	AftonsWrench = {
		Name = "Afton\'s Wrench",
		Rarity = "Nightmare",
		Image = "rbxassetid://114360514805670",
		Description = "Used to unlock stat rerolls on a unit."
	},
	DoubleSpeed = {
		Name = "2x Game Speed",
		Rarity = "Nightmare",
		Image = "rbxassetid://101396548436313",
		Usable = true,
		Description = "Grants access to 2x game speed"
	},
	Gear = {
		Name = "Gear",
		Rarity = "Rare",
		Image = "rbxassetid://107093589452173",
		Usable = false,
		Description = "Crafting Item"
	},
	Battery = {
		Name = "Battery",
		Rarity = "Rare",
		Image = "",
		Usable = false,
		Description = "Crafting Item"
	},
	Soul = {
		Name = "Soul",
		Rarity = "Rare",
		Image = "rbxassetid://113741147309700",
		Usable = false,
		Description = "Crafting Item"
	},
	Agony = {
		Name = "Agony",
		Rarity = "Rare",
		Image = "rbxassetid://80223070079492",
		Usable = false,
		Description = "Crafting Item"
	},
	Flashlight = {
		Name = "Flashlight",
		Rarity = "Rare",
		Image = "rbxassetid://133377596734432",
		Usable = false,
		Description = "Crafting Item"
	},
	OldTV = {
		Name = "Old TV",
		Rarity = "Rare",
		Image = "rbxassetid://79903371300338",
		Usable = false,
		Description = "Crafting Item"
	},
	Pizza = {
		Name = "Pizza",
		Rarity = "Rare",
		Image = "rbxassetid://138130971515753",
		Usable = false,
		Description = "Crafting Item"
	},
	EternalGlass = {
		Name = "Eternal Glass",
		Rarity = "Rare",
		Image = "rbxassetid://138091177867527",
		Usable = false,
		Description = "Crafting Item"
	},
	GoldenLock = {
		Name = "Binding Lock",
		Rarity = "Rare",
		Image = "rbxassetid://74649146853807",
		Usable = false,
		Description = "Crafting Item"
	},
	Snowman = {
		Name = "Snowman",
		Rarity = "Secret",
		Image = "rbxassetid://120304545112772",
		Usable = false,
		Description = "Crafting Item"
	},
	CandyCane = {
		Name = "Candy Cane",
		Rarity = "Secret",
		Image = "rbxassetid://125912739367220",
		Usable = false,
		Description = "Crafting Item"
	},
	Moon = {
		Name = "Moon",
		Rarity = "Secret",
		Image = "rbxassetid://133211702091842",
		Usable = false,
		Description = "Crafting Item"
	},
	Sun = {
		Name = "Sun",
		Rarity = "Secret",
		Image = "rbxassetid://126486548356082",
		Usable = false,
		Description = "Crafting Item"
	},
	Balloon = {
		Name = "Balloon",
		Rarity = "Secret",
		Image = "rbxassetid://123734811441521",
		Usable = false,
		Description = "Crafting Item"
	},
	Ruby = {
		Name = "Ruby",
		Rarity = "Secret",
		Image = "rbxassetid://93917748033924",
		Usable = false,
		Description = "Crafting Item"
	},
	Fish = {
		Name = "Fish",
		Rarity = "Secret",
		Image = "rbxassetid://126747763204338",
		Usable = false,
		Description = "Crafting Item"
	},
	RedKey = {
		Name = "Red Key",
		Rarity = "Forgotten",
		Image = "rbxassetid://82983686589457",
		Usable = false,
		Description = "U2VlayB0aGUgbWFzayB0c nlpbmcgdG8gZmluZCBsaWZl"
	},
	PurpleKey = {
		Name = "Purple Key",
		Rarity = "Forgotten",
		Image = "rbxassetid://74037124105431",
		Usable = false,
		Description = "In shadows deep where whispers creep, A flickering screen, the secrets we keep, A video plays, with a haunting fright, Unraveling threads woven through night."
	},
	GreenKey = {
		Name = "Green Key",
		Rarity = "Forgotten",
		Image = "rbxassetid://98470567963487",
		Usable = false,
		Description = "A string of ones and zeros, intricate and sly, A secret language, speaking to the eye Of those who know the key, the cipher\'s art, To unlock meanings held within the heart Of digital dominion, where data streams and flows, And hidden messages in pixel patterns show."
	},
	YellowKey = {
		Name = "Yellow Key",
		Rarity = "Forgotten",
		Image = "rbxassetid://77887607939499",
		Usable = false,
		Description = "In a world where whispers twist and twine, we gather our thoughts, let the oddities shine. A day of reversal, where meanings stray, welcome, my friends, to Decode Reverse Day."
	},
	BlueKey = {
		Name = "Blue Key",
		Rarity = "Forgotten",
		Image = "rbxassetid://83149099844400",
		Usable = false,
		Description = "So let us seek, with open eyes, The hidden patterns, in disguise. Decode the days, their tangled weave, And in that link, true solace cleave."
	},
	WhiteKey = {
		Name = "White Key",
		Rarity = "Forgotten",
		Image = "rbxassetid://70923308293820",
		Usable = false,
		Description = "The binary maze, a grid of starkest white, zero and one, a blinding, endless light. Each path a choice, a bit, a yes or no, where forward steps to further dead ends go."
	},
	LeftArmAPF = {
		Name = "Left Arm",
		Rarity = "Forgotten",
		Image = "rbxassetid://139131581091910",
		Usable = false,
		Description = "Do you like surprises?"
	},
	LeftLegAPF = {
		Name = "Left Leg",
		Rarity = "Forgotten",
		Image = "rbxassetid://76222511590496",
		Usable = false,
		Description = "I\'ll show you all to my brand new friend!"
	},
	HeadAPF = {
		Name = "Head",
		Rarity = "Forgotten",
		Image = "rbxassetid://121005473965996",
		Usable = false,
		Description = "Do I remind you of someone? It would be unfortunate to be wrong, who am I?"
	},
	TorsoAPF = {
		Name = "Torso",
		Rarity = "Forgotten",
		Image = "rbxassetid://83681182775154",
		Usable = false,
		Description = "Chances and chaos keep things fun!"
	},
	RightArmAPF = {
		Name = "Right Arm",
		Rarity = "Forgotten",
		Image = "rbxassetid://109878407499470",
		Usable = false,
		Description = "An unfortunate fate for you arises! "
	},
	RightLegAPF = {
		Name = "Right Leg",
		Rarity = "Forgotten",
		Image = "rbxassetid://86748904762421 ",
		Usable = false,
		Description = "Find out who or you\'ll meet your end!"
	}
})