-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
if game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled then
	local _ = not game:GetService("UserInputService").KeyboardEnabled
end
local Layout = v2:WaitForChild("Layout")
local Top = Layout:WaitForChild("Top")
local ScrollingFrame = Layout:WaitForChild("ScrollingList"):WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Template = ScrollingFrame:WaitForChild("Template")
local Help = Layout:WaitForChild("Import"):WaitForChild("Help")
local TextBox = Layout.Import:WaitForChild("TextBox")
local Power = Top:WaitForChild("Power")
local NoVideosMessage = Layout.ScrollingList:WaitForChild("NoVideosMessage")
local Title = Top:WaitForChild("Title")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v4 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", nil, nil, true)
local v5 = GuiManager:RegisterListView(v2, List)
v5.RecycleRows = false
local v6 = nil
local v7 = nil
v4:SetConsoleSize(UDim2.new(0, 440, v2.Size.Y.Scale, v2.Size.Y.Offset))
v5.GamepadSelectFirstItemOnRefresh = true
if v2.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
	v2.Size = UDim2.new(0, v2.Size.X.Offset, 0, MainGui.AbsoluteSize.Y)
	v4:UpdateTweenEndPoints()
end
NoVideosMessage.Text = "You don\'t own any videos yet. You can add videos to your collection by looking at another player\'s collection. Just go to another house and click on any TV to check if they have any videos you can take."
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 50 ]]
	p2.VideoName.Text = p3[2]
	p2.CreatorName.Text = "by " .. p3[3]
end
local function RefreshList(p1) --[[ RefreshList | Line: 60 | Upvalues: v1 (copy), Template (copy), NoVideosMessage (copy), v3 (copy), v5 (copy) ]]
	local v12 = v1:SendData("GetVideoCollection", "PlayerChannel", 2, p1) or {}
	if p1 == game.Players.LocalPlayer then
		Template.Take.Visible = false
		Template.Play.Visible = true
		Template.Delete.Visible = true
		if v3.IsEnglish() then
			NoVideosMessage.Visible = #v12 == 0
		end
	else
		Template.Take.Visible = true
		Template.Play.Visible = false
		Template.Delete.Visible = false
		NoVideosMessage.Visible = false
	end
	if not v12 then
		return
	end
	v5:UpdateData(v12, Template, ListDisplayFunction)
end
Help.MouseButton1Click:connect(function() --[[ Line: 82 | Upvalues: GuiManager (copy) ]]
	workspace.Main.ShowInstructions:Fire(1)
	GuiManager:GetWindowDataByName("Instructions"):SetVisible(true)
end)
TextBox:GetPropertyChangedSignal("Text"):connect(function() --[[ Line: 87 | Upvalues: TextBox (copy), v2 (copy), v1 (copy), RefreshList (copy), v7 (ref) ]]
	if not TextBox.Text:match("VideoName") then
		TextBox.Text = ""
		return
	end
	local Text = TextBox.Text
	TextBox.Text = ""
	v2.Loading.Visible = true
	v1:SendData("ImportVideo", "PlayerChannel", 60, Text)
	v2.Loading.Visible = false
	RefreshList(v7)
	TextBox.Text = ""
end)
Power.MouseButton1Click:connect(function() --[[ Line: 100 | Upvalues: v6 (ref), Power (copy) ]]
	if not v6 then
		return
	end
	if not v6.Screen.SurfaceGui.Enabled then
		v6.Screen.SurfaceGui.Enabled = true
		Power.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
		return
	end
	v6.Screen.SurfaceGui.Enabled = false
	Power.Style = Enum.ButtonStyle.RobloxRoundButton
end)
workspace.Main.ShowVideoCollection.OnClientEvent:connect(function(p1, p2) --[[ Line: 113 | Upvalues: v4 (copy), RefreshList (copy), v6 (ref), v7 (ref), Power (copy), Title (copy) ]]
	v4:SetVisible(true)
	RefreshList(p1)
	v6 = p2
	v7 = p1
	if p1 ~= game.Players.LocalPlayer then
		Power.Visible = false
		Title.Text = p1.Name .. "\'s Video Collection"
		return
	end
	Power.Visible = true
	if p2.Screen.SurfaceGui.Enabled then
		Power.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
	else
		Power.Style = Enum.ButtonStyle.RobloxRoundButton
	end
	Title.Text = "My Video Collection"
end)
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 135 | Upvalues: v2 (copy), v1 (copy), v4 (copy), Dialog (copy), RefreshList (copy), v7 (ref) ]]
	if p1 ~= v2 then
		return
	end
	local v12 = p4[1]
	local v22 = p4[2]
	local v3 = p4[3]
	if p3.Name == "Play" then
		v1:SendData("PlayVideo", "PlayerChannel", nil, v12, v22, v3)
		v4:SetVisible(false)
		return
	end
	if p3.Name == "Delete" then
		if Dialog:GetChoice("Delete?", "Are you sure you want to delete this video?", "Yes", "No") then
			v1:SendData("DeleteVideo", "PlayerChannel", 2, v12)
			RefreshList(v7)
		end
	else
		if p3.Name ~= "Take" then
			return
		end
		Dialog:ShowMessage("Video Added", "Your video has been added to your video collection.")
		v1:SendData("TakeVideo", "PlayerChannel", 2, v12, v22, v3)
	end
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 163 | Upvalues: v2 (copy), TextBox (copy) ]]
	if p1 ~= v2 then
		return
	end
	if p2 then
		game:GetService("ContextActionService"):BindAction("CtrlPressed", function(p1, p2, p3) --[[ Line: 166 | Upvalues: TextBox (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			TextBox:CaptureFocus()
		end, false, Enum.KeyCode.RightControl, Enum.KeyCode.LeftControl)
		return
	end
	game:GetService("ContextActionService"):UnbindAction("CtrlPressed")
end)