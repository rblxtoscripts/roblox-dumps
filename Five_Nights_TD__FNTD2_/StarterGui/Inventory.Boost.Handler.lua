-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local ExtraMore = game.ReplicatedStorage.Remotes.Misc.ExtraMore
local v1 = script.Parent
ExtraMore.OnClientEvent:Connect(function(p1) --[[ Line: 6 | Upvalues: v1 (copy) ]]
	if p1 then
		return
	end
	v1["x2 Luck"].Visible = false
	v1["x2 Coins"].Visible = false
end)
function check() --[[ check | Line: 13 | Upvalues: ExtraMore (copy), v1 (copy) ]]
	if ExtraMore.Check:InvokeServer() then
		return
	end
	v1["x2 Luck"].Visible = false
	v1["x2 Coins"].Visible = false
end
check()