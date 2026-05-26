-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("InstanceUtils")
local v2 = Sonar("LoginRewardsService")
local v3 = Sonar("LoginRewards")
local v4 = Sonar("Constants")
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	if not p1:IsLocalOrServer() then
		return v2
	end
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = p1.PlayerData
	v2.LoginRewardsFolder = v2.PlayerData.LoginRewards
	v2.ActiveLoginRewards = {}
	if v4.IS_SERVER then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initServer(p1) --[[ _initServer | Line: 39 | Upvalues: v2 (copy) ]]
	for v1, v22 in p1.LoginRewardsFolder:GetChildren() do
		if not v2.GetLoginRewardsData(v22.Name) then
			warn("Found old login rewards in player data. Data is being destroyed:", v22.Name)
			v22:Destroy()
		end
	end
	local function canInitialiseLoginRewards(p12) --[[ canInitialiseLoginRewards | Line: 47 | Upvalues: p1 (copy) ]]
		if p12.IsActive then
			if not p12.IsActive(p1.PlayerWrapper) then
				return false
			end
		elseif not p12.ActiveByDefault then
			return false
		end
		return true
	end
	for v4, v5 in v2.GetAllLoginRewards() do
		local v3
		v3 = if v5.IsActive then v5.IsActive(p1.PlayerWrapper) and true or false else v5.ActiveByDefault and true or false
		if v3 then
			p1:AddLoginRewards(v4)
		end
	end
end
function t._initClient(p1) --[[ _initClient | Line: 68 ]]
	local function loginRewardsAdded(p12) --[[ loginRewardsAdded | Line: 69 | Upvalues: p1 (copy) ]]
		p1:AddLoginRewards(p12.Name)
	end
	p1.Maid:GiveTask(p1.LoginRewardsFolder.ChildAdded:Connect(loginRewardsAdded))
	for v1, v2 in p1.LoginRewardsFolder:GetChildren() do
		p1:AddLoginRewards(v2.Name)
	end
end
function t.GetLoginRewardsPlayerData(p1, p2) --[[ GetLoginRewardsPlayerData | Line: 80 ]]
	return p1.LoginRewardsFolder:FindFirstChild(p2)
end
function t.GetOrCreateLoginRewardsPlayerData(p1, p2) --[[ GetOrCreateLoginRewardsPlayerData | Line: 85 | Upvalues: v4 (copy), v1 (copy), v2 (copy) ]]
	local v12 = p1:GetLoginRewardsPlayerData(p2)
	if not v12 and v4.IS_SERVER then
		v12 = v1.Create("Folder", {
			Name = p2,
			Parent = p1.LoginRewardsFolder
		})
	end
	if v12 and v4.IS_SERVER then
		if not v12:FindFirstChild("LastClaimTime") then
			v1.Create("NumberValue", {
				Name = "LastClaimTime",
				Value = 0,
				Parent = v12
			})
		end
		if not v12:FindFirstChild("Streak") then
			v1.Create("IntValue", {
				Name = "Streak",
				Value = 0,
				Parent = v12
			})
		end
		if not v12:FindFirstChild("LongestStreak") then
			v1.Create("IntValue", {
				Name = "LongestStreak",
				Value = 0,
				Parent = v12
			})
		end
		if not v12:FindFirstChild("Repetitions") then
			v1.Create("IntValue", {
				Name = "Repetitions",
				Value = 0,
				Parent = v12
			})
		end
		if not v12:FindFirstChild("StreakLostTime") then
			v1.Create("NumberValue", {
				Name = "StreakLostTime",
				Value = 0,
				Parent = v12
			})
		end
		local Tracks = v12:FindFirstChild("Tracks")
		if not Tracks then
			Tracks = v1.Create("Folder", {
				Name = "Tracks",
				Parent = v12
			})
		end
		for v42, v5 in v2.GetLoginRewardsSequence(p2):GetTracks() do
			if not Tracks:FindFirstChild(v42) then
				if v42 == "Default" then
					v1.Create("IntValue", {
						Value = 0,
						Name = v42,
						Parent = Tracks
					})
					continue
				end
				local v6 = v1.Create("Folder", {
					Name = v42,
					Parent = Tracks
				})
				v1.Create("IntValue", {
					Name = "Value",
					Value = 0,
					Parent = v6
				})
				if v5.ProductId then
					v1.Create("BoolValue", {
						Name = "Unlocked",
						Value = false,
						Parent = v6
					})
				end
			end
		end
	end
	return v12
end
function t.GetLoginRewards(p1, p2) --[[ GetLoginRewards | Line: 182 ]]
	return p1.ActiveLoginRewards[p2]
end
function t.AddLoginRewards(p1, p2) --[[ AddLoginRewards | Line: 186 | Upvalues: v3 (copy) ]]
	if not p1.ActiveLoginRewards[p2] then
		p1.ActiveLoginRewards[p2] = v3.new(p1:GetOrCreateLoginRewardsPlayerData(p2), p1.PlayerWrapper)
	end
end
function t.RemoveLoginRewards(p1, p2) --[[ RemoveLoginRewards | Line: 197 ]]
	if p1.ActiveLoginRewards[p2] then
		p1.ActiveLoginRewards[p2]:Destroy()
		p1.ActiveLoginRewards[p2] = nil
	end
end
return t