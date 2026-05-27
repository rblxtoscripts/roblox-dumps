-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("RemoteUtils")
local v1 = Sonar("TimeUtils")
local v2 = Sonar("DailyLoginService")
local v3 = Sonar("GuiManager")
local v4 = Sonar("ButtonTest")
local v5 = Sonar("TabManager")
local v6 = Sonar("Maid")
local v7 = Sonar("FormatNumber")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("ItemGridButton")
local v10 = Sonar("Button")
local v11 = Sonar("PermissionsService")
local v12 = Sonar("FormatString")
local v13 = Sonar("CodesService")
local v14 = Sonar("MarketplaceUtils")
local v15 = Sonar("TutorialService")
local v16 = Sonar("AnimalDataService")
local v17 = Sonar("AnimalGridButton")
local v18 = Sonar("StorageUtils")
local v19 = Sonar("PlaceTypeService")
local v20 = Sonar("Constants")
local StreakWait = v2.StreakWait
local StreakGraceWait = v2.StreakGraceWait
local RestoreDailyStreak = Sonar(v18.Get("RestoreDailyStreak")).RestoreDailyStreak
local v21 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = v21.Player:WaitForChild("PlayerGui"):WaitForChild("RewardsGui").ContainerFrame
local DailyLogin = v21.PlayerData.DailyLogin
local v22 = v6.new()
local t2 = {
	DailyLogin = function(p1, p2) --[[ DailyLogin | Line: 49 | Upvalues: v5 (copy), v22 (copy), v4 (copy), Sonar (copy), v21 (copy), v7 (copy), DailyLogin (copy), v6 (copy), v2 (copy), v9 (copy), v8 (copy), v1 (copy), v19 (copy), v14 (copy), RestoreDailyStreak (copy), StreakGraceWait (copy), StreakWait (copy), v20 (copy), v16 (copy), v17 (copy) ]]
		local v12 = v5.getTabFromInstance(p1)
		if v12.ContentsLoaded then
			return
		end
		v12.ContentsLoaded = true
		local LockedFrame = p1.LockedFrame
		local v23 = p1.Content
		v22:GiveTask(v4.new(LockedFrame.OpenButton, {
			Click = function() --[[ Click | Line: 58 | Upvalues: Sonar (ref) ]]
				Sonar("LoyaltyRewardsGui"):Prompt()
			end
		}))
		local function setLockedLabel() --[[ setLockedLabel | Line: 63 | Upvalues: LockedFrame (copy), v21 (ref), v23 (ref) ]]
			LockedFrame.Visible = not v21.LoyaltyHandler.LoyaltyActive
			v23.StreakRewardContainer.Visible = not LockedFrame.Visible
		end
		v22:GiveTask(v21.LoyaltyChangedSignal:Connect(setLockedLabel))
		LockedFrame.Visible = not v21.LoyaltyHandler.LoyaltyActive
		v23.StreakRewardContainer.Visible = not LockedFrame.Visible
		local function setStreakLabel() --[[ setStreakLabel | Line: 70 | Upvalues: v23 (ref), v7 (ref), DailyLogin (ref) ]]
			v23.StreakContainer.StreakLabel.Text = v7.suffix(DailyLogin.Streak.Value)
		end
		v22:GiveTask(DailyLogin.Streak:GetPropertyChangedSignal("Value"):Connect(setStreakLabel))
		v23.StreakContainer.StreakLabel.Text = v7.suffix(DailyLogin.Streak.Value)
		local function setLongestStreakLabel() --[[ setLongestStreakLabel | Line: 76 | Upvalues: v23 (ref), v7 (ref), DailyLogin (ref) ]]
			v23.LongestStreakContainer.StreakLabel.Text = v7.suffix(DailyLogin.LongestStreak.Value)
		end
		v22:GiveTask(DailyLogin.LongestStreak:GetPropertyChangedSignal("Value"):Connect(setLongestStreakLabel))
		v23.LongestStreakContainer.StreakLabel.Text = v7.suffix(DailyLogin.LongestStreak.Value)
		local function setGroupLabel() --[[ setGroupLabel | Line: 82 | Upvalues: v21 (ref), v23 (ref) ]]
			v23.GroupContainer.StatusLabel.Visible = not v21.PlayerData.Loyalty.InGroup.Value
		end
		v22:GiveTask(v21.PlayerData.Loyalty.InGroup:GetPropertyChangedSignal("Value"):Connect(setGroupLabel))
		v23.GroupContainer.StatusLabel.Visible = not v21.PlayerData.Loyalty.InGroup.Value
		local v42 = v6.new()
		v22:GiveTask(v42)
		local function runStreakRewardsLoop() --[[ runStreakRewardsLoop | Line: 97 | Upvalues: v42 (copy), v2 (ref), v21 (ref), v6 (ref), Sonar (ref), v23 (ref), v9 (ref), v8 (ref) ]]
			v42:DoCleaning()
			local v1 = v2:GetStreakRewardsFromTier(v2:GetCurrentStreakForTier(v21) + 1)
			local v22 = v6.new()
			v42:GiveTask(v22)
			local v3 = false
			local function createReward(p1) --[[ createReward | Line: 106 | Upvalues: Sonar (ref), v21 (ref), v23 (ref), v9 (ref), v8 (ref) ]]
				if p1.Species then
					local v1 = Sonar("ItemSetService"):_giveHorse(v21, p1)
					local v2 = Sonar("AnimalGridButton").new({
						DisplayName = "Themed Horse",
						ForceVisible = true,
						DoNotClone = true,
						SlotValue = v1,
						Owner = v21.Player,
						GuiObject = v23.StreakRewardContainer.ItemContainer,
						Theme = p1.Theme,
						GetAmount = function() --[[ GetAmount | Line: 119 | Upvalues: p1 (copy) ]]
							return p1.Amount
						end
					})
					v2.Frame:FindFirstChild("HorseViewport", true).Visible = true
					v2.Frame:FindFirstChild("ItemViewport", true).Visible = false
					v23.StreakRewardContainer.ItemContainer.AmountLabel.Visible = false
					return v2
				else
					local v3 = v9.new({
						ForceVisible = true,
						DoNotClone = true,
						Item = v8.GetByName(p1.Name),
						GuiObject = v23.StreakRewardContainer.ItemContainer,
						GetAmount = function() --[[ GetAmount | Line: 133 | Upvalues: p1 (copy) ]]
							return p1.Amount
						end
					})
					v3.Frame:FindFirstChild("HorseViewport", true).Visible = false
					v3.Frame:FindFirstChild("ItemViewport", true).Visible = true
					v23.StreakRewardContainer.ItemContainer.AmountLabel.Visible = true
					return v3
				end
			end
			local function runDisplayLoop() --[[ runDisplayLoop | Line: 143 | Upvalues: v42 (ref), v3 (ref), v1 (copy), createReward (copy), v22 (copy) ]]
				v42:GiveTask(function() --[[ Line: 144 | Upvalues: v3 (ref) ]]
					v3 = true
				end)
				while not v3 do
					for k, v in pairs(v1) do
						if v3 then
							return
						end
						local v12 = createReward(v)
						if v12 then
							v22:GiveTask(v12)
						end
						task.wait(2.5)
						v22:DoCleaning()
						_ = true
					end
				end
			end
			if #v1 > 1 then
				task.spawn(runDisplayLoop)
			else
				v22:GiveTask((createReward(v1[1])))
			end
		end
		local v52 = nil
		local function setRewardStreak() --[[ setRewardStreak | Line: 172 | Upvalues: v2 (ref), v21 (ref), v52 (ref), runStreakRewardsLoop (copy), v23 (ref) ]]
			local v1 = v2:GetStreakTier(v21)
			local v22 = v1 ~= v52
			v52 = v1
			if v22 then
				task.spawn(runStreakRewardsLoop)
			end
			if v2:CanClaimStreakReward(v21) then
				v23.StreakRewardContainer.AmountLabel.Visible = false
				v23.StreakRewardContainer.Title.Visible = false
				v23.StreakRewardContainer.ClaimTitle.Visible = true
				v23.StreakRewardContainer.ClaimButton.Visible = true
			else
				v23.StreakRewardContainer.AmountLabel.Text = v2:GetCurrentStreakForTier(v21) .. "/" .. (v2:GetStreakTier(v21) + 1) * v2.StreakDaysPerTier
				v23.StreakRewardContainer.AmountLabel.Visible = true
				v23.StreakRewardContainer.Title.Visible = true
				v23.StreakRewardContainer.ClaimTitle.Visible = false
				v23.StreakRewardContainer.ClaimButton.Visible = false
			end
		end
		v22:GiveTask(v1.AttachToTime(setRewardStreak))
		v22:GiveTask(DailyLogin.Streak:GetPropertyChangedSignal("Value"):Connect(setRewardStreak))
		v22:GiveTask(DailyLogin.StreakTier:GetPropertyChangedSignal("Value"):Connect(setRewardStreak))
		setRewardStreak()
		v22:GiveTask(v4.new(v23.StreakRewardContainer.ClaimButton, {
			Click = function() --[[ Click | Line: 204 | Upvalues: v2 (ref), Sonar (ref), v21 (ref) ]]
				local v1 = v2:ClaimStreakReward()
				if not v1 or v1 == true then
					return
				end
				for k, v in pairs(v1) do
					Sonar("DisplayAnimalClient"):DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = true,
						Slot = v21:GetItemFolder("Animals"):WaitForChild(v1[1])
					})
					if Sonar("DisplayAnimalClient").YieldForNoDisplay() then
						task.wait(0.5)
					end
				end
			end
		}))
		local function setRestoreButton() --[[ setRestoreButton | Line: 224 | Upvalues: v23 (ref), DailyLogin (ref) ]]
			v23.RestoreButton.Visible = if DailyLogin.Streak.Value < DailyLogin.LongestStreak.Value then DailyLogin.LongestStreak.Value >= 7 else false
		end
		v22:GiveTask(DailyLogin.Streak:GetPropertyChangedSignal("Value"):Connect(setRestoreButton))
		v22:GiveTask(DailyLogin.LongestStreak:GetPropertyChangedSignal("Value"):Connect(setRestoreButton))
		local RestoreButton = v23.RestoreButton
		RestoreButton.Visible = if DailyLogin.Streak.Value < DailyLogin.LongestStreak.Value then DailyLogin.LongestStreak.Value >= 7 else false
		v22:GiveTask(v4.new(v23.RestoreButton, {
			Click = function() --[[ Click | Line: 233 | Upvalues: v19 (ref), v14 (ref), v21 (ref), RestoreDailyStreak (ref) ]]
				v19.IsTestGame()
				v14.PromptPurchase(v21.Player, RestoreDailyStreak.ProductId)
			end
		}))
		local function setTimerLabel() --[[ setTimerLabel | Line: 242 | Upvalues: v1 (ref), DailyLogin (ref), StreakGraceWait (ref), v23 (ref), StreakWait (ref), v2 (ref), v21 (ref) ]]
			if StreakGraceWait <= v1.Get() - DailyLogin.LastLogin.Value then
				v23.RewardContainer.Content.Reset.Timer.Visible = false
				v23.RewardContainer.Content.Reset.Title.Visible = false
				v23.RewardContainer.Content.Reset.Visible = false
				return
			end
			if v1.Get() < DailyLogin.LastLogin.Value + StreakWait then
				v23.RewardContainer.Content.Reset.Timer.Text = v1.FormatString(DailyLogin.LastLogin.Value + StreakWait - v1.Get())
				v23.RewardContainer.Content.Reset.Title.Text = "Next reward in:"
			else
				v23.RewardContainer.Content.Reset.Title.Text = "Time left to claim:"
				v23.RewardContainer.Content.Reset.Timer.Text = v1.FormatString(DailyLogin.LastLogin.Value + StreakGraceWait - v1.Get())
			end
			v23.RewardContainer.Content.Reset.Timer.Visible = true
			v23.RewardContainer.Content.Reset.Title.Visible = true
			local v12 = v2:GetCurrentStreak(v21) == 0
			v23.RewardContainer.Content.Reset.Position = v12 and UDim2.new(0.406, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
			v23.RewardContainer.Content.Reset.Visible = true
		end
		v22:GiveTask(v1.AttachToTime(setTimerLabel))
		v22:GiveTask(DailyLogin.LastLogin:GetPropertyChangedSignal("Value"):Connect(setTimerLabel))
		setTimerLabel()
		local t = {}
		local function setStreak() --[[ setStreak | Line: 273 | Upvalues: v2 (ref), v21 (ref), t (copy), setTimerLabel (copy) ]]
			local v1 = v2:GetCurrentStreak(v21)
			for k, v in pairs(t) do
				local v22
				local v3 = k <= v1
				local v4 = if k == v1 + 1 then true else false
				v.DayTitle.Text = if v4 then "TODAY" else "DAY " .. k
				if v4 and (not v3 and v2:CanClaimReward(v21)) then
					v.DayTitle.Text = "TODAY!"
					v.DayTitle.TextColor3 = Color3.fromRGB(244, 255, 147)
					v.DayTitle.UIStroke.Color = Color3.fromRGB(231, 88, 40)
					v.ClaimedFrame.Visible = false
					v.ClaimButton.Visible = true
					continue
				end
				if v3 then
					v22 = if v2:CanClaimReward(v21) or k ~= v1 then "DAY " .. k else "TODAY!"
					v.DayTitle.Text = v22
					v.DayTitle.TextColor3 = Color3.fromRGB(244, 255, 147)
					v.DayTitle.UIStroke.Color = Color3.fromRGB(231, 88, 40)
					v.ClaimedFrame.Visible = true
					v.ClaimButton.Visible = false
					continue
				end
				v.DayTitle.Text = "DAY " .. k
				v.DayTitle.TextColor3 = Color3.fromRGB(37, 206, 181)
				v.DayTitle.UIStroke.Color = Color3.fromRGB(15, 109, 156)
				v.ClaimedFrame.Visible = false
				v.ClaimButton.Visible = false
			end
			setTimerLabel()
		end
		for k, v in pairs(v20.DailyLoginRewards) do
			local v72 = v23.RewardContainer.Content:FindFirstChild(k)
			if not v72 then
				v72 = v23.RewardContainer.Content.Default:Clone()
				v23.RewardContainer.Content.Default.Visible = false
				v22:GiveTask(v72)
			end
			v22:GiveTask(v4.new(v72.ClaimButton, {
				Click = function() --[[ Click | Line: 311 | Upvalues: v2 (ref), Sonar (ref), v21 (ref) ]]
					local v1 = v2:ClaimReward()
					if not v1 or v1 == true then
						return
					end
					for k, v in pairs(v1) do
						Sonar("DisplayAnimalClient"):DisplaySlot({
							Type = "Claimed",
							AllowNaming = true,
							ShowMaxWarning = true,
							MobileClickBackgroundToClose = true,
							Slot = v21:GetItemFolder("Animals"):WaitForChild(v1[1])
						})
						if Sonar("DisplayAnimalClient").YieldForNoDisplay() then
							task.wait(0.5)
						end
					end
				end
			}))
			local v82 = v6.new()
			v22:GiveTask(v82)
			local v92 = false
			local v10 = v6.new()
			v22:GiveTask(v10)
			local function createReward(p1) --[[ createReward | Line: 338 | Upvalues: v10 (copy), v72 (ref), v16 (ref), v21 (ref), v17 (ref), v9 (ref), v8 (ref) ]]
				v10:DoCleaning()
				if p1.Species then
					v72.ItemContainer.Visible = false
					v72.HorseContainer.Visible = true
					local v1 = p1.Preset[math.random(1, #p1.Preset)]
					local v2 = v16.CreateSlot(v21, {
						DoNotParent = true,
						DoNotIncrementCount = true,
						SpeciesAsName = true,
						Age = 66,
						Species = p1.Species,
						Preset = v1 or nil,
						Origin = p1.Origin or "Wild",
						Seed = math.random(1, 1000000),
						MaxCosmetics = p1.MaxCosmetics
					})
					local v3 = v17.new({
						DisplayName = "Themed Horse",
						ForceVisible = true,
						DoNotClone = true,
						SlotValue = v2,
						Owner = game.Players.LocalPlayer,
						ViewportFrame = v72.HorseContainer.Viewport,
						GuiObject = v72
					})
					v10:GiveTask(v2)
					v10:GiveTask(v3)
				else
					v72.ItemContainer.Visible = true
					v72.HorseContainer.Visible = false
					return v9.new({
						ForceVisible = true,
						DoNotClone = true,
						Item = v8.GetByName(p1.Name),
						GuiObject = v72,
						ViewportFrame = v72.ItemContainer.Viewport,
						GetAmount = function() --[[ GetAmount | Line: 386 | Upvalues: p1 (copy) ]]
							return p1.Amount
						end
					})
				end
			end
			local function runDisplayLoop() --[[ runDisplayLoop | Line: 392 | Upvalues: v22 (ref), v92 (ref), v (copy), createReward (copy), v82 (copy) ]]
				v22:GiveTask(function() --[[ Line: 393 | Upvalues: v92 (ref) ]]
					v92 = true
				end)
				while not v92 do
					for k, v2 in pairs(v) do
						if v92 then
							return
						end
						local v1 = createReward(v2)
						if v1 then
							v82:GiveTask(v1)
						end
						task.wait(2.5)
						v82:DoCleaning()
						_ = true
					end
				end
			end
			if #v > 1 then
				task.spawn(runDisplayLoop)
			else
				v82:GiveTask(createReward(v[1]))
			end
			v72.Name = k
			v72.Visible = true
			v72.Parent = v23.RewardContainer.Content
			t[k] = v72
		end
		v22:GiveTask(DailyLogin.LastLogin:GetPropertyChangedSignal("Value"):Connect(setStreak))
		v22:GiveTask(v1.AttachToTime(setStreak))
		v22:GiveTask(DailyLogin.CurrentStreak:GetPropertyChangedSignal("Value"):Connect(setStreak))
		setStreak()
		Sonar("AdClient").CheckAdAvailability(v23.AdButton)
		v4.new(v23.AdButton, {
			Click = function() --[[ Click | Line: 432 | Upvalues: Sonar (ref) ]]
				Sonar("AdClient").ShowAd("StreakDay")
			end
		})
	end,
	Stipend = function(p1, p2) --[[ Stipend | Line: 437 | Upvalues: v5 (copy), v11 (copy), v21 (copy), v1 (copy), v22 (copy), v10 (copy), v12 (copy) ]]
		local v13 = v5.getTabFromInstance(p1)
		if v13.ContentsLoaded then
			return
		end
		v13.ContentsLoaded = true
		local v2 = p1.Content
		for k, v in pairs(v11.GetStipendSets()) do
			local v3 = v21.Player.Badges:FindFirstChild(k) or v21.Player.Permissions:FindFirstChild(k)
			if v3 then
				local v4 = v2.ScrollingContainer.Content.Default:Clone()
				v2.ScrollingContainer.Content.Default.Visible = false
				v4.Icon.Image = v.Image
				local v52 = v21.PlayerData.PermissionStipend[k]
				local function updateState() --[[ updateState | Line: 459 | Upvalues: v3 (copy), v52 (copy), v11 (ref), v1 (ref), v4 (copy) ]]
					if not v3.Value then
						v4.TimeLabel.Visible = false
						v4.Visible = false
						return
					end
					local v12 = v52.Value + v11.TimeToGiveStipend - v1.Get()
					v4.TimeLabel.Text = if v12 <= 0 then "Claim" else v1.FormatString(v12)
					v4.LayoutOrder = if v12 <= 0 then -1 else 0
					v4.Visible = true
				end
				v22:GiveTask(v1.AttachToTime(updateState))
				v22:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(updateState))
				v22:GiveTask(v52:GetPropertyChangedSignal("Value"):Connect(updateState))
				updateState()
				v22:GiveTask(v10.new(v4, {
					Click = function() --[[ Click | Line: 503 | Upvalues: v11 (ref), k (copy) ]]
						v11:ClaimStipend(k)
					end
				}))
				v4.Content.RoleLabel.Text = v12.separateWordsInString(k):upper()
				v4.Name = k
				v4.Parent = v2.ScrollingContainer.Content
				v22:GiveTask(v4)
				continue
			end
			warn("NO PERMISSION VALUE FOR", k)
		end
	end,
	Codes = function(p1) --[[ Codes | Line: 515 | Upvalues: v5 (copy), v4 (copy), v13 (copy), v21 (copy) ]]
		local v1 = v5.getTabFromInstance(p1)
		if v1.Opened then
			return
		end
		v1.Opened = true
		local TextBox = p1.Content.Codes.InputContainer.TextBox
		local t = {
			Error = function() --[[ Error | Line: 524 | Upvalues: p1 (copy) ]]
				p1.Content.Codes.ErrorLabel.Text = "Error redeeming code!"
				p1.Content.Codes.ErrorLabel.Visible = true
				task.delay(2, function() --[[ Line: 527 | Upvalues: p1 (ref) ]]
					p1.Content.Codes.ErrorLabel.Visible = false
				end)
			end,
			NoExist = function() --[[ NoExist | Line: 531 | Upvalues: p1 (copy) ]]
				p1.Content.Codes.ErrorLabel.Text = "This code doesn\'t exist!"
				p1.Content.Codes.ErrorLabel.Visible = true
				task.delay(2, function() --[[ Line: 534 | Upvalues: p1 (ref) ]]
					p1.Content.Codes.ErrorLabel.Visible = false
				end)
			end,
			AlreadyRedeemed = function() --[[ AlreadyRedeemed | Line: 538 | Upvalues: p1 (copy) ]]
				p1.Content.Codes.RedeemedLabel.Visible = true
				task.delay(2, function() --[[ Line: 540 | Upvalues: p1 (ref) ]]
					p1.Content.Codes.RedeemedLabel.Visible = false
				end)
			end,
			Expired = function(p12) --[[ Expired | Line: 544 | Upvalues: p1 (copy) ]]
				p1.Content.Codes.ErrorLabel.Text = "This code has expired!"
				p1.Content.Codes.ErrorLabel.Visible = true
				task.delay(2, function() --[[ Line: 547 | Upvalues: p1 (ref) ]]
					p1.Content.Codes.ErrorLabel.Visible = false
				end)
			end,
			Redeemed = function() --[[ Redeemed | Line: 551 | Upvalues: p1 (copy) ]]
				p1.Content.Codes.ValidLabel.Visible = true
				task.delay(2, function() --[[ Line: 553 | Upvalues: p1 (ref) ]]
					p1.Content.Codes.ValidLabel.Visible = false
				end)
			end
		}
		v4.new(p1.Content.RedeemButton, {
			Click = function() --[[ Click | Line: 560 | Upvalues: TextBox (copy), v13 (ref), v21 (ref), t (copy) ]]
				if not (#TextBox.Text <= 0) then
					t[v13.RedeemCode(v21, TextBox.Text)](TextBox.Text)
				end
			end
		})
		TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 568 | Upvalues: TextBox (copy) ]]
			local _ = TextBox:IsFocused()
		end)
		TextBox.FocusLost:Connect(function() --[[ Line: 572 ]] end)
	end
}
function t.OpenFromJoin() --[[ OpenFromJoin | Line: 580 | Upvalues: v15 (copy), v21 (copy), v2 (copy), t (copy), v3 (copy), ContainerFrame (copy) ]]
	if not v15.HasCompletedPrimaryTutorial(v21) then
		return
	end
	if not v2:CanClaimReward(v21) then
		return
	end
	t.Open()
	repeat
		task.wait()
	until not v3.IsFrameOpen(ContainerFrame)
