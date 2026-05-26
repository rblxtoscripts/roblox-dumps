-- https://lua.expert/
local function freezePart(p1) --[[ freezePart | Line: 1 ]]
	if not p1:IsA("BasePart") then
		return
	end
	if not p1.Anchored then
		local frozen = Instance.new("Folder")
		frozen.Name = "frozen"
		frozen.Parent = p1
		p1.Anchored = true
		p1.Velocity = Vector3.new()
		p1.RotVelocity = Vector3.new()
		return
	end
	if not p1:FindFirstChild("CONVEYOR") then
		return
	end
	local frozen = Instance.new("Vector3Value")
	frozen.Name = "frozen"
	frozen.Value = p1.Velocity
	frozen.Parent = p1
	p1.Anchored = true
	p1.Velocity = Vector3.new()
end
local v1 = nil
script.Parent.Changed:Connect(function() --[[ Line: 23 | Upvalues: v1 (ref), freezePart (copy) ]]
	if script.Parent.Value then
		v1 = workspace.tower.DescendantAdded:Connect(freezePart)
		for k, v in pairs(workspace.tower:GetDescendants()) do
			freezePart(v)
		end
	else
		if v1 then
			v1:Disconnect()
		end
		for k, v in pairs(workspace.tower:GetDescendants()) do
			if v:FindFirstChild("frozen") then
				if v.frozen:IsA("Vector3Value") then
					v.Velocity = v.frozen.Value
				else
					v.Anchored = false
				end
				v.frozen:Destroy()
			end
		end
	end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 44 ]]
	game.Players.LocalPlayer.PlayerScripts.timefreeze.Value = false
end)