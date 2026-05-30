-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local SendMoney = game.ReplicatedStorage.Remotes.Main.SendMoney
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local v1 = script.Parent
local SendCash = script.Parent.Parent.SendCash
function updateInvite() --[[ updateInvite | Line: 9 | Upvalues: LocalPlayer (copy), v1 (copy), Tween (copy), SendMoney (copy) ]]
	for i, v in ipairs(game.Players:GetPlayers()) do
		if v.Name ~= LocalPlayer.Name and not v1.InviteFrame.ScrollingFrame:FindFirstChild(v.Name) then
			local v12 = v1.InviteFrame.ScrollingFrame.Example:Clone()
			v12.Name = v.Name
			v12.PlayerName.Text = v.Name
			v12.Visible = true
			v12.Parent = v1.InviteFrame.ScrollingFrame
			Tween:AddButton(v12.Send)
			v12.Send.MouseButton1Click:Connect(function() --[[ Line: 20 | Upvalues: SendMoney (ref), v (copy), v1 (ref) ]]
				SendMoney:FireServer(v.Name, v1.Input2.TextBox.Text)
			end)
		end
	end
	for k, v in pairs(v1.InviteFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and (v.Name ~= "Example" and not game.Players:FindFirstChild(v.Name)) then
			v:Destroy()
		end
	end
end
function updatePlrAmount() --[[ updatePlrAmount | Line: 31 | Upvalues: SendCash (copy) ]]
	local PVP = game.ReplicatedStorage.Values.PVP.Value
	if game.ReplicatedStorage.Values.PlayerAmount.Value > 1 then
		SendCash.Visible = true
	else
		SendCash.Visible = false
	end
end
v1.Enter.MouseButton1Click:Connect(function() --[[ Line: 44 | Upvalues: v1 (copy) ]]
	v1.InviteFrame.Visible = true
end)
v1.InviteFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 48 | Upvalues: v1 (copy) ]]
	v1.InviteFrame.Visible = false
end)
updatePlrAmount()
updateInvite()
Tween:AddButton(SendCash, v1)
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Enter)
Tween:AddButton(v1.InviteFrame.Exit)
game.ReplicatedStorage.Values.PlayerAmount.Changed:Connect(updatePlrAmount)
game.ReplicatedStorage.Values.PVP.Changed:Connect(updatePlrAmount)
game.Players.PlayerAdded:Connect(updateInvite)
game.Players.PlayerRemoving:Connect(updateInvite)