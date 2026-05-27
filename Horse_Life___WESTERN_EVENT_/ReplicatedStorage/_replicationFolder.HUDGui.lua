-- https://lua.expert/
local t = {}
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReflectionService = game:GetService("ReflectionService")
local RunService = game:GetService("RunService")
local StarterPlayer = game:GetService("StarterPlayer")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("Animal")
local v3 = Sonar("AnimalGridButton")
local v4 = Sonar("AtomicBinding")
local v5 = Sonar("Button")
local v6 = Sonar("ButtonTest")
local v7 = Sonar("CharacterControls")
local v8 = Sonar("CharacterSprintService")
local v9 = Sonar("CommunityRewardsGui")
local v10 = Sonar("Destructor")
local v11 = Sonar("DisplayUtils")
local v12 = Sonar("DynamicStatBar")
local v13 = Sonar("EventMissionsGui")
local v14 = Sonar("FormatNumber")
local v15 = Sonar("FormatString")
local v16 = Sonar("GameState")
local v17 = Sonar("GuiManager")
local v18 = Sonar("GuiUtils")
local v19 = Sonar("HelpGui")
local v20 = Sonar("HotbarService")
local v21 = Sonar("InputType")
local v22 = Sonar("InputTypeDetector")
local v23 = Sonar("InstanceUtils")
local v24 = Sonar("InteractZone")
local v25 = Sonar("InteractMenu")
local v26 = Sonar("InventoryGui")
local v27 = Sonar("IssueResponseClient")
local v28 = Sonar("ItemDataService")
local v29 = Sonar("ItemInfoFrame")
local v30 = Sonar("JournalGui")
local v31 = Sonar("TimeUtils")
local v32 = Sonar("LeaderboardGui")
local v33 = Sonar("LightingService")
local v34 = Sonar("Maid")
local v35 = Sonar("MapGui")
local v36 = Sonar("MoveToCommand")
local v37 = Sonar("NotificationsClient")
local v38 = Sonar("PlaceTypeService")
local v39 = Sonar("PlayerWrapper")
local v40 = Sonar("PremiumShop")
local v41 = Sonar("PromptClient")
local v42 = Sonar("RadialGui")
local v43 = Sonar("RemoteUtils")
local v44 = Sonar("RewardsGuiNew")
local v45 = Sonar("StableClubsGui")
local v46 = Sonar("SettingsService")
local v47 = Sonar("ShopGui")
local v48 = Sonar("Signal")
local v49 = Sonar("SprintService")
local v50 = Sonar("StablesGui")
local v51 = Sonar("StatBar")
local v52 = Sonar("State")
local v53 = Sonar("StateUtils")
local v54 = Sonar("Tool")
local v55 = Sonar("TradingCatalogGui")
local v56 = Sonar("TutorialService")
local v57 = Sonar("UINavigator")
local v58 = Sonar("SettingsGui")
local v59 = Sonar("CameraGui")
local v60 = Sonar("Constants")
local EventName = v60.EventName
local CurrentEvent = v60.CurrentEvent
local v61 = CurrentEvent and CurrentEvent.UICosmetics.EventJournalButtonIcon
local v62 = CurrentEvent and CurrentEvent.UICosmetics.CurrencyImage
local v63 = CurrentEvent and CurrentEvent.Currency
local v64 = CurrentEvent and CurrentEvent.UICosmetics.CurrencyStrokeColor
local v65 = CurrentEvent and CurrentEvent.UICosmetics.CurrencyColor
local t2 = {}
local v66 = RunService:IsStudio()
local v67 = v66 and false
local t3 = {
	{
		Buttons = { "Build", "Event", "EquipmentShop", "PremiumShop", "MapVote" },
		GameStates = { "TopFrame" }
	}
}
local t4 = {
	Enum.KeyCode.One,
	Enum.KeyCode.Two,
	Enum.KeyCode.Three,
	Enum.KeyCode.One,
	Enum.KeyCode.Two,
	Enum.KeyCode.Three
}
local t5 = {
	{
		Name = "Top",
		LayoutOrder = -9000000,
		CellSize = UDim2.fromScale(1, 1)
	},
	{
		Name = "Middle",
		LayoutOrder = 0,
		CellSize = UDim2.fromScale(1, 1)
	},
	{
		Name = "Bottom",
		LayoutOrder = 9000000,
		CellSize = UDim2.fromScale(0.8, 0.8),
		VerticalAlignment = Enum.VerticalAlignment.Top
	}
}
local t6 = { Enum.UserInputType.MouseMovement }
local v68 = v39.GetClient()
local EquippedToolChangedSignal = v68.EquippedToolChangedSignal
local ExtraHotbarSlots = v68.PlayerData.ExtraHotbarSlots
local Hotbar = v68.PlayerData.Hotbar
local MissionsChangedSignal = v68.MissionsChangedSignal
local NewTutorial = v68.PlayerCohorts.NewTutorial
local v69 = v52.fromProperty(v68.PlayerData.NewTutorialComplete, "Value")
local v70 = v52.fromProperty(v68.PlayerData.Settings.States.MobileMovementControls, "Value")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer.Backpack
local PlayerGui = LocalPlayer.PlayerGui
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local v71 = v38.IsCompHub() and PlayerGui:WaitForChild("RacesGui"):WaitForChild("RaceFrame"):WaitForChild("Speeds") or nil
local Template = HUDGui.Hotbar.Template
local v72 = v52.new(nil)
local v73 = v52.new(nil)
local v74 = v52.new(nil)
local v75 = v52.new(nil)
local v76 = v52.new(nil)
local v77 = v52.new(nil)
local v78 = v43.GetRemoteEvent("RefreshBackpackRemote")
local v79 = v43.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v80 = v43.GetRemoteEvent("OpenStableClubsRemote")
local v81 = nil
local v82 = v34.new()
local v83 = v48.new()
local v84 = v48.new()
local v85 = false
local t7 = {}
local v86 = v34.new()
local v87 = v52.new(1)
local t8 = {}
local v88 = v52.new(false)
local v89 = tick()
local v90 = tick()
local t9 = {}
local t10 = {}
local function onMenuClicked() --[[ onMenuClicked | Line: 200 | Upvalues: v17 (copy), HUDGui (copy), v79 (copy) ]]
	if v17.MainFrameOpen == HUDGui.Menu then
		v17.CloseMainFrame(HUDGui.Menu)
	else
		v79:FireServer("MenuOpened")
		v17.OpenMainFrame(HUDGui.Menu)
	end
end
local function topFrameButton(p1, p2) --[[ topFrameButton | Line: 213 | Upvalues: v52 (copy), v1 (copy), t10 (copy) ]]
	v52.fromAttribute(p2, "IsActive"):subscribe(function(p1) --[[ Line: 214 | Upvalues: v1 (ref), p2 (copy) ]]
		local t = {}
		t.Scale = if p1 then 1 else 0
		v1.target(p2.UIScale, 0.5, 2, t)
	end)
	v52.fromProperty(p2.UIScale, "Scale"):subscribe(function(p1) --[[ Line: 220 | Upvalues: p2 (copy) ]]
		p2.Visible = p1 > 0.06
	end)
	table.insert(t10, p2)
end
local function trySprint(p1) --[[ trySprint | Line: 228 | Upvalues: v81 (ref), v90 (ref), v49 (copy) ]]
	if not v81 then
		return
	end
	if not v81.Flying and (v81.MoveState == "Idle" or v81.MoveState == "Reverse") then
		return
	end
	if v81.Flying and v81.Gliding then
		v81:Glide(false)
	end
	v90 = tick()
	if p1 ~= "Mobile" and p1 ~= "Gamepad" or not v49:IsSprinting() then
		v49:Sprint()
		return
	end
	v49:StopSprinting()
	if v81.MoveState ~= "RaceSprint" then
		return
	end
	v81:SetMoveState("Gallop")
