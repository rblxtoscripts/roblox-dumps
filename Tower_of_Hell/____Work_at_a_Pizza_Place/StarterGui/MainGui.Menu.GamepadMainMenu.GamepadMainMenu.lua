-- https://lua.expert/
if require(game.ReplicatedStorage:WaitForChild("Enums")).GamepadEnabled then
	local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
	Library:Load("Utility")
	Library:Load("Events")
	Library:Load("SoundFX")
	local LocalPlayer = game.Players.LocalPlayer
	local v1 = script.Parent
	local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	PlayerGui:WaitForChild("MainGui")
	local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
	local UIEvents = PlayerGui:WaitForChild("UIEvents")
	require(game.ReplicatedStorage:WaitForChild("Dialog"))
	GuiManager:RegisterWindow(v1, "Bottom", "Bottom", nil, nil, true).IsGamepadNavigateable = false
	local v2 = GuiManager:RegisterRadialMenu(v1)
	v2:SetOptions({ "PetPanel", "Inventory", "Upgrade", "Settings", "Catalog", "AvatarEditor" })
	UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 30 | Upvalues: v1 (copy), v2 (copy), GuiManager (copy) ]]
		if p1 ~= v1 then
			return
		end
		if p2 then
			local v12 = v2:GetSelection()
			if v12 then
				GuiManager:GetWindowDataByName(v12):SetVisible(true)
			end
		else
			if not v2.SelectionMode then
				return
			end
			v2:CancelSelection()
		end
	end)
end