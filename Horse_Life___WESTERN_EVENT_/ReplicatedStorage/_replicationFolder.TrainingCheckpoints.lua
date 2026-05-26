-- https://lua.expert/
game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("CameraShaker")
local v2 = Sonar("CharacterEffects")
local v3 = Sonar("ColorCorrectionUtils")
local v4 = Sonar("Maid")
local v5 = Sonar("MessagesClient")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("Signal")
local t = {}
t.__index = t
t.EndedSignal = v9.new()
local v10 = v7.GetClient()
local CurrentCamera = workspace.CurrentCamera
local v11 = 0
local t2 = {}
local v12 = nil
local v13 = 0
local v14 = 0
local v15 = false
local t3 = { "GO GO GO!", "Checkpoint complete!", "Awesome!", "WOW!", "RUN FASTER!" }
local v16 = v4.new()
local v17 = v1.new(Enum.RenderPriority.Camera.Value + 1, "HorseTrainingShaker", function(p1) --[[ Line: 42 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v17:Start()
local function AddEffects() --[[ AddEffects | Line: 47 | Upvalues: v5 (copy), t3 (copy), v3 (copy), v17 (copy), v1 (copy) ]]
	v5:AddNotification({
		Type = "JumpCompleted",
		Duration = 1.5,
		Text = t3[math.random(#t3)],
		RunBefore = function() --[[ RunBefore | Line: 51 | Upvalues: v3 (ref), v17 (ref), v1 (ref) ]]
			v3:Tween()
			v17:Shake(v1.Presets.SmallRotationBump)
		end
	})
end
function t.new(p1) --[[ new | Line: 59 | Upvalues: t (copy), v4 (copy), v13 (ref), v14 (ref), v8 (copy), v11 (ref), v6 (copy), v15 (ref), v12 (ref), v3 (copy), v17 (copy), v1 (copy), v10 (copy), AddEffects (copy), v16 (copy), t2 (copy) ]]
	local v18 = t
	local v2 = setmetatable({}, v18)
	v2.Model = p1
	v2.CheckpointNumber = tonumber(v2.Model.name)
	v2.Maid = v4.new()
	v2.Touched = false
	if v2.Model:GetAttribute("State") and v2.Model.RaceRing:FindFirstChild("DisplayGui") then
		v2.Model.RaceRing.DisplayGui.Frame.FullLabel.Text = v2.Model:GetAttribute("State")
	elseif v2.Model.RaceRing:FindFirstChild("DisplayGui") then
		v2.Model.RaceRing.DisplayGui.Enabled = false
	end
	if v2.CheckpointNumber and v2.CheckpointNumber == 1 then
		v2.Model.RaceRing.DisplayGui.Enabled = true
		for v32, v42 in v2.Model:GetDescendants() do
			if v42:IsA("BasePart") then
				v42.Transparency = 0
			end
			if v42:IsA("ParticleEmitter") then
				v42.Enabled = true
			end
		end
	else
		for v5, v62 in v2.Model:GetDescendants() do
			if v62:IsA("BasePart") then
				v62.Transparency = 1
			end
			if v62:IsA("ParticleEmitter") then
				v62.Enabled = false
			end
		end
	end
	v2.Maid:GiveTask(v2.Model.RaceRing.Touched:Connect(function() --[[ Line: 98 | Upvalues: v2 (copy), v13 (ref), v14 (ref), v8 (ref), v11 (ref), v6 (ref), t (ref), v15 (ref), v12 (ref), v3 (ref), v17 (ref), v1 (ref), v10 (ref), AddEffects (ref) ]]
		if v2.Touched then
			return
		end
		if v2.Model.Name == "Finish" and v13 == v14 - 1 then
			v2.Touched = true
			local v16, v22 = v8.GetRemoteFunction("FinishTraining"):InvokeServer()
			if v16 then
				v6.Notify({
					Preset = "Yellow",
					Message = v22
				})
				v15 = false
				v13 = #v12:GetChildren() - 1
				v3:Tween()
				v17:Shake(v1.Presets.SmallRotationBump)
				t.EndedSignal:Fire()
				t.EndRace()
				return
			end
			if not (os.time() - v11 > 1) then
				t.EndedSignal:Fire()
				t.EndRace()
				return
			end
			v6.Notify({
				Preset = "Red",
				Message = v22
			})
			v11 = os.time()
			t.EndedSignal:Fire()
			t.EndRace()
		else
			if v2.CheckpointNumber ~= v13 + 1 then
				return
			end
			local v32 = v10:GetCurrentAnimal()
			if v32 and (v2.Model:GetAttribute("State") and v32.MoveState ~= v2.Model:GetAttribute("State")) then
				if v11 ~= 0 and not (os.time() - v11 > 1) then
					return
				end
				v11 = os.time()
				v6.Notify({
					Preset = "Red",
					Message = "You must be in " .. v2.Model:GetAttribute("State") .. " state to complete this checkpoint!"
				})
				return
			end
			v2.Touched = true
			for v4, v5 in v2.Model:GetChildren() do
				if v5:IsA("BasePart") then
					v5.Transparency = 1
				end
				if v5:IsA("ParticleEmitter") then
					v5.Enabled = false
				end
			end
			v2.Model.RaceRing.DisplayGui.Enabled = false
			local v7 = v12.Trail:FindFirstChild((tostring(v2.CheckpointNumber + 1)))
			if v7 then
				for v82, v9 in v7:GetDescendants() do
					if v9:IsA("BasePart") or v9:IsA("MeshPart") then
						v9.Transparency = 0
					end
					if v9:IsA("ParticleEmitter") then
						v9.Enabled = true
					end
					if v9.Name == "DisplayGui" then
						v9.Enabled = true
					end
				end
			else
				local Finish = v12.Trail:FindFirstChild("Finish")
				if Finish then
					for v102, v112 in Finish:GetChildren() do
						if v112:IsA("BasePart") then
							v112.Transparency = 0.5
						end
					end
				end
			end
			v2:Destroy()
			v13 = v13 + 1
			local t2 = {
				Preset = "Green"
			}
			t2.Message = string.format("%s/%s", v13, (tostring(v14)))
			v6.Notify(t2)
			AddEffects()
		end
	end))
	v16:GiveTask(v2.Maid)
	table.insert(t2, v2)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 225 | Upvalues: t2 (copy) ]]
	p1.Maid:DoCleaning()
	for v1, v2 in p1.Model:GetDescendants() do
		if v2:IsA("BasePart") then
			v2.Transparency = 1
		end
		if v2:IsA("ParticleEmitter") then
			v2.Enabled = false
		end
	end
	table.remove(t2, table.find(t2, p1))
	setmetatable(p1, nil)
end
function t.InitRace(p1, p2) --[[ InitRace | Line: 242 | Upvalues: v15 (ref), v12 (ref), v14 (ref), Players (copy), t (copy), v16 (copy) ]]
	if v15 then
		return
	end
	v15 = true
	v12 = p1
	_G.RacingMovement = true
	v14 = #p1.Trail:GetChildren()
	local LocalPlayer = Players.LocalPlayer
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		local Humanoid = LocalPlayer.Character.Humanoid
		v16:GiveTask((Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 260 | Upvalues: Humanoid (copy), t (ref), LocalPlayer (copy) ]]
			local SeatPart = Humanoid.SeatPart
			if not SeatPart then
				t.EndRaceEarly()
				return
			end
			if not SeatPart or SeatPart:IsDescendantOf(LocalPlayer.Character.Animals) then
				return
			end
			t.EndRaceEarly()
		end)))
	end
	for v1, v2 in p1.Trail:GetChildren() do
		t.new(v2)
	end
	if not p1:FindFirstChild("StartPos") or p2 == true then
		return
	end
	t.TeleportToStart(p1)
