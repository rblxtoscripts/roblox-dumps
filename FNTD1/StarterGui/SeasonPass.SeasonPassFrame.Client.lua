-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SeasonPass = ReplicatedStorage.Remotes.SeasonPass
local SeasonPass_2 = require(ReplicatedStorage.Modules.Misc.SeasonPass)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Robux = require(ReplicatedStorage.Configs.Robux)
local v1 = script.Parent
local Main = v1.MainFrame:WaitForChild("Main")
local Season = script.Parent.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("Season")
local GiftingFrame = v1.GiftingFrame
local v2 = false
function init() --[[ init | Line: 22 | Upvalues: Main (copy), Tween (copy), SeasonPass (copy) ]]
	for k, v in pairs(Main.ScrollingFrame.Normal:GetChildren()) do
		if v:IsA("Frame") then
			local v1 = string.gsub(v.Name, "Reward", "")
			Tween:AddButton(v.Claim)
			v.Claim.MouseButton1Click:Connect(function() --[[ Line: 28 | Upvalues: SeasonPass (ref), v1 (copy) ]]
				SeasonPass.Claim:FireServer(v1, "Normal")
			end)
		end
	end
	for k, v in pairs(Main.ScrollingFrame.Premium:GetChildren()) do
		if v:IsA("Frame") then
			local v2 = string.gsub(v.Name, "Reward", "")
			Tween:AddButton(v.Claim)
			v.Claim.MouseButton1Click:Connect(function() --[[ Line: 37 | Upvalues: SeasonPass (ref), v2 (copy) ]]
				SeasonPass.Claim:FireServer(v2, "Premium")
			end)
		end
	end
end
function updateGiftingFrame() --[[ updateGiftingFrame | Line: 43 | Upvalues: GiftingFrame (copy), LocalPlayer (copy), Tween (copy), ReplicatedStorage (copy), MarketplaceService (copy), Robux (copy) ]]
	for k, v in pairs(GiftingFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("ImageLabel") and (not game.Players:FindFirstChild(v.Name) and v.Name ~= "Example") then
			v:Destroy()
		end
	end
	for k, v in pairs(game.Players:GetPlayers()) do
		if not GiftingFrame.ScrollingFrame:FindFirstChild(v.Name) and v.Name ~= LocalPlayer.Name then
			local v1 = GiftingFrame.ScrollingFrame.Example:Clone()
			v1.Name = v.Name
			v1.PlayerName.Text = v.Name
			v1.Parent = GiftingFrame.ScrollingFrame
			v1.Visible = true
			Tween:AddButton(v1, nil, nil, nil, true)
			v1.MouseButton1Click:Connect(function() --[[ Line: 63 | Upvalues: ReplicatedStorage (ref), v (copy), MarketplaceService (ref), LocalPlayer (ref), Robux (ref) ]]
				ReplicatedStorage.Remotes.Misc.GiftToPlayer:FireServer(v.Name)
				MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.PremiumPass)
			end)
		end
	end
end
function update() --[[ update | Line: 70 | Upvalues: ClientState (copy), SeasonPass_2 (copy), LocalPlayer (copy), Main (copy), Formatter (copy), TweenService (copy), v2 (ref), v1 (copy), Season (copy) ]]
	local v12 = ClientState.GetData()
	local v22 = SeasonPass_2.GetStats(LocalPlayer)
	local count = 0
	if v22.CurrentLevelXP >= v22.RequiredXP and v22.RequiredXP > 0 then
		local count_2 = 0
		local v3
		repeat
			count_2 = count_2 + 1
			v3 = SeasonPass_2.GetStats(LocalPlayer)
			task.wait(0.5)
		until v3.CurrentLevelXP < v3.RequiredXP or count_2 >= 20
		v22 = v3
	end
	local Bar = Main.Exp.Bar
	local v4 = if v22.RequiredXP <= 0 then 1 else v22.CurrentLevelXP / v22.RequiredXP
	local v5 = if v22.CurrentLevelXP < 1000 then math.round(v22.CurrentLevelXP * 10) / 10 else Formatter.FormatCompact(v22.CurrentLevelXP)
	Bar.Progress.Text = if v22.RequiredXP <= 0 then "MAX" else v5 .. "/" .. Formatter.FormatCompact(v22.RequiredXP) .. " XP"
	TweenService:Create(Bar.Move, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v4, 0, 1, 0)
	}):Play()
	v2 = v12.SeasonPass.UnlockedPremium
	v1.Premium.Main.BuyPremium.TextLabel.Text = if v12.SeasonPass.UnlockedPremium then "OWNED" else "R$ 799"
	for v9, v10 in { Main.ScrollingFrame.Normal, Main.ScrollingFrame.Premium } do
		for k, v in pairs(v10:GetChildren()) do
			local v11
			if v:IsA("Frame") then
				local v122 = string.gsub(v.Name, "Reward", "")
				if v12.SeasonPass[v10.Name .. v122] then
					v.Claim.Visible = false
					v.Claimed.Visible = true
					continue
				end
				v.Claimed.Visible = false
				v11 = if v10.Name == "Premium" and not v12.SeasonPass.UnlockedPremium then false elseif v22.Level >= tonumber(v122) then true else false
				if v11 then
					v.Claim.Visible = true
					v.Locked.Visible = false
					count = count + 1
					continue
				end
				v.Claim.Visible = false
				v.Locked.Visible = true
			end
		end
	end
	if v22.RequiredXP <= 0 then
		v1.MainFrame.SkipLevel.TextLabel.Text = "RESTART"
	else
		v1.MainFrame.SkipLevel.TextLabel.Text = "SKIP LEVEL"
	end
	if count <= 0 then
		Season.Notifier.Visible = false
	else
		Season.Notifier.Visible = true
		Season.Notifier.TextLabel.Text = count
	end
	game.ReplicatedStorage.Remotes.Quests.Client.CompletePass:FireServer()
