-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("Queue")
local v4 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local StickerDatabase = require(game.ReplicatedStorage:WaitForChild("StickerDatabase"))
local Menu = MainGui:WaitForChild("Menu")
local Open = v4:WaitForChild("Open")
local Use = v4:WaitForChild("Use")
local StickerImage = v4:WaitForChild("StickerImage")
local CapsuleImage = v4:WaitForChild("CapsuleImage")
local Sunburst = v4:WaitForChild("Sunburst")
local Duplicate = v4:WaitForChild("Duplicate")
local Rarity = v4:WaitForChild("Rarity")
local StickerName = v4:WaitForChild("StickerName")
local CoinReward = v4:WaitForChild("CoinReward")
local CoinRewardText = CoinReward:WaitForChild("CoinRewardText")
local v6 = _G.GamepadEnabled and Menu:WaitForChild("GamepadMoneyz"):WaitForChild("Icon") or Menu:WaitForChild("CoinCounter"):WaitForChild("Moneyz"):WaitForChild("Icon")
local v7 = false
local v8 = false
StickerImage.ImageTransparency = 1
_G.CapsuleQueue = v3.new()
local v9 = GuiManager:RegisterWindow(v4, "Top", "Top", 0.3, Enum.EasingStyle.Bounce, true)
v9.FirstSelectedObject = Open
v2:Preload("ToyDispenserHit")
local v10 = nil
local v11 = nil
workspace.Main.GiveCapsule.OnClientEvent:connect(function(p1, p2, p3, p4, p5) --[[ Line: 45 | Upvalues: v2 (copy), GuiManager (copy), StickerDatabase (copy), v10 (ref), v11 (ref), v7 (ref), v8 (ref), Use (copy), StickerImage (copy), CapsuleImage (copy), StickerName (copy), Sunburst (copy), Duplicate (copy), CoinReward (copy), Open (copy), Rarity (copy), v5 (copy), v9 (copy), CoinRewardText (copy), LocalPlayer (copy), v1 (copy), MainGui (copy), v6 (copy) ]]
	_G.CapsuleQueue:Wait()
	local v12, _ = pcall(function() --[[ Line: 51 | Upvalues: p3 (copy), v2 (ref), GuiManager (ref), StickerDatabase (ref), p1 (copy), v10 (ref), v11 (ref), p2 (copy), v7 (ref), p4 (copy), v8 (ref), p5 (copy), Use (ref), StickerImage (ref), CapsuleImage (ref), StickerName (ref), Sunburst (ref), Duplicate (ref), CoinReward (ref), Open (ref), Rarity (ref), v5 (ref), v9 (ref), CoinRewardText (ref), LocalPlayer (ref), v1 (ref), MainGui (ref), v6 (ref) ]]
		if p3 then
			v2:PlaySound("ToyDispenserTurn")
			wait(0.5)
		end
		GuiManager:GetWindowDataByName("Inventory"):SetVisible(false)
		local Rarity_2 = StickerDatabase[p1].Rarity
		local ImageId = StickerDatabase[p1].ImageId
		local v12 = StickerDatabase[p1].Name
		v10 = p1
		v11 = p2
		v7 = p4
		v8 = p5
		Use.Visible = false
		StickerImage.Visible = false
		CapsuleImage.Visible = true
		StickerName.Visible = false
		StickerImage.ImageTransparency = 0
		Sunburst.Rotation = 0
		Sunburst.Visible = true
		Duplicate.Visible = false
		CoinReward.Visible = false
		CapsuleImage.Size = UDim2.new(0.7, 0, 0.7, 0)
		Sunburst.Size = UDim2.new(0, 0, 0, 0)
		Open.Visible = false
		Rarity.Visible = true
		Rarity.BackgroundColor3 = v5.CapsuleTypeToColor[Rarity_2]
		Rarity.Text = Rarity_2
		local v22
		if Rarity_2 == "Rare" then
			delay(0.5, function() --[[ Line: 95 | Upvalues: v2 (ref), Sunburst (ref), Open (ref) ]]
				v2:PlaySound("Tada2")
				game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Size = UDim2.new(1.12, 0, 1.12, 0)
				}):Play()
				wait(0.5)
				Open.Visible = true
				if not _G.GamepadEnabled then
					return
				end
				game:GetService("GuiService").SelectedObject = Open
			end)
			v22 = "CapsuleRareOpened"
		elseif Rarity_2 == "Legendary" then
			game:GetService("RunService"):BindToRenderStep("Sunburst", Enum.RenderPriority.First.Value, function() --[[ Line: 112 | Upvalues: Sunburst (ref) ]]
				Sunburst.Rotation = Sunburst.Rotation + 1
			end)
			delay(0.5, function() --[[ Line: 119 | Upvalues: Sunburst (ref), v2 (ref), Open (ref) ]]
				game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Size = UDim2.new(1.5, 0, 1.5, 0)
				}):Play()
				v2:PlaySound("Tada2")
				wait(0.5)
				Open.Visible = true
				if not _G.GamepadEnabled then
					return
				end
				game:GetService("GuiService").SelectedObject = Open
			end)
			v22 = "CapsuleLegendaryOpened"
		else
			Open.Visible = true
			v22 = "CapsuleCommonOpened"
			if _G.GamepadEnabled then
				game:GetService("GuiService").SelectedObject = Open
			end
		end
		CapsuleImage.Image = v5.CapsuleTypeToImage[Rarity_2]
		Sunburst.ImageColor3 = v5.CapsuleTypeToColor[Rarity_2]
		Sunburst.Sunburst.ImageColor3 = v5.CapsuleTypeToColor[Rarity_2]
		StickerImage.Image = "rbxassetid://" .. ImageId
		local v3 = false
		delay(5, function() --[[ Line: 153 | Upvalues: v3 (ref), v2 (ref), v9 (ref) ]]
			if v3 then
				return
			end
			v2:PlaySound("ToyDispenserHit")
			v9:SetVisible(true)
			v3 = true
		end)
		spawn(function() --[[ Line: 161 | Upvalues: v2 (ref), CapsuleImage (ref), Sunburst (ref), StickerImage (ref), v22 (ref), v3 (ref), v9 (ref) ]]
			v2:PreloadAsync(CapsuleImage, Sunburst, StickerImage, v22, "CapsuleOpening")
			if v3 then
				return
			end
			v2:PlaySound("ToyDispenserHit")
			v9:SetVisible(true)
			v3 = true
		end)
		local v4 = nil
		v4 = Open.MouseButton1Down:connect(function() --[[ Line: 174 | Upvalues: v4 (ref), Open (ref), Rarity (ref), v2 (ref), CapsuleImage (ref), StickerImage (ref), Sunburst (ref), p2 (ref), Rarity_2 (copy), StickerName (ref), v5 (ref), v12 (copy), p1 (ref), Use (ref), Duplicate (ref), CoinReward (ref), CoinRewardText (ref), LocalPlayer (ref), v1 (ref), MainGui (ref), v6 (ref), v9 (ref) ]]
			v4:disconnect()
			Open.Visible = false
			Rarity.Visible = false
			v2:PlaySound("CapsuleOpening")
			game:GetService("TweenService"):Create(CapsuleImage, TweenInfo.new(0.2), {
				Size = UDim2.new(0.9, 0, 0.9, 0)
			}):Play()
			wait(0.2)
			game:GetService("TweenService"):Create(CapsuleImage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
			game:GetService("TweenService"):Create(StickerImage, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
			game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
			wait(0.3)
			game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.1), {
				Size = UDim2.new(0.4, 0, 0.4, 0)
			}):Play()
			wait(0.1)
			game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.2), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
			wait(0.2)
			wait(0.4)
			StickerImage.Visible = true
			CapsuleImage.Visible = false
			if p2 then
				game:GetService("TweenService"):Create(StickerImage, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
					Size = UDim2.new(0.6, 0, 0.6, 0)
				}):Play()
				wait(0.2)
				Duplicate.Visible = true
				wait(1)
				CoinReward.Visible = true
				CoinRewardText.Text = v5.FormatNumber("Plus", v5.CapsuleDuplicateAmount[Rarity_2], CoinRewardText)
				CoinReward.BackgroundColor3 = v5.CapsuleTypeToColor[Rarity_2]
				for i = 1, 3 do
					wait(0.2)
					CoinRewardText.TextColor3 = Color3.fromRGB(255, 230, 87)
					wait(0.2)
					CoinRewardText.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
				wait(0.7)
				local v22 = LocalPlayer.Moneyz.Value + v5.CapsuleDuplicateAmount[Rarity_2]
				local sum, sum_2, count, v3, v42 = v5.CapsuleDuplicateAmount[Rarity_2], 3, 1, 1, 0.1
				while true do
					if not (sum > 0) then
						break
					end
					CoinRewardText.Text = "+" .. sum
					v1:TweenAbsolutePosition(MainGui, v6, CoinReward.Icon.AbsolutePosition + Vector2.new(math.random(0, CoinReward.Icon.AbsoluteSize.X), 0), v6.AbsolutePosition, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, function() --[[ Line: 300 | Upvalues: v3 (ref), v42 (ref), LocalPlayer (ref), sum_2 (ref), v22 (copy) ]]
						if v3 > 10 then
							v3 = 1
						end
						_G.CoinSounds[v3].Pitch = 1.005 - v42 / 20
						_G.CoinSounds[v3]:Play()
						v3 = v3 + 1
						LocalPlayer.Moneyz.Value = LocalPlayer.Moneyz.Value + 1
						v42 = v42 - 0.005
						if not (sum_2 > 1) then
							return
						end
						LocalPlayer.Moneyz.Value = v22
					end)
					if math.floor(count / 20) == count / 20 then
						sum_2 = sum_2 + count
					end
					if sum <= sum_2 then
						CoinRewardText.Text = "+0"
						break
					end
					sum = sum - sum_2
					wait(v42)
					count = count + 1
				end
				wait(1)
				workspace.Main.GiveCapsule:FireServer(p1)
				v9:SetVisible(false)
			else
				game:GetService("RunService"):UnbindFromRenderStep("Sunburst")
				game:GetService("RunService"):BindToRenderStep("Sunburst", Enum.RenderPriority.First.Value, function() --[[ Line: 208 | Upvalues: Sunburst (ref) ]]
					Sunburst.Rotation = Sunburst.Rotation + 1
				end)
				local v52 = 1
				if Rarity_2 == "Rare" then
					v2:PlaySound("CapsuleRareOpened")
					v52 = 0.55
				elseif Rarity_2 == "Legendary" then
					v2:PlaySound("CapsuleLegendaryOpened")
					v52 = 1.1
				elseif Rarity_2 == "Common" or Rarity_2 == "Uncommon" then
					v2:PlaySound("CapsuleCommonOpened")
					v52 = 0.3
				end
				game:GetService("TweenService"):Create(StickerImage, TweenInfo.new(v52, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
					Size = UDim2.new(0.6, 0, 0.6, 0)
				}):Play()
				delay(v52, function() --[[ Line: 233 | Upvalues: Sunburst (ref) ]]
					game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
						Size = UDim2.new(1.12, 0, 1.12, 0)
					}):Play()
				end)
				delay(v52, function() --[[ Line: 237 | Upvalues: StickerName (ref), v5 (ref), Rarity_2 (ref), v12 (ref) ]]
					StickerName.Visible = true
					StickerName.BackgroundColor3 = v5.CapsuleTypeToColor[Rarity_2]
					StickerName.Text = v12
				end)
				workspace.Main.GiveCapsule:FireServer(p1)
				wait(2)
				Use.Visible = true
				if _G.GamepadEnabled then
					game:GetService("GuiService").SelectedObject = Use
				end
			end
		end)
	end)
	if v12 then
		return
	end
	_G.CapsuleQueue:Next()
end)
Use.MouseButton1Click:connect(function() --[[ Line: 365 | Upvalues: v9 (copy) ]]
	v9:SetVisible(false)
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 370 | Upvalues: v4 (copy), v11 (ref), v10 (ref), v7 (ref), v8 (ref) ]]
	if p1 ~= v4 or p2 then
		return
	end
	wait(0.3)
	game:GetService("RunService"):UnbindFromRenderStep("Sunburst")
	if v11 then
		_G.CapsuleQueue:Next()
		return
	end
	workspace.Main.NewStickerAnimation:Fire(v10, v7, v8)
end)