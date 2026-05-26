-- https://lua.expert/
local stringListContains = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local activeskills = game.ReplicatedStorage.data:FindFirstChild(game.Players.LocalPlayer.UserId).activeskills
function update() --[[ update | Line: 5 | Upvalues: activeskills (copy), stringListContains (copy) ]]
	local v1 = activeskills.Value
	local v2 = 1.3
	for k, v in pairs({ 1.75, 2.4, 3 }) do
		if stringListContains(v1, script.Parent.Name .. "/speed" .. k) then
			v2 = math.max(v2, v)
		end
	end
	script.Parent:WaitForChild("Speed"):WaitForChild("speedMult").Value = v2
end
activeskills.Changed:Connect(update)
script.Parent.Equipped:Connect(update)