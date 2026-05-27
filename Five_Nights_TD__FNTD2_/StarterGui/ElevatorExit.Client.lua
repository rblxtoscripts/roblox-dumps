-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local LocalPlayer = Players.LocalPlayer
local Exit = ReplicatedStorage.Remotes.Main.Exit
local Tween = require(ReplicatedStorage.Libs.Tween)
local ElevatorExitButton = script.Parent.ElevatorExitButton
local ElevatorStartButton = script.Parent.ElevatorStartButton
local Teleporting = script.Parent.Teleporting
local v1 = nil
local v2 = false
Exit.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 19 | Upvalues: v1 (ref), Teleporting (copy), TweenService (copy), ElevatorStartButton (copy), ElevatorExitButton (copy), UserInputService (copy), v2 (ref), GuiService (copy) ]]
	v1 = p1
	if p2 == "Teleporting" then
		Teleporting.BackgroundTransparency = 1
		Teleporting.Message.TextTransparency = 1
		Teleporting.Visible = true
		TweenService:Create(Teleporting, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			BackgroundTransparency = 0
		}):Play()
		TweenService:Create(Teleporting.Message, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 0
		}):Play()
		return
	end
	if p3 then
		ElevatorStartButton.Amount.Text = p3
	end
	if p2 then
		ElevatorExitButton.Visible = false
		ElevatorStartButton.Visible = false
		return
	end
	ElevatorExitButton.Visible = true
	ElevatorStartButton.Visible = true
	if not UserInputService.GamepadEnabled then
		return
	end
	v2 = true
	GuiService.SelectedObject = ElevatorExitButton
end)
GuiService.Changed:Connect(function(p1) --[[ Line: 49 | Upvalues: GuiService (copy), v2 (ref), ElevatorExitButton (copy), ElevatorStartButton (copy) ]]
	local SelectedObject = GuiService.SelectedObject
	if p1 ~= "SelectedObject" or (not v2 or (SelectedObject == ElevatorExitButton or SelectedObject == ElevatorStartButton)) then
		return
	end
	GuiService.SelectedObject = ElevatorExitButton
end)
ElevatorExitButton.MouseButton1Click:Connect(function() --[[ Line: 60 | Upvalues: Exit (copy), v1 (ref) ]]
	Exit:FireServer(v1)
end)
ElevatorStartButton.MouseButton1Click:Connect(function() --[[ Line: 63 | Upvalues: Exit (copy), v1 (ref) ]]
	Exit:FireServer(v1, true)
end)
Tween:AddButton(ElevatorExitButton)
Tween:AddButton(ElevatorStartButton)