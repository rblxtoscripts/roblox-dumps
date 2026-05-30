-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local SeasonPass = ReplicatedStorage.Remotes.SeasonPass
local SeasonPass_2 = require(ReplicatedStorage.Modules.Misc.SeasonPass)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Robux = require(ReplicatedStorage.Configs.Robux)
local v1 = script.Parent
local Main = v1.MainFrame.Main
local v2 = false
function init() --[[ init | Line: 20 | Upvalues: Main (copy), Tween (copy), SeasonPass (copy) ]]
	for k, v in pairs(Main.ScrollingFrame.Normal:GetChildren()) do
		if v:IsA("Frame") then
			local v1 = string.gsub(v.Name, "Reward", "")
			Tween:AddButton(v.Claim)
			v.Claim.MouseButton1Click:Connect(function() --[[ Line: 26 | Upvalues: SeasonPass (ref), v1 (copy) ]]
				SeasonPass.Claim:FireServer(v1, "Normal", "NewSummer")
			end)
		end
	end
	for k, v in pairs(Main.ScrollingFrame.Premium:GetChildren()) do
		if v:IsA("Frame") then
			local v2 = string.gsub(v.Name, "Reward", "")
			Tween:AddButton(v.Claim)
			v.Claim.MouseButton1Click:Connect(function() --[[ Line: 35 | Upvalues: SeasonPass (ref), v2 (copy) ]]
				SeasonPass.Claim:FireServer(v2, "Premium", "NewSummer")
			end)
		end
	end
end
function update() --[[ update | Line: 41 | Upvalues: ClientState (copy), SeasonPass_2 (copy), LocalPlayer (copy), Main (copy), Formatter (copy), TweenService (copy), v2 (ref), v1 (copy) ]]
	local v12 = ClientState.GetData()
	local v22 = SeasonPass_2.GetStats(LocalPlayer, "NewSummer")
	if v22.CurrentLevelXP >= v22.RequiredXP and v22.RequiredXP > 0 then
		local count = 0
		local v3
		repeat
			count = count + 1
			v3 = SeasonPass_2.GetStats(LocalPlayer, "NewSummer")
			task.wait(0.5)
		until v3.CurrentLevelXP < v3.RequiredXP or count >= 20
		v22 = v3
	end
	local Bar = Main.Exp.Bar
	local v4 = if v22.RequiredXP <= 0 then 1 else v22.CurrentLevelXP / v22.RequiredXP
	local v5 = if v22.CurrentLevelXP < 1000 then math.round(v22.CurrentLevelXP * 10) / 10 else Formatter.FormatCompact(v22.CurrentLevelXP)
	Bar.Progress.Text = if v22.RequiredXP <= 0 then "MAX" else v5 .. "/" .. Formatter.FormatCompact(v22.RequiredXP) .. " XP"
	TweenService:Create(Bar.Move, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v4, 0, 1, 0)
	}):Play()
	v2 = v12.SeasonPass.UnlockedNewSummer
	v1.Premium.Main.BuyPremium.TextLabel.Text = if v12.SeasonPass.UnlockedNewSummer then "OWNED" else "R$ 799"
	for v9, v10 in { Main.ScrollingFrame.Normal, Main.ScrollingFrame.Premium } do
		for k, v in pairs(v10:GetChildren()) do
			local v11
			if v:IsA("Frame") then
				local v122 = string.gsub(v.Name, "Reward", "")
				if v12.SeasonPass[v10.Name .. "NewSummer" .. v122] then
					v.Claim.Visible = false
					v.Claimed.Visible = true
					continue
				end
				v.Claimed.Visible = false
				v11 = if v10.Name == "Premium" and not v12.SeasonPass.UnlockedNewSummer then false elseif v22.Level >= tonumber(v122) then true else false
				if v11 then
					v.Claim.Visible = true
					v.Locked.Visible = false
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
end
v1.MainFrame.SkipLevel.MouseButton1Click:Connect(function() --[[ Line: 100 | Upvalues: SeasonPass_2 (copy), LocalPlayer (copy), Robux (copy), MarketplaceService (copy) ]]
	local v1 = SeasonPass_2.GetStats(LocalPlayer, "NewSummer")
	local Level = v1.Level
	MarketplaceService:PromptProductPurchase(LocalPlayer, if v1.RequiredXP <= 0 then Robux.Products.RestartEventPass elseif Level <= 10 then Robux.Products.EventSkip1 elseif Level <= 20 then Robux.Products.EventSkip2 else Robux.Products.EventSkip3)
end)
v1.Premium.Main.BuyPremium.MouseButton1Click:Connect(function() --[[ Line: 118 | Upvalues: v2 (ref), MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	if not v2 then
		MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.EventPremium)
	end
end)
pcall(function() --[[ Line: 122 | Upvalues: v1 (copy), MarketplaceService (copy), Robux (copy) ]]
	v1.Premium.Main.BuyPremium.TextLabel.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.EventPremium, Enum.InfoType.Product).PriceInRobux)
end)
v1.Premium.Main.BuyTicket.MouseButton1Click:Connect(function() --[[ Line: 128 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.EventPremiumTicket)
end)
ReplicatedStorage.Remotes.Misc.EventSeasonPassTouch.OnClientEvent:Connect(function() --[[ Line: 132 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
v1.ClaimAll.MouseButton1Click:Connect(function() --[[ Line: 138 | Upvalues: SeasonPass (copy) ]]
	SeasonPass.Claim:FireServer("All", nil, "NewSummer")
end)
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.MainFrame.SkipLevel)
Tween:AddButton(v1.Premium.Main.BuyPremium)
Tween:AddButton(v1.Premium.Main.BuyTicket)
Tween:AddButton(v1.ClaimAll)
SeasonPass.EventUpdate.OnClientEvent:Connect(update)
init()
update()