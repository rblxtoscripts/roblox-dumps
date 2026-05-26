-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentCamera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("ViewportModel")
local v3 = Sonar("WorldspaceGuiUtils")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("GuiManager")
local v6 = Sonar("BondingSequences")
local v7 = Sonar("RemoteUtils")
local v8 = Sonar("CharacterEffects")
local v9 = Sonar("LightingService")
local v10 = Sonar("spr")
local v11 = Sonar("BondService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v12 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("AnimalBondingGui").ContainerFrame
local CancelButton = ContainerFrame.CancelButton
local v13 = nil
local v14 = v1.new()
local v15 = nil
local v16 = nil
local v17 = nil
local SFX = ReplicatedStorage.Storage.SFX
local function getFocusCFrame(p1) --[[ getFocusCFrame | Line: 44 | Upvalues: v15 (ref), v2 (copy), CurrentCamera (copy) ]]
	local _, v1 = v15:ToOrientation()
	local _2, v3, v4 = v2(p1.Hitbox, CurrentCamera, 0, (math.deg(v1)))
	return CFrame.new(v4), CFrame.new(0, 0, math.max(10, v3) * 1.5)
end
local function getCameraCFrame(p1) --[[ getCameraCFrame | Line: 52 | Upvalues: getFocusCFrame (copy) ]]
	local v1, v2 = getFocusCFrame(p1)
	local v3 = CFrame.fromEulerAnglesYXZ(0, 0, 0)
	return v1 * v3 * v2, v2, v3
end
local function setBondingCamera(p1) --[[ setBondingCamera | Line: 70 | Upvalues: CurrentCamera (copy), v15 (ref), v13 (ref), v16 (ref), getFocusCFrame (copy), v17 (ref), v9 (copy), v14 (copy), RunService (copy), v10 (copy) ]]
	if p1 then
		CurrentCamera.FieldOfView = 70
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		v15 = v13.Model:GetPrimaryPartCFrame()
		v16 = CurrentCamera.CFrame
		local v1, v2 = getFocusCFrame(v13.Model)
		local v3, _, v4 = (v1 * CFrame.fromEulerAnglesYXZ(0, 0, 0) * v2):ToOrientation()
		local _2, v5 = (CFrame.new((v13.Model:GetPivot() * CFrame.new(0, 0, -10)).p, v13.Model:GetPivot().p) * CFrame.Angles(0, 1.1344640137963142, 0)):ToOrientation()
		local v6 = v3 - 0.2617993877991494
		local v7 = CFrame.new(v13.Model:GetPivot().p) * CFrame.fromEulerAnglesYXZ(v6, v5, v4) * v2
		v17 = game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(0.75), {
			CFrame = v7
		})
		v9.setLightingMode("CustomiseAnimal", true)
		v17:Play()
		v14:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 96 | Upvalues: v17 (ref), v13 (ref), getFocusCFrame (ref), v10 (ref), CurrentCamera (ref), v6 (ref), v5 (copy), v4 (copy) ]]
			if v17.PlaybackState ~= Enum.PlaybackState.Playing then
				local _, v1 = getFocusCFrame(v13.Model)
				local v2 = CFrame.fromEulerAnglesYXZ(0, 0, 0)
				v10.target(CurrentCamera, 1, 1.275, {
					CFrame = CFrame.new(v13.Model:GetPivot().p) * CFrame.fromEulerAnglesYXZ(v6, v5, v4) * v2 * v1
				})
			end
		end))
		v14:GiveTask(function() --[[ Line: 105 | Upvalues: v10 (ref), CurrentCamera (ref) ]]
			v10.stop(CurrentCamera)
		end)
		return
	end
	if not v17 then
		CurrentCamera.CameraType = Enum.CameraType.Custom
		game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(0.75), {
			FieldOfView = 70,
			CFrame = v16
		}):Play()
		return
	end
	v17:Cancel()
	CurrentCamera.CameraType = Enum.CameraType.Custom
	game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(0.75), {
		FieldOfView = 70,
		CFrame = v16
	}):Play()
