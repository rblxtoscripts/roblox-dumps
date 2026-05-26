-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("CharacterControls")
local v5 = Sonar("UINavigator")
local v6 = Sonar("PromptClient")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("ItemGridButton")
local v10 = Sonar("TimeUtils")
local v11 = Sonar("MarketplaceUtils")
local v12 = Sonar("spr")
local v13 = Sonar("StorageUtils")
local BossFightStatConversion = Sonar("Constants").BossFightStatConversion
local t2 = {
	DamageDealt = function(p1) --[[ DamageDealt | Line: 28 ]]
		return p1 .. "%"
	end,
	BuckedOff = function(p1) --[[ BuckedOff | Line: 31 ]]
		return p1 .. " times"
	end,
	TimeTaken = function(p1) --[[ TimeTaken | Line: 34 | Upvalues: v10 (copy) ]]
		return v10.FormatString(p1)
	end
}
local v14 = Sonar(v13.Get("ExtraBossChest"))
local LocalPlayer = game:GetService("Players").LocalPlayer
local BossDefeatGui = LocalPlayer.PlayerGui:WaitForChild("BossDefeatGui")
local BottomFrame = BossDefeatGui.ContainerFrame.Content.BottomFrame
local TopFrame = BossDefeatGui.ContainerFrame.Content.TopFrame
local v15 = v1.new()
local v16 = false
local v17 = false
local v18 = false
local function createRewardDisplay(p1, p2) --[[ createRewardDisplay | Line: 56 | Upvalues: v9 (copy), v8 (copy), BossDefeatGui (copy) ]]
	return v9.new({
		ForceVisible = true,
		Item = v8.GetByName(p1.Name),
		LuckPower = p1.LuckPower,
		ParentFrame = BossDefeatGui.ContainerFrame.Content.Rewards[p2 .. "Rewards"],
		GetAmount = function() --[[ GetAmount | Line: 62 | Upvalues: p1 (copy) ]]
			return p1.Amount
		end
	})
end
function t.DisplayResults(p1, ...) --[[ DisplayResults | Line: 68 | Upvalues: t (copy) ]]
	if t:CanRun() then
		t:Start(...)
	end
