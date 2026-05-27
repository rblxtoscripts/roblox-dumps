-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalGridButton")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("DailyLoginService")
local v4 = Sonar("DisplayAnimalClient")
local v5 = Sonar("InputTypeDetector")
local v6 = Sonar("FormatNumber")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("ItemSetService")
local v10 = Sonar("Maid")
local v11 = Sonar("MarketplaceUtils")
local v12 = Sonar("PlayerWrapper")
local v13 = Sonar("PromptClient")
local v14 = Sonar("State")
local v15 = Sonar("StateUtils")
local v16 = Sonar("TimeUtils")
local v17 = Sonar("ToolTipClient")
local v18 = Sonar("StorageUtils")
local DailyLoginRewards = Sonar("Constants").DailyLoginRewards
local RestoreDailyStreak = Sonar(v18.Get("RestoreDailyStreak")).RestoreDailyStreak
local StreakWait = v3.StreakWait
local StreakGraceWait = v3.StreakGraceWait
local v19 = v12.GetClient()
local DailyLogin = v19.PlayerData.DailyLogin
local DailyLogin_2 = Players.LocalPlayer.PlayerGui:WaitForChild("RewardsGuiNew").ContainerFrame.Menu.TabFrames.DailyLogin
local RewardContainer = DailyLogin_2.Content.RewardContainer
local Reset = RewardContainer.Content.Reset
local StreakLabel = DailyLogin_2.Content.StreakContainer.StreakLabel
local v20 = v10.new()
local function createRewardGridButton(p1) --[[ createRewardGridButton | Line: 65 | Upvalues: v1 (copy), v7 (copy), v19 (copy), v9 (copy), v8 (copy) ]]
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
		GetAmount = function() --[[ GetAmount | Line: 87 | Upvalues: RewardData_2 (copy) ]]
			return RewardData_2.Amount
		end
	}
	if RewardData_2.Species then
		t.DisplayName = "Themed Horse"
		t.Owner = v19.Player
		t.SlotValue = v9:_giveHorse(v19, RewardData_2)
		t.Theme = RewardData_2.Theme
	else
		t.Item = v8.GetByName(RewardData_2.Name)
	end
	local v92 = (if isNotSpecies then v1 else v7).new(t)
	GuiObject_2.HorseContainer.Visible = isNotSpecies
	GuiObject_2.ItemContainer.Visible = v72
	GuiObject_2.ItemContainer.AmountLabel.Visible = v72
	return v92
end
local function claimDailyReward() --[[ claimDailyReward | Line: 111 | Upvalues: v3 (copy), v4 (copy), v19 (copy) ]]
	local v1 = v3:ClaimReward()
	if not v1 or v1 == true then
		return
	end
	for v2, v32 in v1 do
		v4:DisplaySlot({
			Type = "Claimed",
			AllowNaming = true,
			ShowMaxWarning = true,
			MobileClickBackgroundToClose = true,
			Slot = v19:GetItemFolder("Animals"):WaitForChild(v1[1])
		})
		if v4.YieldForNoDisplay() then
			task.wait(0.5)
		end
	end
