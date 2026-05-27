-- https://lua.expert/
local RunService = game:GetService("RunService")
local Assets = game:GetService("ReplicatedStorage").Storage:WaitForChild("Assets")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local MobProjectileData = Sonar("Constants").MobProjectileData
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("RemoteUtils")
local v5 = v3.GetClient()
local t = {}
t.__index = t
local ProjectileFolder = workspace:FindFirstChild("ProjectileFolder") or Instance.new("Folder", workspace)
ProjectileFolder.Name = "ProjectileFolder"
local t2 = {}
local v6 = RaycastParams.new()
v6.IncludeInstances = { workspace.Terrain, workspace.Characters }
local v7 = OverlapParams.new()
v7.IncludeInstances = { workspace.Characters }
local v8 = os.clock()
local Character = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.CharacterAdded:Connect(function(p1) --[[ Line: 32 | Upvalues: Character (ref) ]]
	Character = p1
end)
t.LocalHitSignal = v1.new()
local t3 = {}
local function isSphere(p1) --[[ isSphere | Line: 41 ]]
	if p1:IsA("Part") and p1.Shape == Enum.PartType.Ball then
		return true
	end
	local v1 = p1:IsA("Model") and p1:GetBoundingBox() or p1.Size
	return if v1.x == v1.y then v1.y == v1.z else false
end
function t._makeSound(p1, p2) --[[ _makeSound | Line: 49 | Upvalues: t3 (copy) ]]
	if not t3[p1.ProjectileType] then
		t3[p1.ProjectileType] = {}
	end
	if not t3[p1.ProjectileType][p2] then
		local Sound = Instance.new("Sound")
		Sound.SoundId = p1.Data[p2]
		Sound.Volume = 1
		Sound.SoundGroup = game.SoundService.Effects
		t3[p1.ProjectileType][p2] = Sound
	end
	return t3[p1.ProjectileType][p2]
end
function t._init(p1) --[[ _init | Line: 64 | Upvalues: MobProjectileData (copy), Assets (copy), isSphere (copy), ProjectileFolder (copy) ]]
	p1.Data = MobProjectileData[p1.ProjectileType]
	p1.Model = Assets.ProjectileAssets[p1.Data.Model]:Clone()
	if p1.Source.BossPreset and p1.Source.BossPreset.AttackColor then
		if p1.Model:IsA("Model") then
			for v1, v2 in p1.Model:GetDescendants() do
				if v2:IsA("BasePart") then
					v2.Color = p1.Source.BossPreset.AttackColor
				end
			end
		else
			p1.Model.Color = p1.Source.BossPreset.AttackColor
		end
	end
	p1.Maid:GiveTask(p1.Model)
	task.defer(function() --[[ Line: 81 | Upvalues: p1 (copy), isSphere (ref), ProjectileFolder (ref) ]]
		p1._parented = true
		p1.StartTime = os.clock()
		p1.EndTime = p1.StartTime + p1.Data.Lifetime or 1
		p1.Speed = p1.Data.Speed
		p1.Size = p1.Model:IsA("Model") and p1.Model:GetBoundingBox() or p1.Model.Size
		p1.CastType = p1.Data.CastType or (if isSphere(p1.Model) then "Sphere" else "Block")
		if p1.Data.SpawnSound then
			local v3 = p1:_makeSound("SpawnSound"):Clone()
			v3.Parent = p1.Model
			task.defer(function() --[[ Line: 96 | Upvalues: v3 (copy) ]]
				v3:Play()
			end)
		end
		if p1.Data.HitSound then
			p1.HitSound = p1:_makeSound("HitSound")
		end
		p1.Model.Parent = ProjectileFolder
	end)
end
function t.new(p1, p2) --[[ new | Line: 109 | Upvalues: t (copy), v2 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Source = p2
	v22.Maid = v2.new()
	v22.ProjectileType = p1
	v22:_init()
	t2[v22] = v22.Model
	return v22
end
function t._cast(p1, p2) --[[ _cast | Line: 124 | Upvalues: v6 (copy), v7 (copy), Character (ref), v5 (copy) ]]
	local v1 = if p1.CastType == "Block" then true else false
	local v2 = if p1.CastType == "Touch" then true else false
	local v3 = nil
	local v4 = p1.Model:IsA("Model") and p1.Model:GetPivot().Position or p1.Model.Position
	local v52 = p1.Model:IsA("Model") and p1.Model:GetPivot() or p1.Model.CFrame
	if v1 then
		v3 = workspace:Blockcast(v52, p1.Model.Size * 0.9, v52.LookVector * p2, v6)
	elseif v2 then
		local v9 = nil
		for v10, v11 in workspace:GetPartsInPart(p1.Model:IsA("Model") and p1.Model.PrimaryPart or p1.Model, v7) do
			if v11:IsDescendantOf(Character) and (not v11:IsDescendantOf(Character.Animals) or v5.CurrentHorse and v11:IsDescendantOf(v5.CurrentHorse.Model)) then
				v9 = v11
			end
		end
		if v9 then
			v3 = {
				Normal = Vector3.new(0, 0, 0),
				Instance = v9,
				Position = v9.Position,
				Material = v9.Material
			}
		end
	else
		v3 = workspace:Spherecast(v4, math.min(p1.Size.X, p1.Size.Y, p1.Size.Z) * 0.9, v52.LookVector * p2, v6)
	end
	if v3 then
		return v3.Instance, v3.Position, v3.Normal, v3.Material
	else
		return nil, v4
	end
end
function t.Tick(p1, p2) --[[ Tick | Line: 165 | Upvalues: v8 (ref), v5 (copy), Character (ref), v4 (copy), t (copy) ]]
	if v8 >= p1.EndTime then
		p1:Destroy()
		return
	end
	if p1.Data.OnTick then
		p1.Data.OnTick(nil, p1)
	end
	local v1 = p1.Speed * p2
	local v2, v3 = p1:_cast(v1)
	if not p1.Data.DoNotMove then
		p1.Model:PivotTo(CFrame.new(v3) * CFrame.new(0, 0, -v1))
	end
	if not v2 or v5.Bucking then
		return
	end
	if v2:IsDescendantOf(Character) then
		v4.GetRemoteEvent("MobProjectileDamageRemote"):FireServer(p1.SourceModel, p1.Data.Damage)
		t.LocalHitSignal:Fire(p1.Source)
		if p1.HitSound then
			local v42 = p1.HitSound:Clone()
			v42.Parent = v2
			v42:Play()
			v42.Ended:Once(function() --[[ Line: 190 | Upvalues: v42 (copy) ]]
				v42:Destroy()
			end)
		end
	end
	p1:Destroy()
end
function t.Destroy(p1) --[[ Destroy | Line: 199 | Upvalues: t2 (copy) ]]
	p1._destroyed = true
	p1.Maid:Destroy()
	t2[p1.Model] = nil
	setmetatable(p1, nil)
end
RunService.Heartbeat:Connect(function(p1) --[[ Line: 206 | Upvalues: v8 (ref), t2 (copy) ]]
	v8 = os.clock()
	for v1, v2 in t2 do
		if v1.Tick and (not v1._destroyed and v1._parented) then
			v1:Tick(p1)
		end
	end
end)
return t