end
function t.Open() --[[ Open | Line: 590 | Upvalues: v3 (copy), ContainerFrame (copy) ]]
	if v3.IsFrameOpen(ContainerFrame) then
		return
	end
	v3.OpenMainFrame(ContainerFrame, {
		CloseAll = "CloseOverlay",
		CallbackArgs = {}
	})
end
function t.Close(p1) --[[ Close | Line: 600 | Upvalues: v3 (copy), ContainerFrame (copy) ]]
	v3.CloseMainFrame(ContainerFrame, {})
	v3.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.Cleanup(p1) --[[ Cleanup | Line: 610 | Upvalues: v22 (copy), ContainerFrame (copy), v5 (copy) ]]
	v22:DoCleaning()
	for k, v in pairs(ContainerFrame.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v1 = ContainerFrame.Menu.TabFrames:FindFirstChild(v.Name)
			if v1 then
				v5.CleanContents(v1)
			end
		end
	end
end
function t.Init(p1) --[[ Init | Line: 621 | Upvalues: v3 (copy), ContainerFrame (copy), v5 (copy), t2 (copy), v10 (copy), v11 (copy), v21 (copy), v22 (copy), t (copy), v4 (copy) ]]
	v3.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	for k, v in pairs(ContainerFrame.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v1 = ContainerFrame.Menu.TabFrames:FindFirstChild(v.Name)
			if v1 then
				v5.AddTab(v1, {
					ParentFrame = ContainerFrame,
					Button = v
				})
				local function setSize() --[[ setSize | Line: 643 | Upvalues: v (copy), v5 (ref), v1 (copy) ]]
					v.UIScale.Scale = if v5.IsTabOpen(v1) then 1.2 else 1
				end
				v5.AddStateCallback(v1, "OnOpen", setSize)
				v5.AddStateCallback(v1, "OnClose", setSize)
				v5.AddStateCallback(v1, "OnOpen", function() --[[ Line: 649 | Upvalues: t2 (ref), v (copy), v1 (copy) ]]
					t2[v.Name](v1, v)
				end)
				v10.new(v, {
					Click = function() --[[ Click | Line: 655 | Upvalues: v5 (ref), v1 (copy) ]]
						v5.OpenTab(v1)
					end
				})
				continue
			end
			v10.new(v, {
				Click = function() --[[ Click | Line: 661 | Upvalues: t2 (ref), v (copy) ]]
					t2[v.Name](v)
				end
			})
		end
	end
	local Stipend = ContainerFrame.TabButtons.Stipend
	local t3 = {}
	for k, v in pairs(v11.GetStipendSets()) do
		local v2 = v21.Player.Badges:FindFirstChild(k) or v21.Player.Permissions:FindFirstChild(k)
		if v2 then
			local function updateState() --[[ updateState | Line: 678 | Upvalues: v2 (copy), t3 (copy), k (copy), Stipend (copy) ]]
				if v2.Value then
					t3[k] = true
				else
					t3[k] = nil
				end
				Stipend.Visible = next(t3)
			end
			v22:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(updateState))
			if v2.Value then
				t3[k] = true
			else
				t3[k] = nil
			end
			Stipend.Visible = next(t3)
			continue
		end
		warn("NO PERMISSION VALUE FOR", k)
	end
	v3.AddStateCallback(ContainerFrame, "OnOpen", function(p1) --[[ Line: 691 | Upvalues: v5 (ref), ContainerFrame (ref) ]]
		v5.OpenTab(v5.getOpenedTab(ContainerFrame) or ContainerFrame.Menu.TabFrames.DailyLogin)
	end)
	v3.AddStateCallback(ContainerFrame, "OnClose", function(p1) --[[ Line: 695 | Upvalues: v3 (ref), ContainerFrame (ref) ]]
		if v3.MainFrameOpen ~= ContainerFrame then
			return
		end
		v3.OpenHUD({
			DoNotCloseMainFrame = true
		})
	end)
	v3.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 702 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v4.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 707 | Upvalues: t (ref) ]]
			t.Close(true)
		end
	})
end
t:Init()
return t