-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
if v4.IsPartyServer then
	return
end
v3:WaitForChild("Buy")
local CancelButton = v3:WaitForChild("CancelButton")
if _G.GamepadEnabled then
	v3.UIScale.Scale = 1.3
end
local v5 = GuiManager:RegisterWindow(v3, "Top", "Top", nil, nil, true)
v5.FirstSelectedObject = v3:WaitForChild("Buy")
local v6 = nil
local v7 = nil
local v8 = nil
local v9 = workspace.TheDump.Floor:clone()
local v10 = workspace.TheDump.Wall:clone()
function ShowWallFloorDump(p1, p2, p3) --[[ ShowWallFloorDump | Line: 35 | Upvalues: v2 (copy) ]]
	if p3 then
		v2:PlaySound("Pop1")
	end
	delay(0.05, function() --[[ Line: 42 | Upvalues: p1 (copy), p2 (copy) ]]
		for i, v in ipairs(workspace.TheDump:GetChildren()) do
			if v.Name == p1 and v:FindFirstChild("Texture") then
				v.Texture.Texture = p2.Texture.Texture
				v.Texture.Transparency = p2.Texture.Transparency
				v.Texture.StudsPerTileU = p2.Texture.StudsPerTileU
				v.Texture.StudsPerTileV = p2.Texture.StudsPerTileV
				if v.Name == "Floor" then
					v.Material = p2.Material
					v.BrickColor = p2.BrickColor
					v.Reflectance = p2.Reflectance
				end
			end
		end
	end)
end
workspace.Main.ShowWallFloorDump.OnClientEvent:connect(ShowWallFloorDump)
function ShowItemPurchasePrompt(p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ ShowItemPurchasePrompt | Line: 67 | Upvalues: v4 (copy), v3 (copy), v5 (copy), v6 (ref), v7 (ref), v8 (ref), v1 (copy) ]]
	local v2 = v4.FormatNumber("Number", p4, v3.Price) or tostring(p4)
	local v32 = tostring(p3)
	v5:SetVisible(true)
	v6 = p1
	v7 = p7
	v3.AssetImage.AssetImage.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. p2 or p1
	v3.OriginalPrice.Text = v4.FormatNumber("Number", p5, v3.OriginalPrice)
	v3.Price.Text = v2
	v3.Title.Text = v32
	v3.PercentOff.TextLabel.Text = "-" .. v4.FormatNumber("Percentage", p6, v3.PercentOff.TextLabel) or tostring(p6)
	v3.PercentOff.Visible = if p4 == p5 then false else true
	v3.OriginalPrice.Visible = if p4 == p5 then false else true
	v3.Creator.Visible = true
	v3.Creator.Text = p9 ~= nil and v4.IsEnglish and "Created by " .. p9 or ""
	v3.OriginalPrice.RedX.Size = UDim2.new(0, 38 + v3.OriginalPrice.TextBounds.X + 5, 0.976, 0)
	if p7 == "Robux" then
		v3.OriginalPrice.TextColor3 = Color3.fromRGB(2, 183, 87)
		v3.Price.TextColor3 = Color3.fromRGB(2, 183, 87)
		v3.OriginalPrice.Icon.Image = "rbxasset://textures/ui/RobuxIcon.png"
		v3.Price.Icon.Image = "rbxasset://textures/ui/RobuxIcon.png"
	else
		v3.OriginalPrice.TextColor3 = Color3.fromRGB(255, 255, 255)
		v3.Price.TextColor3 = Color3.fromRGB(255, 255, 255)
		v3.OriginalPrice.Icon.Image = "rbxassetid://494791709"
		v3.Price.Icon.Image = "rbxassetid://494791709"
	end
	if p8 then
		v3.AssetImage.ImageTransparency = 0
		v3.AssetImage.ImageColor3 = v4.CapsuleTypeToColor[p8]
	else
		v3.AssetImage.ImageTransparency = 1
	end
	if not v8 then
		v8 = v3.Buy.MouseButton1Click:connect(function() --[[ Line: 118 | Upvalues: v6 (ref), v1 (ref) ]]
			workspace.Main.BuyButtonPressed:FireServer(v6)
			v1:SendData("ActionCompleted", "PlayerChannel", nil, "BoughtDumpItem")
		end)
		return
	end
	v8:disconnect()
	v8 = v3.Buy.MouseButton1Click:connect(function() --[[ Line: 118 | Upvalues: v6 (ref), v1 (ref) ]]
		workspace.Main.BuyButtonPressed:FireServer(v6)
		v1:SendData("ActionCompleted", "PlayerChannel", nil, "BoughtDumpItem")
	end)
end
workspace.Main.ShowItemPurchasePrompt.OnClientEvent:connect(ShowItemPurchasePrompt)
workspace.Main.ShowItemPurchasePrompt.ShowItemPurchasePrompt.Event:connect(ShowItemPurchasePrompt)
v3.Buy.Text = "Buy"
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 133 | Upvalues: v3 (copy), v10 (copy), v9 (copy) ]]
	if p1 ~= v3 or p2 then
		return
	end
	workspace.Main.ItemPromptClosed:FireServer()
	ShowWallFloorDump("Wall", v10)
	ShowWallFloorDump("Floor", v9)
end)
CancelButton.MouseButton1Click:connect(function() --[[ Line: 142 | Upvalues: v5 (copy) ]]
	v5:SetVisible(false)
end)