end
local t11 = {
	Actions = function() --[[ Actions | Line: 258 | Upvalues: v56 (copy), v42 (copy) ]]
		if not v56.CanDoActionInTutorial("ActionMenu") then
			return
		end
		if v42.IsOpen() then
			v42.Close()
		else
			v42.Open()
		end
	end,
	Crouch = function() --[[ Crouch | Line: 270 | Upvalues: v8 (copy) ]]
		if v8:IsCrouching() then
			v8:StopCrouching()
		else
			v8:Crouch()
		end
	end,
	Dismount = function() --[[ Dismount | Line: 278 | Upvalues: v25 (copy), v56 (copy), v68 (copy), StarterPlayer (copy) ]]
		if v25.GetLastOpenMenu() then
			return
		end
		if not v56.CanDoActionInTutorial("DismountAction") then
			return
		end
		if not v68:IsInAction("Race") then
			v68.Character.Humanoid.JumpPower = StarterPlayer.CharacterJumpPower
			v68.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end,
	Fly = function(p1) --[[ Fly | Line: 294 ]]
		if not (p1 and (p1.WingData or p1.IsToyWings)) then
			return
		end
		p1:Fly(not p1.Flying)
	end,
	Jump = function(p1) --[[ Jump | Line: 306 | Upvalues: v68 (copy) ]]
		if not (p1 and (p1.Jump and p1.Rear)) then
			return
		end
		if p1.IsMoving then
			p1:Jump()
			return
		end
		if v68:IsInAction("Race") then
			return
		end
		p1:Rear()
	end,
	SlowDown = function() --[[ SlowDown | Line: 318 | Upvalues: v68 (copy), v49 (copy), v2 (copy) ]]
		local v1 = v68:GetCurrentAnimal()
		local v22 = v68:GetCurrentAnimal() and v1.MoveState or nil
		if not v1 or v1.Flying then
			return
		end
		if v49:IsSprinting() then
			v49:StopSprinting()
			if v22 == "RaceSprint" then
				v1:SetMoveState("Gallop")
			end
		else
			v2:ChangeGait(v68, -1)
		end
	end,
	SpeedUp = function() --[[ SpeedUp | Line: 337 | Upvalues: v68 (copy), v49 (copy), v2 (copy) ]]
		local v1 = v68:GetCurrentAnimal()
		local v22 = v68:GetCurrentAnimal() and v1.MoveState or nil
		if not v1 or v1.Flying then
			return
		end
		if v49:IsSprinting() then
			v49:StopSprinting()
			if v22 == "RaceSprint" then
				v1:SetMoveState("Gallop")
			end
		else
			if v22 == "Gallop" then
				v49:Sprint()
				return
			end
			v2:ChangeGait(v68, 1)
		end
	end,
	Sprint = function() --[[ Sprint | Line: 360 | Upvalues: v8 (copy), v68 (copy) ]]
		if v8:IsSprinting() then
			v8:StopSprinting()
			return
		end
		if not v68:GetCurrentAnimal() then
			v8:Sprint()
		end
	end
}
local v91 = nil
v91 = {
	Sprint = {
		Changed = { v8.SprintChanged, v68.CurrentAnimalChangedSignal },
		GetState = function() --[[ GetState | Line: 383 | Upvalues: v8 (copy) ]]
			return v8:IsSprinting()
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 387 | Upvalues: v8 (copy), v81 (ref) ]]
			if (p3 == "Mobile" or p3 == "Gamepad") and v8:IsSprinting() then
				v8:StopSprinting()
				return
			end
			if not v81 then
				v8:Sprint()
			end
		end,
		InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 399 | Upvalues: v8 (copy) ]]
			if p3 ~= "Mobile" and p3 ~= "Gamepad" then
				v8:StopSprinting()
			end
		end
	},
	Sneak = {
		Changed = { v8.CrouchChanged },
		GetState = function() --[[ GetState | Line: 412 | Upvalues: v8 (copy) ]]
			return v8:IsCrouching()
		end,
		InputBegan = function(p1) --[[ InputBegan | Line: 416 | Upvalues: v81 (ref), v8 (copy) ]]
			if v81 then
				return
			end
			if v8:IsCrouching() then
				v8:StopCrouching()
			else
				v8:Crouch()
			end
		end
	},
	TurnLeft = {
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 430 | Upvalues: v81 (ref) ]]
			if not v81 then
				return
			end
			local v1 = if p3 == "Mobile" then "MobileTurn" else "ArrowTurn"
			local v2 = v81
			v2[v1] = v2[v1] - 1
		end,
		InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 446 | Upvalues: v81 (ref) ]]
			if not v81 then
				return
			end
			v81[if p3 == "Mobile" then "MobileTurn" else "ArrowTurn"] = 0
		end
	},
	TurnRight = {
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 463 | Upvalues: v81 (ref) ]]
			if not v81 then
				return
			end
			local v1 = if p3 == "Mobile" then "MobileTurn" else "ArrowTurn"
			local v2 = v81
			v2[v1] = v2[v1] + 1
		end,
		InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 479 | Upvalues: v81 (ref) ]]
			if not v81 then
				return
			end
			v81[if p3 == "Mobile" then "MobileTurn" else "ArrowTurn"] = 0
		end
	},
	RaceSprint = {
		Changed = {
			v83,
			v84,
			v68.CurrentAnimalChangedSignal,
			v46.GetSettingChangedSignal(v68, "MobileMovementControls")
		},
		GetState = function() --[[ GetState | Line: 504 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then v1.MoveState == "RaceSprint" else v1
		end,
		GetVisible = function() --[[ GetVisible | Line: 509 | Upvalues: v68 (copy), v46 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			if v46.GetSetting(v68, "MobileMovementControls") == "Thumbstick" then
				return if v1 then not v1.Flying else v1
			else
				return v1 and (if v1.MoveState == "Gallop" or v1.MoveState == "RaceSprint" then not v1.Flying else false)
			end
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 519 | Upvalues: trySprint (copy) ]]
			trySprint(p3)
		end,
		InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 523 | Upvalues: v81 (ref), v49 (copy) ]]
			if not v81 then
				return
			end
			if p3 == "Mobile" or p3 == "Gamepad" then
				return
			end
			v49:StopSprinting()
			if v81.MoveState ~= "RaceSprint" then
				return
			end
			v81:SetMoveState("Gallop")
		end
	},
	SpeedUp = {
		Changed = { v83, v84, v68.CurrentAnimalChangedSignal },
		GetVisible = function() --[[ GetVisible | Line: 547 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then if v1.MoveState == "Gallop" or v1.MoveState == "RaceSprint" then false else not v1.Flying else v1
		end,
		GetText = function() --[[ GetText | Line: 553 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 and (v1.MoveState == "Idle" or v1.MoveState == "Reverse") then
				return "Forward"
			else
				return "Speed Up"
			end
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 559 | Upvalues: UserInputService (copy), trySprint (copy), v2 (copy), v90 (ref), v91 (ref), v81 (ref) ]]
			if p1.ControlsDisabled then
				return
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
				trySprint(p3)
				v2:ChangeGait(p1, 10)
			else
				v2:ChangeGait(p1, 1)
				local v1 = tick()
				v90 = v1
				if p3 == "Mobile" then
					return
				end
				task.spawn(function() --[[ Line: 579 | Upvalues: UserInputService (ref), p2 (copy), v90 (ref), v1 (copy), v91 (ref), p1 (copy), p3 (copy) ]]
					local function isHeld() --[[ isHeld | Line: 580 | Upvalues: UserInputService (ref), p2 (ref), v90 (ref), v1 (ref) ]]
						return UserInputService:IsKeyDown(p2.KeyCode) and v90 == v1
					end
					while true do
						if not (UserInputService:IsKeyDown(p2.KeyCode) and v90 == v1) then
							break
						end
						task.wait(0.35)
						if not (UserInputService:IsKeyDown(p2.KeyCode) and v90 == v1) then
							break
						end
						v91.SpeedUp.InputBegan(p1, p2, p3)
					end
				end)
			end
			if not v81 then
				return
			end
			v81:Unbrake()
		end
	},
	SlowDown = {
		Changed = { v83, v84, v68.CurrentAnimalChangedSignal },
		GetVisible = function() --[[ GetVisible | Line: 609 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then not v1.Flying else v1
		end,
		GetText = function() --[[ GetText | Line: 615 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 and (v1.MoveState == "Idle" or v1.MoveState == "Reverse") then
				return "Reverse"
			else
				return "Slow Down"
			end
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 621 | Upvalues: v81 (ref), v90 (ref), v49 (copy), v2 (copy), UserInputService (copy), v91 (ref) ]]
			if p1.ControlsDisabled then
				return
			end
			if v81 and v81.Sprinting then
				v90 = tick()
				v49:StopSprinting()
				v81:SetMoveState("Idle")
				v81:SetLastGaitIndex("Idle")
				v81:Brake()
			else
				v2:ChangeGait(p1, -1)
				local v1 = tick()
				v90 = v1
				task.spawn(function() --[[ Line: 644 | Upvalues: UserInputService (ref), p2 (copy), v90 (ref), v1 (copy), v91 (ref), p1 (copy), p3 (copy) ]]
					local function isHeld() --[[ isHeld | Line: 645 | Upvalues: UserInputService (ref), p2 (ref), v90 (ref), v1 (ref) ]]
						return UserInputService:IsKeyDown(p2.KeyCode) and v90 == v1
					end
					while true do
						if not (UserInputService:IsKeyDown(p2.KeyCode) and v90 == v1) then
							break
						end
						task.wait(0.35)
						if not (UserInputService:IsKeyDown(p2.KeyCode) and v90 == v1) then
							break
						end
						v91.SlowDown.InputBegan(p1, p2, p3)
					end
				end)
			end
		end
	},
	Dismount = {
		InputBegan = function() --[[ InputBegan | Line: 663 | Upvalues: v25 (copy), v56 (copy), v68 (copy), StarterPlayer (copy) ]]
			if v25.GetLastOpenMenu() then
				return
			end
			if not v56.CanDoActionInTutorial("DismountAction") then
				return
			end
			if not v68:IsInAction("Race") then
				v68.Character.Humanoid.JumpPower = StarterPlayer.CharacterJumpPower
				v68.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	},
	Jump = {
		Changed = { v84, v68.CurrentAnimalChangedSignal },
		GetVisible = function() --[[ GetVisible | Line: 686 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then not v1.Flying else v1
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 692 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			if not v1 then
				return
			end
			if v1.IsMoving then
				v1:Jump()
				return
			end
			if v68:IsInAction("Race") then
				return
			end
			v1:Rear()
		end
	},
	JumpOrDismount = {
		InputBegan = function(p1) --[[ InputBegan | Line: 708 | Upvalues: v25 (copy), v56 (copy), v68 (copy), v81 (ref), StarterPlayer (copy) ]]
			if v25.GetLastOpenMenu() then
				return
			end
			if not v56.CanDoActionInTutorial("DismountAction") then
				return
			end
			if v68:IsInAction("Race") then
				return
			end
			if not v81 then
				return
			end
			v68.Character.Humanoid.JumpPower = StarterPlayer.CharacterJumpPower
			v68.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	},
	JumpOrFly = {
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 728 | Upvalues: v81 (ref), v89 (ref) ]]
			if p3 ~= "Gamepad" then
				return
			end
			if not v81 then
				return
			end
			local v1 = v81.WingData or v81.IsToyWings
			if v1 then
				if v81.Flying then
					v81:Fly(false)
					return
				end
				if v89 and tick() - v89 < 0.5 then
					v81:Fly(true)
					return
				end
			end
			if v1 and tick() - (v89 or 0) < 0.5 then
				return
			end
			v89 = tick()
			if v81.IsMoving then
				v81:Jump()
				return
			end
			if v1 then
				v81:Fly(true)
			else
				v81:Rear()
			end
		end
	},
	Fly = {
		Changed = { v84, v68.CurrentAnimalChangedSignal },
		GetVisible = function() --[[ GetVisible | Line: 780 | Upvalues: v81 (ref) ]]
			local v1 = v81
			if v1 then
				v1 = if v81.WingData then not v81.Flying else v81.IsToyWings and not v81.Flying
			end
			return v1
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 784 | Upvalues: v81 (ref) ]]
			if p3 == "Gamepad" then
				return
			end
			if not v81 then
				return
			end
			local v1 = v81.WingData or v81.IsToyWings
			if p3 == "Mobile" then
				if v1 and not v81.Flying then
					v81:Fly(true)
				end
			else
				if not v1 then
					return
				end
				v81:Fly(not v81.Flying)
			end
		end
	},
	Land = {
		Changed = { v84, v68.CurrentAnimalChangedSignal },
		GetVisible = function() --[[ GetVisible | Line: 812 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then v1.Flying else v1
		end,
		InputBegan = function(p1) --[[ InputBegan | Line: 818 | Upvalues: v81 (ref) ]]
			if not v81 then
				return
			end
			if not ((v81.WingData or v81.IsToyWings) and v81.Flying) then
				return
			end
			v81:Fly(false)
		end
	},
	FlySprint = {
		Changed = { v84, v68.CurrentAnimalChangedSignal },
		GetVisible = function() --[[ GetVisible | Line: 836 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then v1.Flying else v1
		end,
		GetState = function() --[[ GetState | Line: 842 | Upvalues: v68 (copy) ]]
			local v1 = v68:GetCurrentAnimal()
			return if v1 then v1.MoveState == "RaceSprint" else v1
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 848 | Upvalues: trySprint (copy) ]]
			trySprint(p3)
		end,
		InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 852 | Upvalues: v81 (ref), v49 (copy) ]]
			if not v81 then
				return
			end
			if p3 ~= "Mobile" and p3 ~= "Gamepad" then
				v49:StopSprinting()
			end
		end
	},
	RadialMenu = {
		Changed = { HUDGui.RadialFrame:GetPropertyChangedSignal("Visible") },
		GetState = function() --[[ GetState | Line: 870 | Upvalues: HUDGui (copy) ]]
			return HUDGui.RadialFrame.Visible
		end,
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 874 | Upvalues: v56 (copy), v17 (copy), v42 (copy) ]]
			if not v56.CanDoActionInTutorial("ActionMenu") then
				return
			end
			if p3 == "Gamepad" then
				if not v17.IsHUDOpen() then
					return
				end
			elseif v17.MainFrameOpen then
				return
			end
			if v42.IsOpen() then
				v42.Close()
			else
				v42.Open()
			end
		end,
		InputEnded = function(p1, p2, p3) --[[ InputEnded | Line: 896 | Upvalues: v42 (copy) ]]
			if p3 ~= "Mobile" and p3 ~= "Gamepad" then
				v42.Close()
			end
		end
	}
}
local t12 = {
	Coins = function(...) --[[ Coins | Line: 907 | Upvalues: v56 (copy), v40 (copy) ]]
		local t = { ... }
		return function() --[[ Line: 910 | Upvalues: v56 (ref), v40 (ref), t (copy) ]]
			if v56.CanDoActionInTutorial("PremiumShop") then
				v40.Open(table.unpack(t))
			end
		end
	end,
	Event = function(...) --[[ Event | Line: 919 | Upvalues: v13 (copy) ]]
		return function() --[[ Line: 920 | Upvalues: v13 (ref) ]]
			v13:Open("EventShop", "Currency")
		end
	end,
	EventCurrency = function(...) --[[ EventCurrency | Line: 925 | Upvalues: v13 (copy) ]]
		return function() --[[ Line: 926 | Upvalues: v13 (ref) ]]
			v13:Open("EventShop", "Currency")
		end
	end
}
local v92 = nil
local t13 = {}
local t14 = {
	Name = "Inventory",
	Type = "HUD",
	LayoutOrder = 2,
	Image = "rbxassetid://16550455022",
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.RightFrame },
	Init = function(p1, p2) --[[ Init | Line: 945 | Upvalues: v68 (copy) ]]
		local function onInventoryChanged() --[[ onInventoryChanged | Line: 946 | Upvalues: v68 (ref), p2 (copy) ]]
			local v1 = v68:GetItemLimit("Inventory")
			p2:SetAttribute("Notification", v1.Get() >= v1.GetLimit())
		end
		v68.InventoryItemsChangedSignal:Connect(onInventoryChanged)
		v68.MaxInventoryChangedSignal:Connect(onInventoryChanged)
		local v1 = v68:GetItemLimit("Inventory")
		p2:SetAttribute("Notification", v1.Get() >= v1.GetLimit())
	end,
	Run = function() --[[ Run | Line: 962 | Upvalues: v26 (copy) ]]
		v26.Open()
	end
}
local t15 = {
	Name = "Stables",
	Type = "HUD",
	LayoutOrder = -1,
	Image = "rbxassetid://16190523288",
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.RightFrame },
	Init = function(p1, p2) --[[ Init | Line: 978 | Upvalues: v68 (copy) ]]
		local v1 = v68:GetItemFolder("Animals")
		local function onStablesChanged() --[[ onStablesChanged | Line: 981 | Upvalues: v68 (ref), p2 (copy) ]]
			if not v68.GetItemLimit then
				return
			end
			local v1 = v68:GetItemLimit("Animals")
			p2:SetAttribute("Notification", v1.GetLimit() <= v1.Get())
		end
		for v2, v3 in {
			v1.ChildAdded,
			v1.ChildRemoved,
			v68.MaxSlotsChangedSignal,
			v68.DailyLoginData.Streak:GetPropertyChangedSignal("Value")
		} do
			v3:Connect(onStablesChanged)
		end
		if not v68.GetItemLimit then
			return
		end
		local v4 = v68:GetItemLimit("Animals")
		p2:SetAttribute("Notification", if v4.GetLimit() <= v4.Get() then true else false)
	end,
	Run = function() --[[ Run | Line: 1008 | Upvalues: v56 (copy), v50 (copy) ]]
		if v56.CanDoActionInTutorial("Stables") then
			v50.Open()
		end
	end
}
local t16 = {
	Name = "Menu",
	Type = "HUD",
	LayoutOrder = 9000000,
	Image = "rbxassetid://101596589017974",
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.RightFrame },
	Init = function(p1, p2) --[[ Init | Line: 1028 | Upvalues: v34 (copy), v92 (ref), v52 (copy) ]]
		task.spawn(function() --[[ Line: 1029 | Upvalues: v34 (ref), v92 (ref), v52 (ref), p2 (copy) ]]
			local v1 = v34.new()
			local t = {}
			for v2, v3 in v92 do
				if v3.Enabled ~= false then
					repeat
						task.wait()
					until #v3.Buttons > 0
					for v4, v5 in v3.Buttons do
						if v5.Name ~= "Menu" then
							table.insert(t, v52.fromAttribute(v5, "Notification"))
						end
					end
				end
			end
			v52.subscribeMulti(t, function() --[[ Line: 1049 | Upvalues: v1 (copy), v92 (ref), p2 (ref) ]]
				v1._thread = task.defer(function() --[[ Line: 1050 | Upvalues: v92 (ref), p2 (ref) ]]
					local v1 = false
					for v2, v3 in v92 do
						if v3.Enabled ~= false then
							for v4, v5 in v3.Buttons do
								local v6 = v5:GetAttribute("Notification")
								v1 = v6
								if v6 then
									break
								end
							end
							if v1 then
								break
							end
						end
					end
					p2:SetAttribute("Notification", v1)
				end)
			end)
		end)
	end,
	Run = function() --[[ Run | Line: 1077 | Upvalues: v17 (copy), HUDGui (copy), v79 (copy) ]]
		if v17.MainFrameOpen == HUDGui.Menu then
			v17.CloseMainFrame(HUDGui.Menu)
		else
			v79:FireServer("MenuOpened")
			v17.OpenMainFrame(HUDGui.Menu)
		end
	end
}
local t17 = {
	Enabled = false,
	Name = "Shop",
	Type = "HUD",
	LayoutOrder = -11,
	Image = "rbxassetid://16550454602",
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.TopFrame.Other.ButtonsFrame },
	Init = function(...) --[[ Init | Line: 1095 | Upvalues: topFrameButton (copy) ]]
		topFrameButton(...)
	end,
	Run = function() --[[ Run | Line: 1099 | Upvalues: v47 (copy) ]]
		v47.Open()
	end
}
local t18 = {
	Name = "Quests",
	Type = "HUD",
	LayoutOrder = 8999999,
	Image = "rbxassetid://17276478099",
	Text = "Quests",
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.LeftFrame },
	Init = function(p1, p2) --[[ Init | Line: 1116 | Upvalues: v30 (copy), MissionsChangedSignal (copy) ]]
		MissionsChangedSignal:Connect(function() --[[ notification | Line: 1117 | Upvalues: v30 (ref), p2 (copy) ]]
			p2:SetAttribute("Notification", v30._getTotalUnclaimedForAll() > 0)
		end)
		local v1 = v30._getTotalUnclaimedForAll() > 0
		p2:SetAttribute("Notification", v1)
	end,
	Run = function() --[[ Run | Line: 1128 | Upvalues: v30 (copy) ]]
		v30.Open("Horses")
	end
}
local t19 = {
	Name = "PremiumShop",
	Type = "HUD",
	LayoutOrder = 8999999,
	Image = "rbxassetid://16550454855",
	Text = "Shop",
	Timer = v40.GetTimeSeed(),
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.LeftFrame },
	Init = function(p1, p2) --[[ Init | Line: 1146 ]]
		p2:SetAttribute("Notification", true)
	end,
	Run = function() --[[ Run | Line: 1149 | Upvalues: v40 (copy) ]]
		v40.Open()
	end
}
local t20 = {
	Name = "Trade",
	Type = "HUD",
	LayoutOrder = 900000,
	Image = "rbxassetid://107703772454977"
}
t20.Enabled = v67 or v38.IsMarketWorld()
t20.Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.LeftFrame }
function t20.Run() --[[ Run | Line: 1167 | Upvalues: v67 (copy), v38 (copy), v55 (copy) ]]
	if v67 or v38.IsMarketWorld() then
		v55:Open()
	end
end
local t21 = {
	Name = "Build",
	Type = "HUD",
	LayoutOrder = -10,
	Image = "rbxassetid://16653205340",
	Enabled = v38.IsMainWorld(),
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.TopFrame.Other.ButtonsFrame },
	Init = function(p1, p2) --[[ Init | Line: 1189 | Upvalues: topFrameButton (copy), v38 (copy), v68 (copy), v1 (copy), v24 (copy) ]]
		topFrameButton(p1, p2)
		if not v38.IsCompHub() then
			local function updateMazeVisible() --[[ updateMazeVisible | Line: 1200 | Upvalues: v68 (ref), p2 (copy), v1 (ref), v24 (ref) ]]
				if v68:IsInAction("Maze") then
					p2.Interactable = false
					p2.Visible = false
					p2:SetAttribute("IsActive", false)
					v1.target(p2.UIScale, 0.8, 6, {
						Scale = 0
					})
					return
				end
				local v12 = not v24.IsInZone("Town")
				p2.Interactable = v12
				p2.Visible = v12
				p2:SetAttribute("IsActive", v12)
				local t = {}
				t.Scale = if v12 then 1 else 0
				v1.target(p2.UIScale, 0.8, 6, t)
			end
			v68:OnActionChanged("Maze"):Connect(updateMazeVisible)
			updateMazeVisible()
			return
		end
		local function updateBuildVisible() --[[ updateBuildVisible | Line: 1193 | Upvalues: p2 (copy), v68 (ref) ]]
			p2.Visible = if p2.UIScale.Scale > 0.06 then not v68:IsInAction("Race") else false
		end
		v68:OnActionChanged("Race"):Connect(updateBuildVisible)
		p2.UIScale:GetPropertyChangedSignal("Scale"):Connect(updateBuildVisible)
		p2.Visible = if p2.UIScale.Scale > 0.06 then not v68:IsInAction("Race") else false
	end,
	Run = function(p1, p2) --[[ Run | Line: 1219 | Upvalues: Sonar (copy) ]]
		if p2:GetAttribute("IsActive") then
			Sonar("BuildClient"):EnterMode()
		end
	end
}
local t22 = {
	Name = "MapVote",
	Type = "HUD",
	LayoutOrder = -12,
	Image = "rbxassetid://138861116860797",
	Text = "Vote",
	Enabled = v38.IsCompHub(),
	Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.TopFrame.Other.ButtonsFrame },
	Init = function(p1, p2) --[[ Init | Line: 1242 | Upvalues: topFrameButton (copy), v18 (copy), v60 (copy) ]]
		topFrameButton(p1, p2)
		p2:SetAttribute("IsActive", false)
		p2.Interactable = false
		local function updateVoteVisible() --[[ updateVoteVisible | Line: 1247 | Upvalues: v18 (ref), p2 (copy) ]]
			local v1 = v18.GetGameState("MapVoting")
			p2:SetAttribute("IsActive", v1)
			p2.Interactable = v1
		end
		v60.GameStateChangedSignal:Connect(updateVoteVisible)
	end,
	Run = function() --[[ Run | Line: 1255 | Upvalues: Sonar (copy) ]]
		local v1 = Sonar("MapVotingGui")
		v1.ClearDismissed()
		v1.Open()
	end
}
local t23 = {
	Name = "Event",
	Type = "HUD",
	LayoutOrder = -10
}
t23.Enabled = if EventName == nil then false else EventName ~= ""
t23.Image = (function() --[[ Line: 1269 | Upvalues: v61 (copy) ]]
	return v61
end)()
t23.Parents = { HUDGui.MobileRightFrame.Core.Buttons, HUDGui.RightFrame.Other.ButtonsFrame.LeftFrame }
function t23.Init(p1, p2) --[[ Init | Line: 1278 | Upvalues: HUDGui (copy), v62 (copy), v65 (copy), v64 (copy), v16 (copy), v18 (copy), v63 (copy), v68 (copy), v13 (copy) ]]
	local t = { HUDGui.MobileRightFrame.Core.Event, HUDGui.RightFrame.Other.EventCurrency }
	for v1, v2 in t do
		local t2 = {
			[v2.Icon] = {
				Image = v62
			},
			[v2.Amount.UIGradient] = {
				Color = v65
			},
			[v2.Amount.UIStroke] = {
				Color = v64
			}
		}
		if v2.Icon:FindFirstChild("ShadowLabel") then
			t2[v2.Icon.ShadowLabel] = {
				Image = v62
			}
		end
		for v3, v4 in t2 do
			for v5, v6 in v4 do
				v3[v5] = v6
			end
		end
	end
	v16:changed(function() --[[ Line: 1299 | Upvalues: p2 (copy), v18 (ref), v63 (ref), t (copy) ]]
		p2.Parent.Visible = v18.GetGameState("EventJournal")
		local v1 = v63 ~= nil
		local v3 = if v1 then p2.Parent.Visible else v1
		for v4, v5 in t do
			v5.Visible = v3
		end
	end)
	local v7 = v68.NewMissionsWrapper:GetMissionsChangedSignal()
	local function isMissionUnlocked(p1) --[[ isMissionUnlocked | Line: 1328 ]]
		if not p1:ArePrerequisitesMet() then
			return false
		end
		if not p1.MissionData.UnlockTime then
			return true
		end
		if p1.MissionData.UnlockTime.UnixTimestamp >= DateTime.now().UnixTimestamp then
			return false
		else
			return true
		end
	end
	local t2 = { "EventMissions", "EventSpecialQuests", "EventHourlyMissions" }
	local t3 = {}
	local t4 = {
		EventMissions = "Missions",
		EventSpecialQuests = "SpecialQuests",
		EventHourlyMissions = "SpecialQuests"
	}
	for v9, v10 in v68.NewMissionsWrapper:GetMissions() do
		local v8
		if table.find(t2, v10.MissionData.Category) then
			v8 = if v10:ArePrerequisitesMet() then if v10.MissionData.UnlockTime then if v10.MissionData.UnlockTime.UnixTimestamp >= DateTime.now().UnixTimestamp then false else true else true else false
			t3[v10.MissionName] = v8
		end
	end
	v7:Connect(function() --[[ Line: 1358 | Upvalues: v68 (ref), t2 (copy), t3 (copy), v13 (ref), t4 (copy), p2 (copy) ]]
		local v1 = nil
		local v2 = nil
		local v3 = nil
		for v5, v6 in v68.NewMissionsWrapper:GetMissions() do
			local v4
			if table.find(t2, v6.MissionData.Category) then
				if v6:IsComplete() and not v6:IsClaimed() then
					v2 = v6
				end
				v4 = if v6:ArePrerequisitesMet() then if v6.MissionData.UnlockTime then not (v6.MissionData.UnlockTime.UnixTimestamp >= DateTime.now().UnixTimestamp) else true else false
				if v4 then
					local v8 = if v1 then v1 else not t3[v6.MissionName]
					t3[v6.MissionName] = true
					v1 = v8
				end
			end
		end
		if v2 then
			v13:SetPendingClaimableMission(v2)
			v13:SetPendingClaimableTab(t4[v2.MissionData.Category])
		end
		p2:SetAttribute("Notification", (if v3 then v3 else p2:GetAttribute("Notification")) or v2 ~= nil or v1 == true)
	end)
