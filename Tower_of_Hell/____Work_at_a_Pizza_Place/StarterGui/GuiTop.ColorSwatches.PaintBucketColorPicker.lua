-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v2 = script.Parent
local DropDownButton = v2:WaitForChild("DropDownButton")
if _G.GamepadEnabled then
	v2.Position = UDim2.new(0, v2.AbsoluteSize.X, 1, -60)
end
local v3 = GuiManager:RegisterWindow(v2, "Right", "Right")
v3.UseCursor = true
local v4 = GuiManager:RegisterDropdownMenu(v2, DropDownButton, "None")
v3.DropdownMenuData = v4
v4:SetList({
	"None",
	"Brick",
	"Cobblestone",
	"Concrete",
	"CorrodedMetal",
	"DiamondPlate",
	"Fabric",
	"Granite",
	"Grass",
	"Ice",
	"Marble",
	"Metal",
	"Pebble",
	"Plastic",
	"Sand",
	"Slate",
	"SmoothPlastic",
	"Wood",
	"WoodPlanks"
}, "None")
if v1:SendData("HasVIP", "PlayerChannel", 3) then
	DropDownButton.Visible = true
end
workspace.Main.PlayerHasVIP.OnClientEvent:connect(function(p1) --[[ Line: 61 | Upvalues: LocalPlayer (copy), DropDownButton (copy) ]]
	if p1 ~= LocalPlayer then
		return
	end
	DropDownButton.Visible = true
end)