-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local MainFrame = script.Parent.MainFrame
function Format(p1) --[[ Format | Line: 8 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 12 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
local v1 = nil
function countdown(p1) --[[ countdown | Line: 21 | Upvalues: ClientState (copy), v1 (ref), MainFrame (copy) ]]
	if not p1 then
		local v12 = ClientState.GetData()
		p1 = if v12.GroupRewards then 86400 - (os.time() - v12.GroupReward) else 0
	end
	local v2 = tick()
	v1 = v2
	if p1 > 0 then
		MainFrame.Resets.Visible = true
	end
	repeat
		if v2 == v2 then
			MainFrame.Resets.Text = "RESETS IN: " .. convertToHMS(p1)
			p1 = p1 - 1
		end
		task.wait(1)
	until v2 ~= v2 or p1 <= 0
	MainFrame.Resets.Visible = false
end
function update() --[[ update | Line: 50 | Upvalues: ClientState (copy), MainFrame (copy) ]]
	local v1 = ClientState.GetData()
	if not (v1.GroupReward and os.time() - v1.GroupReward < 86400) then
		MainFrame.Claim.UIGradient.Enabled = true
		MainFrame.Claim.NoReq.Enabled = false
		MainFrame.Claim.Info.UIGradient.Enabled = true
		MainFrame.Claim.Info.NoReq.Enabled = false
		MainFrame.Resets.Visible = false
	else
		MainFrame.Claim.UIGradient.Enabled = false
		MainFrame.Claim.NoReq.Enabled = true
		MainFrame.Claim.Info.UIGradient.Enabled = false
		MainFrame.Claim.Info.NoReq.Enabled = true
		task.spawn(countdown, 86400 - (os.time() - v1.GroupReward))
	end
end
game.ReplicatedStorage.Remotes.Misc.GroupRewards.OnClientEvent:Connect(function(p1) --[[ Line: 72 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if p1 == "Update" then
		update()
		return
	end
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
MainFrame.Claim.MouseButton1Click:Connect(function() --[[ Line: 79 ]]
	game.ReplicatedStorage.Remotes.Misc.GroupRewards:FireServer()
end)
update()
Tween:AddButton(MainFrame.Claim)
Tween:AddButton(MainFrame.Exit, MainFrame)