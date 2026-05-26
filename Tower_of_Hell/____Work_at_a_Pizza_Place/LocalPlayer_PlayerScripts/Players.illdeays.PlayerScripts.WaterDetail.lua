-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
if v1.IsPartyServer then
	return false
end
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local OceanWater = workspace.OceanWater
local UIEvents = PlayerGui:WaitForChild("UIEvents")
if not LocalPlayer:GetAttribute("AttributesCreated") then
	LocalPlayer:GetAttributeChangedSignal("AttributesCreated"):Wait()
end
local v2 = LocalPlayer:GetAttribute("WaterEnabled")
function SetDetailedWater(p1) --[[ SetDetailedWater | Line: 24 | Upvalues: v1 (copy), OceanWater (copy), PlayerGui (copy) ]]
	if v1.PlaceSettings.DisableAdvantageousFeatures then
		return
	end
	if p1 then
		workspace.Terrain:SetCells(Region3int16.new(Vector3int16.new(-500, -7, -500), Vector3int16.new(500, -2, 500)), Enum.CellMaterial.Water, 0, 0)
		workspace.Terrain:SetCells(Region3int16.new(Vector3int16.new(-9, -8, -282), Vector3int16.new(26, -2, 58)), Enum.CellMaterial.Empty, 0, 0)
		workspace.Terrain:SetCells(Region3int16.new(Vector3int16.new(-75, -8, -244), Vector3int16.new(75, -2, -79)), Enum.CellMaterial.Empty, 0, 0)
		OceanWater.Parent = game.ReplicatedStorage
		local v12 = script.SeaFloorScript:clone()
		v12.Disabled = false
		v12.Parent = PlayerGui
	else
		PlayerGui.SeaFloorScript:Destroy()
		workspace.SeaFloor:Destroy()
		OceanWater.Parent = workspace
		workspace.Terrain:SetCells(Region3int16.new(Vector3int16.new(-500, -7, -500), Vector3int16.new(500, -2, 500)), Enum.CellMaterial.Empty, 0, 0)
	end
end
UIEvents.ToggleButtonPressed.Event:connect(function(p1, p2, p3) --[[ Line: 63 ]]
	if p1.Name ~= "Settings" then
		return
	end
	local isName = p2.Parent.Name == "WaterEnabled"
end)
LocalPlayer:GetAttributeChangedSignal("WaterEnabled"):Connect(function() --[[ Line: 69 | Upvalues: v2 (ref), LocalPlayer (copy) ]]
	v2 = LocalPlayer:GetAttribute("WaterEnabled")
	SetDetailedWater(v2)
end)
if not v2 then
	return
end
SetDetailedWater(true)