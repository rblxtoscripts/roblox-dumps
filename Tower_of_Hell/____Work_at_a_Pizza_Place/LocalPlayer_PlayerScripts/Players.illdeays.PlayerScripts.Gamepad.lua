-- https://lua.expert/
if require(game.ReplicatedStorage:WaitForChild("Enums")).GamepadEnabled then
	local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local MainGui = PlayerGui:WaitForChild("MainGui")
	MainGui:WaitForChild("Menu"):WaitForChild("Menu")
	local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
	game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
	local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Events")
	local GamepadMainMenu = MainGui.Menu:WaitForChild("GamepadMainMenu")
	local v2 = GuiManager:GetWindowDataByName("GamepadMainMenu")
	local MenuGamepadHelp = MainGui:WaitForChild("Notifications"):WaitForChild("MenuGamepadHelp")
	local EmoteGamepadHelp = MainGui:WaitForChild("Notifications"):WaitForChild("EmoteGamepadHelp")
	game:GetService("GuiService").GuiNavigationEnabled = false
	game:GetService("GuiService").AutoSelectGuiEnabled = false
	game:GetService("GuiService").CoreGuiNavigationEnabled = false
	function MenuButtonPressed(p1, p2, p3) --[[ MenuButtonPressed | Line: 32 | Upvalues: GamepadMainMenu (copy), GuiManager (copy), v2 (copy) ]]
		if p2 ~= Enum.UserInputState.Begin or not _G.StartedPlaying then
			return
		end
		local Visible = GamepadMainMenu.Visible
		if not Visible then
			GuiManager:CloseAllWindows()
		end
		v2:SetVisible(not Visible)
		if not _G.TutorialEnabled then
			return
		end
		workspace.TutorialService.PlayerAction:FireServer("RadialMenuOpened", true)
	end
	function DpadPressed(p1, p2, p3) --[[ DpadPressed | Line: 96 | Upvalues: GuiManager (copy) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		GuiManager:GetWindowDataByName("Emotions"):SetVisible(true)
	end
	game:GetService("ContextActionService"):BindAction("Left", DpadPressed, false, Enum.KeyCode.DPadLeft)
	game:GetService("ContextActionService"):BindAction("Right", DpadPressed, false, Enum.KeyCode.DPadRight)
	game:GetService("ContextActionService"):BindAction("Down", DpadPressed, false, Enum.KeyCode.DPadDown)
	game:GetService("ContextActionService"):BindAction("MenuButtonPressed", MenuButtonPressed, false, Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonL2)
	spawn(function() --[[ Line: 178 | Upvalues: v1 (copy), EmoteGamepadHelp (copy), MenuGamepadHelp (copy) ]]
		if not _G.StartedPlaying then
			v1:Wait("StartedPlaying")
		end
		EmoteGamepadHelp.Visible = true
		MenuGamepadHelp.Visible = true
	end)
end