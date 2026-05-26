-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AdClient")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("DailyLoginService")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("ItemGridButton")
local v6 = Sonar("Maid")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("State")
local v10 = Sonar("TimeUtils")
local v11 = Sonar("Constants")
local StreakWait = v3.StreakWait
local StreakGraceWait = v3.StreakGraceWait
local v12 = v7.GetClient()
local DailyLoginData = v12.DailyLoginData
local v13 = v9.fromProperty(DailyLoginData.CurrentAdStreak, "Value")
local v14 = v8.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local RewardContainer = Players.LocalPlayer.PlayerGui:WaitForChild("RewardsGuiNew").ContainerFrame.Menu.TabFrames.DailyBonus.Content.RewardContainer
local Reset = RewardContainer.Content.Reset
local v15 = v9.new(false)
local v16 = v6.new()
local function createRewardGridButton(p1) --[[ createRewardGridButton | Line: 52 | Upvalues: v4 (copy), v5 (copy) ]]
	assert(typeof(p1) == "table", "Got bad config")
	assert(if typeof(p1.GuiObject) == "Instance" then p1.GuiObject:IsA("GuiObject") else false, "Got bad config.GuiObject")
	assert(typeof(p1.RewardData) == "table", "Got bad config.RewardData")
	assert(typeof(p1.RewardData.Name) == "string", "Got bad config.RewardData.Name")
	local GuiObject_2 = p1.GuiObject
	local RewardData_2 = p1.RewardData
	local v6 = v5.new({
		DoNotClone = true,
		ForceVisible = true,
		GuiObject = GuiObject_2,
		ViewportFrame = p1.ViewportFrame,
		GetAmount = function() --[[ GetAmount | Line: 67 | Upvalues: RewardData_2 (copy) ]]
			return RewardData_2.Amount
		end,
		Item = v4.GetByName(RewardData_2.Name)
	})
	GuiObject_2.HorseContainer.Visible = false
	GuiObject_2.ItemContainer.Visible = true
	GuiObject_2.ItemContainer.AmountLabel.Visible = true
	return v6