end
function t23.Run() --[[ Run | Line: 1393 | Upvalues: v13 (copy) ]]
	v13:Open()
end
t13[1] = t14
t13[2] = t15
t13[3] = t16
t13[4] = t17
t13[5] = t18
t13[6] = t19
t13[7] = t20
t13[8] = t21
t13[9] = t22
t13[10] = t23
t13[11] = {
	Name = "Settings",
	Type = "Menu",
	MenuFrame = "Top",
	LayoutOrder = 3,
	Image = "rbxassetid://16611496607",
	Run = function() --[[ Run | Line: 1406 | Upvalues: v58 (copy) ]]
		v58.Open()
	end
}
t13[12] = {
	Name = "Leaderboard",
	Type = "Menu",
	MenuFrame = "Top",
	LayoutOrder = 3,
	Image = "rbxassetid://16894747122",
	Run = function() --[[ Run | Line: 1418 | Upvalues: v32 (copy), v17 (copy), HUDGui (copy) ]]
		v32.Toggle()
		v17.CloseMainFrame(HUDGui.Menu)
	end
}
t13[13] = {
	Enabled = true,
	Name = "StableClubs",
	Type = "Menu",
	MenuFrame = "Top",
	LayoutOrder = 5,
	Image = "rbxassetid://83424121701696",
	Init = function(p1, p2) --[[ Init | Line: 1432 | Upvalues: v68 (copy), v52 (copy) ]]
		task.spawn(function() --[[ Line: 1433 | Upvalues: v68 (ref), v52 (ref), p2 (copy) ]]
			v52.fromProperty(v68.PlayerData.OpenedStableClubs, "Value"):derive(function(p1) --[[ Line: 1435 ]]
				return not p1
			end):subscribe(function(p1) --[[ Line: 1439 | Upvalues: p2 (ref) ]]
				p2:SetAttribute("Notification", p1)
			end)
		end)
	end,
	Run = function(p1, p2) --[[ Run | Line: 1445 | Upvalues: v80 (copy), v45 (copy) ]]
		if not p2:GetAttribute("Notification") then
			v45.Open()
			return
		end
		v80:FireServer()
		v45.Open()
	end
}
t13[14] = {
	Name = "Camera",
	Type = "Menu",
	MenuFrame = "Middle",
	LayoutOrder = 3,
	Image = "rbxassetid://16894871368",
	Run = function() --[[ Run | Line: 1462 | Upvalues: v59 (copy) ]]
		v59:EnterMode()
	end
}
t13[15] = {
	Name = "DailyLogin",
	Type = "Menu",
	MenuFrame = "Middle",
	LayoutOrder = 2,
	Image = "rbxassetid://18923397193",
	Run = function() --[[ Run | Line: 1474 | Upvalues: v44 (copy) ]]
		v44.Open("DailyLogin")
	end
}
t13[16] = {
	Name = "CommunityRewards",
	Type = "Menu",
	MenuFrame = "Middle",
	LayoutOrder = 3,
	Image = "rbxassetid://17514219075",
	Text = "Rewards",
	Run = function() --[[ Run | Line: 1487 | Upvalues: v9 (copy) ]]
		v9:Open()
	end
}
t13[17] = {
	Name = "Dailies",
	Type = "Menu",
	MenuFrame = "Bottom",
	LayoutOrder = 1,
	Image = "rbxassetid://123780043720560",
	Init = function(p1, p2) --[[ Init | Line: 1500 | Upvalues: v53 (copy), v68 (copy) ]]
		v53.stateToProperty({
			Property = "Visible",
			Instance = p2,
			State = v68.PolicyInfo:derive(function(p1) --[[ Line: 1507 ]]
				local v1 = nil
				return (if v1 then v1 elseif typeof(p1) == "table" then true else false) and p1.AreAdsAllowed
			end)
		})
	end,
	Run = function() --[[ Run | Line: 1518 | Upvalues: v44 (copy) ]]
		v44.Open("DailyBonus")
	end
}
t13[18] = {
	Name = "Codes",
	Type = "Menu",
	MenuFrame = "Bottom",
	LayoutOrder = 2,
	Image = "rbxassetid://17514218413",
	Run = function() --[[ Run | Line: 1530 | Upvalues: v44 (copy) ]]
		v44.Open("Codes")
	end
}
t13[19] = {
	Name = "Help",
	Type = "Menu",
	MenuFrame = "Bottom",
	LayoutOrder = 3,
	Image = "rbxassetid://17671738876",
	Run = function() --[[ Run | Line: 1542 | Upvalues: v19 (copy) ]]
		v19.Open()
	end
}
v92 = t13
local t24 = {
	Lasso = {
		Activated = function(p1, p2) --[[ Activated | Line: 1550 | Upvalues: v46 (copy), v68 (copy), v23 (copy), HUDGui (copy), v1 (copy) ]]
			if not v46.GetSetting(v68, "VisualEffects") then
				return
			end
			if not p2:_isOnHorse() then
				return
			end
			for v12, v2 in v23.GetAllTagged(HUDGui, "Vignette") do
				p2.Maid[v2] = task.spawn(function() --[[ Line: 1560 | Upvalues: v2 (copy), v1 (ref) ]]
					while not v2.IsLoaded do
						task.wait()
					end
					v1.target(v2, 1, 6, {
						ImageTransparency = 0.75
					})
				end)
			end
		end,
		Deactivated = function(p1, p2) --[[ Deactivated | Line: 1570 | Upvalues: v46 (copy), v68 (copy), v23 (copy), HUDGui (copy), v1 (copy) ]]
			if not v46.GetSetting(v68, "VisualEffects") then
				return
			end
			if not p2:_isOnHorse() then
				return
			end
			for v12, v2 in v23.GetAllTagged(HUDGui, "Vignette") do
				p2.Maid[v2] = task.spawn(function() --[[ Line: 1580 | Upvalues: v2 (copy), v1 (ref) ]]
					while not v2.IsLoaded do
						task.wait()
					end
					v1.target(v2, 1, 6, {
						ImageTransparency = 0.5
					})
				end)
			end
		end,
		Equipped = function(p1, p2) --[[ Equipped | Line: 1590 | Upvalues: v46 (copy), v68 (copy), v33 (copy), v23 (copy), HUDGui (copy), v1 (copy) ]]
			if not v46.GetSetting(v68, "VisualEffects") then
				return
			end
			if not p2:_isOnHorse() then
				return
			end
			v33.setLightingMode("Lassoing", true)
			for v12, v2 in v23.GetAllTagged(HUDGui, "Vignette") do
				p2.Maid[v2] = task.spawn(function() --[[ Line: 1602 | Upvalues: v2 (copy), v1 (ref) ]]
					while not v2.IsLoaded do
						task.wait()
					end
					v1.target(v2, 1, 6, {
						ImageTransparency = 0.5
					})
				end)
			end
		end,
		Unequipped = function(p1, p2) --[[ Unequipped | Line: 1612 | Upvalues: v46 (copy), v68 (copy), v33 (copy), v23 (copy), HUDGui (copy), v1 (copy) ]]
			if not v46.GetSetting(v68, "VisualEffects") then
				return
			end
			v33.setLightingMode("Lassoing", false)
			for v12, v2 in v23.GetAllTagged(HUDGui, "Vignette") do
				p2.Maid[v2] = task.spawn(function() --[[ Line: 1620 | Upvalues: v2 (copy), v1 (ref) ]]
					while not v2.IsLoaded do
						task.wait()
					end
					v1.target(v2, 1, 6, {
						ImageTransparency = 0.999
					})
				end)
			end
		end
	}
}
local function resolveButtonParents(p1) --[[ resolveButtonParents | Line: 1633 | Upvalues: t9 (copy) ]]
	if p1.Parents then
		return p1.Parents
	end
	if p1.Type ~= "Menu" or not p1.MenuFrame then
		return {}
	end
	local v1 = t9[p1.MenuFrame]
	return if v1 then { v1 } or {} else {}
end
local function equipOrUnequipTool(p1) --[[ equipOrUnequipTool | Line: 1650 | Upvalues: v17 (copy), LocalPlayer (copy), v20 (copy), v68 (copy), v37 (copy), v28 (copy), v43 (copy), v56 (copy) ]]
	if not v17.IsHUDOpen() or (LocalPlayer:GetAttribute("IsToolEquipsLocked") or _G.DisableHotbar) then
		return
	end
	if not v20:IsHotbarSlotUnlocked(v68, p1) then
		return
	end
	if v68:GetCurrentAnimal() and v68:GetCurrentAnimal().WildMode then
		v37.Notify({
			Message = "You cannot do that whilst in Wild mode!",
			Type = "WildModeEquip"
		})
		return
	end
	local v1 = v68.HotbarData[tostring(p1)].Value
	if #v1 <= 0 then
		return
	end
	local v2 = LocalPlayer.Backpack:FindFirstChild(v1)
	local v3 = LocalPlayer.Character:FindFirstChild(v1)
	if v2 and v68:IsCoriding() then
		local v4 = v28.GetByName(v1)
		if v4 and v4.ToolType == "DiggingTool" then
			v37.Notify({
				Message = "You cannot equip a shovel while co-riding!",
				Type = "CoridingShovelEquip"
			})
			return
		end
	end
	if not (v2 or v3) then
		warn("No tool found in backpack, error with backpack, regenerating")
		v43.GetRemoteFunction("RefreshBackpackRemote"):InvokeServer()
		v2 = LocalPlayer.Backpack:WaitForChild(v1)
	end
	if v2 then
		LocalPlayer.Character.Humanoid:EquipTool(v2)
		return
	end
	if not v56.CanDoActionInTutorial("UnequipHotbarAction") then
		return
	end
	if not v3 then
		return
	end
	LocalPlayer.Character.Humanoid:UnequipTools()
end
local function createHotbarSlot(p1, p2) --[[ createHotbarSlot | Line: 1710 | Upvalues: v68 (copy), v34 (copy), ReplicatedStorage (copy), v57 (copy), v28 (copy), v29 (copy), v20 (copy), v5 (copy), v26 (copy), v56 (copy), v27 (copy), t2 (copy), equipOrUnequipTool (copy), t7 (copy) ]]
	if not p2 then
		warn("No hotbar slot frame can be found for", p1)
	end
	local v1 = v68.HotbarData[tostring(p1)]
	local v2 = nil
	local v3 = v34.new()
	local function setEquipped() --[[ setEquipped | Line: 1719 | Upvalues: v2 (ref), v68 (ref), ReplicatedStorage (ref), p2 (copy), v57 (ref) ]]
		local v1 = v2 and (v68.EquippedTool and v2 == v68.EquippedTool.ToolData)
		local v22 = v1 and ReplicatedStorage.Storage.Assets.EquippedHotbar or ReplicatedStorage.Storage.Assets.UnequippedHotbar
		p2.Menu:FindFirstChildWhichIsA("UIGradient").Color = v22.Color
		p2.Menu:FindFirstChildWhichIsA("UIGradient").Rotation = v22.Rotation
		p2.Menu.Content.NameLabel.Visible = v2 and v1
		p2.Menu.Content.BackgroundColor3 = v1 and Color3.fromRGB(19, 146, 121) or Color3.fromRGB(208, 166, 150)
		p2:SetAttribute("Equipped", v1 and true)
		if not (v1 and v57.IsGamepadSelectionObject(p2.Menu)) then
			return
		end
		v57.ResetGamepadSelection()
	end
	local function setTool() --[[ setTool | Line: 1735 | Upvalues: v3 (copy), v2 (ref), v28 (ref), v1 (copy), v29 (ref), v68 (ref), p2 (copy), setEquipped (copy) ]]
		v3:DoCleaning()
		v2 = v28.GetByName(v1.Value)
		if v2 then
			v3:GiveTask(v29.new({
				DataValue = v68:GetItemValueAny(v2.Name),
				Frame = p2.Menu.Content,
				Item = v2,
				AmountColors = {
					None = Color3.fromRGB(255, 94, 97),
					Default = Color3.fromRGB(255, 255, 255)
				}
			}))
			p2.Menu.Content.Viewport.Visible = true
			p2.Menu.Content.OwnedLabel.Visible = true
			p2.Menu.Content.NameLabel.Visible = true
			p2.Menu.Content.UnboundIcon.Visible = false
		else
			p2.Menu.Content.Viewport.Visible = false
			p2.Menu.Content.OwnedLabel.Visible = false
			p2.Menu.Content.NameLabel.Visible = false
			p2.Menu.Content.UnboundIcon.Visible = true
		end
		setEquipped()
	end
	v68.EquippedToolChangedSignal:Connect(setEquipped)
	v1:GetPropertyChangedSignal("Value"):Connect(setTool)
	setTool()
	local function setLocked() --[[ setLocked | Line: 1769 | Upvalues: p2 (copy), v20 (ref), v68 (ref), p1 (copy) ]]
		local Locked = p2:FindFirstChild("Locked", true)
		local Keybind = p2:FindFirstChild("Keybind", true)
		Locked.Visible = not v20:IsHotbarSlotUnlocked(v68, p1)
		if not Keybind then
			return
		end
		Keybind.Visible = not Locked.Visible
	end
	v68.PlayerData.ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(setLocked)
	local Locked = p2:FindFirstChild("Locked", true)
	local Keybind = p2:FindFirstChild("Keybind", true)
	Locked.Visible = not v20:IsHotbarSlotUnlocked(v68, p1)
	if Keybind then
		Keybind.Visible = not Locked.Visible
	end
	v5.new(p2.Menu:IsA("ImageButton") and p2.Menu or p2, {
		NoHoverShadowLabel = true,
		NoHoverColor = true,
		HoverUpLabel = p2.Menu.Content.Viewport,
		Click = function() --[[ Click | Line: 1788 | Upvalues: v26 (ref), v20 (ref), v68 (ref), p1 (copy), v2 (ref), v56 (ref), v27 (ref), t2 (ref), equipOrUnequipTool (ref) ]]
			if v26.IsSelectingHotbarSlot() then
				return
			end
			if not v20:IsHotbarSlotUnlocked(v68, p1) then
				return
			end
			local v1 = v2 and not v68:HasEnoughOfItem(1, v2.Name)
			if v2 and not v1 then
				equipOrUnequipTool(p1)
				return
			end
			if not v56.CanDoActionInTutorial("Inventory") then
				return
			end
			if v1 then
				v27.NotifyIssue("NoOwnAnymore")
			end
			v26.Open(t2)
		end
	})
	if not t7[tonumber(p1)] then
		t7[tonumber(p1)] = {}
	end
	table.insert(t7[tonumber(p1)], p2)
end
local function onHotbarSlotInteraction(p1, p2, p3) --[[ onHotbarSlotInteraction | Line: 1823 | Upvalues: v20 (copy), v68 (copy), v56 (copy), v27 (copy), v26 (copy), v37 (copy), Backpack (copy), LocalPlayer (copy), v78 (copy) ]]
	if _G.DisableHotbar then
		return
	end
	if not v20:IsHotbarSlotUnlocked(v68, p1) then
		return
	end
	if (if p2 then tonumber(p2:get()) or 0 else 0) == 0 or not p3 then
		if v56.CanDoActionInTutorial("Inventory") then
			v27.NotifyIssue("NoOwnAnymore")
			v26.Open()
		end
	else
		local v2 = v68:GetCurrentAnimal()
		if v2 and v2.WildMode then
			v37.Notify({
				Message = "You cannot do that whilst in Wild mode!",
				Type = "WildModeEquip"
			})
			return
		end
		local v3 = v68.PlayerData.Hotbar:FindFirstChild(p1).Value
		local v4 = Backpack:FindFirstChild(v3)
		local v5 = LocalPlayer.Character:FindFirstChild(v3)
		if not (v4 or v5) then
			v78:InvokeServer()
			v4 = Backpack:WaitForChild(v3)
		end
		if v4 then
			LocalPlayer.Character.Humanoid:EquipTool(v4)
			return
		end
		if not v56.CanDoActionInTutorial("UnequipHotbarAction") then
			return
		end
		if not v5 then
			return
		end
		LocalPlayer.Character.Humanoid:UnequipTools()
	end
