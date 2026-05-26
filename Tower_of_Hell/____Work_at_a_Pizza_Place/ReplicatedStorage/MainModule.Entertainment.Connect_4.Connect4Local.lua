-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
local CurrentCamera = workspace.CurrentCamera
local v2 = 0
local t = {}
workspace.Main:WaitForChild("Connect4Channel").OnClientEvent:connect(function(p1, ...) --[[ Line: 9 | Upvalues: CurrentCamera (copy), v2 (ref), t (copy), v1 (copy) ]]
	local t2 = { ... }
	if p1 == "SetCameraCFrame" then
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = t2[1]
		v2 = v2 + 1
		wait(15)
		if v2 == v2 then
			CurrentCamera.CameraType = Enum.CameraType.Custom
		end
	else
		if p1 == "ResetCamera" then
			CurrentCamera.CameraType = Enum.CameraType.Custom
			return
		end
		if p1 == "CreateLocalChip" then
			local v5 = t2[4]
			if v5.Parent.Name ~= "Furniture" then
				return
			end
			local v6 = t2[1]:clone()
			v6.Transparency = 0
			v6.Parent = v5
			v6.CFrame = t2[2]
			game:GetService("TweenService"):Create(v6, TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
				CFrame = t2[3]
			}):Play()
			t[v5] = t[v5] or {}
			table.insert(t[v5], v6)
			v1:PlaySound("ToyDispenserHit", v5:FindFirstChild("Center", true).Parent)
			return
		end
		if p1 ~= "Eject" then
			return
		end
		local v10 = t2[1]
		if not t[v10] then
			return
		end
		for i, v in ipairs(v10.Rows:GetChildren()) do
			v.CanCollide = false
		end
		for i, v in ipairs(t[v10]) do
			v.Anchored = false
			v.CanCollide = true
			pcall(function() --[[ Line: 64 | Upvalues: v (copy) ]]
				v:SetNetworkOwner(game.Players.LocalPlayer)
			end)
			v.Velocity = Vector3.new(0, math.random(40, 400), 0)
		end
		local _ = v10:FindFirstChild("Center", true).Parent
		v1:PlaySound("Incorrect", v10:FindFirstChild("Center", true).Parent)
		wait(3)
		for i, v in ipairs(t[v10]) do
			v:Destroy()
		end
		t[v10] = {}
	end
end)