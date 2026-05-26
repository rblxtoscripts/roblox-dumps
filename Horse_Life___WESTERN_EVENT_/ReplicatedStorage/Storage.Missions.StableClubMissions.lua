-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StableClubsService", {
	Deferred = true
})
local v2 = Sonar("Club", {
	Deferred = true
})
local function globalClubCheck(p1, p2, p3, p4, p5) --[[ globalClubCheck | Line: 11 | Upvalues: v1 (copy), v2 (copy) ]]
	local v12 = v1.GetPlayersClub(p5)
	if not v1.HasClub(p5) then
		return false
	end
	local v22 = v2.GetById(v12.Value)
	if not v22 then
		return false
	end
	local v3 = v22:GetMemberData(p5.Player.UserId)
	if v3 and v3.JoinedAt then
		return not (workspace:GetServerTimeNow() - v3.JoinedAt < 86400)
	else
		return false
	end
end
return {
	{
		Type = "Tame",
		Amount = NumberRange.new(10, 15),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "HarvestNode",
		Amount = NumberRange.new(10, 20),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "JumpObstacle",
		Amount = NumberRange.new(15, 20),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "Foal",
		Amount = NumberRange.new(1, 2),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "Breed",
		Amount = NumberRange.new(2, 3),
		Reward = {
			Amount = 200,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "StatLevelUp",
		Amount = NumberRange.new(5, 10),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "Sell",
		Amount = NumberRange.new(3, 5),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "BuyAccessory",
		Amount = NumberRange.new(2, 4),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "CompleteRace",
		Amount = NumberRange.new(5, 7),
		Reward = {
			Amount = 150,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	},
	{
		Type = "HarvestPlant",
		Amount = NumberRange.new(10, 15),
		Reward = {
			Amount = 100,
			Name = "ClubPoints"
		},
		Check = globalClubCheck
	}
}