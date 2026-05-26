-- https://lua.expert/
local v1 = script.Parent
v1.Enabled = true
local Players = game:GetService("Players")
function GetCharacterFromPart(p1) --[[ Line: 5 | Upvalues: Players (copy) ]]
	local v1, v2 = p1, nil
	while true do
		local v3 = next
		local v4, v5 = v1:GetChildren()
		for v6, v7 in v3, v4, v5 do
			if v7:IsA("Humanoid") then
				v2 = v1
				break
			end
		end
		local v8
		if v2 then
			v8 = if v2 then Players:GetPlayerFromCharacter(v2) else v2
			return v2, v8
		end
		v1 = v1.Parent
		if not v1 or v1 == game then
			v8 = if v2 then Players:GetPlayerFromCharacter(v2) else v2
			return v2, v8
		end
	end
end
v1.Equipped:Connect(function(p1) --[[ Line: 30 | Upvalues: v1 (copy) ]]
	p1.Icon = "rbxasset://textures/GunCursor.png"
	p1.Button1Down:Connect(function() --[[ Line: 33 | Upvalues: p1 (copy), v1 (ref) ]]
		local v12 = GetCharacterFromPart(p1.Target)
		if not v12 then
			return
		end
		v1.SwapWith:FireServer(v12)
		p1.Icon = "rbxasset://textures/GunWaitCursor.png"
		v1.Enabled = false
		wait(2)
		p1.Icon = "rbxasset://textures/GunCursor.png"
		v1.Enabled = true
	end)
end)