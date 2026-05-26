-- https://lua.expert/
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
script.Parent.ProximityPrompt.Triggered:Connect(function(p1) --[[ Line: 7 | Upvalues: GuiManager (copy) ]]
	if p1 ~= game.Players.LocalPlayer then
		return
	end
	GuiManager:GetWindowDataByName("PetDaycare"):SetVisible(true)
end)