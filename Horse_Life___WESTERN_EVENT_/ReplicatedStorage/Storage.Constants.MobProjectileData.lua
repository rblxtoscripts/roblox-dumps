-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
ReplicatedStorage:WaitForChild("Storage"):WaitForChild("Assets"):WaitForChild("ProjectileAssets")
local t = {}
require(ReplicatedStorage:WaitForChild("Sonar"))("spr")
t.DeerProjectile = {
	SpawnAmount = 9,
	SpawnDelay = 0.035,
	Lifetime = 2,
	Speed = 75,
	Model = "DeerProjectile",
	AimAt = "Target",
	Damage = 50,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 22 ]]
		local Magnitude = p1.Model.Size.Magnitude
		local Position = p1.Model.Position
		local v1 = 6.283185307179586 * p2
		local v2 = Position.X + Magnitude * math.cos(v1)
		local v3 = Position.Z + Magnitude * math.sin(v1)
		return CFrame.new((Vector3.new(v2, Position.Y + 2.5, v3)))
	end,
	GetDirection = function(p1, p2) --[[ GetDirection | Line: 39 ]]
		return p2 + (p2 - p1.Model.Position).Unit * Vector3.new(1, 0, 1)
	end
}
t.Jump = {
	SpawnAmount = 1,
	SpawnDelay = 1.5,
	Lifetime = 3.25,
	Speed = 0,
	Model = "Jump",
	AimAt = "Jump",
	Range = 100,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	CastType = "Touch",
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 55 ]]
		return CFrame.new(p1.Model.Position - p1.Model.Size * Vector3.new(0, 0.45, 0))
	end,
	OnTick = function(p1, p2) --[[ OnTick | Line: 62 ]]
		p2.Model.Size = p2.Model.Size + Vector3.new(0.8, 0, 0.8)
	end
}
t.Spin = {
	SpawnAmount = 1,
	SpawnDelay = 1.5,
	Lifetime = 15,
	Speed = 0,
	Model = "Spin",
	AimAt = "Jump",
	Range = 100,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	CastType = "Touch",
	DoNotMove = true,
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 88 ]]
		return CFrame.new(p1.Model.Position - p1.Model.Size * Vector3.new(0, 0.45, 0))
	end,
	OnTick = function(p1, p2) --[[ OnTick | Line: 96 ]]
		p2.Model.CFrame = p2.Model.CFrame * CFrame.Angles(0, math.rad(1), 0)
	end
}
t.SpikeSpawn = {
	SpawnAmount = 1,
	SpawnDelay = 0,
	Lifetime = 3,
	Speed = 0,
	Model = "Point",
	CastType = "Touch",
	SpikeSpawnInterval = 0.8,
	SpikeLifetime = 4,
	SpikeDamage = 150,
	MaxSpikes = 8,
	SpikeCount = 3,
	SpawnRadius = 100,
	TelegraphDuration = 2,
	TelegraphRadius = 8,
	TelegraphHeightOffset = 0.1,
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 131 ]]
		return CFrame.new(p1.Model.Position - p1.Model.Size * Vector3.new(0, 0.45, 0))
	end,
	OnTick = function(p1, p2) --[[ OnTick | Line: 138 ]]
		if not p2._spikeData then
			p2._spikeData = {
				lastSpawnTime = 0,
				spawnCount = 0
			}
		end
		local _spikeData = p2._spikeData
		_spikeData.lastSpawnTime = _spikeData.lastSpawnTime + 1 / 60
		if not p2._raycastParams then
			local v1 = RaycastParams.new()
			v1.FilterType = Enum.RaycastFilterType.Include
			local v2 = workspace and workspace:FindFirstChildOfClass("Terrain") or workspace and workspace:FindFirstChild("Terrain")
			local v3 = if v2 then v2:FindFirstChild("MapContent") else v2
			local v4 = if v3 then v3:FindFirstChild("BossArena") else v3
			local v5 = if v4 then v4:FindFirstChild("Floor") else v4
			v1.FilterDescendantsInstances = v5 and { v5 } or {}
			p2._raycastParams = v1
		end
		if not (_spikeData.lastSpawnTime >= p2.Data.SpikeSpawnInterval and _spikeData.spawnCount < p2.Data.MaxSpikes) then
			return
		end
		for i = 1, math.min(p2.Data.SpikeCount, p2.Data.MaxSpikes - _spikeData.spawnCount) do
			local v8
			local v9 = math.random() * math.pi * 2
			local v10 = math.random() * p2.Data.SpawnRadius
			local Position = p2.Source.Model.Position
			local v11 = Position.X + v10 * math.cos(v9)
			local v12 = Position.Z + v10 * math.sin(v9)
			local v15 = workspace:Raycast(Vector3.new(v11, Position.Y + 250, v12), Vector3.new(0, -1000, 0), p2._raycastParams)
			local v16
			if v15 then
				v8 = v15.Position
				if not v8 then
					v16 = Position.Y - 5
					v8 = Vector3.new(v11, v16, v12)
				end
			else
				v16 = Position.Y - 5
				v8 = Vector3.new(v11, v16, v12)
			end
			local SpikeTelegraph = Instance.new("Part")
			SpikeTelegraph.Name = "SpikeTelegraph"
			SpikeTelegraph.Anchored = true
			SpikeTelegraph.CanCollide = false
			SpikeTelegraph.CanQuery = false
			SpikeTelegraph.Transparency = 0.25
			SpikeTelegraph.Material = Enum.Material.Neon
			SpikeTelegraph.Color = Color3.new(255/255, 0/255, 0/255)
			SpikeTelegraph.Shape = Enum.PartType.Cylinder
			local v17 = p2.Data.TelegraphRadius or 8
			SpikeTelegraph.Size = Vector3.new(0.2, v17 * 2, v17 * 2)
			SpikeTelegraph.CFrame = CFrame.new(v8 - Vector3.new(0, 7, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
			local v18 = workspace
			local v19 = workspace and workspace:FindFirstChildOfClass("Terrain") or workspace and workspace:FindFirstChild("Terrain")
			local v20 = if v19 then v19:FindFirstChild("MapContent") else v19
			SpikeTelegraph.Parent = (if v20 then v20:FindFirstChild("BossArena") else v20) or v18
			local v22 = p2.Data.TelegraphDuration or 2
			local v23 = tick()
			local v24 = nil
			v24 = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 206 | Upvalues: SpikeTelegraph (copy), v24 (ref), v23 (copy), v22 (copy), v8 (copy), p2 (copy) ]]
				if not (SpikeTelegraph and SpikeTelegraph.Parent) then
					v24:Disconnect()
					return
				end
				local v1 = (tick() - v23) / v22
				if v1 >= 1 then
					v24:Disconnect()
					local v2
					if not (SpikeTelegraph and SpikeTelegraph.Parent) then
						v2 = CFrame.new(v8 + Vector3.new(0, -5, 0))
						p2.Source:_createSingleProjectile("Spike", v2)
						return
					end
					SpikeTelegraph:Destroy()
					v2 = CFrame.new(v8 + Vector3.new(0, -5, 0))
					p2.Source:_createSingleProjectile("Spike", v2)
				else
					SpikeTelegraph.Transparency = 0.25 - v1 * 0.2
					local v3 = 2 + ((p2.Data.TelegraphRadius or 8) - 2) * v1
					SpikeTelegraph.Size = Vector3.new(0.2, v3 * 2, v3 * 2)
					if not (v1 >= 0.65) then
						return
					end
					local v6 = math.abs((math.sin(tick() * 4)))
					SpikeTelegraph.Color = Color3.new(255/255, 0/255, 0/255):lerp(Color3.new(1, 0.5, 0), v6)
				end
			end)
			_spikeData.spawnCount = _spikeData.spawnCount + 1
		end
		_spikeData.lastSpawnTime = 0
	end
}
t.Spike = {
	SpawnAmount = 1,
	SpawnDelay = 0,
	Lifetime = 5,
	Speed = 0,
	Model = "Spike",
	CastType = "Touch",
	DoNotMove = true,
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 257 ]]
		return p1.Model.CFrame - CFrame.new(0, 5, 0)
	end,
	OnTick = function(p1, p2) --[[ OnTick | Line: 261 ]] end
}
t.Meteor = {
	SpawnAmount = 10,
	SpawnDelay = 0,
	Lifetime = 3,
	FallTime = 2,
	MaxSpread = 150,
	Speed = 150,
	Model = "Meteor",
	AimAt = "Meteor",
	Range = 300,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193"
}
t.CactusCannon = {
	SpawnAmount = 1,
	SpawnDelay = 0,
	Lifetime = 2,
	Speed = 100,
	Model = "CactusCannon",
	AimAt = "Target",
	Damage = 500,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 288 ]]
		return CFrame.new(p1.Model.Position + Vector3.new(0, 18, 0))
	end
}
t.BossDrappleSpear2 = {
	Lifetime = 2,
	Speed = 85,
	SpawnAmount = 8,
	SpawnDelay = 0.15,
	Model = "BigDrappleSpear",
	AimAt = "Target",
	Damage = 5000,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 303 ]]
		local v1 = p1.Model.Size.Magnitude * 1.25
		local Position = p1.Model.Position
		local v2 = 6.283185307179586 * p2
		local v3 = Position.X + v1 * math.cos(v2)
		local v4 = Position.Z + v1 * math.sin(v2)
		return CFrame.new((Vector3.new(v3, p1.Model.Position.Y + 15, v4)))
	end
}
t.DeerProjectile3 = {
	Lifetime = 2,
	Speed = 50,
	Model = "DeerProjectile3",
	AimAt = "Target",
	Damage = 300,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	GetSpawnCFrame = function(p1, p2) --[[ GetSpawnCFrame | Line: 329 ]]
		return CFrame.new(p1.Model.Position + Vector3.new(0, 15, 0))
	end
}
t.Fireball = {
	SpawnAmount = 1,
	SpawnDelay = 0,
	Lifetime = 3,
	Speed = 125,
	Model = "FireMeteor",
	AimAt = "Target",
	Damage = 500,
	SpawnSound = "rbxassetid://7278163473",
	HitSound = "rbxassetid://8595977193",
	ProjectileOrigin = "Head"
}
return t