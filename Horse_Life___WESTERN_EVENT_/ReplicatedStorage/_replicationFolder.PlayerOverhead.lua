-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("PlayerUtils")
local v3 = Sonar("Binder")
local v4 = Sonar("Maid")
local v5 = Sonar("Signal")
local v6 = Sonar("WorldspaceGuiUtils")
local v7 = Sonar("Club")
local TouchEnabled = UserInputService.TouchEnabled
local PlayerOverheadGui = ReplicatedStorage.Storage.Assets.PlayerOverheadGui
local LocalPlayer = Players.LocalPlayer
local t2 = {}
function t.new(p1) --[[ new | Line: 31 | Upvalues: t (copy), v4 (copy), Players (copy), v1 (copy), LocalPlayer (copy), PlayerOverheadGui (copy), TouchEnabled (copy), v5 (copy), v6 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v4.new()
	v2.Model = p1
	v2.Player = Players:FindFirstChild(p1.Name)
	v2.PlayerWrapper = v1.getWrapperWithYield(v2.Player)
	if v2.Player == LocalPlayer then
		return v2
	end
	v2.DisplayGui = PlayerOverheadGui:Clone()
	v2.DisplayGui.Name = v2.Player.Name .. "_OverheadGui"
	v2.DisplayGui.AlwaysOnTop = false
	v2.DisplayGui.Adornee = p1:WaitForChild("Head")
	local DisplayGui = v2.DisplayGui
	DisplayGui.MaxDistance = DisplayGui.MaxDistance * (if TouchEnabled then 0.5 else 1)
	if v2.IsLocal then
		v2.DisplayGui.MaxDistance = 35
	end
	v2.DisplayGui.Parent = p1
	v2.Maid:GiveTask(v2.DisplayGui)
	v2.ContainerFrame = v2.DisplayGui.ContainerFrame
	v2.DisplayChangedSignal = v5.new()
	v2.Maid:GiveTask(v2.DisplayChangedSignal)
	v2.Maid:GiveTask(v6.AddWorldspaceGui(v2.DisplayGui, {
		Check = function() --[[ Check | Line: 60 | Upvalues: v2 (copy) ]]
			return not v2.Model:GetAttribute("WildMode")
		end,
		Changed = { v2.DisplayChangedSignal }
	}))
	v2.Maid:GiveTask(v6.AddWorldspaceGui(v2.DisplayGui, {
		Check = function() --[[ Check | Line: 69 | Upvalues: v2 (copy) ]]
			return not v2.Player:GetAttribute("Dueling")
		end,
		Changed = { v2.DisplayChangedSignal, v2.Player:GetAttributeChangedSignal("Dueling") }
	}))
	for k, v in pairs(v2.ContainerFrame.ModesFrame:GetChildren()) do
		v2.Maid:GiveTask(v2.PlayerWrapper:OnActionChanged(v.Name):Connect(function() --[[ Line: 79 | Upvalues: v2 (copy), v (copy) ]]
			v2:SetActionLabel(v)
		end))
		v2:SetActionLabel(v)
	end
	v2.Chatting = false
	v2.ChattedSignal = v5.new()
	v2.Maid:GiveTask(v2.ChattedSignal)
	v2.Maid:GiveTask(v2.ChattedSignal:Connect(function() --[[ Line: 89 | Upvalues: v2 (copy) ]]
		v2:SetChatOffset()
	end))
	v2.Maid:GiveTask(v2.Model:GetAttributeChangedSignal("WildMode"):Connect(function() --[[ Line: 93 | Upvalues: v2 (copy) ]]
		v2:SetEnabled()
	end))
	v2:SetEnabled()
	v2.Maid:GiveTask(v2.PlayerWrapper:OnActionChanged("InClub"):Connect(function() --[[ Line: 98 | Upvalues: v2 (copy) ]]
		v2:SetInClub()
	end))
	v2:SetInClub()
	v2:SetName()
	t2[p1] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 110 | Upvalues: t2 (copy) ]]
	t2[p1.Model] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Get(p1, p2) --[[ Get | Line: 117 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.SetActionLabel(p1, p2) --[[ SetActionLabel | Line: 121 ]]
	p2.Visible = p1.PlayerWrapper:IsInAction(p2.Name)
end
function t.SetChatOffset(p1) --[[ SetChatOffset | Line: 125 ]]
	p1.DisplayGui.SizeOffset = p1.Chatting and Vector2.new(0, 1.4) or Vector2.new(0, 0.6)
end
function t.SetName(p1) --[[ SetName | Line: 129 | Upvalues: v2 (copy) ]]
	p1.ContainerFrame.NameLabel.Text = v2.GetPlayerName(p1.Player)
end
function t.SetInClub(p1) --[[ SetInClub | Line: 133 | Upvalues: v7 (copy) ]]
	local v1 = p1.PlayerWrapper:IsInAction("InClub")
	if not v1 then
		p1.ContainerFrame.ClubLabel.Visible = false
		return
	end
	p1.ContainerFrame.ClubLabel.Visible = true
	local v2 = v7.GetById(v1)
	if v2 then
		p1.ContainerFrame.ClubLabel.Text = v2:GetProperty("Name")
	else
		p1.ContainerFrame.ClubLabel.Text = "Unknown Club"
	end
end
function t.SetEnabled(p1) --[[ SetEnabled | Line: 148 ]]
	p1.DisplayChangedSignal:Fire()
end
function t.Init(p1) --[[ Init | Line: 152 | Upvalues: v3 (copy), t (copy) ]]
	v3.new("Character", t):Init()
end
t:Init()
return t