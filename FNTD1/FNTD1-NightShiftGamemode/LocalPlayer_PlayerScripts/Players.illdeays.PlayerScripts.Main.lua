-- https://lua.expert/
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local ClientState = require(ReplicatedStorage.PlayerData.ClientState)
require(ReplicatedStorage.Modules.Particles)
local Lighting = require(ReplicatedStorage.Configs.Lighting)
local function getMapModel() --[[ getMapModel | Line: 12 | Upvalues: ReplicatedStorage (copy), LocalPlayer (copy) ]]
	if not ReplicatedStorage.Values.PVP.Value then
		return workspace.Map
	end
	repeat
		task.wait()
	until LocalPlayer:GetAttribute("PVPNumber")
	return workspace.Map[LocalPlayer:GetAttribute("PVPNumber")]
end
ReplicatedStorage.Remotes.Misc.CamChange.OnClientEvent:Connect(function() --[[ Line: 21 | Upvalues: ReplicatedStorage (copy), CurrentCamera (copy) ]]
	if ReplicatedStorage.Values.RaidBoss.Value then
		task.wait(0.1)
		local unit = Vector3.new(math.random(), math.random(), math.random()).unit
		local v3 = math.random() * 360
		CurrentCamera.CFrame = CurrentCamera.CFrame * CFrame.Angles(math.rad(v3), math.rad(v3), (math.rad(v3)))
	end
end)
ReplicatedStorage.Remotes.Misc.TowerStar.OnClientEvent:Connect(function(p1) --[[ Line: 32 | Upvalues: getMapModel (copy), ReplicatedStorage (copy), RunService (copy) ]]
	if not workspace:FindFirstChild("Map") then
		return
	end
	if not (p1 and p1.PrimaryPart) then
		return
	end
	if p1:FindFirstChild("UpgradeStar") then
		if p1.UpgradeStar.Value then
			p1.UpgradeStar.Value:Destroy()
		end
		p1.UpgradeStar:Destroy()
	end
	local v1, v2 = p1:GetBoundingBox()
	local v3 = RaycastParams.new()
	v3.FilterType = Enum.RaycastFilterType.Include
	v3.FilterDescendantsInstances = { (getMapModel()) }
	local v4 = workspace:Raycast(p1.PrimaryPart.Position, Vector3.new(0, -100, 0), v3)
	local v5 = if v4 and v4.Instance then CFrame.new(v4.Position + Vector3.new(0, 0, 0)) else v1 - Vector3.new(0, v2.Y / 2, 0) + Vector3.new(0, 0, 0)
	local v9 = (ReplicatedStorage.Objects.Upgrades:FindFirstChild("Star" .. p1:GetAttribute("Upgrade")) or ReplicatedStorage.Objects.Upgrades.Star3):Clone()
	v9:PivotTo(v5)
	v9.Parent = workspace.Visuals
	v9.Part.Attachment.ParticleEmitter.Enabled = false
	local UpgradeStar = Instance.new("ObjectValue", p1)
	UpgradeStar.Name = "UpgradeStar"
	UpgradeStar.Value = v9
	local v10 = 0
	local v11 = 0
	local v12 = nil
	v12 = RunService.Stepped:Connect(function(p12, p2) --[[ Line: 72 | Upvalues: v11 (ref), p1 (copy), v9 (copy), v12 (ref), v10 (ref) ]]
		v11 = v11 + p2
		if p1 and (p1.Parent and (v9 and v9.Parent)) then
			if v10 >= 360 then
				v10 = 0
			end
			v10 = v10 + 1
			v9.Part.Attachment.CFrame = CFrame.Angles(0, math.rad(v10), 0)
			if not (v11 >= 0.3) then
				return
			end
			v11 = 0
			v9.Part.Attachment.ParticleEmitter:Emit(1)
		else
			if v9 then
				v9:Destroy()
			end
			v12:Disconnect()
		end
	end)
end)
ReplicatedStorage.Remotes.Misc.Lighting.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 93 | Upvalues: Lighting (copy) ]]
	if not p1 then
		return
	end
	if p1 == "199" then
		Lighting.Change("Summer")
		return
	end
	if p1 == "299" then
		Lighting.Change("Military")
		return
	end
	if p1 == "3" then
		Lighting.Change("Game3")
		return
	end
	if p1 == "4" then
		Lighting.Change("Game4")
		return
	end
	if p1 == "6" then
		Lighting.Change("Normal")
		return
	end
	if p1 == "7" then
		Lighting.Change("Game7")
		return
	end
	if p1 == "8" then
		Lighting.Change("Ruin")
		return
	end
	if p1 == "9" then
		if p2 == "1" or p2 == "2" then
			Lighting.Change("Normal")
			return
		end
		if p2 == "3" or (p2 == "4" or (p2 == "5" or p2 == "6")) then
			Lighting.Change("Dojo")
		end
	else
		if p1 == "10" then
			Lighting.Change("Ruin")
			return
		end
		if p1 == "399" then
			Lighting.Change("Halloween1")
			return
		end
		if p1 == "400" then
			Lighting.Change("Halloween2")
			return
		end
		if p1 == "700" then
			Lighting.Change("Steampunk")
			return
		end
		if p1 == "701" then
			Lighting.Change("Steampunk2")
			return
		end
		if p1 == "99" then
			if p2 == "10" then
				Lighting.Change("Halloween1")
				return
			end
			if p2 == "20" then
				Lighting.Change("ChristmasEndless")
				return
			end
			if p2 == "21" then
				Lighting.Change("GreekEndless")
				return
			end
			if p2 == "22" then
				Lighting.Change("Space1")
				return
			end
			if p2 == "23" then
				Lighting.Change("PrehistoricEndless")
				return
			end
			if p2 == "24" then
				Lighting.Change("Summer")
				return
			end
			if p2 == "7" then
				Lighting.Change("Endless7")
				return
			end
			if p2 == "8" then
				Lighting.Change("RuinEndless")
				return
			end
			if p2 == "9" then
				Lighting.Change("Chipper")
				return
			end
			if p2 == "10" then
				Lighting.Change("Ruin")
			end
		elseif p1 == "1001" then
			if p3 == "1" then
				Lighting.Change("Western")
				return
			end
			if p3 == "2" then
				Lighting.Change("Steampunk")
				return
			end
			if p3 == "3" then
				Lighting.Change("Summer")
				return
			end
			if p3 == "4" then
				Lighting.Change("Halloween1")
				return
			end
			if p3 == "5" then
				Lighting.Change("Game4")
				return
			end
			if p3 == "6" then
				Lighting.Change("Greek1")
			end
		else
			if p1 == "1100" then
				Lighting.Change("Space1")
				return
			end
			if p1 == "1101" then
				Lighting.Change("Space2")
				return
			end
			if p1 == "1200" then
				Lighting.Change("Summer")
				return
			end
			if p1 == "1201" then
				Lighting.Change("Summer")
				return
			end
			if p1 == "1300" then
				Lighting.Change("Summer")
				return
			end
			if p1 == "1301" then
				Lighting.Change("Summer")
				return
			end
			if p1 == "900" then
				Lighting.Change("Greek1")
				return
			end
			if p1 == "901" then
				Lighting.Change("Greek2")
				return
			end
			if p1 ~= "51" then
				return
			end
			if p2 == "1" then
				Lighting.Change("Game3")
				return
			end
			if p2 == "3" then
				Lighting.Change("Game7")
				return
			end
			if p2 == "4" then
				Lighting.Change("Steampunk2")
				return
			end
			if p2 == "5" then
				Lighting.Change("GreekEndless")
				return
			end
			if p2 == "6" then
				Lighting.Change("Game6")
				return
			end
			if p2 == "8" then
				Lighting.Change("Dojo")
			end
		end
	end
end)
ReplicatedStorage.Remotes.Misc.Voiceline.OnClientEvent:Connect(function(p1, p2) --[[ Line: 196 | Upvalues: ClientState (copy) ]]
	local v1 = ClientState.GetData()
	if (p2 or not v1.Settings.BossVoicelines) and not (p2 and v1.Settings.TowerVoicelines) then
		return
	end
	p1.Volume = 0
end)
ReplicatedStorage.Remotes.Misc.Voiceline.Bindable.Event:Connect(function(p1, p2) --[[ Line: 205 | Upvalues: ClientState (copy) ]]
	local v1 = ClientState.GetData()
	if not p2 and v1.Settings.BossVoicelines then
		p1.Volume = 0
		return
	end
	if not (p2 and v1.Settings.TowerVoicelines) then
		return
	end
	p1.Volume = 0
end)
ReplicatedStorage.Remotes.Misc.ResetMap.OnClientEvent:Connect(function() --[[ Line: 215 ]]
	workspace.Visuals:ClearAllChildren()
end)
ReplicatedStorage.Remotes.Misc.Print.OnClientEvent:Connect(function(p1, p2) --[[ Line: 219 ]]
	print(p1, p2)
end)