end
function t.Start(p1, p2) --[[ Start | Line: 73 | Upvalues: v16 (ref), t (copy), v17 (ref), v18 (ref), BossDefeatGui (copy), TopFrame (copy), v15 (copy), TweenService (copy), BossFightStatConversion (copy), t2 (copy), v12 (copy), BottomFrame (copy), v5 (copy), v7 (copy), createRewardDisplay (copy) ]]
	if v16 then
		t:Stop(true)
	end
	v16 = true
	v17 = false
	v18 = false
	BossDefeatGui.ContainerFrame.Content.StatsFrame.Visible = false
	local Stance = TopFrame.Content.Stance
	local v1 = string.format("You defeated a Tier %s Boss!", p2.Tier)
	Stance.Text = v1
	Stance.MaxVisibleGraphemes = 0
	local v2 = utf8.len(v1)
	local v3 = v2 * 0.03
	local v4 = Instance.new("IntValue")
	v4.Value = 0
	v15:GiveTask(v4)
	v15:GiveTask(v4.Changed:Connect(function(p1) --[[ Line: 95 | Upvalues: Stance (copy) ]]
		Stance.MaxVisibleGraphemes = p1
	end))
	local v52 = TweenService:Create(v4, TweenInfo.new(v3, Enum.EasingStyle.Linear), {
		Value = v2
	})
	v15:GiveTask(v52)
	v52:Play()
	TopFrame.TimeTaken.Visible = false
	TopFrame.ShadowLabel.Visible = false
	local v6 = v3 + 0.2
	local sum = 0
	local v72 = 0
	local v8 = nil
	for v9, v10 in p2.Stats do
		local v11 = BossFightStatConversion[v9]
		if v11 == "TimeTaken" then
			v8 = v10
			continue
		end
		local v122 = BossDefeatGui.ContainerFrame.Content.StatsFrame:FindFirstChild(v11)
		if v122 then
			v122.Frame.Position = UDim2.new(0, 0, 0.5, 0)
			v122.Shadow.Position = UDim2.new(0, 0, 0.5, 0)
			v122.Visible = false
			local v13 = t2[v11]
			task.delay(v6 + sum, function() --[[ Line: 129 | Upvalues: v16 (ref), v122 (copy), v72 (ref), v12 (ref), v15 (ref), v13 (copy), TweenService (ref), v10 (copy) ]]
				if not v16 then
					return
				end
				v122.LayoutOrder = v72
				v72 = v72 + 1
				v122.Visible = true
				v12.target(v122.Frame, 0.5, 10, {
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
				v12.target(v122.Shadow, 0.5, 10, {
					Position = UDim2.new(0.5, 0, 0.5, 0)
				})
				local v1 = Instance.new("NumberValue")
				v1.Value = 0
				v15:GiveTask(v1)
				local function UpdateText(p1) --[[ UpdateText | Line: 147 | Upvalues: v13 (ref), v122 (ref) ]]
					local v1 = math.round(p1)
					v122.Frame.Value.Text = v13 and v13(v1) or tostring(v1)
				end
				v122.Frame.Value.Text = v13 and v13(0) or tostring(0)
				v15:GiveTask(v1.Changed:Connect(UpdateText))
				local v3 = TweenService:Create(v1, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Value = v10
				})
				v15:GiveTask(v3)
				v3:Play()
			end)
			sum = sum + 0.4
		end
	end
	if v8 then
		local TimeTaken = TopFrame.TimeTaken
		local TimeTaken_2 = t2.TimeTaken
		TimeTaken.Text = TimeTaken_2(0)
		task.delay(v6 - 0.2, function() --[[ Line: 172 | Upvalues: v16 (ref), TimeTaken (copy), TopFrame (ref), v15 (ref), TimeTaken_2 (copy), TweenService (ref), v8 (ref) ]]
			if v16 then
				TimeTaken.Visible = true
				TopFrame.ShadowLabel.Visible = true
				local v1 = Instance.new("NumberValue")
				v1.Value = 0
				v15:GiveTask(v1)
				v15:GiveTask(v1.Changed:Connect(function(p1) --[[ Line: 181 | Upvalues: TimeTaken (ref), TimeTaken_2 (ref) ]]
					TimeTaken.Text = TimeTaken_2((math.round(p1)))
				end))
				local v2 = TweenService:Create(v1, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
					Value = v8
				})
				v15:GiveTask(v2)
				v2:Play()
			end
		end)
	end
	BossDefeatGui.ContainerFrame.Content.StatsFrame.Visible = true
	local Rewards = BossDefeatGui.ContainerFrame.Content.Rewards
	Rewards.Visible = false
	Rewards.Position = UDim2.new(0.499, 0, 1, 0)
	BossDefeatGui.ContainerFrame:FindFirstChild("ClaimButton", true).Visible = false
	BottomFrame.Visible = false
	BossDefeatGui.Enabled = true
	v5.SetHUDNavigationEnabled(false)
	v5.ResetGamepadSelection()
	v7.ClearNotifications()
	task.delay(v6 + sum + 0.4, function() --[[ Line: 207 | Upvalues: v16 (ref), p2 (copy), v15 (ref), createRewardDisplay (ref), Rewards (copy), BossDefeatGui (ref), v18 (ref), v12 (ref) ]]
		if not v16 then
			return
		end
		for v1, v2 in p2.Rewards do
			v15:GiveTask(createRewardDisplay(v2, "Free"))
		end
		for v3, v4 in p2.PremiumRewards do
			v15:GiveTask(createRewardDisplay(v4, "Premium"))
		end
		Rewards.Visible = true
		Rewards.BuyExtraButton.Visible = true
		BossDefeatGui.ContainerFrame:FindFirstChild("ClaimButton", true).Visible = true
		v18 = true
		v12.target(Rewards, 0.5, 10, {
			Position = UDim2.new(0.499, 0, 0.7, 0)
		})
	end)
end
function t.Stop(p1, p2) --[[ Stop | Line: 227 | Upvalues: v15 (copy), v16 (ref), v18 (ref), BossDefeatGui (copy), v5 (copy) ]]
	v15:DoCleaning()
	v16 = false
	v18 = false
	if p2 then
		v5.SetHUDNavigationEnabled(true)
		v5.ResetSelectionToTargetFrame()
		return
	end
	BossDefeatGui.Enabled = false
	v5.SetHUDNavigationEnabled(true)
	v5.ResetSelectionToTargetFrame()
end
function t.CanRun(p1, p2) --[[ CanRun | Line: 240 | Upvalues: v16 (ref) ]]
	if v16 then
	else
		return true
	end
end
function t.CanDismiss() --[[ CanDismiss | Line: 246 | Upvalues: v17 (ref) ]]
	return v17
end
function t.Claim() --[[ Claim | Line: 250 | Upvalues: v3 (copy), v7 (copy), v17 (ref), BossDefeatGui (copy), BottomFrame (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 251 | Upvalues: v3 (ref) ]]
		return v3.GetRemoteFunction("ClaimBossRewardsRemote"):InvokeServer()
	end)
	if v1 and v2 == true then
		v17 = true
		BossDefeatGui.ContainerFrame:FindFirstChild("ClaimButton", true).Visible = false
		BottomFrame.Visible = true
		return
	end
	v7.Notify({
		Message = "There was an error claiming your boss rewards!",
		Preset = "Red"
	})
	v17 = true
	BossDefeatGui.ContainerFrame:FindFirstChild("ClaimButton", true).Visible = false
	BottomFrame.Visible = true
