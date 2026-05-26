-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Assets = ReplicatedStorage.Storage:WaitForChild("Assets")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("MathUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("Octree")
local v6 = Sonar("CameraShaker")
local v7 = v3.GetClient()
local t = {}
t.__index = t
local ProjectileFolder = workspace:FindFirstChild("ProjectileFolder") or Instance.new("Folder", workspace)
ProjectileFolder.Name = "ProjectileFolder"
local Effects = game.SoundService.Effects
local t2 = {}
local v8 = v5.new("Meteors", 4, 512)
local t3 = { workspace.Terrain }
local v9 = v6.new(Enum.RenderPriority.Camera.Value + 200, "CameraShakerMeteor", function(p1) --[[ Line: 31 ]]
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p1
end)
v9:Start()
v9._permanent = true
function t.new(p1) --[[ new | Line: 37 | Upvalues: t (copy), t3 (copy), v1 (copy), v8 (copy), Assets (copy), ProjectileFolder (copy), Effects (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Data = p1
	local _, v5, _2, v6 = workspace:FindPartOnRayWithWhitelist(Ray.new(p1.StartPosition + Vector3.new(0, 100, 0), Vector3.new(0, -350, 0)), t3)
	v2.TargetPosition = v5
	if (v2.TargetPosition - workspace.CurrentCamera.CFrame.p).Magnitude > 600 then
		return {
			Destroy = function() --[[ Destroy | Line: 49 ]] end
		}
	else
		v2.Maid = v1.new()
		v2.StartTime = workspace:GetServerTimeNow()
		v2.TimeToHit = v2.StartTime + p1.FallTime
		v8:Add(v2, v5)
		v2.MeteorAsset = Assets.ProjectileAssets[v2.Data.Model]:Clone()
		local v7 = v2.MeteorAsset.Size * math.random(20, 40)
		v2.MeteorAsset.Position = v2.TargetPosition + Vector3.new(math.random(-v7.X, v7.X), math.random(1200, 1450), math.random(-v7.Z, v7.Z))
		v2.StartPosition = v2.MeteorAsset.Position
		v2.MeteorAsset.Parent = ProjectileFolder
		v2.AnimationAsset = Assets.MeteorSpawn:Clone()
		v2.AnimationAsset.Position = v5
		v2.AnimationAsset.Parent = ProjectileFolder
		v2.StartSize = Vector3.new(1, 10, 10)
		local v11 = math.max(v2.MeteorAsset.Size.X, v2.MeteorAsset.Size.Z)
		v2.MeteorSize = v11
		v2.EndSize = Vector3.new(2, v11, v11)
		v2.BaseColor = v2.AnimationAsset.Color
		v2.ExplosionAsset = Instance.new("Part")
		v2.ExplosionAsset.Transparency = 1
		Instance.new("SpecialMesh", v2.ExplosionAsset).MeshType = Enum.MeshType.Sphere
		v2.ExplosionAsset.Position = v5
		v2.ExplosionAsset.Size = Vector3.new(1, 1, 1)
		v2.ExplosionAsset.Color = v2.BaseColor
		v2.ExplosionAsset.Material = v6
		v2.ExplosionAsset.Parent = ProjectileFolder
		local v122 = Effects.MeteorFlying:Clone()
		v122.Parent = v2.MeteorAsset
		v122.PlaybackSpeed = v122.PlaybackSpeed * Random.new():NextNumber(0.8, 1.2)
		v122:Play()
		v2.FlyingSound = v122
		v2.Maid:GiveTask(v2.AnimationAsset)
		v2.Maid:GiveTask(v2.MeteorAsset)
		t2[v2.MeteorAsset] = v2
		return v2
	end
end
local function fastOscillatingSine(p1, p2, p3, p4) --[[ fastOscillatingSine | Line: 105 ]]
	return p3 * math.sin(6.283185307179586 * p2 * p1 + (p4 or 0))
end
function t.Update(p1, p2) --[[ Update | Line: 111 | Upvalues: v2 (copy) ]]
	if p1._destroyed then
		return
	end
	if not p1.AnimationAsset then
		return
	end
	local v1 = v2.map(p2, p1.StartTime, p1.TimeToHit, 0, 1)
	p1.AnimationAsset.Transparency = 1 - (v1 + 0.25)
	p1.AnimationAsset.Mesh.Scale = p1.StartSize:lerp(p1.EndSize, v1)
	local v22 = p1.StartPosition:lerp(p1.TargetPosition, v1)
	p1.MeteorAsset.CFrame = CFrame.new(v22) * p1.MeteorAsset.CFrame.Rotation * CFrame.Angles(math.rad(4), 0, 0)
	if v1 >= 0.65 then
		p1.AnimationAsset.Color = p1.BaseColor:lerp(Color3.new(255/255, 0/255, 0/255), 0.8 * math.sin(18.84955592153876 * p2 + 0))
	end
	if not (v1 >= 1) then
		return
	end
	p1._destroyed = true
	if (p1.TargetPosition - workspace.CurrentCamera.CFrame.p).Magnitude < 500 then
		p1:_playExplosion()
	end
	task.delay(2, function() --[[ Line: 132 | Upvalues: p1 (copy) ]]
		if p1.Destroy then
			p1:Destroy()
		end
	end)
end
function t._playExplosion(p1) --[[ _playExplosion | Line: 141 | Upvalues: TweenService (copy), v7 (copy), v9 (copy), v6 (copy), v4 (copy) ]]
	p1.ExplosionAsset.Transparency = 0.25
	local Sound = Instance.new("Sound")
	Sound.SoundId = p1.Data.HitSound or ""
	Sound.Volume = 0.7
	Sound.RollOffMaxDistance = 90
	Sound.RollOffMinDistance = 15
	local v1 = TweenInfo.new(Sound.TimeLength / 2)
	local v2 = TweenInfo.new(0.08)
	Sound.Parent = p1.ExplosionAsset
	Sound:Play()
	local v3 = TweenService:Create(p1.ExplosionAsset.Mesh, v1, {
		Scale = Vector3.new(75, 75, 75)
	})
	TweenService:Create(p1.ExplosionAsset, v1, {
		Transparency = 1
	}):Play()
	TweenService:Create(p1.AnimationAsset, v2, {
		Transparency = 1
	}):Play()
	local v42 = nil
	v42 = v3.Completed:Connect(function() --[[ Line: 156 | Upvalues: p1 (copy), v42 (ref) ]]
		p1.ExplosionAsset:Destroy()
		v42:Disconnect()
	end)
	v3:Play()
	if v7:IsInAction("BossFight") or v7:IsInAction("GlobalBossFight") then
		v9:Shake(v6.Presets.CannonBumpFast)
	end
	p1.FlyingSound:Destroy()
	local Character = v7.Character
	if Character and (not v7.Bucking and (Character.PrimaryPart.Position - p1.ExplosionAsset.Position).Magnitude <= p1.MeteorSize) then
		if p1.Data.OnHit then
			p1.Data.OnHit()
		else
			v4.GetRemoteEvent("MobProjectileDamageRemote"):FireServer()
		end
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 178 | Upvalues: t2 (copy), v8 (copy) ]]
	t2[p1.MeteorAsset] = nil
	p1.Maid:Destroy()
	v8:Remove(p1)
	setmetatable(p1, nil)
end
RunService.Heartbeat:Connect(function() --[[ Line: 185 | Upvalues: v8 (copy) ]]
	local v1 = workspace:GetServerTimeNow()
	for k, v in pairs((v8:RadiusSearch(workspace.CurrentCamera.CFrame.p, 1000))) do
		local v3, v4 = pcall(function() --[[ Line: 189 | Upvalues: v (copy), v1 (copy) ]]
			v:Update(v1)
		end)
		if not v3 and v4 then
			warn("Meteor error", v4)
		end
	end
end)
return t