-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local v1 = 0
script.Parent.Equipped:Connect(function() --[[ Line: 3 | Upvalues: LocalPlayer (copy), v1 (ref) ]]
	local Character = LocalPlayer.Character
	Character.ExtraJumper.multiJumpCount.Value = Character.ExtraJumper.multiJumpCount.Value + script.multiJumpCount.Value - v1
	v1 = script.multiJumpCount.Value
end)
function dequip() --[[ dequip | Line: 8 | Upvalues: LocalPlayer (copy), v1 (ref) ]]
	local Character = LocalPlayer.Character
	Character.ExtraJumper.multiJumpCount.Value = Character.ExtraJumper.multiJumpCount.Value - v1
	v1 = 0
end
script.Parent.Unequipped:Connect(dequip)
script.Parent.AncestryChanged:Connect(function() --[[ Line: 14 | Upvalues: LocalPlayer (copy) ]]
	if script.Parent == LocalPlayer.Character then
		return
	end
	dequip()
end)
script:WaitForChild("multiJumpCount").Changed:Connect(function() --[[ Line: 19 | Upvalues: LocalPlayer (copy), v1 (ref) ]]
	local Character = LocalPlayer.Character
	if not Character or script.Parent.Parent ~= Character then
		return
	end
	Character.ExtraJumper.multiJumpCount.Value = Character.ExtraJumper.multiJumpCount.Value + script.multiJumpCount.Value - v1
	v1 = script.multiJumpCount.Value
end)