end
local function v95() --[[ onHotbarChanged | Line: 1887 | Upvalues: v66 (copy), v86 (copy), v68 (copy), v87 (copy), Hotbar (copy), v28 (copy), v52 (copy), v20 (copy), Template (copy), ReplicatedStorage (copy), v26 (copy), v17 (copy), onHotbarSlotInteraction (copy), v56 (copy), t2 (copy), v1 (copy), t6 (copy), v11 (copy), v95 (copy), ExtraHotbarSlots (copy), EquippedToolChangedSignal (copy) ]]
	local v12 = nil
	v86._onHotbarChanged = ((if v12 then v12 elseif v66 then task.defer or nil else nil) or task.spawn)(function() --[[ Line: 1895 | Upvalues: v86 (ref), v68 (ref), v87 (ref), Hotbar (ref), v28 (ref), v52 (ref), v20 (ref), Template (ref), ReplicatedStorage (ref), v26 (ref), v17 (ref), onHotbarSlotInteraction (ref), v56 (ref), t2 (ref), v1 (ref), t6 (ref), v11 (ref), v95 (ref), ExtraHotbarSlots (ref), EquippedToolChangedSignal (ref) ]]
		v86:Destroy()
		local EquippedTool = v68.EquippedTool
		local v2 = (if EquippedTool then EquippedTool.ToolData else EquippedTool) or nil
		local v3 = v87:get()
		local v4 = Hotbar:GetChildren()
		table.sort(v4, function(p1_2, p2_2) --[[ Line: 1906 ]]
			local v2 = tonumber(p1_2.Name) or 0
			return v2 < (tonumber(p2_2.Name) or 0)
		end)
		local v5 = NumberRange.new(v3, v3 + 2)
		for v7, v8 in v4 do
			local v6
			local v10 = tonumber(v8.Name)
			if v10 then
				local v112 = v8.Value
				local v122 = v28.GetByName(v112)
				v6 = if v122 and (v68.GetTrackedItemValue and table.find({ "Buildings", "Equipment", "Chests", "Seeds" }, v122.ItemType)) then v68:GetTrackedItemValue(v112, v122.ItemType) else v122 and v68.GetItemValueAny and v68:GetItemValueAny(v112) or nil
				local v15 = v6 and v52.fromProperty(v6, "Value") or nil
				local v16 = v20:IsHotbarSlotUnlocked(v68, v10)
				local v172 = nil
				local v18 = (if v172 then v172 elseif v5.Min <= v10 then true else false) and (if v10 <= v5.Max then true else false)
				local v19 = v86:GiveTask(Template:Clone())
				local v202 = v122 and (if v2 == v122 then true else false)
				if v122 then
					if v2 == v122 then
						local v21 = v19.Menu.Content
						local NameLabel = v21.NameLabel
						v21.BackgroundColor3 = Color3.fromRGB(19, 146, 121)
						NameLabel.TextTransparency = 0
						NameLabel.Visible = true
						local EquippedHotbar = ReplicatedStorage.Storage.Assets.EquippedHotbar
						local UIGradient = v19.Menu.UIGradient
						UIGradient.Color = EquippedHotbar.Color
						UIGradient.Rotation = EquippedHotbar.Rotation
					end
					v86:GiveTask(v19.Activated:Connect(function() --[[ Line: 1955 | Upvalues: v26 (ref), v17 (ref), onHotbarSlotInteraction (ref), v10 (copy), v15 (copy), v122 (copy) ]]
						if v26.IsSelectingHotbarSlot() then
							return
						end
						if v17.IsHUDOpen() then
							onHotbarSlotInteraction(v10, v15, v122)
						end
					end))
				else
					v86:GiveTask(v19.Activated:Connect(function() --[[ Line: 1967 | Upvalues: v26 (ref), v17 (ref), v56 (ref), t2 (ref) ]]
						if v26.IsSelectingHotbarSlot() then
							return
						end
						if not v17.IsHUDOpen() then
							return
						end
						if v56.CanDoActionInTutorial("Inventory") then
							v26.Open(t2)
						end
					end))
				end
				if v15 then
					local OwnedLabel = v19.Menu.Content.OwnedLabel
					local NoneOwnedLabel = v19.Menu.Content.NoneOwnedLabel
					local v23 = true
					v86:GiveTask(v15:subscribe(function(p1_2) --[[ Line: 1990 | Upvalues: v23 (ref), OwnedLabel (copy), v1 (ref), NoneOwnedLabel (copy) ]]
						local v12 = tonumber(p1_2) or 0
						local v2 = if v12 == 0 then Color3.fromRGB(255, 96, 96) else Color3.new(255/255, 255/255, 255/255)
						local v3
						if v23 then
							v3 = (1 / 0)
							v23 = false
						else
							v3 = 1
						end
						OwnedLabel.Text = ("x%*"):format(v12)
						v1.target(OwnedLabel, 1, v3, {
							TextColor3 = v2
						})
						NoneOwnedLabel.Visible = v12 == 0
					end))
				end
				if v122 then
					local NameLabel = v19.Menu.Content.NameLabel
					v86:GiveTask(v19.InputBegan:Connect(function(p1_2) --[[ Line: 2012 | Upvalues: t6 (ref), v1 (ref), NameLabel (copy) ]]
						if table.find(t6, p1_2.UserInputType) then
							v1.target(NameLabel, 1, (1 / 0), {
								TextTransparency = 0
							})
						end
					end))
					v86:GiveTask(v19.InputEnded:Connect(function(p1_2) --[[ Line: 2020 | Upvalues: t6 (ref), v202 (copy), v1 (ref), NameLabel (copy) ]]
						if not table.find(t6, p1_2.UserInputType) then
							return
						end
						if not v202 then
							v1.target(NameLabel, 1, (1 / 0), {
								TextTransparency = 1
							})
						end
					end))
					v19.Menu.Content.Viewport.Image = v122.Image
				end
				v19.Menu.Content.NameLabel.Text = nil or (v122 and v11.GetDisplayName(v112, v122) or nil) or v112
				v19.Menu.Content.OwnedLabel.Visible = v16 and v122
				v19.Menu.Content.UnboundIcon.Visible = v16 and not v122
				v19.Menu.Content.Viewport.Visible = v16 and v122
				v19.Locked.Visible = not v16
				v19.Name = tostring(v10)
				v19.Visible = v18
				v19.Parent = Template.Parent
			end
		end
		for v262, v27 in v4 do
			v86:GiveTask(v27:GetPropertyChangedSignal("Value"):Connect(v95))
		end
		v86:GiveTask(v87:changed(v95))
		v86:GiveTask(Hotbar.ChildAdded:Connect(v95))
		v86:GiveTask(Hotbar.ChildRemoved:Connect(v95))
		v86:GiveTask(ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(v95))
		if not EquippedToolChangedSignal then
			return
		end
		v86:GiveTask(EquippedToolChangedSignal:Connect(v95))
	end)
end
local function setIsRiding() --[[ setIsRiding | Line: 2067 | Upvalues: v88 (copy), v68 (copy) ]]
	v88:set(v68:GetCurrentAnimal() and true or false)
end
local function setMobileMovementControls() --[[ setMobileMovementControls | Line: 2072 | Upvalues: v81 (ref), v46 (copy), v68 (copy), v22 (copy) ]]
	if not v81 then
		return
	end
	if (if v81.Flying then "Thumbstick" else v46.GetSetting(v68, "MobileMovementControls")) == "Thumbstick" then
		v68.PlayerControls:Enable()
		return
	end
	if not v22.IsMobileInputType() then
		return
	end
	v68.PlayerControls:Disable()
end
local function refreshMobileJoystickAfterHUDRestored() --[[ refreshMobileJoystickAfterHUDRestored | Line: 2088 | Upvalues: setMobileMovementControls (copy), v68 (copy), v21 (copy), v88 (copy), v46 (copy), v17 (copy), HUDGui (copy) ]]
	setMobileMovementControls()
	local v1 = v68:GetCurrentAnimal()
	local v2 = v21:get()
	local v3 = v88:get()
	local v4 = v46.GetSetting(v68, "MobileMovementControls") == "Thumbstick"
	local v5 = if v1 then v1.Flying else v1
	HUDGui.Joystick.Visible = if v3 then if v4 or v5 then if v2 == "Touch" then v17.IsHUDOpen() else false else v5 else v3
	HUDGui.Joystick.Stamina.Visible = v3
end
local function horseChanged() --[[ horseChanged | Line: 2104 | Upvalues: v82 (copy), v81 (ref), v68 (copy), HUDGui (copy), v17 (copy), TweenService (copy), v51 (copy), v3 (copy), LocalPlayer (copy), v6 (copy), v56 (copy), v50 (copy), v15 (copy), v60 (copy), v83 (copy), v71 (copy), v22 (copy), v84 (copy), setMobileMovementControls (copy), v12 (copy), v46 (copy), StarterPlayer (copy) ]]
	v82:DoCleaning()
	v81 = v68:GetCurrentAnimal()
	if v81 then
		local StaminaTracker = v81.StaminaTracker
		local FlyStaminaTracker = v81.FlyStaminaTracker
		for v1, v2 in HUDGui.BottomFrame:GetChildren() do
			local v32 = if v2.Name == "Mobile" then true else false
			local v4 = StaminaTracker:GetStamina()
			local t = {}
			local function animateStamina(p1, p2) --[[ animateStamina | Line: 2117 | Upvalues: v17 (ref), StaminaTracker (copy), t (copy), TweenService (ref) ]]
				if v17.IsFrameOpen(p2.ParentFrame) then
					task.spawn(function() --[[ Line: 2122 | Upvalues: p1 (copy), StaminaTracker (ref), t (ref), p2 (copy), TweenService (ref) ]]
						if p1 == "Up" and tick() - StaminaTracker._lastDecrement < 0.75 then
							return
						end
						if t[p1] and tick() - t[p1] < 0.2 then
							return
						end
						t[p1] = tick()
						local v1 = p2.Frame.ClipFrame[p1 .. "Arrow"]:Clone()
						v1.Name = p1 .. tostring(tick())
						v1.Position = UDim2.new(0.5, 0, if p1 == "Up" then 1.3 else -0.3, 0)
						v1.Visible = true
						v1.Parent = p2.Frame.ClipFrame
						local v9 = TweenInfo.new(1, Enum.EasingStyle.Linear)
						local t2 = {}
						t2.Position = UDim2.new(0.5, 0, if p1 == "Up" then -0.3 else 1.3, 0)
						local v14 = TweenService:Create(v1, v9, t2)
						v14:Play()
						v14.Completed:Wait()
						v1:Destroy()
					end)
				end
			end
			v82:GiveTask(v51.new({
				Direction = "Down",
				TweenAmount = true,
				TweenTime = 0.1,
				Clipped = true,
				Frame = v2.Bottom.HorseStatus.Stamina.Menu.Background,
				ParentFrame = v2,
				Get = function() --[[ Get | Line: 2160 | Upvalues: StaminaTracker (copy) ]]
					return StaminaTracker:GetStamina()
				end,
				GetMax = function() --[[ GetMax | Line: 2164 | Upvalues: StaminaTracker (copy) ]]
					return StaminaTracker:GetMaxStamina()
				end,
				Changed = { StaminaTracker.StaminaChangedSignal },
				OnChanged = function(p1, p2, p3) --[[ OnChanged | Line: 2170 | Upvalues: v4 (ref), v17 (ref), StaminaTracker (copy), t (copy), TweenService (ref) ]]
					local v1 = p1 - v4
					v4 = p1
					if v1 > 0 then
						if v17.IsFrameOpen(p3.ParentFrame) then
							local v2 = "Up"
							task.spawn(function() --[[ Line: 2122 | Upvalues: v2 (copy), StaminaTracker (ref), t (ref), p3 (copy), TweenService (ref) ]]
								if v2 == "Up" and tick() - StaminaTracker._lastDecrement < 0.75 then
									return
								end
								if t[v2] and tick() - t[v2] < 0.2 then
									return
								end
								t[v2] = tick()
								local v1 = p3.Frame.ClipFrame[v2 .. "Arrow"]:Clone()
								v1.Name = v2 .. tostring(tick())
								v1.Position = UDim2.new(0.5, 0, if v2 == "Up" then 1.3 else -0.3, 0)
								v1.Visible = true
								v1.Parent = p3.Frame.ClipFrame
								local v9 = TweenInfo.new(1, Enum.EasingStyle.Linear)
								local t2 = {}
								t2.Position = UDim2.new(0.5, 0, if v2 == "Up" then -0.3 else 1.3, 0)
								local v14 = TweenService:Create(v1, v9, t2)
								v14:Play()
								v14.Completed:Wait()
								v1:Destroy()
							end)
						end
					else
						if not (v1 < 0) then
							return
						end
						if not v17.IsFrameOpen(p3.ParentFrame) then
							return
						end
						local v3 = "Down"
						task.spawn(function() --[[ Line: 2122 | Upvalues: v3 (copy), StaminaTracker (ref), t (ref), p3 (copy), TweenService (ref) ]]
							if v3 == "Up" and tick() - StaminaTracker._lastDecrement < 0.75 then
								return
							end
							if t[v3] and tick() - t[v3] < 0.2 then
								return
							end
							t[v3] = tick()
							local v1 = p3.Frame.ClipFrame[v3 .. "Arrow"]:Clone()
							v1.Name = v3 .. tostring(tick())
							v1.Position = UDim2.new(0.5, 0, if v3 == "Up" then 1.3 else -0.3, 0)
							v1.Visible = true
							v1.Parent = p3.Frame.ClipFrame
							local v9 = TweenInfo.new(1, Enum.EasingStyle.Linear)
							local t2 = {}
							t2.Position = UDim2.new(0.5, 0, if v3 == "Up" then -0.3 else 1.3, 0)
							local v14 = TweenService:Create(v1, v9, t2)
							v14:Play()
							v14.Completed:Wait()
							v1:Destroy()
						end)
					end
				end
			}))
			v82:GiveTask(v3.new({
				DoNotClone = true,
				IgnoreBackgroundColor = true,
				SlotValue = v81.SlotValue,
				Owner = LocalPlayer,
				GuiObject = v2.Bottom.HorseStatus.HorseButton
			}))
			v82:GiveTask(v6.new(v2.Bottom.HorseStatus.HorseButton, {
				Click = function() --[[ Click | Line: 2191 | Upvalues: v56 (ref), v50 (ref), v81 (ref) ]]
					if v56.CanDoActionInTutorial("Stables") then
						v50.ReOpen(v81.SlotValue)
					end
				end
			}))
			local v5 = tick()
			local function applySpeedLabelToFrame(p1) --[[ applySpeedLabelToFrame | Line: 2202 | Upvalues: v15 (ref), v81 (ref), v60 (ref) ]]
				p1.Stance.TextTransparency = 0
				p1.Stance.TextStrokeTransparency = 0.5
				p1.Stance.Text = v15.separateWordsInString(v81.MoveState)
				for v1, v2 in p1.Frame:GetChildren() do
					if v2:IsA("Frame") then
						v2.LayoutOrder = table.find(v60.Gaits, v2.Name) or #v60.Gaits
						v2.Slot.Background.Fill.Visible = if v2.Name == v81.MoveState then true else false
						if v2.Name == "RaceSprint" then
							v2.Visible = v81.MoveState == "RaceSprint"
						end
					end
				end
			end
			local function setSpeedLabel() --[[ setSpeedLabel | Line: 2221 | Upvalues: v17 (ref), v2 (copy), v83 (ref), v5 (ref), applySpeedLabelToFrame (copy), v71 (ref) ]]
				if v17.IsFrameOpen(v2) then
					v83:Fire()
				end
				local v1 = tick()
				v5 = v1
				applySpeedLabelToFrame(v2.Speeds)
				if not v71 then
					task.delay(3, function() --[[ Line: 2235 | Upvalues: v1 (copy), v5 (ref), v2 (ref), v71 (ref) ]]
						if v1 ~= v5 then
							return
						end
						v2.Speeds.Stance.TextTransparency = 0.5
						v2.Speeds.Stance.TextStrokeTransparency = 0.6
						if not v71 then
							return
						end
						v71.Stance.TextTransparency = 0.5
						v71.Stance.TextStrokeTransparency = 0.6
					end)
					return
				end
				applySpeedLabelToFrame(v71)
				task.delay(3, function() --[[ Line: 2235 | Upvalues: v1 (copy), v5 (ref), v2 (ref), v71 (ref) ]]
					if v1 ~= v5 then
						return
					end
					v2.Speeds.Stance.TextTransparency = 0.5
					v2.Speeds.Stance.TextStrokeTransparency = 0.6
					if not v71 then
						return
					end
					v71.Stance.TextTransparency = 0.5
					v71.Stance.TextStrokeTransparency = 0.6
				end)
			end
			v82:GiveTask(v81.MoveStateChangedSignal:Connect(setSpeedLabel))
			setSpeedLabel()
			local function updateFlyingState() --[[ updateFlyingState | Line: 2250 | Upvalues: v22 (ref), v2 (copy), v84 (ref), v81 (ref), v71 (ref), v32 (copy), setMobileMovementControls (ref) ]]
				if v2.Name == (if v22.IsMobileInputType() then "Mobile" else "Other") then
					v84:Fire()
				end
				if v81 and v81.Flying then
					v2.Bottom.HorseStatus.Stamina.Visible = false
					v2.Speeds.Visible = false
					if v71 then
						v71.Visible = false
					end
					if v32 then
						setMobileMovementControls()
					end
					if v2.Bottom.HorseStatus:FindFirstChild("KeyboardControls") then
						v2.Bottom.HorseStatusPadding.KeyboardControls.Land.Visible = true
						v2.Bottom.HorseStatusPadding.KeyboardControls.Fly.Visible = false
						v2.Bottom.HorseStatus.GamepadControls.Controls.Land.Visible = true
						v2.Bottom.HorseStatus.GamepadControls.Controls.Fly.Visible = false
						v2.Bottom.HorseStatus.GamepadControls.Controls.Jump.Visible = false
						v2.Bottom.HorseStatus.GamepadControls.Position = UDim2.new(0.276, 0, 1, 0)
						v2.Bottom.HorseStatus.KeyboardControls.Position = UDim2.new(0.276, 0, 0.908, 0)
					end
				else
					if v32 then
						setMobileMovementControls()
					end
					v2.Speeds.Visible = true
					if v71 then
						v71.Visible = true
					end
					v2.Bottom.HorseStatus.Stamina.Visible = true
					if not v2.Bottom.HorseStatus:FindFirstChild("KeyboardControls") then
						return
					end
					local v23 = v81.WingData or v81.IsToyWings
					v2.Bottom.HorseStatusPadding.KeyboardControls.Land.Visible = false
					v2.Bottom.HorseStatusPadding.KeyboardControls.Fly.Visible = v23
					v2.Bottom.HorseStatus.GamepadControls.Controls.Land.Visible = false
					v2.Bottom.HorseStatus.GamepadControls.Controls.Fly.Visible = v23
					v2.Bottom.HorseStatus.GamepadControls.Controls.Jump.Visible = true
					v2.Bottom.HorseStatus.KeyboardControls.Position = UDim2.new(-0.075, 0, 0.908, 0)
					v2.Bottom.HorseStatus.GamepadControls.Position = UDim2.new(-0.075, 0, 1, 0)
				end
			end
			v82:GiveTask(v81.FlyingStateChangedSignal:Connect(updateFlyingState))
			updateFlyingState()
			v2.Bottom.HorseStatus.Visible = true
			if v2.Bottom:FindFirstChild("HorseStatusPadding") then
				v2.Bottom.HorseStatusPadding.Visible = true
			end
			if v2:FindFirstChild("MoveToCommand") then
				v2.MoveToCommand.Position = UDim2.new(0.5, 0, -1, 0)
			end
			if v2:FindFirstChild("GamepadBind") then
				v2.GamepadBind.Position = UDim2.new(0.89, 0, -0.548, 0)
			end
		end
		if v81.WingData or v81.IsToyWings then
			local t = {}
			local function animateFlyStamina(p1, p2) --[[ animateFlyStamina | Line: 2326 | Upvalues: v17 (ref), StaminaTracker (copy), t (copy), TweenService (ref) ]]
				if v17.IsFrameOpen(p2.ParentFrame) then
					task.spawn(function() --[[ Line: 2331 | Upvalues: p1 (copy), StaminaTracker (ref), t (ref), p2 (copy), TweenService (ref) ]]
						if p1 == "Up" and tick() - StaminaTracker._lastDecrement < 0.75 then
							return
						end
						if not t[p2.ParentFrame] then
							t[p2.ParentFrame] = {}
						end
						if t[p2.ParentFrame][p1] and tick() - t[p2.ParentFrame][p1] < 0.5 then
							return
						end
						t[p2.ParentFrame][p1] = tick()
						local v1 = p2.Frame.ClipFrame[p1 .. "Arrow"]:Clone()
						v1.Name = p1 .. tostring(tick())
						v1.Position = UDim2.new(if p1 == "Up" then -0.3 else 1.3, 0, 0.5, 0)
						v1.Visible = true
						v1.Parent = p2.Frame.ClipFrame
						local v7 = TweenInfo.new(2, Enum.EasingStyle.Linear)
						local t2 = {}
						t2.Position = UDim2.new(if p1 == "Up" then 1.3 else -0.3, 0, 0.5, 0)
						local v10 = TweenService:Create(v1, v7, t2)
						v10:Play()
						v10.Completed:Wait()
						v1:Destroy()
					end)
				end
			end
			v82:GiveTask(v12.new({
				Name = "FlyStamina",
				Direction = "LeftToRight",
				TweenAmount = true,
				TweenTime = 0.1,
				Clipped = true,
				Get = function() --[[ Get | Line: 2371 | Upvalues: FlyStaminaTracker (copy) ]]
					return FlyStaminaTracker:GetStamina()
				end,
				GetMax = function() --[[ GetMax | Line: 2375 | Upvalues: FlyStaminaTracker (copy) ]]
					return FlyStaminaTracker:GetMaxStamina()
				end,
				Changed = { FlyStaminaTracker.StaminaChangedSignal },
				OnChanged = function(p1, p2, p3) --[[ OnChanged | Line: 2381 | Upvalues: FlyStaminaTracker (copy), v17 (ref), StaminaTracker (copy), t (copy), TweenService (ref) ]]
					if not p3.LastStamina then
						p3.LastStamina = FlyStaminaTracker:GetStamina()
					end
					local v1 = p1 - p3.LastStamina
					p3.LastStamina = p1
					if not (v1 < 0) then
						return
					end
					if not v17.IsFrameOpen(p3.ParentFrame) then
						return
					end
					local v2 = "Down"
					task.spawn(function() --[[ Line: 2331 | Upvalues: v2 (copy), StaminaTracker (ref), t (ref), p3 (copy), TweenService (ref) ]]
						if v2 == "Up" and tick() - StaminaTracker._lastDecrement < 0.75 then
							return
						end
						if not t[p3.ParentFrame] then
							t[p3.ParentFrame] = {}
						end
						if t[p3.ParentFrame][v2] and tick() - t[p3.ParentFrame][v2] < 0.5 then
							return
						end
						t[p3.ParentFrame][v2] = tick()
						local v1 = p3.Frame.ClipFrame[v2 .. "Arrow"]:Clone()
						v1.Name = v2 .. tostring(tick())
						v1.Position = UDim2.new(if v2 == "Up" then -0.3 else 1.3, 0, 0.5, 0)
						v1.Visible = true
						v1.Parent = p3.Frame.ClipFrame
						local v7 = TweenInfo.new(2, Enum.EasingStyle.Linear)
						local t2 = {}
						t2.Position = UDim2.new(if v2 == "Up" then 1.3 else -0.3, 0, 0.5, 0)
						local v10 = TweenService:Create(v1, v7, t2)
						v10:Play()
						v10.Completed:Wait()
						v1:Destroy()
					end)
				end,
				Visible = function() --[[ Visible | Line: 2395 | Upvalues: v81 (ref) ]]
					return v81.Flying
				end,
				VisibleChanged = { v81.FlyingStateChangedSignal }
			}))
		end
		local function characterAdded(p1) --[[ characterAdded | Line: 2403 ]]
			p1:WaitForChild("Humanoid").JumpPower = 0
		end
		v82:GiveTask(LocalPlayer.CharacterAdded:Connect(characterAdded))
		if not LocalPlayer.Character then
			v82:GiveTask(v22.InputTypeChanged:Connect(setMobileMovementControls))
			v82:GiveTask(v46.GetSettingChangedSignal(v68, "MobileMovementControls"):Connect(setMobileMovementControls))
			setMobileMovementControls()
			return
		end
		task.spawn(characterAdded, LocalPlayer.Character)
		v82:GiveTask(v22.InputTypeChanged:Connect(setMobileMovementControls))
		v82:GiveTask(v46.GetSettingChangedSignal(v68, "MobileMovementControls"):Connect(setMobileMovementControls))
		setMobileMovementControls()
	else
		if v71 then
			v71.Visible = false
		end
		for v62, v7 in HUDGui.BottomFrame:GetChildren() do
			v7.Bottom.HorseStatus.Visible = false
			v7.Speeds.Visible = false
			if v7.Bottom:FindFirstChild("HorseStatusPadding") then
				v7.Bottom.HorseStatusPadding.Visible = false
			end
			if v7:FindFirstChild("MoveToCommand") then
				v7.MoveToCommand.Position = UDim2.new(0.5, 0, -0.3, 0)
			end
			if v7:FindFirstChild("GamepadBind") then
				v7.GamepadBind.Position = UDim2.new(0.79, 0, -0.548, 0)
			end
		end
		local function characterAdded(p1) --[[ characterAdded | Line: 2436 | Upvalues: StarterPlayer (ref) ]]
			p1:WaitForChild("Humanoid").JumpPower = StarterPlayer.CharacterJumpPower
		end
		v82:GiveTask(LocalPlayer.CharacterAdded:Connect(characterAdded))
		if not LocalPlayer.Character then
			v68.PlayerControls:Enable()
			return
		end
		task.spawn(characterAdded, LocalPlayer.Character)
		v68.PlayerControls:Enable()
	end
