-- https://lua.expert/
local v1 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local Countdown = v1:WaitForChild("Countdown")
local Title = v1:WaitForChild("Title")
local Icon = v1:WaitForChild("Icon")
local StartCountdown = game.ReplicatedStorage:WaitForChild("StartCountdown", 5)
local StopCountdown = game.ReplicatedStorage:WaitForChild("StopCountdown", 5)
local v2 = nil
v1.Visible = false
StartCountdown.OnClientEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 14 | Upvalues: Icon (copy), Title (copy), v2 (ref), v1 (copy), Countdown (copy) ]]
	local v12 = 0
	Icon.Image = p3 ~= nil and "rbxassetid://" .. p3 or "http://www.roblox.com/asset/?id=6201843942"
	Title.Text = p4 or "Countdown"
	print("timeOffset" .. p1 - os.time())
	if v2 then
		v2:Disconnect()
	end
	v1.Visible = true
	v2 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 28 | Upvalues: v12 (ref), p2 (copy), Countdown (ref), v2 (ref), v1 (ref) ]]
		if v12 == os.time() then
			return
		end
		v12 = os.time()
		local v13 = DateTime.fromUnixTimestamp(p2 - os.time() + 0)
		Countdown.Text = string.format("%02d", tonumber(v13:FormatUniversalTime("DDD", "en-us")) - 1) .. ":" .. v13:FormatUniversalTime("HH", "en-us") .. ":" .. v13:FormatUniversalTime("mm", "en-us") .. ":" .. v13:FormatUniversalTime("ss", "en-us")
		if not (p2 <= os.time() + 0 and v2) then
			return
		end
		v2:Disconnect()
		v1.Visible = false
	end)
end)
StopCountdown.OnClientEvent:Connect(function() --[[ Line: 43 | Upvalues: v2 (ref), v1 (copy) ]]
	if v2 then
		v2:Disconnect()
	end
	v1.Visible = false
end)