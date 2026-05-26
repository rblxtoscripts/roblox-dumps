-- https://lua.expert/
local VehicleProperties = require(game.ReplicatedStorage:WaitForChild("VehicleProperties"))
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Misc = require(game.ReplicatedStorage:WaitForChild("Misc"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v2 = Library:Load("Utility")
Library:Load("Events")
local v3 = Library:Load("SoundFX")
local v4 = Library:Load("Network")
local v5 = nil
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
MainGui:WaitForChild("Menu"):WaitForChild("Menu")
local VirtualThrottleCarControlls = MainGui:WaitForChild("Other"):WaitForChild("VirtualThrottleCarControlls")
local VirtualTurnCarControlls = MainGui:WaitForChild("Other"):WaitForChild("VirtualTurnCarControlls")
game:GetService("ContextActionService")
local v6 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled
local v7 = nil
local v8 = nil
local v9 = nil
local v10 = false
spawn(function() --[[ Line: 35 | Upvalues: v2 (copy), v10 (ref) ]]
	v10 = (v2:SendData("GetGamePasses", "PlayerChannel", 10) or (v2:SendData("GetGamePasses", "PlayerChannel", 10) or {})).Radio
end)
workspace.Main.RadioPurchased.OnClientEvent:connect(function() --[[ Line: 40 | Upvalues: v10 (ref) ]]
	v10 = true
end)
workspace.Main.AssetIdChanged.AssetIdChanged.Event:connect(function(p1, p2) --[[ Line: 46 | Upvalues: LocalPlayer (copy), v2 (copy) ]]
	if not LocalPlayer.Character or (not LocalPlayer.Character:FindFirstChild("Humanoid") or (not LocalPlayer.Character.Humanoid.SeatPart or (not LocalPlayer.Character.Humanoid.SeatPart:FindFirstChild("Music") or LocalPlayer.Character.Humanoid.SeatPart.Music ~= p1))) then
		return
	end
	v2:SendData("SetRadioSong", "VehicleChannel", nil, p2, p1)
end)
function SelectSong(p1, p2, p3) --[[ SelectSong | Line: 53 | Upvalues: v10 (ref), v5 (ref), v2 (copy), LocalPlayer (copy), v1 (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	if v10 or v5:FindFirstChild("Boat") then
		v2:SendData("SetRadioSong", "VehicleChannel", nil, 0, v5.Driver.Music)
		workspace.Main.OpenAssetPicker.OpenAssetPicker:Fire(LocalPlayer.Character.Humanoid.SeatPart.Music, "Audio")
		return
	end
	game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer, v1.GamePasses.Radio.ProductId)
end
debounce = false
function honkHorn(p1, p2, p3) --[[ honkHorn | Line: 70 | Upvalues: v5 (ref) ]]
	if debounce or p2 ~= Enum.UserInputState.Begin then
		return
	end
	debounce = true
	v5.LightMain.Horn:Play()
	wait(v5.LightMain.Horn.TimeLength)
	debounce = false
end
function ExitVehicle(p1, p2) --[[ ExitVehicle | Line: 81 | Upvalues: LocalPlayer (copy), v4 (copy) ]]
	if p1 ~= nil and p1 ~= Enum.UserInputState.Begin then
		return
	end
	if p2 and (p2.Parent and p2.Occupant) then
		if p2.Parent:FindFirstChild("Boat") ~= nil or not p2:FindFirstChild("ExitDir") then
			LocalPlayer.Character.Humanoid.Sit = false
			LocalPlayer.Character.Humanoid.Jump = true
			return
		end
		local v1 = p2.Occupant.Parent
		local v3 = p2.ExitDir.Value == "Left" and -p2.CFrame.RightVector or p2.CFrame.RightVector
		local v5, _, _2 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p2.Position + Vector3.new(0, 3, 0), v3 * 8), { p2.Parent, LocalPlayer.Character })
		if v5 == nil then
			if p2:FindFirstChild("SeatWeld") then
				p2.SeatWeld:Destroy()
			end
			LocalPlayer.Character.Humanoid.Sit = false
			local _3, _4, _5, v6, v7, v8, v9, v10, v11, v12, v13, v14 = v1.HumanoidRootPart.CFrame:components()
			local v15 = p2.Position + Vector3.new(0, 3, 0) + v3 * 6
			v1.HumanoidRootPart.CFrame = CFrame.new(v15.X, v15.Y, v15.Z, v6, v7, v8, v9, v10, v11, v12, v13, v14)
		else
			if p2:FindFirstChild("SeatWeld") then
				p2.SeatWeld:Destroy()
			end
			LocalPlayer.Character.Humanoid.Sit = false
			LocalPlayer.Character.Humanoid.Jump = true
			v1.HumanoidRootPart.CFrame = v1.HumanoidRootPart.CFrame + Vector3.new(0, 8, 0)
		end
		v4:FireServer("RemoveSeatWeld", p2)
	else
		if p2 and (p2.Parent and p2.Occupant) then
			return
		end
		LocalPlayer.Character.Humanoid.Sit = false
		LocalPlayer.Character.Humanoid.Jump = true
	end
end
v4:BindEvents({
	ExitVehicle = ExitVehicle
})
function ChangeHatVisiblity(p1) --[[ ChangeHatVisiblity | Line: 139 | Upvalues: LocalPlayer (copy) ]]
	local UniformHat = LocalPlayer.Character:FindFirstChild("UniformHat", true)
	for i, v in ipairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") and v:FindFirstChild("Handle") then
			if UniformHat then
				v.Handle.Transparency = if p1 and v:FindFirstChild("UniformHat") ~= nil then 0 else 1
				continue
			end
			v.Handle.Transparency = if p1 then 0 else 1
		end
	end
end
local v11 = false
function ToggleFirstPerson(p1, p2, p3) --[[ ToggleFirstPerson | Line: 155 | Upvalues: v11 (ref), CurrentCamera (copy), RunService (copy), LocalPlayer (copy), v5 (ref) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	if not v11 then
		v11 = true
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		RunService:BindToRenderStep("FirstPerson", Enum.RenderPriority.Camera.Value, function() --[[ Line: 162 | Upvalues: CurrentCamera (ref), LocalPlayer (ref) ]]
			CurrentCamera.CFrame = LocalPlayer.Character.Head.CFrame + Vector3.new(0, 0.5, 0)
		end)
		ChangeHatVisiblity(false)
		return
	end
	v11 = false
	RunService:UnbindFromRenderStep("FirstPerson")
	CurrentCamera.CameraType = Enum.CameraType.Custom
	if v5.Name == "Car" then
		workspace.Main.RealignCamera.RealignCamera:Fire(20, 13)
	else
		workspace.Main.RealignCamera.RealignCamera:Fire(25, 50)
	end
	ChangeHatVisiblity(true)
end
local ContextActionService = game:GetService("ContextActionService")
function WakeUpBoxes(p1) --[[ WakeUpBoxes | Line: 185 | Upvalues: Misc (copy) ]]
	for i, v in ipairs(Misc:GetBoxesInTruck(p1) or {}) do
		v.Velocity = v.Velocity + Vector3.new(0, 0.01, 0)
	end
end
local v12 = nil
local v13 = nil
local v14 = nil
local v15 = nil
local v16 = nil
local v17 = nil
local v18 = nil
local t = {}
local v19 = true
function StoodUp() --[[ StoodUp | Line: 201 | Upvalues: v8 (ref), v19 (ref), v5 (ref), GuiManager (copy), MainGui (copy), ContextActionService (copy), RunService (copy), CurrentCamera (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v17 (ref), v18 (ref), v16 (ref), VirtualThrottleCarControlls (copy), VirtualTurnCarControlls (copy), t (ref) ]]
	if v8 then
		v8.Visible = true
	end
	v19 = true
	if v5 and (v5.Parent and (v5:FindFirstChild("Base") and v5.Base:FindFirstChild("AngularVelocity"))) then
		v5.Base.AngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
		v5.Base.BodyThrust.Force = Vector3.new(0, 0, 0)
	end
	GuiManager:GetWindowDataByName("AssetPicker"):SetVisible(false)
	workspace.Main.ContextBillboardsEnabled.ContextBillboardsEnabled:Fire(true)
	if _G.GamepadEnabled or game:GetService("UserInputService").MouseEnabled then
		MainGui.Notifications.VehicleHelpPC.Visible = false
		MainGui.Notifications.VehicleHelpGamepad.Visible = false
		if _G.GamepadEnabled then
			MainGui.Notifications.EmoteGamepadHelp.Visible = true
			MainGui.Notifications.MenuGamepadHelp.Visible = true
		end
	end
	ContextActionService:UnbindAction("RTCar")
	ContextActionService:UnbindAction("LTCar")
	ContextActionService:UnbindAction("ForwardKey")
	ContextActionService:UnbindAction("ReverseKey")
	ContextActionService:UnbindAction("View")
	ContextActionService:UnbindAction("Horn")
	ContextActionService:UnbindAction("Jump")
	ContextActionService:UnbindAction("Music")
	RunService:UnbindFromRenderStep("FirstPerson")
	RunService:UnbindFromRenderStep("MoveWheels")
	RunService:UnbindFromRenderStep("UpdateBoat")
	CurrentCamera.CameraType = Enum.CameraType.Custom
	ChangeHatVisiblity(true)
	if v12 then
		v12:disconnect()
	end
	if v13 then
		v13:disconnect()
	end
	if v14 then
		v14:disconnect()
	end
	if v15 then
		v15:disconnect()
	end
	if v17 then
		v17:disconnect()
	end
	if v18 then
		v18:disconnect()
	end
	if rightPressed then
		rightPressed:disconnect()
	end
	if v16 then
		v16:disconnect()
	end
	VirtualThrottleCarControlls.Visible = false
	VirtualTurnCarControlls.Visible = false
	wait(0.1)
	for i, v in ipairs(t) do
		v.AngularVelocity = 0
	end
end
function SatDown(p1) --[[ SatDown | Line: 279 | Upvalues: v5 (ref), MainGui (copy), v6 (copy), ContextActionService (copy), LocalPlayer (copy), VehicleProperties (copy), t (ref), v2 (copy), VirtualThrottleCarControlls (copy), VirtualTurnCarControlls (copy), v12 (ref), v13 (ref), v14 (ref), v15 (ref), v17 (ref), v18 (ref), v16 (ref) ]]
	if v5 == nil or v5.Parent == nil then
		return
	end
	workspace.Main.ContextBillboardsEnabled.ContextBillboardsEnabled:Fire(false)
	if _G.GamepadEnabled then
		MainGui.Notifications.VehicleHelpGamepad.Visible = true
		MainGui.Notifications.EmoteGamepadHelp.Visible = false
		MainGui.Notifications.MenuGamepadHelp.Visible = false
	elseif game:GetService("UserInputService").MouseEnabled then
		MainGui.Notifications.VehicleHelpPC.Visible = true
	end
	if not (v6 and _G.IsNewPlayer) then
		ContextActionService:BindAction("View", ToggleFirstPerson, true, Enum.KeyCode.V, Enum.KeyCode.ButtonL3, Enum.KeyCode.ButtonR3)
		ContextActionService:SetImage("View", "rbxassetid://520212839")
		ContextActionService:BindAction("Horn", honkHorn, true, Enum.KeyCode.H, Enum.KeyCode.ButtonB)
		ContextActionService:SetImage("Horn", "rbxassetid://520212899")
		ContextActionService:BindAction("Music", SelectSong, true, Enum.KeyCode.M, Enum.KeyCode.ButtonX)
		ContextActionService:SetImage("Music", "rbxassetid://2476814053")
	end
	if game.ReplicatedStorage.GlobalData.Holiday.Value == "Halloween" and (v6 and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("CandyBucket"))) then
		workspace.Main.UnequipTools:Fire()
	end
	ContextActionService:BindAction("Jump", function(p12, p2, p3) --[[ Line: 330 | Upvalues: p1 (copy) ]]
		ExitVehicle(p2, p1)
	end, true, Enum.KeyCode.Q, Enum.KeyCode.Space, Enum.KeyCode.ButtonA)
	ContextActionService:SetImage("Jump", "rbxassetid://201555244")
	local v1 = VehicleProperties[v5.Name]
	local isType = v1.Type == "Truck"
	local v22 = if v1.Type == "Boat" then true else false
	local Driver = v5.Driver
	local v3 = 0
	local v4 = isType and v5.Frame or (v22 and v5.Base or v5:FindFirstChild("TurnBodyGyro", true).Parent)
	local v52 = 0
	local v62 = false
	local v7 = false
	if v22 then
		local BodyThrust = v4.BodyThrust
		local AngularVelocity = v4.AngularVelocity
		local ForwardPower = v1.ForwardPower
		local TurnSpeed = v1.TurnSpeed
		AngularVelocity.MaxTorque = Vector3.new(0, v1.TurningPower, 0)
		game:GetService("RunService"):BindToRenderStep("UpdateBoat", Enum.RenderPriority.Camera.Value, function() --[[ Line: 355 | Upvalues: v52 (ref), Driver (copy), AngularVelocity (copy), TurnSpeed (copy), v3 (ref), BodyThrust (copy), ForwardPower (copy) ]]
			local v1 = v52 == 0 and Driver.SteerFloat or v52
			if math.abs(v1) > 0.2 then
				AngularVelocity.angularvelocity = Vector3.new(0, v1 * -1 * TurnSpeed, 0)
			else
				AngularVelocity.angularvelocity = Vector3.new(0, 0, 0)
			end
			if v3 > 0.3 then
				BodyThrust.force = Vector3.new(0, 0, v3 * -ForwardPower)
				return
			end
			if v3 < -0.3 then
				BodyThrust.force = Vector3.new(0, 0, v3 * -ForwardPower)
			else
				BodyThrust.force = Vector3.new(0, 0, 0)
			end
		end)
	else
		local v8 = LocalPlayer:GetAttribute("FastTruck")
		local v122 = v1.MaxSpeed * (if v6 then 0.85 else 0.95) * (isType and v8 or 1)
		local MaxTurnAngle = v1.MaxTurnAngle
		local TurnSpeed = v1.TurnSpeed
		local v142 = v1.TurnInPlaceSpeed * (isType and v8 ~= nil and v8 * 0.8 or 1)
		local TurnInPlaceMaxTorque = v1.TurnInPlaceMaxTorque
		local Motor = v5.MotorRight.Motor
		local Motor_2 = v5.MotorLeft.Motor
		local MotorRight = v5.RearWheels.MotorRight
		local MotorLeft = v5.RearWheels.MotorLeft
		local LeftMotor = v5.MotorLeft.LeftMotor
		local RightMotor = v5.MotorRight.RightMotor
		local TurnBodyGyro = v5:FindFirstChild("TurnBodyGyro", true)
		t = { Motor, Motor_2, MotorRight, MotorLeft }
		game:GetService("RunService"):BindToRenderStep("MoveWheels", Enum.RenderPriority.Camera.Value, function() --[[ Line: 405 | Upvalues: v52 (ref), Driver (copy), v2 (ref), MaxTurnAngle (copy), LeftMotor (copy), RightMotor (copy), Motor (copy), v3 (ref), v122 (copy), Motor_2 (copy), MotorRight (copy), MotorLeft (copy), v62 (ref), v7 (ref), TurnBodyGyro (copy), TurnInPlaceMaxTorque (copy), v4 (copy), v142 (copy), TurnSpeed (copy) ]]
			local v1 = v52 == 0 and Driver.SteerFloat or v52
			local v22 = v2:Map(v1, -1, 1, MaxTurnAngle, -MaxTurnAngle)
			LeftMotor.DesiredAngle = v22
			RightMotor.DesiredAngle = v22
			Motor.AngularVelocity = v3 * v122
			Motor_2.AngularVelocity = -v3 * v122
			MotorRight.AngularVelocity = -v3 * v122
			MotorLeft.AngularVelocity = v3 * v122
			if v62 or (v7 or (v1 == 0 or not (math.abs(v1) > 0.1))) then
				LeftMotor.MaxVelocity = TurnSpeed
				RightMotor.MaxVelocity = TurnSpeed
				TurnBodyGyro.MaxTorque = Vector3.new(0, 0, 0)
			else
				LeftMotor.MaxVelocity = 8
				RightMotor.MaxVelocity = 8
				TurnBodyGyro.MaxTorque = Vector3.new(0, TurnInPlaceMaxTorque, 0)
				TurnBodyGyro.CFrame = v4.CFrame * CFrame.Angles(0, v142 * -v1, 0)
			end
		end)
	end
	if _G.GamepadEnabled then
		wait()
		ContextActionService:BindAction("RTCar", function(p1, p2, p3) --[[ Line: 445 | Upvalues: v7 (ref), v3 (ref), v62 (ref), isType (copy), v5 (ref) ]]
			if not v7 then
				v3 = p3.Position.Z
			end
			if p2 == Enum.UserInputState.End then
				v62 = false
				return
			end
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			if isType then
				WakeUpBoxes(v5)
			end
			v62 = true
		end, true, Enum.KeyCode.ButtonR2)
		ContextActionService:BindAction("LTCar", function(p1, p2, p3) --[[ Line: 460 | Upvalues: v7 (ref), v3 (ref), v62 (ref) ]]
			if p3.Position.Z > 0.3 then
				v7 = true
				v3 = -p3.Position.Z / 2
				return
			end
			v7 = false
			v3 = if v62 then 1 else 0
		end, true, Enum.KeyCode.ButtonL2)
	elseif v6 then
		VirtualThrottleCarControlls.Visible = true
		VirtualTurnCarControlls.Visible = true
		v12 = VirtualThrottleCarControlls.Throttle.InputBegan:connect(function(p1) --[[ Line: 487 | Upvalues: v7 (ref), v3 (ref), isType (copy), v5 (ref), v62 (ref) ]]
			if not v7 then
				v3 = 1
			end
			if isType then
				WakeUpBoxes(v5)
			end
			v62 = true
		end)
		v13 = VirtualThrottleCarControlls.Throttle.InputEnded:connect(function(p1) --[[ Line: 495 | Upvalues: v62 (ref), v7 (ref), v3 (ref) ]]
			v62 = false
			if v7 then
				return
			end
			v3 = 0
		end)
		v14 = VirtualThrottleCarControlls.Reverse.InputBegan:connect(function(p1) --[[ Line: 502 | Upvalues: v3 (ref), v7 (ref) ]]
			v3 = -0.5
			v7 = true
		end)
		v15 = VirtualThrottleCarControlls.Reverse.InputEnded:connect(function(p1) --[[ Line: 507 | Upvalues: v7 (ref), v62 (ref), v3 (ref) ]]
			v7 = false
			if v62 then
				return
			end
			v3 = 0
		end)
		v17 = VirtualTurnCarControlls.Left.InputBegan:connect(function(p1) --[[ Line: 521 | Upvalues: v52 (ref) ]]
			v52 = -1
		end)
		v18 = VirtualTurnCarControlls.Left.InputEnded:connect(function(p1) --[[ Line: 525 | Upvalues: v52 (ref) ]]
			v52 = 0
		end)
		rightPressed = VirtualTurnCarControlls.Right.InputBegan:connect(function(p1) --[[ Line: 529 | Upvalues: v52 (ref) ]]
			v52 = 1
		end)
		v16 = VirtualTurnCarControlls.Right.InputEnded:connect(function(p1) --[[ Line: 533 | Upvalues: v52 (ref) ]]
			v52 = 0
		end)
	else
		ContextActionService:BindAction("ForwardKey", function(p1, p2, p3) --[[ Line: 544 | Upvalues: v62 (ref), v7 (ref), v3 (ref), isType (copy), v5 (ref) ]]
			if p2 == Enum.UserInputState.End then
				v62 = false
				if v7 then
					return Enum.ContextActionResult.Pass
				end
				v3 = 0
			else
				if p2 ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				end
				if isType then
					WakeUpBoxes(v5)
				end
				v62 = true
				if v7 then
					return Enum.ContextActionResult.Pass
				end
				v3 = 1
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.W, Enum.KeyCode.Up)
		ContextActionService:BindAction("ReverseKey", function(p1, p2, p3) --[[ Line: 566 | Upvalues: v7 (ref), v62 (ref), v3 (ref) ]]
			if p2 == Enum.UserInputState.End then
				v7 = false
				v3 = if v62 then 1 else 0
			else
				if p2 ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				end
				v7 = true
				v3 = -0.5
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.S, Enum.KeyCode.Down)
	end
end
function Seated(p1, p2) --[[ Seated | Line: 592 | Upvalues: v5 (ref), VehicleProperties (copy), v8 (ref), v3 (copy), ContextActionService (copy) ]]
	if not p1 and p2 == nil then
		StoodUp()
		v5 = nil
		return
	end
	if not p2 or (not p2.Parent or (not VehicleProperties[p2.Parent.Name] or p2.Name ~= "Driver")) then
		return
	end
	if v8 then
		v8.Visible = not p1
	end
	if p2.Name == "Driver" then
		if p1 then
			v3:PlaySound("CarDoorClose")
			v5 = p2.Parent
			SatDown(p2)
		else
			StoodUp()
			v5 = nil
		end
	else
		if p2.Name ~= "Passenger" then
			return
		end
		if p1 then
			ContextActionService:BindAction("Jump", function(p1, p22, p3) --[[ Line: 621 | Upvalues: p2 (copy) ]]
				ExitVehicle(p22, p2)
			end, true, Enum.KeyCode.Space, Enum.KeyCode.E)
			ContextActionService:SetImage("Jump", "rbxassetid://773407760")
			v3:PlaySound("CarDoorClose")
			return
		end
		ContextActionService:UnbindAction("Jump")
	end
end
local v20 = nil
local function AddConnection(p1) --[[ AddConnection | Line: 634 | Upvalues: v20 (ref) ]]
	local Humanoid = p1:WaitForChild("Humanoid", 10)
	if not Humanoid then
		return
	end
	if v20 then
		v20:disconnect()
	end
	v20 = Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 638 | Upvalues: Humanoid (copy) ]]
		local SeatPart = Humanoid.SeatPart
		Seated(SeatPart ~= nil, SeatPart)
	end)
end
task.spawn(function() --[[ Line: 650 | Upvalues: v8 (ref), PlayerGui (copy), LocalPlayer (copy), v9 (ref), MainGui (copy), v7 (ref), GuiManager (copy), v2 (copy) ]]
	spawn(function() --[[ Line: 654 | Upvalues: v8 (ref), PlayerGui (ref), LocalPlayer (ref) ]]
		if not game:GetService("UserInputService").TouchEnabled then
			return
		end
		v8 = PlayerGui:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
		if not _G.IsNewPlayer then
			return
		end
		local v1 = false
		LocalPlayer.Character.Humanoid.Seated:connect(function(p1, p2) --[[ Line: 660 | Upvalues: v1 (ref), v8 (ref) ]]
			if p2 then
				v1 = true
				local Image = v8.Image
				local ImageRectOffset = v8.ImageRectOffset
				local ImageRectSize = v8.ImageRectSize
				while v1 do
					v8.Image = "rbxassetid://2217771325"
					v8.ImageRectSize = Vector2.new(0, 0)
					v8.ImageRectOffset = Vector2.new(0, 0)
					wait(1)
					v8.Image = Image
					v8.ImageRectSize = ImageRectSize
					v8.ImageRectOffset = ImageRectOffset
					wait(1)
				end
			else
				v1 = false
			end
		end)
	end)
	local function ChildAdded(p1) --[[ ChildAdded | Line: 684 | Upvalues: PlayerGui (ref), v9 (ref), v8 (ref), MainGui (ref), v7 (ref), GuiManager (ref), v2 (ref) ]]
		if p1.Name ~= "ContextActionGui" then
			return
		end
		v9 = PlayerGui.ContextActionGui:WaitForChild("ContextButtonFrame")
		local UIListLayout = Instance.new("UIListLayout", v9)
		UIListLayout.Padding = UDim.new(0.03, 0)
		local function JumpButtonChanged() --[[ JumpButtonChanged | Line: 699 | Upvalues: v8 (ref), v9 (ref), MainGui (ref), UIListLayout (copy) ]]
			if v8 and v8.Visible then
				v9.AnchorPoint = Vector2.new(1, 1)
				v9.Position = UDim2.new(1, 0, 0, v8.AbsolutePosition.Y)
				v9.Size = UDim2.new(0.09, 0, 1, MainGui.AbsoluteSize.Y - v8.AbsolutePosition.Y)
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
			else
				v9.AnchorPoint = Vector2.new(1, 0.5)
				v9.Position = UDim2.new(1, 0, 0.5, 0)
				v9.Size = UDim2.new(0.09, 0, 1, 0)
				UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
			end
		end
		JumpButtonChanged()
		if v8 then
			v7 = v8:GetPropertyChangedSignal("Visible"):Connect(JumpButtonChanged)
		end
		local function AdjustButton(p1) --[[ AdjustButton | Line: 726 ]]
			if _G.IsNewPlayer then
				spawn(function() --[[ Line: 728 | Upvalues: p1 (copy) ]]
					while p1 and p1.Parent do
						p1.ActionIcon.ImageColor3 = Color3.new(0.5, 0.5, 0.5)
						wait(1)
						if not (p1 and p1.Parent) then
							continue
						end
						p1.ActionIcon.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
						wait(1)
					end
				end)
			end
			p1.Size = UDim2.new(1, 0, 1, 0)
			Instance.new("UIAspectRatioConstraint", p1)
		end
		local v1 = GuiManager:GetWindowDataByName("PlayerList")
		local function RefreshPlayerListVisible() --[[ RefreshPlayerListVisible | Line: 749 | Upvalues: v9 (ref), v2 (ref), v1 (copy) ]]
			if #v9:GetChildren() > 1 and v2:GuiIsOverlapping(v9, v1.Object) then
				v1:SetVisible(false)
			else
				v1:SetVisible(true)
			end
		end
		if #v9:GetChildren() > 1 and v2:GuiIsOverlapping(v9, v1.Object) then
			v1:SetVisible(false)
		else
			v1:SetVisible(true)
		end
		v9.ChildAdded:connect(function(p1) --[[ Line: 759 | Upvalues: AdjustButton (copy), v9 (ref), v2 (ref), v1 (copy) ]]
			AdjustButton(p1)
			if #v9:GetChildren() > 1 and v2:GuiIsOverlapping(v9, v1.Object) then
				v1:SetVisible(false)
			else
				v1:SetVisible(true)
			end
		end)
		v9.ChildRemoved:connect(function(p1) --[[ Line: 764 | Upvalues: v9 (ref), v2 (ref), v1 (copy) ]]
			if #v9:GetChildren() > 1 and v2:GuiIsOverlapping(v9, v1.Object) then
				v1:SetVisible(false)
			else
				v1:SetVisible(true)
			end
		end)
		for i, v in ipairs(v9:GetChildren()) do
			if v:IsA("GuiButton") then
				AdjustButton(v)
			end
		end
	end
	PlayerGui.ChildAdded:connect(ChildAdded)
	if not PlayerGui:FindFirstChild("ContextActionGui") then
		return
	end
	ChildAdded(PlayerGui.ContextActionGui)
end)
LocalPlayer.CharacterAdded:connect(AddConnection)
spawn(function() --[[ Line: 787 | Upvalues: v20 (ref), LocalPlayer (copy), AddConnection (copy) ]]
	local count = 30
	while v20 == nil do
		if LocalPlayer.Character then
			AddConnection(LocalPlayer.Character)
		end
		count = count - 1
		if count <= 0 then
			break
		end
		wait(1)
	end
end)