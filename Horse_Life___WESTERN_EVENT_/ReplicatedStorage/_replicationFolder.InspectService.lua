-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("ItemReplicationService")
local v3 = Sonar("AnimalCosmetics")
local v4 = Sonar("PromptClient")
local v5 = Sonar("GuiManager")
local v6 = Sonar("Maid")
local v7 = Sonar("spr")
local v8 = Sonar("UINavigator")
local v9 = Sonar("InfoOverlayGui")
local v10 = Sonar("TransitionClient")
local v11 = nil
local v12 = Sonar("Constants")
local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local v13 = LocalPlayer:GetMouse()
local v14 = 0
local t = {}
t.__index = t
function t.New(p1) --[[ New | Line: 35 | Upvalues: t (copy), v6 (copy), v1 (copy), v2 (copy), ReplicatedStorage (copy), v3 (copy), LocalPlayer (copy), v8 (copy), v11 (ref), v4 (copy), v5 (copy), v10 (copy), v13 (copy), RunService (copy), CurrentCamera (copy), v14 (ref), v7 (copy), UserInputService (copy), v12 (copy), v9 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v6.new()
	v22.SpeciesData = v1.GetByName(v22.SlotInfo.Species.Value)
	v22.Model = v2.Get(v22.SpeciesData):Clone()
	v22.InspectModel = ReplicatedStorage.Storage.Assets.InspectModel:Clone()
	v22.CosmeticModel = v3.new(v22.Model, {
		InViewport = false,
		SlotValue = v22.SlotInfo
	})
	local Eyelid = v22.CosmeticModel.AnimalModel:FindFirstChild("Eyelid")
	local v32, v42, v52, v62
	if not Eyelid then
		v22.TargetScale = v1.GetScale(v22.SlotInfo)
		v22.CosmeticModel.AnimalModel:ScaleTo(v22.TargetScale)
		v22.Spinning = false
		v22.LastTouchY = nil
		v22.Maid:GiveTask(v22.Model)
		v22.Maid:GiveTask(v22.CosmeticModel)
		v22.Maid:GiveTask(v22.InspectModel)
		v32 = LocalPlayer.Character:GetPivot().Position
		v22.InspectModel:PivotTo(CFrame.new(v32) * CFrame.new(0, 400, 0))
		v22.InspectModel.Parent = workspace
		v22.Maid:GiveTask(function() --[[ Line: 68 | Upvalues: LocalPlayer (ref), v8 (ref), v11 (ref), v22 (copy), v4 (ref) ]]
			LocalPlayer.ReplicationFocus = nil
			v8.SetHUDNavigationEnabled(true)
			v11.Open("Bundles")
			setmetatable(v22, nil)
			v4.Close()
		end)
		v5.CloseAllFrames()
		v5.CloseHUD()
		v10.QuickStart()
		task.delay(0.5, function() --[[ Line: 83 | Upvalues: v10 (ref) ]]
			v10.QuickEnd()
		end)
		v42 = Instance.new("CFrameValue")
		v42.Value = v22.InspectModel.InspectCamera.CFrame
		v52 = v13.X
		v62 = 0
		v22.Maid:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 93 | Upvalues: v22 (copy), v13 (ref), CurrentCamera (ref), v14 (ref), v52 (ref), v7 (ref), v62 (ref), v42 (copy), UserInputService (ref) ]]
			local v1 = v22.InspectModel.InspectCamera.CFrame
			local Position = v1.Position
			local v2 = CFrame.lookAt(Position, Position + (v1.LookVector * Vector3.new(1, 0, 1)).Unit)
			local v3 = CFrame.Angles(0, 2.9670597283903604, 0) * CFrame.Angles(-0.2617993877991494, 0, 0) * CFrame.new(0, 0, 5)
			local v5 = CFrame.Angles(0, -(v13.X / (CurrentCamera.ViewportSize.X / 2) - 1) / 12, 0)
			local v6 = CFrame.new(0, v14, 0)
			local X = v13.X
			local v72 = X - v52
			v52 = X
			if v22.Spinning then
				local v8 = CFrame.Angles(0, math.rad(-v72 / 5), 0)
				if v22.CosmeticModel.AnimalModel then
					v7.target(v22.CosmeticModel.AnimalModel, 0.3, 4.5, {
						Pivot = v22.CosmeticModel.AnimalModel.PrimaryPart.CFrame * v8
					})
				end
			end
			if v62 ~= 0 and v22.CosmeticModel.AnimalModel then
				v7.target(v22.CosmeticModel.AnimalModel, 0.3, 4.5, {
					Pivot = v22.CosmeticModel.AnimalModel.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v62), 0)
				})
				v62 = 0
			end
			v7.target(v42, 1, 1, {
				Value = v2 * v3 * v6 * v5
			})
			CurrentCamera.CFrame = v42.Value
			if UserInputService.MouseBehavior == Enum.MouseBehavior.Default then
				return
			end
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end))
		v8.SetHUDNavigationEnabled(false)
		game.Lighting.InterfaceBlur.Enabled = false
		workspace.Camera.FieldOfView = 100
		v22.Maid:GiveTask(v13.Button1Down:Connect(function() --[[ Line: 150 | Upvalues: v22 (copy) ]]
			v22.Spinning = true
		end))
		v22.Maid:GiveTask(v12.ResetBindable.Event:Connect(function() --[[ Line: 154 | Upvalues: v22 (copy) ]]
			v22:Destroy()
		end))
		v22.Maid:GiveTask(v13.Button1Up:Connect(function() --[[ Line: 158 | Upvalues: v22 (copy) ]]
			v22.Spinning = false
		end))
		v22.Maid:GiveTask(UserInputService.InputChanged:Connect(function(p1_2) --[[ Line: 163 | Upvalues: v14 (ref), v22 (copy), v62 (ref) ]]
			if p1_2.UserInputType == Enum.UserInputType.MouseWheel then
				v14 = math.clamp(v14 + p1_2.Position.Z * 0.25, -1, 4)
			end
			if p1_2.UserInputType == Enum.UserInputType.Touch then
				if v22.LastTouchY then
					v14 = math.clamp(v14 + -(p1_2.Position.Y - v22.LastTouchY) * 0.01, -1, 4)
				end
				v22.LastTouchY = p1_2.Position.Y
			end
			if p1_2.UserInputType == Enum.UserInputType.Gamepad1 and p1_2.KeyCode == Enum.KeyCode.Thumbstick2 then
				v14 = math.clamp(v14 + p1_2.Position.Y * 0.1, -1, 4)
			end
			if p1_2.UserInputType ~= Enum.UserInputType.Gamepad1 or p1_2.KeyCode ~= Enum.KeyCode.Thumbstick1 then
				return
			end
			if not (math.abs(p1_2.Position.X) > 0.1) then
				return
			end
			v62 = -p1_2.Position.X * 2.5
		end))
		v22.Maid:GiveTask(UserInputService.TouchEnded:Connect(function() --[[ Line: 199 | Upvalues: v22 (copy) ]]
			v22.LastTouchY = nil
		end))
		v22.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p1_2) --[[ Line: 204 | Upvalues: v14 (ref), v62 (ref) ]]
			if p1_2.UserInputType ~= Enum.UserInputType.Gamepad1 then
				return
			end
			if p1_2.KeyCode == Enum.KeyCode.DPadUp then
				v14 = math.clamp(v14 + 0.25, -1, 4)
			elseif p1_2.KeyCode == Enum.KeyCode.DPadDown then
				v14 = math.clamp(v14 - 0.25, -1, 4)
			end
			if p1_2.KeyCode == Enum.KeyCode.DPadLeft or p1_2.KeyCode == Enum.KeyCode.ButtonL1 then
				v62 = -2.5
				return
			end
			if p1_2.KeyCode ~= Enum.KeyCode.DPadRight and p1_2.KeyCode ~= Enum.KeyCode.ButtonR1 then
				return
			end
			v62 = 2.5
		end))
		task.delay(0.5, function() --[[ Line: 224 | Upvalues: v22 (copy) ]]
			local AnimalModel = v22.CosmeticModel.AnimalModel
			AnimalModel:PivotTo(v22.InspectModel.HorsePad.CFrame + Vector3.new(0, AnimalModel.HumanoidRootPart.Size.Y / 2 - (AnimalModel.HumanoidRootPart.Position - AnimalModel.PrimaryPart.Position).Y, 0))
		end)
		v22.CosmeticModel.AnimalModel.HumanoidRootPart.Anchored = true
		v22.CosmeticModel.AnimalModel.Parent = workspace
		v4.Prompt({
			Type = "Inspect",
			BackgroundNotVisible = true,
			Setup = function(p1_2) --[[ Setup | Line: 234 ]] end,
			Run = function() --[[ Run | Line: 237 | Upvalues: v9 (ref), v22 (copy) ]]
				v9.Open({
					SpeciesAsName = true,
					SlotValue = v22.SlotInfo
				})
			end,
			Cancel = function() --[[ Cancel | Line: 243 | Upvalues: v22 (copy) ]]
				v22:Destroy()
				return true
			end
		})
		return v22
	end
	Eyelid:Destroy()
	v22.TargetScale = v1.GetScale(v22.SlotInfo)
	v22.CosmeticModel.AnimalModel:ScaleTo(v22.TargetScale)
	v22.Spinning = false
	v22.LastTouchY = nil
	v22.Maid:GiveTask(v22.Model)
	v22.Maid:GiveTask(v22.CosmeticModel)
	v22.Maid:GiveTask(v22.InspectModel)
	v32 = LocalPlayer.Character:GetPivot().Position
	v22.InspectModel:PivotTo(CFrame.new(v32) * CFrame.new(0, 400, 0))
	v22.InspectModel.Parent = workspace
	v22.Maid:GiveTask(function() --[[ Line: 68 | Upvalues: LocalPlayer (ref), v8 (ref), v11 (ref), v22 (copy), v4 (ref) ]]
		LocalPlayer.ReplicationFocus = nil
		v8.SetHUDNavigationEnabled(true)
		v11.Open("Bundles")
		setmetatable(v22, nil)
		v4.Close()
	end)
	v5.CloseAllFrames()
	v5.CloseHUD()
	v10.QuickStart()
	task.delay(0.5, function() --[[ Line: 83 | Upvalues: v10 (ref) ]]
		v10.QuickEnd()
	end)
	v42 = Instance.new("CFrameValue")
	v42.Value = v22.InspectModel.InspectCamera.CFrame
	v52 = v13.X
	v62 = 0
	v22.Maid:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 93 | Upvalues: v22 (copy), v13 (ref), CurrentCamera (ref), v14 (ref), v52 (ref), v7 (ref), v62 (ref), v42 (copy), UserInputService (ref) ]]
		local v1 = v22.InspectModel.InspectCamera.CFrame
		local Position = v1.Position
		local v2 = CFrame.lookAt(Position, Position + (v1.LookVector * Vector3.new(1, 0, 1)).Unit)
		local v3 = CFrame.Angles(0, 2.9670597283903604, 0) * CFrame.Angles(-0.2617993877991494, 0, 0) * CFrame.new(0, 0, 5)
		local v5 = CFrame.Angles(0, -(v13.X / (CurrentCamera.ViewportSize.X / 2) - 1) / 12, 0)
		local v6 = CFrame.new(0, v14, 0)
		local X = v13.X
		local v72 = X - v52
		v52 = X
		if v22.Spinning then
			local v8 = CFrame.Angles(0, math.rad(-v72 / 5), 0)
			if v22.CosmeticModel.AnimalModel then
				v7.target(v22.CosmeticModel.AnimalModel, 0.3, 4.5, {
					Pivot = v22.CosmeticModel.AnimalModel.PrimaryPart.CFrame * v8
				})
			end
		end
		if v62 ~= 0 and v22.CosmeticModel.AnimalModel then
			v7.target(v22.CosmeticModel.AnimalModel, 0.3, 4.5, {
				Pivot = v22.CosmeticModel.AnimalModel.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v62), 0)
			})
			v62 = 0
		end
		v7.target(v42, 1, 1, {
			Value = v2 * v3 * v6 * v5
		})
		CurrentCamera.CFrame = v42.Value
		if UserInputService.MouseBehavior == Enum.MouseBehavior.Default then
			return
		end
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end))
	v8.SetHUDNavigationEnabled(false)
	game.Lighting.InterfaceBlur.Enabled = false
	workspace.Camera.FieldOfView = 100
	v22.Maid:GiveTask(v13.Button1Down:Connect(function() --[[ Line: 150 | Upvalues: v22 (copy) ]]
		v22.Spinning = true
	end))
	v22.Maid:GiveTask(v12.ResetBindable.Event:Connect(function() --[[ Line: 154 | Upvalues: v22 (copy) ]]
		v22:Destroy()
	end))
	v22.Maid:GiveTask(v13.Button1Up:Connect(function() --[[ Line: 158 | Upvalues: v22 (copy) ]]
		v22.Spinning = false
	end))
	v22.Maid:GiveTask(UserInputService.InputChanged:Connect(function(p1_2) --[[ Line: 163 | Upvalues: v14 (ref), v22 (copy), v62 (ref) ]]
		if p1_2.UserInputType == Enum.UserInputType.MouseWheel then
			v14 = math.clamp(v14 + p1_2.Position.Z * 0.25, -1, 4)
		end
		if p1_2.UserInputType == Enum.UserInputType.Touch then
			if v22.LastTouchY then
				v14 = math.clamp(v14 + -(p1_2.Position.Y - v22.LastTouchY) * 0.01, -1, 4)
			end
			v22.LastTouchY = p1_2.Position.Y
		end
		if p1_2.UserInputType == Enum.UserInputType.Gamepad1 and p1_2.KeyCode == Enum.KeyCode.Thumbstick2 then
			v14 = math.clamp(v14 + p1_2.Position.Y * 0.1, -1, 4)
		end
		if p1_2.UserInputType ~= Enum.UserInputType.Gamepad1 or p1_2.KeyCode ~= Enum.KeyCode.Thumbstick1 then
			return
		end
		if not (math.abs(p1_2.Position.X) > 0.1) then
			return
		end
		v62 = -p1_2.Position.X * 2.5
	end))
	v22.Maid:GiveTask(UserInputService.TouchEnded:Connect(function() --[[ Line: 199 | Upvalues: v22 (copy) ]]
		v22.LastTouchY = nil
	end))
	v22.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p1_2) --[[ Line: 204 | Upvalues: v14 (ref), v62 (ref) ]]
		if p1_2.UserInputType ~= Enum.UserInputType.Gamepad1 then
			return
		end
		if p1_2.KeyCode == Enum.KeyCode.DPadUp then
			v14 = math.clamp(v14 + 0.25, -1, 4)
		elseif p1_2.KeyCode == Enum.KeyCode.DPadDown then
			v14 = math.clamp(v14 - 0.25, -1, 4)
		end
		if p1_2.KeyCode == Enum.KeyCode.DPadLeft or p1_2.KeyCode == Enum.KeyCode.ButtonL1 then
			v62 = -2.5
			return
		end
		if p1_2.KeyCode ~= Enum.KeyCode.DPadRight and p1_2.KeyCode ~= Enum.KeyCode.ButtonR1 then
			return
		end
		v62 = 2.5
	end))
	task.delay(0.5, function() --[[ Line: 224 | Upvalues: v22 (copy) ]]
		local AnimalModel = v22.CosmeticModel.AnimalModel
		AnimalModel:PivotTo(v22.InspectModel.HorsePad.CFrame + Vector3.new(0, AnimalModel.HumanoidRootPart.Size.Y / 2 - (AnimalModel.HumanoidRootPart.Position - AnimalModel.PrimaryPart.Position).Y, 0))
	end)
	v22.CosmeticModel.AnimalModel.HumanoidRootPart.Anchored = true
	v22.CosmeticModel.AnimalModel.Parent = workspace
	v4.Prompt({
		Type = "Inspect",
		BackgroundNotVisible = true,
		Setup = function(p1_2) --[[ Setup | Line: 234 ]] end,
		Run = function() --[[ Run | Line: 237 | Upvalues: v9 (ref), v22 (copy) ]]
			v9.Open({
				SpeciesAsName = true,
				SlotValue = v22.SlotInfo
			})
		end,
		Cancel = function() --[[ Cancel | Line: 243 | Upvalues: v22 (copy) ]]
			v22:Destroy()
			return true
		end
	})
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 254 | Upvalues: v10 (copy) ]]
	v10.QuickStart()
	workspace.Camera.FieldOfView = 70
	p1.Maid:DoCleaning()
	task.delay(0.5, function() --[[ Line: 259 | Upvalues: v10 (ref) ]]
		v10.QuickEnd()
	end)
end
function t.Init(p1) --[[ Init | Line: 264 | Upvalues: v11 (ref), Sonar (copy) ]]
	task.delay(0.5, function() --[[ Line: 265 | Upvalues: v11 (ref), Sonar (ref) ]]
		v11 = Sonar("PremiumShopGui")
	end)
end
t:Init()
return t