-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PolicyService = game:GetService("PolicyService")
local LocalPlayer = Players.LocalPlayer
local StatReroll = ReplicatedStorage.Remotes.Misc.StatReroll
local Tween = require(ReplicatedStorage.Libs.Tween)
local StatRerolls = require(ReplicatedStorage.Modules.Misc.StatRerolls)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Towers = require(ReplicatedStorage.Configs.Towers)
local Robux = require(ReplicatedStorage.Configs.Robux)
require(ReplicatedStorage.Configs.Misc)
local MainFrame = script.Parent.MainFrame
local Size = MainFrame.Success.Size
local t = {}
local t2 = {}
local v1 = 0
function animation(p1, p2) --[[ animation | Line: 24 | Upvalues: MainFrame (copy), v1 (ref), TweenService (copy), Size (copy) ]]
	if p1 == "Touch" then
		return
	end
	task.spawn(updateTowerSlot, p1)
	if p2 then
		MainFrame.Success.Text = "Successfully Unlocked Tower!"
	else
		MainFrame.Success.Text = "Successfully Rolled Stats!"
	end
	local v12 = tick()
	v1 = v12
	MainFrame.Success.Size = UDim2.new(0, 0, 0, 0)
	MainFrame.Success.Visible = true
	TweenService:Create(MainFrame.Success, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.In), {
		Size = Size
	}):Play()
	task.wait(1)
	if v12 == v12 then
		TweenService:Create(MainFrame.Success, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
	end
end
function update() --[[ update | Line: 48 | Upvalues: ClientState (copy), MainFrame (copy) ]]
	local v1 = ClientState.GetData()
	MainFrame.RerollsFrame.TextLabel.Text = if v1.Items.StatChips then v1.Items.StatChips else 0
	MainFrame.UnlockFrame.UnlockersFrame.TextLabel.Text = if v1.Items.AftonsWrench then v1.Items.AftonsWrench else 0
end
MainFrame.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 54 | Upvalues: MainFrame (copy) ]]
	MainFrame.ConfirmFrame.Visible = false
end)
local v2 = false
MainFrame.ConfirmFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 59 | Upvalues: v2 (ref) ]]
	v2 = true
	task.wait(0.8)
	v2 = false
end)
MainFrame.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 65 | Upvalues: v2 (ref), MainFrame (copy), StatReroll (copy), t (copy) ]]
	if v2 then
		return
	end
	MainFrame.ConfirmFrame.Visible = false
	StatReroll:FireServer(MainFrame.TowerID.Value, t, true)
