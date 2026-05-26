-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
Debris = game:GetService("Debris")
CIS = game:GetService("ContextActionService")
RunService = game:GetService("RunService")
PlayerMouse = game.Players.LocalPlayer:GetMouse()
Assets = require(Tool:WaitForChild("Assets"))
Data = Assets.Data
Character = nil
Player = nil
Humanoid = nil
Torso = nil
FrontMotor = nil
BackMotor = nil
ExhaustSmoke = nil
RotationForce = nil
ThrustForce = nil
TurnGyro = nil
Body = nil
BaseUrl = Assets.BaseUrl
BasePart = Instance.new("Part")
BasePart.Material = Enum.Material.Plastic
BasePart.Shape = Enum.PartType.Block
BasePart.TopSurface = Enum.SurfaceType.Smooth
BasePart.BottomSurface = Enum.SurfaceType.Smooth
BasePart.FormFactor = Enum.FormFactor.Custom
BasePart.Size = Vector3.new(0.2, 0.2, 0.2)
BasePart.Anchored = false
BasePart.CanCollide = true
BasePart.Locked = true
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local VirtualThrottleCarControlls = MainGui:WaitForChild("Other"):WaitForChild("VirtualThrottleCarControlls")
local VirtualTurnCarControlls = MainGui:WaitForChild("Other"):WaitForChild("VirtualTurnCarControlls")
local v1 = nil
local v2 = nil
local v3 = nil
local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
local v8 = nil
local ContextActionService = game:GetService("ContextActionService")
local v9 = nil
local v10 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
AllAnimations = {}
Animations = {
	Hold = {
		FadeTime = nil,
		Weight = nil,
		Speed = nil,
		Animation = Tool:WaitForChild("Hold")
	},
	HoldR15 = {
		FadeTime = nil,
		Weight = nil,
		Speed = nil,
		Animation = Tool:WaitForChild("HoldR15")
	}
}
Sounds = {
	Honk = Handle:WaitForChild("Honk"),
	Engine = Handle:WaitForChild("Running")
}
Controls = {
	Forward = {
		Key = "w",
		KeyAlt = "Up",
		ByteKey = 17,
		ByteKeyAlt = 273,
		Mode = false
	},
	Backward = {
		Key = "s",
		KeyAlt = "Down",
		ByteKey = 18,
		ByteKeyAlt = 274,
		Mode = false
	},
	Left = {
		Key = "a",
		KeyAlt = "Left",
		ByteKey = 20,
		ByteKeyAlt = 276,
		Mode = false
	},
	Right = {
		Key = "d",
		KeyAlt = "Right",
		ByteKey = 19,
		ByteKeyAlt = 275,
		Mode = false
	}
}
Rate = 1 / 60
Gravity = 196.2
Special = {
	Allowed = false,
	Enabled = true,
	Active = false,
	Duration = 0,
	ReloadTime = 60
}
local t = {
	Acceleration = {
		Normal = 200
	},
	Deceleration = {
		Normal = 100
	},
	MovementSpeed = {
		Normal = {
			Min = 20,
			Max = 70
		}
	}
}
local t2 = {
	TurnAlpha = 0.7,
	AlphaDampening = 0.3
}
local t3 = {}
t3.Min = 1.5
t3.Max = 1.5
t2.Speed = t3
t.TurnSpeed = t2
Speed = t
MaxSpeed = {
	Movement = Speed.MovementSpeed.Normal,
	Turn = Speed.TurnSpeed.Speed,
	Acceleration = Speed.Acceleration.Normal,
	Deceleration = Speed.Deceleration.Normal
}
CurrentSpeed = {
	Movement = 0,
	Turn = 0
}
Honk = {
	Honking = false,
	LastHonk = 0,
	ReloadTime = 0
}
Jump = {
	Jumping = false,
	LastJump = 0,
	ReloadTime = 1,
	JumpForce = 30
}
ToolEquipped = false
LocalObjects = {}
Tool.Enabled = true
function RayCast(p1, p2, p3, p4) --[[ RayCast | Line: 138 ]]
	local v1 = if type(p4) == "table" and p4 then p4 else { p4 }
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(p1, p2.unit * (p3 or 999.999)), v1)
end
function SetAnimation(p1, p2) --[[ SetAnimation | Line: 143 ]]
	if p1 == "PlayAnimation" and (p2 and (ToolEquipped and Humanoid)) then
		for k, v in pairs(AllAnimations) do
			if v.Animation == p2.Animation then
				v.AnimationTrack:Stop()
				table.remove(AllAnimations, k)
			end
		end
		local v1 = Humanoid:LoadAnimation(p2.Animation)
		local v2 = AllAnimations
		table.insert(v2, {
			Animation = p2.Animation,
			AnimationTrack = v1
		})
		v1:Play(p2.FadeTime, p2.Weight, p2.Speed)
	else
		if p1 ~= "StopAnimation" or not p2 then
			return
		end
		for k, v in pairs(AllAnimations) do
			if v.Animation == p2.Animation then
				v.AnimationTrack:Stop()
				table.remove(AllAnimations, k)
			end
		end
	end
