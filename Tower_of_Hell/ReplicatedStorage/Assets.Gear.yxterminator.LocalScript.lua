-- https://lua.expert/
local v1 = game.Players.LocalPlayer:GetMouse()
local function getHit() --[[ getHit | Line: 3 | Upvalues: v1 (copy) ]]
	local t = { script.Parent.Parent }
	for k, v in pairs(workspace.tower.sections:GetDescendants()) do
		if v:IsA("BasePart") and (not v.CanCollide and v.Transparency == 1) then
			table.insert(t, v)
		end
	end
	local v12, v2 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v1.Origin.p, v1.Origin.lookVector * 1000), t)
	return v12, v2
end
script.Parent.Activated:Connect(function() --[[ Line: 14 | Upvalues: getHit (copy) ]]
	local v1, v2 = getHit()
	script.Parent.fire:InvokeServer(if v1.Parent:FindFirstChildWhichIsA("Humanoid") then v1.Parent or v2 else v2, game:GetService("UserInputService"):IsKeyDown("F"))
end)
script.Parent.Equipped:Connect(function() --[[ Line: 21 | Upvalues: v1 (copy) ]]
	v1.Icon = "rbxassetid://4770792736"
end)
function unequip() --[[ unequip | Line: 24 | Upvalues: v1 (copy) ]]
	v1.Icon = ""
end
script.Parent.Unequipped:Connect(unequip)
script.Parent.AncestryChanged:Connect(unequip)