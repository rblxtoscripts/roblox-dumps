-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local Send = game.ReplicatedStorage.Remotes.Main.Send
local Sending = require(game.ReplicatedStorage.Configs.Sending)
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local Images = require(game.ReplicatedStorage.Configs.Images)
local EnemySubstitute = require(game.ReplicatedStorage.Configs.EnemySubstitute)
local v1 = script.Parent
local SendQueue = script.Parent.Parent.Parent.SendQueue
local SendButton = script.Parent.Parent.Parent.Parent:WaitForChild("Placement"):WaitForChild("SendButton")
local v2 = nil
function init() --[[ init | Line: 16 | Upvalues: v2 (ref), Sending (copy), EnemySubstitute (copy), v1 (copy), Images (copy), Formatter (copy), Tween (copy), Send (copy) ]]
	repeat
		task.wait(0.5)
	until game.ReplicatedStorage.Values.Wave.Value ~= 0
	updateVisible()
	if not game.ReplicatedStorage.Values.PVP.Value then
		return
	end
	v2 = game.ReplicatedStorage.Remotes.Main.GetNight:InvokeServer()
	for k, v in pairs(Sending) do
		local v12 = if EnemySubstitute.Enemies["1001_" .. v2][v.Enemy] then EnemySubstitute.Enemies["1001_" .. v2][v.Enemy] else v.Enemy
		local v22 = v1.Example:Clone()
		v22.Name = k
		v22.Image = if Images.Enemies[v12] then Images.Enemies[v12] else ""
		v22.EnemyName.Text = v12
		v22.Cost.Text = "$" .. Formatter.FormatCompact(v.Cost)
		v22.Amount.Text = if v.Amount then "x" .. v.Amount else "x1"
		v22.Visible = true
		v22.Parent = v1
		Tween:AddButton(v22, nil, "ButtonClick", nil, true)
		v22.MouseButton1Click:Connect(function() --[[ Line: 38 | Upvalues: Send (ref), k (copy) ]]
			Send:FireServer(k)
		end)
	end
	updateWaves()
end
function updateVisible() --[[ updateVisible | Line: 46 | Upvalues: SendButton (copy) ]]
	if game.ReplicatedStorage.Values.PVP.Value then
		SendButton.Visible = true
	else
		SendButton.Visible = false
	end
end
SendButton.MouseButton1Click:Connect(function() --[[ Line: 54 | Upvalues: v1 (copy) ]]
	v1.Parent.Visible = not v1.Parent.Visible
end)
function updateWaves() --[[ updateWaves | Line: 58 | Upvalues: v1 (copy), Sending (copy) ]]
	for k, v in pairs(v1:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			local v3 = Sending[tonumber(v.Name)]
			if v3.Wave and v3.Wave > game.ReplicatedStorage.Values.Wave.Value then
				v.Wave.Message.Text = "Wave " .. v3.Wave
				v.Wave.Visible = true
				continue
			end
			v.Wave.Visible = false
		end
	end
end
Send.OnClientEvent:Connect(function(p1, p2) --[[ Line: 73 | Upvalues: SendQueue (copy), Sending (copy), EnemySubstitute (copy), v2 (ref), Images (copy), Formatter (copy) ]]
	for k, v in pairs(SendQueue:GetChildren()) do
		if v:IsA("ImageButton") and (v.Name ~= "Example" and not p1[v.Name]) then
			v:Destroy()
		end
	end
	for k, v in pairs(p1) do
		if not SendQueue:FindFirstChild(k) then
			local v1 = Sending[v.Send]
			local v22 = if EnemySubstitute.Enemies["1001_" .. v2][v1.Enemy] then EnemySubstitute.Enemies["1001_" .. v2][v1.Enemy] else v1.Enemy
			local v3 = SendQueue.Example:Clone()
			v3.Name = k
			v3.Image = if Images.Enemies[v22] then Images.Enemies[v22] else ""
			v3.EnemyName.Text = v22
			v3.Cost.Text = "$" .. Formatter.FormatCompact(v1.Cost)
			v3.Amount.Text = if v1.Amount then "x" .. v1.Amount else "x1"
			v3.Visible = true
			v3.Parent = SendQueue
		end
	end
end)
init()
game.ReplicatedStorage.Values.PVP.Changed:Connect(updateVisible)
game.ReplicatedStorage.Values.Wave.Changed:Connect(updateWaves)
Tween:AddButton(SendButton, nil, "ButtonClick")