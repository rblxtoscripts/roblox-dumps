-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v5 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", nil, nil, true)
local StickerDatabase = require(game.ReplicatedStorage:WaitForChild("StickerDatabase"))
local Collection = v3:WaitForChild("Collection")
local PercentComplete = v3:WaitForChild("PercentComplete")
local StickerTemplate = v3:WaitForChild("StickerTemplate")
local QuestionMarkTemplate = v3:WaitForChild("QuestionMarkTemplate")
local UIGridLayout = Collection:WaitForChild("UIGridLayout")
local v6 = v1:SendData("GetBinaryCollection", "PlayerChannel", 5) or v1:SendData("GetBinaryCollection", "PlayerChannel", 5)
local t = {}
local v7 = nil
local v8 = nil
function NewStickerAnimation(p1, p2, p3) --[[ NewStickerAnimation | Line: 30 | Upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy), t (copy), StickerDatabase (copy), v4 (copy), StickerTemplate (copy), PercentComplete (copy), v8 (ref), v7 (ref), GuiManager (copy), MainGui (copy) ]]
	v2:Preload("Sticker")
	if p3 then
		v2:Preload("CollectionComplete")
	elseif p2 then
		v2:Preload("TierComplete")
	end
	v3.CancelButton.Visible = false
	if not v3.Visible then
		v5:SetVisible(true)
	end
	v6[p1] = 1
	wait(1)
	local v1 = t[p1]
	local v22 = StickerDatabase[p1]
	local v42 = StickerTemplate:clone()
	v42.Image = "rbxassetid://" .. v22.ImageId
	v42.BackgroundTransparency = 1
	v42.Visible = true
	v42.Size = UDim2.new(15, 0, 15, 0)
	v42.Position = UDim2.new(0.5, 0, 0.5, 0)
	v42.ZIndex = 10
	v42.Parent = v1
	if v1:IsA("TextLabel") then
		v1.Text = ""
	end
	game:GetService("TweenService"):Create(v42, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 1, 0)
	}):Play()
	wait(0.728)
	v2:PlaySound("Sticker")
	wait(0.272)
	game:GetService("TweenService"):Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		BackgroundTransparency = 0.2,
		BackgroundColor3 = v4.CapsuleTypeToColor[v22.Rarity]
	}):Play()
	wait(0.5)
	game:GetService("TweenService"):Create(PercentComplete, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = UDim2.new(0.2, 0, 0, 64)
	}):Play()
	wait(0.4)
	PercentComplete.Text = v4.FormatNumber("Percentage", v8 + 2, PercentComplete)
	wait(0.4)
	game:GetService("TweenService"):Create(PercentComplete, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = UDim2.new(0.1, 0, 0, 34)
	}):Play()
	v42:Destroy()
	v7()
	local list = {}
	for i, v in ipairs(t) do
		if StickerDatabase[i].Rarity == v22.Rarity or p3 then
			table.insert(list, v)
		end
	end
	local v52 = #list
	local v62 = if p3 then 7.76 else 1.28
	local v72 = if p3 then 4 else 1
	local v82 = v62 / v52
	local t2 = { 1.43, 1.41, 1.48, 0.65 }
	if p2 or p3 then
		if p3 then
			v2:PlaySound("CollectionComplete")
		else
			v2:PlaySound("TierComplete")
		end
		for i = 1, v72 do
			local v9 = p3 and t2[i] or v62
			for i2, v in ipairs(list) do
				delay(v9 / v52 * i2, function() --[[ Line: 131 | Upvalues: v (copy), v82 (copy) ]]
					local v1 = v:Clone()
					v1.BackgroundTransparency = 1
					v1.Position = UDim2.new(0.5, 0, 0.5, 0)
					v1.Size = UDim2.new(1, 0, 1, 0)
					v1.ZIndex = 3
					v1.Parent = v
					v.ImageTransparency = 1
					game:GetService("TweenService"):Create(v1, TweenInfo.new(v82, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						Size = UDim2.new(2, 0, 2, 0)
					}):Play()
					wait(v82)
					game:GetService("TweenService"):Create(v1, TweenInfo.new(v82, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						Size = UDim2.new(1, 0, 1, 0)
					}):Play()
					wait(v82)
					v.ImageTransparency = 0
					v1:Destroy()
				end)
			end
			wait(v9)
		end
		wait(2)
	end
	wait(3)
	v5:SetVisible(false)
	wait(0.3)
	v3.CancelButton.Visible = true
	_G.CapsuleQueue:Next()
	if p3 then
		workspace.Main.GivePresent.GivePresent:Fire(2327242153, "Full Collection", 1000)
		return
	end
	GuiManager:GetWindowDataByName("Inventory"):SetVisible(true)
	if not _G.GamepadEnabled then
		GuiManager.Data[MainGui.Menu.Inventory.Tabs]:SetFirstTabPressed(MainGui.Menu.Inventory.Tabs.TabButtons.Stickers)
		GuiManager:GetWindowDataByName("Inventory"):StartStickerPlacement(v22.Index)
		return
	end
	wait(0.4)
	GuiManager.Data[MainGui.Menu.Inventory.Tabs]:SetFirstTabPressed(MainGui.Menu.Inventory.Tabs.TabButtons.Stickers)
	GuiManager:GetWindowDataByName("Inventory"):StartStickerPlacement(v22.Index)
end
workspace.Main.NewStickerAnimation.Event:connect(NewStickerAnimation)
v7 = function() --[[ Refresh | Line: 197 | Upvalues: v6 (copy), StickerDatabase (copy), t (copy), StickerTemplate (copy), v4 (copy), Collection (copy), QuestionMarkTemplate (copy), v8 (ref), PercentComplete (copy), UIGridLayout (copy) ]]
	local count = 0
	for i, v in ipairs(v6) do
		local v1 = StickerDatabase[i]
		if v == 1 then
			if t[i] == nil or t[i].Name ~= "StickerTemplate" then
				if t[i] and t[i].Name == "QuestionMarkTemplate" then
					t[i]:Destroy()
				end
				local v2 = StickerTemplate:clone()
				v2.LayoutOrder = i
				v2.Image = "rbxassetid://" .. v1.ImageId
				v2.BackgroundColor3 = v4.CapsuleTypeToColor[v1.Rarity]
				v2.Visible = true
				v2.Parent = Collection
				t[i] = v2
			end
			count = count + 1
			continue
		end
		if v == 0 and (t[i] == nil or t[i].Name ~= "QuestionMarkTemplate") then
			local v3 = QuestionMarkTemplate:clone()
			v3.LayoutOrder = i
			v3.Visible = true
			v3.Parent = Collection
			t[i] = v3
		end
	end
	v8 = count * 2
	PercentComplete.Text = v4.FormatNumber("Percentage", count * 2, PercentComplete)
	UIGridLayout:ApplyLayout()
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 246 | Upvalues: v3 (copy), v7 (ref) ]]
	if p1 ~= v3 or not p2 then
		return
	end
	v7()
end)