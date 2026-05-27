-- https://lua.expert/
local t = {
	_ActiveTrail = nil
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TeleportService")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("GuiManager")
local v4 = Sonar("TrailClientInstance")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("TrailConfigs")
local v7 = v5.GetRemoteEvent("TrailStateUpdate")
local v8 = v5.GetRemoteEvent("TrailCreate")
local AvailableTrails = v6.AvailableTrails
local TrailStateEnums = v6.TrailStateEnums
local v9 = v2.GetClient()
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local function getPromptLabel(p1) --[[ getPromptLabel | Line: 35 ]]
	local QueueZone = p1:WaitForChild("QueueZone", 5)
	if not QueueZone then
		return nil
	end
	local QueueGui = QueueZone:FindFirstChild("QueueGui")
	if QueueGui then
		return QueueGui:FindFirstChild("PromptLabel")
	else
		return nil
	end
end
local function watchStartZoneClone(p1) --[[ watchStartZoneClone | Line: 48 ]]
	local QueueZone = p1:WaitForChild("QueueZone", 5)
	local v1
	if QueueZone then
		local QueueGui = QueueZone:FindFirstChild("QueueGui")
		v1 = if QueueGui then QueueGui:FindFirstChild("PromptLabel") else nil
	else
		v1 = nil
	end
	if not v1 then
		return
	end
	local function updatePromptLabel() --[[ updatePromptLabel | Line: 54 | Upvalues: p1 (copy), v1 (copy) ]]
		local v12 = p1:GetAttribute("TrailStandRemaining")
		if type(v12) == "number" and not (v12 < 0) then
			v1.Text = ("Trail starts in %*s"):format((math.ceil(v12)))
		else
			v1.Text = "1 player(s) required"
		end
	end
	p1:GetAttributeChangedSignal("TrailStandRemaining"):Connect(updatePromptLabel)
	local v2 = p1:GetAttribute("TrailStandRemaining")
	if type(v2) == "number" and not (v2 < 0) then
		v1.Text = ("Trail starts in %*s"):format((math.ceil(v2)))
	else
		v1.Text = "1 player(s) required"
	end
end
local function watchStartZonesFolder(p1) --[[ watchStartZonesFolder | Line: 67 | Upvalues: watchStartZoneClone (copy) ]]
	p1.ChildAdded:Connect(watchStartZoneClone)
	for v1, v2 in p1:GetChildren() do
		watchStartZoneClone(v2)
	end
end
local function getLocalPlayerRaceValues() --[[ getLocalPlayerRaceValues | Line: 74 | Upvalues: v9 (copy) ]]
	local Races = v9.SettingsFolder:WaitForChild("Races", 10)
	if not Races then
		warn("local player race values folder not found")
		return nil
	end
	local Checkpoint = Races:WaitForChild("Checkpoint", 10)
	local Lap = Races:WaitForChild("Lap", 10)
	if Lap and Checkpoint then
		return {
			RaceLap = Lap,
			Checkpoint = Checkpoint
		}
	else
		warn("local player race values not found")
		return nil
	end
end
function t.GetActiveTrail() --[[ GetActiveTrail | Line: 92 | Upvalues: t (copy) ]]
	return t._ActiveTrail
end
function t.IsPlayerInTrail(p1) --[[ IsPlayerInTrail | Line: 96 | Upvalues: t (copy) ]]
	local v1 = t.GetActiveTrail()
	if v1 then
		return v1:IsPlayerInRace(p1)
	else
		return false
	end
end
function t.ClearActiveTrail() --[[ ClearActiveTrail | Line: 104 | Upvalues: t (copy) ]]
	local v1 = t.GetActiveTrail()
	if v1 then
		t._ActiveTrail = nil
		v1:Destroy()
	end
end
function t._createTrail(p1) --[[ _createTrail | Line: 113 | Upvalues: t (copy), AvailableTrails (copy), getLocalPlayerRaceValues (copy), v4 (copy) ]]
	if type(p1) ~= "table" then
		return
	end
	local v1 = t.GetActiveTrail()
	if v1 and v1.TrailId == p1.TrailId then
		return
	end
	t.ClearActiveTrail()
	local v2 = AvailableTrails[p1.Trail]
	if not v2 then
		warn("could not find trail config to start trail with: ", p1.Trail)
		return
	end
	local v3 = getLocalPlayerRaceValues()
	if v3 then
		t._ActiveTrail = v4.new(p1.TrailId, v2, v3)
	end
end
function t.Init() --[[ Init | Line: 135 | Upvalues: TrailStateEnums (copy), t (copy), v1 (copy), v3 (copy), PlayerGui (copy), v8 (copy), v7 (copy), watchStartZoneClone (copy) ]]
	local t2 = {
		[TrailStateEnums.COUNTDOWN] = function(p1, p2) --[[ Line: 137 ]]
			p1:EnterCountdownState(p2)
		end,
		[TrailStateEnums.RACING] = function(p1, p2) --[[ Line: 140 ]]
			p1:EnterRacingState(p2)
		end,
		[TrailStateEnums.COMPLETE] = function(p1, p2) --[[ Line: 143 ]]
			p1:EnterCompleteState(p2)
		end,
		[TrailStateEnums.CLEANINGUP] = function(p1, p2) --[[ Line: 146 | Upvalues: t (ref) ]]
			p1:EnterCleaningupState(p2)
			t.ClearActiveTrail()
		end
	}
	v1:AddTeleportCallback("ToLastCheckpoint", function() --[[ Line: 152 | Upvalues: t (ref) ]]
		local v1 = t.GetActiveTrail()
		if not v1 then
			return Vector3.new(0, 0, 0)
		end
		local v2 = v1.LocalRaceValues.Checkpoint.Value - 1
		if v2 > 0 then
			local v3 = v1.Checkpoints:GetCheckpointPosition(v2)
			if v3 then
				return v3
			end
		end
		local v4 = v1.Checkpoints:GetStartPart(1)
		return if v4 then v4.Position or Vector3.new(0, 0, 0) else Vector3.new(0, 0, 0)
	end)
	v3.AddFrame(PlayerGui:WaitForChild("RacesGui"):WaitForChild("RaceFrame"), {
		HUD = true,
		KeepPosition = true,
		TweenAnimation = false,
		CheckVisibility = function() --[[ CheckVisibility | Line: 172 | Upvalues: t (ref) ]]
			local v1 = t.GetActiveTrail()
			return v1 and not v1.IsDestroyed and true or false
		end
	})
	v8.OnClientEvent:Connect(t._createTrail)
	v7.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 182 | Upvalues: t (ref), t2 (copy) ]]
		local v1 = t.GetActiveTrail()
		if not v1 or (v1.TrailId ~= p1 or v1.IsDestroyed) then
			return
		end
		local v2 = t2[p2]
		if v2 then
			v2(v1, p3)
		else
			warn("invalid trail state passed without handler: ", p2)
		end
	end)
	local TrailStartZones = workspace:FindFirstChild("TrailStartZones")
	if TrailStartZones then
		TrailStartZones.ChildAdded:Connect(watchStartZoneClone)
		for v12, v2 in TrailStartZones:GetChildren() do
			watchStartZoneClone(v2)
		end
	end
	workspace.ChildAdded:Connect(function(p1) --[[ Line: 199 | Upvalues: watchStartZoneClone (ref) ]]
		if p1.Name ~= "TrailStartZones" then
			return
		end
		p1.ChildAdded:Connect(watchStartZoneClone)
		for v1, v2 in p1:GetChildren() do
			watchStartZoneClone(v2)
		end
	end)
end
t.Init()
return t