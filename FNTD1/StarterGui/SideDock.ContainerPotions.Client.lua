-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local Boosts = game.ReplicatedStorage.Remotes.Misc.Boosts
require(game.ReplicatedStorage.Libs.Tween)
local Items = require(game.ReplicatedStorage.Configs.Items)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local v1 = script.Parent
function Format(p1) --[[ Format | Line: 10 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 14 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
local v2 = nil
function update() --[[ update | Line: 23 | Upvalues: ClientState (copy), v1 (copy), v2 (ref), Items (copy) ]]
	local v12 = ClientState.GetData()
	for k, v in pairs(v1:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	v2 = tick()
	local v22 = v2
	for k, v in pairs(v12.Boosts) do
		local v3 = v1.Example:Clone()
		v3.Name = k
		v3.Time.Text = convertToHMS(v)
		v3.StartTime.Value = v
		v3.Image = if Items[k] then Items[k].Image else ""
		v3.Visible = true
		v3.Parent = v1
	end
	repeat
		task.wait(1)
		for k, v in pairs(v1:GetChildren()) do
			if v:IsA("ImageButton") and v.Name ~= "Example" then
				local v5 = v.StartTime.Value - (tick() - v22)
				if v5 <= 0 then
					v:Destroy()
					continue
				end
				v.Time.Text = convertToHMS(v5)
			end
		end
	until v22 ~= v2
end
task.spawn(update)
Boosts.OnClientEvent:Connect(update)