end
function CheckIfAlive() --[[ CheckIfAlive | Line: 166 ]]
	return Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid.Health > 0 and (Player and Player.Parent))))) and true or false
end
function Modify(p1, p2) --[[ Modify | Line: 171 ]]
	if p1 == "PlayAnimation" and (p2 and (ToolEquipped and Humanoid)) then
		SetAnimation("PlayAnimation", p2)
		return
	end
	if p1 == "StopAnimation" and p2 then
		SetAnimation("StopAnimation", p2)
		return
	end
	if p1 == "PlaySound" and p2 then
		p2:Play()
		return
	end
	if p1 == "StopSound" and p2 then
		p2:Stop()
		return
	end
	if p1 == "MousePosition" then
		return {
			Position = PlayerMouse.Hit.p,
			Target = PlayerMouse.Target
		}
	end
end
function GetAllConnectedParts(p1) --[[ GetAllConnectedParts | Line: 198 ]]
	local t = {}
	local function v1(p1) --[[ GetConnectedParts | Line: 200 | Upvalues: t (copy), v1 (copy) ]]
		for k, v in pairs(p1:GetConnectedParts()) do
			local v12 = false
			for k2, v2 in pairs(t) do
				if v == v2 then
					v12 = true
				end
			end
			if not v12 then
				table.insert(t, v)
				v1(v)
			end
		end
	end
	v1(p1)
	return t
