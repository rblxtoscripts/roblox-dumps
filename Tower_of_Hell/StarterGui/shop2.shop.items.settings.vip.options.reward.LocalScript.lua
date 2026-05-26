-- https://lua.expert/
local t = {
	0,
	0,
	0,
	0.3,
	0.7,
	1,
	1.2,
	1.5,
	1.8,
	2.1,
	2.3,
	2.5,
	2.55,
	2.6,
	2.7,
	2.8,
	2.9,
	3
}
function update(p1) --[[ update | Line: 19 | Upvalues: t (copy) ]]
	local TextLabel = script.Parent.TextLabel
	TextLabel.Text = "Reward: " .. math.floor(t[math.min(p1, 18)] * game.ReplicatedStorage.Configuration.defaultCoins.Value) .. " Coins"
end
script.Parent.update.Event:Connect(update)
update(game.ReplicatedStorage.Configuration.parts.Value)