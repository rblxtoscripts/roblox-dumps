-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalGridButton")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("DailyLoginService")
local v4 = Sonar("DisplayAnimalClient")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("ItemSetService")
local v9 = Sonar("Maid")
local v10 = Sonar("MarketplaceUtils")
local v11 = Sonar("PlayerWrapper")
local v12 = Sonar("State")
local v13 = Sonar("StateUtils")
local v14 = Sonar("TimeUtils")
local v15 = Sonar("StorageUtils")
local StreakGraceWait = v3.StreakGraceWait
local v16 = Sonar(v15.Get("SubscriberRewardTiers"))
local RestoreDailyStreak = Sonar(v15.Get("RestoreDailyStreak")).RestoreDailyStreak
local v17 = v11.GetClient()
local DailyLogin = v17.PlayerData.DailyLogin
local Streak = Players.LocalPlayer.PlayerGui:WaitForChild("RewardsGuiNew").ContainerFrame.Menu.TabFrames.Streak
local Tiers = Streak.Content.RewardsContainer.Tiers
local StreakRewardContainer = Streak.Content.StreakRewardContainer
local BoostsContainer = Streak.Content.BoostsContainer
local Day7ProgressBar = BoostsContainer.Day7ProgressBar
local Day14ProgressBar = BoostsContainer.Day14ProgressBar
local StreakLabel = Streak.Content.LongestStreakContainer.StreakLabel
local MissedFrame = Streak.Content.MissedFrame
local RestoreButton = MissedFrame.RestoreButton
local StreakLabel_2 = Streak.Content.StreakContainer.StreakLabel
local v18 = v9.new()
local function createRewardGridButton(p1) --[[ createRewardGridButton | Line: 67 | Upvalues: v1 (copy), v7 (copy), v17 (copy), v8 (copy), v6 (copy) ]]
	assert(typeof(p1) == "table", "Got bad config")
	assert(if typeof(p1.GuiObject) == "Instance" then p1.GuiObject:IsA("GuiObject") else false, "Got bad config.GuiObject")
	assert(typeof(p1.RewardData) == "table", "Got bad config.RewardData")
	if p1.RewardData.Species then
		assert(typeof(p1.RewardData.Species) == "string", "Got bad config.RewardData.Species")
	else
		assert(typeof(p1.RewardData.Name) == "string", "Got bad config.RewardData.Name")
	end
	local GuiObject_2 = p1.GuiObject
	local RewardData_2 = p1.RewardData
	local isNotSpecies = RewardData_2.Species ~= nil
	local v72 = if RewardData_2.Name == nil then false else true
	local t = {
		DoNotClone = true,
		ForceVisible = true,
		GuiObject = GuiObject_2,
		ViewportFrame = p1.ViewportFrame,
		GetAmount = function() --[[ GetAmount | Line: 89 | Upvalues: RewardData_2 (copy) ]]
			return RewardData_2.Amount
		end
	}
	if RewardData_2.Species then
		t.DisplayName = "Themed Horse"
		t.Owner = v17.Player
		t.SlotValue = v8:_giveHorse(v17, RewardData_2)
		t.Theme = RewardData_2.Theme
	else
		t.Item = v6.GetByName(RewardData_2.Name)
	end
	local v9 = (if isNotSpecies then v1 else v7).new(t)
	GuiObject_2.AmountLabel.Visible = v72
	GuiObject_2.HorseViewport.Visible = isNotSpecies
	GuiObject_2.ItemViewport.Visible = v72
	return v9
