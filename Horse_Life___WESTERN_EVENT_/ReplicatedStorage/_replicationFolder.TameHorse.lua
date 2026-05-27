-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiManager")
local v3 = Sonar("ContextualUtils")
local v4 = Sonar("GuiUtils")
local v5 = Sonar("MobSpawner")
local v6 = Sonar("MobAnimator")
local v7 = Sonar("Lasso")
local v8 = Sonar("TutorialService")
local v9 = Sonar("DisplayAnimalClient")
local v10 = Sonar("InputTypeDetector")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v11 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local v12 = v1.new()
local Tutorial = ReplicatedStorage.Storage.Assets.Tutorial
local Highlight = Tutorial.Highlight
local function getClosestHorse() --[[ getClosestHorse | Line: 32 | Upvalues: v6 (copy), v11 (copy) ]]
	local v1 = 9000000000
	local v2 = nil
	for k, v in pairs(v6.GetAll()) do
		if v.Model:GetAttribute("Local") and (v.Destroy and not v.GivenRewards) then
			local Magnitude = (v11.PrimaryPart.Position - v.CosmeticModel.PrimaryPart.Position).Magnitude
			if Magnitude < v1 then
				v1 = Magnitude
				v2 = v
			end
		end
	end
	return v2
end
local function isInLassoRange(p1) --[[ isInLassoRange | Line: 50 | Upvalues: v11 (copy) ]]
	if not v11.EquippedTool then
		return
	end
	if not (p1 and (p1.CosmeticModel and p1.CosmeticModel.PrimaryPart)) then
		return
	end
	return v11.EquippedTool.ToolClass.LassoHitRange + 15 >= (v11.PrimaryPart.Position - p1.CosmeticModel.PrimaryPart.Position).Magnitude
