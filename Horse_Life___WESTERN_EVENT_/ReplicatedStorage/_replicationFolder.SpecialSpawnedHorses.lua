-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerGui = Players.LocalPlayer.PlayerGui
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Binder")
function t.new(p1) --[[ new | Line: 20 | Upvalues: t (ref), PlayerGui (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Gui = p1
	v2.Gui.Parent = PlayerGui
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 30 ]]
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 37 | Upvalues: v1 (copy), t (ref) ]]
	v1.new("SpecialSpawnedHorses", t):Init()
end
t:Init()
return t