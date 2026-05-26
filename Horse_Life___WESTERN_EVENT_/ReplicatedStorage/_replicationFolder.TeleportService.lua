-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = not v1 and Sonar("TransitionClient")
local v4 = nil
local v5 = Sonar("spr")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v6 = v2.GetRemoteFunction("GetTeleportRemote")
local v7 = RaycastParams.new()
v7.ExcludeInstances = {}
v7.IgnoreWater = true
local t2 = {}
local function createGroundedPart(p1) --[[ createGroundedPart | Line: 32 ]]
	local Part = Instance.new("Part")
	Part.Size = Vector3.new(30, 1, 30)
	Part.Position = p1
	Part.CanCollide = true
	Part.CanQuery = true
	Part.Anchored = true
	Part.Transparency = 1
	Part.Parent = workspace
	return Part
end
function t.TeleportToPosition(p1, p2) --[[ TeleportToPosition | Line: 45 | Upvalues: t (copy), LocalPlayer (copy), v3 (copy), v4 (ref), v5 (copy) ]]
	t.Teleporting = true
	local v2 = p2 or {}
	local Part = Instance.new("Part")
	Part.Size = Vector3.new(1, 1, 1)
	Part.Position = p1
	Part.Anchored = true
	Part.CanCollide = false
	Part.CanQuery = false
	Part.Transparency = 1
	Part.Parent = workspace
	LocalPlayer.ReplicationFocus = Part
	pcall(function() --[[ Line: 60 | Upvalues: v2 (ref), v3 (ref), p1 (copy), v4 (ref), v5 (ref), LocalPlayer (ref) ]]
		if v2.Transition then
			v3.QuickStart()
		end
		local v1 = not v2.IgnoreGroundPart
		if v1 then
			local Part = Instance.new("Part")
			Part.Size = Vector3.new(30, 1, 30)
			Part.Position = p1
			Part.CanCollide = true
			Part.CanQuery = true
			Part.Anchored = true
			Part.Transparency = 1
			Part.Parent = workspace
			v1 = Part
		end
		local v32 = v4.GetClient():GetCurrentAnimal()
		if v32 then
			if v2.StopMovement then
				v32:StopMovement()
				v5.stop(v32.BodyGyro)
				v5.stop(v32.BodyVelocity)
			end
			if v2.PivotTo then
				local v42 = CFrame.new
				local Y = v32.Model:GetExtentsSize().Y
				LocalPlayer.Character:PivotTo(v42(p1 + Vector3.new(0, Y, 0)))
			else
				local Y = v32.Model:GetExtentsSize().Y
				LocalPlayer.Character:MoveTo(p1 + Vector3.new(0, Y, 0))
			end
			v32.BodyGyro.CFrame = CFrame.new(p1)
		elseif v2.PivotTo then
			LocalPlayer.Character:PivotTo(CFrame.new(p1))
		else
			LocalPlayer.Character:MoveTo(p1)
		end
		if v2.OnTeleported then
			v2.OnTeleported()
		end
		if v2.Transition then
			v3.QuickEnd()
		end
		if not v1 then
			return
		end
		task.delay(10, function() --[[ Line: 98 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end)
	LocalPlayer.ReplicationFocus = nil
	Part:Destroy()
	t.Teleporting = false
end
function t.IsTeleporting() --[[ IsTeleporting | Line: 111 | Upvalues: t (copy) ]]
	return t.Teleporting
end
function t.YieldForTeleportEnd() --[[ YieldForTeleportEnd | Line: 116 | Upvalues: t (copy), RunService (copy) ]]
	if not t.Teleporting then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until not t.Teleporting
end
function t.GetRandomCFrameOnPart(p1) --[[ GetRandomCFrameOnPart | Line: 125 ]]
	if p1:IsA("Model") then
		p1 = p1.Spawn
	end
	return p1.CFrame * CFrame.new(math.random(-p1.Size.X / 2, p1.Size.X / 2), 0, math.random(-p1.Size.Z / 2, p1.Size.Z / 2))
end
function t.Teleport(p1, p2) --[[ Teleport | Line: 137 | Upvalues: t2 (copy), v6 (copy), t (copy) ]]
	local v1 = if t2[p2.Type] then t2[p2.Type](p2.Target) else v6:InvokeServer(p2.Type, p2.Target)
	if v1 then
		t.TeleportToPosition(v1, p2)
		return
	end
	if not p2.OnFailed then
		return
	end
	p2.OnFailed()
end
function t.AddTeleportCallback(p1, p2, p3) --[[ AddTeleportCallback | Line: 151 | Upvalues: t2 (copy) ]]
	t2[p2] = p3
end
function t.Init(p1) --[[ Init | Line: 155 | Upvalues: v4 (ref), Sonar (copy), t (copy), v1 (copy), v6 (copy), t2 (copy) ]]
	v4 = Sonar("PlayerWrapper")
	local t3 = {}
	for v12, v2 in workspace:WaitForChild("SpawnLocations"):GetChildren() do
		if not v2:IsA("Folder") then
			table.insert(t3, v2)
		end
	end
	t:AddTeleportCallback("ToPlayer", function(p1) --[[ Line: 166 ]]
		local Character = p1.Character
		if not Character then
			return
		end
		local PrimaryPart = Character.PrimaryPart
		if PrimaryPart then
			return PrimaryPart.Position
		end
	end)
	if v1 then
		function v6.OnServerInvoke(p1, p2, ...) --[[ Line: 177 | Upvalues: t2 (ref) ]]
			return t2[p2](..., p1)
		end
		local count = 0
		for v3, v42 in t3 do
			if not v42:IsA("Folder") then
				count = count + 1
				workspace.SpawnLocations:SetAttribute("SpawnPosition" .. count, v42:GetPivot().p)
			end
		end
	end
	t:AddTeleportCallback("ToSpawn", function() --[[ Line: 189 | Upvalues: t3 (copy), t (ref) ]]
		local t2 = {}
		for v1, v2 in t3 do
			if not v2:IsA("Model") then
				table.insert(t2, v2)
			end
		end
		if #t3 > 0 then
			return t.GetRandomCFrameOnPart(t2[math.random(1, #t2)]).p
		end
		local count = 0
		local t4 = {}
		while true do
			count = count + 1
			local v3 = workspace.SpawnLocations:GetAttribute("SpawnPosition" .. count)
			if not v3 then
				break
			end
			t4[#t4 + 1] = v3
		end
		return t4[math.random(1, #t4)] + Vector3.new(0, 4, 0)
	end)
	t.TeleportRemote = v6
end
t:Init()
return t