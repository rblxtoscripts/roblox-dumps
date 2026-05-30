-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local MainFrame = script.Parent.MainFrame
game.ReplicatedStorage.Remotes.Misc.OpenSuperComputer.OnClientEvent:Connect(function() --[[ Line: 7 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
MainFrame.Choose.Index.MouseButton1Click:Connect(function() --[[ Line: 13 | Upvalues: Tween (copy), MainFrame (copy) ]]
	Tween:AddButton("Close", MainFrame)
	script.Parent.Parent.Index.Index.Visible = true
end)
Tween:AddButton(MainFrame.Choose.Enchant, script.Parent.Parent:WaitForChild("Enchants"):WaitForChild("MainFrame"))
Tween:AddButton(MainFrame.Choose.StatRerolls, script.Parent.Parent:WaitForChild("StatRerolls"):WaitForChild("MainFrame"))
Tween:AddButton(MainFrame.Choose.Index)
Tween:AddButton(MainFrame.Exit, MainFrame)