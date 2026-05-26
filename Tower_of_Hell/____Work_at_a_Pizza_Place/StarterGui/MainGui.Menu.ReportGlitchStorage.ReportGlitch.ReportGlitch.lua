-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local LocalPlayer = game.Players.LocalPlayer
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local OpenButton = v2.Parent:WaitForChild("OpenButton")
local Submit = v2:WaitForChild("Submit")
local InputText = v2:WaitForChild("InputText")
if v1.IsTestPlace and not (_G.GamepadEnabled or v1.IsStudio) then
	OpenButton.Visible = true
end
if _G.GamepadEnabled then
	InputText.TextSize = 28
end
local v3 = GuiManager:RegisterWindow(v2, "Right", "Right")
v3.FirstSelectedObject = InputText
v3:SetConsoleSize(UDim2.new(0, 450, 1, 0))
local t = {}
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 34 | Upvalues: v2 (copy), v1 (copy), OpenButton (copy) ]]
	if p1 ~= v2 or (p2 or not v1.IsTestPlace) then
		return
	end
	OpenButton.Visible = true
end)
spawn(function() --[[ Line: 40 | Upvalues: v1 (copy), OpenButton (copy), v3 (copy), InputText (copy) ]]
	if not (v1.IsTestPlace and v1.IsEnglish()) then
		return
	end
	OpenButton.MouseButton1Click:connect(function() --[[ Line: 43 | Upvalues: OpenButton (ref), v3 (ref), InputText (ref) ]]
		OpenButton.Visible = false
		v3:SetVisible(true)
		InputText.ClearTextOnFocus = true
	end)
end)
Submit.MouseButton1Click:connect(function() --[[ Line: 53 | Upvalues: InputText (copy), Dialog (copy), t (ref), MainGui (copy), v1 (copy), OpenButton (copy), v3 (copy) ]]
	InputText.ClearTextOnFocus = false
	if string.match(InputText.Text, "me as much as you can about") then
		Dialog:ShowMessage("", "You did not write anything.")
		return
	end
	if string.len(InputText.Text) < 15 then
		Dialog:ShowMessage("", "Your report is too short")
		return
	end
	if string.len(InputText.Text) > 1000 then
		Dialog:ShowMessage("Message too long", "Your message is too long. 1,000 character is the limit.")
		return
	end
	workspace.Main.ReportGlitch:FireServer(InputText.Text, t, game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled, MainGui.AbsoluteSize.X .. "x" .. MainGui.AbsoluteSize.Y)
	t = {}
	Dialog:ShowMessage("", "Thank You!")
	if not v1.IsTestPlace then
		v3:SetVisible(false)
		InputText.ClearTextOnFocus = true
		wait(0.3)
		InputText.Text = "Type here. Tell me as much as you can about the glitch."
		return
	end
	OpenButton.Visible = true
	v3:SetVisible(false)
	InputText.ClearTextOnFocus = true
	wait(0.3)
	InputText.Text = "Type here. Tell me as much as you can about the glitch."
end)