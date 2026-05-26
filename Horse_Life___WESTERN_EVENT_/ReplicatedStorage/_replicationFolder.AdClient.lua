-- https://lua.expert/
local t = {}
local AdService = game:GetService("AdService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PromptClient")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("TimeUtils")
local v4 = v2.GetRemoteFunction("RequestShowAdEvent")
local v5 = v2.GetRemoteFunction("HasBreedingSpeedUpAvailable")
local v6 = v2.GetRemoteFunction("IsBreedingSpeedUpTarget")
local t2 = {
	StarterPack = "Starter Pack",
	DailyBonus = "Daily Bonus",
	DailyMission = "1 Daily Mission Completed",
	StreakDay = "2x Daily Rewards",
	BreedingSpeedUp = "Breeding Speed Up"
}
local t3 = {
	Default = {
		Title = "Would you like to watch an ad?",
		Body = function(p1) --[[ Body | Line: 39 | Upvalues: t2 (copy) ]]
			return "You will receive: " .. t2[p1]
		end
	},
	BreedingSpeedUp = {
		Title = "Take control!",
		Body = "Watch a quick video and reduce your wait by 20%"
	},
	DailyBonus = {
		Title = "Would you like to watch an ad?",
		Body = function(p1, p2) --[[ Body | Line: 52 ]]
			return ("You will receive a daily bonus of %*"):format(p2)
		end
	}
}
local v7 = false
local v8 = 0
local v9 = 0
local t4 = {
	Value = nil,
	At = 0
}
local t5 = {}
local t6 = {
	adAvailable = false,
	availableUntil = 0
}
local function setAdAvailability(p1) --[[ setAdAvailability | Line: 72 | Upvalues: t6 (copy), v3 (copy) ]]
	t6.adAvailable = p1
	if p1 then
		t6.availableUntil = v3.Get() + 3600
	else
		t6.availableUntil = 0
	end
end
function t.StartAdAvailabilityManager(p1) --[[ StartAdAvailabilityManager | Line: 88 | Upvalues: v7 (ref), v3 (copy), t (copy), t6 (copy) ]]
	if not v7 then
		v7 = true
		local v1 = p1 or 3000
		task.spawn(function() --[[ Line: 97 | Upvalues: v7 (ref), v3 (ref), t (ref), t6 (ref), v1 (copy) ]]
			while v7 do
				local v12 = v3.Get()
				if not t.IsAdAvailable() or t6.availableUntil <= v12 then
					t.CheckAdAvailability()
				end
				local v2 = v1
				if t.IsAdAvailable() then
					v2 = math.min(math.max(0, t6.availableUntil - v12), v1)
				end
				local v72 = v3.Get() + v2
				while v3.Get() < v72 do
					task.wait(1)
				end
			end
		end)
	end
end
function t.IsAdAvailable() --[[ IsAdAvailable | Line: 120 | Upvalues: t6 (copy), v3 (copy) ]]
	return t6.adAvailable and v3.Get() < t6.availableUntil
end
function t.CheckAdAvailability(p1) --[[ CheckAdAvailability | Line: 124 | Upvalues: v3 (copy), t6 (copy), t (copy), v8 (ref), AdService (copy) ]]
	local v1 = v3.Get()
	local v2 = t6.availableUntil - v1
	if t.IsAdAvailable() and v2 > 30 then
		if p1 == nil then
			return
		end
		p1.Visible = true
	elseif v8 == 0 or not (tick() - v8 <= 1) then
		v8 = tick()
		task.spawn(function() --[[ Line: 144 | Upvalues: AdService (ref), t6 (ref), p1 (copy), t (ref), v3 (ref) ]]
			local v1, v2 = pcall(function() --[[ Line: 145 | Upvalues: AdService (ref) ]]
				return AdService:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
			end)
			if v1 and v2 then
				if v2.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable then
					t6.adAvailable = true
					t6.availableUntil = v3.Get() + 3600
					if p1 ~= nil then
						p1.Visible = true
					end
				else
					t6.adAvailable = false
					t6.availableUntil = 0
					if p1 ~= nil then
						p1.Visible = false
					end
					task.delay(60, function() --[[ Line: 180 | Upvalues: t (ref), p1 (ref) ]]
						t.CheckAdAvailability(p1)
					end)
				end
			else
				t6.adAvailable = false
				t6.availableUntil = 0
				if p1 == nil then
					task.delay(60, function() --[[ Line: 159 | Upvalues: t (ref), p1 (ref) ]]
						t.CheckAdAvailability(p1)
					end)
					return
				end
				p1.Visible = false
				task.delay(60, function() --[[ Line: 159 | Upvalues: t (ref), p1 (ref) ]]
					t.CheckAdAvailability(p1)
				end)
			end
		end)
	end
