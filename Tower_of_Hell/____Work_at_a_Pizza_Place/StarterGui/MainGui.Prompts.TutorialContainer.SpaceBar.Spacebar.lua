-- https://lua.expert/
wait(2)
local v1 = nil
local v2 = workspace.Main.IsNewPlayer:InvokeServer()
local UserInputService = game:GetService("UserInputService")
require(game.ReplicatedStorage:WaitForChild("Enums"))
ShowedStandMessage = false
ShowedExitMessage = false
if v2 and game:GetService("UserInputService").KeyboardEnabled then
	script.Parent.Changed:connect(function(p1) --[[ Line: 10 | Upvalues: v1 (ref), UserInputService (copy) ]]
		if p1 ~= "Visible" or not game:GetService("UserInputService").KeyboardEnabled then
			return
		end
		if script.Parent.Visible then
			v1 = UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 13 ]]
				if p1.UserInputType ~= Enum.UserInputType.Keyboard or p1.KeyCode ~= Enum.KeyCode.Space then
					return
				end
				script.Parent:Destroy()
			end)
			wait(7)
			script.Parent.Visible = false
			return
		end
		if not v1 then
			return
		end
		v1:disconnect()
		v1 = nil
	end)
	script.Parent:WaitForChild("Space").Text = "Spacebar"
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5).Seated:connect(function(p1, p2) --[[ Line: 30 ]]
		if not (p1 and (p2 and p2.Parent)) then
			return
		end
		if not ShowedExitMessage and p2.Name == "Driver" then
			script.Parent.Frame.TextLabel.Text = "Exit Car"
			ShowedExitMessage = true
			wait(2)
		else
			if ShowedStandMessage or p2.Name == "Driver" then
				return
			end
			script.Parent.Frame.TextLabel.Text = "Stand Up"
			ShowedStandMessage = true
			wait(0.5)
		end
		script.Parent.Visible = true
	end)
else
	script.Parent:Destroy()
end