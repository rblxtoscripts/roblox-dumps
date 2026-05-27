-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("Signal")
local v5 = Sonar("WorldspaceGuiUtils")
local TouchEnabled = UserInputService.TouchEnabled
local PlayerLocatorOverheadGui = ReplicatedStorage.Storage.Assets.PlayerLocatorOverheadGui
local LocalPlayer = Players.LocalPlayer
local t2 = {}
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (copy), v3 (copy), Players (copy), v1 (copy), LocalPlayer (copy), PlayerLocatorOverheadGui (copy), TouchEnabled (copy), v4 (copy), v5 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Model = p1
	v2.Player = Players:FindFirstChild(p1.Name)
	v2.PlayerWrapper = v1.getWrapperFromPlayer(v2.Player)
	if v2.Player == LocalPlayer then
		return v2
	end
	v2.DisplayGui = PlayerLocatorOverheadGui:Clone()
	v2.DisplayGui.Name = v2.Player.Name .. "_LocatorGui"
	v2.DisplayGui.AlwaysOnTop = false
	v2.DisplayGui.Adornee = p1:WaitForChild("Head")
	local DisplayGui = v2.DisplayGui
	DisplayGui.MaxDistance = DisplayGui.MaxDistance * (if TouchEnabled then 0.75 else 1)
	v2.DisplayGui.Enabled = false
	v2.DisplayGui.DistanceStep = 1
	v2.DisplayGui.Parent = LocalPlayer.PlayerGui
	v2.Maid:GiveTask(v2.DisplayGui)
	v2.DisplayChangedSignal = v4.new()
	v2.Maid:GiveTask(v2.DisplayChangedSignal)
	v2.Maid:GiveTask(v5.AddWorldspaceGui(v2.DisplayGui, {
		Check = function() --[[ Check | Line: 53 | Upvalues: v2 (copy) ]]
			return v2.Enabled and v2.CanShow
		end,
		Changed = v2.DisplayChangedSignal
	}))
	v2.Maid:GiveTask(p1:GetAttributeChangedSignal("WildMode"):Connect(function() --[[ Line: 59 | Upvalues: v2 (copy), p1 (copy) ]]
		v2.CanShow = p1:GetAttribute("WildMode")
		v2:SetDisplay()
	end))
	v2.CanShow = p1:GetAttribute("WildMode")
	t2[v2.Player] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 70 | Upvalues: t2 (copy) ]]
	t2[p1.Player] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.SetEnabled(p1, p2) --[[ SetEnabled | Line: 77 ]]
	p1.Enabled = p2
	p1:SetDisplay()
end
function t.SetDisplay(p1) --[[ SetDisplay | Line: 82 ]]
	p1.DisplayChangedSignal:Fire()
end
function t.getOverheadFromPlayer(p1) --[[ getOverheadFromPlayer | Line: 86 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.Init(p1) --[[ Init | Line: 90 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("Character", t):Init()
end
t:Init()
return t