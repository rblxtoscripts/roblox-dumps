-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("TutorialService")
local v3 = Sonar("GuiManager")
local v4 = Sonar("ContextualUtils")
local v5 = Sonar("BreedingGui")
local v6 = Sonar("DisplayAnimalClient")
local v7 = Sonar("StablesGui")
local v8 = Sonar("AnimalDataService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v9 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local v10 = v1.new()
local function yieldForStablesGridButton(p1) --[[ yieldForStablesGridButton | Line: 28 | Upvalues: RunService (copy), PlayerGui (copy) ]]
	local v1
	repeat
		RunService.Heartbeat:Wait()
		v1 = PlayerGui.StablesGui.ContainerFrame.Menu.Content.Horses:FindFirstChild(p1, true)
	until v1
	return v1
end
local function yieldForStablesSpeciesGridButton(p1) --[[ yieldForStablesSpeciesGridButton | Line: 37 | Upvalues: RunService (copy), v9 (copy), PlayerGui (copy) ]]
	local v1 = nil
	repeat
		RunService.Heartbeat:Wait()
		local v2 = nil
		for v3, v4 in v9.PlayerData.Animals:GetChildren() do
			if v4.Species.Value == p1 then
				v2 = v4
			end
		end
		if v2 then
			v1 = PlayerGui.StablesGui.ContainerFrame.Menu.Content.Horses:FindFirstChild(v2.Name, true)
		end
	until v1
	return v1
end
local function yieldForBreedingGridButton(p1, p2) --[[ yieldForBreedingGridButton | Line: 53 | Upvalues: v9 (copy), v8 (copy), PlayerGui (copy), RunService (copy) ]]
	local v1 = nil
	repeat
		for v2, v3 in { "Male", "Female" } do
			if v3 == p2 then
				local v4 = nil
				for v5, v6 in v9.PlayerData.Animals:GetChildren() do
					if v6.Species.Value == p1 and v8.GetGender(v6) == v3 then
						v4 = v6
					end
				end
				if v4 then
					local v7 = PlayerGui.BreedingGui.ContainerFrame.Menu.TabFrames.Breeding.Content[p2].Horses.Content:FindFirstChild(v4.Name)
					v1 = v7
					if v7 then
						break
					end
				end
			end
		end
		RunService.Heartbeat:Wait()
	until v1
	return v1
end
local function yieldForHorseWithChild() --[[ yieldForHorseWithChild | Line: 74 | Upvalues: v2 (copy), v9 (copy), RunService (copy) ]]
	local v1 = nil
	while not v1 do
		local v22 = v2.GetHorseWithChild(v9)
		RunService.Heartbeat:Wait()
		v1 = v22
	end
	return v1
end
local function yieldForDisplayThenNoDisplay() --[[ yieldForDisplayThenNoDisplay | Line: 83 | Upvalues: RunService (copy), v6 (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until v6.GetDisplay()
	return v6.YieldForNoDisplay()
end
function t.Start(p1) --[[ Start | Line: 91 | Upvalues: t (copy), v4 (copy), PlayerGui (copy), v9 (copy), RunService (copy), v3 (copy), v2 (copy), yieldForStablesSpeciesGridButton (copy), v7 (copy), yieldForBreedingGridButton (copy), v5 (copy), yieldForHorseWithChild (copy), v6 (copy), yieldForStablesGridButton (copy), yieldForDisplayThenNoDisplay (copy), v10 (copy) ]]
	if p1.PreviousStage then
		p1.PreviousStage()
	else
		t.YieldForClientLoaded()
		task.spawn(t.YieldForHorseAndMount, {
			MoveToStart = true
		})
	end
	if p1.AfterInit then
		p1.AfterInit()
	end
	task.spawn(t.TweenInText, "Open your <font color=\'rgb(51, 255, 146)\'>stables</font> to view your horses!")
	t.InitHUDandControls({
		SideFrame = true,
		Stables = true,
		BreedAction = true,
		PredictFoalAction = false,
		KeepFrameOpenOnBreed = false
	})
	t.SetProgressStep(1)
	local t2 = {}
	t2[#t2 + 1] = v4.SetGuiPointTo({
		Direction = "Up",
		Offset = -3,
		GuiElement = PlayerGui.HUDGui.MobileRightFrame.Core.Buttons.Stables,
		NextElement = PlayerGui.StablesGui.ContainerFrame
	})
	for v1, v22 in PlayerGui.HUDGui.RightFrame:GetChildren() do
		local Stables = v22:FindFirstChild("Stables", true)
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Right",
			Offset = -3,
			GuiElement = Stables,
			NextElement = PlayerGui.StablesGui.ContainerFrame
		})
	end
	v9.Character.Humanoid:UnequipTools()
	repeat
		RunService.Heartbeat:Wait()
	until v3.IsFrameOpen(PlayerGui.StablesGui.ContainerFrame)
	v2.PostTutorialStage("StablesGuiOpened")
	local v32 = v2.GetHorseOfAge(v9, "Baby")
	local v42 = v2.GetHorseWithChild(v9)
	if v42 or v32 then
		for v52, v62 in t2 do
			v62()
		end
	else
		task.spawn(t.TweenInText, "<font color=\'rgb(208, 126, 255)\'>Breed</font> them together!")
		local v72 = yieldForStablesSpeciesGridButton("Horse")
		local Breed = PlayerGui.StablesGui.ContainerFrame:FindFirstChild("Breed", true)
		task.spawn(t.YieldForConditionThenPost, "StablesHorseSelected", function() --[[ Line: 155 | Upvalues: v7 (ref), v72 (copy) ]]
			local v1 = v7.GetSelectedSlot()
			return if v1 then v1.Name == v72.Name else v1
		end)
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v72,
			NextElement = Breed
		})
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Right",
			Offset = -3,
			GuiElement = Breed,
			NextElement = PlayerGui.BreedingGui.ContainerFrame
		})
		repeat
			RunService.Heartbeat:Wait()
		until v3.IsFrameOpen(PlayerGui.BreedingGui.ContainerFrame)
		v2.PostTutorialStage("BreedingGuiOpened")
		local v8 = yieldForBreedingGridButton("Horse", "Male")
		local v92 = yieldForBreedingGridButton("Horse", "Female")
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v8,
			NextElement = PlayerGui.BreedingGui.ContainerFrame.Menu:FindFirstChild("Center", true):FindFirstChild("Male", true).Content
		})
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v92,
			NextElement = PlayerGui.BreedingGui.ContainerFrame.Menu:FindFirstChild("Center", true):FindFirstChild("Female", true).Content
		})
		repeat
			RunService.Heartbeat:Wait()
			local v102 = v5.GetSelectedAnimals()
		until v102.Male or v102.Female
		v2.PostTutorialStage("BreedingHorsesSelected")
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Left",
			Offset = -3,
			GuiElement = PlayerGui.BreedingGui.ContainerFrame:FindFirstChild("BreedButton", true),
			NextElement = function() --[[ NextElement | Line: 202 | Upvalues: v5 (ref) ]]
				local v1 = v5.GetSelectedAnimals()
				return v1.Male and v1.Female
			end
		})
		v42 = yieldForHorseWithChild()
		v2.PostTutorialStage("BreedButtonPressed")
		for v11, v12 in t2 do
			v12()
		end
	end
	t.SetProgressStep(2)
	if not v32 then
		task.spawn(t.TweenInText, "<font color=\'rgb(255, 148, 230)\'>Claim</font> your new baby!")
		t2 = {}
		for v13, v14 in PlayerGui.HUDGui.RightFrame:GetChildren() do
			local Stables = v14:FindFirstChild("Stables", true)
			t2[#t2 + 1] = v4.SetGuiPointTo({
				Direction = "Right",
				Offset = -3,
				GuiElement = Stables,
				NextElement = PlayerGui.StablesGui.ContainerFrame
			})
		end
		function v7.OnBirthClaim(...) --[[ Line: 232 | Upvalues: v32 (ref), v9 (ref), v6 (ref) ]]
			for k, v in pairs(...) do
				v32 = v9:GetItemFolder("Animals"):WaitForChild(v)
				v6:DisplaySlot({
					Type = "TutorialBirth",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = true,
					FullViewportSize = true,
					HideTopFrame = true,
					DismissDelay = 1.5,
					Slot = v32
				})
				if v6.YieldForNoDisplay() then
					task.wait(0.5)
				end
			end
		end
		local v15 = yieldForStablesGridButton(v42.Name)
		local Birth = PlayerGui.StablesGui.ContainerFrame:FindFirstChild("Birth", true)
		task.spawn(t.YieldForConditionThenPost, "PregnantHorseSelected", function() --[[ Line: 253 | Upvalues: v7 (ref), v42 (ref) ]]
			return v7.GetSelectedSlot() == v42
		end)
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v15,
			NextElement = Birth
		})
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Down",
			Offset = -3,
			GuiElement = Birth
		})
		repeat
			RunService.Heartbeat:Wait()
		until v32
		v2.PostTutorialStage("ClaimChildButtonPressed")
		t.SetProgressStep(3)
		v7.OnBirthClaim = nil
		task.spawn(t.TweenOutDialogue)
		for v16, v17 in t2 do
			v17()
		end
		yieldForDisplayThenNoDisplay()
		v2.PostTutorialStage("ClosedClaimedChildGui")
	end
	if not v32.Equipped.Value then
		task.spawn(t.TweenInText, "<font color=\'rgb(127, 255, 98)\'>Equip</font> your baby for it to <font color=\'rgb(255, 218, 69)\'>grow</font>!")
		local v18 = yieldForStablesGridButton(v32.Name)
		task.spawn(t.YieldForConditionThenPost, "BabyHorseSelected", function() --[[ Line: 285 | Upvalues: v7 (ref), v32 (ref) ]]
			return v7.GetSelectedSlot() == v32
		end)
		v2.SetGameElements({
			BreedAction = false,
			EquipAction = false
		})
		local v19 = nil
		v10:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 293 | Upvalues: v7 (ref), v19 (ref), v2 (ref), v32 (ref) ]]
			local v1 = v7.GetSelectedSlot()
			local v22 = v1 ~= v19
			v19 = v1
			if not v22 then
				return
			end
			local t = {}
			t.EquipAction = v1 == v32
			v2.SetGameElements(t)
		end))
		local Equip = PlayerGui.StablesGui.ContainerFrame:FindFirstChild("Equip", true)
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Left",
			Offset = -4,
			GuiElement = v18,
			NextElement = function() --[[ NextElement | Line: 308 | Upvalues: v7 (ref), v32 (ref) ]]
				local v1 = v7.GetSelectedSlot()
				if not v1 then
					return true
				end
				return v1 ~= v32
			end
		})
		t2[#t2 + 1] = v4.SetGuiPointTo({
			Direction = "Down",
			Offset = -3,
			GuiElement = Equip,
			NextElement = function() --[[ NextElement | Line: 318 | Upvalues: v7 (ref), v32 (ref) ]]
				local v1 = v7.GetSelectedSlot()
				if not v1 then
					return
				end
				return v1 == v32
			end
		})
		v7.ReOpen(v32)
		t.YieldForHorse({
			SlotId = v32.Name
		})
		t.SetProgressStep(4)
		v2.PostTutorialStage("EquipButtonPressed")
		t.StartSequence("TutorialMissions", {
			PreviousStage = function() --[[ PreviousStage | Line: 335 | Upvalues: v10 (ref), v3 (ref), t2 (ref), t (ref) ]]
				v10:DoCleaning()
				v3.OpenHUD()
				for v1, v2 in t2 do
					v2()
				end
				t.SetTutorialStageRemote:InvokeServer("TutorialMissions")
			end
		})
	end
end
return t