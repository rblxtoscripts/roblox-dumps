-- https://lua.expert/
local t = {
	AllMobs = {}
}
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("ElderingService")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("Maid")
local v6 = Sonar("MathUtils")
local v7 = Sonar("NotificationsService")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("RemoteUtils")
local v10 = Sonar("Signal")
local v11 = Sonar(script.States)
local v12 = Sonar("Table")
local v13 = Sonar("TameUtils")
local v14 = Sonar("TutorialService")
local v15 = Sonar("WeightedProbability")
local v16 = Sonar("PlaceTypeService")
local v17 = v1 and Sonar("AnalyticsService")
local v18 = Sonar("StableClubsManager", {
	Deferred = true
})
local v19 = Sonar("Constants")
local v20 = v9.GetRemoteEvent("LassoSnappedRemote")
local t2 = {}
local PlayerOctree = v8.PlayerOctree
local v21 = 0
local Assets = ReplicatedStorage:WaitForChild("Storage").Assets
local function taskLoop(p1, p2) --[[ taskLoop | Line: 50 | Upvalues: RunService (copy) ]]
	local v1 = p2 or 0
	local v2 = tick()
	return RunService.Heartbeat:Connect(function() --[[ Line: 65 | Upvalues: v2 (ref), v1 (ref), p1 (copy) ]]
		local v12 = tick()
		if not (v2 < v12) then
			return
		end
		v2 = v12 + v1
		p1()
	end)
end
local function sanitizeNearbyList(p1, p2) --[[ sanitizeNearbyList | Line: 77 | Upvalues: Players (copy) ]]
	if p1.UserWhitelist then
		for i = #p2, 1, -1 do
			local v1 = Players:FindFirstChild(p2[i])
			if v1 and not p1.UserWhitelist[v1] then
				table.remove(p2, i)
			end
		end
	end
	return p2
end
local MobFolder
if RunService:IsServer() then
	MobFolder = Instance.new("Folder")
	MobFolder.Name = "MobFolder"
	MobFolder.Parent = workspace
	local function f22() --[[ Line: 111 | Upvalues: t (ref), v19 (copy), PlayerOctree (copy), sanitizeNearbyList (copy) ]]
		for v1, v2 in t.AllMobs do
			if v1._destroyed then
				v1.nearby = {}
				continue
			end
			local Position = v2.Position
			local Y = Position.Y
			if Y <= v1.initPos.Y - 300 or Y <= v19.MIN_WORLD_Y then
				v1:_teleport()
				Position = v2.Position
			end
			if v1.awake then
				local v3 = PlayerOctree:RadiusSearch(Position, v1.MobData.AwakeMaxRange)
				if not next(v3) and math.abs(v2.Velocity.Y) < 5 then
					v1:sleep()
				end
				v1.nearby = sanitizeNearbyList(v1, v3)
			elseif next((PlayerOctree:RadiusSearch(Position, v1.MobData.AsleepMinRange))) then
				v1._stuckFrames = 0
				v1:wake()
			elseif math.abs(Y - v1.initPos.Y) > 55 then
				if (Position - v1._lastPosition).Magnitude < 15 then
					v1._stuckFrames = v1._stuckFrames + 1
				else
					v1._stuckFrames = 0
				end
				if v1._stuckFrames > 10 and (not v1:get("TamingId") or (if workspace:GetServerTimeNow() >= (v1:get("TamingTimerEnd") or 10) then true else false)) then
					v1:_teleport()
				end
			end
			v1._lastPosition = Position
		end
	end
	local v23 = 2 or 0
	local v24 = tick()
	RunService.Heartbeat:Connect(function() --[[ Line: 65 | Upvalues: v24 (ref), v23 (ref), f22 (copy) ]]
		local v12 = tick()
		if not (v24 < v12) then
			return
		end
		v24 = v12 + v23
		f22()
	end)
	pcall(function() --[[ Line: 161 ]]
		game:GetService("PhysicsService"):RegisterCollisionGroup("Mobs")
		game:GetService("PhysicsService"):CollisionGroupSetCollidable("Mobs", "Mobs", false)
		game:GetService("PhysicsService"):CollisionGroupSetCollidable("Mobs", "Characters", false)
	end)
else
	MobFolder = workspace:WaitForChild("MobFolder")
end
function t.new(p1, p2, p3) --[[ new | Line: 173 | Upvalues: t (ref), v5 (copy), v12 (copy), v19 (copy), v10 (copy), v1 (copy), v21 (ref), MobFolder (ref), Assets (copy), HttpService (copy) ]]
	local v2 = setmetatable(p3 or {}, {
		__index = t
	})
	v2.Maid = v5.new()
	v2.adornee = p1
	v2.Model = p1
	v2.IsBoss = p1:HasTag("Boss")
	v2.MobType = p2
	v2.MobData = v12.DeepCopy(v2.IsBoss and v19.MobData.Horse_Boss or v19.MobData[p2])
	v2.MobAnimationInfo = v19.MobAnimationInfo[p2]
	v2.initPos = p1.Position
	v2.CanFly = v2.MobData.Flier and not v2.IsBoss
	if v2.Player then
		p1:SetAttribute("ownerId", v2.Player.UserId)
	end
	v2.Died = v10.new()
	v2.Maid:GiveTask(v2.Died)
	v2:createPhysicsRig()
	v2:bindTamingSystem()
	v2.state = "idle"
	v2.stateParams = {}
	if not v1 then
		p1:SetAttribute("Local", true)
	end
	if v2.IsBoss then
		for i = #v2.MobData.Attacks, 1, -1 do
			local v6 = v2.MobAnimationInfo.AttackSequences[v2.MobData.Attacks[i]]
			if v6.Tier and v6.Tier ~= p1:GetAttribute("Tier") then
				table.remove(v2.MobData.Attacks, i)
			end
		end
	end
	v2:wake()
	v21 = v21 + 1
	p1:SetAttribute("ID", v21)
	t.AllMobs[v2] = p1
	p1.Parent = MobFolder
	p1.Anchored = false
	if v1 then
		p1:SetNetworkOwner(nil)
	end
	v2._lastPosition = v2.initPos
	v2._stuckFrames = 0
	v2._lastTeleport = tick()
	if v2.IsBoss then
		v2.SpawnTick = tick()
		v2.AttackCooldowns = {}
		local t3 = {}
		for v9, v102 in v2.MobAnimationInfo.AttackSequences or {} do
			local v8
			local v11 = v102.Hitbox and Assets.MobHitboxes[v102.Hitbox]
			v102.UniqueID = v102.UniqueID or HttpService:GenerateGUID(false)
			if v11 then
				local MaxDistance = v102.MaxDistance
				if not MaxDistance then
					MaxDistance = math.max(v11.Size.X, v11.Size.Z) * 0.9
				end
				v8 = MaxDistance
			else
				v8 = v102.MaxDistance or v2.Model.Size.Magnitude * 8
			end
			t3[v102.UniqueID] = v8
		end
		v2.HitDistances = t3
	end
	v2.Maid:GiveTask(p1.AncestryChanged:Connect(function() --[[ Line: 266 | Upvalues: v2 (copy) ]]
		if v2._destroyed then
			return
		end
		v2._normallyDied = true
		v2.Died:Fire()
	end))
	v2.Maid:GiveTask(p1)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 279 | Upvalues: t (ref) ]]
	if p1.Died and not p1._normallyDied then
		p1.Died:Fire()
	end
	p1._destroyed = true
	t.AllMobs[p1] = nil
	p1.Maid:Destroy()
	p1.nearby = nil
	table.clear(p1)
	setmetatable(p1, nil)
