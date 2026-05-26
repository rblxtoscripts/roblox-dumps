-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local function dateTime(p1) --[[ dateTime | Line: 10 ]]
	return DateTime.fromIsoDate(p1).UnixTimestamp
end
local t = {
	WolperEnamelKeychain = {
		CommerceId = "1286683149643940256",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Wolper Enamel Keychain",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://104109624851523" },
		Items = {
			{
				Name = "BunnyWingPotion",
				Amount = 1
			}
		}
	},
	WolperFieldGuidePoster = {
		CommerceId = "6297219210070327786",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Wolper Field Guide Poster",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://98830732551788" },
		Items = {
			{
				Name = "JellyBeanCapsule",
				Amount = 1
			}
		}
	},
	StainedGlassCrystallionMattePoster = {
		CommerceId = "2548202224723558855",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Stained Glass Crystallion Matte Poster",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://85537120316950" },
		Items = {
			{
				Name = "CrystallineCapsule",
				Amount = 1
			}
		}
	},
	StainedGlassUnicornMattePoster = {
		CommerceId = "4224578219061412269",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Stained Glass Unicorn Matte Poster",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://105214791632581" },
		Items = {
			{
				Name = "ArcanaCapsule",
				Amount = 1
			}
		}
	},
	ArmoredEnamelPin = {
		CommerceId = "8783057676818055616",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Armored Horse Enamel Pin",
		SubText = "",
		LayoutOrder = 1,
		SaleStarts = DateTime.fromIsoDate("2026-05-15T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-06-15T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://128728856867093" },
		Items = {
			{
				Name = "RoyalSteedCapsule",
				Amount = 1
			}
		}
	},
	StainedGlassSeraphMattePoster = {
		CommerceId = "8294359458243543472",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Stained Glass Seraph Matte Poster",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://119816829986787" },
		Items = {
			{
				Name = "PrismlightCapsule",
				Amount = 1
			}
		}
	},
	StainedGlassAnticornMattePoster = {
		CommerceId = "5315228304737960425",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Stained Glass Anticorn Matte Poster",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://89978556460424" },
		Items = {
			{
				Name = "SanctumGlassCapsule",
				Amount = 1
			}
		}
	},
	HeartbaneJournal = {
		CommerceId = "4253511384446009750",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Heartbane Lovestruck Journal",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://134212255049299" },
		Items = {
			{
				Name = "HeartBreakWingPotion",
				Amount = 1
			}
		}
	},
	HeartbaneHoodie = {
		CommerceId = "4602716277427667417",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Heartbane Hoodie",
		SubText = "",
		LayoutOrder = 2,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://139036319791525" },
		Items = {
			{
				Name = "LovestruckCapsule",
				Amount = 1
			}
		}
	},
	PillowFightPajamaPants = {
		CommerceId = "5104374229055046074",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Pillow Fight Pajama Pants",
		SubText = "",
		LayoutOrder = 2,
		SalePercentageOff = 15,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://138263267827086" },
		Items = {}
	},
	HolidayBlanket = {
		CommerceId = "39377912616190400",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Holiday Blanket",
		SubText = "",
		LayoutOrder = 2,
		SalePercentageOff = 15,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://128891662462250" },
		Items = {
			{
				Name = "FestiveWingPotion",
				Amount = 1
			}
		}
	},
	SketchbookDeskMat = {
		CommerceId = "4021501329514693098",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Sketchbook Desk Mat",
		SubText = "",
		LayoutOrder = 3,
		SalePercentageOff = 35,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://118215289282808" },
		Items = {}
	},
	SaurequineTee = {
		CommerceId = "4703947802732659003",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Saurequine Tee",
		SubText = "",
		LayoutOrder = 4,
		SalePercentageOff = 35,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://131378127796004" }
	},
	CelestialHoodie = {
		CommerceId = "105702214443204916",
		ProductType = "MerchBundle",
		LayoutOrder = 5,
		SalePercentageOff = 25,
		ForcedDisplayName = "Celestial Hoodie",
		SubText = "",
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://70676417611367", "rbxassetid://114982496486584" }
	},
	DeskMat = {
		CommerceId = "1811651679542313268",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Renaissance Desk Mat",
		SubText = "",
		LayoutOrder = 6,
		SalePercentageOff = 35,
		SaleStarts = DateTime.fromIsoDate("2025-12-19T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-01-13T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://110176668525987", "rbxassetid://98666823067401" }
	},
	LunarBentoBox = {
		CommerceId = "5625605752329339342",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Lunar Celebration Bento Box",
		SubText = "",
		LayoutOrder = 6,
		SaleStarts = DateTime.fromIsoDate("2026-1-30T08:00:00").UnixTimestamp,
		SaleEnds = DateTime.fromIsoDate("2026-02-20T08:00:00").UnixTimestamp,
		ProductImages = { "rbxassetid://137039960338137" },
		Items = {
			{
				Name = "LunarNewYearsWingPotion",
				Amount = 1
			}
		}
	},
	HLStickers = {
		CommerceId = "3562144559705882887",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Horse Life Stickers",
		SubText = "",
		LayoutOrder = 7,
		SaleStarts = 1764316800,
		SaleEnds = 1764662340,
		ProductImages = { "rbxassetid://82995227154637" }
	},
	SketchingJournal = {
		CommerceId = "8779107331177447717",
		ProductType = "MerchBundle",
		ForcedDisplayName = "Sketching Journal",
		SubText = "",
		LayoutOrder = 8,
		SaleStarts = 1764316800,
		SaleEnds = 1764662340,
		ProductImages = { "rbxassetid://74296618472683", "rbxassetid://126770607712986", "rbxassetid://100320185400745" }
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return t