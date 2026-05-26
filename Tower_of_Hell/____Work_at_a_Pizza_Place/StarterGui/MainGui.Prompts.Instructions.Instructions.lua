-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local Layout = v1:WaitForChild("Layout")
local Title = Layout:WaitForChild("Title"):WaitForChild("Title")
local ImageLabel = Layout:WaitForChild("Image"):WaitForChild("ImageLabel")
local Next = Layout:WaitForChild("Buttons"):WaitForChild("Next")
local Previous = Layout:WaitForChild("Buttons"):WaitForChild("Previous")
local Finish = Layout:WaitForChild("Buttons"):WaitForChild("Finish")
local TextLabel = Layout:WaitForChild("Text"):WaitForChild("TextLabel")
local v2 = GuiManager:RegisterWindow(v1, "Left", "Right", nil, nil, false)
local v3 = nil
local t = { "How to install Video Maker plugin" }
local t2 = {
	{
		{
			ImageId = 887150370,
			Text = "Find the Roblox Studio icon on your desktop and double click it",
			Size = Vector2.new(89, 119)
		},
		{
			ImageId = 887150771,
			Text = "Click on the \'Plugins\' tab",
			Size = Vector2.new(377, 144)
		},
		{
			ImageId = 887151014,
			Text = "Click on the \'Manage Plugins\' button to the left",
			Size = Vector2.new(55, 71)
		},
		{
			ImageId = 887151168,
			Text = "Click on the \'Find Plugins\' button",
			Size = Vector2.new(263, 202)
		},
		{
			ImageId = 887151374,
			Text = "Type \'video maker\' in the search box and then click the search button.",
			Size = Vector2.new(607, 182)
		},
		{
			ImageId = 893225038,
			Text = "Click on \'Pizza Place Video Maker\'",
			Size = Vector2.new(148, 199)
		},
		{
			ImageId = 887151879,
			Text = "Install the plugin",
			Size = Vector2.new(408, 262)
		},
		{
			ImageId = 893177224,
			Text = "Press the Ctrl and N keys at the same time.",
			Size = Vector2.new(400, 131)
		},
		{
			ImageId = 887150771,
			Text = "Click on the \'Plugins\' tab",
			Size = Vector2.new(377, 144)
		},
		{
			ImageId = 887152403,
			Text = "Click on the \'Open Editor\' button",
			Size = Vector2.new(74, 97)
		},
		{
			ImageId = 887193218,
			Text = "Make your video and then press the \'Export\' button when you\'re done.",
			Size = Vector2.new(1182, 607)
		}
	}
}
local v4 = 1
local function ChangeSlide(p1) --[[ ChangeSlide | Line: 52 | Upvalues: v4 (ref), Previous (copy), t2 (copy), v3 (ref), Next (copy), Finish (copy), ImageLabel (copy), TextLabel (copy) ]]
	v4 = v4 + p1
	if v4 <= 1 then
		Previous.Visible = false
	else
		Previous.Visible = true
	end
	local v1 = t2[v3]
	local v2 = v1[v4]
	if #v1 <= v4 then
		Next.Visible = false
		Finish.Visible = true
	else
		Next.Visible = true
		Finish.Visible = false
	end
	local AbsoluteSize = ImageLabel.Parent.AbsoluteSize
	local Size = v2.Size
	if AbsoluteSize.X > Size.X and AbsoluteSize.Y > Size.Y then
		ImageLabel.Size = UDim2.new(0, Size.X, 0, Size.Y)
	else
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
	end
	ImageLabel.Image = "rbxassetid://" .. v2.ImageId
	ImageLabel.UIAspectRatioConstraint.AspectRatio = Size.X / Size.Y
	TextLabel.Text = v2.Text
end
Next.MouseButton1Click:connect(function() --[[ Line: 89 | Upvalues: ChangeSlide (copy) ]]
	ChangeSlide(1)
end)
Previous.MouseButton1Click:connect(function() --[[ Line: 90 | Upvalues: ChangeSlide (copy) ]]
	ChangeSlide(-1)
end)
Finish.MouseButton1Click:connect(function() --[[ Line: 92 | Upvalues: v2 (copy) ]]
	v2:SetVisible(false)
end)
workspace.Main.ShowInstructions.Event:connect(function(p1) --[[ Line: 97 | Upvalues: v3 (ref), Title (copy), t (copy), v4 (ref), ChangeSlide (copy), v2 (copy) ]]
	v3 = p1
	Title.Text = t[p1]
	v4 = 0
	ChangeSlide(1)
	v2:SetVisible(true)
end)