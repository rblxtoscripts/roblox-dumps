-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("CameraGui")
local v3 = Sonar("CharacterEffects")
local v4 = Sonar("Checkpoint")
local v5 = Sonar("Animal")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("InteractMenu")
local LocalPlayer = game.Players.LocalPlayer
local v8 = Sonar("PlayerWrapper").GetClient()
local v9 = Sonar("Constants")
local t = {}
t.__index = t
local v10 = false
local v11 = v1.new()
function t.Start() --[[ Start | Line: 22 | Upvalues: v10 (ref), v5 (copy), v6 (copy), v11 (copy), v8 (copy), v4 (copy), v9 (copy), LocalPlayer (copy), v2 (copy), v3 (copy) ]]
	if v10 then
		return
	end
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		return
	end
	local Humanoid = Character:FindFirstChild("Humanoid")
	if not Humanoid then
		return
	end
	local SeatPart = Humanoid.SeatPart
	local v1 = nil
	local v22
	if SeatPart and SeatPart:IsDescendantOf(Character.Animals) then
		v1 = SeatPart.Parent
		v22 = v1
	else
		for v32, v42 in v5.GetAllAnimals() do
			v1 = v42
			break
		end
		if not v1 then
			v6.Notify({
				Message = "You must have a horse equipped to start the race!",
				Preset = "Red"
			})
			return
		end
		v1:_sit()
		v22 = v1.Model
		task.wait()
	end
	v11:GiveTask(v8.CurrentAnimalChangedSignal:Connect(function(p1) --[[ Line: 58 | Upvalues: v1 (ref), v10 (ref), v11 (ref), v4 (ref), v6 (ref) ]]
		if p1 == v1 then
			return
		end
		v10 = false
		v11:DoCleaning()
		v4.EndRace()
		v6.Notify({
			Message = "Dance ended.",
			Preset = "Red"
		})
	end))
	v11:GiveTask(v22:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 71 | Upvalues: v10 (ref), v11 (ref), v4 (ref), v6 (ref) ]]
		v10 = false
		v11:DoCleaning()
		v4.EndRace()
		v6.Notify({
			Message = "Dance ended.",
			Preset = "Red"
		})
	end))
	v11:GiveTask(v9.ResetBindable.Event:Connect(function(p1) --[[ Line: 82 | Upvalues: v10 (ref), v11 (ref), v4 (ref), v6 (ref) ]]
		v10 = false
		v11:DoCleaning()
		v4.EndRace()
		v6.Notify({
			Message = "Dance ended.",
			Preset = "Red"
		})
	end))
	LocalPlayer.Character.Humanoid:UnequipTools()
	v2:ExitMode()
	v3.UpdateVisibility({
		ExcludeLocalPlayer = true,
		ExcludeLocalAnimals = true
	})
	v10 = true
	v4.InitRace()
end
function t.Init() --[[ Init | Line: 106 | Upvalues: v4 (copy), v10 (ref), v11 (copy), v7 (copy), t (copy) ]]
	v4.EndedSignal:Connect(function() --[[ Line: 107 | Upvalues: v10 (ref), v11 (ref) ]]
		v10 = false
		v11:DoCleaning()
	end)
	v7.new(workspace.Interactions.Kirin:WaitForChild("StartDance").InteractPart, {
		Hint = "Start Race",
		GetRange = function() --[[ GetRange | Line: 113 ]]
			return 20
		end,
		Run = function() --[[ Run | Line: 117 | Upvalues: t (ref) ]]
			t.Start()
		end
	})
end
t.Init()
return t