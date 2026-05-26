-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("Network")
local v2 = Library:Load("Maid")
local v3 = Library:Load("SoundFX")
local v4 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
PlayerGui:WaitForChild("Gui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local UIParticleEmitter = require(game.ReplicatedStorage.UIParticleEmitter)
local AssetLibraryManager = require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local v6 = v2.new()
local v7 = GuiManager:RegisterWindow(v4, "Left", "Right")
v7.BlurEffectEnabled = true
local t = {}
local t2 = {
	AutumnBundle = {
		AnimatedBackground = true
	},
	VictorianUnlimitedSet = {
		AnimatedBackground = true
	},
	DoorBundle = {
		AnimatedBackground = true
	},
	HalloweenBundle = {
		AnimatedBackground = false
	},
	Cabin = {
		AnimatedBackground = false
	}
}
for k, v in pairs(v5.Bundles) do
	for i, v8 in ipairs(v) do
		if v8.Type == "Asset" then
			t[tonumber(v8.AssetId)] = AssetLibraryManager:GetAssetById(v8.AssetId).ModelId or v8.AssetId
		end
	end
end
local TweenService = game:GetService("TweenService")
local function createShakeAnimation(p1) --[[ createShakeAnimation | Line: 58 | Upvalues: TweenService (copy) ]]
	local CanvasPosition = p1.CanvasPosition
	p1.CanvasPosition = Vector2.new(0, 400)
	TweenService:Create(p1, TweenInfo.new(1.6, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out, 0, false, 0), {
		CanvasPosition = CanvasPosition
	}):Play()
end
local BundlePurchaseParticles = script.Parent.Parent:WaitForChild("BundlePurchaseParticles")
local VictorianUnlimitedSet = v4:WaitForChild("VictorianUnlimitedSet")
function ShowBundle(p1) --[[ ShowBundle | Line: 87 | Upvalues: v5 (copy), t2 (copy), v6 (copy), v3 (copy), v4 (copy), VictorianUnlimitedSet (ref), createShakeAnimation (copy), v7 (copy), LocalPlayer (copy), t (copy), v1 (copy) ]]
	local _ = v5.GamePasses[p1]
	local v12 = v5.CoinBundles[p1]
	local v2 = v5.Bundles[p1]
	v6:DoCleaning()
	v3:PlaySound("BundleBell")
	local v42 = v4:FindFirstChild(p1) or v4.CoinBundle
	local Buy = v42:FindFirstChild("Buy")
	local CancelButton = v42:FindFirstChild("CancelButton")
	VictorianUnlimitedSet.Visible = false
	v42.Visible = true
	VictorianUnlimitedSet = v42
	local v52 = v42:FindFirstChild("Content")
	task.delay(0.1, function() --[[ Line: 104 | Upvalues: v52 (copy), createShakeAnimation (ref) ]]
		if not v52:IsA("ScrollingFrame") then
			return
		end
		createShakeAnimation(v52)
	end)
	if v12 then
		v42.Title.Text = v12.Name
	end
	local v62 = game.ReplicatedStorage:FindFirstChild(p1) or v52:WaitForChild("Template")
	v62.Visible = false
	v62.Name = p1
	v62.Parent = game.ReplicatedStorage
	v7.FirstSelectedObject = Buy
	for i, v in ipairs(v2) do
		local v72, v8, v9, v10, v11, v122, v13, v14, v15, v16
		if v.Type == "Capsule" or v.Type == "Present" then
			if not LocalPlayer:GetAttribute("ArePaidRandomItemsRestricted") and v.Visible ~= false then
				v72 = v62:Clone()
				if v.Exclusive then
					v72.Exclusive.Visible = true
				end
				if v.Type == "Asset" then
					v8 = v.Image
					if not v8 then
						v9 = t
						v10 = v.AssetId
						v8 = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. t[tonumber(v10)]
					end
					v72.Thumbnail.Image = v8
					v11 = v72.Quantity
					v122 = v.Quantity > 1 and "X" .. v.Quantity or ""
					v11.Text = v122
				elseif v.Type == "Present" then
					v72.Thumbnail.Image = v5.PresentData[v.PresentType].ToolIcon
					v13 = v72.Quantity
					v14 = v.Quantity > 1 and "X" .. v.Quantity or ""
					v13.Text = v14
				elseif v.Type == "Capsule" then
					v72.Thumbnail.Image = v5.CapsuleTypeToImage[v.Rarity]
					v15 = v72.Quantity
					v16 = v.Quantity > 1 and "X" .. v.Quantity or ""
					v15.Text = v16
				elseif v.Type == "Pet" then
					v72.Thumbnail.Image = v.Image
					v72.Quantity.Text = ""
				elseif v.Type == "Coins" then
					v72.Thumbnail.Image = v.Image
					v72.Quantity.Text = v5.FormatNumber("Number", v.Amount, v72.Quantity)
					v72.Quantity.TextColor3 = Color3.fromRGB(255, 228, 23)
				end
				if v.ThumbnailScale then
					v72.Thumbnail.Size = UDim2.new(v.ThumbnailScale, 0, v.ThumbnailScale, 0)
				end
				v72.Visible = true
				v72.Parent = v52
				v6:GiveTask(v72)
			end
		elseif v.Visible ~= false then
			v72 = v62:Clone()
			if v.Exclusive then
				v72.Exclusive.Visible = true
			end
			if v.Type == "Asset" then
				v8 = v.Image
				if not v8 then
					v9 = t
					v10 = v.AssetId
					v8 = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. t[tonumber(v10)]
				end
				v72.Thumbnail.Image = v8
				v11 = v72.Quantity
				v122 = v.Quantity > 1 and "X" .. v.Quantity or ""
				v11.Text = v122
			elseif v.Type == "Present" then
				v72.Thumbnail.Image = v5.PresentData[v.PresentType].ToolIcon
				v13 = v72.Quantity
				v14 = v.Quantity > 1 and "X" .. v.Quantity or ""
				v13.Text = v14
			elseif v.Type == "Capsule" then
				v72.Thumbnail.Image = v5.CapsuleTypeToImage[v.Rarity]
				v15 = v72.Quantity
				v16 = v.Quantity > 1 and "X" .. v.Quantity or ""
				v15.Text = v16
			elseif v.Type == "Pet" then
				v72.Thumbnail.Image = v.Image
				v72.Quantity.Text = ""
			elseif v.Type == "Coins" then
				v72.Thumbnail.Image = v.Image
				v72.Quantity.Text = v5.FormatNumber("Number", v.Amount, v72.Quantity)
				v72.Quantity.TextColor3 = Color3.fromRGB(255, 228, 23)
			end
			if v.ThumbnailScale then
				v72.Thumbnail.Size = UDim2.new(v.ThumbnailScale, 0, v.ThumbnailScale, 0)
			end
			v72.Visible = true
			v72.Parent = v52
			v6:GiveTask(v72)
		end
	end
	v6.Cancel = CancelButton.MouseButton1Click:Connect(function() --[[ Line: 162 | Upvalues: v7 (ref) ]]
		v7:SetVisible(false)
	end)
	local Price = Buy:FindFirstChild("Price", true)
	Price.Text = v12 and v12.Price or game.ReplicatedStorage:GetAttribute(p1)
	v6.Buy = Buy.MouseButton1Click:connect(function() --[[ Line: 167 | Upvalues: v12 (copy), v1 (ref), p1 (copy), LocalPlayer (ref), v5 (ref) ]]
		if v12 then
			v1:InvokeServer("BuyCoinBundle", p1)
		else
			game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer, v5.GamePasses[p1].ProductId)
		end
	end)
	if not t2[p1].AnimatedBackground then
		v7:SetVisible(true)
		return
	end
	v42.Stripes.Position = UDim2.new(0, 0, 0, 0)
	local TweenService = game:GetService("TweenService")
	local v18 = TweenService:Create(v42:WaitForChild("Stripes"), TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
		Position = UDim2.new(1, 0, 1, 0)
	})
	local v19 = TweenService:Create(v42:WaitForChild("Stripes"), TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
		Position = UDim2.new(0, 0, 0, 0)
	})
	v6:GiveTask(task.spawn(function() --[[ Line: 181 | Upvalues: v18 (copy), v19 (copy) ]]
		while true do
			v18:Play()
			v18.Completed:Wait()
			v19:Play()
			v19.Completed:Wait()
		end
	end))
	v7:SetVisible(true)
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 195 | Upvalues: v4 (copy), v6 (copy), v1 (copy) ]]
	if p1 ~= v4 then
		return
	end
	if p2 then
		return
	end
	v6:DoCleaning()
	v1:FireServer("OnBundleWindowClosed")
end)
workspace.Main.ShowBundle.Event:Connect(ShowBundle)
v1:BindEvents({
	ShowBundle = ShowBundle,
	GamepassPurchased = function(p1) --[[ GamepassPurchased | Line: 215 | Upvalues: v6 (copy), BundlePurchaseParticles (copy), UIParticleEmitter (copy), v7 (copy) ]]
		v6:DoCleaning()
		local v1 = BundlePurchaseParticles:FindFirstChild(p1) == nil
		for i, v in ipairs(BundlePurchaseParticles:GetChildren()) do
			if v1 and v.Name == "Default" or v.Name == p1 then
				UIParticleEmitter:AddEmitter(v)
			end
		end
		task.wait(2)
		for i, v in ipairs(BundlePurchaseParticles:GetChildren()) do
			if v1 and v.Name == "Default" or v.Name == p1 then
				UIParticleEmitter:RemoveEmitter(v)
			end
		end
		v7:SetVisible(false)
	end
})