end
local function setupCurrencyFrame(p1, p2) --[[ setupCurrencyFrame | Line: 2451 | Upvalues: v68 (copy), v52 (copy), v1 (copy), v14 (copy), t12 (copy), v67 (copy), v5 (copy), v16 (copy), v18 (copy) ]]
	local v2 = v52.fromProperty(nil or v68:GetCurrencyValue(p1) or (if v68.EventData then v68.EventData:FindFirstChild(p1) or nil else nil), "Value")
	local v3 = v52.new(0)
	v2:subscribe(function(p1) --[[ Line: 2460 | Upvalues: v1 (ref), v3 (copy) ]]
		v1.targetState(v3, 1, 2, p1)
	end)
	v3:subscribe(function(p1) --[[ Line: 2466 | Upvalues: v2 (copy), p2 (copy), v14 (ref) ]]
		local v1 = v2:get()
		if v1 > 0 and (v1 - p1) / v1 <= 0.1 then
			p1 = v1
		end
		p2.Amount.Text = v14.splice((math.floor(tonumber(p1) or 0)))
	end)
	local v4 = v52.fromProperty(p2.UIListLayout, "AbsoluteContentSize")
	local BackgroundButton = p2.Folder.BackgroundButton
	v4:subscribe(function(p1) --[[ Line: 2481 | Upvalues: BackgroundButton (copy) ]]
		BackgroundButton.Size = UDim2.new(0, p1.X, 1, 0)
	end)
	local v53 = p2.Name
	local v9 = nil or t12[v53]
	local v11 = v9 and v9(nil or (if v53 == "Coins" then "Coins" else nil) or (if v53 == "Event" then "PremiumShop" else nil) or (if v53 == "EventCurrency" then "PremiumShop" else nil))
	local v122 = v67 or not v11
	v5.new(BackgroundButton, {
		Click = function() --[[ Click | Line: 2499 | Upvalues: v11 (ref), v122 (copy), v53 (copy) ]]
			if v11 then
				v11()
			end
			if not v122 then
				return
			end
			warn(v53)
		end
	})
	v16:subscribe(function() --[[ Line: 2510 | Upvalues: v18 (ref), p2 (copy) ]]
		local v1 = v18.GetGameState("Lassoing") ~= true
		if not v1 then
			v1 = v18.GetGameState("Currency")
		end
		p2.Visible = v1
	end)
