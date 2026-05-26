-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("ServerCharacter", "Server")
local IS_SERVER = Sonar("Constants").IS_SERVER
local v5 = v3.GetUnreliableRemoteEvent("ReplicateProjectileRemote")
local t2 = {}
local t3 = {
	Spin = function(p1, p2) --[[ Spin | Line: 83 ]]
		p1.CFrame = p1.CFrame * CFrame.Angles(0, 0, 18.84955592153876 * p2)
	end
}
function t.Create(p1, p2) --[[ Create | Line: 89 | Upvalues: v4 (copy), v5 (copy) ]]
	for v1, v2 in v4.CharacterOctree:RadiusSearch(p2.StartPosition, 1000) do
		v5:FireClient(v2.Player, p1, p2)
	end
end
function t.new(p1, p2) --[[ new | Line: 97 | Upvalues: t (copy), v1 (copy), t2 (copy), t3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Type = p1
	v2.Props = p2
	v2.Data = t2[p1]
	local v3 = p2.Speed or v2.Data.Speed or 50
	v2.Speed = if v3 and v3 > 0 then v3 else 50
	v2.OnHit = v2.Data.OnClientHit
	v2.StartPosition = p2.StartPosition
	v2.EndPosition = p2.EndPosition
	v2.Direction = p2.Direction
	v2.LaunchAngle = p2.LaunchAngle
	v2.DeleteOnGoalReached = p2.DeleteOnGoalReached or v2.Data.DeleteOnGoalReached or false
	local v6 = p2.Effect or v2.Data.Effect
	v2.Effect = if type(v6) == "string" then t3[v6] else v6
	v2.MaxTravelDistance = v2.Data.MaxTravelDistance or 1000
	v2.Lifetime = p2.Lifetime or v2.Data.Lifetime or 10
	v2.ElapsedTime = 0
	v2.PreviousPosition = v2.StartPosition
	v2.ReachedEndFired = false
	v2.Fired = false
	if v2.EndPosition then
		local v9 = v2.EndPosition - v2.StartPosition
		local v10 = Vector3.new(v9.X, 0, v9.Z)
		local Magnitude = v10.Magnitude
		local v122 = Vector3.new(0, -workspace.Gravity, 0)
		if v2.LaunchAngle and Magnitude > 0 then
			local v13 = math.rad(v2.LaunchAngle)
			local v14 = v10.Unit * (v2.Speed * math.cos(v13))
			v2.ArcVelocity = v14 + Vector3.new(0, v2.Speed * math.sin(v13), 0)
			v2.ArcGravityVec = v122
			v2.ArcTimeOfFlight = Magnitude / (v2.Speed * math.cos(v13))
		end
		if not v2.ArcTimeOfFlight then
			v2.TotalDistance = v9.Magnitude
			v2.PathDirectionUnit = v9.Unit
		end
	end
	if not p2.Deferred then
		v2:Fire()
	end
	return v2
end
function t.Telegraph(p1) --[[ Telegraph | Line: 156 ]]
	if not p1.Data.OnClientTelegraph then
		return
	end
	p1.Data.OnClientTelegraph(p1)
end
function t.Fire(p1) --[[ Fire | Line: 163 | Upvalues: RunService (copy) ]]
	if p1.Fired then
		return
	end
	p1.Fired = true
	p1.Part = p1.Data.BulletCreator()
	p1.Part:PivotTo(CFrame.new(p1.StartPosition))
	p1.Part.Parent = workspace
	p1.Maid:GiveTask(p1.Part)
	if p1.Data.OnClientStart then
		p1.Data.OnClientStart(p1)
		if not p1.Maid then
			return
		end
	end
	p1.Maid:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 181 | Upvalues: p1 (copy) ]]
		p1:Tick(p12)
	end))