end
function t.Close() --[[ Close | Line: 266 | Upvalues: v6 (copy), v17 (ref), t (copy) ]]
	if v6.IsActive() then
		return
	end
	if v17 then
		t:Stop()
	end
end
function t.ClaimAndClose() --[[ ClaimAndClose | Line: 273 | Upvalues: v6 (copy), v18 (ref), v3 (copy), v7 (copy), t (copy) ]]
	if v6.IsActive() then
		return
	end
	if not v18 then
		return
	end
	local v1, v2 = pcall(function() --[[ Line: 277 | Upvalues: v3 (ref) ]]
		return v3.GetRemoteFunction("ClaimBossRewardsRemote"):InvokeServer()
	end)
	if v1 and v2 == true then
		t:Stop()
		return
	end
	v7.Notify({
		Message = "There was an error claiming your boss rewards!",
		Preset = "Red"
	})
	t:Stop()
end
function t.YieldForNoDisplay() --[[ YieldForNoDisplay | Line: 290 | Upvalues: v16 (ref) ]]
	if not v16 then
		return
	end
	repeat
		task.wait()
	until not v16
	return true
end
function t.Init(p1) --[[ Init | Line: 299 | Upvalues: v2 (copy), BossDefeatGui (copy), t (copy), BottomFrame (copy), v11 (copy), LocalPlayer (copy), v14 (copy), v4 (copy), v18 (ref), v16 (ref), v17 (ref), v5 (copy), v3 (copy) ]]
	v2.new(BossDefeatGui.ContainerFrame:FindFirstChild("ClaimButton", true), {
		Click = t.Claim
	})
	v2.new(BottomFrame:FindFirstChild("CloseButton"), {
		Click = t.Close
	})
	v2.new(BossDefeatGui.ContainerFrame.Content.Rewards.BuyExtraButton, {
		Click = function() --[[ Click | Line: 309 | Upvalues: v11 (ref), LocalPlayer (ref), v14 (ref) ]]
			v11.PromptPurchase(LocalPlayer, v14.ExtraBossChest.ProductId, "Product")
		end
	})
	v4:AddControls("GamepadBossRewardsClaim", { Enum.KeyCode.ButtonY }, {
		InputBegan = function() --[[ InputBegan | Line: 317 | Upvalues: t (ref) ]]
			t.Claim()
		end
	}, function() --[[ Line: 320 | Upvalues: v18 (ref), v16 (ref) ]]
		return v18 and v16
	end, nil, true)
	v4:AddControls("GamepadBossRewardsBuyExtra", { Enum.KeyCode.ButtonA }, {
		InputBegan = function() --[[ InputBegan | Line: 327 | Upvalues: v11 (ref), LocalPlayer (ref), v14 (ref) ]]
			v11.PromptPurchase(LocalPlayer, v14.ExtraBossChest.ProductId, "Product")
		end
	}, function() --[[ Line: 330 | Upvalues: v18 (ref), v16 (ref) ]]
		return v18 and v16
	end, nil, true)
	v4:AddControls("GamepadBossRewardsClose", { Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 337 | Upvalues: t (ref) ]]
			t.Close()
		end
	}, function() --[[ Line: 340 | Upvalues: v17 (ref), v16 (ref) ]]
		return v17 and v16
	end, nil, true)
	v4:AddControls("GamepadBossRewardsSelectDisplay", { Enum.KeyCode.ButtonSelect }, {
		InputBegan = function() --[[ InputBegan | Line: 347 | Upvalues: v5 (ref), BossDefeatGui (ref) ]]
			v5.SetGamepadSelection(BossDefeatGui.ContainerFrame.Content)
		end
	}, function() --[[ Line: 350 | Upvalues: BossDefeatGui (ref), v16 (ref) ]]
		return BossDefeatGui.Enabled and v16
	end, nil, true)
	v3.GetRemoteEvent("SetBossRewardsRemote").OnClientEvent:Connect(function(...) --[[ Line: 354 | Upvalues: t (ref) ]]
		t:DisplayResults(...)
	end)
	v3.GetRemoteEvent("PurchasedBossChestRemote").OnClientEvent:Connect(function(...) --[[ Line: 358 | Upvalues: BossDefeatGui (ref) ]]
		BossDefeatGui.ContainerFrame.Content.Rewards.BuyExtraButton.Visible = false
	end)
	BossDefeatGui.ContainerFrame.Visible = true
	BossDefeatGui.Enabled = false
end
t:Init()
return t