end
local v13 = nil
function ThrustUpdater() --[[ ThrustUpdater | Line: 222 | Upvalues: v13 (ref) ]]
	for k, v in pairs(CurrentSpeed) do
		CurrentSpeed[k] = 0
	end
	for k, v in pairs(Controls) do
		Controls[k].Mode = false
	end
	while ToolEquipped and (Body and (Body.Parent and (CheckIfAlive() and (RotationForce and (RotationForce.Parent and (ThrustForce and (ThrustForce.Parent and (TurnGyro and TurnGyro.Parent)))))))) do
		RotationForce.angularvelocity = Vector3.new(0, CurrentSpeed.Turn, 0)
		if math.abs(CurrentSpeed.Turn) > Speed.TurnSpeed.AlphaDampening then
			local v2 = CurrentSpeed
			local Turn_3 = CurrentSpeed.Turn
			local AlphaDampening = Speed.TurnSpeed.AlphaDampening
			v2.Turn = Turn_3 - AlphaDampening * (math.abs(CurrentSpeed.Turn) / CurrentSpeed.Turn)
		else
			CurrentSpeed.Turn = 0
		end
		if not Controls.Forward.Mode or Controls.Backward.Mode then
			CurrentSpeed.Movement = CurrentSpeed.Movement * 0.99
		end
		local Magnitude = Vector3.new(Body.Velocity.X, 0, Body.Velocity.Z).Magnitude
		if Magnitude > 3 and (ThrustForce.velocity.Magnitude > 3 and 0.7 * ThrustForce.velocity.Magnitude < math.abs(Magnitude - ThrustForce.velocity.Magnitude)) then
			CurrentSpeed.Movement = CurrentSpeed.Movement * 0.9
		end
		if Controls.Forward.Mode then
			local v5 = CurrentSpeed
			local Max = MaxSpeed.Movement.Max
			v5.Movement = math.min(Max, CurrentSpeed.Movement + MaxSpeed.Acceleration * Rate)
		end
		if Controls.Backward.Mode then
			local v7 = CurrentSpeed
			v7.Movement = math.max(-MaxSpeed.Movement.Min, CurrentSpeed.Movement - MaxSpeed.Deceleration * (if CurrentSpeed.Movement > 0 then 2.8 else 1) * Rate)
		end
		if v13 then
			local v11 = CurrentSpeed.Turn + Speed.TurnSpeed.TurnAlpha * -v13.X
			if v13.X < 0 then
				local v12 = CurrentSpeed
				v12.Turn = math.min(Speed.TurnSpeed.Speed.Max, v11)
			else
				local v132 = CurrentSpeed
				v132.Turn = math.max(-Speed.TurnSpeed.Speed.Min, v11)
			end
		else
			if Controls.Left.Mode then
				local v15 = CurrentSpeed
				local Max = Speed.TurnSpeed.Speed.Max
				v15.Turn = math.min(Max, CurrentSpeed.Turn + Speed.TurnSpeed.TurnAlpha)
			end
			if Controls.Right.Mode then
				local v17 = CurrentSpeed
				local v18 = -Speed.TurnSpeed.Speed.Min
				v17.Turn = math.max(v18, CurrentSpeed.Turn - Speed.TurnSpeed.TurnAlpha)
			end
		end
		local lookVector = Torso.CFrame.lookVector
		local Unit = Vector3.new(lookVector.x, 0, lookVector.z).Unit
		local v20 = Unit * CurrentSpeed.Movement
		ThrustForce.velocity = Vector3.new(v20.X, ThrustForce.velocity.Y, v20.Z)
		local v22 = -CurrentSpeed.Turn * 0.5235987755982988 / 4
		TurnGyro.cframe = CFrame.Angles(v22 * Unit.x, 0, v22 * Unit.z)
		local v23 = -CurrentSpeed.Movement
		local v24 = 999999999 * (v23 / math.abs(CurrentSpeed.Movement))
		local v25 = CurrentSpeed.Movement / 250
		for k, v in pairs({ FrontMotor, BackMotor }) do
			if v and v.Parent then
				v.DesiredAngle = v24
				v.MaxVelocity = v25
			end
		end
		for k, v in pairs(ExhaustSmoke) do
			if v and v.Parent then
				v.Opacity = math.min(math.abs(CurrentSpeed.Movement), 10) / 10 * 0.5
			end
		end
		Sounds.Engine.Pitch = math.abs(CurrentSpeed.Movement / MaxSpeed.Movement.Max) * 1 + 1
		wait(Rate)
	end
end
function SpawnVehicle() --[[ SpawnVehicle | Line: 326 ]]
	Handle.Transparency = 1
	local v1 = script.Parent.CreateBike:InvokeServer(Tool, Torso)
	Body = v1.Vehicle
	FrontMotor = Body.FrontMotor
	BackMotor = Body.BackMotor
	ExhaustSmoke = v1.Tables.ExhaustSmoke
	RotationForce = Torso.BodyAngularVelocity
	ThrustForce = Torso.BodyVelocity
	TurnGyro = Torso.BodyGyro
	local v2, _, _2 = RayCast(Torso.Position, Vector3.new(0, -1, 0), Torso.Size.Y * 2, { Torso.Parent })
	if v2 then
		local v3 = Torso
		local v4 = Torso.CFrame
		v3.CFrame = v4 + Vector3.new(0, Torso.Parent:GetModelSize().Y / 2 + 1.5, 0)
	end
	Humanoid.PlatformStand = true
	task.spawn(function() --[[ Line: 356 ]]
		local v1 = if Humanoid.RigType == Enum.HumanoidRigType.R15 then "R15" else "R6"
		Modify("PlaySound", Sounds.Engine)
		if v1 == "R6" then
			Modify("PlayAnimation", Animations.Hold)
		else
			Modify("PlayAnimation", Animations.HoldR15)
		end
	end)
	task.spawn(ThrustUpdater)
