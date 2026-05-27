-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModDashboardLoader = require(ReplicatedStorage:WaitForChild("ModDashboardLoader"))
ModDashboardLoader("GuiProvider")
ModDashboardLoader("MainGui")
return {}