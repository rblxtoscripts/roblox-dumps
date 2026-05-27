-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DailyLoginService")
local v2 = Sonar("TimeUtils")
local IsServer = Sonar("Constants").IsServer
local StreakGraceWait = v1.StreakGraceWait
local LocalPlayer = Players.LocalPlayer
function t.new(p1) --[[ new | Line: 22 | Upvalues: t (copy), LocalPlayer (copy), IsServer (copy), v1 (copy), v2 (copy), StreakGraceWait (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = p1.Maid
	v22.Player = p1.Player
	v22.PlayerData = p1.PlayerData
	v22.PlayerWrapper = p1
	v22.IsLocalPlayer = v22.Player == LocalPlayer
	v22.CanProcessDailyLogin = v22.IsLocalPlayer or IsServer
	if v22.CanProcessDailyLogin then
		v22.DailyLoginData = v22.PlayerData.DailyLogin
		v22.PlayerWrapper.DailyLoginData = v22.DailyLoginData
		if IsServer then
			v22.DailyLoginData.LongestStreak.Value = math.max(v22.DailyLoginData.LongestStreak.Value, v22.DailyLoginData.Streak.Value)
			if not v22.DailyLoginData.RestoredStreakTier.Value then
				v22.DailyLoginData.RestoredStreakTier.Value = true
				v22.DailyLoginData.StreakTier.Value = v1:GetStreakTier(v22.PlayerWrapper)
			end
			local function updateStreakBonuses() --[[ updateStreakBonuses | Line: 46 | Upvalues: v22 (copy) ]]
				local count = 0
				if v22.PlayerWrapper.LoyaltyHandler.LoyaltyActive then
					if v22.PlayerWrapper.PlayerData.Loyalty.InGroup.Value then
						count = count + 1
					end
					if v22.DailyLoginData.Streak.Value >= 7 then
						count = count + 1
					end
					if v22.DailyLoginData.Streak.Value >= 14 then
						count = count + 1
					end
				end
				v22.PlayerWrapper.PlayerData.ExtraHotbarSlots.Value = count
			end
			v22.PlayerWrapper.Maid:GiveTask(v22.PlayerWrapper.LoyaltyChangedSignal:Connect(updateStreakBonuses))
			v22.PlayerWrapper.Maid:GiveTask(v22.DailyLoginData.Streak:GetPropertyChangedSignal("Value"):Connect(updateStreakBonuses))
			v22.PlayerWrapper.Maid:GiveTask(v22.PlayerWrapper.PlayerData.Loyalty.InGroup:GetPropertyChangedSignal("Value"):Connect(updateStreakBonuses))
			local count = 0
			if v22.PlayerWrapper.LoyaltyHandler.LoyaltyActive then
				if v22.PlayerWrapper.PlayerData.Loyalty.InGroup.Value then
					count = count + 1
				end
				if v22.DailyLoginData.Streak.Value >= 7 then
					count = count + 1
				end
				if v22.DailyLoginData.Streak.Value >= 14 then
					count = count + 1
				end
			end
			v22.PlayerWrapper.PlayerData.ExtraHotbarSlots.Value = count
			local function updateStreak() --[[ updateStreak | Line: 69 | Upvalues: v22 (copy), v2 (ref), StreakGraceWait (ref) ]]
				local LastLogin = v22.DailyLoginData:FindFirstChild("LastLogin")
				local ResetLogin = v22.DailyLoginData:FindFirstChild("ResetLogin")
				local Streak = v22.DailyLoginData:FindFirstChild("Streak")
				if not (LastLogin and (ResetLogin and Streak)) then
					return
				end
				if ResetLogin.Value then
					return
				end
				if Streak.Value <= 0 then
					return
				end
				if not (StreakGraceWait <= v2.Get() - LastLogin.Value) then
					return
				end
				Streak.Value = 0
			end
			v22.PlayerWrapper.Maid:GiveTask(v2.AttachToTime(updateStreak))
			updateStreak()
		end
		v22.PlayerWrapper.DailyLoginWrapper = v22
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 101 ]]
	setmetatable(p1, nil)
end
return t