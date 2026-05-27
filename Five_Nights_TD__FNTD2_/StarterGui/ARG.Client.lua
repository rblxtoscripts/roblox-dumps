-- https://lua.expert/
local ARG2Keypad = game.ReplicatedStorage.Remotes.Misc.ARG2Keypad
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local CodePanel = script.Parent.CodePanel
ARG2Keypad.OnClientEvent:Connect(function() --[[ Line: 7 | Upvalues: CodePanel (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not CodePanel.Visible then
		Tween:AddButton("Open", CodePanel)
	end
end)
CodePanel.Enter.MouseButton1Click:Connect(function() --[[ Line: 13 | Upvalues: ARG2Keypad (copy), CodePanel (copy) ]]
	ARG2Keypad:FireServer(CodePanel.Input.TextBox.Text)
end)
Tween:AddButton(CodePanel.Exit, CodePanel)
Tween:AddButton(CodePanel.Enter)