end
function FreezePlayer() --[[ FreezePlayer | Line: 376 ]]
	CheckIfAlive()
end
function CleanUp() --[[ CleanUp | Line: 394 ]]
	Handle.Velocity = Vector3.new(0, 0, 0)
	Handle.RotVelocity = Vector3.new(0, 0, 0)
	script.Parent.CleanupBike:InvokeServer(Tool, Torso)
end
function CheckIfAlive() --[[ CheckIfAlive | Line: 401 ]]
	return Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid.Health > 0 and (Torso and (Torso.Parent and (Player and Player.Parent))))))) and true or false
end
function OnInput(p1, p2) --[[ OnInput | Line: 407 | Upvalues: v13 (ref) ]]
	if not (ToolEquipped and (p2 and CheckIfAlive())) then
		return
	end
	if p1 == "GamepadThumbstickMove" then
		v13 = p2.Position
	end
	if p1 ~= "KeyPress" then
		return
	end
	local Down = p2.Down
	local Key = p2.Key
	local v1 = string.byte(Key)
	for k, v in pairs(Controls) do
		if Key == v.Key or (v1 == v.ByteKey or (Key == v.KeyAlt or v1 == v.ByteKeyAlt)) then
			Controls[k].Mode = Down
		end
	end
	if Key == " " and Down then
		if not (math.abs(tick() - Jump.LastJump) > Jump.ReloadTime) or (Jump.Jumping or not (ThrustForce and ThrustForce.Parent)) then
			return
		end
		Jump.Jumping = true
		local sum = 0
		for k, v in pairs((GetAllConnectedParts(Body))) do
			sum = sum + v:GetMass()
		end
		local v4 = ThrustForce
		local X = ThrustForce.maxForce.X
		local v5 = sum * Gravity * 100
		v4.maxForce = Vector3.new(X, v5, ThrustForce.maxForce.Z)
		local v6 = ThrustForce
		local v7 = Vector3.new(0, 1, 0) * Jump.JumpForce
		local X_2 = ThrustForce.velocity.X
		v6.velocity = v7 + Vector3.new(X_2, 0, ThrustForce.velocity.Z)
		wait(0.1)
		local v8 = ThrustForce
		local X_3 = ThrustForce.maxForce.X
		v8.maxForce = Vector3.new(X_3, 0, ThrustForce.maxForce.Z)
		local v9 = ThrustForce
		local X_4 = ThrustForce.velocity.X
		v9.velocity = Vector3.new(X_4, 0, ThrustForce.velocity.Z)
		Jump.LastJump = tick()
		Jump.Jumping = false
		return
	end
	if Key ~= "h" or not Down then
		return
	end
	local Honk_2 = Sounds.Honk
	if not (tick() - Honk.LastHonk >= Honk_2.TimeLength + Honk.ReloadTime) or Honk.Honking then
		return
	end
	Honk.Honking = true
	local v10 = Honk_2:Clone()
	Debris:AddItem(v10, Honk_2.TimeLength)
	v10.Parent = Body
	v10:Play()
	Honk.LastHonk = tick()
	Honk.Honking = false
