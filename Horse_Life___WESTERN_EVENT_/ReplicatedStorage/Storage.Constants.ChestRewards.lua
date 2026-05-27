-- https://lua.expert/
local BossRewards = script.Parent:WaitForChild("BossRewards")
return {
	BossChestTier1 = require(BossRewards:WaitForChild("BossTier1")),
	BossChestTier2 = require(BossRewards:WaitForChild("BossTier2")),
	BossChestTier3 = require(BossRewards:WaitForChild("BossTier3")),
	BossBonusChest = require(BossRewards:WaitForChild("BossTier1")),
	GoldEgg = require(script.Parent.KirinEggRewards.GoldKirinEgg),
	SilverEgg = require(script.Parent.KirinEggRewards.SilverKirinEgg),
	BronzeEgg = require(script.Parent.KirinEggRewards.BronzeKirinEgg),
	Geode = require(script.Parent.GeodeRewards),
	PumpkinKingChest = require(script.Parent.GlobalBossRewards.PumpkinKing),
	UndeadHauntChest = require(script.Parent.GlobalBossRewards.UndeadHaunt),
	WitchQueenChest = require(script.Parent.GlobalBossRewards.WitchQueen),
	WinterSpiritChest = require(script.Parent.GlobalBossRewards.WinterSpirit),
	ClubRewardChest = require(script.Parent.GlobalBossRewards.ClubRewardChest),
	GoldenClubRewardChest = require(script.Parent.GlobalBossRewards.GoldenClubRewardChest),
	CupidSpiritChest = require(script.Parent.GlobalBossRewards.Cupid),
	ClubChestTier1 = require(script.Parent.StableClubRewards.ClubTier1),
	ClubChestTier2 = require(script.Parent.StableClubRewards.ClubTier2),
	ClubChestTier3 = require(script.Parent.StableClubRewards.ClubTier3),
	RacesChestTier1 = require(script.Parent.RaceLeaderboardRewards.RacesTier1),
	RacesChestTier2 = require(script.Parent.RaceLeaderboardRewards.RacesTier2),
	RacesChestTier3 = require(script.Parent.RaceLeaderboardRewards.RacesTier3)
}