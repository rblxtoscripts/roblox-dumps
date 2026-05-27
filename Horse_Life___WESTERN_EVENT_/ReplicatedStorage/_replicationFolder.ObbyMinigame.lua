-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("TeleportService")
local v3 = Sonar("NotificationsClient")
local v4 = Sonar("Checkpoints")
local v5 = Sonar("TimeSeedClass")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("Constants")
local v9 = v6.GetRemoteFunction("StartObbyMinigame")
local v10 = v6.GetRemoteFunction("FinishObbyMinigame")
local v11 = v6.GetRemoteFunction("CancelObbyMinigame")
local v12 = v6.GetRemoteFunction("UnequipAnimalRemote")
local LocalPlayer = Players.LocalPlayer
local v13 = v7.GetClient()
if not workspace.Terrain.MapContent:FindFirstChild("ObbyMinigame") then
	return {}
end
local ObbyMinigame = workspace.Terrain.MapContent:FindFirstChild("ObbyMinigame")
if not ObbyMinigame then
	return {}
end
local v14 = v5.new({
	Duration = 86400
})
local t2 = {
	RainbowRoad = function(p1) --[[ RainbowRoad | Line: 44 | Upvalues: LocalPlayer (copy), TweenService (copy) ]]
		for v1, v2 in p1:GetChildren() do
			if v2:IsA("BasePart") then
				local v3 = false
				v2.Touched:Connect(function(p1) --[[ Line: 50 | Upvalues: v3 (ref), LocalPlayer (ref), TweenService (ref), v2 (copy) ]]
					if v3 then
						return
					end
					if p1:IsDescendantOf(LocalPlayer.Character) then
						v3 = true
						TweenService:Create(v2, TweenInfo.new(1), {
							Transparency = 1
						}):Play()
						task.delay(1, function() --[[ Line: 58 | Upvalues: v2 (ref), TweenService (ref), v3 (ref) ]]
							v2.CanCollide = false
							task.delay(5, function() --[[ Line: 61 | Upvalues: v2 (ref), TweenService (ref), v3 (ref) ]]
								v2.CanCollide = true
								TweenService:Create(v2, TweenInfo.new(0.5), {
									Transparency = 0
								}):Play()
								task.delay(0.5, function() --[[ Line: 65 | Upvalues: v3 (ref) ]]
									v3 = false
								end)
							end)
						end)
					end
				end)
			end
		end
	end
}
local function ApplyZoneSeed(p1) --[[ ApplyZoneSeed | Line: 75 | Upvalues: ObbyMinigame (copy), t2 (copy) ]]
	for v1, v2 in ObbyMinigame.Zones:GetChildren() do
		local v3 = v2:GetChildren()
		if #v3 ~= 0 then
			local v4 = Random.new(p1 + v1):NextInteger(1, #v3)
			for v5, v6 in v3 do
				if v5 == v4 then
					v6.Parent = v2
					local v7 = t2[v6.Name]
					if v7 then
						v7(v6)
					end
					continue
				end
				v6.Parent = nil
			end
		end
	end
end
local function EndSession(p1, p2, p3) --[[ EndSession | Line: 99 | Upvalues: v11 (copy), v3 (copy) ]]
	_G.CanEquipHorses = nil
	if p2 then
		p2:Stop()
	end
	p1:DoCleaning()
	v11:InvokeServer()
	if not p3 then
		return
	end
	v3.Notify({
		Preset = "Red",
		Message = p3
	})
end
function t.new() --[[ new | Line: 114 | Upvalues: v13 (copy), v3 (copy), v9 (copy), v12 (copy), t (copy), v1 (copy), v2 (copy), ObbyMinigame (copy), v4 (copy), v10 (copy), LocalPlayer (copy), EndSession (copy), v8 (copy) ]]
	local v14 = v13:GetCurrentAnimal()
	if not v14 then
		v3.Notify({
			Message = "You must be on a horse to start the Obby.",
			Preset = "Red"
		})
		return
	end
	if v14.Flying then
		v3.Notify({
			Message = "You cannot start the Obby while flying.",
			Preset = "Red"
		})
		return
	end
	local v22, v32 = v9:InvokeServer()
	if v22 then
		local v42 = v14.SlotValue.Name
		for v5, v6 in v13.EquippedAnimalsFolder:GetChildren() do
			if v6.Name ~= v42 then
				v12:InvokeServer(v6.Name)
			end
		end
		_G.CanEquipHorses = false
		local v82 = setmetatable({}, t)
		v82.Maid = v1.new()
		v2.TeleportToPosition(ObbyMinigame.Map.StartPos.Position, {
			Transition = true,
			OnTeleported = function() --[[ OnTeleported | Line: 166 | Upvalues: v3 (ref) ]]
				v3.Notify({
					Message = "You\'ve stepped into the Valentine\'s Obby. Follow the path of hearts and claim something special!",
					Preset = "Green"
				})
			end
		})
		local Position = ObbyMinigame.Map.StartPos.Position
		local v92 = v1.new()
		v82.Maid:GiveTask(v92)
		v82.Session = v4.Start(ObbyMinigame.Checkpoints, {
			OnCheckpoint = function(p1, p2) --[[ OnCheckpoint | Line: 180 | Upvalues: v3 (ref) ]]
				v3.Notify({
					Preset = "Green",
					Message = string.format("%s/%s", p1, p2)
				})
			end,
			OnFinish = function() --[[ OnFinish | Line: 186 | Upvalues: v82 (copy), v92 (copy), v10 (ref), v3 (ref) ]]
				_G.CanEquipHorses = nil
				local Session = v82.Session
				v82.Session = nil
				v92:DoCleaning()
				local _, v1
				if not Session then
					_, v1 = v10:InvokeServer()
					v3.Notify({
						Preset = "Yellow",
						Message = string.format("You completed the Obby! +%s %s", v1, "Event Currency")
					})
					return
				end
				Session:Stop()
				_, v1 = v10:InvokeServer()
				v3.Notify({
					Preset = "Yellow",
					Message = string.format("You completed the Obby! +%s %s", v1, "Event Currency")
				})
			end
		})
		for v102, v11 in ObbyMinigame.TeleportBacks:GetChildren() do
			v92:GiveTask(v11.Touched:Connect(function(p1) --[[ Line: 206 | Upvalues: LocalPlayer (ref), v82 (copy), Position (copy), v2 (ref) ]]
				if not p1:IsDescendantOf(LocalPlayer.Character) then
					return
				end
				v2.TeleportToPosition(v82.Session and v82.Session:GetLastPosition() or Position, {
					Transition = false
				})
			end))
		end
		v92:GiveTask(v13.CurrentAnimalChangedSignal:Connect(function() --[[ Line: 213 | Upvalues: v82 (copy), v13 (ref), EndSession (ref), v92 (copy) ]]
			if not v82.Session then
				return
			end
			if not v13:GetCurrentAnimal() then
				EndSession(v92, v82.Session, "You were removed from the Obby because you dismounted your horse.")
				v82.Session = nil
			end
		end))
		local function SetupFlyingListener() --[[ SetupFlyingListener | Line: 220 | Upvalues: v92 (copy), v13 (ref), v82 (copy), EndSession (ref) ]]
			v92._flyingListener = nil
			local v1 = v13:GetCurrentAnimal()
			if v1 then
				v92._flyingListener = v1.FlyingStateChangedSignal:Connect(function() --[[ Line: 224 | Upvalues: v82 (ref), v1 (copy), EndSession (ref), v92 (ref) ]]
					if not v82.Session then
						return
					end
					if v1.Flying then
						EndSession(v92, v82.Session, "You were removed from the Obby because you started flying.")
						v82.Session = nil
					end
				end)
			end
		end
		v92:GiveTask(v13.CurrentAnimalChangedSignal:Connect(SetupFlyingListener))
		v92._flyingListener = nil
		local v122 = v13:GetCurrentAnimal()
		if v122 then
			v92._flyingListener = v122.FlyingStateChangedSignal:Connect(function() --[[ Line: 224 | Upvalues: v82 (copy), v122 (copy), EndSession (ref), v92 (copy) ]]
				if not v82.Session then
					return
				end
				if v122.Flying then
					EndSession(v92, v82.Session, "You were removed from the Obby because you started flying.")
					v82.Session = nil
				end
			end)
		end
		v92:GiveTask(v8.ResetBindable.Event:Connect(function() --[[ Line: 235 | Upvalues: v82 (copy), Position (copy), v2 (ref) ]]
			v2.TeleportToPosition(v82.Session and v82.Session:GetLastPosition() or Position, {
				Transition = false
			})
		end))
		v92:GiveTask(function() --[[ Line: 240 | Upvalues: v82 (copy) ]]
			if not v82.Session then
				return
			end
			v82.Session:Stop()
			v82.Session = nil
		end)
		return v82
	elseif v32 then
		v3.Notify({
			Preset = "Red",
			Message = string.format("You can start the Obby again in %ds.", (math.ceil(v32 + 120 - workspace:GetServerTimeNow())))
		})
	else
		v3.Notify({
			Message = "You are already in a minigame.",
			Preset = "Red"
		})
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 250 | Upvalues: v11 (copy) ]]
	_G.CanEquipHorses = nil
	p1.Maid:DoCleaning()
	v11:InvokeServer()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 257 | Upvalues: ApplyZoneSeed (copy), v14 (copy), ObbyMinigame (copy) ]]
	ApplyZoneSeed(v14.CurrentSeed)
	v14.SeedChanged:Connect(function(p1) --[[ Line: 260 | Upvalues: ApplyZoneSeed (ref) ]]
		ApplyZoneSeed(p1)
	end)
	local Checkpoints = ObbyMinigame:FindFirstChild("Checkpoints")
	if not Checkpoints then
		return
	end
	for v1, v2 in (Checkpoints:FindFirstChild("Trail") or Checkpoints):GetChildren() do
		for v3, v4 in v2:GetDescendants() do
			if v4:IsA("BasePart") then
				v4.Transparency = 1
				continue
			end
			if v4:IsA("ParticleEmitter") then
				v4.Enabled = false
				continue
			end
			if v4.Name == "DisplayGui" then
				v4.Enabled = false
			end
		end
	end
end
if v8.IsEventWorld and not v8.MainWorldIsEventWorld then
	t:Init()
end
return t