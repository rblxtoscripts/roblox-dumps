-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
local v2 = Library:Load("Queue")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local Open = v3:WaitForChild("Open")
local FurnitureImage = v3:WaitForChild("FurnitureImage")
local PresentImage = v3:WaitForChild("PresentImage")
local FurnitureName = v3:WaitForChild("FurnitureName")
local Sunburst = v3:WaitForChild("Sunburst")
local v4 = GuiManager:RegisterWindow(v3, "Left", "Right", 0.3, nil, true)
v4.FirstSelectedObject = Open
local v5 = Instance.new("BindableEvent")
local v6 = v2.new()
local v7 = nil
local function GivePresent(p1, p2, p3, p4) --[[ GivePresent | Line: 32 | Upvalues: FurnitureImage (copy), v6 (copy), Sunburst (copy), Open (copy), FurnitureName (copy), PresentImage (copy), v7 (ref), v4 (copy), v1 (copy), v5 (copy), GuiManager (copy) ]]
	workspace.Main.CloseBackpack:Fire()
	spawn(function() --[[ Line: 35 | Upvalues: FurnitureImage (ref) ]]
		game:GetService("ContentProvider"):PreloadAsync({ FurnitureImage })
	end)
	v6:Wait()
	Sunburst.Visible = false
	Open.Visible = true
	FurnitureName.Visible = false
	PresentImage.ImageTransparency = 0
	FurnitureImage.ImageTransparency = 1
	if v7 then
		v7:disconnect()
	end
	local v12 = PresentImage
	v12.Image = p4 and "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. p4 or "rbxassetid://2102294839"
	FurnitureImage.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=" .. p1
	FurnitureName.Text = p2
	workspace.Main.FadeMusic.FadeMusic:Invoke("Out", false)
	v4:SetVisible(true)
	v7 = Open.MouseButton1Down:connect(function() --[[ Line: 64 | Upvalues: Open (ref), v7 (ref), PresentImage (ref), FurnitureImage (ref), v1 (ref), Sunburst (ref), FurnitureName (ref), v4 (ref), v5 (ref), p3 (copy), GuiManager (ref) ]]
		Open.Visible = false
		v7:Disconnect()
		game:GetService("TweenService"):Create(PresentImage, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			ImageTransparency = 1
		}):Play()
		game:GetService("TweenService"):Create(FurnitureImage, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			ImageTransparency = 0
		}):Play()
		v1:PlaySound("UnwrapPresent")
		wait(1)
		game:GetService("RunService"):BindToRenderStep("Sunburst", Enum.RenderPriority.First.Value, function() --[[ Line: 77 | Upvalues: Sunburst (ref) ]]
			Sunburst.Rotation = Sunburst.Rotation + 1
		end)
		Sunburst.Size = UDim2.new(0, 0, 0, 0)
		Sunburst.Visible = true
		game:GetService("TweenService"):Create(Sunburst, TweenInfo.new(0.2), {
			Size = UDim2.new(1.12, 0, 1.12, 0)
		}):Play()
		FurnitureName.Visible = true
		v1:PlaySound("Tada2")
		wait(4)
		v4:SetVisible(false)
		game:GetService("RunService"):UnbindFromRenderStep("Sunburst")
		wait(1)
		v5:Fire()
		if p3 then
			GuiManager:GetWindowDataByName("Inventory"):SetVisible(true)
		end
		workspace.Main.FadeMusic.FadeMusic:Invoke("In", true)
	end)
	v5.Event:Wait()
	v6:Next()
end
workspace.Main.GivePresent.OnClientEvent:connect(function(p1, p2, p3, p4) --[[ Line: 113 | Upvalues: GivePresent (copy) ]]
	GivePresent(p1, p2, p3, p4)
end)
workspace.Main.GivePresent.GivePresent.Event:connect(function(p1, p2, p3, p4) --[[ Line: 117 | Upvalues: GivePresent (copy) ]]
	GivePresent(p1, p2, p3, p4)
end)
workspace.Main.ShowMailboxPresentBubble.OnClientEvent:connect(function(p1, p2) --[[ Line: 121 ]]
	p1.Enabled = p2
end)