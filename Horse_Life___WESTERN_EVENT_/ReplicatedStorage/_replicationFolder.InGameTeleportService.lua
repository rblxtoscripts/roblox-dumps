-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("GuiFrameworkService", "Client")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("ResetCallbackService", "Client")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("Signal")
local v7 = RunService:IsServer()
local v8 = v3.GetConfig("InGameTeleport")()
local GroundedPartCleanupWait = v8.GroundedPartCleanupWait
local RaycastDownVector = v8.RaycastDownVector
local MaxAttemptsToFindStreamedInstance = v8.MaxAttemptsToFindStreamedInstance
local CameraBehindCharacterPitchOffset = v8.CameraBehindCharacterPitchOffset
local LocalPlayer = game:GetService("Players").LocalPlayer
local v9 = LocalPlayer and v5.GetClient()
local v10 = v1.GetRemoteFunction("GetTeleportRemote")
local v11 = RaycastParams.new()
v11.IncludeInstances = v8.StreamingCatchWhitelist
v11.IgnoreWater = true
local v12 = v6.new()
local v13 = v6.new()
local t2 = {}
local v14 = false
local CurrentCamera = workspace.CurrentCamera
local function waitForStreamedPart(p1) --[[ waitForStreamedPart | Line: 106 | Upvalues: MaxAttemptsToFindStreamedInstance (copy), RaycastDownVector (copy), v11 (copy) ]]
	local count = 0
	local v1 = nil
	while count < MaxAttemptsToFindStreamedInstance and not v1 do
		local v2 = workspace:Raycast(p1.Position, RaycastDownVector, v11)
		local v3 = if v2 and (v2.Instance and v2.Instance.CanCollide) then true else nil
		task.wait()
		count, v1 = count + 1, v3
	end
end
local function createGroundedPart(p1) --[[ createGroundedPart | Line: 117 ]]
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
local function setCameraBehindCharacter(p1) --[[ setCameraBehindCharacter | Line: 129 | Upvalues: CurrentCamera (copy), CameraBehindCharacterPitchOffset (copy) ]]
	CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position) * p1.CFrame.Rotation * CFrame.Angles(math.rad(CameraBehindCharacterPitchOffset), 0, 0)
end
local function setCharacterAnchored(p1, p2) --[[ setCharacterAnchored | Line: 133 ]]
	p1.Anchored = p2
	p1.Velocity = Vector3.new(0, 0, 0)
end
function t.IsTeleporting() --[[ IsTeleporting | Line: 138 | Upvalues: v14 (ref) ]]
	return v14
end
function t.YieldForTeleportEnd() --[[ YieldForTeleportEnd | Line: 142 | Upvalues: v14 (ref) ]]
	while v14 do
		task.wait()
	end
end
function t.GetRandomCFrameOnPart(p1) --[[ GetRandomCFrameOnPart | Line: 148 ]]
	return p1.CFrame * CFrame.new(math.random(-p1.Size.X / 2, p1.Size.X / 2), 0, math.random(-p1.Size.Z / 2, p1.Size.Z / 2))
end
function t.Teleport(p1, p2) --[[ Teleport | Line: 156 | Upvalues: t2 (copy), v10 (copy), v14 (ref), v9 (copy), v12 (copy), setCameraBehindCharacter (copy), LocalPlayer (copy), waitForStreamedPart (copy), GroundedPartCleanupWait (copy), v13 (copy), v2 (copy) ]]
	local v1 = p2.Position or (t2[p2.Type] and t2[p2.Type](p2.Target) or v10:InvokeServer(p2.Type, p2.Target))
	if not v1 or v14 then
		return
	end
	local v3 = typeof(v1) == "Vector3" and CFrame.new(v1) or v1
	local v4 = v9:GetCharacter()
	local v5 = v9:GetHumanoid()
	local v6 = v4 and v4.PrimaryPart
	if not (v4 and v6) then
		return
	end
	v14 = true
	local v8 = p2 or {}
	local v92 = not v8.IgnoreGroundPart
	if v92 then
		local Part = Instance.new("Part")
		Part.Size = Vector3.new(30, 1, 30)
		Part.Position = v3.Position
		Part.CanCollide = true
		Part.CanQuery = true
		Part.Anchored = true
		Part.Transparency = 1
		Part.Parent = workspace
		v92 = Part
	end
	local function handleTeleport() --[[ handleTeleport | Line: 178 | Upvalues: v12 (ref), v8 (ref), v3 (ref), v9 (ref), v6 (copy), v5 (copy), v4 (copy), setCameraBehindCharacter (ref), LocalPlayer (ref), waitForStreamedPart (ref) ]]
		v12:Fire(v8, v3)
		v9:ExitSeat()
		local v1 = v6
		v1.Anchored = true
		v1.Velocity = Vector3.new(0, 0, 0)
		if v8.Pivot then
			local v2 = v5 and v5.HipHeight + v6.Size.Y / 2 or v4:GetExtentsSize().Y / 2
			v3 = v3 + Vector3.new(0, v2, 0)
			v4:PivotTo(v3 + Vector3.new(0, v2, 0))
		else
			v4:MoveTo(v3.Position)
			v6.CFrame = CFrame.new(v6.Position) * v3.Rotation
		end
		task.defer(setCameraBehindCharacter, v6)
		if v8.OnTeleported then
			local v32, v42 = pcall(v8.OnTeleported)
			if not v32 then
				warn("\226\154\160\239\184\143 InGameTeleportService, Error in OnTeleported callback:", v42)
			end
		end
		if not workspace.StreamingEnabled then
			task.defer(function() --[[ Line: 212 | Upvalues: waitForStreamedPart (ref), v6 (ref) ]]
				waitForStreamedPart(v6)
				local v1 = v6
				v1.Anchored = false
				v1.Velocity = Vector3.new(0, 0, 0)
			end)
			task.wait()
			return
		end
		LocalPlayer:RequestStreamAroundAsync(v3.Position, 5)
		task.defer(function() --[[ Line: 212 | Upvalues: waitForStreamedPart (ref), v6 (ref) ]]
			waitForStreamedPart(v6)
			local v1 = v6
			v1.Anchored = false
			v1.Velocity = Vector3.new(0, 0, 0)
		end)
		task.wait()
	end
	local function handleCompletion() --[[ handleCompletion | Line: 219 | Upvalues: v92 (copy), GroundedPartCleanupWait (ref), v14 (ref), v13 (ref), v8 (ref), v3 (ref) ]]
		if v92 then
			task.delay(GroundedPartCleanupWait, function() --[[ Line: 221 | Upvalues: v92 (ref) ]]
				v92:Destroy()
			end)
		end
		v14 = false
		v13:Fire(v8, v3)
	end
	if v8.Transition then
		v2.PlayTransition({
			Preset = v8.Transition or "Quick",
			OnTransition = handleTeleport,
			OnComplete = handleCompletion
		})
	else
		handleTeleport()
		if v92 then
			task.delay(GroundedPartCleanupWait, function() --[[ Line: 221 | Upvalues: v92 (copy) ]]
				v92:Destroy()
			end)
		end
		v14 = false
		v13:Fire(v8, v3)
	end
