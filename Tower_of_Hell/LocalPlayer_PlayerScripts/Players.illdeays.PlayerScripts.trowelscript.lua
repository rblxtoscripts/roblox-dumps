-- https://lua.expert/
game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v1 = script:GetAttribute("charges")
_G.trowelGearCurrentCharges = v1
_G.trowelGearMaxCharges = v1
local v2 = 0
game:GetService("RunService").RenderStepped:Connect(function(p1) --[[ Line: 9 | Upvalues: v1 (copy), v2 (ref) ]]
	local v22 = math.min(p1, script:GetAttribute("recharge_time") * _G.trowelGearMaxCharges)
	if not (_G.trowelGearCurrentCharges < v1) then
		return
	end
	v2 = v2 + v22
	if not (v2 > script:GetAttribute("recharge_time")) then
		return
	end
	v2 = v2 - script:GetAttribute("recharge_time")
	_G.trowelGearCurrentCharges = _G.trowelGearCurrentCharges + 1
end)
_G.trowelGearMaxCharges = v1