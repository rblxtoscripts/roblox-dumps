-- https://lua.expert/
function update() --[[ update | Line: 1 ]]
	local v1 = os.time()
	local v2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("subscription").Value
	if v2 < v1 then
		script.Parent.Text = ""
		return
	end
	if v2 - v1 > 172800 then
		local v3 = os.date("*t", v2)
		script.Parent.Text = "Status:   Member until " .. v3.day .. "." .. v3.month .. "." .. v3.year
		return
	end
	local v4 = v2 - v1
	local v5 = v4 / 3600
	if v5 > 2 then
		script.Parent.Text = "Status:   " .. math.floor(v5) .. " Hours remaining"
		return
	end
	local v6 = v4 / 60
	if v6 > 2 then
		script.Parent.Text = "Status:   " .. math.floor(v6) .. " Minutes remaining"
	else
		script.Parent.Text = "Status:   " .. math.floor(v4) .. " Seconds remaining"
	end
end
while true do
	update()
	wait(1)
end