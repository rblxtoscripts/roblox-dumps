-- https://lua.expert/
Tool = script.Parent
local _ = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
Tool.Equipped:connect(function() --[[ Line: 8 | Upvalues: GuiManager (copy), MainGui (copy) ]]
	if _G.GamepadEnabled then
		local function Selected(p1, p2, p3) --[[ Selected | Line: 23 | Upvalues: GuiManager (ref), MainGui (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			if GuiManager:GetWindowDataByName("Inventory").Object.Visible == false then
				GuiManager:GetWindowDataByName("Inventory"):SetVisible(true)
				wait(0.4)
				GuiManager.Data[MainGui.Menu.Inventory.Tabs]:SetFirstTabPressed(MainGui.Menu.Inventory.Tabs.TabButtons.Gear)
				return
			end
			GuiManager.Data[MainGui.Menu.Inventory.Tabs]:SetFirstTabPressed(MainGui.Menu.Inventory.Tabs.TabButtons.Furniture)
			GuiManager:GetWindowDataByName("Inventory"):SetVisible(false)
		end
		game:GetService("ContextActionService"):BindAction("ShortcutActivated", Selected, false, Enum.KeyCode.ButtonA)
	elseif GuiManager:GetWindowDataByName("Inventory").Object.Visible == false then
		GuiManager.Data[MainGui.Menu.Inventory.Tabs]:SetFirstTabPressed(MainGui.Menu.Inventory.Tabs.TabButtons.Gear)
		GuiManager:GetWindowDataByName("Inventory"):SetVisible(true)
	end
end)
Tool.Unequipped:connect(function() --[[ Line: 45 ]]
	game:GetService("ContextActionService"):UnbindAction("ShortcutActivated")
end)