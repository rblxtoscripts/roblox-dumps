-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local TeleBoatGui = script.Parent:WaitForChild("TeleBoatGui")
local MaxNumPlayers = TeleBoatGui:WaitForChild("MaxNumPlayers")
local Waiting = TeleBoatGui:WaitForChild("Waiting")
local Countdown = TeleBoatGui:WaitForChild("Countdown")
local v2 = false
local v3 = true
if workspace:WaitForChild("Halloween", 60) and workspace.Halloween:FindFirstChild("TeleporterBoat") then
	workspace.Halloween.TeleporterBoat.UpdateGui.OnClientEvent:connect(function(p1, p2) --[[ Line: 15 | Upvalues: TeleBoatGui (copy), Countdown (copy), Waiting (copy), MaxNumPlayers (copy), v1 (copy), v2 (ref), v3 (ref) ]]
		TeleBoatGui.Visible = p1
		Countdown.Visible = p2 ~= nil
		Waiting.Visible = if p2 == nil then true else false
		MaxNumPlayers.Visible = if p2 == nil then true else false
		if p1 then
			if p2 then
				Countdown.Text = v1.FormatNumber("Int", p2, Countdown)
				v2 = false
				return
			end
			if v2 then
				return
			end
			if not v3 then
				wait(1.1)
			end
			v2 = true
			local count = 0
			while v2 do
				wait(1)
				count = count + 1
				local _, v7 = math.modf(count / 3)
				Waiting.Text = "Waiting for more players" .. string.rep(".", v7 * 3)
			end
			v3 = true
			return
		end
		v2 = false
	end)
end