end
function t._decrementTool(p1, p2, p3) --[[ _decrementTool | Line: 302 | Upvalues: v7 (copy) ]]
	if p1._destroyed then
		return
	end
	if p1.UserWhitelist and not p1.UserWhitelist[p2.Player] then
		return
	end
	if tick() - (p2._lastBossLassoDestroyed or 0) < 1 then
		return
	end
	local _lastUsedTameItem = p2._lastUsedTameItem
	if not _lastUsedTameItem then
		return
	end
	local v1 = p2:GetItemValue(_lastUsedTameItem.Name)
	if not v1 then
		return
	end
	p2._lastBossLassoDestroyed = tick()
	local v2 = if v1.Value > 0 then true else false
	v1.Value = math.max(v1.Value - 1, 0)
	if not v2 then
		return
	end
	p1:_incrementBossStat(p2.Player, "LassosLost", 1, p3)
	v7.NotifyPlayer(p2.Player, "LassoLost")
end
function t._getNextAttack(p1) --[[ _getNextAttack | Line: 332 ]]
	local Attacks = p1.MobData.Attacks
	local v1 = tick()
	local t = {}
	for v2, v3 in Attacks do
		if (p1.MobAnimationInfo.AttackSequences[v3] and p1.MobAnimationInfo.AttackSequences[v3].Cooldown or 0) <= v1 - (p1.AttackCooldowns[v3] or 0) then
			table.insert(t, v3)
		end
	end
	if #t == 0 then
		t = Attacks
	end
	local v6 = t[math.random(1, #t)]
	if p1.AttackCooldowns then
		p1.AttackCooldowns[v6] = v1
	end
	return v6
end
function t._makeCachedHitbox(p1, p2) --[[ _makeCachedHitbox | Line: 360 | Upvalues: Assets (copy) ]]
	local v1 = Assets.MobHitboxes[p2.Hitbox]:Clone()
	p1._attackHitboxCache[p2.Hitbox] = v1
	p1.Maid:GiveTask(v1)
	v1.Anchored = true
	v1.CanCollide = false
	v1.CanTouch = false
	v1.CastShadow = false
	v1.CanQuery = true
	p1.Maid:GiveTask(v1)
	v1.Parent = workspace.CurrentCamera
	v1.BrickColor = BrickColor.Yellow()
	return v1
end
function t._teleport(p1) --[[ _teleport | Line: 380 ]]
	p1.adornee.Velocity = Vector3.new(0, 0, 0)
	p1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
	local Anchored = p1.adornee.Anchored
	p1.adornee.Anchored = true
	p1._stuckFrames = 0
	p1._lastTeleport = tick()
	p1.Model:PivotTo(CFrame.new(p1.initPos))
	task.defer(function() --[[ Line: 389 | Upvalues: p1 (copy), Anchored (copy) ]]
		p1.adornee.Anchored = Anchored
	end)
end
function t._prepareHitbox(p1, p2) --[[ _prepareHitbox | Line: 394 ]]
	p2.Size = Vector3.new(p2.Size.X, p1.adornee.Size.Y * 2, p2.Size.Z)
	p2.CFrame = p1.adornee.CFrame * CFrame.new(0, 0, -p2.Size.Z / 2)
end
local v25 = OverlapParams.new()
local t3 = {}
v25.IncludeInstances = t3
function t._checkHitbox(p1, p2) --[[ _checkHitbox | Line: 405 | Upvalues: v25 (copy), Players (copy), v8 (copy) ]]
	local t = {}
	for v1, v2 in workspace:GetPartsInPart(p2, v25) do
		if v2.Parent:IsA("Model") then
			local v4 = v8.getWrapperFromPlayer((Players:GetPlayerFromCharacter(v2.Parent)))
			if v4 then
				local Character = v4.Character
				if Character then
					table.insert(t, Character)
				end
			end
		end
	end
	return t
end
function t.enterState(p1, p2, ...) --[[ enterState | Line: 424 | Upvalues: v5 (copy), v11 (copy) ]]
	if p1._destroyed then
	else
		p1.state = p2
		p1.stateParams = { ... }
		local v1 = v5.new()
		p1.Maid.stateMaid = v1
		v11[p2](p1, v1, ...)
		p1:set("State", p2)
		return true
	end
end
function t.wake(p1) --[[ wake | Line: 444 ]]
	if p1.state and p1.stateParams then
		p1:enterState(p1.state, unpack(p1.stateParams))
	end
	p1.awake = true
	p1:set("Awake", true)
	p1.adornee.Anchored = false
	if not p1.adornee:IsDescendantOf(workspace) then
		return
	end
	p1.adornee:SetNetworkOwner(nil)
end
function t.sleep(p1) --[[ sleep | Line: 457 ]]
	p1.Maid.stateMaid = nil
	p1.awake = false
	p1:set("Awake", false)
	p1.adornee.Anchored = true
end
function t.set(p1, p2, p3) --[[ set | Line: 465 ]]
	p1.adornee:SetAttribute(p2, p3)
end
function t.get(p1, p2) --[[ get | Line: 469 ]]
	return p1.adornee:GetAttribute(p2)
end
function t.createPhysicsRig(p1) --[[ createPhysicsRig | Line: 476 ]]
	local adornee = p1.adornee
	adornee.CustomPhysicalProperties = PhysicalProperties.new(1, 0.1, 0, 100, 100)
	local BodyVelocity = Instance.new("BodyVelocity")
	local v1 = adornee.AssemblyMass * workspace.Gravity
	BodyVelocity.MaxForce = v1 * Vector3.new(1.1, if p1.CanFly then 1.1 else 0, 1.1)
	BodyVelocity.Parent = adornee
	p1.BodyVelocity = BodyVelocity
	local BodyGyro = Instance.new("BodyGyro")
	BodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
	BodyGyro.D = if p1.CanFly then 200 else 100
	BodyGyro.P = 3000
	BodyGyro.Parent = adornee
	p1.BodyGyro = BodyGyro
	local Motor = Instance.new("Motor6D")
	Motor.Name = "Motor"
	Motor.Part0 = adornee
	Motor.Parent = adornee
	adornee.CanTouch = false
	adornee.CollisionGroup = "Mobs"
end
function t.walkToPosition(p1, p2, p3, p4) --[[ walkToPosition | Line: 508 | Upvalues: v19 (copy), v5 (copy), RunService (copy) ]]
	if p1.IsBoss and (p2 - p1.initPos).Magnitude > v19.MaxBossDistance then
		p2 = p1.initPos + (p2 - p1.initPos).Unit * v19.MaxBossDistance
	end
	local v1 = Instance.new("BindableEvent")
	local v2 = p3 or 10
	local v3 = v5.new()
	p1.Maid.physMaid = v3
	v3:GiveTask(function() --[[ Line: 527 | Upvalues: v1 (copy) ]]
		v1:Fire(false)
	end)
	if p4 then
		v3:GiveTask(task.delay(p4, function() --[[ Line: 532 | Upvalues: v1 (copy) ]]
			v1:Fire(false)
		end))
	end
	local function update() --[[ update | Line: 537 | Upvalues: p1 (copy), p2 (ref), v1 (copy), v2 (ref) ]]
		if p1._destroyed then
			return
		end
		local v4 = (p2 - p1.adornee.Position) * Vector3.new(1, if p1.CanFly then 1 else 0, 1)
		local Unit = v4.Unit
		if not (v4.Magnitude < 2) then
			p1.BodyGyro.CFrame = CFrame.new(Vector3.new(), Unit)
			p1.BodyVelocity.Velocity = Unit * v2
			return
		end
		p1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		v1:Fire(true)
		local _, v5 = p1.BodyGyro.CFrame:ToOrientation()
		if not p1.CanFly then
			return
		end
		p1.BodyGyro.CFrame = CFrame.Angles(0, v5, 0)
	end
	local v4 = 0.2 or 0
	local v52 = tick()
	v3:GiveTask((RunService.Heartbeat:Connect(function() --[[ Line: 65 | Upvalues: v52 (ref), v4 (ref), update (copy) ]]
		local v12 = tick()
		if not (v52 < v12) then
			return
		end
		v52 = v12 + v4
		update()
	end)))
	local v6 = v1.Event:Wait()
	v1:Destroy()
	if p1.Maid.physMaid ~= v3 then
		return v6
	end
	p1.Maid.physMaid = nil
	return v6
end
function t.walkAwayFromObject(p1, p2, p3, p4, p5, p6) --[[ walkAwayFromObject | Line: 570 | Upvalues: v19 (copy), v5 (copy), v6 (copy), RunService (copy) ]]
	local v1 = Instance.new("BindableEvent")
	local v2 = p4 or 10
	local v3 = p3 or 20
	if p1.IsBoss and (p2.Position - p1.initPos).Magnitude > v19.MaxBossDistance then
		v1:Fire(true)
		return true
	end
	local v4 = v5.new()
	p1.Maid.physMaid = v4
	v4:GiveTask(function() --[[ Line: 585 | Upvalues: v1 (copy) ]]
		v1:Fire(false)
	end)
	v4:GiveTask(p2.Destroying:Connect(function() --[[ Line: 589 | Upvalues: v1 (copy) ]]
		v1:Fire(true)
	end))
	if p5 then
		v4:GiveTask(task.delay(p5, function() --[[ Line: 594 | Upvalues: v1 (copy) ]]
			v1:Fire(false)
		end))
	end
	local v52 = math.random() * 1000
	local function update() --[[ update | Line: 601 | Upvalues: p1 (copy), p2 (copy), v19 (ref), v6 (ref), v3 (ref), v1 (copy), p6 (copy), v52 (copy), v2 (ref) ]]
		if p1._destroyed then
			return
		end
		local Position = p1.adornee.Position
		local v4 = (p2.Position - Position) * Vector3.new(1, if p1.CanFly then 1 else 0, 1)
		local v5 = -v4.Unit
		if p1.IsBoss and (Position - p1.initPos).Magnitude > v19.MaxBossDistance then
			v5 = (p1.initPos - Position).Unit
		end
		local v7 = p1.CanFly and v6.map(v5:Dot(Vector3.new(0, -1, 0)), 0, 1, 1, 1.75, true) or 1
		if v3 * v7 < v4.Magnitude then
			p1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
			v1:Fire(true)
			local _, v8 = p1.BodyGyro.CFrame:ToOrientation()
			if not p1.CanFly then
				return
			end
			p1.BodyGyro.CFrame = CFrame.Angles(0, v8, 0)
		else
			if p6 then
				local v122 = math.clamp(math.noise(Position.X / 30, Position.Z / 30, v52), -1, 1)
				local v13 = math.atan2(v5.Z, v5.X) + v122 * p6
				v5 = Vector3.new(math.cos(v13), p1.CanFly and math.sin(v13) or 0, (math.sin(v13)))
			end
			if p1.CanFly and math.abs(Position.Y - p1.initPos.Y) > 80 then
				v5 = v5 * Vector3.new(1, 0, 1)
			end
			p1.BodyGyro.CFrame = CFrame.new(Vector3.new(), v5)
			p1.BodyVelocity.Velocity = v5 * v2 * v7
		end
	end
	local v62 = 0.2 or 0
	local v7 = tick()
	v4:GiveTask((RunService.Heartbeat:Connect(function() --[[ Line: 65 | Upvalues: v7 (ref), v62 (ref), update (copy) ]]
		local v12 = tick()
		if not (v7 < v12) then
			return
		end
		v7 = v12 + v62
		update()
	end)))
	local v8 = v1.Event:Wait()
	v1:Destroy()
	if p1.Maid.physMaid ~= v4 then
		return v8
	end
	p1.Maid.physMaid = nil
	return v8
end
function t.walkToObject(p1, p2, p3, p4, p5, p6) --[[ walkToObject | Line: 666 | Upvalues: v19 (copy), v5 (copy), RunService (copy) ]]
	local v1 = Instance.new("BindableEvent")
	local v2 = p5 or 10
	local v3 = p3 or 20
	if p1.IsBoss and (p2.Position - p1.initPos).Magnitude > v19.MaxBossDistance then
		v1:Fire(true, true)
		return true, true
	end
	local v4 = v5.new()
	p1.Maid.physMaid = v4
	v4:GiveTask(function() --[[ Line: 681 | Upvalues: v1 (copy) ]]
		v1:Fire(false)
	end)
	v4:GiveTask(p2.Destroying:Connect(function() --[[ Line: 685 | Upvalues: v1 (copy) ]]
		v1:Fire(true)
	end))
	if p6 then
		v4:GiveTask(task.delay(p6, function() --[[ Line: 690 | Upvalues: v1 (copy) ]]
			v1:Fire(false, false)
		end))
	end
	local _ = math.random() * 1000
	local function update() --[[ update | Line: 697 | Upvalues: p1 (copy), p2 (copy), v19 (ref), v3 (ref), p4 (copy), v1 (copy), v2 (ref) ]]
		if p1._destroyed then
			return
		end
		local Position = p1.adornee.Position
		local v12 = (p2.Position - Position) * Vector3.new(1, 0, 1)
		local Magnitude = v12.Magnitude
		local Unit = v12.Unit
		if p1.IsBoss and (Position - p1.initPos).Magnitude > v19.MaxBossDistance then
			Unit = (p1.initPos - Position).Unit
		end
		if not (Magnitude < v3 or p4 * 1.1 < Magnitude) then
			p1.BodyGyro.CFrame = CFrame.new(Vector3.new(), Unit)
			p1.BodyVelocity.Velocity = Unit * v2
			return
		end
		p1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		v1:Fire(true, p4 * 1.1 < Magnitude)
	end
	local v52 = 0.2 or 0
	local v6 = tick()
	v4:GiveTask((RunService.Heartbeat:Connect(function() --[[ Line: 65 | Upvalues: v6 (ref), v52 (ref), update (copy) ]]
		local v12 = tick()
		if not (v6 < v12) then
			return
		end
		v6 = v12 + v52
		update()
	end)))
	local v7, v8 = v1.Event:Wait()
	v1:Destroy()
	if p1.Maid.physMaid ~= v4 then
		return v7, v8
	end
	p1.Maid.physMaid = nil
	return v7, v8
end
function t.standStill(p1) --[[ standStill | Line: 736 ]]
	p1.Maid.physMaid = nil
	p1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
end
function t.bindTamingSystem(p1) --[[ bindTamingSystem | Line: 744 | Upvalues: v1 (copy), t2 (copy), v19 (copy), v16 (copy) ]]
	if v1 then
		local TameEvent = p1.Maid:GiveTask(Instance.new("RemoteEvent"))
		TameEvent.Name = "TameEvent"
		TameEvent.Parent = p1.adornee
		p1.Maid:GiveTask(TameEvent.OnServerEvent:Connect(function(p12, p2, ...) --[[ Line: 751 | Upvalues: t2 (ref), p1 (copy) ]]
			local v1 = os.clock()
			local v2 = t2[p12.UserId] or v1
			t2[p12.UserId] = v1
			local v3 = v1 - v2
			if v3 == 0 or not (v3 <= 0.5) then
				p1:RunAction(p12, p2, ...)
			end
		end))
	end
	if not p1.IsBoss then
		return
	end
	p1.Tier = p1.adornee:GetAttribute("Tier") or 1
	local v12 = p1.adornee:GetAttribute("InitialPlayerCount") or 1
	local v4 = if v16.IsTestGame() then 100 else math.min(500 + v12 * (v19.BossHealthPerPlayer[p1.Tier] or v19.BossHealthPerPlayer[3]), v19.BossHealthCap[p1.Tier] or v19.BossHealthCap[3])
	p1.TotalHits = 0
	p1.UsedLassos = {}
	p1.Contributors = {}
	p1:set("TamingType", 2)
	p1:set("TamingHealth", (Vector3.new(0, v4, 0)))
end
function t.getMobFromModel(p1) --[[ getMobFromModel | Line: 786 | Upvalues: t (ref) ]]
	for v2, v3 in t.AllMobs do
		if v3 == p1 then
			return v2
		end
	end
	return nil
end
local function begin(p1, p2, p3, p4) --[[ begin | Line: 802 | Upvalues: t (ref), v1 (copy), v17 (copy) ]]
	if p3.IsBoss then
		return
	end
	local Player = p2.Player
	if Player.UserId == p1 then
		return
	end
	p3.LastToolData = p2.EquippedTool.ToolData
	if p3.IsBoss then
		return
	end
	if p3.MobType == "Fairy" then
		if not p2:HasUnlockedSpecies("Fae") then
			return
		end
	elseif not p2:HasUnlockedSpecies(p3.MobType) then
		return
	end
	for v12, v2 in t.AllMobs do
		if v12 ~= v12 and v12:get("TamingId") == Player.UserId then
			v12:_resetTamingState(true)
		end
	end
	p3:removeContributorFromAll(Player)
	local TamingStartPoints = p3.MobData.TamingStartPoints
	local v3 = p3.TamingMaxPoints or p3.MobData.TamingMaxPoints
	if p2.TutorialTameHorse then
		v3 = 1
	end
	if v1 and not p2.TutorialTameHorse then
		v17.ReportDesignEvent(Player, "HorseTame", {
			{
				Key = "Type",
				Value = "TameStarted"
			},
			{
				Key = "Success",
				Value = true
			},
			{
				Key = "Species",
				Value = p3.MobType
			}
		}, 1)
	end
	local TamingTimer = p3.MobData.TamingTimer
	local v4 = workspace:GetServerTimeNow()
	p3.TotalHits = 0
	p3.UsedLassos = {}
	p3.Contributors = {}
	p3.currentTamer = Player
	p3:set("TamingHealth", (Vector3.new(TamingStartPoints, v3, 0)))
	p3:set("TamingTimer", v4)
	p3:set("TamingTimerEnd", v4 + TamingTimer)
	p3:set("TamingTimer", v4)
	p3:set("TamingTimerEnd", v4 + TamingTimer)
	p3:set("TamingId", Player.UserId)
	p3:set("TamingType", p4)
	p3:set("TamingContributors", nil)
end
function t.RunAction(p1, p2, p3, ...) --[[ RunAction | Line: 869 | Upvalues: v8 (copy), v1 (copy), v14 (copy), v7 (copy), v13 (copy), begin (copy) ]]
	if not (p1.IsBoss and p1.Model:GetAttribute("IsGlobalBoss")) and (p1.UserWhitelist and not p1.UserWhitelist[p2]) then
		warn("Blocked by UserWhitelist check")
		return
	end
	if not v8.getWrapperFromPlayer(p2) then
		return
	end
	local v2 = v8.getWrapperFromPlayer(p2)
	if v1 and not p1.IsBoss then
		local v3 = nil
		if (if v3 then v3 else v14.IsAtPrimaryStage(v2, "TameHorse")) or v14.IsAtPrimaryStage(v2, "TutorialMissions") or v2.PlayerCohorts.NewTutorial:get() and not v14.HasCompletedPrimaryTutorial(v2) then
			v7.NotifyPlayer(p2, {
				Message = "You can\'t do this during the tutorial!",
				Preset = "Red"
			})
			return
		end
	end
	local v5 = p1:get("TamingId")
	if (p1:get("TamingTimerEnd") or -1) < workspace:GetServerTimeNow() then
		v5 = nil
	end
	local v6 = if v5 then if v5 == p2.UserId then false else true else v5
	local v72 = v2.EquippedTool and v2.EquippedTool.ToolData or nil
	local v82 = false
	if not v72 then
		return
	end
	if not p1.IsBoss then
		v82 = if v13.GetSnapChanceLimit(p1.MobData.Name, v72.Name) >= Random.new():NextNumber() then true else false
	end
	if p3 == "Begin" then
		if p1.IsBoss then
			return
		end
		if (p2.Character.PrimaryPart.Position - p1.adornee.Position).Magnitude >= 200 then
			return
		end
		if v6 then
			p1:addContributor(p2)
		else
			begin(v5, v2, p1, 1)
			p1:enterState("taming")
		end
	elseif p3 == "BeginAggro" then
		local v11 = nil
		if (if v11 then v11 else v14.IsAtPrimaryStage(v2, "TameHorse")) or v14.IsAtPrimaryStage(v2, "TutorialMissions") or v2.PlayerCohorts.NewTutorial:get() and not v14.HasCompletedPrimaryTutorial(v2) then
			if p1:_canTame(v2, v6) then
				begin(v5, v2, p1, 2)
				p1:_successfulTame(p2)
			end
		else
			if v6 then
				p1:addContributor(p2)
				return
			end
			begin(v5, v2, p1, 2)
			if p1.IsBoss then
				p1:addContributor(p2)
				p1:enterState("charge", p2.Character)
			else
				p1:enterState("tamingFleeing", p2)
			end
		end
	elseif p3 == "SuccessfulFeed" then
		if v6 or p1.IsBoss then
			p1:addContributor(p2)
		end
		if not p1:_canTame(v2, v6) then
			return
		end
		local Position = p2.Character.PrimaryPart.Position
		if (Position - p1.adornee.Position).Magnitude >= 200 then
			return
		end
		if v2.LastTame and (v2.LastTamePosition and tick() - v2.LastTame < 5) then
			if (Position * Vector3.new(1, 0, 1) - v2.LastTamePosition * Vector3.new(1, 0, 1)).Magnitude > 200 then
				v2._flaggedTeleports = (v2._flaggedTeleports or 0) + 1
			end
			v2.LastTamePosition = nil
		end
		if v2._lastFeedUsed and tick() - v2._lastFeedUsed < (v72.Cooldown or 0.5) * 0.9 then
			return
		end
		v2._lastFeedUsed = tick()
		v2._lastUsedTameItem = v72
		if v72.ItemType == "Food" then
			p1:_incrementTamingHealth(p2, p1:_getPointsForFood(v72), v72.Name, v6)
			return
		end
		if v6 and not p1.IsBoss then
			p1:enterState("tamingFleeing", p2)
		end
		p1:_incrementTamingHealth(p2, v72.Points or 1, v72.Name, not p1.IsBoss and v6, v82)
	elseif p3 == "Failure" then
		if p1:_canTame(v2, v6, true) then
			p1:_decrementTamingHealth(p2, 1, v6, v72.Name, v82)
		end
	else
		if p3 ~= "Cancel" then
			return
		end
		local isUserId = p1:get("TamingId") == p2.UserId
		if isUserId then
			p1:_resetTamingState(true)
			return
		end
		p1:removeContributorFromAll(p2)
	end
end
function t.removeContributorFromAll(p1, p2) --[[ removeContributorFromAll | Line: 1072 | Upvalues: t (ref) ]]
	for v1, v2 in t.AllMobs do
		if v1 ~= p1 and (not v1.IsBoss and (v1.Contributors and v1.Contributors[p2])) then
			v1.Contributors[p2] = nil
			v1:setContributors()
		end
	end
end
function t.setContributors(p1) --[[ setContributors | Line: 1086 ]]
	local t = {}
	for k, v in pairs(p1.Contributors) do
		t[#t + 1] = k.UserId
	end
	p1:set("TamingContributors", game:GetService("HttpService"):JSONEncode(t))
end
function t.addContributor(p1, p2) --[[ addContributor | Line: 1097 | Upvalues: v8 (copy) ]]
	if p2.UserId == p1:get("TamingId") then
		return
	end
	if p1.Contributors[p2] then
		return
	end
	p1.Contributors[p2] = 0
	local v1 = v8.getWrapperFromPlayer(p2)
	if v1 then
		v1._bossFightStats = {
			DamageDealt = 0,
			BuckedOff = 0,
			TimeTaken = 0,
			LassosLost = 0
		}
	end
	p1:removeContributorFromAll()
	p1:setContributors()
end
function t._getPointsForFood(p1, p2) --[[ _getPointsForFood | Line: 1119 | Upvalues: v4 (copy) ]]
	return math.max(1 + (p2.Rarity.Index - v4.GetRarity(p1.MobData.PreferredFoodRarity).Index), 1) + (p2.Points or 0)
end
function t._canTame(p1, p2, p3, p4) --[[ _canTame | Line: 1124 | Upvalues: v1 (copy), v2 (copy), v13 (copy) ]]
	if p3 and p4 then
		local Player = p2.Player
		if not p1.Contributors[Player] then
			return
		end
		if p1.Contributors[Player] <= 0 then
			return
		end
	end
	local ToolData = p2.EquippedTool.ToolData
	local v12 = ToolData.Name
	if not p2:HasEnoughOfItem(1, v12) then
		return
	end
	if ToolData.ItemType == "Food" and not p1.IsBoss then
		if not v1 then
			return true
		end
		local v22 = p2:GetItemValue(v12)
		v22.Value = v22.Value - 1
		return true
	elseif p1.IsBoss then
		return true
	else
		return v13.IsRequiredLasso(v2.GetByName(p1.MobData.Name).Name, v12)
	end
end
function t._incrementBossStat(p1, p2, p3, p4, p5) --[[ _incrementBossStat | Line: 1162 | Upvalues: v8 (copy) ]]
	if not (p5 or p1.IsBoss) then
		return
	end
	local v1 = v8.getWrapperFromPlayer(p2)
	if not v1 then
		return
	end
	if not v1._bossFightStats then
		return
	end
	local _bossFightStats = v1._bossFightStats
	_bossFightStats[p3] = _bossFightStats[p3] + p4
	if p3 ~= "LassosLost" then
		return
	end
	warn(p3, v1._bossFightStats[p3])
end
local function notifyLassoSnapped(p1, p2) --[[ notifyLassoSnapped | Line: 1177 | Upvalues: v20 (copy) ]]
	v20:FireClient(p1, p2.Model:GetAttribute("ID"))
end
function t._incrementTamingHealth(p1, p2, p3, p4, p5, p6) --[[ _incrementTamingHealth | Line: 1181 | Upvalues: v1 (copy), Sonar (copy), v8 (copy), v2 (copy), v4 (copy), v20 (copy) ]]
	if v1 and (p1.IsBoss and (p1.Model:GetAttribute("IsGlobalBoss") and not (p1.UserWhitelist and p1.UserWhitelist[p2]))) then
		Sonar("BossService"):AddPlayerToGlobalBoss(p2)
	end
	local v12 = v8.getWrapperFromPlayer(p2)
	local v22 = if v12 then v12:GetItemValue(p4) else nil
	local v3 = v2.GetByName(p1.MobData.Name)
	local v42 = v4.GetByName(p4)
	if not (p1.IsBoss or v3 and (v42 and v22)) then
		return
	end
	local v6 = assert(p1:get("TamingHealth"), "Attempt to increment taming health when TamingHealth=nil")
	local X = v6.X
	local Z = v6.Z
	local Y = v6.Y
	if p1.MobData.RequiredLasso and table.find(p1.MobData.RequiredLasso, p4) then
		p3 = p3 * 1.25
	end
	if p5 then
		Z = math.min(Z + p3, Y)
	else
		local v82 = math.min(X + p3, Y)
		p1.LastToolData = v42
		X = v82
	end
	p1:set("TamingHealth", (Vector3.new(X, Y, Z)))
	if v42.ToolType ~= "Lasso" then
		p4 = nil
	end
	if p4 then
		if not p1.UsedLassos[p2.Name] then
			p1.UsedLassos[p2.Name] = {}
		end
		p1.UsedLassos[p2.Name][p4] = true
	end
	if not p1.GivenRewards and (p5 or p1.IsBoss) then
		local Contributors = p1.Contributors
		Contributors[p2] = Contributors[p2] + p3
	end
	if Y <= X + Z and not (p1.IsBoss and p1.Model:GetAttribute("IsGlobalBoss")) then
		p1:_successfulTame(p2)
		return
	end
	if v42.ToolType ~= "Lasso" or not p6 then
		return
	end
	v22.Value = v22.Value - 1
	v20:FireClient(p2, p1.Model:GetAttribute("ID"))
end
function t._decrementTamingHealth(p1, p2, p3, p4, p5, p6) --[[ _decrementTamingHealth | Line: 1250 | Upvalues: v8 (copy), v4 (copy), v20 (copy) ]]
	local v1 = v8.getWrapperFromPlayer(p2)
	local v2 = if v1 then v1:GetItemValue(p5) else nil
	local v3 = v4.GetByName(p5)
	if not (v3 and v2) then
		return
	end
	local v5 = assert(p1:get("TamingHealth"), "Attempt to increment taming health when TamingHealth=nil")
	local X = v5.X
	local Z = v5.Z
	if p4 then
		Z = math.max(Z - p3, 0)
	else
		X = math.max(X - p3, 0)
	end
	p1:set("TamingHealth", (Vector3.new(X, v5.Y, Z)))
	if p4 then
		p1.Contributors[p2] = math.max(p1.Contributors[p2] - 1, 0)
	end
	if X == 0 then
		p1:_resetTamingState()
		if p2.Character then
			p1:enterState("flee", p2.Character)
		else
			p1:enterState("idle")
		end
	end
	if v3.ToolType ~= "Lasso" or not p6 then
		return
	end
	v2.Value = v2.Value - 1
	v20:FireClient(p2, p1.Model:GetAttribute("ID"))
end
function t._resetTamingState(p1, p2) --[[ _resetTamingState | Line: 1291 | Upvalues: Players (copy), v1 (copy), v17 (copy) ]]
	local v12 = p1:get("TamingId")
	local v2 = if v12 then Players:GetPlayerByUserId(v12) else nil
	p1:set("TamingId", nil)
	p1:set("TamingContributors", nil)
	p1:set("TamingHealth", nil)
	p1:set("TamingType", nil)
	p1:set("TamingTimer", nil)
	p1:set("TamingTimerEnd", nil)
	p1.UsedLassos = {}
	p1.Contributors = {}
	if p2 then
		p1:enterState("idle")
	end
	if not v1 then
		return
	end
	v17.ReportDesignEvent(v2, "HorseTame", {
		{
			Key = "Type",
			Value = "TameEnded"
		},
		{
			Key = "Success",
			Value = false
		},
		{
			Key = "Species",
			Value = p1.MobType
		}
	}, 1)
end
function t._successfulBoss(p1) --[[ _successfulBoss | Line: 1323 | Upvalues: v8 (copy), v3 (copy), Sonar (copy) ]]
	if p1.GiveRewards then
		return
	end
	p1.GivenRewards = true
	local v2 = math.floor(tick() - p1.SpawnTick)
	local Y = p1:get("TamingHealth").Y
	for v32, v4 in p1.Contributors do
		local Tier = p1.Tier
		task.spawn(function() --[[ Line: 1334 | Upvalues: v8 (ref), v32 (copy), v4 (copy), Y (copy), Tier (copy), p1 (copy), v2 (copy), v3 (ref), Sonar (ref) ]]
			local v1 = v8.getWrapperFromPlayer(v32)
			if not v1 then
				return
			end
			if not v1.LastBossRewards then
				v1.LastBossRewards = 0
			end
			if tick() - v1.LastBossRewards <= 10 then
				return
			end
			v1.LastBossRewards = tick()
			local v22 = v4 / Y
			local v42 = math.clamp(math.floor(v22 * 100), 0, 100)
			local LuckPower = v1.PlayerData.BossFight.LuckPower.Value
			local v5 = math.max(LuckPower, v22 * 100)
			v1.PlayerData.BossFight.LuckPower.Value = 0
			v1:IncrementMission({
				Type = "DefeatBoss",
				Amount = 1,
				Data = { Tier }
			})
			local NewMissionsWrapper = v1.NewMissionsWrapper
			if NewMissionsWrapper then
				NewMissionsWrapper:IncrementMission("DefeatAnyTierBoss", {
					Data = {}
				})
				NewMissionsWrapper:IncrementMission("DefeatMinimumTierBoss", {
					Data = { Tier }
				})
				NewMissionsWrapper:IncrementMission("DefeatSpecificTierBoss", {
					Data = { Tier }
				})
			end
			p1:_incrementBossStat(v1.Player, "TimeTaken", v2)
			p1:_incrementBossStat(v1.Player, "DamageDealt", v42)
			local v6 = v1:GetCurrentAnimal()
			if v6 then
				v3.GivePoints(v6.SlotValue, "BossFight")
			end
			Sonar("BossService"):CreateAndSendRewards(v1, {
				Tier = Tier,
				CustomReward = p1.CustomReward,
				DamagePercentage = v42,
				LuckPower = LuckPower,
				WeightedPercentage = v5
			})
		end)
	end
	p1._normallyDied = true
	p1.Died:Fire()
	task.defer(function() --[[ Line: 1385 | Upvalues: p1 (copy) ]]
		if p1.Destroy then
			p1:Destroy()
		end
	end)
end
function t._successfulTame(p1, p2, p3) --[[ _successfulTame | Line: 1393 | Upvalues: v1 (copy), v8 (copy), v15 (copy), v7 (copy), v2 (copy), v14 (copy), Sonar (copy), v18 (copy), v19 (copy), v17 (copy), Players (copy) ]]
	if p1.IsBoss then
		p1:_successfulBoss()
		return
	end
	if p1.Contributors[p2] and not p3 then
		p1:_successfulTame(p1.currentTamer, true)
		return
	end
	if p1.GiveRewards then
		return
	end
	p1.GivenRewards = true
	if p1.OnTameCompleted then
		p1.OnTameCompleted(p2)
	end
	if v1 then
		local Y = p1:get("TamingHealth").Y
		local UsedLassos = p1.UsedLassos
		local Contributors = p1.Contributors
		local v12 = v8.getWrapperFromPlayer(p2)
		if v12 then
			local v3 = if v12.EquippedTool then v12.EquippedTool.ToolData else nil
			local v4 = if v3 then v3 else p1.LastToolData
			local v5 = (v4.Cooldown or 0.5) * p1:get("TamingHealth").Y / (v4.Points or 1) * 0.9
			if tick() - (v12.LastTame or 0) < v5 and (p2.Character.HumanoidRootPart.Position - p1.Model.Position).Magnitude < 200 then
				return
			end
			v12.LastTame = tick()
			v12.LastTamePosition = v12.Player.Character:GetPivot().p
			if p1.Model.Name == "Fairy" then
				v12:GiveOrDropItem({
					TotalDrops = 1,
					Amount = 1,
					ApplyModifiers = true,
					Source = "Taming",
					Name = v4.Loot[v15.getRandomWeightedItem(v4.Loot)].Name,
					Position = p1.adornee.Position
				})
				v7.NotifyPlayer(p2, "TamingSuccess")
			elseif v12:CanGiveItem("Animals") then
				local v72 = v2.CreateSlot(v12, {
					DoNotParent = true
				}, p1.Model.SlotInfo)
				if v12.TutorialSameGenderTotal then
					v72.Gender.Value = v14.GetGenderFromTotalBreedable(v12)
				end
				if v12.TutorialForceAdultAge then
					v72.Age.Value = 100
				end
				v72.Parent = v12:GetItemFolder("Animals")
				v7.NotifyPlayer(p2, "TamingSuccess", v72.Name)
				local v82 = nil
				if UsedLassos and next(UsedLassos) then
					v12:IncrementStat({
						Type = "LassoTames",
						Amount = 1
					})
					v82 = true
				else
					v12:IncrementStat({
						Type = "FoodTames",
						Amount = 1
					})
				end
				v12:IncrementStat({
					Type = "Tames",
					Amount = 1
				})
				Sonar("TameContestService"):IncrementScore(v12, p1.MobType)
				Sonar("LeaderboardService"):IncrementScore(v12, "Tames", 1)
				v18.AddClubPoints(v12, 5, "Tame")
				if v19.EventName then
					local EventCurrencyName = v19.EventCurrencyName
				end
				local _ = v19.CurrentEvent and table.find(v19.CurrentEvent.SellSpecies, v72.Species.Value)
				v12:IncrementMission({
					Type = "Tame",
					Amount = 1,
					Data = { p1.MobType, v72, v12 }
				})
				local NewMissionsWrapper = v12.NewMissionsWrapper
				if NewMissionsWrapper then
					NewMissionsWrapper:IncrementMission("TameAnySpecies", {
						Data = {}
					})
					NewMissionsWrapper:IncrementMission("TameSpecificSpecies", {
						Data = { p1.MobType }
					})
				end
				if next(Contributors) then
					v12:IncrementMission({
						Type = "CoTame",
						Amount = 1,
						Data = { p1.MobType, nil, v12 }
					})
				end
				if Sonar("MutationUtils").GetMutationOfType(p1.Model.SlotInfo, "Wings") then
					v12:IncrementMission({
						Type = "TameWings",
						Amount = 1,
						Data = {}
					})
				end
				local v9 = v12:GetItemFolder("Animals")
				local Species = v72.Species.Value
				local count = 0
				for v10, v11 in v9:GetChildren() do
					if v11.Species.Value == Species then
						count = count + 1
					end
				end
				local v122 = v12:GetStatValue("PlayTime")
				if v82 then
					v17.ReportResourceEvent(p2, "Source", "HorseSlot", Species, "LassoTame", 1, {
						{
							Key = "Total",
							Value = count
						},
						{
							Key = "PlayTime",
							Value = v122.Value
						}
					})
				else
					v17.ReportResourceEvent(p2, "Source", "HorseSlot", Species, "FoodTame", 1, {
						{
							Key = "Total",
							Value = count
						},
						{
							Key = "PlayTime",
							Value = v122.Value
						}
					})
				end
			else
				v7.NotifyPlayer(p2, "MaxHorses")
			end
		end
		if UsedLassos and next(UsedLassos) then
			for v13, v142 in UsedLassos do
				local v152 = Players:FindFirstChild(v13)
				if v152 then
					local v16 = v8.getWrapperFromPlayer(v152)
					if v16 then
						for k, v in pairs(v142) do
							local v172 = v16:GetItemValue(k)
							v172.Value = math.max(0, v16:GetItemValue(k).Value - 1)
						end
					end
				end
			end
		end
		for v192, v20 in Contributors do
			local v21 = v8.getWrapperFromPlayer(v192)
			if v21 then
				local v22 = v20 / Y
				local v23 = -1
				for v24, v25 in v19.CoTameRewards do
					local v26 = tonumber(v24)
					if v26 < v22 and v23 < v26 then
						v23 = v26
					end
				end
				local v27 = if v23 then v19.CoTameRewards[tostring(v23)] else v23
				if v27 then
					v21:IncrementStat({
						Type = "CoTames",
						Amount = 1
					})
					v21:IncrementMission({
						Type = "CoTame",
						Amount = 1,
						Data = { p1.MobType, nil, v21 }
					})
					local NewMissionsWrapper = v21.NewMissionsWrapper
					if NewMissionsWrapper then
						NewMissionsWrapper:IncrementMission("TameAnySpecies", {
							Data = {}
						})
						NewMissionsWrapper:IncrementMission("TameSpecificSpecies", {
							Data = { p1.MobType }
						})
					end
					local v28 = v27[v15.getRandomWeightedItem(v27)]
					if v28.Name == "Foal" then
						if v21:CanGiveItem("Animals") then
							local v29 = v2.CreateSlot(v21, {
								DoNotParent = true,
								Age = 1,
								Species = p1.Model.SlotInfo.Species.Value,
								Preset = p1.SpawnPreset,
								Infertile = p1.Model.SlotInfo.Infertile.Value,
								Origin = p1.Model.SlotInfo.Origin.Value
							})
							v29.Parent = v21:GetItemFolder("Animals")
							v17.ReportResourceEvent(v192, "Source", "HorseSlot", p1.Model.SlotInfo.Species.Value, "CoTame", 1)
							v7.NotifyPlayer(v192, "AssistTamingSuccess", v29.Name)
							Sonar("TameContestService"):IncrementScore(v21, p1.Model.SlotInfo.Species.Value)
							Sonar("LeaderboardService"):IncrementScore(v12, "Tames", 1)
							v18.AddClubPoints(v12, 5, "Tame")
							continue
						end
						v21:GiveOrDropItem({
							Name = "Coins",
							ApplyModifiers = true,
							Source = "CoTaming",
							TotalDrops = Random.new():NextInteger(5, 10),
							Amount = v2.GetPriceForSlot(p1.Model.SlotInfo, {
								Age = 1
							}),
							Position = p1.adornee.Position
						})
						v7.NotifyPlayer(v192, "AssistTamingSuccess")
						continue
					end
					v21:GiveOrDropItem({
						ApplyModifiers = true,
						Source = "CoTaming",
						TotalDrops = Random.new():NextInteger(5, 10),
						Name = v28.Name,
						Amount = v28.Amount,
						Position = p1.adornee.Position,
						Theme = v28.Theme or "Random"
					})
					v7.NotifyPlayer(v192, "AssistTamingSuccess")
					continue
				end
				v7.NotifyPlayer(v192, "NoAssistContribution")
			end
		end
		v17.ReportDesignEvent(p2, "HorseTame", {
			{
				Key = "Type",
				Value = "TameEnded"
			},
			{
				Key = "Success",
				Value = true
			},
			{
				Key = "Species",
				Value = p1.MobType
			}
		}, 1)
	end
	p1._normallyDied = true
	p1.Died:Fire()
	task.defer(function() --[[ Line: 1674 | Upvalues: p1 (copy) ]]
		if p1.Destroy then
			p1:Destroy()
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 1683 | Upvalues: v1 (copy), t3 (copy), v25 (copy), t (ref), v8 (copy), v9 (copy) ]]
	if not v1 then
		return
	end
	local function playerAdded(p1) --[[ playerAdded | Line: 1686 | Upvalues: t3 (ref), v25 (ref) ]]
		local function filter(p1) --[[ filter | Line: 1688 | Upvalues: t3 (ref), v25 (ref) ]]
			if p1 then
				table.insert(t3, p1:WaitForChild("HumanoidRootPart"))
				v25.IncludeInstances = t3
			end
		end
		p1.CharacterAdded:Connect(filter)
		local Character = p1.Character
		if Character then
			table.insert(t3, Character:WaitForChild("HumanoidRootPart"))
			v25.IncludeInstances = t3
		end
	end
	local function playerRemoved(p1) --[[ playerRemoved | Line: 1698 | Upvalues: t (ref) ]]
		for v1, v2 in t.AllMobs do
			if v1:get("TamingId") == p1.UserId then
				v1:_resetTamingState(true)
			elseif v1.Contributors and v1.Contributors[p1] then
				v1.Contributors[p1] = nil
				v1:setContributors()
			end
			if v1.UsedLassos and v1.UsedLassos[p1.Name] then
				v1.UsedLassos[p1.Name] = nil
			end
		end
	end
	v8.bindToPlayers(playerAdded, playerRemoved)
	v9.GetRemoteEvent("MobProjectileDamageRemote").OnServerEvent:Connect(function(p1) --[[ Line: 1718 | Upvalues: v8 (ref), t (ref) ]]
		local v1 = v8.getWrapperFromPlayer(p1)
		local v2 = if v1 then v1.Character else nil
		if not v2 or (not v1:IsInAction("BossFight") or v1:IsInAction("GlobalBossFight")) then
			return
		end
		t:_decrementTool(v1, true)
	end)
	v9.GetRemoteEvent("MobBuckedOffRemote").OnServerEvent:Connect(function(p1) --[[ Line: 1729 | Upvalues: v8 (ref), t (ref) ]]
		local v1 = v8.getWrapperFromPlayer(p1)
		local v2 = if v1 then v1.Character else nil
		if not (v2 and (v1:IsInAction("BossFight") or v1:IsInAction("GlobalBossFight"))) then
			return
		end
		t:_incrementBossStat(v1.Player, "BuckedOff", 1, true)
	end)
end
t:Init()
return t