end
local function getRewardsContents(p1) --[[ getRewardsContents | Line: 84 ]]
	local v1 = table.clone(p1)
	local v2, count = v1, 0
	for i = #v1, 1, -1 do
		if v2[i].Species then
			table.remove(v2, i)
			count = count + 1
		end
	end
	for v3, v4 in v2 do
		v2[v3] = {
			Amount = v4.Amount,
			Name = ("%%s %*"):format((string.gsub(v4.Name, "(%l)(%u)", "%1 %2")))
		}
	end
	if count > 0 then
		table.insert(v2, {
			Name = "1/%s horse species!",
			Amount = count
		})
	end
	for v5, v6 in v2 do
		local v7 = ""
		if v5 == 2 and v5 == #v2 then
			v7 = v7 .. " or "
		elseif v5 > 1 then
			v7 = (if v5 == #v2 then v7 .. ", or" else v7 .. ",") .. " "
		end
		v2[v5] = ("%*%*"):format(v7, (string.format(v6.Name, v6.Amount)))
	end
	return table.concat(v2)
end
function t.Run(p1, p2) --[[ Run | Line: 136 | Upvalues: v16 (copy), v14 (copy), v15 (copy), v1 (copy), v9 (copy), DailyLoginData (copy), v10 (copy), v6 (copy), v11 (copy), RewardContainer (copy), v13 (copy), StreakWait (copy), v2 (copy), getRewardsContents (copy), createRewardGridButton (copy), v3 (copy), v12 (copy), StreakGraceWait (copy), Reset (copy) ]]
	v16:DoCleaning()
	if p2 then
		v14:FireServer("AccessedMajorInterface", "Dailies")
		v16:GiveTask(task.spawn(function() --[[ Line: 146 | Upvalues: v15 (ref), v1 (ref) ]]
			while true do
				v15:set(v1.IsAdAvailable())
				task.wait(1)
			end
		end))
		local v17 = v16:GiveTask(v9.fromProperty(DailyLoginData.LastAd, "Value"))
		local v22 = v16:GiveTask(v9.fromProperty(DailyLoginData.CurrentAdStreak, "Value"))
		local v32 = v16:GiveTask(v9.fromProperty(v10.ValueBase, "Value"))
		v16:GiveTask(task.spawn(function() --[[ Line: 159 | Upvalues: v16 (ref), v6 (ref), v11 (ref), RewardContainer (ref), v9 (ref), v15 (ref), v13 (ref), v10 (ref), v17 (copy), StreakWait (ref), v2 (ref), v1 (ref), getRewardsContents (ref), createRewardGridButton (ref) ]]
			local v12 = v16:GiveTask(v6.new())
			local v22 = v16:GiveTask(v6.new())
			for v3, v4 in v11.DailyBonusRewards do
				local v5 = RewardContainer.Content:FindFirstChild(v3)
				local v62 = if v5 then v5.WatchButton else nil
				local t = { v15, v13 }
				v16:GiveTask(v9.subscribeMulti(t, function(p1, p2) --[[ Line: 166 | Upvalues: v3 (copy), v10 (ref), v17 (ref), StreakWait (ref), v62 (copy) ]]
					local v1 = nil or p1
					v62.Visible = (if v1 then p2 + 1 == v3 else v1) and StreakWait <= v10.Get() - v17:get()
				end))
				v16:GiveTask(v2.new(v62, {
					Click = function() --[[ Click | Line: 178 | Upvalues: v15 (ref), v1 (ref), getRewardsContents (ref), v4 (copy) ]]
						if v15:get() then
							v1.ShowAd("DailyBonus", getRewardsContents(v4))
						end
					end
				}))
				v22:GiveTask(task.spawn(function() --[[ Line: 187 | Upvalues: v4 (copy), v12 (copy), v3 (copy), v5 (copy), createRewardGridButton (ref) ]]
					local sum = 1
					while true do
						local v1
						if #v4 > 1 or not v12[v3] then
							sum = sum + (if #v4 > 1 then 1 else 0)
							if #v4 < sum then
								sum = 1
							end
							local v32 = v4[sum]
							local v52 = v5:FindFirstChild((("%*Container"):format(if v32.Species ~= nil then "Horse" else "Item")))
							v1 = if v52 then v52:FindFirstChild("Viewport") else nil
							v12[v3] = createRewardGridButton({
								GuiObject = v5,
								RewardData = v32,
								ViewportFrame = v1
							})
						end
						task.wait(2.5)
					end
				end))
			end
		end))
		v16:GiveTask(v9.subscribeMulti({ v22, v17, v32 }, function(p1) --[[ Line: 216 | Upvalues: RewardContainer (ref), v3 (ref), v12 (ref) ]]
			for v32, v4 in RewardContainer.Content:GetChildren() do
				local v1, v2
				local v6 = tonumber(v4.Name)
				if v6 then
					local v7 = v6 <= p1
					local v8 = if v6 == p1 + 1 then true else false
					v1 = if v8 then "TODAY" else ("DAY %*"):format(v6)
					v4.DayTitle.Text = v1
					if v8 and (not v7 and v3:CanClaimAdReward(v12)) then
						v4.DayTitle.Text = "TODAY!"
						v4.DayTitle.TextColor3 = Color3.fromRGB(244, 255, 147)
						v4.DayTitle.UIStroke.Color = Color3.fromRGB(231, 88, 40)
						v4.ClaimedFrame.Visible = false
						v4.WatchButton.Visible = true
						continue
					end
					if v7 then
						v2 = if v3:CanClaimAdReward(v12) or v6 ~= p1 then "DAY " .. v6 else "TODAY!"
						v4.DayTitle.Text = v2
						v4.DayTitle.TextColor3 = Color3.fromRGB(244, 255, 147)
						v4.DayTitle.UIStroke.Color = Color3.fromRGB(231, 88, 40)
						v4.ClaimedFrame.Visible = true
						v4.WatchButton.Visible = false
						continue
					end
					v4.DayTitle.Text = "DAY " .. v6
					v4.DayTitle.TextColor3 = Color3.fromRGB(37, 206, 181)
					v4.DayTitle.UIStroke.Color = Color3.fromRGB(15, 109, 156)
					v4.ClaimedFrame.Visible = false
					v4.WatchButton.Visible = false
				end
			end
		end))
		v16:GiveTask(v9.subscribeMulti({ v22, v17, v32 }, function() --[[ Line: 252 | Upvalues: v10 (ref), DailyLoginData (ref), StreakGraceWait (ref), Reset (ref), StreakWait (ref), v22 (copy) ]]
			local v1 = v10.Get()
			if StreakGraceWait <= v1 - DailyLoginData.LastAd.Value then
				Reset.Timer.Visible = false
				Reset.Title.Visible = false
				Reset.Visible = false
				return
			end
			local v2 = DailyLoginData.LastAd.Value + StreakWait
			local v3 = v2 - v1
			if v1 < v2 then
				Reset.Timer.Text = v10.FormatString(v3)
				Reset.Title.Text = "Next ad in:"
			end
			Reset.Timer.Visible = true
			Reset.Title.Visible = true
			local v4 = if v22:get() == 0 then true else false
			Reset.Position = v4 and UDim2.new(0.406, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
			Reset.Visible = v1 < v2
		end))
	else
		v14:FireServer("ClosedMajorInterface", "Dailies")
	end
end
return t