end)
MainFrame.StatFrame.Reroll.MouseButton1Click:Connect(function() --[[ Line: 72 | Upvalues: t2 (copy), t (copy), StatRerolls (copy), MainFrame (copy), StatReroll (copy) ]]
	local tbl = {}
	for k, v in pairs(t2) do
		if not (t[k] or tbl[k]) then
			tbl[k] = StatRerolls.GetLetterStats(k, v).Chance
		end
	end
	local v1 = false
	for k, v in pairs(tbl) do
		if v <= 1 then
			v1 = true
			break
		end
	end
	if v1 then
		MainFrame.ConfirmFrame.Visible = true
	else
		StatReroll:FireServer(MainFrame.TowerID.Value, t)
	end
end)
MainFrame.UnlockFrame.Unlock.MouseButton1Click:Connect(function() --[[ Line: 93 | Upvalues: StatReroll (copy), MainFrame (copy) ]]
	StatReroll:FireServer(MainFrame.TowerID.Value)
end)
function updateTowerSlot(p1) --[[ updateTowerSlot | Line: 97 | Upvalues: MainFrame (copy), Tween (copy), ClientState (copy), Towers (copy), StatRerolls (copy), LocalPlayer (copy), t2 (copy), ReplicatedStorage (copy) ]]
	if p1 == 1 then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
	local v1 = ClientState.GetData()
	local v2 = v1.Towers[p1]
	if not v2 then
		return
	end
	local v3 = Towers.Towers[v2.Name]
	if not v3 then
		return
	end
	MainFrame.RerollsFrame.TextLabel.Text = if v1.Items.StatChips then v1.Items.StatChips else 0
	MainFrame.UnlockFrame.UnlockersFrame.TextLabel.Text = if v1.Items.AftonsWrench then v1.Items.AftonsWrench else 0
	if v2.Stats then
		MainFrame.StatFrame.Visible = true
		MainFrame.UnlockFrame.Visible = false
		local StatFrame = MainFrame.StatFrame
		for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
			local v6 = StatRerolls.GetStatMulti(LocalPlayer, p1, v, true)
			t2[v] = v6.Letter
			StatFrame[v .. "Letter"].TextLabel.Text = v6.Letter
			StatFrame[v .. "Show"].TextLabel.Text = v6.Value
			if StatFrame[v .. "Letter"]:FindFirstChild("ImageLabel") then
				StatFrame[v .. "Letter"].ImageLabel:Destroy()
			end
			if v6.Image then
				StatFrame[v .. "Letter"].TextLabel.Text = ""
				local ImageLabel = Instance.new("ImageLabel", StatFrame[v .. "Letter"])
				ImageLabel.Size = UDim2.new(1, 0, 1, 0)
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.Image = v6.Image
				ImageLabel.ScaleType = Enum.ScaleType.Fit
			end
			if v6.Gradient then
				StatFrame[v .. "Letter"].Rare.Color = v6.Gradient
				StatFrame[v .. "Letter"].Frame.Rare.Color = v6.Gradient
				StatFrame[v .. "Letter"].TextLabel.Rare.Color = v6.Gradient
				StatFrame[v .. "Show"].Rare.Color = v6.Gradient
				StatFrame[v .. "Show"].Frame.Rare.Color = v6.Gradient
				StatFrame[v .. "Show"].TextLabel.Rare.Color = v6.Gradient
			end
		end
	else
		MainFrame.StatFrame.Visible = false
		MainFrame.UnlockFrame.Visible = true
	end
	MainFrame.TowerID.Value = p1
	local v7 = if v2.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif ReplicatedStorage.Gradients:FindFirstChild(v3.Rarity) then ReplicatedStorage.Gradients[v3.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
	MainFrame.TowerSlot.BorderImage.TowerImage.Visible = true
	MainFrame.TowerSlot.BorderImage.Plus.Visible = false
	MainFrame.TowerSlot.BorderImage.TowerImage.Image = v3.Image or ""
	MainFrame.TowerName.Text = v2.Name
	MainFrame.TowerSlot.BorderImage.UIGradient.Color = v7
	MainFrame.TowerSlot.Frame.UIGradient.Color = v7
	MainFrame.TowerSlot.BorderImage.UIGradient.Enabled = true
	MainFrame.TowerSlot.Frame.UIGradient.Enabled = true
end
MainFrame.TowerSlot.MouseButton1Click:Connect(function() --[[ Line: 166 | Upvalues: StatReroll (copy), LocalPlayer (copy) ]]
	StatReroll.Bindable:Fire(1)
	if LocalPlayer:FindFirstChild("StatTower") then
		return
	end
	local StatTower = Instance.new("StringValue")
	StatTower.Name = "StatTower"
	StatTower.Parent = LocalPlayer
end)
StatReroll.OnClientEvent:Connect(function(p1) --[[ Line: 175 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if p1 ~= "Touch" then
		return
	end
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 182 | Upvalues: Towers (copy) ]]
	if p1 and not pcall(function() --[[ Line: 184 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if p1 then
			Towers.Towers = p1
			return
		end
		error(0)
	end) then
		warn("Failed to update Client MetaData.")
	end
end)
MainFrame.StatFrame.Chances.MouseButton1Click:Connect(function() --[[ Line: 197 | Upvalues: MainFrame (copy) ]]
	MainFrame.Chances.Visible = not MainFrame.Chances.Visible
end)
MainFrame.Chances.Exit.MouseButton1Click:Connect(function() --[[ Line: 200 | Upvalues: MainFrame (copy) ]]
	MainFrame.Chances.Visible = false
end)
function initChances() --[[ initChances | Line: 204 | Upvalues: ReplicatedStorage (copy), MainFrame (copy) ]]
	local Config = require(ReplicatedStorage.Modules.Misc.StatRerolls.Config)
	for k, v in pairs(Config) do
		if v.Chance and not (v.Chance <= 0) then
			local v1 = MainFrame.Chances.ChancesScroll.Example:Clone()
			v1.Name = k
			v1.Letter.Text = k
			if v.Image then
				v1.Letter.Text = ""
				local ImageLabel = Instance.new("ImageLabel", v1.Letter)
				ImageLabel.Size = UDim2.new(1, 0, 1, 0)
				ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
				ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
				ImageLabel.BackgroundTransparency = 1
				ImageLabel.Image = v.Image
				ImageLabel.ScaleType = Enum.ScaleType.Fit
			end
			v1.Chance.TextLabel.Text = v.Chance .. "%"
			local v2 = ReplicatedStorage.Modules.Misc.StatRerolls.Gradients:FindFirstChild(k)
			if v2 then
				v1.Letter.UIGradient.Color = v2.Color
				v1.Chance.UIGradient.Color = v2.Color
				v1.Chance.TextLabel.UIGradient.Color = v2.Color
				v1.UIGradient.Color = v2.Color
			end
			v1.LayoutOrder = -(v.Chance * 1000)
			v1.Visible = true
			v1.Parent = MainFrame.Chances.ChancesScroll
		end
	end
end
function initBuy() --[[ initBuy | Line: 238 | Upvalues: MainFrame (copy), Robux (copy), Tween (copy), PolicyService (copy), LocalPlayer (copy), MarketplaceService (copy) ]]
	for k, v in pairs(MainFrame.BuyTokens:GetChildren()) do
		if Robux.Products[v.Name] then
			Tween:AddButton(v, nil, nil, nil, true)
			v.MouseButton1Click:Connect(function() --[[ Line: 242 | Upvalues: PolicyService (ref), LocalPlayer (ref), MarketplaceService (ref), Robux (ref), v (copy) ]]
				local v1, v2 = pcall(function() --[[ Line: 244 | Upvalues: PolicyService (ref), LocalPlayer (ref) ]]
					return PolicyService:GetPolicyInfoForPlayerAsync(LocalPlayer)
				end)
				if not v1 then
					warn("PolicyService error: " .. v2)
					return
				end
				if v2.ArePaidRandomItemsRestricted then
					game.ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("Your region doesn\'t allow you to buy this!")
				else
					MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v.Name])
				end
			end)
			pcall(function() --[[ Line: 257 | Upvalues: v (copy), MarketplaceService (ref), Robux (ref) ]]
				v.Robux.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products[v.Name], Enum.InfoType.Product).PriceInRobux)
			end)
		end
	end
