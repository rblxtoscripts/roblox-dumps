-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("CameraUtil")
local v4 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local t = {}
local v5 = nil
local CurrentCamera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer
local Buttons = v4:WaitForChild("Buttons")
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v6 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v7 = GuiManager:RegisterWindow(v4)
v7.CanBeCanceled = false
local Presents = game.ReplicatedStorage._v6FiRE_Additions.Presents
local RemovePresentFromInventory = Presents.RemovePresentFromInventory
local PresentOpenCancel = Presents.PresentOpenCancel
local function CancelEffect(p1) --[[ CancelEffect | Line: 39 | Upvalues: LocalPlayer (copy), v2 (copy) ]]
	local v1 = game.ReplicatedStorage.Smoke:clone()
	v1.Parent = p1
	v1:Emit(7)
	if LocalPlayer.PlayerGui:FindFirstChild("PresentBillboardTemplate") then
		LocalPlayer.PlayerGui.PresentBillboardTemplate:Destroy()
	end
	v2:PlaySound("CapsuleOpening2")
end
function Cancel(p1) --[[ Cancel | Line: 50 | Upvalues: v5 (ref), LocalPlayer (copy), CancelEffect (copy), v7 (copy), GuiManager (copy), CurrentCamera (copy) ]]
	if v5 then
		v5:disconnect()
	end
	local v1 = LocalPlayer.Character:FindFirstChild("PresentType", true).Parent
	if v1 and v1.Parent then
		CancelEffect(v1.Present.Handle)
		for i, v in ipairs(v1:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
	else
		v7:SetVisible(false)
	end
	GuiManager:GetWindowDataByName("RaritiesPercentages"):SetVisible(false)
	game:GetService("RunService"):UnbindFromRenderStep("Present")
	wait(0.5)
	workspace.Main.StartPresentAnimation:FireServer("Cancel")
	workspace.Main.StartPresentAnimation.StartPresentAnimation:Fire("Cancel")
	if p1 then
		return
	end
	GuiManager:GetWindowDataByName("Backpack"):SetVisible(true)
	CurrentCamera.CameraType = Enum.CameraType.Custom
end
local v8 = false
local function v9(p1, p2) --[[ ButtonPressed | Line: 85 | Upvalues: LocalPlayer (copy), RemovePresentFromInventory (copy), v1 (copy), GuiManager (copy), v8 (ref), CancelEffect (copy), v2 (copy), t (ref), Buttons (copy), v5 (ref), v7 (copy), v9 (copy), PresentOpenCancel (copy) ]]
	local v12 = LocalPlayer.Character:FindFirstChild("PresentType", true).Parent
	if not v12 then
		return
	end
	if p1.Name == "Open" then
		workspace.Main.StartPresentAnimation:FireServer("OpenPresent")
		RemovePresentFromInventory:Fire(v12)
		v1:SendData("PutUnwrappedItemInInventory", "PlayerChannel", nil, v12.RewardAssetId.Value)
		GuiManager:GetWindowDataByName("Inventory"):SetVisible(false)
	elseif p1.Name == "Sell" then
		if v8 == true then
			return
		end
		v8 = true
		CancelEffect(v12.Lid.Handle2)
		v2:PlaySound("CashRegister")
		t[Buttons.Keep]:disconnect()
		local v3 = false
		_G.CoinAnimation(v12.SellPrice.Value, Buttons.Sell.MoneyzIcon.AbsolutePosition).Event:connect(function(p12, p2) --[[ Line: 113 | Upvalues: p1 (copy), v3 (ref), v1 (ref), v12 (copy) ]]
			if p12 == "CoinSpawned" then
				p1.Amount.Text = p2
				return
			end
			if p12 ~= "Finished" then
				return
			end
			p1.Amount.Text = 0
			v3 = true
			v1:SendData("SellInventoryItem", "PlayerChannel", nil, v12.RewardAssetId.Value)
		end)
		while not v3 do
			wait()
		end
		v8 = false
		wait(0.5)
		NextPresent()
	elseif p1.Name == "Keep" then
		workspace.Main.ShrinkBillboard:Fire()
		NextPresent()
	else
		if p1.Name == "Buy" then
			GuiManager:GetWindowDataByName("RaritiesPercentages"):SetVisible(false)
			if workspace.Main.BuyPresentCoins:InvokeServer(v12) then
				v1:SendData("PutUnwrappedItemInInventory", "PlayerChannel", nil, v12.RewardAssetId.Value, v12.PresentType.Value)
				GuiManager:GetWindowDataByName("Inventory"):SetVisible(false)
				workspace.Main.StartPresentAnimation:FireServer("OpenPresent")
				RemovePresentFromInventory:Fire(v12)
				return true
			else
				v5 = workspace.Main.CheckGiven.Event:connect(function(p12) --[[ Line: 149 | Upvalues: v5 (ref), v7 (ref), v9 (ref), p1 (copy) ]]
					if p12 ~= "Moneyz Purchase Check" then
						return
					end
					v5:disconnect()
					v7:SetVisible(false)
					v9(p1)
				end)
				return false
			end
		end
		if p1.Name ~= "Cancel" then
			return true
		end
		if p2 then
			workspace.Main.StartPresentAnimation:FireServer("Cancel")
			PresentOpenCancel:Fire(v12)
		else
			Cancel()
		end
	end
	return true
end
local function ShowButtons(...) --[[ ShowButtons | Line: 173 | Upvalues: LocalPlayer (copy), t (ref), Buttons (copy), v1 (copy), v9 (copy), v7 (copy), v4 (copy), v6 (copy), GuiManager (copy) ]]
	wait()
	local v12 = LocalPlayer.Character:FindFirstChild("PresentType", true).Parent
	if not v12 then
		return
	end
	for k, v in pairs(t) do
		t[k]:disconnect()
	end
	t = {}
	local list = { ... }
	for i, v in ipairs(Buttons:GetChildren()) do
		for i2, v2 in ipairs(list) do
			if v.Name == v2 then
				v.Visible = true
				t[v] = v.MouseButton1Click:connect(v1:Debounce(function() --[[ Line: 190 | Upvalues: v9 (ref), v (copy), list (copy), t (ref), v7 (ref) ]]
					if v9(v, table.find(list, "Open")) then
						if t[v] then
							t[v]:disconnect()
						end
						v7:SetVisible(false)
					end
					wait(0.5)
				end))
				if v.Name == "Sell" then
					v.Amount.Text = v12.SellPrice.Value
					v4.ItemName.Visible = true
					v4.ItemName.Text = v12.RewardName.Value
					if v12.Rarity.Value == "Normal" then
						v4.Rarity.Visible = false
					else
						v4.Rarity.TextColor3 = v6.CapsuleTypeToColor[v12.Rarity.Value]
						v4.Rarity.Text = v12.Rarity.Value
						v4.Rarity.Visible = true
					end
					if _G.GamepadEnabled then
						v7.FirstSelectedObject = v4.Buttons.Keep
					end
				elseif v.Name == "Buy" then
					v4.ItemName.Visible = false
					v4.Rarity.Visible = false
					if v12.PresentType.Value == "Normal" then
						GuiManager:GetWindowDataByName("RaritiesPercentages"):SetVisible(true)
					end
					if _G.GamepadEnabled then
						v7.FirstSelectedObject = v4.Buttons.Buy
					end
					v.MoneyzIcon.Image = "rbxassetid://494791709"
					v.Amount.Text = v6.PresentData[v12.Name].Price
					v.Amount.TextColor3 = Color3.fromRGB(255, 255, 255)
				elseif v.Name == "Open" then
					v4.ItemName.Visible = false
					GuiManager:GetWindowDataByName("Backpack"):SetVisible(false)
					GuiManager:GetWindowDataByName("Inventory"):SetVisible(false)
					if _G.GamepadEnabled then
						v7.FirstSelectedObject = v4.Buttons.Open
					end
				end
				break
			elseif v:IsA("GuiButton") then
				v.Visible = false
			end
		end
	end
	v7:SetVisible(true)
end
local function getNextTool(p1, p2) --[[ getNextTool | Line: 260 ]]
	return game.ReplicatedStorage._v6FiRE_Additions.Presents.GetNextPresent:Invoke(p1, p2)
end
function NextPresent() --[[ NextPresent | Line: 265 | Upvalues: LocalPlayer (copy), v3 (copy), CurrentCamera (copy), Buttons (copy), v6 (copy), v7 (copy), ShowButtons (copy) ]]
	local Humanoid = LocalPlayer.Character.Humanoid
	local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
	local _ = LocalPlayer.Character:FindFirstChild("PresentType", true).Parent
	v3:InterpolateCameraType2(CurrentCamera, CFrame.new((HumanoidRootPart.CFrame + HumanoidRootPart.CFrame.lookVector * 5 + Vector3.new(0, 3, 0)).p, Humanoid.Parent.HumanoidRootPart.Position).p, HumanoidRootPart, 0.5, function() --[[ Line: 276 | Upvalues: LocalPlayer (ref), Buttons (ref), v6 (ref), v7 (ref), Humanoid (copy), ShowButtons (ref) ]]
		workspace.Main.StartPresentAnimation:FireServer("DropFromSky")
		wait(0.3)
		local v1 = LocalPlayer.Character:FindFirstChild("PresentType", true).Parent
		if not v1 then
			Cancel()
			return
		end
		Buttons.Buy.Amount.Text = v6.PresentData[v1.Name].Price
		v7:SetVisible(false)
		game:GetService("RunService"):UnbindFromRenderStep("Present")
		local v2 = game.ReplicatedStorage._v6FiRE_Additions.Presents.GetNextPresent:Invoke(v1, v1.PresentType.Value)
		if v2 then
			Cancel(true)
			Humanoid:EquipTool(v2)
		else
			ShowButtons("Buy", "Cancel")
		end
	end)
end
workspace.Main.ShowOpenButton.Event:connect(function() --[[ Line: 304 | Upvalues: v7 (copy), ShowButtons (copy) ]]
	wait(0.1)
	v7:SetVisible(false)
	ShowButtons("Open", "Cancel")
end)
workspace.Main.ShowSellButton.Event:connect(function() --[[ Line: 310 | Upvalues: v7 (copy), ShowButtons (copy) ]]
	wait(0.1)
	v7:SetVisible(false)
	ShowButtons("Sell", "Keep")
end)