end
function t.AddTeleportCallback(p1, p2, p3) --[[ AddTeleportCallback | Line: 242 | Upvalues: t2 (copy) ]]
	t2[p2] = p3
end
function t.GetTeleportBeganSignal(p1) --[[ GetTeleportBeganSignal | Line: 248 | Upvalues: v12 (copy) ]]
	return v12
end
function t.GetTeleportEndedSignal(p1) --[[ GetTeleportEndedSignal | Line: 254 | Upvalues: v13 (copy) ]]
	return v13
end
function t.Init(p1) --[[ Init | Line: 258 | Upvalues: t (copy), v7 (copy), v10 (copy), t2 (copy), v8 (copy), v4 (copy) ]]
	t:AddTeleportCallback("ToPlayer", function(p1) --[[ Line: 259 ]]
		local Character = p1.Character
		if not Character then
			return
		end
		local PrimaryPart = Character.PrimaryPart
		if PrimaryPart then
			return PrimaryPart.Position
		end
	end)
	if v7 then
		function v10.OnServerInvoke(p1, p2, ...) --[[ Line: 270 | Upvalues: t2 (ref) ]]
			return t2[p2](..., p1)
		end
	else
		if not v8.TeleportOnReset then
			t:AddTeleportCallback("ToSpawn", function() --[[ Line: 281 | Upvalues: t (ref) ]]
				local SpawnLocations = workspace:FindFirstChild("SpawnLocations", true)
				if not SpawnLocations then
					warn("\226\154\160\239\184\143 InGameTeleportService, SpawnLocations folder not found in Environment")
					return nil
				end
				local t2 = {}
				local function v1(p1_2) --[[ collectSpawns | Line: 291 | Upvalues: t2 (copy), v1 (copy) ]]
					for v12, v2 in p1_2:GetChildren() do
						if v2:IsA("SpawnLocation") or v2:IsA("BasePart") then
							table.insert(t2, v2)
							continue
						end
						if #v2:GetChildren() > 0 then
							v1(v2)
						end
					end
				end
				v1(SpawnLocations)
				if #t2 == 0 then
					warn("\226\154\160\239\184\143 InGameTeleportService, No spawn locations found in Environment/SpawnLocations")
					return nil
				else
					return t.GetRandomCFrameOnPart(t2[math.random(1, #t2)]).p
				end
			end)
			return
		end
		v4.SetDefaultCallback(function() --[[ Line: 275 | Upvalues: t (ref), v8 (ref) ]]
			t:Teleport(v8.TeleportOnReset)
		end)
	end
	t:AddTeleportCallback("ToSpawn", function() --[[ Line: 281 | Upvalues: t (ref) ]]
		local SpawnLocations = workspace:FindFirstChild("SpawnLocations", true)
		if not SpawnLocations then
			warn("\226\154\160\239\184\143 InGameTeleportService, SpawnLocations folder not found in Environment")
			return nil
		end
		local t2 = {}
		local function v1(p1_2) --[[ collectSpawns | Line: 291 | Upvalues: t2 (copy), v1 (copy) ]]
			for v12, v2 in p1_2:GetChildren() do
				if v2:IsA("SpawnLocation") or v2:IsA("BasePart") then
					table.insert(t2, v2)
					continue
				end
				if #v2:GetChildren() > 0 then
					v1(v2)
				end
			end
		end
		v1(SpawnLocations)
		if #t2 == 0 then
			warn("\226\154\160\239\184\143 InGameTeleportService, No spawn locations found in Environment/SpawnLocations")
			return nil
		else
			return t.GetRandomCFrameOnPart(t2[math.random(1, #t2)]).p
		end
	end)
end
t:Init()
return t