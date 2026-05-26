-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage._v6FiRE_Additions.UpdatedLibraries.Maid)
local CharacterVisibilityClient = require(ReplicatedStorage._v6FiRE_Additions.CharacterVisibilityClient)
return function(p1) --[[ setup | Line: 7 | Upvalues: Maid (copy), CharacterVisibilityClient (copy), TweenService (copy) ]]
	local v1 = Maid.new()
	local v2 = p1.ClientObjects.WhacAMoleGui:Clone()
	local ProximityPrompt = p1.PromptPart.ProximityPrompt
	local function stopPlaying() --[[ stopPlaying | Line: 12 | Upvalues: v2 (ref), CharacterVisibilityClient (ref) ]]
		if v2 then
			v2:Destroy()
			v2 = nil
		end
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		CharacterVisibilityClient.ShowAll()
		CharacterVisibilityClient.EnableMovement()
	end
	local function setupCamera() --[[ setupCamera | Line: 23 | Upvalues: TweenService (ref), p1 (copy), v1 (copy), stopPlaying (copy) ]]
		local CurrentCamera = workspace.CurrentCamera
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		local v12 = TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
			CFrame = p1.ClientObjects.CameraPos.CFrame
		})
		v12:Play()
		v1:GiveTask(function() --[[ Line: 30 | Upvalues: v12 (copy) ]]
			if v12.PlaybackState ~= Enum.PlaybackState.Playing then
				return
			end
			v12:Cancel()
		end)
		v12.Completed:Wait()
		v1:GiveTask((CurrentCamera:GetPropertyChangedSignal("CameraType"):Once(stopPlaying)))
	end
	local function startPlaying() --[[ startPlaying | Line: 45 | Upvalues: CharacterVisibilityClient (ref), v2 (ref), p1 (copy), stopPlaying (copy), v1 (copy), setupCamera (copy) ]]
		workspace.Main.CloseBackpack:Fire()
		CharacterVisibilityClient.DisableMovement()
		CharacterVisibilityClient.HideLocalPlayer()
		v2 = p1.ClientObjects.WhacAMoleGui:Clone()
		v2.Close.MouseButton1Click:Once(stopPlaying)
		v2.Parent = game.Players.LocalPlayer.PlayerGui
		local Character = game.Players.LocalPlayer.Character
		local v12 = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
		if not v12 or v12:GetState() == Enum.HumanoidStateType.Dead then
			if v2 then
				v2:Destroy()
				v2 = nil
			end
			workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
			CharacterVisibilityClient.ShowAll()
			CharacterVisibilityClient.EnableMovement()
		end
		v1:GiveTask(v12.Died:Once(stopPlaying))
		v1:GiveTask(stopPlaying)
		setupCamera()
	end
	(function() --[[ Initialize | Line: 72 | Upvalues: ProximityPrompt (copy), startPlaying (copy), p1 (copy), v1 (copy) ]]
		local v12 = false
		ProximityPrompt.Triggered:Connect(function() --[[ Line: 74 | Upvalues: v12 (ref), startPlaying (ref) ]]
			if v12 then
				return
			end
			v12 = true
			task.delay(0.5, function() --[[ Line: 77 | Upvalues: v12 (ref) ]]
				v12 = false
			end)
			if workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
				startPlaying()
			end
		end)
		p1.Destroying:Once(function() --[[ Line: 88 | Upvalues: v1 (ref) ]]
			v1:DoCleaning()
		end)
	end)()
end