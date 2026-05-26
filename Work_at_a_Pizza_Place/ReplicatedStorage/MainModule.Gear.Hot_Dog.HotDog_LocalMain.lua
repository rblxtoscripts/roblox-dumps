-- https://lua.expert/
local v1 = script.Parent
local v2 = nil
function onButton1Down(p1) --[[ onButton1Down | Line: 4 ]]
	script.Parent.Opponent.Value = nil
	if p1 == nil or (p1.Target == nil or p1.Target.Parent == nil) then
		return
	end
	local Humanoid = p1.Target.Parent:FindFirstChild("Humanoid")
	if Humanoid == nil then
		return
	end
	local v1 = game.Players:GetPlayerFromCharacter(Humanoid.Parent)
	if v1 == nil then
		return
	end
	script.Parent.Opponent.Value = v1
end
function onEquippedLocal(p1) --[[ onEquippedLocal | Line: 20 | Upvalues: v2 (ref) ]]
	if p1 ~= nil then
		v2 = p1.Button1Down:connect(function() --[[ Line: 26 | Upvalues: p1 (copy) ]]
			onButton1Down(p1)
		end)
	end
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 30 | Upvalues: v2 (ref) ]]
	v2:disconnect()
end
v1.Unequipped:connect(onUnequippedLocal)
v1.Equipped:connect(onEquippedLocal)