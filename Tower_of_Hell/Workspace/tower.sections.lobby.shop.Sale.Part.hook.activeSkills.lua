-- https://lua.expert/
local stringListContains = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local activeskills = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update() --[[ update | Line: 5 | Upvalues: activeskills (copy), stringListContains (copy) ]]
	local v1 = activeskills.Value
	local v2 = 50
	for k, v in pairs({ 90, 120 }) do
		if stringListContains(v1, script.Parent.Name .. "/range" .. k) then
			v2 = math.max(v2, v)
		end
	end
	script.Parent:WaitForChild("Range").Value = v2
	local v4 = 350
	for k, v in pairs({ 650, 950 }) do
		if stringListContains(v1, script.Parent.Name .. "/swing" .. k) then
			v4 = math.max(v4, v)
		end
	end
	script.Parent:WaitForChild("SwingForce").Value = v4
end
activeskills.Changed:Connect(update)
script.Parent.Equipped:Connect(update)