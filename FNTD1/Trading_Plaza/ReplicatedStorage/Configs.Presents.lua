-- https://lua.expert/
local t = {
	Chances = {
		Uncommon = {
			Chica = 50,
			Freddy = 50,
			Sparky = 0.002
		},
		Rare = {
			["Toy Freddy"] = 33.333,
			Foxy = 33.333,
			["Sniper Cupcake"] = 33.333,
			Sparky = 0.005
		},
		Epic = {
			["Toy Bonnie"] = 25,
			["Toy Chica"] = 25,
			FazCade = 25,
			["Liberty Chica"] = 25,
			Sparky = 0.01
		},
		Mythic = {
			Bonnie = 25,
			["Balloon Boy"] = 25,
			["Golden Freddy"] = 25,
			["Nightmare Balloon Boy"] = 25,
			Sparky = 0.02
		},
		Secret = {
			["Shadow Freddy"] = 33.333,
			Mangle = 33.333,
			["Phantom Chica"] = 33.333,
			Sparky = 0.1
		},
		Nightmare = {
			["Marionette\'s Puppeteer"] = 1,
			["Bounded Shadow"] = 1
		},
		Apex = {
			["Astral Bonnie"] = 1,
			["Toxic Springtrap"] = 1
		},
		ExclusivePack1 = {
			["Withered Chica"] = 60,
			["Withered Foxy"] = 35,
			["Withered Freddy"] = 4.5,
			["Withered Bonnie"] = 0.5
		},
		Golden = {
			["Withered Golden Freddy"] = 1
		},
		Pirate = {
			["Pirate Withered Foxy"] = 1
		},
		Endo = {
			Endo = 1
		},
		Puppet = {
			Puppet = 1
		},
		ClanSeason1 = {
			["Baker Toy Chica"] = 99.5,
			["Blighted Endo Freddy"] = 0.5
		},
		Summer = {
			["Summer Toy Bonnie"] = 60,
			["Hawaii Endo 02"] = 34.7,
			["Coco Boy"] = 5,
			["Seven Seas Foxy"] = 0.25,
			["Leviathan Mangle"] = 0.05
		},
		Military = {
			["Major Freddy"] = 60,
			["Artillery Puppet"] = 34.7,
			["Mercenary Foxy"] = 5,
			["Enforcer Bonnie"] = 0.25,
			["Valkyrie Chica"] = 0.05
		},
		CommandoEndo = {
			["Commando Endo"] = 1
		},
		Rad = {
			["Rad Freddy"] = 1
		},
		America = {
			["Patriot Freddy"] = 1
		},
		WitchChica = {
			["Witch Toy Chica"] = 1
		},
		ExclusivePack2 = {
			["Phantom Foxy"] = 60,
			Amalgam = 35,
			["Phantom Gold Freddy"] = 4.75,
			["Phantom Balloon Boy"] = 0.25
		},
		PhantomFreddy = {
			["Phantom Freddy"] = 1
		},
		ClanSeason2 = {
			["Endo 03"] = 99.5,
			["Phantom Mangle"] = 0.5
		},
		WarMachineFoxy = {
			["War Machine Foxy"] = 1
		},
		SentinelBonnie = {
			["Sentinel Bonnie"] = 1
		},
		Abyssal = {
			["Abyssal Foxy"] = 1
		},
		SpringBonnie = {
			["Tarnished Spring Bonnie"] = 1
		},
		Animdude = {
			Scott = 1
		},
		Glitched = {
			["Glitched CupCake"] = 99.9,
			["Glitched Puppeteer"] = 0.1
		},
		CryingChild = {
			["The Crying Child"] = 1
		},
		ExclusivePack3 = {
			["Nightmare Freddy"] = 60,
			["Nightmare Chica"] = 35,
			["Nightmare Foxy"] = 4.75,
			["Nightmare Bonnie"] = 0.25
		},
		FlameEmpress = {
			["Flame Empress Chica"] = 1
		},
		ClanSeason3 = {
			["Nightmare Cupcake"] = 99.5,
			["Nightmare Mangle"] = 0.5
		},
		NightmareFredbear = {
			["Nightmare Fredbear"] = 1
		},
		FreddlePack = {
			Freddle = 1
		},
		Endless1 = {
			["Party Chica"] = 99.9,
			["Goliath Endo Freddy"] = 0.1
		},
		RaveDemonBonnie = {
			["Rave Demon Bonnie"] = 1
		},
		PiratePresent = {
			["Buccaneer Foxy"] = 99.9,
			["Galleon Foxy"] = 0.1
		},
		PlushtrapPresent = {
			Plushtrap = 1
		},
		HydraMangle = {
			["Hydra Mangle"] = 1
		},
		PurpleGuy = {
			["Purple Guy"] = 1
		},
		Western = {
			["Cowboy Freddy"] = 59.7,
			["Maestro Puppet"] = 35,
			["Tavern Chica"] = 5,
			["BlindEye Foxy"] = 0.25,
			["Outlaw Freddy"] = 0.05
		},
		BountyMangle = {
			["Bounty Mangle"] = 1
		},
		JackpotFreddy = {
			["Jackpot Freddy"] = 1
		},
		PhoneGuy = {
			["Phone Guy"] = 1
		},
		ExclusivePack4 = {
			["Circus Baby"] = 0.25,
			Ballora = 5,
			["Funtime Freddy"] = 35,
			["Funtime Foxy"] = 60
		},
		LolbitPresent = {
			Lolbit = 1
		},
		BonnetPresent = {
			Bonnet = 1
		},
		ClanSeason4 = {
			Bonnet = 99.5,
			["Endo 05"] = 0.5
		},
		Corrupted = {
			["ITS ME"] = 99.5,
			["Old Man Consequences"] = 0.5
		},
		ElizabethPresent = {
			Elizabeth = 1
		},
		MafiaPresent = {
			["Fazbear Mafia"] = 1
		},
		BoomboxFoxyPresent = {
			["Boombox Foxy"] = 1
		},
		GrimmFoxyPresent = {
			["Grimm Foxy"] = 1
		},
		ScarecrowFoxyPresent = {
			["Scarecrow Foxy"] = 1
		},
		ClowntrapPresent = {
			Clowntrap = 1
		},
		SuperFreddyPresent = {
			["Super Freddy"] = 1
		},
		BlightedPresent = {
			["Glitched CupCake"] = 99.89,
			["Blighted Endo Bonnie"] = 0.1,
			Coffee = 0.01
		},
		NightgaurdAftonPresent = {
			["Nightguard Afton"] = 1
		},
		TitanicPresent = {
			["Augmented Endo"] = 99.9,
			["Juggernaut Bonnie"] = 0.1,
			["Goliath Endo Freddy"] = 0.1
		},
		ExclusivePack5 = {
			["Rockstar Foxy"] = 0.25,
			["Rockstar Bonnie"] = 5,
			["Rockstar Chica"] = 35,
			["Rockstar Freddy"] = 60
		},
		ScrapBaby = {
			["Scrap Baby"] = 1
		},
		BucketBob = {
			["Bucket Bob"] = 1
		},
		ClanSeason5 = {
			["Number 1 Crate"] = 99.5,
			Scraptrap = 0.5
		},
		MrCanDo = {
			["Mr Can Do"] = 1
		},
		PopstarChica = {
			["Popstar Chica"] = 1
		},
		MechanicAfton = {
			["Mechanic Afton"] = 1
		},
		DuelistPuppet = {
			["Duelist Puppet"] = 1
		},
		StoneTrapPresent = {
			StoneTrap = 1
		},
		TarnishedFredbear = {
			["Tarnished Fredbear"] = 1
		},
		PVPPresent1 = {
			["Gladiator Foxy"] = 99.9,
			["Dark Knight Puppet"] = 0.1
		},
		TheKing = {
			["The King"] = 1
		},
		FreddyFrostbear = {
			["Freddy Frostbear"] = 1
		},
		IcetrapPresent = {
			Icetrap = 1
		},
		BouncerPresent = {
			Bouncer = 1
		},
		OverlordScott = {
			["Overlord Scott"] = 1
		},
		Christmas1 = {
			["Frost Plushtrap"] = 90,
			["Winter Soldier Bonnie"] = 9.5,
			["Old Man Krampus"] = 0.5
		},
		ExclusivePack6 = {
			["Montgomery Gator"] = 0.1,
			["Roxanne Wolf"] = 4.9,
			["Glamrock Chica"] = 35,
			["Glamrock Freddy"] = 60
		},
		MoondropPresent = {
			Moondrop = 1
		},
		WetFloorBot = {
			["Wet Floor Bot"] = 1
		},
		StardropPresent = {
			Stardrop = 1
		},
		ShadowOfAfton = {
			["Shadow of Afton"] = 1
		},
		GlamrockEndo = {
			["Glamrock Endo"] = 1
		},
		PandorasBox = require(script.PandorasBox),
		BlightedEndoFoxy = {
			["Blighted Foxy"] = 1
		},
		Greek1 = {
			["Archer Fredeus"] = 45,
			["Hermes Puppeteer"] = 60,
			Foxseidon = 4,
			["Ares Endoxus"] = 1,
			["Apollo\'s Sun"] = 0.1,
			["Gaia Chica"] = 0.01
		},
		ZeusFredeus = {
			["Zeus Fredeus"] = 1
		},
		ForgeWitheredBonnie = {
			["Forge Withered Bonnie"] = 1
		},
		GlamrockBonnie = {
			["Glamrock Bonnie"] = 1
		},
		GaiaPresent = {
			["Forest Nymph Bonnie"] = 99.85,
			["Gaia Chica"] = 0.15
		},
		SoulmatePuppet = {
			["Soulmate Puppet"] = 1
		},
		VannyPresent = {
			Vanny = 1
		},
		FanPresent = {
			Fan = 1
		},
		ExclusivePack7 = {
			["The Mimic"] = 0.01,
			Eclipse = 19.99,
			["Nightmare Bot"] = 80
		},
		ThePrincess = {
			["The Princess"] = 1
		},
		FlamingSpringtrap = {
			["Flaming Springtrap"] = 1
		},
		DreadPirateFoxy = {
			["Dread Pirate Foxy"] = 1
		},
		Space1 = {
			["Raider Freddy"] = 60,
			Cosplushtrap = 39.9,
			["Android Mangle"] = 1,
			["Planet Buster Scott"] = 0.1
		},
		AlienHelpy = {
			["Alien Helpy"] = 1
		},
		SpringTrooper = {
			["Spring Trooper"] = 1
		},
		Bear5Present = {
			Bear5 = 1
		},
		SteveRaglan = {
			["Steve Raglan"] = 1
		},
		ExclusivePack8 = {
			Orville = 0.01,
			["Nedd Bear"] = 19.99,
			["Pig Patch"] = 80
		},
		HappyFrog = {
			["Happy Frog"] = 1
		},
		DeeDee = {
			["Dee Dee"] = 1
		},
		EasterFreddles = {
			["Easter Freddles"] = 1
		},
		CryingSoul = {
			["Crying Soul"] = 1
		},
		RingmasterFoxy = {
			["Ringmaster Foxy"] = 1
		},
		Prehistoric1 = {
			["Sabertooth Foxy"] = 50,
			["Molten Foxy"] = 35,
			["Dino Plane Boy"] = 13.9,
			["Dino Dreadbear"] = 1,
			["Chicasaurus Rex"] = 0.1,
			["Fossilized Puppet"] = 0.01
		},
		TriceratopsChicaPresent = {
			["Triceratops Chica"] = 1
		},
		PaleontologistPresent = {
			["Paleontologist Springbonnie"] = 1
		},
		DinoPalsPresent = {
			["Dino Pals"] = 1
		},
		BirthdayPresent = {
			["Partytime Freddy"] = 70,
			["Dessert Funtime Foxy"] = 29,
			["Hot Air Balloon Boy"] = 1
		},
		LeBronniePresent = {
			LeBronnie = 1
		},
		ExclusivePack9 = {
			["Tiger Rock"] = 0.01,
			Gregory = 19.99,
			Vanessa = 80
		},
		FuntimeChicaPresent = {
			["Funtime Chica"] = 1
		},
		ITPSBPresent = {
			["ITP Springbonnie"] = 1
		},
		PrototypeGFPresent = {
			["Prototype Glamrock Freddy"] = 1
		},
		FetchPresent = {
			Fetch = 1
		},
		JackiePresent = {
			Jackie = 1
		},
		ClanSeason9 = {
			Bidybab = 99.5,
			["The Blob"] = 0.5
		},
		AFKPresent = {
			Minireenas = 99.9,
			Carnie = 0.1,
			Coffee = 0.01
		},
		JJPresent = {
			JJ = 1
		},
		SSOrvillePresent = {
			["Star Spangled Orville"] = 1
		},
		PVPPresent2 = {
			["Gladiator Foxy"] = 99.9,
			["Jester Puppet"] = 0.1
		},
		FlipsidePresent = {
			["Flipside Freddy"] = 1
		},
		CyberPolicePresent = {
			["Cyber Police Roxy"] = 1
		},
		EngineerChicaPresent = {
			["Engineer Chica"] = 1
		},
		Summer2Present = {
			["Sandy Helpy"] = 50,
			["Heatwave Sun"] = 35,
			["El Jellychip"] = 13.9,
			["Molten Serpent"] = 1,
			["Aquatic Ballora"] = 0.1,
			["Tropic Terror Duo"] = 0.01
		},
		AquaticPresent = {
			["Aquatic Ballora"] = 1
		},
		StrawbabyPresent = {
			Strawbaby = 1
		},
		SunGuardianPresent = {
			["Sun Guardian Freddy"] = 1
		},
		WaterworksPresent = {
			["Waterworks Foxy"] = 1
		},
		IntoThePoolPresent = {
			["Into the Pool"] = 1
		},
		DrainedCoffeePresent = {
			["Drained Coffee"] = 1
		},
		PorcelainPresent = {
			["Porcelain Weaver Chica"] = 1
		},
		BDBashPresent = {
			["Birthday Bash Bonnie"] = 1
		}
	}
}
t.Presents = {
	Uncommon = {
		Rarity = "Uncommon",
		Image = "rbxassetid://16767154477",
		Chances = t.Chances.Uncommon
	},
	Rare = {
		Rarity = "Rare",
		Image = "rbxassetid://16767178920",
		Chances = t.Chances.Rare
	},
	Epic = {
		Rarity = "Epic",
		Image = "rbxassetid://16767201699",
		Chances = t.Chances.Epic
	},
	Mythic = {
		Rarity = "Mythic",
		Image = "rbxassetid://16767255332",
		Chances = t.Chances.Mythic
	},
	Secret = {
		Rarity = "Secret",
		Image = "rbxassetid://16767097723",
		Chances = t.Chances.Secret
	},
	ExclusivePack1 = {
		Name = "Exclusive Present 1",
		Rarity = "Secret",
		Image = "rbxassetid://16767302117",
		Chances = t.Chances.ExclusivePack1
	},
	Golden = {
		Rarity = "Mythic",
		Image = "rbxassetid://16781506061",
		Chances = t.Chances.Golden
	},
	Pirate = {
		Rarity = "Secret",
		Image = "rbxassetid://17851327972",
		Chances = t.Chances.Pirate
	},
	Endo = {
		Rarity = "Secret",
		Image = "rbxassetid://17866932531",
		Chances = t.Chances.Endo
	},
	Puppet = {
		Rarity = "Secret",
		Image = "rbxassetid://17866795652",
		Chances = t.Chances.Puppet
	},
	ClanSeason1 = {
		Rarity = "Secret",
		Image = "rbxassetid://18149057321",
		Chances = t.Chances.ClanSeason1
	},
	Summer = {
		Rarity = "Secret",
		Image = "rbxassetid://18205768905",
		Chances = t.Chances.Summer
	},
	Military = {
		Rarity = "Secret",
		Image = "rbxassetid://18675827803",
		Chances = t.Chances.Military
	},
	CommandoEndo = {
		Rarity = "Secret",
		Image = "rbxassetid://18675946836",
		Chances = t.Chances.CommandoEndo
	},
	Rad = {
		Rarity = "Secret",
		Image = "rbxassetid://18256204578",
		Chances = t.Chances.Rad
	},
	America = {
		Rarity = "Secret",
		Image = "rbxassetid://18326244804",
		Chances = t.Chances.America
	},
	["Witch Toy Chica"] = {
		Rarity = "Secret",
		Image = "rbxassetid://18364392347",
		Chances = t.Chances.WitchChica
	},
	ExclusivePack2 = {
		Name = "Phantom Present",
		Rarity = "Secret",
		Image = "rbxassetid://18364454083",
		Chances = t.Chances.ExclusivePack2
	},
	PhantomFreddy = {
		Name = "Phantom Freddy",
		Rarity = "Secret",
		Image = "rbxassetid://18470849311",
		Chances = t.Chances.PhantomFreddy
	},
	ClanSeason2 = {
		Rarity = "Secret",
		Image = "rbxassetid://18364457279",
		Chances = t.Chances.ClanSeason2
	},
	WarMachineFoxy = {
		Name = "War Machine Foxy",
		Rarity = "Nightmare",
		Image = "rbxassetid://18365229444",
		Chances = t.Chances.WarMachineFoxy
	},
	SentinelBonnie = {
		Rarity = "Secret",
		Image = "rbxassetid://18364460981",
		Chances = t.Chances.SentinelBonnie
	},
	Abyssal = {
		Rarity = "Secret",
		Image = "rbxassetid://18578240288",
		Chances = t.Chances.Abyssal
	},
	SpringBonnie = {
		Name = "Tarnished Spring Bonnie",
		Rarity = "Secret",
		Image = "rbxassetid://18777706035",
		Chances = t.Chances.SpringBonnie
	},
	Animdude = {
		Name = "Scott",
		Rarity = "Secret",
		Image = "rbxassetid://18856710840",
		Chances = t.Chances.Animdude
	},
	Glitched = {
		Rarity = "Secret",
		Image = "rbxassetid://18850580433",
		Chances = t.Chances.Glitched
	},
	CryingChild = {
		Rarity = "Secret",
		Image = "rbxassetid://18938069905",
		Chances = t.Chances.CryingChild
	},
	ExclusivePack3 = {
		Name = "Exclusive Pack 3",
		Rarity = "Secret",
		Image = "rbxassetid://18984339806",
		Chances = t.Chances.ExclusivePack3
	},
	FlameEmpress = {
		Name = "Flame Empress",
		Rarity = "Secret",
		Image = "",
		Chances = t.Chances.FlameEmpress
	},
	ClanSeason3 = {
		Rarity = "Secret",
		Image = "rbxassetid://18984337483",
		Chances = t.Chances.ClanSeason3
	},
	NightmareFredbear = {
		Rarity = "Secret",
		Image = "rbxassetid://18984335254",
		Chances = t.Chances.NightmareFredbear
	},
	FreddlePack = {
		Rarity = "Secret",
		Image = "rbxassetid://18984243290",
		Chances = t.Chances.FreddlePack
	},
	Endless1 = {
		Name = "Endless Present 1",
		Rarity = "Nightmare",
		Image = "rbxassetid://132214758486127",
		Chances = t.Chances.Endless1
	},
	RaveDemonBonnie = {
		Name = "Rave Demon Bonnie Pack",
		Rarity = "Secret",
		Image = "rbxassetid://94737908206763",
		Chances = t.Chances.RaveDemonBonnie
	},
	PiratePresent = {
		Name = "Pirate Present",
		Rarity = "Secret",
		Image = "rbxassetid://88708366071578",
		Chances = t.Chances.PiratePresent
	},
	PlushtrapPresent = {
		Name = "Plushtrap Present",
		Rarity = "Secret",
		Image = "rbxassetid://134949380135685",
		Chances = t.Chances.PlushtrapPresent
	},
	HydraMangle = {
		Name = "Hydra Mangle",
		Rarity = "Secret",
		Image = "rbxassetid://129962017945177",
		Chances = t.Chances.HydraMangle
	},
	PurpleGuy = {
		Name = "Purple Guy",
		Rarity = "Secret",
		Image = "rbxassetid://77655841276380",
		Chances = t.Chances.PurpleGuy
	},
	Western = {
		Rarity = "Secret",
		Image = "rbxassetid://84630974795856",
		Chances = t.Chances.Western
	},
	BountyMangle = {
		Name = "Bounty Mangle Present",
		Rarity = "Secret",
		Image = "rbxassetid://99595285198431",
		Chances = t.Chances.BountyMangle
	},
	JackpotFreddy = {
		Name = "Jackpot Freddy Present",
		Rarity = "Secret",
		Image = "rbxassetid://118764393092118",
		Chances = t.Chances.JackpotFreddy
	},
	PhoneGuy = {
		Name = "Phone Guy Present",
		Rarity = "Secret",
		Image = "rbxassetid://79052310278623",
		Chances = t.Chances.PhoneGuy
	},
	ExclusivePack4 = {
		Name = "Exclusive Pack 4",
		Rarity = "Secret",
		Image = "rbxassetid://136967001794459",
		Chances = t.Chances.ExclusivePack4
	},
	LolbitPresent = {
		Name = "Lolbit Present",
		Rarity = "Secret",
		Image = "rbxassetid://73732824407153",
		Chances = t.Chances.LolbitPresent
	},
	BonnetPresent = {
		Name = "Bonnet Present",
		Rarity = "Secret",
		Image = "",
		Chances = t.Chances.BonnetPresent
	},
	ClanSeason4 = {
		Name = "Clan Season 4",
		Rarity = "Secret",
		Image = "rbxassetid://109139870709498",
		Chances = t.Chances.ClanSeason4
	},
	Corrupted = {
		Rarity = "Nightmare",
		Image = "rbxassetid://101695651387234",
		Chances = t.Chances.Corrupted
	},
	ElizabethPresent = {
		Rarity = "Secret",
		Image = "rbxassetid://83404737499964",
		Chances = t.Chances.ElizabethPresent
	},
	MafiaPresent = {
		Name = "Mafia Present",
		Rarity = "Secret",
		Image = "rbxassetid://116885247456345",
		Chances = t.Chances.MafiaPresent
	},
	BoomboxFoxyPresent = {
		Name = "Boombox Foxy Present",
		Rarity = "Secret",
		Image = "rbxassetid://98505644179634",
		Chances = t.Chances.BoomboxFoxyPresent
	},
	GrimmFoxyPresent = {
		Name = "Grimm Foxy Present",
		Rarity = "Secret",
		Image = "rbxassetid://74412599168837",
		Chances = t.Chances.GrimmFoxyPresent
	},
	ScarecrowFoxyPresent = {
		Name = "Scarecrow Foxy Present",
		Rarity = "Secret",
		Image = "rbxassetid://125180390639507",
		Chances = t.Chances.ScarecrowFoxyPresent
	},
	ClowntrapPresent = {
		Name = "Clowntrap Present",
		Rarity = "Secret",
		Image = "rbxassetid://74791087879392",
		Chances = t.Chances.ClowntrapPresent
	},
	SuperFreddyPresent = {
		Name = "Super Freddy Present",
		Rarity = "Secret",
		Image = "rbxassetid://79333436020013",
		Chances = t.Chances.SuperFreddyPresent
	},
	BlightedPresent = {
		Name = "Blighted Present",
		Rarity = "Secret",
		Image = "rbxassetid://99697344298173",
		Chances = t.Chances.BlightedPresent
	},
	NightgaurdAftonPresent = {
		Name = "Nightgaurd Afton Present",
		Rarity = "Secret",
		Image = "rbxassetid://119842859395693",
		Chances = t.Chances.NightgaurdAftonPresent
	},
	TitanicPresent = {
		Name = "Titanic Present",
		Rarity = "Secret",
		Image = "rbxassetid://102157598294560",
		Chances = t.Chances.TitanicPresent
	},
	ExclusivePack5 = {
		Name = "Exclusive Pack 5",
		Rarity = "Secret",
		Image = "rbxassetid://71315568358486",
		Chances = t.Chances.ExclusivePack5
	},
	ScrapBaby = {
		Name = "Scrap Baby Present",
		Rarity = "Secret",
		Image = "rbxassetid://70554421086193 ",
		Chances = t.Chances.ScrapBaby
	},
	BucketBob = {
		Name = "Bucket Bob Present",
		Rarity = "Secret",
		Image = "rbxassetid://130583501354904",
		Chances = t.Chances.BucketBob
	},
	ClanSeason5 = {
		Name = "Clan Present",
		Rarity = "Secret",
		Image = "rbxassetid://92744320388585",
		Chances = t.Chances.ClanSeason5
	},
	MrCanDo = {
		Name = "Mr Can Do",
		Rarity = "Secret",
		Image = "rbxassetid://109784096726578",
		Chances = t.Chances.MrCanDo
	},
	PopstarChica = {
		Name = "Popstar Chica Present",
		Rarity = "Secret",
		Image = "rbxassetid://118770964708577",
		Chances = t.Chances.PopstarChica
	},
	MechanicAfton = {
		Name = "Mechanic Afton Present",
		Rarity = "Secret",
		Image = "rbxassetid://114873860779597",
		Chances = t.Chances.MechanicAfton
	},
	DuelistPuppet = {
		Name = "Duelist Puppet Present",
		Rarity = "Secret",
		Image = "rbxassetid://126220768406413",
		Chances = t.Chances.DuelistPuppet
	},
	StoneTrapPresent = {
		Name = "StoneTrap Present",
		Rarity = "Secret",
		Image = "rbxassetid://97444424027823",
		Chances = t.Chances.StoneTrapPresent
	},
	TarnishedFredbear = {
		Name = "Tarnished Fredbear Present",
		Rarity = "Secret",
		Image = "rbxassetid://127168603881244",
		Chances = t.Chances.TarnishedFredbear
	},
	PVPPresent1 = {
		Name = "PVP Present 1",
		Rarity = "Nightmare",
		Image = "rbxassetid://116551236342401",
		Chances = t.Chances.PVPPresent1
	},
	TheKing = {
		Name = "The King Present",
		Rarity = "Secret",
		Image = "rbxassetid://140388125208066",
		Chances = t.Chances.TheKing
	},
	FreddyFrostbear = {
		Name = "Freddy Frostbear Present",
		Rarity = "Secret",
		Image = "rbxassetid://106324581818562",
		Chances = t.Chances.FreddyFrostbear
	},
	IcetrapPresent = {
		Name = "Icetrap Present",
		Rarity = "Secret",
		Image = "rbxassetid://120869165126413",
		Chances = t.Chances.IcetrapPresent
	},
	BouncerPresent = {
		Name = "Bouncer Present",
		Rarity = "Secret",
		Image = "rbxassetid://70432876237333",
		Chances = t.Chances.BouncerPresent
	},
	OverlordScott = {
		Name = "Overlord Scott Present",
		Rarity = "Secret",
		Image = "rbxassetid://139610375043641",
		Chances = t.Chances.OverlordScott
	},
	Christmas1 = {
		Name = "Christmas Present 1",
		Rarity = "Secret",
		Image = "rbxassetid://110175832425865",
		Chances = t.Chances.Christmas1
	},
	ExclusivePack6 = {
		Name = "Exclusive Pack 6",
		Rarity = "Secret",
		Image = "rbxassetid://80032686631180",
		Chances = t.Chances.ExclusivePack6
	},
	MoondropPresent = {
		Name = "Moondrop Present",
		Rarity = "Secret",
		Image = "rbxassetid://131152838962837",
		Chances = t.Chances.MoondropPresent
	},
	WetFloorBot = {
		Name = "Wet Floor Bot Present",
		Rarity = "Secret",
		Image = "rbxassetid://112851991679799",
		Chances = t.Chances.WetFloorBot
	},
	StardropPresent = {
		Name = "Stardrop Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://112133622909747",
		Chances = t.Chances.StardropPresent
	},
	ShadowOfAfton = {
		Name = "Shadow of Afton Present",
		Rarity = "Secret",
		Image = "rbxassetid://113528059489896",
		Chances = t.Chances.ShadowOfAfton
	},
	GlamrockEndo = {
		Name = "Glamrock Endo Present",
		Rarity = "Secret",
		Image = "rbxassetid://137537985329615",
		Chances = t.Chances.GlamrockEndo
	},
	PandorasBox = {
		Name = "Pandora\'s Box",
		Rarity = "Secret",
		Image = "rbxassetid://131387964882990",
		Chances = t.Chances.PandorasBox
	},
	BlightedEndoFoxy = {
		Name = "Blighted Foxy Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://110950222082669",
		Chances = t.Chances.BlightedEndoFoxy
	},
	Greek1 = {
		Name = "Olympus Present",
		Rarity = "Secret",
		Image = "rbxassetid://118808655945900",
		Chances = t.Chances.Greek1
	},
	ZeusFredeus = {
		Name = "Zeus Fredeus Present",
		Rarity = "Secret",
		Image = "rbxassetid://106382150719174",
		Chances = t.Chances.ZeusFredeus
	},
	ForgeWitheredBonnie = {
		Name = "Forge Withered Bonnie Present",
		Rarity = "Secret",
		Image = "rbxassetid://116801540188768",
		Chances = t.Chances.ForgeWitheredBonnie
	},
	GlamrockBonnie = {
		Name = "Glamrock Bonnie Present",
		Rarity = "Secret",
		Image = "rbxassetid://120502639756880",
		Chances = t.Chances.GlamrockBonnie
	},
	GaiaPresent = {
		Name = "Gaia Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://71167243490567",
		Chances = t.Chances.GaiaPresent
	},
	SoulmatePuppet = {
		Name = "Soulmate Puppet Present",
		Rarity = "Secret",
		Image = "rbxassetid://82665433592632",
		Chances = t.Chances.SoulmatePuppet
	},
	VannyPresent = {
		Name = "Vanny Present",
		Rarity = "Secret",
		Image = "rbxassetid://112795440967716",
		Chances = t.Chances.VannyPresent
	},
	FanPresent = {
		Name = "Fan Present",
		Rarity = "Secret",
		Image = "rbxassetid://129462340602127",
		Chances = t.Chances.FanPresent
	},
	ExclusivePack7 = {
		Name = "Exclusive Pack 7",
		Rarity = "Secret",
		Image = "rbxassetid://94927886242879",
		Chances = t.Chances.ExclusivePack7
	},
	ThePrincess = {
		Name = "The Princess Present",
		Rarity = "Secret",
		Image = "rbxassetid://138670938174177",
		Chances = t.Chances.ThePrincess
	},
	FlamingSpringtrap = {
		Name = "Flaming Springtrap Present",
		Rarity = "Secret",
		Image = "rbxassetid://138963791371102",
		Chances = t.Chances.FlamingSpringtrap
	},
	DreadPirateFoxy = {
		Name = "Dread Pirate Foxy Present",
		Rarity = "Secret",
		Image = "rbxassetid://89007663715435",
		Chances = t.Chances.DreadPirateFoxy
	},
	Space1 = {
		Name = "Space Present",
		Rarity = "Secret",
		Image = "rbxassetid://136156993524311",
		Chances = t.Chances.Space1
	},
	AlienHelpy = {
		Name = "Alien Helpy Present",
		Rarity = "Secret",
		Image = "rbxassetid://71876950263322",
		Chances = t.Chances.AlienHelpy
	},
	SpringTrooper = {
		Name = "Spring Trooper Present",
		Rarity = "Secret",
		Image = "rbxassetid://133506580522875",
		Chances = t.Chances.SpringTrooper
	},
	Bear5Present = {
		Name = "Bear5 Present",
		Rarity = "Secret",
		Image = "rbxassetid://140567929876707",
		Chances = t.Chances.Bear5Present
	},
	SteveRaglan = {
		Name = "Steve Raglan Present",
		Rarity = "Secret",
		Image = "rbxassetid://110343218009764",
		Chances = t.Chances.SteveRaglan
	},
	ExclusivePack8 = {
		Name = "Exclusive Pack 8",
		Rarity = "Secret",
		Image = "rbxassetid://90888370755091",
		Chances = t.Chances.ExclusivePack8
	},
	HappyFrog = {
		Name = "Happy Frog Present",
		Rarity = "Secret",
		Image = "rbxassetid://117715015067615",
		Chances = t.Chances.HappyFrog
	},
	DeeDee = {
		Name = "Dee Dee Present",
		Rarity = "Secret",
		Image = "rbxassetid://101731701792962",
		Chances = t.Chances.DeeDee
	},
	EasterFreddles = {
		Name = "Easter Freddles Present",
		Rarity = "Secret",
		Image = "rbxassetid://95647858565006",
		Chances = t.Chances.EasterFreddles
	},
	CryingSoul = {
		Name = "Crying Soul Present",
		Rarity = "Secret",
		Image = "rbxassetid://122269707590959",
		Chances = t.Chances.CryingSoul
	},
	RingmasterFoxy = {
		Name = "Ringmaster Foxy Present",
		Rarity = "Secret",
		Image = "rbxassetid://71261018928415",
		Chances = t.Chances.RingmasterFoxy
	},
	Prehistoric1 = {
		Name = "Prehistoric Present",
		Rarity = "Secret",
		Image = "rbxassetid://87223698356511",
		Chances = t.Chances.Prehistoric1
	},
	TriceratopsChicaPresent = {
		Name = "Triceratops Chica Present",
		Rarity = "Secret",
		Image = "rbxassetid://105743890789659",
		Chances = t.Chances.TriceratopsChicaPresent
	},
	PaleontologistPresent = {
		Name = "Paleontologist Springbonnie Present",
		Rarity = "Secret",
		Image = "rbxassetid://80507251053313",
		Chances = t.Chances.PaleontologistPresent
	},
	DinoPalsPresent = {
		Name = "Dino Pals Present",
		Rarity = "Secret",
		Image = "rbxassetid://88177079904607",
		Chances = t.Chances.DinoPalsPresent
	},
	BirthdayPresent = {
		Name = "Birthday Present",
		Rarity = "Secret",
		Image = "rbxassetid://124114189331771",
		Chances = t.Chances.BirthdayPresent
	},
	LeBronniePresent = {
		Name = "LeBronnie Present",
		Rarity = "Secret",
		Image = "rbxassetid://87882955827793",
		Chances = t.Chances.LeBronniePresent
	},
	ExclusivePack9 = {
		Name = "Exclusive Present 9",
		Rarity = "Secret",
		Image = "rbxassetid://134207151613728",
		Chances = t.Chances.ExclusivePack9
	},
	FuntimeChicaPresent = {
		Name = "Funtime Chica Present",
		Rarity = "Secret",
		Image = "rbxassetid://131652336800213",
		Chances = t.Chances.FuntimeChicaPresent
	},
	ITPSBPresent = {
		Name = "Into The Pit Springbonnie Present",
		Rarity = "Secret",
		Image = "rbxassetid://139287696450360",
		Chances = t.Chances.ITPSBPresent
	},
	PrototypeGFPresent = {
		Name = "Prototype Glamrock Freddy Present",
		Rarity = "Secret",
		Image = "rbxassetid://109478684175133",
		Chances = t.Chances.PrototypeGFPresent
	},
	FetchPresent = {
		Name = "Fetch Present",
		Rarity = "Secret",
		Image = "rbxassetid://92531171939609",
		Chances = t.Chances.FetchPresent
	},
	JackiePresent = {
		Name = "Jackie Present",
		Rarity = "Secret",
		Image = "rbxassetid://83972113865217",
		Chances = t.Chances.JackiePresent
	},
	ClanSeason9 = {
		Name = "Clan Season 9 Present",
		Rarity = "Secret",
		Image = "rbxassetid://108949035201820",
		Chances = t.Chances.ClanSeason9
	},
	AFKPresent = {
		Name = "AFK Present",
		Rarity = "Secret",
		Image = "rbxassetid://134737656774302",
		Chances = t.Chances.AFKPresent
	},
	JJPresent = {
		Name = "JJ Present",
		Rarity = "Secret",
		Image = "rbxassetid://104594546215237",
		Chances = t.Chances.JJPresent
	},
	SSOrvillePresent = {
		Name = "Star Sprangled Orville Present",
		Rarity = "Secret",
		Image = "rbxassetid://89150087660244",
		Chances = t.Chances.SSOrvillePresent
	},
	PVPPresent2 = {
		Name = "PVP Present 2",
		Rarity = "Secret",
		Image = "rbxassetid://111587397541166",
		Chances = t.Chances.PVPPresent2
	},
	FlipsidePresent = {
		Name = "Flipside Freddy Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://80212155416915",
		Chances = t.Chances.FlipsidePresent
	},
	CyberPolicePresent = {
		Name = "Cyber Police Roxy Present",
		Rarity = "Secret",
		Image = "rbxassetid://106737104702972",
		Chances = t.Chances.CyberPolicePresent
	},
	EngineerChicaPresent = {
		Name = "Engineer Chica Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://107307249052995",
		Chances = t.Chances.EngineerChicaPresent
	},
	Summer2Present = {
		Name = "Summer 2 Present",
		Rarity = "Secret",
		Image = "rbxassetid://93468345671472",
		Chances = t.Chances.Summer2Present
	},
	AquaticPresent = {
		Name = "Aquatic Ballora Present",
		Rarity = "Apex",
		Image = "rbxassetid://107138197736746",
		Chances = t.Chances.AquaticPresent
	},
	StrawbabyPresent = {
		Name = "Strawbaby Present",
		Rarity = "Secret",
		Image = "rbxassetid://109014178565318",
		Chances = t.Chances.StrawbabyPresent
	},
	WaterworksPresent = {
		Name = "Waterworks Foxy Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://77921665176414",
		Chances = t.Chances.WaterworksPresent
	},
	IntoThePoolPresent = {
		Name = "Into The Pool Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://74068614947072",
		Chances = t.Chances.IntoThePoolPresent
	},
	DrainedCoffeePresent = {
		Name = "Drained Coffee Present",
		Rarity = "Secret",
		Image = "rbxassetid://128045298065491",
		Chances = t.Chances.DrainedCoffeePresent
	},
	PorcelainPresent = {
		Name = "Porcelain Weaver Chica Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://96230045804797",
		Chances = t.Chances.PorcelainPresent
	},
	SunGuardianPresent = {
		Name = "Sun Guardian Freddy Present",
		Rarity = "Nightmare",
		Image = "rbxassetid://96873837635605",
		Chances = t.Chances.SunGuardianPresent
	},
	BDBashPresent = {
		Name = "Birthday Bash Bonnie Present",
		Rarity = "Secret",
		Image = "rbxassetid://75802578142273",
		Chances = t.Chances.BDBashPresent
	}
}
return t