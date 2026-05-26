-- https://lua.expert/
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
local v3 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", nil, nil, true)
local v4 = GuiManager:RegisterListView(v2, List)
v3:SetConsoleSize(UDim2.new(0, 350, v2.Size.Y.Scale, v2.Size.Y.Offset))
v4.GamepadSelectFirstItemOnRefresh = true
if v2.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
	v2.Size = UDim2.new(0, v2.Size.X.Offset, 0, MainGui.AbsoluteSize.Y)
	v3:UpdateTweenEndPoints()
end
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 37 ]]
	p2.PlayerName.Text = p3.DisplayName
end
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 43 | Upvalues: v2 (copy), v1 (copy), v4 (copy), Template (copy) ]]
	if p1 ~= v2 or (not p4 or (not (p4:DistanceFromCharacter(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) < 100) or p4:FindFirstChild("IsMod") ~= nil)) then
		return
	end
	v4:UpdateData(v1:SendData("KickPlayerFromHouse", "HouseChannel", nil, p4), Template, ListDisplayFunction)
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 55 | Upvalues: v2 (copy), v1 (copy), v4 (copy), Template (copy), Empty (copy) ]]
	if p1 ~= v2 or not p2 then
		return
	end
	local v12 = v1:SendData("GetPlayersInHouseByOwner", "HouseChannel", 2)
	v4:UpdateData(v12, Template, ListDisplayFunction)
	if #v12 > 0 then
		Empty.Visible = false
		return
	end
	Empty.Visible = true
end)