end
function t.Run(p1, p2) --[[ Run | Line: 113 | Upvalues: v18 (copy), v12 (copy), v14 (copy), DailyLogin (copy), StreakGraceWait (copy), MissedFrame (copy), v2 (copy), RestoreButton (copy), v10 (copy), v17 (copy), RestoreDailyStreak (ref), v16 (copy), Tiers (copy), v5 (copy), Day7ProgressBar (copy), Day14ProgressBar (copy), v13 (copy), StreakLabel (copy), v9 (copy), v3 (copy), StreakRewardContainer (copy), createRewardGridButton (copy), v4 (copy), StreakLabel_2 (copy) ]]
	v18:DoCleaning()
	if not p2 then
		return
	end
	local v1 = v18:GiveTask(v12.fromProperty(v14.ValueBase, "Value"))
	local v22 = v18:GiveTask(v12.fromProperty(DailyLogin.LastLogin, "Value"))
	local v32 = v18:GiveTask(v12.fromProperty(DailyLogin.LongestStreak, "Value"))
	local v42 = v18:GiveTask(v12.fromProperty(DailyLogin.Streak, "Value"))
	local v52 = v18:GiveTask(v12.fromProperty(DailyLogin.StreaksRestored, "Value"))
	local v6 = v18:GiveTask(v12.fromProperty(DailyLogin.StreakTier, "Value"))
	local v7 = v52:get()
	v18:GiveTask(v12.subscribeMulti({ v22, v52, v1 }, function(p1, p2) --[[ Line: 131 | Upvalues: v14 (ref), StreakGraceWait (ref), v7 (copy), MissedFrame (ref) ]]
		local v1 = if StreakGraceWait <= v14.Get() - p1 then true else false
		MissedFrame.Visible = (if v1 then p2 == v7 else v1) and p1 >= 1000000000
	end))
	v18:GiveTask(v2.new(RestoreButton, {
		Click = function() --[[ Click | Line: 143 | Upvalues: v14 (ref), v22 (copy), StreakGraceWait (ref), v10 (ref), v17 (ref), RestoreDailyStreak (ref) ]]
			if StreakGraceWait <= v14.Get() - v22:get() then
				v10.PromptPurchase(v17.Player, RestoreDailyStreak.ProductId)
			end
		end
	}))
	v18:GiveTask(task.spawn(function() --[[ Line: 156 | Upvalues: v16 (ref), Tiers (ref), v18 (ref), v5 (ref) ]]
		for v1, v2 in v16 do
			local v3 = Tiers:FindFirstChild(v2.TierName)
			if v3 then
				for i = 1, 6 do
					local v52 = v2.Rewards[i % #v2.Rewards + 1]
					local v6 = v18:GiveTask(v3.Pool.Template:Clone())
					if v52.Amount then
						v6.AmountLabel.Text = ("x%*"):format((v5.suffix(v52.Amount)))
					end
					v6.ItemViewport.Image = v52.Image
					v6.ItemViewport.Visible = true
					v6.AmountLabel.Visible = if v52.Amount == nil then false else true
					v6.HorseViewport.Visible = false
					v6.NameLabel.Text = string.gsub(v52.ItemType, "(%l)(%u)", "%1 %2")
					v6.Visible = true
					v6.Parent = v3.Pool
				end
			end
		end
	end))
	local v8, v92 = v42, v32
	for v102, v11 in {
		[7] = Day7ProgressBar,
		[14] = Day14ProgressBar
	} do
		v18:GiveTask(v13.stateToProperty({
			Property = "Size",
			Instance = v11.Bar,
			State = v18:GiveTask(v12.deriveMulti({ v8, (v18:GiveTask(v12.fromProperty(v11, "AbsoluteSize"))) }, function(p1, p2) --[[ Line: 197 | Upvalues: v102 (copy) ]]
				return UDim2.fromScale(math.clamp(p1 / v102, p2.Y / p2.X, 1), 1)
			end))
		}))
	end
	v18:GiveTask(v13.stateToProperty({
		Property = "Text",
		Instance = StreakLabel,
		State = v92,
		Transform = v5.suffix
	}))
	local v132 = nil
	local v142 = v18:GiveTask(v9.new())
	v18:GiveTask(v12.subscribeMulti({ v8, v6, v1 }, function(p1, p2) --[[ Line: 214 | Upvalues: v132 (ref), v3 (ref), v142 (copy), StreakRewardContainer (ref), createRewardGridButton (ref) ]]
		if p2 == v132 then
			return
		end
		v132 = p2
		local v1 = v3:GetStreakRewardsFromTier(p2 + 1)
		if v1 then
			v142._thread = task.spawn(function() --[[ Line: 229 | Upvalues: v1 (copy), v142 (ref), StreakRewardContainer (ref), createRewardGridButton (ref) ]]
				local sum = 1
				while true do
					if #v1 > 1 or not v142._reward then
						sum = sum + (if #v1 > 1 then 1 else 0)
						if #v1 < sum then
							sum = 1
						end
						local v2 = v1[sum]
						v142._reward = createRewardGridButton({
							GuiObject = StreakRewardContainer.ItemContainer,
							RewardData = v2,
							ViewportFrame = StreakRewardContainer.ItemContainer:FindFirstChild((("%*Viewport"):format(if v2.Species ~= nil then "Horse" else "Item")))
						})
					end
					task.wait(2.5)
				end
			end)
		end
	end))
	v18:GiveTask(v12.subscribeMulti({ v8, v6, v1 }, function() --[[ Line: 256 | Upvalues: v3 (ref), v17 (ref), StreakRewardContainer (ref) ]]
		local v1 = v3:GetCurrentStreakForTier(v17)
		StreakRewardContainer.AmountLabel.Text = ("%*/%*"):format(v1, (v3:GetStreakTier(v17) + 1) * v3.StreakDaysPerTier)
		local v32 = v3:CanClaimStreakReward(v17) and true or false
		for v4, v5 in {
			[v32] = { "ClaimButton", "ClaimTitle" },
			[not v32] = { "AmountLabel", "Title" }
		} do
			for v6, v7 in v5 do
				StreakRewardContainer[v7].Visible = v4
			end
		end
	end))
	v18:GiveTask(v2.new(StreakRewardContainer.ClaimButton, {
		Click = function() --[[ Click | Line: 277 | Upvalues: v3 (ref), v4 (ref), v17 (ref) ]]
			local v1 = v3:ClaimStreakReward()
			if not v1 or v1 == true then
				return
			end
			for k, v in pairs(v1) do
				v4:DisplaySlot({
					Type = "Claimed",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = true,
					Slot = v17:GetItemFolder("Animals"):WaitForChild(v1[1])
				})
				if v4.YieldForNoDisplay() then
					task.wait(0.5)
				end
			end
		end
	}))
	v18:GiveTask(v13.stateToProperty({
		Property = "Text",
		Instance = StreakLabel_2,
		State = v8,
		Transform = v5.suffix
	}))
end
return t