end
v1.MainFrame.SkipLevel.MouseButton1Click:Connect(function() --[[ Line: 139 | Upvalues: SeasonPass_2 (copy), LocalPlayer (copy), Robux (copy), MarketplaceService (copy) ]]
	local v1 = SeasonPass_2.GetStats(LocalPlayer)
	local Level = v1.Level
	MarketplaceService:PromptProductPurchase(LocalPlayer, if v1.RequiredXP <= 0 then Robux.Products.RestartSeasonPass elseif Level <= 3 then Robux.Products.SeasonPassSkipLevel1 elseif Level <= 6 then Robux.Products.SeasonPassSkipLevel2 elseif Level <= 9 then Robux.Products.SeasonPassSkipLevel3 elseif Level <= 12 then Robux.Products.SeasonPassSkipLevel4 elseif Level <= 15 then Robux.Products.SeasonPassSkipLevel5 elseif Level <= 18 then Robux.Products.SeasonPassSkipLevel6 elseif Level <= 21 then Robux.Products.SeasonPassSkipLevel7 elseif Level <= 24 then Robux.Products.SeasonPassSkipLevel8 elseif Level <= 27 then Robux.Products.SeasonPassSkipLevel9 else Robux.Products.SeasonPassSkipLevel10)
end)
v1.Premium.Main.BuyPremium.MouseButton1Click:Connect(function() --[[ Line: 171 | Upvalues: v2 (ref), MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	if not v2 then
		MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.PremiumPass)
	end
end)
pcall(function() --[[ Line: 175 | Upvalues: v1 (copy), MarketplaceService (copy), Robux (copy) ]]
	v1.Premium.Main.BuyPremium.TextLabel.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.PremiumPass, Enum.InfoType.Product).PriceInRobux)
end)
v1.Premium.Main.Gift.MouseButton1Click:Connect(function() --[[ Line: 181 | Upvalues: GiftingFrame (copy), ReplicatedStorage (copy), LocalPlayer (copy) ]]
	if GiftingFrame.Visible then
		GiftingFrame.Visible = false
		ReplicatedStorage.Remotes.Misc.GiftToPlayer:FireServer(LocalPlayer, "None")
	else
		GiftingFrame.Visible = true
	end
end)
v1.ClaimAll.MouseButton1Click:Connect(function() --[[ Line: 190 | Upvalues: SeasonPass (copy) ]]
	SeasonPass.Claim:FireServer("All")
end)
Tween:AddButton(Season, v1, "ButtonClick", true)
Tween:AddButton(v1.MainFrame.SkipLevel)
Tween:AddButton(v1.Premium.Main.BuyPremium)
Tween:AddButton(v1.Premium.Main.Gift)
Tween:AddButton(v1.ClaimAll)
SeasonPass.Update.OnClientEvent:Connect(update)
Players.PlayerAdded:Connect(updateGiftingFrame)
Players.PlayerRemoving:Connect(updateGiftingFrame)
init()
update()
updateGiftingFrame()