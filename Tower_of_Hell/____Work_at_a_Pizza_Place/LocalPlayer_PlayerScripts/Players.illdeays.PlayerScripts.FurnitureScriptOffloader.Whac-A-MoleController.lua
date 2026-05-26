-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage._v6FiRE_Additions.UpdatedLibraries.Maid)
local CharacterVisibilityClient = require(ReplicatedStorage._v6FiRE_Additions.CharacterVisibilityClient)
return function(p1) --[[ setup | Line: 7 | Upvalues: Maid (copy), CharacterVisibilityClient (copy), TweenService (copy) ]]
	local ProximityPrompt = p1.Frame.ProximityPrompt
	local v1 = p1.ClientObjects.WhacAMoleGui:Clone()
	local v2 = Maid.new()
	local function updateCollisionState(p12) --[[ updateCollisionState | Line: 14 | Upvalues: p1 (copy) ]]
		for v1, v2 in p1.Parts:GetDescendants() do
			if v2:IsA("BasePart") then
				v2.CanQuery = not p12
				v2.CanCollide = not p12
			end
		end
	end
	local function stopPlaying() --[[ stopPlaying | Line: 23 | Upvalues: v1 (ref), p1 (copy), CharacterVisibilityClient (ref) ]]
		if v1 then
			v1:Destroy()
			v1 = nil
		end
		p1.ClientObjects.cleanupSelf:FireServer()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		for v12, v2 in p1.Parts:GetDescendants() do
			if v2:IsA("BasePart") then
				v2.CanQuery = true
				v2.CanCollide = true
			end
		end
		CharacterVisibilityClient.ShowAll()
		CharacterVisibilityClient.EnableMovement()
	end
	local function setupCamera() --[[ setupCamera | Line: 36 | Upvalues: TweenService (ref), p1 (copy), v2 (copy), stopPlaying (copy) ]]
		local CurrentCamera = workspace.CurrentCamera
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		local v1 = TweenService:Create(CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			CFrame = p1.ClientObjects.CameraPos.CFrame
		})
		v1:Play()
		v2:GiveTask(function() --[[ Line: 43 | Upvalues: v1 (copy) ]]
			if v1.PlaybackState ~= Enum.PlaybackState.Playing then
				return
			end
			v1:Cancel()
		end)
		v1.Completed:Wait()
		v2:GiveTask((CurrentCamera:GetPropertyChangedSignal("CameraType"):Once(stopPlaying)))
	end
	local function startPlaying() --[[ startPlaying | Line: 58 | Upvalues: p1 (copy), CharacterVisibilityClient (ref), v1 (ref), stopPlaying (copy), v2 (copy), setupCamera (copy) ]]
		workspace.Main.CloseBackpack:Fire()
		for v12, v22 in p1.Parts:GetDescendants() do
			if v22:IsA("BasePart") then
				v22.CanQuery = false
				v22.CanCollide = false
			end
		end
		CharacterVisibilityClient.DisableMovement()
		CharacterVisibilityClient.HideLocalPlayer()
		v1 = p1.ClientObjects.WhacAMoleGui:Clone()
		v1.Close.MouseButton1Click:Once(stopPlaying)
		v1.Parent = game.Players.LocalPlayer.PlayerGui
		local Character = game.Players.LocalPlayer.Character
		local v3 = if Character then Character:FindFirstChildOfClass("Humanoid") else nil
		if not v3 or v3:GetState() == Enum.HumanoidStateType.Dead then
			stopPlaying()
		end
		v2:GiveTask(v3.Died:Once(stopPlaying))
		v2:GiveTask(stopPlaying)
		setupCamera()
	end
	(function() --[[ Initialize | Line: 86 | Upvalues: ProximityPrompt (copy), p1 (copy), startPlaying (copy), v2 (copy) ]]
		local v1 = false
		ProximityPrompt.Triggered:Connect(function() --[[ Line: 88 | Upvalues: v1 (ref), p1 (ref), startPlaying (ref) ]]
			if v1 then
				return
			end
			v1 = true
			task.delay(0.5, function() --[[ Line: 91 | Upvalues: v1 (ref) ]]
				v1 = false
			end)
			if workspace.CurrentCamera.CameraType == Enum.CameraType.Scriptable then
				return
			end
			if p1.ClientObjects.requestPlay:InvokeServer() then
				startPlaying()
			end
		end)
		p1.Destroying:Once(function() --[[ Line: 107 | Upvalues: v2 (ref) ]]
			v2:DoCleaning()
		end)
	end)()
end