end
function t._setupArrowButtons(p1) --[[ _setupArrowButtons | Line: 2522 | Upvalues: v10 (copy), v60 (copy), v18 (copy), v52 (copy), v21 (copy), v88 (copy), v70 (copy), v68 (copy), HUDGui (copy), v1 (copy), v5 (copy) ]]
	local v12 = v10.new()
	local function canShowArrowButtons() --[[ canShowArrowButtons | Line: 2525 | Upvalues: v60 (ref), v18 (ref) ]]
		if v60.GameStates.ArrowButtons == nil then
			return v18.GetGameState("BottomFrame")
		else
			return v60.GameStates.ArrowButtons
		end
	end
	local t = { v21, v88, v70 }
	v52.subscribeMulti(t, function(p1, p2, p3) --[[ Line: 2532 | Upvalues: v12 (copy), v68 (ref), v52 (ref), HUDGui (ref), v60 (ref), v18 (ref), v21 (ref), v1 (ref) ]]
		v12:destroy()
		local v13 = v68:GetCurrentAnimal()
		local v5 = v12:add(v52.new(if v13 then v13.Flying else v13))
		local v6 = if p3 == "Thumbstick" then false else true
		local ArrowButtons = HUDGui.ArrowButtons
		ArrowButtons.Visible = (if v60.GameStates.ArrowButtons == nil then v18.GetGameState("BottomFrame") else v60.GameStates.ArrowButtons) and (if p2 then if v6 then not v5 and (if p1 == "Touch" then true else false) else v6 else p2)
		HUDGui.ArrowButtons.Stamina.Visible = p2
		if v13 and p2 then
			local v8 = v12:add(v52.new(v13.MoveState))
			v12:add(v8:subscribe(function(p1, p2) --[[ Line: 2548 | Upvalues: HUDGui (ref) ]]
				HUDGui.ArrowButtons.MoveState.Text = string.gsub(p1, "(%l)(%u)", "%1 %2")
			end))
			v12:add(v13.MoveStateChangedSignal:Connect(function() --[[ Line: 2552 | Upvalues: v8 (copy), v13 (copy) ]]
				v8:set(v13.MoveState)
			end))
			local t = {
				v21,
				v5,
				v13.FlyStaminaTracker.StaminaState,
				v13.StaminaTracker.StaminaState
			}
			v12:add(v52.subscribeMulti(t, function(p1, p2) --[[ Line: 2563 | Upvalues: HUDGui (ref), v60 (ref), v18 (ref), v6 (copy), v13 (copy), v1 (ref) ]]
				HUDGui.ArrowButtons.Visible = (if v60.GameStates.ArrowButtons == nil then v18.GetGameState("BottomFrame") else v60.GameStates.ArrowButtons) and v6 and not p2 and (if p1 == "Touch" then true else false)
				local v2 = nil
				local v3 = (if v2 then v2 elseif p2 then v13.FlyStaminaTracker or nil else nil) or v13.StaminaTracker
				v1.target(HUDGui.ArrowButtons.Stamina.StaminaBar.Fill.UIGradient, 1, 2, {
					Offset = Vector2.xAxis * (v3:GetStamina() / v3:GetMaxStamina() - 0.01)
				})
			end))
			v12:add(v13.FlyingStateChangedSignal:Connect(function() --[[ Line: 2583 | Upvalues: v5 (copy), v13 (copy) ]]
				v5:set(v13.Flying)
			end))
			v12:add(v60.GameStateChangedSignal:Connect(function() --[[ Line: 2587 | Upvalues: HUDGui (ref), v60 (ref), v18 (ref), v6 (copy), v5 (copy), v21 (ref) ]]
				HUDGui.ArrowButtons.Visible = (if v60.GameStates.ArrowButtons == nil then v18.GetGameState("BottomFrame") else v60.GameStates.ArrowButtons) and v6 and not v5:get() and v21:get() == "Touch"
			end))
		end
	end)
	v5.new(HUDGui.ArrowButtons.Buttons.TurnLeft, {
		OnDown = function() --[[ OnDown | Line: 2593 | Upvalues: v68 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 then
				v1.MobileTurn = v1.MobileTurn - 1
			end
		end,
		OnUp = function() --[[ OnUp | Line: 2603 | Upvalues: v68 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 then
				v1.MobileTurn = 0
			end
		end,
		OnLeave = function() --[[ OnLeave | Line: 2613 | Upvalues: v68 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 then
				v1.MobileTurn = 0
			end
		end
	})
	v5.new(HUDGui.ArrowButtons.Buttons.TurnRight, {
		OnDown = function() --[[ OnDown | Line: 2625 | Upvalues: v68 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 then
				v1.MobileTurn = v1.MobileTurn + 1
			end
		end,
		OnUp = function() --[[ OnUp | Line: 2635 | Upvalues: v68 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 then
				v1.MobileTurn = 0
			end
		end,
		OnLeave = function() --[[ OnLeave | Line: 2645 | Upvalues: v68 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if v1 then
				v1.MobileTurn = 0
			end
		end
	})
end
function t._setupBottomFrame(p1) --[[ _setupBottomFrame | Line: 2658 | Upvalues: HUDGui (copy), v17 (copy), v18 (copy) ]]
	for v1, v2 in HUDGui.BottomFrame:GetChildren() do
		v17.AddFrame(v2, {
			HUD = true,
			TweenAnimation = true,
			OpenPosition = v2.Position,
			ClosePosition = v2.Position + UDim2.new(0, 0, 0.2, 0),
			TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			InputType = v2.Name,
			CheckVisibility = function() --[[ CheckVisibility | Line: 2668 | Upvalues: v18 (ref) ]]
				if v18.GetGameState("BottomFrame") then
					return true
				end
			end
		})
	end
end
function t._setupControlGuis(p1) --[[ _setupControlGuis | Line: 2680 | Upvalues: HUDGui (copy), t11 (copy), v67 (copy), v5 (copy), v68 (copy), v1 (copy), v83 (copy), v84 (copy), v52 (copy), v88 (copy), v75 (copy), v70 (copy), v17 (copy), v18 (copy) ]]
	for v12, v2 in HUDGui.Controls:GetDescendants() do
		if v2:IsA("GuiButton") then
			local v3 = v2.Name
			local v4 = t11[v3]
			local v53 = v67 or not v4
			local TextLabel = v2:FindFirstChildOfClass("TextLabel")
			if TextLabel then
				TextLabel.Text = string.gsub(v3, "(%l)(%u)", "%1 %2")
			end
			v5.new(v2, {
				Click = function() --[[ Click | Line: 2700 | Upvalues: v53 (copy), v3 (copy), v4 (copy), v68 (ref) ]]
					if v53 then
						warn(v3)
					end
					if not v4 then
						return
					end
					v4((v68:GetCurrentAnimal()))
				end
			})
		end
	end
	local SpeedUp = HUDGui.Controls:FindFirstChild("SpeedUp", true)
	local ImageLabel = SpeedUp.ImageLabel
	local TextLabel = SpeedUp.TextLabel
	local UIStroke = TextLabel.UIStroke
	local SlowDown = HUDGui.Controls:FindFirstChild("SlowDown", true)
	local ImageLabel_2 = SlowDown.ImageLabel
	local TextLabel_2 = SlowDown.TextLabel
	local UIStroke_2 = TextLabel_2.UIStroke
	local function updateGaitButtonStates() --[[ updateGaitButtonStates | Line: 2726 | Upvalues: v68 (ref), SpeedUp (copy), ImageLabel (copy), v1 (ref), TextLabel (copy), UIStroke (copy), SlowDown (copy), ImageLabel_2 (copy), TextLabel_2 (copy), UIStroke_2 (copy) ]]
		local v12 = v68:GetCurrentAnimal()
		local v2 = if v12 then v12.MoveState else v12
		if SpeedUp then
			local v3 = v2 == "RaceSprint"
			if ImageLabel then
				local t = {}
				t.ImageTransparency = if v3 then 0.6 else 0
				v1.target(ImageLabel, 1, 4, t)
			end
			if TextLabel then
				local t = {}
				t.TextTransparency = if v3 then 1 else 0
				v1.target(TextLabel, 1, 4, t)
				TextLabel.Text = if v2 == "Gallop" then "Sprint" else "Speed Up"
			end
			if UIStroke then
				local t = {}
				t.Transparency = if v3 then 1 else 0
				v1.target(UIStroke, 1, 4, t)
			end
		end
		if not SlowDown then
			return
		end
		local v18 = v2 == "Reverse"
		if ImageLabel_2 then
			local t = {}
			t.ImageTransparency = if v18 then 0.6 else 0
			v1.target(ImageLabel_2, 1, 4, t)
		end
		if TextLabel_2 then
			local t = {}
			t.TextTransparency = if v18 then 1 else 0
			v1.target(TextLabel_2, 1, 4, t)
			TextLabel_2.Text = if v2 == "Idle" then "Reverse" else "Slow Down"
		end
		if not UIStroke_2 then
			return
		end
		local t = {}
		t.Transparency = if v18 then 1 else 0
		v1.target(UIStroke_2, 1, 4, t)
	end
	v83:Connect(updateGaitButtonStates)
	v68.CurrentAnimalChangedSignal:Connect(updateGaitButtonStates)
	updateGaitButtonStates()
	local Fly = HUDGui.Controls:FindFirstChild("Fly", true)
	local Left = HUDGui.Controls.Riding.Left
	local Top = HUDGui.Controls.Riding.Top
	local function updateWingDependentControls() --[[ updateWingDependentControls | Line: 2790 | Upvalues: v68 (ref), Fly (copy), SpeedUp (copy), Left (copy), Top (copy) ]]
		local v1 = v68:GetCurrentAnimal()
		local v2 = v1 and (v1.WingData or v1.IsToyWings) and true or false
		if Fly then
			Fly.Visible = v2
		end
		if not SpeedUp then
			return
		end
		SpeedUp.Parent = v2 and Left or Top
	end
	v84:Connect(updateWingDependentControls)
	v68.CurrentAnimalChangedSignal:Connect(updateWingDependentControls)
	local v6 = v68:GetCurrentAnimal()
	local v7 = if v6 and (v6.WingData or v6.IsToyWings) then true else false
	if Fly then
		Fly.Visible = v7
	end
	if SpeedUp then
		SpeedUp.Parent = if v7 then if Left then Left else Top else Top
	end
	v52.subscribeMulti({ v88, v75 }, function(p1, p2) --[[ Line: 2807 | Upvalues: HUDGui (ref) ]]
		local v1 = not p1
		if p2 then
			p2.Visible = v1
		end
		HUDGui.Controls.Riding.Visible = p1
		HUDGui.Controls.Walking.Visible = v1
	end)
	v70:subscribe(function(p1) --[[ Line: 2818 | Upvalues: SpeedUp (copy), SlowDown (copy) ]]
		SpeedUp.Visible = true
		SlowDown.Visible = true
	end)
	local function updateFlyingButtonVisibility() --[[ updateFlyingButtonVisibility | Line: 2823 | Upvalues: v68 (ref), SpeedUp (copy), SlowDown (copy) ]]
		local v1 = v68:GetCurrentAnimal()
		local v2 = if v1 then v1.Flying else v1
		SpeedUp.Visible = not v2
		SlowDown.Visible = not v2
	end
	v68.CurrentAnimalChangedSignal:Connect(function() --[[ Line: 2831 | Upvalues: v68 (ref), updateFlyingButtonVisibility (copy), SpeedUp (copy), SlowDown (copy) ]]
		local v1 = v68:GetCurrentAnimal()
		if v1 then
			v1.FlyingStateChangedSignal:Connect(updateFlyingButtonVisibility)
		end
		local v2 = v68:GetCurrentAnimal()
		local v3 = if v2 then v2.Flying else v2
		SpeedUp.Visible = not v3
		SlowDown.Visible = not v3
	end)
	v17.AddFrame(HUDGui.Controls, {
		HUD = true,
		KeepPosition = true,
		TweenAnimation = false,
		InputType = "Mobile",
		CheckVisibility = function() --[[ CheckVisibility | Line: 2846 | Upvalues: v18 (ref) ]]
			return v18.GetGameState("BottomFrame")
		end
	})
end
function t._setupControls(p1) --[[ _setupControls | Line: 2853 | Upvalues: v7 (copy), v91 (ref), v68 (copy), NewTutorial (copy), v69 (copy), v56 (copy), v42 (copy), v36 (copy), v18 (copy), v57 (copy), v41 (copy), v25 (copy), v17 (copy), v26 (copy), PlayerGui (copy), v50 (copy), HUDGui (copy), v85 (ref) ]]
	v7:AddControls("GaitUp", { Enum.KeyCode.W, Enum.KeyCode.Up, Enum.KeyCode.ButtonR2 }, v91.SpeedUp, function(p1, p2, p3) --[[ Line: 2858 | Upvalues: v68 (ref), NewTutorial (ref), v69 (ref), v56 (ref) ]]
		if p3 == "Gamepad" and v68:IsInAction("FeedTaming") then
			return
		end
		if not NewTutorial:get() or v69:get() then
			return true
		end
		if (if v68.PrimaryTutorialStageValue then v56.HasCompletedPrimaryTutorial(v68) else false) or (v68.JumpTwice or (v68.LearnToTameAHorse or v68.VisitTheHelpBoard)) then
			return true
		end
	end)
	v7:AddControls("GaitDown", { Enum.KeyCode.S, Enum.KeyCode.Down, Enum.KeyCode.ButtonL2 }, v91.SlowDown, function(p1, p2, p3) --[[ Line: 2887 | Upvalues: v68 (ref), NewTutorial (ref), v69 (ref), v56 (ref) ]]
		if p3 == "Gamepad" and v68:IsInAction("FeedTaming") then
			return
		end
		if not NewTutorial:get() or v69:get() then
			return true
		end
		if (if v68.PrimaryTutorialStageValue then v56.HasCompletedPrimaryTutorial(v68) else false) or (v68.JumpTwice or (v68.LearnToTameAHorse or v68.VisitTheHelpBoard)) then
			return true
		end
	end)
	v7:AddControls("Jump", { Enum.KeyCode.Space }, v91.Jump, function() --[[ Line: 2914 | Upvalues: v42 (ref), v36 (ref), v18 (ref), v57 (ref) ]]
		if v42.IsOpen() then
			return
		end
		if v36:IsActive() then
			return
		end
		if v18.CanShowHUD() then
			return v57.CanNavigateHUD()
		else
			return true
		end
	end)
	v7:AddControls("Fly", { Enum.KeyCode.F }, v91.Fly, function() --[[ Line: 2932 | Upvalues: v42 (ref), v36 (ref), v68 (ref), v57 (ref) ]]
		if v42.IsOpen() then
			return
		end
		if v36:IsActive() then
			return
		end
		if v68:IsInAction("FeedTaming") then
		else
			return v57.CanNavigateHUD()
		end
	end)
	v7:AddControls("TurnLeft", { Enum.KeyCode.Left }, v91.TurnLeft, function() --[[ Line: 2950 ]]
		return true
	end)
	v7:AddControls("TurnRight", { Enum.KeyCode.Right }, v91.TurnRight, function() --[[ Line: 2956 ]]
		return true
	end)
	v7:AddControls("JumpOrFly", { Enum.KeyCode.ButtonA }, v91.JumpOrFly, function() --[[ Line: 2962 | Upvalues: v42 (ref), v36 (ref), v18 (ref), v57 (ref) ]]
		if v42.IsOpen() then
			return
		end
		if v36:IsActive() then
			return
		end
		if v18.CanShowHUD() then
			return v57.CanNavigateHUD()
		else
			return true
		end
	end)
	v7:AddControls("JumpOrDismount", { Enum.KeyCode.Q, Enum.KeyCode.ButtonY }, v91.JumpOrDismount, function() --[[ Line: 2981 | Upvalues: v18 (ref), v41 (ref), v25 (ref), NewTutorial (ref), v69 (ref), v68 (ref), v56 (ref), v57 (ref) ]]
		if v18.GetGameState("Lassoing") then
			return
		end
		if v41.IsActive() then
			return false
		end
		if v25.GetLastOpenMenu() then
			return false
		end
		if not NewTutorial:get() or v69:get() then
			return v57.CanNavigateHUD()
		end
		if if v68.PrimaryTutorialStageValue then v56.HasCompletedPrimaryTutorial(v68) else false then
			return v57.CanNavigateHUD()
		end
	end)
	v7:AddControls("Sprint", { Enum.KeyCode.LeftShift, Enum.KeyCode.ButtonR1 }, v91.Sprint, function() --[[ Line: 3009 ]]
		return true
	end)
	v7:AddControls("RaceSprint", { Enum.KeyCode.LeftShift, Enum.KeyCode.ButtonR1 }, v91.RaceSprint, function() --[[ Line: 3016 ]]
		return true
	end)
	v7:AddControls("Crouch", { Enum.KeyCode.C, Enum.KeyCode.ButtonY }, v91.Sneak, function() --[[ Line: 3023 | Upvalues: v57 (ref), v17 (ref), v68 (ref) ]]
		return v57.CanNavigateHUD() and (v17.IsHUDOpen() and not v68.Humanoid.SeatPart)
	end)
	v7:AddControls("RadialMenu", { Enum.KeyCode.T, Enum.KeyCode.DPadLeft }, v91.RadialMenu, function() --[[ Line: 3030 | Upvalues: v18 (ref), v17 (ref), v57 (ref), v68 (ref) ]]
		if v18.GetGameState("Lassoing") then
			return
		end
		return v17.IsHUDOpen() and (v57.CanNavigateHUD() and not v68.WildCutsceneMode)
	end)
	v7:AddControls("Inventory", { Enum.KeyCode.G }, function() --[[ Line: 3040 | Upvalues: v56 (ref), v26 (ref) ]]
		if v56.GetGameState("Inventory") then
			v26.Open()
		end
	end, function() --[[ Line: 3046 | Upvalues: v68 (ref), v17 (ref), PlayerGui (ref), v57 (ref) ]]
		if v68:IsInAction("Race") then
			return
		end
		return if v17.IsHUDOpen() or v17.MainFrameOpen == PlayerGui.InventoryGui.ContainerFrame then v57.CanNavigateHUD() and not v68.WildCutsceneMode else false
	end)
	v7:AddControls("Stables", { Enum.KeyCode.H, Enum.KeyCode.ButtonL1 }, function() --[[ Line: 3059 | Upvalues: v56 (ref), v50 (ref) ]]
		if v56.GetGameState("Stables") then
			v50.Open()
		end
	end, function() --[[ Line: 3065 | Upvalues: v68 (ref), v17 (ref), PlayerGui (ref), v57 (ref) ]]
		if v68:IsInAction("Race") then
			return
		end
		return if v17.IsHUDOpen() or v17.MainFrameOpen == PlayerGui.StablesGui.ContainerFrame then v57.CanNavigateHUD() and not v68.WildCutsceneMode else false
	end)
	v7:AddControls("HUDRightFrame", { Enum.KeyCode.DPadRight }, function() --[[ Line: 3075 | Upvalues: v57 (ref), HUDGui (ref) ]]
		v57.SetGamepadSelection(HUDGui.RightFrame.Other:FindFirstChild("Inventory", true))
	end, function() --[[ Line: 3077 | Upvalues: v17 (ref), v57 (ref), v68 (ref) ]]
		return v17.IsHUDOpen() and (v57.CanNavigateHUD() and not v68.WildCutsceneMode)
	end)
	v7:AddControls("HUDTopFrame", { Enum.KeyCode.DPadUp }, function() --[[ Line: 3083 | Upvalues: HUDGui (ref), v57 (ref) ]]
		local v1 = nil
		for v2, v3 in HUDGui.TopFrame.Other.ButtonsFrame:GetChildren() do
			if v3:IsA("Frame") and (v3.Visible and v3:GetAttribute("IsActive")) then
				v1 = v3:FindFirstChild("Button")
				break
			end
		end
		if not v1 then
			return
		end
		v57.SetGamepadSelection(v1)
	end, function() --[[ Line: 3107 | Upvalues: v17 (ref), v57 (ref), v68 (ref) ]]
		return v17.IsHUDOpen() and (v57.CanNavigateHUD() and not v68.WildCutsceneMode)
	end)
	v7:AddControls("HUDBottomFrame", { Enum.KeyCode.DPadDown }, function() --[[ Line: 3113 | Upvalues: v85 (ref), HUDGui (ref), v68 (ref), v57 (ref) ]]
		local v1 = nil
		for i = 1, 6 do
			if i <= 3 then
				if v85 then
					continue
				end
			elseif not v85 then
				continue
			end
			local v2 = HUDGui.BottomFrame.Other.Bottom["Slot" .. i]
			if v2:GetAttribute("Equipped") then
				v1 = v2.Menu
				break
			end
		end
		if not v1 then
			for j = 1, 6 do
				if j <= 3 then
					if v85 then
						continue
					end
				elseif not v85 then
					continue
				end
				if not (#v68.HotbarData[tostring(j)].Value <= 0) then
					v1 = HUDGui.BottomFrame.Other.Bottom["Slot" .. j].Menu
					break
				end
			end
		end
		v57.SetGamepadSelection(if v1 then v1 else v85 and HUDGui.BottomFrame.Other.Bottom.Slot4.Menu or HUDGui.BottomFrame.Other.Bottom.Slot1.Menu)
	end, function() --[[ Line: 3159 | Upvalues: v17 (ref), v57 (ref), v68 (ref) ]]
		return v17.IsHUDOpen() and (v57.CanNavigateHUD() and not v68.WildCutsceneMode)
	end)
end
function t._setupCurrencyFrames(p1) --[[ _setupCurrencyFrames | Line: 3165 | Upvalues: HUDGui (copy), v63 (copy), setupCurrencyFrame (copy), CurrentEvent (copy) ]]
	for v1, v2 in {
		[HUDGui.MobileRightFrame.Core.Coins] = "Coins",
		[HUDGui.RightFrame.Other.Coins] = "Coins",
		[HUDGui.MobileRightFrame.Core.Event] = v63,
		[HUDGui.RightFrame.Other.EventCurrency] = v63
	} do
		setupCurrencyFrame(v2, v1)
	end
	for v3, v4 in { HUDGui.MobileRightFrame.Core.Event, HUDGui.RightFrame.Other.EventCurrency } do
		if not CurrentEvent then
			v4.Visible = false
		end
	end
end
function t._setupDynamicThumbstick(p1) --[[ _setupDynamicThumbstick | Line: 3186 | Upvalues: v52 (copy), HUDGui (copy), v76 (copy), v77 (copy), v74 (copy) ]]
	local v1 = v52.fromProperty(HUDGui.Joystick, "AnchorPoint")
	local v2 = v52.fromProperty(HUDGui.Joystick, "Position")
	local v3 = v52.fromProperty(HUDGui.Joystick, "Size")
	for v4, v5 in { v76, v77 } do
		v5:subscribe(function(p1) --[[ Line: 3192 ]]
			if not p1 then
				return
			end
			local v1 = nil
			local v2 = (if v1 then v1 else p1:FindFirstChildOfClass("UIScale")) or Instance.new("UIScale")
			v2.Scale = 0.5
			v2.Parent = p1
			p1.AnchorPoint = Vector2.one * 0.5
			p1.Position = UDim2.fromScale(0.5, 0.5)
		end)
	end
	v74:subscribe(function(p1, p2) --[[ Line: 3209 ]]
		if not p1 then
			return
		end
		local v1 = nil
		((if v1 then v1 else p1:FindFirstChildOfClass("UIAspectRatioConstraint")) or Instance.new("UIAspectRatioConstraint")).Parent = p1
		local v3 = nil
		local v4 = (if v3 then v3 else p1:FindFirstChildOfClass("UISizeConstraint")) or Instance.new("UISizeConstraint")
		v4.MaxSize = Vector2.new(150, (1 / 0))
		v4.Parent = p1
	end)
	v52.subscribeMulti({ v74, v1, v2, v3 }, function(p1, p2, p3, p4) --[[ Line: 3226 ]]
		if p1 then
			p1.AnchorPoint = p2
			p1.Position = p3
			p1.Size = p4
		end
	end)
end
function t._setupHorse(p1) --[[ _setupHorse | Line: 3238 | Upvalues: v68 (copy), setIsRiding (copy), v88 (copy), horseChanged (copy) ]]
	v68.CurrentAnimalChangedSignal:Connect(setIsRiding)
	v88:set(v68:GetCurrentAnimal() and true or false)
	v68.CurrentAnimalChangedSignal:Connect(horseChanged)
	horseChanged()
end
function t._setupHotbar(p1) --[[ _setupHotbar | Line: 3247 | Upvalues: HUDGui (copy), v6 (copy), v87 (copy), v66 (copy), v86 (copy), v68 (copy), Hotbar (copy), v28 (copy), v52 (copy), v20 (copy), Template (copy), ReplicatedStorage (copy), v26 (copy), v17 (copy), onHotbarSlotInteraction (copy), v56 (copy), t2 (copy), v1 (copy), t6 (copy), v11 (copy), v95 (copy), ExtraHotbarSlots (copy), EquippedToolChangedSignal (copy), v18 (copy), v85 (ref), t7 (copy), t8 (copy), v79 (copy), v60 (copy), createHotbarSlot (copy), v7 (copy), t4 (copy), v27 (copy), equipOrUnequipTool (copy) ]]
	for v12, v2 in HUDGui.Hotbar.Swap:GetChildren() do
		if v2:IsA("GuiButton") then
			local v4 = nil or (if v2.Name == "Expand" then 4 else nil) or (if v2.Name == "Shrink" then 1 else nil) or 1
			v6.new(v2, {
				Click = function() --[[ Click | Line: 3260 | Upvalues: v87 (ref), v4 (ref) ]]
					v87:set(v4)
				end
			})
			v87:subscribe(function(p1) --[[ Line: 3265 | Upvalues: v2 (copy) ]]
				v2.Visible = if v2.Name == "Expand" and p1 ~= 4 then true elseif v2.Name == "Shrink" then if p1 == 1 then false else true else false
			end)
		end
	end
	local v5 = nil
	local v72 = if v5 then v5 elseif v66 then task.defer or nil else nil
	v86._onHotbarChanged = (if v72 then v72 else task.spawn)(function() --[[ Line: 1895 | Upvalues: v86 (ref), v68 (ref), v87 (ref), Hotbar (ref), v28 (ref), v52 (ref), v20 (ref), Template (ref), ReplicatedStorage (ref), v26 (ref), v17 (ref), onHotbarSlotInteraction (ref), v56 (ref), t2 (ref), v1 (ref), t6 (ref), v11 (ref), v95 (ref), ExtraHotbarSlots (ref), EquippedToolChangedSignal (ref) ]]
		v86:Destroy()
		local EquippedTool = v68.EquippedTool
		local v2 = (if EquippedTool then EquippedTool.ToolData else EquippedTool) or nil
		local v3 = v87:get()
		local v4 = Hotbar:GetChildren()
		table.sort(v4, function(p1_2, p2_2) --[[ Line: 1906 ]]
			local v2 = tonumber(p1_2.Name) or 0
			return v2 < (tonumber(p2_2.Name) or 0)
		end)
		local v5 = NumberRange.new(v3, v3 + 2)
		for v7, v8 in v4 do
			local v6
			local v10 = tonumber(v8.Name)
			if v10 then
				local v112 = v8.Value
				local v122 = v28.GetByName(v112)
				v6 = if v122 and (v68.GetTrackedItemValue and table.find({ "Buildings", "Equipment", "Chests", "Seeds" }, v122.ItemType)) then v68:GetTrackedItemValue(v112, v122.ItemType) else v122 and v68.GetItemValueAny and v68:GetItemValueAny(v112) or nil
				local v15 = v6 and v52.fromProperty(v6, "Value") or nil
				local v16 = v20:IsHotbarSlotUnlocked(v68, v10)
				local v172 = nil
				local v18 = (if v172 then v172 elseif v5.Min <= v10 then true else false) and (if v10 <= v5.Max then true else false)
				local v19 = v86:GiveTask(Template:Clone())
				local v202 = v122 and (if v2 == v122 then true else false)
				if v122 then
					if v2 == v122 then
						local v21 = v19.Menu.Content
						local NameLabel = v21.NameLabel
						v21.BackgroundColor3 = Color3.fromRGB(19, 146, 121)
						NameLabel.TextTransparency = 0
						NameLabel.Visible = true
						local EquippedHotbar = ReplicatedStorage.Storage.Assets.EquippedHotbar
						local UIGradient = v19.Menu.UIGradient
						UIGradient.Color = EquippedHotbar.Color
						UIGradient.Rotation = EquippedHotbar.Rotation
					end
					v86:GiveTask(v19.Activated:Connect(function() --[[ Line: 1955 | Upvalues: v26 (ref), v17 (ref), onHotbarSlotInteraction (ref), v10 (copy), v15 (copy), v122 (copy) ]]
						if v26.IsSelectingHotbarSlot() then
							return
						end
						if v17.IsHUDOpen() then
							onHotbarSlotInteraction(v10, v15, v122)
						end
					end))
				else
					v86:GiveTask(v19.Activated:Connect(function() --[[ Line: 1967 | Upvalues: v26 (ref), v17 (ref), v56 (ref), t2 (ref) ]]
						if v26.IsSelectingHotbarSlot() then
							return
						end
						if not v17.IsHUDOpen() then
							return
						end
						if v56.CanDoActionInTutorial("Inventory") then
							v26.Open(t2)
						end
					end))
				end
				if v15 then
					local OwnedLabel = v19.Menu.Content.OwnedLabel
					local NoneOwnedLabel = v19.Menu.Content.NoneOwnedLabel
					local v23 = true
					v86:GiveTask(v15:subscribe(function(p1_2) --[[ Line: 1990 | Upvalues: v23 (ref), OwnedLabel (copy), v1 (ref), NoneOwnedLabel (copy) ]]
						local v12 = tonumber(p1_2) or 0
						local v2 = if v12 == 0 then Color3.fromRGB(255, 96, 96) else Color3.new(255/255, 255/255, 255/255)
						local v3
						if v23 then
							v3 = (1 / 0)
							v23 = false
						else
							v3 = 1
						end
						OwnedLabel.Text = ("x%*"):format(v12)
						v1.target(OwnedLabel, 1, v3, {
							TextColor3 = v2
						})
						NoneOwnedLabel.Visible = v12 == 0
					end))
				end
				if v122 then
					local NameLabel = v19.Menu.Content.NameLabel
					v86:GiveTask(v19.InputBegan:Connect(function(p1_2) --[[ Line: 2012 | Upvalues: t6 (ref), v1 (ref), NameLabel (copy) ]]
						if table.find(t6, p1_2.UserInputType) then
							v1.target(NameLabel, 1, (1 / 0), {
								TextTransparency = 0
							})
						end
					end))
					v86:GiveTask(v19.InputEnded:Connect(function(p1_2) --[[ Line: 2020 | Upvalues: t6 (ref), v202 (copy), v1 (ref), NameLabel (copy) ]]
						if not table.find(t6, p1_2.UserInputType) then
							return
						end
						if not v202 then
							v1.target(NameLabel, 1, (1 / 0), {
								TextTransparency = 1
							})
						end
					end))
					v19.Menu.Content.Viewport.Image = v122.Image
				end
				v19.Menu.Content.NameLabel.Text = nil or (v122 and v11.GetDisplayName(v112, v122) or nil) or v112
				v19.Menu.Content.OwnedLabel.Visible = v16 and v122
				v19.Menu.Content.UnboundIcon.Visible = v16 and not v122
				v19.Menu.Content.Viewport.Visible = v16 and v122
				v19.Locked.Visible = not v16
				v19.Name = tostring(v10)
				v19.Visible = v18
				v19.Parent = Template.Parent
			end
		end
		for v262, v27 in v4 do
			v86:GiveTask(v27:GetPropertyChangedSignal("Value"):Connect(v95))
		end
		v86:GiveTask(v87:changed(v95))
		v86:GiveTask(Hotbar.ChildAdded:Connect(v95))
		v86:GiveTask(Hotbar.ChildRemoved:Connect(v95))
		v86:GiveTask(ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(v95))
		if not EquippedToolChangedSignal then
			return
		end
		v86:GiveTask(EquippedToolChangedSignal:Connect(v95))
	end)
	v17.AddFrame(HUDGui.Hotbar, {
		HUD = true,
		KeepPosition = true,
		TweenAnimation = false,
		InputType = "Mobile",
		CheckVisibility = function() --[[ CheckVisibility | Line: 3279 | Upvalues: v18 (ref) ]]
			if _G.HotbarVisible == false then
				return false
			else
				return v18.GetGameState("BottomFrame")
			end
		end
	})
	local function shrinkOrExpandHotbar(p1) --[[ shrinkOrExpandHotbar | Line: 3289 | Upvalues: v85 (ref), t7 (ref), t8 (ref) ]]
		v85 = if p1 == nil then not v85 else p1
		for v1, v2 in t7 do
			for v4, v5 in v2 do
				local v3
				v3 = if v85 and v1 > 3 then true else not v85 and (if v1 <= 3 then true else false)
				v5.Visible = v3
			end
		end
		for v6, v7 in t8 do
			for v8, v9 in { "Shrink", "Expand" } do
				local v10 = v7:FindFirstChild(v9, true)
				if v10 then
					v10.Visible = v9 == "Shrink" and v85 or (if v9 == "Expand" then not v85 else false)
				end
			end
		end
	end
	v26.ShrinkOrExpandHUDHotbar = shrinkOrExpandHotbar
	for v9, v10 in HUDGui.BottomFrame:GetChildren() do
		local SwapButton = v10.Bottom:FindFirstChild("SwapButton")
		if SwapButton then
			for v112, v12 in { "Shrink", "Expand" } do
				local v13 = SwapButton:FindFirstChild(v12, true)
				if v13 then
					v6.new(v13, {
						Rotate = false,
						Click = function() --[[ Click | Line: 3325 | Upvalues: v79 (ref), shrinkOrExpandHotbar (copy), v12 (copy) ]]
							v79:FireServer("InteractedWithMinorInterface", "HotbarSwap")
							shrinkOrExpandHotbar(v12 == "Expand")
						end
					})
				end
			end
			table.insert(t8, SwapButton)
			local v15 = v20:HasExtraHotbarSlots(v68)
			local function setSwapButton(p1) --[[ setSwapButton | Line: 3337 | Upvalues: v20 (ref), v68 (ref), v15 (ref), SwapButton (copy), shrinkOrExpandHotbar (copy) ]]
				local v1 = v20:HasExtraHotbarSlots(v68)
				local v2 = if v1 == v15 then false else true
				v15 = v1
				SwapButton.Visible = if v1 then _G.HotbarVisible ~= false else v1
				if p1 or not v2 then
					return
				end
				shrinkOrExpandHotbar(false)
			end
			v68.PlayerData.ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(setSwapButton)
			v60.GameStateChangedSignal:Connect(setSwapButton)
			local v16 = v20:HasExtraHotbarSlots(v68)
			v15 = v16
			SwapButton.Visible = v16 and _G.HotbarVisible ~= false
		end
	end
	for i = 1, 6 do
		for v182, v19 in HUDGui.BottomFrame:GetChildren() do
			createHotbarSlot(i, v19.Bottom:WaitForChild("Slot" .. i))
		end
		v7:AddControls("Hotbar" .. i, { t4[i] }, {
			InputBegan = function(p1) --[[ InputBegan | Line: 3363 | Upvalues: i (copy), v85 (ref), v68 (ref), v27 (ref), v26 (ref), equipOrUnequipTool (ref) ]]
				if i > 3 then
					if not v85 then
						return
					end
				elseif v85 then
					return
				end
				local v2 = v68.HotbarData[tostring(i)].Value
				if #v2 > 0 and not v68:HasEnoughOfItem(1, v2) then
					v27.NotifyIssue("NoOwnAnymore")
					v26.Open()
				else
					equipOrUnequipTool(i)
				end
			end
		}, function() --[[ Line: 3387 ]]
			return not _G.DisableHotbar
		end)
	end
	shrinkOrExpandHotbar(false)
end
function t._setupAllButtons(p1) --[[ _setupAllButtons | Line: 3401 | Upvalues: HUDGui (copy), v92 (ref), v67 (copy), resolveButtonParents (copy), v31 (copy), v6 (copy), v52 (copy), v16 (copy), t3 (copy), v18 (copy) ]]
	local Gradients = HUDGui.Gradients
	local Templates = HUDGui.Templates
	for v1, v2 in v92 do
		if v2.Enabled ~= false then
			local v3 = v2.Name
			local v4 = v2.Type or "HUD"
			local v5 = Gradients:FindFirstChild(v3)
			local v62 = nil
			if v5 then
				local v7 = (1 / 0)
				for v8, v9 in v5.Color.Keypoints do
					local v10 = select(-1, v9.Value:ToHSV())
					if not (v7 <= v10) then
						v62 = v9.Value
						v7 = v10
					end
				end
			end
			local v12 = string.gsub(v2.Text or v3, "(%l)(%u)", "%1 %2")
			local Run = v2.Run
			local Init = v2.Init
			v14 = v67 or not Run
			v15 = {}
			v162 = v12
			for v17, v182 in resolveButtonParents(v2) do
				local v19 = Templates.Template:Clone()
				local BackgroundColor3 = v19.BackgroundColor3
				local v20 = v19.Color:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient")
				v20.Parent = v19.Color
				if v5 then
					local v21 = v20
					for v22, v23 in { "Color", "Offset", "Rotation", "Transparency" } do
						v21[v23] = v5[v23]
					end
					local v24, v25, v26 = v62:ToHSV()
					BackgroundColor3 = Color3.fromHSV(v24, v25, v26 * 0.75)
				end
				if v2.Timer then
					v19.Timer.Visible = true
					v2.Timer.TimeChanged:Connect(function() --[[ Line: 3466 | Upvalues: v19 (copy), v31 (ref), v2 (copy) ]]
						v19.Timer.Text = ("%*"):format((v31.FormatTimeWithoutLeadingZeros(v2.Timer:GetTime())))
					end)
				end
				if v4 == "Menu" then
					v19.Title.AnchorPoint = Vector2.new(0.5, 1)
					v19.Title.Position = UDim2.new(0.5, 0, 1, 2)
				end
				if v4 == "HUD" then
					local t = {
						AddHoverButton = true,
						Rotate = false
					}
					t.HideNotification = if v3 == "Quests" then false else true
					t.HoverUpLabel = v19.Color.Menu.Icon
					function t.Click() --[[ Click | Line: 3487 | Upvalues: v14 (ref), v3 (copy), Run (copy), v2 (copy), v19 (copy) ]]
						if v14 then
							warn(v3)
						end
						if not Run then
							return
						end
						Run(v2, v19)
					end
					v6.new(v19, t)
				else
					v6.new(v19, {
						Click = function() --[[ Click | Line: 3499 | Upvalues: v14 (ref), v3 (copy), Run (copy), v2 (copy), v19 (copy) ]]
							if v14 then
								warn(v3)
							end
							if not Run then
								return
							end
							Run(v2, v19)
						end
					})
				end
				if Init then
					Init(v2, v19)
				end
				v52.fromAttribute(v19, "Notification"):subscribe(function(p1) --[[ Line: 3515 | Upvalues: v19 (copy) ]]
					v19.Notification.Visible = p1 and true or false
				end)
				v19.Color.Menu.Icon.Image = v2.Image or v19.Color.Menu.Icon.Image
				v19.Color.Menu.UIStroke.Color = BackgroundColor3
				v19.Title.Text = v162
				v19.BackgroundColor3 = BackgroundColor3
				v19.LayoutOrder = v2.LayoutOrder
				v19.Name = v3
				v19.Visible = true
				v19.Parent = v182
				if v4 == "HUD" then
					v16:subscribe(function(p1) --[[ Line: 3531 | Upvalues: v3 (copy), t3 (ref), v18 (ref), v19 (copy) ]]
						local t = { v3 }
						for v1, v2 in t3 do
							if table.find(v2.Buttons, v3) then
								for v32, v4 in v2.GameStates do
									table.insert(t, v4)
								end
							end
						end
						local v5 = nil
						for v6, v7 in t do
							local v8 = v18.GetGameState(v7)
							v5 = v8
							if not v8 then
								break
							end
						end
						v19.Visible = v5
					end)
				end
				table.insert(v15, v19)
			end
			v2.Buttons = v15
		end
	end
end
function t._setupJoystick(p1) --[[ _setupJoystick | Line: 3566 | Upvalues: HUDGui (copy), v10 (copy), v52 (copy), v21 (copy), v88 (copy), v70 (copy), v68 (copy), v17 (copy), v1 (copy), v76 (copy), v46 (copy) ]]
	local Button = HUDGui.Joystick.Button
	local v12 = v10.new()
	local t = { v21, v88, v70 }
	v52.subscribeMulti(t, function(p1, p2, p3) --[[ Line: 3570 | Upvalues: v12 (copy), v68 (ref), v52 (ref), v17 (ref), HUDGui (ref), v21 (ref), v1 (ref) ]]
		v12:destroy()
		local v13 = v68:GetCurrentAnimal()
		local v5 = v12:add(v52.new(v13 and v13.Flying))
		local v6 = if p3 == "Thumbstick" then true else false
		HUDGui.Joystick.Visible = (nil or p2 and (v6 or v5:get())) and p1 == "Touch" and v17.IsHUDOpen()
		HUDGui.Joystick.Stamina.Visible = p2
		if v13 and p2 then
			local v8 = v12:add(v52.new(v13.MoveState))
			v12:add(v8:subscribe(function(p1, p2) --[[ Line: 3591 | Upvalues: HUDGui (ref) ]]
				HUDGui.Joystick.Stamina.MoveState.Text = string.gsub(p1, "(%l)(%u)", "%1 %2")
			end))
			v12:add(v13.MoveStateChangedSignal:Connect(function() --[[ Line: 3595 | Upvalues: v8 (copy), v13 (copy) ]]
				v8:set(v13.MoveState)
			end))
			v12:add(v5:subscribe(function() --[[ Line: 3606 | Upvalues: v17 (ref) ]]
				if not v17.MainFrameOpen then
					v17.OpenHUD()
				end
			end))
			v12:add(v52.subscribeMulti({
				v21,
				v5,
				v13.FlyStaminaTracker.StaminaState,
				v13.StaminaTracker.StaminaState
			}, function(p1, p2) --[[ Line: 3613 | Upvalues: v6 (copy), v17 (ref), HUDGui (ref), v13 (copy), v1 (ref) ]]
				local v12 = nil
				HUDGui.Joystick.Visible = (if v12 then v12 elseif p2 then p2 else v6) and p1 == "Touch" and v17.IsHUDOpen()
				local v3 = nil
				local v4 = (if v3 then v3 elseif p2 then v13.FlyStaminaTracker or nil else nil) or v13.StaminaTracker
				v1.target(HUDGui.Joystick.Stamina.StaminaBar.Fill.UIGradient, 1, 2, {
					Offset = -Vector2.yAxis * (v4:GetStamina() / v4:GetMaxStamina())
				})
			end))
			v12:add(v13.FlyingStateChangedSignal:Connect(function() --[[ Line: 3638 | Upvalues: v5 (copy), v13 (copy) ]]
				v5:set(v13.Flying)
			end))
		end
	end)
	v76:subscribe(function(p1, p2) --[[ Line: 3644 ]] end)
	v17.AddFrame(HUDGui.Joystick, {
		HUD = true,
		KeepPosition = true,
		TweenAnimation = false,
		InputType = "Mobile",
		CheckVisibility = function() --[[ CheckVisibility | Line: 3687 | Upvalues: v68 (ref), v46 (ref) ]]
			local v1 = v68:GetCurrentAnimal()
			if not v1 then
				return false
			end
			return (v46.GetSetting(v68, "MobileMovementControls") == "Thumbstick" or v1.Flying) and true or false
		end
	})
end
function t._setupJumpButton(p1) --[[ _setupJumpButton | Line: 3709 | Upvalues: v52 (copy), HUDGui (copy), v75 (copy) ]]
	local v1 = v52.fromProperty(HUDGui.Controls.Walking, "AbsoluteSize")
	v75:subscribe(function(p1, p2) --[[ Line: 3712 | Upvalues: v1 (copy) ]]
		if p1 then
			p2:add(v1:subscribe(function(p12) --[[ Line: 3717 | Upvalues: p1 (copy) ]]
				local v1 = math.max(p12.X, p12.Y)
				p1.AnchorPoint = Vector2.one
				p1.Size = UDim2.fromOffset(v1, v1)
				p1.Position = UDim2.new(1, -(p12.X + 16 + 8), 1, -12)
			end))
		end
	end)
end
function t._setupMinimap(p1) --[[ _setupMinimap | Line: 3734 | Upvalues: v52 (copy), HUDGui (copy), RunService (copy), v35 (copy), LocalPlayer (copy), v5 (copy), v56 (copy), v32 (copy), v18 (copy), TweenService (copy), GuiService (copy), v17 (copy), v68 (copy), v6 (copy) ]]
	local function v1(p1) --[[ reflect | Line: 3735 | Upvalues: v1 (copy), v52 (ref) ]]
		local v12 = p1:Clone()
		v12:ClearAllChildren()
		local t = {}
		local ChildAdded = v12.ChildAdded
		table.insert(t, ChildAdded:Connect(function(p1) --[[ Line: 3743 ]]
			if p1:IsA("TextLabel") then
				p1.Visible = false
			end
		end))
		for v2, v3 in p1:GetChildren() do
			local v4 = v1(v3)
			local t2 = {}
			local t3 = {}
			if v3:IsA("GuiObject") then
				local v5 = v52.fromProperty(v3, "Position")
				local v6 = v52.fromProperty(v3, "Rotation")
				table.insert(t2, v5)
				table.insert(t2, v6)
				table.insert(t3, v5:subscribe(function(p1) --[[ Line: 3762 | Upvalues: v4 (copy) ]]
					v4.Position = p1
				end))
				table.insert(t3, v6:subscribe(function(p1) --[[ Line: 3766 | Upvalues: v4 (copy) ]]
					v4.Rotation = p1
				end))
			end
			v3.Destroying:Once(function() --[[ Line: 3771 | Upvalues: t2 (copy), t3 (copy), v4 (copy) ]]
				for v1, v2 in t2 do
					v2:destroy()
				end
				for v3, v42 in t3 do
					v42()
				end
				v4:Destroy()
			end)
			v4.Parent = v12
		end
		local v7 = p1.ChildAdded:Connect(function(p1) --[[ Line: 3786 | Upvalues: v1 (ref), v52 (ref), v12 (ref) ]]
			local v13 = v1(p1)
			local t = {}
			local t2 = {}
			if p1:IsA("GuiObject") then
				local v2 = v52.fromProperty(p1, "Position")
				local v3 = v52.fromProperty(p1, "Rotation")
				local v4 = v52.fromProperty(p1, "Visible")
				table.insert(t, v2)
				table.insert(t, v3)
				table.insert(t, v4)
				table.insert(t2, v2:subscribe(function(p1) --[[ Line: 3799 | Upvalues: v13 (copy) ]]
					v13.Position = p1
				end))
				table.insert(t2, v3:subscribe(function(p1) --[[ Line: 3803 | Upvalues: v13 (copy) ]]
					v13.Rotation = p1
				end))
				table.insert(t2, v4:subscribe(function(p1) --[[ Line: 3807 | Upvalues: v13 (copy) ]]
					v13.Visible = p1
				end))
			end
			p1.Destroying:Once(function() --[[ Line: 3812 | Upvalues: t (copy), t2 (copy), v13 (copy) ]]
				for v1, v2 in t do
					v2:destroy()
				end
				for v3, v4 in t2 do
					v4()
				end
				v13:Destroy()
			end)
			v13.Parent = v12
		end)
		table.insert(t, v7)
		p1.Destroying:Once(function() --[[ Line: 3830 | Upvalues: t (copy) ]]
			for v1, v2 in t do
				v2:Disconnect()
			end
		end)
		return v12
	end
	for v2, v3 in { HUDGui.Minimap.Minimap.MapTarget, HUDGui.MobileRightFrame.Minimap.MapTarget } do
		local v4 = nil
		RunService.Heartbeat:Connect(function() --[[ Line: 3842 | Upvalues: v35 (ref), LocalPlayer (ref), v4 (ref) ]]
			local v1 = v35.Container.Content.Content.Map.Icons:FindFirstChild("Player_Local") or v35.Container.Content.Content.Map.Icons:FindFirstChild((("Player_%*"):format(LocalPlayer.UserId)))
			if not v1 then
				return
			end
			local v2 = v1.Parent
			if not v2 then
				return
			end
			local Scale = v1.Position.X.Scale
			local Scale_2 = v1.Position.Y.Scale
			local Y = v1.AbsoluteSize.Y
			local Y_2 = v2.AbsoluteSize.Y
			if Y_2 ~= 0 then
				v4.AnchorPoint = Vector2.new(Scale, Scale_2 - Y / Y_2)
				v4.Position = UDim2.fromScale(0.5, 0.5)
			end
		end)
		v5.new(v3, {
			Click = function() --[[ Click | Line: 3879 | Upvalues: v56 (ref), v35 (ref) ]]
				if v56.CanDoActionInTutorial("Map") then
					v35.Open()
				end
			end
		})
		v4 = v1(v35.Container.Content.Content.Map)
		v4.UIScale.Scale = 3.5
		v4.Visible = true
		v4.Size = UDim2.fromScale(1, 1)
		v4.Parent = v3
	end
	local v53 = TweenInfo.new(0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local Minimap = HUDGui.Minimap.Minimap
	v32.MinimapOpen:subscribe(function(p1, p2) --[[ Line: 3898 | Upvalues: v18 (ref), HUDGui (ref), TweenService (ref), Minimap (copy), v53 (copy), GuiService (ref), v32 (ref) ]]
		if v18.GetGameState("Lassoing") == true then
			p1 = false
		end
		HUDGui.Minimap.Minimap.CloseButton.Visible = p1
		local t = {}
		t.AnchorPoint = p1 and Vector2.xAxis or Vector2.zero
		local v5 = TweenService:Create(Minimap, v53, t)
		v5:Play()
		p2:add(v5)
		p2:add(function() --[[ Line: 3910 | Upvalues: v5 (ref) ]]
			v5:Pause()
		end)
		local v6 = UDim2.new(0.35, 0, 0, -GuiService.TopbarInset.Height)
		local v7 = UDim2.new(0, 0, 0, -GuiService.TopbarInset.Height)
		local v8 = UDim2.new(1, -5, 0, 5)
		local v9, v10
		if p1 then
			v9 = v8
			v10 = v6
		elseif v7 then
			v9 = v8
			v10 = v7
		else
			v9 = v8
			v10 = v6
		end
		v32.LeaderboardGui.Other.Position = v9 + v10 + (not p1 and UDim2.fromScale(0, 0.007) or UDim2.fromScale(0, -0.007))
	end)
	for v62, v7 in { HUDGui.Minimap, HUDGui.MobileRightFrame.Minimap } do
		v17.AddFrame(v7, {
			HUD = true,
			KeepPosition = true,
			TweenAnimation = false,
			CheckVisibility = function() --[[ CheckVisibility | Line: 3933 | Upvalues: v18 (ref), v68 (ref) ]]
				if v18.GetGameState("Lassoing") then
					return
				end
				if not v18.CanShowHUD() then
					return
				end
				if v68:IsInAction("Race") then
				else
					return true
				end
			end
		})
	end
	v6.new(HUDGui.Minimap.Minimap.CloseButton, {
		Click = v32.Toggle
	})
end
function t._setupMenuFrames(p1) --[[ _setupMenuFrames | Line: 3957 | Upvalues: HUDGui (copy), t5 (copy), t9 (copy), v5 (copy), onMenuClicked (copy), v6 (copy), v17 (copy) ]]
	local Templates = HUDGui.Templates
	for v1, v2 in { HUDGui.Menu } do
		local Center = v2.Center
		for v3, v4 in t5 do
			local v52 = Templates.Center:Clone()
			for v62, v7 in {
				[v52] = { "LayoutOrder", "Name" },
				[v52:FindFirstChildOfClass("UIGridLayout")] = { "CellSize", "VerticalAlignment" }
			} do
				for v8, v9 in v7 do
					local v10 = v4[v9]
					v62[v9] = if v10 then v10 else v62[v9]
				end
			end
			v52.Visible = true
			v52.Parent = Center
			t9[v4.Name] = v52
		end
		v5.new(v2.BackgroundButton, {
			Click = onMenuClicked
		})
		v6.new(Center.Folder.CloseButton, {
			Click = onMenuClicked
		})
	end
	v17.AddFrame(HUDGui.Menu, {
		KeepPosition = true,
		TweenAnimation = false,
		ShortcutToClose = true,
		SelectOnOpen = HUDGui.Menu.Center.Folder.CloseButton
	})
end
function t._setupRadialGui(p1) --[[ _setupRadialGui | Line: 4004 | Upvalues: v42 (copy) ]]
	v42:Create()
end
function t._setupRightFrame(p1) --[[ _setupRightFrame | Line: 4009 | Upvalues: v17 (copy), HUDGui (copy), v18 (copy), v68 (copy) ]]
	p1:_setupCurrencyFrames()
	p1:_setupAllButtons()
	v17.AddFrame(HUDGui.MobileRightFrame, {
		KeepPosition = true,
		TweenAnimation = false,
		InputType = "Mobile",
		CheckVisibility = function() --[[ CheckVisibility | Line: 4019 | Upvalues: v18 (ref), v68 (ref) ]]
			if not (v18.GetGameState("SideFrame") or v18.GetGameState("TopFrame")) then
				return
			end
			if v68:IsInAction("Race") then
				return
			end
			return v18.CanShowHUD() or v18.CanShowHUD("TopHUD") and not _G.FocusedBossZone
		end
	})
	v17.AddStateCallback(HUDGui.MobileRightFrame, "OnOpen", function() --[[ Line: 4032 | Upvalues: v17 (ref), HUDGui (ref) ]]
		v17.OpenFrame(HUDGui.MobileRightFrame.Minimap)
	end)
	v17.AddStateCallback(HUDGui.MobileRightFrame, "OnClose", function() --[[ Line: 4036 | Upvalues: v17 (ref), HUDGui (ref) ]]
		v17.CloseFrame(HUDGui.MobileRightFrame.Minimap)
	end)
	v17.AddFrame(HUDGui.RightFrame.Other, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = HUDGui.RightFrame.Other.Position,
		ClosePosition = HUDGui.RightFrame.Other.Position + UDim2.new(0.5, 0, 0, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		InputType = HUDGui.RightFrame.Other.Name,
		CheckVisibility = function() --[[ CheckVisibility | Line: 4050 | Upvalues: v18 (ref), v68 (ref) ]]
			if not v18.GetGameState("SideFrame") then
				return
			end
			if v68:IsInAction("Race") then
			else
				return v18.CanShowHUD()
			end
		end
	})
	HUDGui.RightFrame.Other.ButtonsFrame.LeftFrame.PromoButton.Visible = false
	HUDGui.MobileRightFrame.Core.Other.PromoButton.Visible = false
end
function t._setupTopFrame(p1) --[[ _setupTopFrame | Line: 4069 | Upvalues: v17 (copy), HUDGui (copy), v18 (copy) ]]
	v17.AddFrame(HUDGui.TopFrame.Other, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = HUDGui.TopFrame.Other.Position,
		ClosePosition = HUDGui.TopFrame.Other.Position + UDim2.new(0, 0, -0.2, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		InputType = HUDGui.TopFrame.Other.Name,
		CheckVisibility = function() --[[ CheckVisibility | Line: 4078 | Upvalues: v18 (ref) ]]
			if not v18.GetGameState("TopFrame") then
				return
			end
			return v18.CanShowHUD("TopHUD") and not _G.FocusedBossZone
		end
	})
end
function t._setupTouchGui(p1) --[[ _setupTouchGui | Line: 4089 | Upvalues: v4 (copy), PlayerGui (copy), v10 (copy), v72 (copy), v73 (copy), v74 (copy), v75 (copy), v76 (copy), v77 (copy) ]]
	v4.new(PlayerGui, {
		touchGui = "TouchGui",
		touchControlFrame = "TouchGui/TouchControlFrame",
		dynamicThumbstick = "TouchGui/TouchControlFrame/DynamicThumbstickFrame",
		jumpButton = "TouchGui/TouchControlFrame/JumpButton",
		thumbstickEnd = "TouchGui/TouchControlFrame/DynamicThumbstickFrame/ThumbstickEnd",
		thumbstickStart = "TouchGui/TouchControlFrame/DynamicThumbstickFrame/ThumbstickStart"
	}, function(p1) --[[ Line: 4097 | Upvalues: v10 (ref), v72 (ref), v73 (ref), v74 (ref), v75 (ref), v76 (ref), v77 (ref) ]]
		local v1 = v10.new()
		v72:set(p1.touchGui)
		v73:set(p1.touchControlFrame)
		v74:set(p1.dynamicThumbstick)
		v75:set(p1.jumpButton)
		v76:set(p1.thumbstickEnd)
		v77:set(p1.thumbstickStart)
		return v1
	end)
	v72:subscribe(function(p12) --[[ Line: 4110 | Upvalues: p1 (copy) ]]
		if p12 then
			p1:_setupDynamicThumbstick()
			p1:_setupJumpButton()
			p12.ScreenInsets = Enum.ScreenInsets.None
		end
	end)
end
function t._setupToolInterfaceHandlers(p1) --[[ _setupToolInterfaceHandlers | Line: 4123 | Upvalues: ReflectionService (copy), t24 (copy), v54 (copy), v67 (copy) ]]
	local v1 = ReflectionService:GetEventsOfClass("Tool")
	for v2, v3 in t24 do
		for v4, v5 in v3 do
			local v6 = false
			for v7, v8 in v1 do
				v6 = v8.Name == v4
				if v6 then
					break
				end
			end
			if v6 then
				v54:AddInterfaceHandler(v2, v4, v5)
				if v67 then
					warn((("Added interface handler for tool & event \'%*.%*\'"):format(v2, v4)))
				end
			end
		end
	end
end
function t._setupGui(p1) --[[ _setupGui | Line: 4152 ]]
	p1:_setupArrowButtons()
	p1:_setupBottomFrame()
	p1:_setupControlGuis()
	p1:_setupHotbar()
	p1:_setupJoystick()
	p1:_setupMenuFrames()
	p1:_setupMinimap()
	p1:_setupRadialGui()
	p1:_setupRightFrame()
	p1:_setupTopFrame()
end
function t.Init(p1) --[[ Init | Line: 4166 | Upvalues: v60 (copy), v18 (copy), v25 (copy), v17 (copy), refreshMobileJoystickAfterHUDRestored (copy), v38 (copy), v24 (copy), t10 (copy), v1 (copy), v28 (copy), t2 (copy) ]]
	p1:_setupToolInterfaceHandlers()
	p1:_setupControls()
	p1:_setupHorse()
	p1:_setupGui()
	p1:_setupTouchGui()
	v60.GameStateChangedSignal:Connect(function() --[[ Line: 4173 | Upvalues: v18 (ref), v25 (ref) ]]
		if v18.GetGameState("Lassoing") then
			v25:Disable()
		else
			v25:Enable()
		end
	end)
	v17.RegisterAfterOpenHUD(refreshMobileJoystickAfterHUDRestored)
	if v38.IsMainWorld() then
		v24.GetOrCreateZone({
			Type = "Town",
			OnEntered = function() --[[ OnEntered | Line: 4187 | Upvalues: t10 (ref), v1 (ref) ]]
				for v12, v2 in t10 do
					local isNotName = v2.Name ~= "Build"
					v2.Interactable = isNotName
					v2.Visible = isNotName
					v2:SetAttribute("IsActive", isNotName)
					if isNotName == true then
						v1.target(v2.UIScale, 0.8, 6, {
							Scale = 1
						})
					end
				end
			end,
			OnLeave = function() --[[ OnLeave | Line: 4201 | Upvalues: t10 (ref), v1 (ref) ]]
				for v12, v2 in t10 do
					local isName = v2.Name == "Build"
					v2.Interactable = isName
					v2.Visible = isName
					v2:SetAttribute("IsActive", isName)
					if isName == false then
						v1.target(v2.UIScale, 0.8, 6, {
							Scale = 0
						})
					end
				end
			end
		})
	else
		for v12, v2 in t10 do
			if v2.Name ~= "MapVote" then
				local isNotName = v2.Name ~= "Build"
				v2.Interactable = isNotName
				v2:SetAttribute("IsActive", isNotName)
			end
		end
	end
	if v38.IsCompHub() then
		v24.GetOrCreateZone({
			Type = "CompHubMainCenterBuilding"
		})
	end
	if v38.IsCompHub() then
		v60.GameStateChangedSignal:Connect(function() --[[ Line: 4232 | Upvalues: v18 (ref), v38 (ref), t10 (ref), v24 (ref) ]]
			local v1 = v18.GetGameState("MapVoting")
			local v2 = v38.IsCompHub()
			for v4, v5 in t10 do
				local v3
				if v5.Name ~= "MapVote" then
					if v1 then
						v5:SetAttribute("IsActive", false)
						continue
					end
					v3 = if v24.IsInZone("Town") then if v5.Name == "Build" then false else true elseif v5.Name == "Build" then true else false
					if v2 and v5.Name == "Build" then
						v3 = false
					end
					v5:SetAttribute("IsActive", v3)
				end
			end
		end)
	end
	for v3, v4 in v60.HotbarInventoryCategories do
		for k, v in pairs(v28.GetType(v4)) do
			table.insert(t2, k)
		end
	end
end
t:Init()
return t