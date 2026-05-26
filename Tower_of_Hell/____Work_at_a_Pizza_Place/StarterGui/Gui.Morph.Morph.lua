-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("Network")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
v2:WaitForChild("CancelButton")
local v3 = GuiManager:RegisterWindow(v2, "Left", "Right")
local ScrollingFrame = v2:WaitForChild("List"):WaitForChild("ScrollingFrame")
local Normal = ScrollingFrame:WaitForChild("Normal")
v3.FirstSelectedObject = ScrollingFrame:WaitForChild("Dog"):WaitForChild("Morph")
for i, v in ipairs(ScrollingFrame:GetChildren()) do
	if v:IsA("Frame") and v:FindFirstChild("Morph") then
		v.Morph.MouseButton1Click:Connect(function() --[[ Line: 24 | Upvalues: v1 (copy), v (copy), v3 (copy) ]]
			v1:FireServer("Morph", v.Name)
			v3:SetVisible(false)
		end)
	end
end
local v4, _ = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.userId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size180x180)
Normal.Icon.Image = v4