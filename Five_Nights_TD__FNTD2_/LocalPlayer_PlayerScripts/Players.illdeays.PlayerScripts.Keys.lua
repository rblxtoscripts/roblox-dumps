-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CmdrClient = require(ReplicatedStorage:WaitForChild("CmdrClient"))
if not (game:GetService("Players").LocalPlayer:GetRankInGroup(33298472) < 2) then
	CmdrClient:SetActivationKeys({ Enum.KeyCode.Backquote })
end