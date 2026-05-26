-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local LocalPlayer = game.Players.LocalPlayer
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local ScrollingFrame = v2:WaitForChild("ScrollingFrame")
local List = ScrollingFrame:WaitForChild("List")
local Template = ScrollingFrame:WaitForChild("Template")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v3 = v1:SendData("GetBanList", "PlayerChannel", 10) or v1:SendData("GetBanList", "PlayerChannel", 10) or {}
local t = {}
local v4 = #v3
for i, v in ipairs(v3) do
	t[v] = true
end
local v5 = t
local v6 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", nil, nil, true)
local v7 = GuiManager:RegisterListView(v2, List)
v6:SetConsoleSize(UDim2.new(0, 350, v2.Size.Y.Scale, v2.Size.Y.Offset))
v7.GamepadSelectFirstItemOnRefresh = true
if v2.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
	v2.Size = UDim2.new(0, v2.Size.X.Offset, 0, MainGui.AbsoluteSize.Y)
	v6:UpdateTweenEndPoints()
end
local function RefreshList() --[[ RefreshList | Line: 48 | Upvalues: LocalPlayer (copy), t (copy), v7 (copy), Template (copy) ]]
	local t2 = {}
	for i, v in ipairs(game.Players:GetPlayers()) do
		if v ~= LocalPlayer then
			table.insert(t2, v.Name)
		end
	end
	for k, v in pairs(t) do
		if game.Players:FindFirstChild(k) == nil then
			table.insert(t2, k)
		end
	end
	v7:UpdateData(t2, Template, ListDisplayFunction)
end
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 68 | Upvalues: v5 (ref), v1 (copy) ]]
	p2.Ban.TextLabel.Text = if v5[p3] then "Unban" else "Ban"
	p2.Ban.Style = v5[p3] and Enum.ButtonStyle.RobloxRoundDefaultButton or Enum.ButtonStyle.RobloxRoundButton
	p2.PlayerName.Text = v1:GetDisplayName(p3)
end
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 76 | Upvalues: v2 (copy), v1 (copy), v5 (ref), v4 (ref), Dialog (copy), RefreshList (copy) ]]
	if p1 ~= v2 or not p4 then
		return
	end
	if p3.Ban.Style == Enum.ButtonStyle.RobloxRoundDefaultButton then
		v1:SendData("UnbanPlayerFromHouse", "HouseChannel", nil, p4)
		v5[p4] = nil
		v4 = v4 - 1
	elseif v4 < 20 then
		v1:SendData("BanPlayerFromHouse", "HouseChannel", nil, p4)
		v5[p4] = true
		v4 = v4 + 1
	elseif v4 >= 20 then
		Dialog:ShowMessage("Ban List Full", "Unban some players")
	end
	RefreshList()
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 104 | Upvalues: v2 (copy), RefreshList (copy) ]]
	if p1 ~= v2 or not p2 then
		return
	end
	RefreshList()
end)