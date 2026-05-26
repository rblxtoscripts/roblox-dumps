-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local ScrollingFrame = v2:WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Template = ScrollingFrame:WaitForChild("Template")
local Empty = v2:WaitForChild("Empty")
local v3 = require(ReplicatedStorage.Enums)
local Dialog = require(ReplicatedStorage.Dialog)
local v4 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", nil, nil, true)
local v5 = GuiManager:RegisterListView(v2, List)
v4.UseCursor = true
v4:SetConsoleSize(UDim2.new(0, 350, v2.Size.Y.Scale, v2.Size.Y.Offset))
if v2.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
	v2.Size = UDim2.new(0, v2.Size.X.Offset, 0, MainGui.AbsoluteSize.Y)
	v4:UpdateTweenEndPoints()
end
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 38 ]]
	p2.PlayerName.Text = p3.Name
end
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 44 | Upvalues: v2 (copy), v3 (copy), Dialog (copy), v1 (copy), v5 (copy), Template (copy) ]]
	if p1 ~= v2 or not p4 then
		return
	end
	if v3.PlaceSettings.DisableAdvantageousFeatures then
		Dialog:ShowMessage("This feature is disabled", "Party invites are disabled in this place")
	end
	v1:SendData("InvitePlayerToParty", "PlayerChannel", nil, p4)
	wait()
	v5:UpdateData(v1:SendData("GetInvitablePlayers", "PlayerChannel", 2), Template, ListDisplayFunction)
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 62 | Upvalues: v2 (copy), v1 (copy), v5 (copy), Template (copy), Empty (copy) ]]
	if p1 ~= v2 or not p2 then
		return
	end
	local v12 = v1:SendData("GetInvitablePlayers", "PlayerChannel", 2)
	v5:UpdateData(v12, Template, ListDisplayFunction)
	if #v12 > 0 then
		Empty.Visible = false
		return
	end
	Empty.Visible = true
end)