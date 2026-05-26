-- https://lua.expert/
local t = {
	_ActiveRace = nil
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require((ReplicatedStorage:WaitForChild("Sonar")))
local v1 = Sonar("TeleportService")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("GuiManager")
local v5 = Sonar("RaceClientInstance")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("RaceConfigs")
RunService:IsStudio()
local v8 = v6.GetRemoteFunction("NewRaceRemoteFunction")
local v9 = v6.GetRemoteEvent("NewRaceStateUpdate")
local v10 = v6.GetRemoteEvent("CreateClientRace")
local AvailableTracks = v7.AvailableTracks
local RaceStateEnums = v7.RaceStateEnums
local v11 = v2.GetClient()
local RacesGui = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RacesGui")
local RaceFrame = RacesGui:WaitForChild("RaceFrame")
local RewardFrame = RacesGui:WaitForChild("RewardFrame")
local function getLocalPlayerRaceValues() --[[ getLocalPlayerRaceValues | Line: 72 | Upvalues: v11 (copy) ]]
	local Races = v11.SettingsFolder:WaitForChild("Races", 10)
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
function t.GetActiveRace() --[[ GetActiveRace | Line: 89 | Upvalues: t (copy) ]]
	return t._ActiveRace
end
function t.IsPlayerInRace(p1) --[[ IsPlayerInRace | Line: 92 | Upvalues: t (copy) ]]
	local v1 = t.GetActiveRace()
	if v1 then
		return v1:IsPlayerInRace(p1)
	else
		return false
	end
end
function t.ClearActiveRace() --[[ ClearActiveRace | Line: 100 | Upvalues: t (copy) ]]
	local v1 = t.GetActiveRace()
	if v1 then
		t._ActiveRace = nil
		v1:Destroy()
	end
end
function t._createRace(p1) --[[ _createRace | Line: 109 | Upvalues: t (copy), AvailableTracks (copy), getLocalPlayerRaceValues (copy), v5 (copy) ]]
	local v1 = t.GetActiveRace()
	if v1 and v1.RaceId == p1.RaceId then
		return
	end
	t.ClearActiveRace()
	local v2 = AvailableTracks[p1.Track]
	if not v2 then
		warn("could not find track config to start race with: ", p1.Track)
		return
	end
	local v3 = getLocalPlayerRaceValues()
	if v3 then
		t._ActiveRace = v5.new(p1.RaceId, p1.Racers, v2, v3)
	end
end
function t.Init() --[[ Init | Line: 126 | Upvalues: RaceStateEnums (copy), t (copy), v1 (copy), v3 (copy), RewardFrame (copy), v8 (copy), v4 (copy), RaceFrame (copy), v10 (copy), v9 (copy) ]]
	local t2 = {
		[RaceStateEnums.COUNTDOWN] = function(p1, p2) --[[ Line: 128 ]]
			p1:EnterCountdownState(p2)
		end,
		[RaceStateEnums.RACING] = function(p1, p2) --[[ Line: 131 ]]
			p1:EnterRacingState(p2)
		end,
		[RaceStateEnums.COMPLETE] = function(p1, p2) --[[ Line: 134 ]]
			p1:EnterCompleteState(p2)
		end,
		[RaceStateEnums.CLEANINGUP] = function(p1, p2) --[[ Line: 137 | Upvalues: t (ref) ]]
			p1:EnterCleaningupState(p2)
			t.ClearActiveRace()
		end
	}
	v1:AddTeleportCallback("ToLastCheckpoint", function() --[[ Line: 143 | Upvalues: t (ref) ]]
		local v1 = t.GetActiveRace()
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
	v3.new(RewardFrame.CloseButton, {
		Click = function() --[[ Click | Line: 160 | Upvalues: t (ref), v8 (ref) ]]
			local v1 = t.GetActiveRace()
			if v1 then
				local RaceId = v1.RaceId
				v8:InvokeServer(RaceId, "RemovePlayer")
				task.delay(1, function() --[[ Line: 168 | Upvalues: v1 (ref), t (ref), RaceId (copy) ]]
					v1 = t.GetActiveRace()
					if v1 and v1.RaceId == RaceId then
						t.ClearActiveRace()
					end
				end)
			end
		end
	})
	v4.AddFrame(RewardFrame, {
		CloseAll = "CloseOverlay",
		TweenAnimation = true,
		ClosePosition = UDim2.new(0.5, 0, -0.5, 0),
		OpenPosition = UDim2.new(0.5, 0, 0.5, 0)
	})
	v4.AddFrame(RaceFrame, {
		HUD = true,
		KeepPosition = true,
		TweenAnimation = false,
		CheckVisibility = function() --[[ CheckVisibility | Line: 187 | Upvalues: t (ref) ]]
			local v1 = t.GetActiveRace()
			return v1 and not v1.IsDestroyed and true or false
		end
	})
	v10.OnClientEvent:Connect(t._createRace)
	v9.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 197 | Upvalues: t (ref), t2 (copy) ]]
		local v1 = t.GetActiveRace()
		if not v1 or (v1.RaceId ~= p1 or v1.IsDestroyed) then
			return
		end
		local v2 = t2[p2]
		if v2 then
			v2(v1, p3)
		else
			warn("invalid race state passed without handler: ", p2)
		end
	end)
end
t.Init()
return t