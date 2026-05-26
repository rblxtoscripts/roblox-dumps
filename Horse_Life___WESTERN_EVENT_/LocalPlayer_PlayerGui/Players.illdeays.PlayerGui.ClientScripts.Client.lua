-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("Constants")
local LocalPlayer = Players.LocalPlayer
print(LocalPlayer.Name, "-", "Client Initiating")
Sonar("ClientInit")
print(LocalPlayer.Name, "-", "Client Initiated")
LocalPlayer:SetAttribute("ClientInitiated", true)