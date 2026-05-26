-- https://lua.expert/
local t = {
	{
		Name = "RandomFoal",
		Amount = 1,
		P = 35,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Mint",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "RandomEquipment",
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true
	},
	{
		Name = "LovelyCapsule",
		Amount = 1,
		P = 20,
		DoNotRemove = true
	}
}
for i, v in ipairs({
	"HeartKeeperKey",
	"EternalRose",
	"CupidsBow",
	"CupidStaff",
	"ValentinesFork",
	"CherubsMist",
	"HeartShades",
	"DarkCupidLantern",
	"HeartStaff",
	"CupidsHeadwings",
	"CupidsArrow",
	"HeartBox",
	"LovesickSycthe",
	"ValentinesArrow",
	"LovingBow",
	"LovingTeddyBear",
	"LoveLetterBag",
	"CupidsRibbonBow",
	"ValentinesLantern",
	"LoveLetter",
	"HeartSickle",
	"SweetHeartPurse",
	"LovelyHeartBass",
	"LoveBug",
	"UnlovelyHat",
	"CuteHeartsBonnet",
	"RuffledHeartsSkirt",
	"LoveBugAntennae",
	"LovelyHat",
	"StrawberryStaff",
	"Heartboppers",
	"SweetheartGuitar",
	"RoseVeilHat"
}) do
	table.insert(t, {
		Theme = "Rose",
		Amount = 1,
		P = 25,
		DoNotRemove = true,
		Name = v
	})
end
return {
	Drops = t,
	Species = {
		{
			NoMutations = true,
			P = 75,
			Species = { "Pastrequine", "Heartbane" },
			Preset = { "HeartLove", "HeartPassion" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4
			}
		}
	},
	MutationChances = {
		Glow = 5
	}
}