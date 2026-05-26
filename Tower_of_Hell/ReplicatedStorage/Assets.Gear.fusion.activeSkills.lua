-- https://lua.expert/
local stringListContains = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local activeskills = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update() --[[ update | Line: 5 | Upvalues: activeskills (copy), stringListContains (copy) ]]
	local v1 = activeskills.Value
	local v2 = 0.3
	for k, v in pairs({ 0.45, 0.55 }) do
		if stringListContains(v1, script.Parent.Name .. "/grav" .. k) then
			v2 = math.max(v2, v)
		end
	end
	script.Parent:WaitForChild("Gravity"):WaitForChild("gravityDecrease").Value = v2
	local v4 = 0
	for k, v in pairs({ 6 }) do
		if stringListContains(v1, script.Parent.Name .. "/jump" .. k) then
			v4 = math.max(v4, v)
		end
	end
	script.Parent:WaitForChild("Gravity"):WaitForChild("jumpPowerIncrease").Value = v4
	local v6 = 1.2
	for k, v in pairs({ 1.5, 2, 2.5 }) do
		if stringListContains(v1, script.Parent.Name .. "/speed" .. k) then
			v6 = math.max(v6, v)
		end
	end
	script.Parent:WaitForChild("Speed"):WaitForChild("speedMult").Value = v6
end
activeskills.Changed:Connect(update)
script.Parent.Equipped:Connect(update)