end
function t.Run(p1, p2) --[[ Run | Line: 132 | Upvalues: v20 (copy), v14 (copy), DailyLogin (copy), v16 (copy), v10 (copy), DailyLoginRewards (copy), RewardContainer (copy), v2 (copy), v17 (copy), v5 (copy), StreakGraceWait (copy), v13 (copy), MarketplaceService (copy), RestoreDailyStreak (ref), v11 (copy), v19 (copy), claimDailyReward (copy), createRewardGridButton (copy), v3 (copy), v15 (copy), StreakLabel (copy), v6 (copy), Reset (copy), StreakWait (copy) ]]
	v20:DoCleaning()
	if p2 then
		local v1 = v20:GiveTask(v14.fromProperty(DailyLogin.LastLogin, "Value"))
		local v22 = v20:GiveTask(v14.fromProperty(DailyLogin.Streak, "Value"))
		local v32 = v20:GiveTask(v14.fromProperty(v16.ValueBase, "Value"))
		v20:GiveTask(task.spawn(function() --[[ Line: 144 | Upvalues: v20 (ref), v10 (ref), DailyLoginRewards (ref), RewardContainer (ref), v2 (ref), v17 (ref), v5 (ref), DailyLogin (ref), v16 (ref), StreakGraceWait (ref), v13 (ref), MarketplaceService (ref), RestoreDailyStreak (ref), v11 (ref), v19 (ref), claimDailyReward (ref), createRewardGridButton (ref) ]]
			local v1 = v20:GiveTask(v10.new())
			local v22 = v20:GiveTask(v10.new())
			for v3, v4 in DailyLoginRewards do
				local v52 = RewardContainer.Content:FindFirstChild(v3)
				local v6 = if v52 then v52.ClaimButton else nil
				if v6 and v52 then
					local v7 = nil
					v20:GiveTask(v2.new(v52.HelpButton, {
						Click = function() --[[ Click | Line: 158 | Upvalues: v17 (ref), v52 (copy), v7 (ref), v3 (copy), DailyLoginRewards (ref), v5 (ref) ]]
							if v17:GetTip() then
								v17:RemoveToolTip()
								return
							end
							v17:CreateToolTip({
								Type = "DailyLoginReward",
								GuiObject = v52.HelpButton,
								Offset = Vector2.new(0.5, 0),
								Get = function() --[[ Get | Line: 167 | Upvalues: v7 (ref), v3 (ref), DailyLoginRewards (ref) ]]
									local v1 = table.clone(v7)
									local Description = v1.Description
									local v2
									if Description then
										v2 = v1
									else
										local format = string.format
										local v4
										if v1.Species and v3 ~= #DailyLoginRewards then
											v2 = v1
											v4 = "horse"
										else
											v2 = v1
											v4 = ""
										end
										Description = format("A %s %s", v4, if v2.Species and v3 ~= #DailyLoginRewards then "with a unique theme." else "premium themed horse.")
									end
									v2.Description = Description
									return v2
								end
							})
							local v1 = v17:GetTip()
							local v2 = v5.IsMobileInputType()
							if not (v1 and v1.TipFrame) then
								return
							end
							local UIScale = v1.TipFrame.UIScale
							if not UIScale then
								return
							end
							UIScale.Scale = if v2 then 1.5 else 1
						end
					}))
					v20:GiveTask(v2.new(v6, {
						Click = function() --[[ Click | Line: 194 | Upvalues: DailyLogin (ref), v16 (ref), StreakGraceWait (ref), v13 (ref), MarketplaceService (ref), RestoreDailyStreak (ref), v2 (ref), v11 (ref), v19 (ref), claimDailyReward (ref) ]]
							local LastLogin = DailyLogin.LastLogin.Value
							local v1 = StreakGraceWait <= v16.Get() - LastLogin
							if v1 and LastLogin >= 1000000000 then
								v13.Prompt({
									Type = "RestoreStreakUpsell",
									Setup = function(p1, p2) --[[ Setup | Line: 202 | Upvalues: MarketplaceService (ref), RestoreDailyStreak (ref), DailyLogin (ref), v16 (ref), StreakGraceWait (ref), v2 (ref), v11 (ref), v19 (ref), v13 (ref) ]]
										p2.Maid:GiveTask(task.spawn(function() --[[ Line: 203 | Upvalues: MarketplaceService (ref), RestoreDailyStreak (ref), p1 (copy) ]]
											local PriceInRobux = MarketplaceService:GetProductInfo(RestoreDailyStreak.ProductId, Enum.InfoType.Product).PriceInRobux
											p1.RobuxPurchase.Content.RobuxLabel.Text = ("%*%*"):format(utf8.char(57346), PriceInRobux)
											p1.RobuxPurchase.Content.RobuxLabel.Visible = true
										end))
										p2.Maid:GiveTask(task.spawn(function() --[[ Line: 211 | Upvalues: DailyLogin (ref), v16 (ref), StreakGraceWait (ref), p1 (copy) ]]
											while true do
												local v1
												local LastLogin = DailyLogin.LastLogin.Value
												local v3 = math.max(60, v16.Get() - LastLogin - StreakGraceWait)
												v1 = if v16.DayCycle <= v3 then ("~%* days"):format(v3 // v16.DayCycle) elseif v16.Cycles.Hour <= v3 then ("~%* hours"):format(v3 // v16.Cycles.Hour) else ("~%* minute(s)"):format(v3 // v16.Cycles.Minute)
												if LastLogin < 1000000000 then
													v1 = "a long time"
												end
												p1.Content.MaxLabel.Text = ("You lost your streak <font color=\"rgb(255,64,64)\">%*</font> ago!"):format(v1)
												task.wait(1)
											end
										end))
										p2.Maid:GiveTask(v2.new(p1.RobuxPurchase.Content.BuyButton, {
											Click = function() --[[ Click | Line: 236 | Upvalues: DailyLogin (ref), v16 (ref), StreakGraceWait (ref), v11 (ref), v19 (ref), RestoreDailyStreak (ref), v13 (ref) ]]
												if StreakGraceWait <= v16.Get() - DailyLogin.LastLogin.Value then
													v11.PromptPurchase(v19.Player, RestoreDailyStreak.ProductId)
													v13.Close()
												end
											end
										}))
									end,
									Run = function() --[[ Run | Line: 250 | Upvalues: claimDailyReward (ref) ]]
										claimDailyReward()
										return true
									end,
									Cancel = function() --[[ Cancel | Line: 255 ]]
										return true
									end
								})
							else
								claimDailyReward()
							end
						end
					}))
					v22:GiveTask(task.spawn(function() --[[ Line: 265 | Upvalues: v4 (copy), v1 (copy), v3 (copy), v7 (ref), v52 (copy), createRewardGridButton (ref) ]]
						local sum = 1
						while true do
							local v12
							if #v4 > 1 or not v1[v3] then
								sum = sum + (if #v4 > 1 then 1 else 0)
								if #v4 < sum then
									sum = 1
								end
								local v32 = v4[sum]
								v7 = v32
								local v5 = v52:FindFirstChild((("%*Container"):format(if v32.Species ~= nil then "Horse" else "Item")))
								v12 = if v5 then v5:FindFirstChild("Viewport") else nil
								v1[v3] = createRewardGridButton({
									GuiObject = v52,
									RewardData = v32,
									ViewportFrame = v12
								})
							end
							task.wait(2.5)
						end
					end))
				end
			end
		end))
		v20:GiveTask(v14.subscribeMulti({ v22, v1, v32 }, function() --[[ Line: 296 | Upvalues: v3 (ref), v19 (ref), RewardContainer (ref) ]]
			local v1 = v3:GetCurrentStreak(v19)
			for v4, v5 in RewardContainer.Content:GetChildren() do
				local v2, v32
				local v7 = tonumber(v5.Name)
				if v7 then
					local v8 = v7 <= v1
					local v9 = if v7 == v1 + 1 then true else false
					v2 = if v9 then "TODAY" else ("DAY %*"):format(v7)
					v5.DayTitle.Text = v2
					if v9 and (not v8 and v3:CanClaimReward(v19)) then
						v5.DayTitle.Text = "TODAY!"
						v5.DayTitle.TextColor3 = Color3.fromRGB(244, 255, 147)
						v5.DayTitle.UIStroke.Color = Color3.fromRGB(231, 88, 40)
						v5.ClaimedFrame.Visible = false
						v5.ClaimButton.Visible = true
						continue
					end
					if v8 then
						v32 = if v3:CanClaimReward(v19) or v7 ~= v1 then "DAY " .. v7 else "TODAY!"
						v5.DayTitle.Text = v32
						v5.DayTitle.TextColor3 = Color3.fromRGB(244, 255, 147)
						v5.DayTitle.UIStroke.Color = Color3.fromRGB(231, 88, 40)
						v5.ClaimedFrame.Visible = true
						v5.ClaimButton.Visible = false
						continue
					end
					v5.DayTitle.Text = "DAY " .. v7
					v5.DayTitle.TextColor3 = Color3.fromRGB(37, 206, 181)
					v5.DayTitle.UIStroke.Color = Color3.fromRGB(15, 109, 156)
					v5.ClaimedFrame.Visible = false
					v5.ClaimButton.Visible = false
				end
			end
		end))
		v20:GiveTask(v15.stateToProperty({
			Property = "Text",
			Instance = StreakLabel,
			State = v22,
			Transform = function(p1) --[[ Transform | Line: 339 | Upvalues: v6 (ref) ]]
				return if p1 then v6.suffix(p1) else 0
			end
		}))
		v20:GiveTask(v14.subscribeMulti({ v1, v22, v32 }, function() --[[ Line: 351 | Upvalues: v16 (ref), DailyLogin (ref), StreakGraceWait (ref), Reset (ref), StreakWait (ref), v3 (ref), v19 (ref) ]]
			if StreakGraceWait <= v16.Get() - DailyLogin.LastLogin.Value then
				Reset.Timer.Visible = false
				Reset.Title.Visible = false
				Reset.Visible = false
				return
			end
			if v16.Get() < DailyLogin.LastLogin.Value + StreakWait then
				Reset.Timer.Text = v16.FormatString(DailyLogin.LastLogin.Value + StreakWait - v16.Get())
				Reset.Title.Text = "Next reward in:"
			else
				Reset.Title.Text = "Time left to claim:"
				Reset.Timer.Text = v16.FormatString(DailyLogin.LastLogin.Value + StreakGraceWait - v16.Get())
			end
			Reset.Timer.Visible = true
			Reset.Title.Visible = true
			local v1 = v3:GetCurrentStreak(v19) == 0
			Reset.Position = v1 and UDim2.new(0.406, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
			Reset.Visible = true
		end))
	end
end
return t