end
function Equipped(p1) --[[ Equipped | Line: 459 | Upvalues: v10 (copy), ContextActionService (copy), VirtualThrottleCarControlls (copy), VirtualTurnCarControlls (copy), v9 (ref), PlayerGui (copy), v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), v8 (ref) ]]
	if not Tool.Parent:FindFirstChild("Humanoid") or Tool.Parent.Humanoid.Sit ~= false then
		return
	end
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	Torso = Character:FindFirstChild("HumanoidRootPart")
	if not CheckIfAlive() then
		return
	end
	spawn(CleanUp)
	spawn(SpawnVehicle)
	ToolEquipped = true
	if not CheckIfAlive() then
		return
	end
	local v12 = Vector3.new(0, 0, 0)
	spawn(function() --[[ Line: 483 | Upvalues: v12 (ref) ]]
		while ToolEquipped do
			wait(0.1)
			if v12.Magnitude - Handle.Velocity.Magnitude > 20 then
				OnInput("KeyPress", {
					Key = " ",
					Down = true
				})
			end
			v12 = Handle.Velocity
		end
	end)
	if v10 then
		ContextActionService:BindAction("Horn", function() --[[ Line: 573 ]]
			OnInput("KeyPress", {
				Key = "h",
				Down = true
			})
		end, true, Enum.KeyCode.H, Enum.KeyCode.ButtonB)
		ContextActionService:SetImage("Horn", "rbxassetid://520212899")
		ContextActionService:BindAction("Jump", function() --[[ Line: 576 ]]
			OnInput("KeyPress", {
				Key = " ",
				Down = true
			})
		end, true, Enum.KeyCode.LeftBracket)
		ContextActionService:SetImage("Jump", "rbxassetid://773407760")
		VirtualThrottleCarControlls.Visible = true
		VirtualTurnCarControlls.Visible = true
		v9 = PlayerGui:WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
		v9.Visible = false
		v1 = VirtualThrottleCarControlls.Throttle.InputBegan:connect(function(p1) --[[ Line: 585 ]]
			OnInput("KeyPress", {
				Key = "w",
				Down = true
			})
		end)
		v2 = VirtualThrottleCarControlls.Throttle.InputEnded:connect(function(p1) --[[ Line: 589 ]]
			OnInput("KeyPress", {
				Key = "w",
				Down = false
			})
		end)
		v3 = VirtualThrottleCarControlls.Reverse.InputBegan:connect(function(p1) --[[ Line: 593 ]]
			OnInput("KeyPress", {
				Key = "s",
				Down = true
			})
		end)
		v4 = VirtualThrottleCarControlls.Reverse.InputEnded:connect(function(p1) --[[ Line: 597 ]]
			OnInput("KeyPress", {
				Key = "s",
				Down = false
			})
		end)
		v5 = VirtualTurnCarControlls.Left.InputBegan:connect(function(p1) --[[ Line: 606 ]]
			OnInput("KeyPress", {
				Key = "a",
				Down = true
			})
		end)
		v6 = VirtualTurnCarControlls.Left.InputEnded:connect(function(p1) --[[ Line: 610 ]]
			OnInput("KeyPress", {
				Key = "a",
				Down = false
			})
		end)
		v7 = VirtualTurnCarControlls.Right.InputBegan:connect(function(p1) --[[ Line: 614 ]]
			OnInput("KeyPress", {
				Key = "d",
				Down = true
			})
		end)
		v8 = VirtualTurnCarControlls.Right.InputEnded:connect(function(p1) --[[ Line: 618 ]]
			OnInput("KeyPress", {
				Key = "d",
				Down = false
			})
		end)
		workspace.Main.SetDevTouchMovementMode:FireServer("Scriptable")
	else
		workspace.Main.SetDevComputerCameraMode:FireServer("Follow")
		p1.Button1Down:connect(function() --[[ Line: 500 ]]
			OnInput("MouseClick", {
				Down = true
			})
		end)
		p1.Button1Up:connect(function() --[[ Line: 503 ]]
			OnInput("MouseClick", {
				Down = false
			})
		end)
		p1.KeyDown:connect(function(p1) --[[ Line: 506 ]]
			OnInput("KeyPress", {
				Down = true,
				Key = p1
			})
		end)
		p1.KeyUp:connect(function(p1) --[[ Line: 509 ]]
			OnInput("KeyPress", {
				Down = false,
				Key = p1
			})
		end)
		p1.Move:connect(function() --[[ Line: 512 | Upvalues: p1 (copy) ]]
			OnInput("MouseMove", {
				Position = p1.Hit.p,
				Target = p1.Target
			})
		end)
		CIS:BindAction("OverrideLeftArrowKey", function(p1, p2, p3) --[[ Line: 516 ]]
			if p2 == Enum.UserInputState.Begin then
				OnInput("KeyPress", {
					Key = "Left",
					Down = true
				})
				return
			end
			if p2 ~= Enum.UserInputState.End then
				return
			end
			OnInput("KeyPress", {
				Key = "Left",
				Down = false
			})
		end, false, Enum.KeyCode.Left)
		CIS:BindAction("OverrideRightArrowKey", function(p1, p2, p3) --[[ Line: 525 ]]
			if p2 == Enum.UserInputState.Begin then
				OnInput("KeyPress", {
					Key = "Right",
					Down = true
				})
				return
			end
			if p2 ~= Enum.UserInputState.End then
				return
			end
			OnInput("KeyPress", {
				Key = "Right",
				Down = false
			})
		end, false, Enum.KeyCode.Right)
		CIS:BindAction("BunnyHop", function(p1, p2, p3) --[[ Line: 534 ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			OnInput("KeyPress", {
				Key = " ",
				Down = true
			})
		end, false, Enum.KeyCode.ButtonA)
		CIS:BindAction("Horn", function(p1, p2, p3) --[[ Line: 540 ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			OnInput("KeyPress", {
				Key = "h",
				Down = true
			})
		end, false, Enum.KeyCode.ButtonX)
		CIS:BindAction("ThumbstickMove", function(p1, p2, p3) --[[ Line: 546 ]]
			OnInput("GamepadThumbstickMove", {
				Position = p3.Position
			})
		end, false, Enum.KeyCode.Thumbstick1)
		CIS:BindAction("RightTriggerPressed", function(p1, p2, p3) --[[ Line: 550 ]]
			if p2 == Enum.UserInputState.Begin then
				OnInput("KeyPress", {
					Key = "w",
					Down = true
				})
				return
			end
			if p2 ~= Enum.UserInputState.End then
				return
			end
			OnInput("KeyPress", {
				Key = "w",
				Down = false
			})
		end, false, Enum.KeyCode.ButtonR2)
		CIS:BindAction("LeftTriggerPressed", function(p1, p2, p3) --[[ Line: 558 ]]
			if p2 == Enum.UserInputState.Begin then
				OnInput("KeyPress", {
					Key = "s",
					Down = true
				})
				return
			end
			if p2 ~= Enum.UserInputState.End then
				return
			end
			OnInput("KeyPress", {
				Key = "s",
				Down = false
			})
		end, false, Enum.KeyCode.ButtonL2)
	end
	Humanoid:ChangeState(Enum.HumanoidStateType.None)
end
function Unequipped() --[[ Unequipped | Line: 635 | Upvalues: v10 (copy), v1 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v8 (ref), v7 (ref), ContextActionService (copy), VirtualThrottleCarControlls (copy), VirtualTurnCarControlls (copy), v9 (ref) ]]
	spawn(CleanUp)
	spawn(FreezePlayer)
	for k, v in pairs(Sounds) do
		v:Stop()
		spawn(function() --[[ Line: 640 | Upvalues: v (copy) ]]
			Modify("StopSound", v)
		end)
	end
	if CheckIfAlive() then
		Humanoid.PlatformStand = false
	end
	ToolEquipped = false
	if v10 then
		v1:disconnect()
		v2:disconnect()
		v3:disconnect()
		v4:disconnect()
		v5:disconnect()
		v6:disconnect()
		v8:disconnect()
		v7:disconnect()
		ContextActionService:UnbindAction("Horn")
		ContextActionService:UnbindAction("Jump")
		VirtualThrottleCarControlls.Visible = false
		VirtualTurnCarControlls.Visible = false
		workspace.Main.SetDevTouchMovementMode:FireServer("UserChoice")
		if v9 then
			v9.Visible = true
		end
	else
		workspace.Main.SetDevComputerCameraMode:FireServer("UserChoice")
		CIS:UnbindAction("RightTriggerPressed")
		CIS:UnbindAction("LeftTriggerPressed")
		CIS:UnbindAction("ThumbstickMove")
		CIS:UnbindAction("BunnyHop")
		CIS:UnbindAction("OverrideLeftArrowKey")
		CIS:UnbindAction("OverrideRightArrowKey")
	end
	LocalObjects = {}
	for k, v in pairs(AllAnimations) do
		if v and v.AnimationTrack then
			v.AnimationTrack:Stop()
		end
	end
	Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
	AllAnimations = {}
end
spawn(CleanUp)
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)