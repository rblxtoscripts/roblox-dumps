-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("KirinProgressService")
local v5 = Sonar("InteractMenu")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("CameraShaker")
local v9 = Sonar("ColorCorrectionUtils")
local v10 = Sonar("Constants")
local KirinEggData = v10.KirinEggData
local CurrentCamera = workspace.CurrentCamera
local v11 = v8.new(Enum.RenderPriority.Camera.Value + 1, "KirinEggShaker", function(p1) --[[ Line: 25 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v11:Start()
local LocalPlayer = Players.LocalPlayer
function t.new(p1) --[[ new | Line: 32 | Upvalues: t (copy), v1 (copy), KirinEggData (copy), v4 (copy), LocalPlayer (copy), v3 (copy), v10 (copy), v5 (copy), v6 (copy), v9 (copy), ReplicatedStorage (copy), v11 (copy), v7 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.EggName = p1.Name
	v2.SpawnObject = p1
	v2.Maid = v1.new()
	v2.EggConstantsData = KirinEggData[v2.EggName]
	v2.EggData = v4.GetEggData(LocalPlayer, v2.EggName)
	v2.Display = p1:FindFirstChild("DisplayGui")
	v2.TimerMaid = v1.new()
	v2.Maid:GiveTask(v2.TimerMaid)
	v2.Display.Frame.Title.Text = v2.EggConstantsData.Name
	local function updateDisplay() --[[ updateDisplay | Line: 47 | Upvalues: v2 (copy) ]]
		if v2.EggData.Claimed.Value then
			return
		end
		v2.Display.Frame.FullLabel.Text = v2.EggData.Submitted.Value .. "/" .. v2.EggConstantsData.MaxTurnin
	end
	local function UpdateEggVisibility() --[[ UpdateEggVisibility | Line: 53 | Upvalues: v2 (copy), v3 (ref), v10 (ref) ]]
		v2.TimerMaid:DoCleaning()
		if v2.EggData.Claimed.Value then
			v2.SpawnObject.EggModel.Egg.Transparency = 1
			v2.Display.Frame.FullLabel.Text = "Returning in [placeholder]"
			v2.TimerMaid:GiveTask(v3.AttachToTime(function() --[[ Line: 60 | Upvalues: v2 (ref), v10 (ref), v3 (ref) ]]
				if not v2.EggData.Claimed.Value then
					return
				end
				local v22 = v10.KirinEggCooldown - (workspace:GetServerTimeNow() - v2.EggData.LastClaim.Value)
				if v22 > 0 then
					v2.Display.Frame.FullLabel.Text = "Returning in " .. v3.FormatString(v22)
				end
			end))
			return
		end
		if v2.EggData.Claimed.Value then
			v2.SpawnObject.EggModel.Egg.Transparency = 0
			return
		end
		v2.Display.Frame.FullLabel.Text = v2.EggData.Submitted.Value .. "/" .. v2.EggConstantsData.MaxTurnin
		v2.SpawnObject.EggModel.Egg.Transparency = 0
	end
	v2.Maid:GiveTask(v5.new(v2.SpawnObject, {
		ShowHintLabel = true,
		GetRange = function() --[[ GetRange | Line: 80 ]]
			return 20
		end,
		Hint = function() --[[ Hint | Line: 83 | Upvalues: v2 (copy) ]]
			if v2.EggData.Submitted.Value >= v2.EggConstantsData.MaxTurnin then
				return "Claim"
			else
				return "Submit"
			end
		end,
		HintChanged = { v2.EggData.Submitted:GetPropertyChangedSignal("Value"), v2.EggData.Claimed:GetPropertyChangedSignal("Value") },
		Run = function() --[[ Run | Line: 94 | Upvalues: v2 (copy), v6 (ref), v9 (ref), ReplicatedStorage (ref), v11 (ref), v7 (ref) ]]
			if v2.EggData.Submitted.Value >= v2.EggConstantsData.MaxTurnin then
				v6.GetRemoteFunction("ClaimKirinEgg"):InvokeServer(v2.EggName)
				return
			end
			local v1, v22 = v6.GetRemoteFunction("SubmitKirinEgg"):InvokeServer(v2.EggName)
			if v1 then
				v9:Tween()
				ReplicatedStorage.Storage.SFX.QuestIncrement:Play()
				v11:Shake(v11.Presets.RotationBump)
			end
			local t = {
				Message = v22
			}
			t.Preset = if v1 then "Green" else "Red"
			v7.Notify(t)
		end,
		Visibility = function() --[[ Visibility | Line: 114 | Upvalues: v2 (copy) ]]
			return not v2.EggData.Claimed.Value
		end
	}))
	v2.Maid:GiveTask(v2.EggData.Submitted:GetPropertyChangedSignal("Value"):Connect(updateDisplay))
	v2.Maid:GiveTask(v2.EggData.Claimed:GetPropertyChangedSignal("Value"):Connect(UpdateEggVisibility))
	if not v2.EggData.Claimed.Value then
		v2.Display.Frame.FullLabel.Text = v2.EggData.Submitted.Value .. "/" .. v2.EggConstantsData.MaxTurnin
	end
	UpdateEggVisibility()
	v2.Maid:GiveTask(function() --[[ Line: 126 | Upvalues: v2 (copy) ]]
		setmetatable(v2, nil)
	end)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 134 ]]
	p1.Maid:DoCleaning()
end
function t.Init() --[[ Init | Line: 138 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("KirinEgg", t):Init()
end
t.Init()
return t