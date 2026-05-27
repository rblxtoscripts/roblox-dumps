-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("HorseTrainingService")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("TrainingCheckpoints")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("TimeUtils")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("TutorialService")
local v10 = Sonar("MessagesClient")
local v11 = v8.GetClient()
local LocalPlayer = Players.LocalPlayer
local Interactions = Workspace:WaitForChild("Interactions")
local v12 = nil
local v13 = nil
local v14 = nil
local v15 = nil
local v16 = nil
local v17 = false
local v18 = v2.new()
function t.RigClientTrainingArea() --[[ RigClientTrainingArea | Line: 35 | Upvalues: v9 (copy), v11 (copy), v18 (copy), v16 (ref), v1 (copy) ]]
	if not v9.HasCompletedPrimaryTutorial(v11) then
		return
	end
	v18:DoCleaning()
	v16 = v1.GetCurrentTrainingType()
	if not v16 then
		warn("No training area found")
		return
	end
	v16 = v16:Clone()
	v16.Parent = workspace
	for v12, v2 in v16.Trail:GetChildren() do
		for v3, v4 in v2:GetDescendants() do
			if v4:IsA("BasePart") then
				v4.Transparency = 1
			end
			if v4:IsA("ParticleEmitter") then
				v4.Enabled = false
			end
		end
	end
	v18:GiveTask(v16)
	return v16
end
function t.StartTraining(p1) --[[ StartTraining | Line: 67 | Upvalues: v5 (copy), v6 (copy), v16 (ref), v4 (copy) ]]
	local v1, v2 = v5.GetRemoteFunction("StartTraining"):InvokeServer()
	if not v1 then
		v6.Notify({
			Preset = "Red",
			Message = v2
		})
		return false
	end
	if v16 then
		v4.InitRace(v16, p1)
		return true
	else
		warn("No training area found")
	end
end
function t.Init() --[[ Init | Line: 90 | Upvalues: t (copy), v1 (copy), v4 (copy), v17 (ref), v16 (ref), LocalPlayer (copy), v12 (ref), v10 (copy), v13 (ref), Interactions (copy), v14 (ref), v15 (ref), v3 (copy), v9 (copy), v11 (copy), v6 (copy), v7 (copy), Sonar (copy) ]]
	t.RigClientTrainingArea()
	v1.TrainingTimer.SeedChanged:Connect(function(p1) --[[ Line: 93 | Upvalues: v4 (ref), t (ref), v17 (ref), v16 (ref), LocalPlayer (ref), v12 (ref), v10 (ref) ]]
		v4.EndRaceEarly(true)
		t.RigClientTrainingArea()
		if v17 and (v16 and (v16:FindFirstChild("StartPos") and LocalPlayer.Character)) then
			v4.TeleportToStart(v16)
		end
		if v16 and v12 then
			v12.ContainerFrame.Content.CurrentFrame.Current.Text = "Current Track: " .. v16.Name
		end
		if not v16 then
			return
		end
		v10:AddNotification({
			Type = "TrainingRefreshed",
			Duration = 3,
			Text = "The Training Course has refreshed! Now training, " .. v16.Name .. "!"
		})
	end)
	v4.EndedSignal:Connect(function() --[[ Line: 115 | Upvalues: t (ref) ]]
		t.StartTraining(true)
	end)
	task.spawn(function() --[[ Line: 119 | Upvalues: v13 (ref), Interactions (ref), v14 (ref), v15 (ref), v12 (ref), v3 (ref), v9 (ref), v11 (ref), v6 (ref), t (ref), v16 (ref), v1 (ref), v7 (ref) ]]
		v13 = Interactions:WaitForChild("Training")
		local TrainingBoard = v13:WaitForChild("TrainingBoard")
		local TrainingStart = v13:WaitForChild("TrainingStart")
		v14 = TrainingBoard
		v15 = TrainingStart
		v12 = TrainingBoard.GuiContainer:WaitForChild("SurfaceGui")
		v3.new(TrainingStart, {
			ShowHintLabel = true,
			Hint = "Start Training",
			Run = function() --[[ Run | Line: 126 | Upvalues: v9 (ref), v11 (ref), v6 (ref), t (ref) ]]
				if v9.HasCompletedPrimaryTutorial(v11) then
					t.StartTraining()
				else
					v6.Notify({
						Message = "You must complete the tutorial first!",
						Preset = "Red"
					})
				end
			end,
			GetRange = function() --[[ GetRange | Line: 137 ]]
				return 20
			end
		})
		if v16 then
			v12.ContainerFrame.Content.CurrentFrame.Current.Text = "Current Track: " .. v16.Name
		end
		v1.TrainingTimer.TimeChanged:Connect(function(p1) --[[ Line: 147 | Upvalues: v12 (ref), v7 (ref) ]]
			v12.ContainerFrame.Content.TimerFrame.Timer.Text = v7.FormatString(p1)
		end)
	end)
	Sonar("InteractZone").GetOrCreateZone({
		Type = "TrainingZone",
		OnEntered = function() --[[ OnEntered | Line: 154 | Upvalues: v17 (ref) ]]
			v17 = true
		end,
		OnLeave = function() --[[ OnLeave | Line: 157 | Upvalues: v4 (ref), v17 (ref) ]]
			v4.EndRaceEarly()
			v17 = false
		end
	})
end
t.Init()
return t