end
function t.TeleportToStart(p1) --[[ TeleportToStart | Line: 286 | Upvalues: v10 (copy) ]]
	local StartPos = p1:FindFirstChild("StartPos")
	if not (StartPos and v10.Character) then
		return
	end
	local v1 = v10:GetCurrentAnimal()
	if v1 and v1.Model then
		local v2 = v1.Model:GetExtentsSize()
		local v3 = StartPos:GetPivot() + v2 * Vector3.new(0, 0.5, 0)
		v1:StopMovement()
		v10.Character:PivotTo(v3)
	else
		v10.Character:PivotTo(StartPos:GetPivot())
	end
end
function t.EndRace() --[[ EndRace | Line: 305 | Upvalues: v13 (ref), v16 (copy), v15 (ref), v12 (ref), v2 (copy) ]]
	v13 = 0
	v16:DoCleaning()
	v15 = false
	_G.RacingMovement = false
	for v1, v22 in v12.Trail:GetDescendants() do
		if v22:IsA("BasePart") then
			v22.Transparency = 1
		end
		if v22:IsA("ParticleEmitter") then
			v22.Enabled = false
		end
		if v22.Name == "DisplayGui" then
			v22.Enabled = false
		end
	end
	v2.UpdateVisibility(false)
end
function t.EndRaceEarly(p1) --[[ EndRaceEarly | Line: 329 | Upvalues: v15 (ref), v13 (ref), v2 (copy), v16 (copy), v6 (copy), v8 (copy), v12 (ref) ]]
	if not v15 then
		return
	end
	v15 = false
	_G.RacingMovement = false
	v13 = 0
	v2.UpdateVisibility(false)
	v16:DoCleaning()
	if p1 then
		v6.Notify({
			Message = "Training ended Track refreshed!",
			Preset = "Green"
		})
	end
	local v1, v22 = v8.GetRemoteFunction("EndTraining"):InvokeServer()
	if not v1 then
		v6.Notify({
			Preset = "Red",
			Message = v22
		})
	end
	v6.Notify({
		Message = "Training ended!",
		Preset = "Red"
	})
	if not (v12 and v12:FindFirstChild("Trail")) then
		return
	end
	for v3, v4 in v12.Trail:GetDescendants() do
		if v4:IsA("BasePart") then
			v4.Transparency = 1
		end
		if v4:IsA("ParticleEmitter") then
			v4.Enabled = false
		end
		if v4.Name == "DisplayGui" then
			v4.Enabled = false
		end
	end
end
return t