end
function t.ShowAd(p1, p2) --[[ ShowAd | Line: 187 | Upvalues: v1 (copy), t3 (copy), v9 (ref), v4 (copy) ]]
	v1.Prompt({
		Type = "PlayAd",
		Setup = function(p12) --[[ Setup | Line: 191 | Upvalues: t3 (ref), p1 (copy), p2 (copy) ]]
			local Title = p12:FindFirstChild("Title", true)
			local v1 = nil
			local v2 = (if v1 then v1 else t3[p1]) or t3.Default
			if Title and Title:IsA("TextLabel") then
				Title.Text = v2.Title
			end
			local v3 = v2
			local v4 = typeof(v3.Body) == "function" and v3.Body(p1, p2) or v3.Body
			local v5 = p12.Content and p12.Content:FindFirstChild("Label")
			if v5 and v5:IsA("TextLabel") then
				v5.Text = v4
				return
			end
			local v6 = nil
			local v7 = (if v6 then v6 else p12:FindFirstChild("Label", true)) or p12:FindFirstChild("Description", true)
			if not (v7 and v7:IsA("TextLabel")) then
				return
			end
			v7.Text = v4
		end,
		Run = function() --[[ Run | Line: 219 | Upvalues: v9 (ref), v4 (ref), p1 (copy) ]]
			local v2 = nil
			if not ((if v2 then v2 else v9 == 0) or tick() - v9 >= 1) then
				return true
			end
			v9 = tick()
			v4:InvokeServer(p1)
			return true
		end,
		Cancel = function() --[[ Cancel | Line: 234 ]]
			return true
		end
	})
end
function t.ShowAdWithoutPrompt(p1) --[[ ShowAdWithoutPrompt | Line: 240 | Upvalues: v9 (ref), v4 (copy) ]]
	if v9 ~= 0 and not (tick() - v9 > 1) then
		return
	end
	v4:InvokeServer(p1)
	v9 = tick()
end
function t.GetHasBreedingSpeedUpAvailable() --[[ GetHasBreedingSpeedUpAvailable | Line: 247 | Upvalues: t4 (copy), v5 (copy) ]]
	local v1 = tick()
	if v1 - t4.At <= 10 then
		return t4.Value
	end
	local v2, v3 = pcall(function() --[[ Line: 252 | Upvalues: v5 (ref) ]]
		return v5:InvokeServer()
	end)
	if v2 then
		t4.Value = v3
		t4.At = v1
		return v3
	else
		return nil
	end
end
function t.GetIsBreedingSpeedUpTarget(p1) --[[ GetIsBreedingSpeedUpTarget | Line: 263 | Upvalues: t5 (copy), v6 (copy) ]]
	local v1 = tick()
	local v2 = t5[p1]
	if v2 and v1 - v2.At <= 10 then
		return v2.Value
	end
	local v3, v4 = pcall(function() --[[ Line: 269 | Upvalues: v6 (ref), p1 (copy) ]]
		return v6:InvokeServer(p1)
	end)
	if v3 then
		t5[p1] = {
			Value = v4,
			At = v1
		}
		return v4
	else
		return false
	end
end
return t