end
function updateLock() --[[ updateLock | Line: 265 | Upvalues: MainFrame (copy), t (copy) ]]
	for k, v in pairs(MainFrame.StatFrame:GetChildren()) do
		if string.find(v.Name, "Lock") then
			if t[string.gsub(v.Name, "Lock", "")] then
				v.Locked.Enabled = true
				v.Unlocked.Enabled = false
				v.ImageLabel.Image = "rbxassetid://129873382316985"
				continue
			end
			v.Locked.Enabled = false
			v.Unlocked.Enabled = true
			v.ImageLabel.Image = "rbxassetid://138428323187185"
		end
	end
	local count = 0
	for k, v in pairs(t) do
		count = count + 1
	end
	local v1 = count * 1 + 1
	MainFrame.StatFrame.Price.Text = ("%* Stat Reroll%*"):format(v1, if v1 > 1 then "s" else "")
end
function initLock() --[[ initLock | Line: 290 | Upvalues: MainFrame (copy), Tween (copy), t (copy) ]]
	for k, v in pairs(MainFrame.StatFrame:GetChildren()) do
		if string.find(v.Name, "Lock") then
			local v1 = string.gsub(v.Name, "Lock", "")
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 296 | Upvalues: t (ref), v1 (copy) ]]
				if t[v1] then
					t[v1] = nil
				else
					t[v1] = true
				end
				updateLock()
			end)
		end
	end
	updateLock()
end
MainFrame.UnlockFrame.Visible = true
MainFrame.StatFrame.Visible = false
Tween:AddButton(MainFrame.TowerSlot)
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(MainFrame.StatFrame.Reroll)
Tween:AddButton(MainFrame.UnlockFrame.Unlock)
Tween:AddButton(MainFrame.ConfirmFrame.Yes)
Tween:AddButton(MainFrame.ConfirmFrame.No)
Tween:AddButton(MainFrame.StatFrame.Chances)
Tween:AddButton(MainFrame.Chances.Exit)
StatReroll.OnClientEvent:Connect(animation)
StatReroll.Bindable.Event:Connect(updateTowerSlot)
initBuy()
initLock()
update()
initChances()