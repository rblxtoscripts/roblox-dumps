-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Signal")
local v4 = Sonar("spr")
local v5 = Sonar("ColorCorrectionUtils")
local v6 = v2.GetClient()
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v1 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.RaceData = p1
	v2.CheckpointModels = {}
	v2.UniqueCheckpointNumbers = {}
	v2.TotalCheckpoints = 0
	v2.LastCheckpointTime = 0
	v2.FinishedRace = false
	v2.LastLapEffectsEnabled = false
	v2.OnCheckpointHit = v3.new()
	v2.Maid:GiveTask(v2.OnCheckpointHit)
	v2:Setup()
	return v2
end
function t.Setup(p1) --[[ Setup | Line: 36 | Upvalues: ReplicatedStorage (copy) ]]
	local CourseFolder = p1.RaceData.CourseFolder
	if not CourseFolder then
		return
	end
	local Checkpoints = CourseFolder:FindFirstChild("Checkpoints")
	if not Checkpoints then
		return
	end
	local v1 = Checkpoints:Clone()
	v1.Parent = ReplicatedStorage
	p1.Maid:GiveTask(v1)
	p1.CheckpointsFolder = v1
	local StartPositions = CourseFolder:FindFirstChild("StartPositions")
	if StartPositions then
		p1.StartPositionsFolder = StartPositions
	end
	for v2, v3 in v1:GetChildren() do
		if not p1.CheckpointModels[v3.Name] then
			p1.CheckpointModels[v3.Name] = {}
		end
		table.insert(p1.CheckpointModels[v3.Name], v3)
		local v6 = tonumber(v3.Name)
		if v6 and not p1.UniqueCheckpointNumbers[v6] then
			p1.UniqueCheckpointNumbers[v6] = true
		end
	end
	for v7 in p1.UniqueCheckpointNumbers do
		p1.TotalCheckpoints = p1.TotalCheckpoints + 1
	end
	p1:SetupTouchHandlers()
end
function t.SetupTouchHandlers(p1) --[[ SetupTouchHandlers | Line: 76 | Upvalues: v6 (copy) ]]
	for v1, v2 in p1.CheckpointModels do
		for v3, v4 in v2 do
			if not v4.PrimaryPart then
				local RaceRing = v4:FindFirstChild("RaceRing")
				if RaceRing then
					v4.PrimaryPart = RaceRing
				end
			end
			if v4.PrimaryPart then
				p1.Maid:GiveTask(v4.PrimaryPart.Touched:Connect(function(p12) --[[ Line: 87 | Upvalues: p1 (copy), v6 (ref), v4 (copy) ]]
					if p1.FinishedRace then
						return
					end
					if tick() - p1.LastCheckpointTime < 0.5 then
						return
					end
					if not v6:IsInAction("Race") then
						return
					end
					if not p1:IsCurrentCheckpoint(v4.Name) then
						return
					end
					local v1 = v6:GetCurrentAnimal()
					if not v1 then
						return
					end
					if not p12:IsDescendantOf(v1.Model) then
						return
					end
					p1.LastCheckpointTime = tick()
					p1.OnCheckpointHit:Fire(if v4.Name == "Finish" then p1.TotalCheckpoints else tonumber(v4.Name))
				end))
			end
		end
	end
end
function t.IsCurrentCheckpoint(p1, p2) --[[ IsCurrentCheckpoint | Line: 128 ]]
	if p1.FinishedRace then
		return false
	end
	local CurrentCheckpointValue = p1.RaceData.CurrentCheckpointValue.Value
	local v1 = if p1.RaceData.CurrentLapValue.Value + 1 == p1.RaceData.Laps then true else false
	if v1 and (if CurrentCheckpointValue == p1.TotalCheckpoints then true else false) then
		return p2 == "Finish"
	else
		return tonumber(p2) == CurrentCheckpointValue
	end
end
function t.UpdateVisibility(p1) --[[ UpdateVisibility | Line: 145 | Upvalues: v4 (copy), ReplicatedStorage (copy) ]]
	for v1, v2 in p1.CheckpointModels do
		local v3 = p1:IsCurrentCheckpoint(v1)
		for v42, v5 in v2 do
			if v3 then
				local v6 = v5:GetScale()
				v5:ScaleTo(v6 + 5)
				v4.target(v5, 0.8, 2, {
					Scale = v6
				})
				v5.Parent = workspace.CurrentCamera
				continue
			end
			v5.Parent = ReplicatedStorage
		end
	end
	if p1.RaceData.CurrentLapValue.Value + 1 ~= p1.RaceData.Laps or not (p1.TotalCheckpoints - 2 <= p1.RaceData.CurrentCheckpointValue.Value) then
		return
	end
	p1:SetLastLapEffects(true)
end
function t.SetLastLapEffects(p1, p2) --[[ SetLastLapEffects | Line: 172 ]]
	if p1.LastLapEffectsEnabled == p2 then
		return
	end
	p1.LastLapEffectsEnabled = p2
	if not (p1.RaceData.MapFolder and p1.RaceData.MapFolder:FindFirstChild("FinalLap")) then
		return
	end
	for v1, v2 in p1.RaceData.MapFolder.FinalLap:GetDescendants() do
		if v2:IsA("Sound") then
			if p2 then
				v2:Play()
				continue
			end
			v2:Stop()
			continue
		end
		if v2:IsA("ParticleEmitter") or v2:IsA("Beam") then
			v2.Enabled = p2
		end
	end
end
function t.SetFinished(p1) --[[ SetFinished | Line: 193 ]]
	p1.FinishedRace = true
	p1:UpdateVisibility()
end
function t.GetStartPart(p1, p2) --[[ GetStartPart | Line: 198 ]]
	if p1.StartPositionsFolder then
		return p1.StartPositionsFolder:FindFirstChild((tostring(p2)))
	else
		return nil
	end
end
function t.GetFirstCheckpoint(p1) --[[ GetFirstCheckpoint | Line: 205 ]]
	local v1 = p1.CheckpointModels["1"]
	if v1 and v1[1] then
		return v1[1]
	else
		return nil
	end
end
function t.GetCheckpointPosition(p1, p2) --[[ GetCheckpointPosition | Line: 213 ]]
	local v1 = p1.CheckpointModels[tostring(p2)]
	if v1 and (v1[1] and v1[1].PrimaryPart) then
		return v1[1].PrimaryPart.Position
	else
		return nil
	end
end
function t.PlayCheckpointEffect(p1) --[[ PlayCheckpointEffect | Line: 221 | Upvalues: v5 (copy), ReplicatedStorage (copy) ]]
	v5:Tween()
	ReplicatedStorage.WorldStorage.RaceSounds.TouchSound:Play()
	ReplicatedStorage.Storage.SFX.QuestComplete1:Play()
end
function t.Cleanup(p1) --[[ Cleanup | Line: 228 | Upvalues: ReplicatedStorage (copy) ]]
	if not p1.CheckpointModels then
		return
	end
	for v1, v2 in p1.CheckpointModels do
		for v3, v4 in v2 do
			if v4.Parent == workspace.CurrentCamera then
				v4.Parent = ReplicatedStorage
			end
		end
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 240 ]]
	p1:SetLastLapEffects(false)
	p1:Cleanup()
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
return t