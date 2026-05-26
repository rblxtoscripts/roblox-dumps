-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("Maid")
local v4 = Sonar("PlayerUtils")
local v5 = Sonar("WorldspaceGuiUtils")
local v6 = Sonar("Signal")
local TouchEnabled = UserInputService.TouchEnabled
local AnimalOverheadGui = ReplicatedStorage.Storage.Assets.AnimalOverheadGui
local LocalPlayer = Players.LocalPlayer
local t2 = {}
function t.new(p1) --[[ new | Line: 30 | Upvalues: t (copy), v3 (copy), Players (copy), v1 (copy), LocalPlayer (copy), AnimalOverheadGui (copy), v6 (copy), v5 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Adornee = p1.Head
	v2.Model = p1.Model
	v2.Character = v2.Model.Parent.Parent
	v2.Player = Players:FindFirstChild(v2.Character.Name)
	v2.PlayerWrapper = v1.getWrapperFromPlayer(v2.Player)
	if not v2.PlayerWrapper then
		return v2
	end
	v2.IsLocal = v2.Player == LocalPlayer
	v2.SlotValue = v2.Model:WaitForChild("SlotInfo")
	v2.DisplayGui = AnimalOverheadGui:Clone()
	v2.DisplayGui.Name = v2.Player.Name .. "_OverheadGui"
	v2.DisplayGui.AlwaysOnTop = false
	v2.DisplayGui.Adornee = v2.Adornee
	v2.DisplayGui.Parent = v2.Model
	v2.Maid:GiveTask(v2.DisplayGui)
	v2.SeatPart = v2.Model:WaitForChild("Seat")
	v2.Maid:GiveTask(v2.SeatPart:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 56 | Upvalues: v2 (copy) ]]
		v2:SetEnabled()
		v2:SetName()
	end))
	v2.ContainerFrame = v2.DisplayGui.ContainerFrame
	v2.DisplayChangedSignal = v6.new()
	v2.Maid:GiveTask(v2.DisplayChangedSignal)
	v2.Maid:GiveTask(v5.AddWorldspaceGui(v2.DisplayGui, {
		Check = function() --[[ Check | Line: 65 | Upvalues: v2 (copy) ]]
			if v2.IsLocal then
				return not v2.SeatPart.Occupant
			else
				return true
			end
		end,
		Changed = v2.DisplayChangedSignal
	}))
	v2.Maid:GiveTask(v2.PlayerWrapper:OnActionChanged("CustomiseMode"):Connect(function() --[[ Line: 75 | Upvalues: v2 (copy) ]]
		v2:SetCustomiseActionLabel()
	end))
	v2:SetCustomiseActionLabel()
	v2.Maid:GiveTask(v2.SlotValue:WaitForChild("CustomName"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 80 | Upvalues: v2 (copy) ]]
		v2:SetName()
	end))
	v2.Maid:GiveTask(v2.Character:GetAttributeChangedSignal("WildMode"):Connect(function() --[[ Line: 83 | Upvalues: v2 (copy) ]]
		v2:SetName()
	end))
	v2:SetName()
	v2:SetEnabled()
	t2[v2.Model] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 95 | Upvalues: t2 (copy) ]]
	t2[p1.Model] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.SetCustomiseActionLabel(p1) --[[ SetCustomiseActionLabel | Line: 102 ]]
	p1.ContainerFrame.ModesFrame.CustomiseMode.Visible = p1.PlayerWrapper.ActionValues.CustomiseMode.Value == p1.Model.Name
end
function t.SetEnabled(p1) --[[ SetEnabled | Line: 106 ]]
	p1.DisplayChangedSignal:Fire()
end
function t.SetName(p1) --[[ SetName | Line: 110 | Upvalues: v4 (copy), TouchEnabled (copy), v2 (copy) ]]
	if p1.Character:GetAttribute("WildMode") and p1.SeatPart.Occupant then
		p1.ContainerFrame.NameLabel.Text = v4.GetPlayerName(p1.Player)
		p1.ContainerFrame.Size = UDim2.new(1.2, 0, 1.6, 0)
		p1.ContainerFrame.NameLabel.TextTransparency = 0
		p1.ContainerFrame.NameLabel.UIStroke.Transparency = 0.5
		p1.DisplayGui.MaxDistance = 150 * (if TouchEnabled then 0.5 else 1)
	else
		p1.ContainerFrame.NameLabel.Text = v2.GetCustomName(p1.SlotValue)
		if p1.IsLocal then
			p1.ContainerFrame.Size = UDim2.new(1.2, 0, 1.6, 0)
			p1.ContainerFrame.NameLabel.TextTransparency = 0
			p1.ContainerFrame.NameLabel.UIStroke.Transparency = 0.5
		else
			p1.ContainerFrame.Size = UDim2.new(1, 0, 1.25, 0)
			p1.ContainerFrame.NameLabel.TextTransparency = 0.5
			p1.ContainerFrame.NameLabel.UIStroke.Transparency = 0.8
		end
		p1.DisplayGui.MaxDistance = 75 * (if TouchEnabled then 0.5 else 1)
	end
end
function t.Init(p1) --[[ Init | Line: 134 ]] end
t:Init()
return t