end
function t.EnterMode(p1, p2) --[[ EnterMode | Line: 125 | Upvalues: v12 (copy), v14 (copy), v13 (ref), ContainerFrame (copy), CancelButton (copy), v5 (copy), v9 (copy), v3 (copy), v4 (copy), setBondingCamera (copy), RunService (copy), v6 (copy), v11 (copy), v7 (copy), Sonar (copy), SFX (copy), t (copy), v8 (copy) ]]
	if v12:IsInAction("BondMode") then
		return
	end
	v12:SetActionState("BondMode", p2.Horse.SlotValue.Name)
	v14:DoCleaning()
	v13 = p2.Horse
	ContainerFrame.TimeLabel.Visible = false
	CancelButton.Visible = true
	if p2.OnRun then
		p2.OnRun()
	end
	v5.OpenMainFrame(ContainerFrame, {
		Blur = false,
		DisableControls = true,
		Exclusion = ContainerFrame
	})
	v9.setLightingMode("CustomiseAnimal", true)
	v3.SetWorldspaceGuiVisibility(false)
	v4:Disable()
	v12.Character.Humanoid:UnequipTools()
	setBondingCamera(true)
	print("Bonding - Enter bonding mode")
	RunService.RenderStepped:Wait()
	v6.CreateSequence(p2.Type, v13, 100, p2.CustomModel):OnCompleted(function(p1, p22) --[[ Line: 159 | Upvalues: v11 (ref), v12 (ref), v13 (ref), p2 (copy), v7 (ref), Sonar (ref), SFX (ref), t (ref) ]]
		local v1 = v11:CanDoCleaningMinigame(v12, v13.SlotValue.Name, p2.Tool)
		v7.GetRemoteFunction("CleanMinigameRemote"):InvokeServer(v13.SlotValue.Name, p2.Tool)
		task.spawn(function() --[[ Line: 163 | Upvalues: v1 (copy), Sonar (ref), SFX (ref), v13 (ref) ]]
			if v1 == true then
				Sonar("ColorCorrectionUtils"):Tween()
				SFX.QuestComplete1:Play()
				SFX.QuestComplete2:Play()
			end
			v13:AnimateBond("HorseOnly")
		end)
		task.wait(2.5)
		t:ExitMode({
			Cleanup = p22
		})
	end)
	v8.UpdateVisibility({
		ExcludeAnimal = v13.SlotValue.Name
	})
end
function t.ExitMode(p1) --[[ ExitMode | Line: 184 | Upvalues: v12 (copy), v14 (copy), setBondingCamera (copy), v9 (copy), v5 (copy), LocalPlayer (copy), v3 (copy), v6 (copy), v8 (copy) ]]
	if v12:IsInAction("BondMode") then
		v12:SetActionState("BondMode", "")
		_G.HidePlayersAndAnimals = nil
		v14:DoCleaning()
		setBondingCamera()
		v9.setLightingMode("CustomiseAnimal", false, nil, true)
		task.delay(0.76, function() --[[ Line: 195 | Upvalues: v5 (ref) ]]
			v5.OpenInteractMenu()
		end)
		LocalPlayer:GetMouse().Icon = ""
		v3.SetWorldspaceGuiVisibility(true)
		v5.OpenHUD({
			SubFramesFromHUD = false,
			ExcludeInteractMenu = true
		})
		v6.StopSequence()
		v8.UpdateVisibility()
		print("Bonding - Left bonding mode")
	end
end
function t.Init(p1) --[[ Init | Line: 213 | Upvalues: v5 (copy), ContainerFrame (copy), v12 (copy), t (copy), Sonar (copy), CancelButton (copy) ]]
	v5.AddFrame(ContainerFrame, {
		ShortcutToClose = true,
		ExcludeInteractMenu = true,
		KeepPosition = true,
		CheckVisiblity = function() --[[ CheckVisiblity | Line: 215 | Upvalues: v12 (ref) ]]
			return v12:IsInAction("BondMode")
		end
	})
	v5.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 223 | Upvalues: t (ref) ]]
		t:ExitMode()
	end)
	Sonar("ButtonTest").new(CancelButton, {
		Click = function() --[[ Click | Line: 228 | Upvalues: t (ref) ]]
			t:ExitMode()
		end
	})
end
t:Init()
return t