end
function t.Destroy(p1) --[[ Destroy | Line: 187 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t.Tick(p1, p2) --[[ Tick | Line: 192 | Upvalues: v5 (copy) ]]
	p1.ElapsedTime = p1.ElapsedTime + p2
	local v1 = p1.Speed * p1.ElapsedTime
	local v2 = false
	local v3 = false
	local v4
	if p1.Direction then
		v4 = p1.StartPosition + p1.Direction.Unit * (if p1.MaxTravelDistance then math.min(v1, p1.MaxTravelDistance) else v1)
		if p1.MaxTravelDistance and (if p1.MaxTravelDistance <= v1 then true else false) or p1.Lifetime and (if p1.ElapsedTime >= p1.Lifetime then true else false) then
			v2 = true
		end
	else
		if p1.Lifetime and p1.ElapsedTime >= p1.Lifetime then
			v2 = true
		end
		if p1.ArcTimeOfFlight then
			local ElapsedTime = p1.ElapsedTime
			v4 = p1.StartPosition + p1.ArcVelocity * ElapsedTime + 0.5 * p1.ArcGravityVec * (ElapsedTime * ElapsedTime)
			if p1.ArcTimeOfFlight <= ElapsedTime then
				v3 = true
				if p1.DeleteOnGoalReached then
					v2 = true
				end
			end
		else
			if p1.TotalDistance == 0 then
				p1:Destroy()
				return
			end
			v4 = p1.StartPosition + p1.PathDirectionUnit * v1
			if p1.TotalDistance <= v1 then
				v3 = true
				if p1.DeleteOnGoalReached then
					v2 = true
				end
			end
		end
	end
	if v3 and not p1.ReachedEndFired then
		p1.ReachedEndFired = true
		if p1.Data.OnClientReachedEnd then
			p1.Data.OnClientReachedEnd(p1)
		end
		if not p1.Maid then
			return
		end
	end
	local v9 = v4 - p1.PreviousPosition
	if v9.Magnitude > 0 then
		local v10 = RaycastParams.new()
		v10.IncludeInstances = { workspace.Characters }
		local v11 = workspace:Raycast(p1.PreviousPosition, v9, v10)
		if v11 then
			local v12
			if p1.OnHit then
				local v13 = p1.OnHit(v11.Instance)
				if not p1.Maid then
					return
				end
				if if v13 then p1.Data.OnServerHit else v13 then
					v5:FireServer(p1.Type)
				end
				v12 = v13
			else
				v12 = true
			end
			if v12 then
				p1:Destroy()
				return
			end
		end
	end
	p1.Part.Position = v4
	p1.PreviousPosition = v4
	if p1.Effect then
		p1.Effect(p1.Part, p2)
	end
	if not v2 then
		return
	end
	p1:Destroy()
end
function t.RegisterProjectile(p1, p2) --[[ RegisterProjectile | Line: 293 | Upvalues: t2 (copy) ]]
	t2[p1] = p2
end
function t.GetData(p1) --[[ GetData | Line: 298 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.ComputeArcTimeOfFlight(p1, p2, p3, p4) --[[ ComputeArcTimeOfFlight | Line: 303 ]]
	if not (p1 and (p2 and (p3 and p4))) then
		return nil
	end
	if p3 <= 0 then
		return nil
	end
	local v1 = p2 - p1
	local Magnitude = Vector3.new(v1.X, 0, v1.Z).Magnitude
	if Magnitude <= 0 then
		return nil
	end
	local v3 = math.cos((math.rad(p4)))
	if v3 == 0 then
		return nil
	else
		return Magnitude / (p3 * v3)
	end
end
function t._initServer(p1) --[[ _initServer | Line: 328 | Upvalues: v5 (copy), t2 (copy) ]]
	v5.OnServerEvent:Connect(function(p1, p2) --[[ Line: 329 | Upvalues: t2 (ref) ]]
		t2[p2].OnServerHit(p1)
	end)
end
function t._initClient(p1) --[[ _initClient | Line: 335 | Upvalues: v5 (copy), t (copy) ]]
	v5.OnClientEvent:Connect(function(p1, p2) --[[ Line: 336 | Upvalues: t (ref) ]]
		t.new(p1, p2)
	end)
end
function t.Init(p1) --[[ Init | Line: 341 | Upvalues: IS_SERVER (copy) ]]
	if IS_SERVER then
		p1:_initServer()
	else
		p1:_initClient()
	end
end
t:Init()
return t