end
function t.Start(p1) --[[ Start | Line: 57 | Upvalues: v11 (copy), t (copy), v4 (copy), v2 (copy), v3 (copy), v8 (copy), LocalPlayer (copy), PlayerGui (copy), v5 (copy), Tutorial (copy), v12 (copy), RunService (copy), v7 (copy), getClosestHorse (copy), Highlight (copy), v10 (copy), ReplicatedStorage (copy), v9 (copy) ]]
	local Player = v11.Player
	local v1 = nil
	if p1.PreviousStage then
		v1 = p1.PreviousStage()
	else
		t.YieldForClientLoaded()
	end
	t.InitHUDandControls()
	if p1.AfterInit then
		p1.AfterInit()
	end
	local v32 = t.YieldForHorse()
	v32:_sit()
	local v42 = Player:GetAttribute("TutorialEnabled")
	if v42 then
		task.spawn(v4.SetChatVisibility, false)
	else
		v2.CloseHUD()
		task.spawn(v4.SetChatVisibility, true)
	end
	if v42 and not p1.PreviousStage then
		t.TeleportToStart()
	end
	local OptionButton = v32.InteractMenu.Options[1].OptionButton
	local v52 = v3.SetGuiPointTo({
		Direction = "Down",
		Offset = -3,
		GuiElement = v32.InteractMenu.InteractButton,
		NextElement = OptionButton
	})
	local v6 = v3.SetGuiPointTo({
		Direction = "Down",
		Offset = -3,
		GuiElement = OptionButton
	})
	t.ZoomOutCameraOnHorse()
	t.YieldForCurrentHorse(v32)
	v8.PostTutorialStage("GotOnHorse")
	if v42 then
		t.SetProgressStep(0)
		v8.SetGameElements({
			BottomFrame = true
		}, true)
	end
	t.YieldForTweenCompleted()
	if v1 == "__SKIP__" and v42 == false then
		v52()
		v6()
		t.EndPrimaryTutorial(true)
		return
	end
	v52()
	v6()
	task.spawn(t.TweenInText, "Equip your lasso!")
	local v82 = nil or LocalPlayer.Backpack:FindFirstChild("WovenLasso") or LocalPlayer.Backpack:FindFirstChild("StringLasso")
	if v82 then
		LocalPlayer.Character.Humanoid:EquipTool(v82)
	end
	local t2 = {}
	for v92, v102 in PlayerGui.HUDGui.BottomFrame:GetChildren() do
		local Slot1 = v102:FindFirstChild("Slot1", true)
		if Slot1 then
			t2[#t2 + 1] = v3.SetGuiPointTo({
				Direction = "Down",
				Offset = -3,
				GuiElement = Slot1
			})
		end
	end
	t.YieldForEquippedTool("WovenLasso")
	v8.PostTutorialStage("EquippedLasso")
	for v112, v122 in t2 do
		v122()
	end
	task.spawn(t.TweenInText, "Get in <font color=\'rgb(80, 214, 255)\'>range</font> of the horse!")
	local v13 = v5.new(Tutorial.HorseSpawn, {
		MobType = "Horse"
	})
	local v14 = false
	local t3 = {}
	for i = 1, 1 do
		t3[i] = v13:SpawnMob({
			DoNotRespawn = true,
			SpeedMultiplier = 0,
			NoiseMultiplier = 0.8,
			TamingMaxPoints = 3,
			SlotInfo = v8.GetHorseSlotInfoForTame(v11, i),
			OnTameCompleted = function() --[[ OnTameCompleted | Line: 190 | Upvalues: v14 (ref), i (copy) ]]
				v14 = i
			end
		})
	end
	local v15 = nil
	local v16 = nil
	local v17 = false
	v12:GiveTask(v3.ClearBeams)
	v12:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 201 | Upvalues: v16 (ref), v7 (ref), getClosestHorse (ref), v15 (ref), v3 (ref), LocalPlayer (ref), Highlight (ref), v11 (ref), t (ref), v17 (ref) ]]
		v16 = v7.GetTarget() or getClosestHorse()
		if not v16 then
			return
		end
		v15 = v15 or v3.FromPlayer(LocalPlayer, workspace.Terrain, {
			CenterOfPart = true
		})
		v15.Beam1.Enabled = true
		Highlight.Adornee = v16.CosmeticModel
		v3.UpdatePosition(v15, workspace.Terrain, {
			CenterOfPart = true,
			WorldPosition = v16.PrimaryPart.Position
		})
		local v32 = v16
		local v4 = if v11.EquippedTool and (v32 and (v32.CosmeticModel and v32.CosmeticModel.PrimaryPart)) then v11.EquippedTool.ToolClass.LassoHitRange + 15 >= (v11.PrimaryPart.Position - v32.CosmeticModel.PrimaryPart.Position).Magnitude else nil
		if not (v4 or v7.GetTarget()) or t.IsTweeningIn() then
			return
		end
		v17 = true
	end))
	task.spawn(function() --[[ Line: 223 | Upvalues: v3 (ref), v16 (ref), v11 (ref), RunService (ref), v7 (ref) ]]
		local v1 = v3.SetWorldspaceClickPointTo({
			ShowPrompt = true,
			Adornee = function() --[[ Adornee | Line: 225 | Upvalues: v16 (ref) ]]
				return v16 and v16.CosmeticModel
			end,
			CheckVisibility = function() --[[ CheckVisibility | Line: 228 | Upvalues: v16 (ref), v11 (ref) ]]
				local v1 = v16
				if v1 then
					local v2 = v16
					if not v11.EquippedTool then
						return nil
					end
					if not (v2 and (v2.CosmeticModel and v2.CosmeticModel.PrimaryPart)) then
						return nil
					end
					v1 = v11.EquippedTool.ToolClass.LassoHitRange + 15 >= (v11.PrimaryPart.Position - v2.CosmeticModel.PrimaryPart.Position).Magnitude
				end
				return v1
			end
		})
		repeat
			RunService.Heartbeat:Wait()
		until v7.GetTarget()
		v1()
	end)
	repeat
		RunService.Heartbeat:Wait()
	until v17
	v8.PostTutorialStage("InRangeOfHorse")
	local v18 = if v10.IsMobileInputType() then "Tap" else "Click"
	if v7.GetTarget() then
		task.spawn(t.TweenInText, string.format("<font color=\'rgb(80, 214, 255)\'>%s</font> on it to finish taming!", v18))
	else
		task.spawn(t.TweenInText, string.format("<font color=\'rgb(80, 214, 255)\'>%s</font> on it to start taming!", v18))
	end
	task.spawn(function() --[[ Line: 251 | Upvalues: v7 (ref), RunService (ref), v8 (ref) ]]
		if not v7.GetTarget() then
			repeat
				RunService.Heartbeat:Wait()
			until v7.GetTarget()
		end
		v8.PostTutorialStage("StartedTaming")
	end)
	repeat
		RunService.Heartbeat:Wait()
	until v14
	t.SetProgressStep(1)
	v8.PostTutorialStage("FinishedTaming")
	t.StartSequence("BreedingHorse", {
		PreviousStage = function() --[[ PreviousStage | Line: 265 | Upvalues: t (ref), v12 (ref), t3 (ref), v14 (ref), ReplicatedStorage (ref), v9 (ref), v11 (ref), v8 (ref) ]]
			task.spawn(t.TweenOutDialogue)
			v12:DoCleaning()
			v12:GiveTask(function() --[[ Line: 268 | Upvalues: t3 (ref) ]]
				if not t3 then
					return
				end
				for k, v in pairs(t3) do
					if v and (v.Destroy and not v.GivenRewards) then
						v:Destroy()
					end
				end
				t3 = nil
			end)
			local v1 = t.SetTutorialStageRemote:InvokeServer("BreedingHorse", v14)
			ReplicatedStorage.Storage.SFX.QuestComplete1:Play()
			ReplicatedStorage.Storage.SFX.QuestComplete2:Play()
			v9:DisplaySlot({
				Type = "TutorialTamed",
				AllowNaming = true,
				ShowMaxWarning = true,
				MobileClickBackgroundToClose = true,
				ShowTameContestPoints = false,
				FullViewportSize = true,
				HideTopFrame = true,
				DismissDelay = 1.5,
				Slot = v11:GetItemFolder("Animals"):WaitForChild(v1)
			})
			v9.YieldForNoDisplay()
			v8.PostTutorialStage("ClosedTamedHorseGui")
		end
	})
end
return t