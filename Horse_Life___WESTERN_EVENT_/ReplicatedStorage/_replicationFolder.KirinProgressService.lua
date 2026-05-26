-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("TimeUtils")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("TimeSeedClass")
local v5 = RunService:IsServer()
local v6 = Sonar("AnalyticsService", "Server")
local v7 = Sonar("Constants")
local KirinEggData = v7.KirinEggData
local v8 = v4.new({
	Duration = 72000
})
t.DailyResetTimer = v8
function t.ResetProgress(p1) --[[ ResetProgress | Line: 25 | Upvalues: v1 (copy), v8 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p1)
	if v12.PlayerData.KirinProgress.CurrentSeed.Value == v8.CurrentSeed then
		return
	end
	v12.PlayerData.KirinProgress.CurrentSeed.Value = v8.CurrentSeed
	for v2, v3 in v12.PlayerData.KirinProgress.Progress:GetChildren() do
		local TotalCollected = v3:FindFirstChild("TotalCollected")
		if TotalCollected then
			TotalCollected.Value = 0
		end
		v3.Claimed.Value = false
	end
end
function t.GetWhispsCollected(p1) --[[ GetWhispsCollected | Line: 44 | Upvalues: v1 (copy) ]]
	return v1.getWrapperFromPlayer(p1).PlayerData.KirinProgress.Progress.Whisps.TotalCollected.Value
end
function t.GetEggData(p1, p2) --[[ GetEggData | Line: 52 | Upvalues: v1 (copy) ]]
	return v1.getWrapperFromPlayer(p1).PlayerData.KirinProgress.Eggs[p2]
end
function t.Init() --[[ Init | Line: 59 | Upvalues: v5 (copy), v1 (copy), t (copy), v8 (copy), v2 (copy), v7 (copy), v3 (copy), KirinEggData (copy), v6 (copy) ]]
	if not v5 then
		return
	end
	v1.bindToPlayers(function(p1) --[[ Line: 62 | Upvalues: t (ref) ]]
		t.ResetProgress(p1)
	end, function(p1) --[[ Line: 65 ]] end)
	v8.SeedChanged:Connect(function() --[[ Line: 67 | Upvalues: t (ref) ]]
		for v1, v2 in game.Players:GetPlayers() do
			t.ResetProgress(v2)
		end
	end)
	v2.AttachToTime(function() --[[ Line: 73 | Upvalues: v1 (ref), v2 (ref), v7 (ref) ]]
		for v12, v22 in game.Players:GetPlayers() do
			local v3 = v1.getWrapperFromPlayer(v22)
			if v3 and v3.PlayerData:FindFirstChild("KirinProgress") then
				for v4, v5 in v3.PlayerData.KirinProgress.Eggs:GetChildren() do
					if v5.Claimed.Value and v2.Get() - v5.LastClaim.Value >= v7.KirinEggCooldown then
						v5.Claimed.Value = false
						v5.Submitted.Value = 0
					end
				end
			end
		end
	end)
	v3.GetRemoteFunction("ClaimKirinEgg").OnServerInvoke = function(p1, p2) --[[ Line: 91 | Upvalues: v1 (ref), t (ref), KirinEggData (ref), v2 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		local v22 = t.GetEggData(p1, p2)
		local v3 = KirinEggData[p2]
		if not v3 then
			return false, "Invalid egg name!"
		end
		if v22.Submitted.Value >= v3.MaxTurnin and not v22.Claimed.Value then
			v22.Claimed.Value = true
			v22.LastClaim.Value = v2.Get()
			v22.Submitted.Value = 0
			v12:GiveItem({
				Amount = 1,
				Source = "KirinEggs",
				IgnoreLimit = true,
				Name = p2 .. "Egg"
			})
			return true, "You have collected the egg!"
		else
			return false, "Cannot claim egg yet!"
		end
	end
	v3.GetRemoteFunction("SubmitKirinEgg").OnServerInvoke = function(p1, p2) --[[ Line: 119 | Upvalues: v1 (ref), t (ref), v6 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		local v2 = t.GetEggData(p1, p2)
		local v3 = v12:GetItemValue("Coal")
		if not v3 then
			return false, "You don\'t have any coal to submit!"
		end
		if v3.Value > 0 then
			v3.Value = v3.Value - 1
			v6.ReportResourceEvent(p1, "Sink", "Miscellaneous", "Coal", "KirinProgress", 1)
			v2.Submitted.Value = v2.Submitted.Value + 1
			return true, "You have submitted coal!"
		else
			return false, "You don\'t have any coal to submit!"
		end
	end
	v3.GetRemoteFunction("ClaimKirinWhisp").OnServerInvoke = function(p1) --[[ Line: 141 | Upvalues: v1 (ref), v2 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		local Whisps = v12.PlayerData.KirinProgress.Progress:FindFirstChild("Whisps")
		local TotalCollected = Whisps:FindFirstChild("TotalCollected")
		if v12.LastKirinWhisp and v2.Get() - v12.LastKirinWhisp < 0.5 then
			return false, "You\'re claiming too fast!"
		end
		v12.LastKirinWhisp = v2.Get()
		if not (TotalCollected.Value < 10) then
			return false, "You have already collected 10 Whisps."
		end
		TotalCollected.Value = TotalCollected.Value + 1
		v12:IncrementMission({
			Type = "FireWisp",
			Amount = 1
		})
		if not (TotalCollected.Value >= 10) or Whisps.Claimed.Value then
			return true, "You have collected the Whisps!"
		end
		Whisps.Claimed.Value = true
		v12:GiveItem({
			Name = "Coal",
			Amount = 1,
			Source = "FireWisps",
			IgnoreLimit = true
		})
		return true, "You have collected the Whisps!"
	end
	v3.GetRemoteFunction("DestroyKirinResource").OnServerInvoke = function(p1, p2) --[[ Line: 183 | Upvalues: v1 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		local Resources = v12.PlayerData.KirinProgress.Progress:FindFirstChild("Resources")
		local TotalCollected = Resources:FindFirstChild("TotalCollected")
		if not (TotalCollected.Value < 10) then
			return false, "You have already collected 10 of this resource."
		end
		TotalCollected.Value = TotalCollected.Value + 1
		v12:IncrementMission({
			Type = "DungeonDebris",
			Amount = 1
		})
		if not (TotalCollected.Value >= 10) then
			return true, "You have collected the resource!"
		end
		Resources.Claimed.Value = true
		v12:GiveItem({
			Name = "Coal",
			Amount = 1,
			Source = "KirinResources",
			IgnoreLimit = true
		})
		return true, "You have collected the resource!"
	end
	v3.GetRemoteFunction("KirinDance").OnServerInvoke = function(p1) --[[ Line: 215 | Upvalues: v1 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		local Dance = v12.PlayerData.KirinProgress.Progress:FindFirstChild("Dance")
		local TotalCollected = Dance:FindFirstChild("TotalCollected")
		if Dance.Claimed.Value then
			return false, "You have already completed the dance!"
		else
			TotalCollected.Value = TotalCollected.Value + 1
			Dance.Claimed.Value = true
			v12:GiveItem({
				Name = "Coal",
				Amount = 1,
				Source = "KirinDance",
				IgnoreLimit = true
			})
			return true, "You have completed the dance!"
		end
	end
end
t.Init()
return t