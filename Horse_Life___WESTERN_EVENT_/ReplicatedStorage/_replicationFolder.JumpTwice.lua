-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("DisplayItemClient")
local v4 = Sonar("GuiManager")
local v5 = Sonar("GuiUtils")
local v6 = Sonar("HotbarService")
local v7 = Sonar("Jump")
local v8 = Sonar("Maid")
local v9 = Sonar("MobAnimator")
local v10 = Sonar("MobSpawner")
local v11 = Sonar("PlayerWrapper")
local v12 = Sonar("Signal")
local v13 = Sonar("State")
local v14 = Sonar("TapToContinue")
local v15 = Sonar("TutorialService")
Sonar("PlaceTypeService")
local v16 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t2 = {
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Jump over the Logs!"
	},
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Let\'s tame your first Horse!",
		Response = "Let\'s go!"
	},
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Follow the path to your Horse!"
	}
}
local Tutorial = ReplicatedStorage:WaitForChild("Storage").Assets.Tutorial
local v17 = v11.GetClient()
local Container = Players.LocalPlayer.PlayerGui:WaitForChild("NewTutorialGui").Container.Container
local DialogBox = Container.DialogBox
local Instruction = DialogBox.Instruction
function t.Run(p1) --[[ Run | Line: 68 | Upvalues: v17 (copy), v5 (copy), v4 (copy), v8 (copy), v12 (copy), v13 (copy), CollectionService (copy), Instruction (copy), t2 (copy), Container (copy), DialogBox (copy), TweenService (copy), v16 (copy), v10 (copy), Tutorial (copy), v15 (copy), v9 (copy), v2 (copy), v6 (copy), v7 (copy), v1 (copy), v3 (copy), v14 (copy) ]]
	local v18 = v17.PlayerCohorts.TrimmedTutorial:get()
	print(v18)
	if v17.SkipTutorial then
		return
	end
	v5.SetGameElements({
		BottomFrame = true,
		Currency = false,
		Inventory = false,
		ItemStream = false,
		Map = false,
		Menu = false,
		Promo = false,
		Quests = false,
		SideFrame = false,
		Stables = false
	})
	v4.OpenHUD()
	local v22 = v8.new()
	local v32 = v22:GiveTask(v12.new())
	local v42 = v22:GiveTask(v13.new(0))
	local v52 = v22:GiveTask(v13.new(#CollectionService:GetTagged("TutorialLog")))
	local v62 = v22:GiveTask(v13.new(1))
	local Text = Instruction.Text
	Instruction.Visible = false
	v17.JumpTwice = true
	v22:GiveTask(v62:subscribe(function(p1) --[[ Line: 101 | Upvalues: t2 (ref), Container (ref), DialogBox (ref), Instruction (ref), Text (copy), v22 (copy), TweenService (ref), v16 (ref), v10 (ref), Tutorial (ref), v15 (ref), v17 (ref), v9 (ref), v2 (ref), v6 (ref) ]]
		local v1 = t2[p1]
		if not v1 then
			return
		end
		local xAxis = Vector2.xAxis
		local v4 = UDim2.fromScale(0.006, 0.006)
		Container.AnchorPoint = xAxis
		Container.Position = v4
		Container.ImageLabel.Image = v1.Image
		DialogBox.Description.Text = v1.Dialog
		if v1.Response then
			Instruction.Text = v1.Response
		else
			Instruction.Text = Text
		end
		v22._tween = if v22._tween then v22._tween:Pause() else nil
		v22._tween = TweenService:Create(Container, v16, {
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromScale(0.006, 0.006)
		})
		if p1 == 3 then
			local v7 = v10.new(Tutorial.HorseSpawn, {
				MobType = "Horse"
			}):SpawnMob({
				DoNotRespawn = true,
				SpeedMultiplier = 0.3,
				NoiseMultiplier = 0.8,
				TamingMaxPoints = 3,
				SlotInfo = v15.GetHorseSlotInfoForTame(v17, 1)
			})
			v17.TutorialHorse = v7
			local v8 = v9.getMobFromModel(v7.Model)
			local v92 = v8.CosmeticModel.PrimaryPart or v8.CosmeticModel:FindFirstChildOfClass("BasePart")
			if v92 then
				local v102 = v2.FromPlayer(v92)
				v22:GiveTask(function() --[[ Line: 143 | Upvalues: v102 (copy), v2 (ref) ]]
					if not v102 then
						return
					end
					v2.Destroy(v102)
				end)
			end
			local v11 = false
			for v12, v13 in v17.HotbarData:GetChildren() do
				if v13.Value == "WovenLasso" then
					v11 = true
					break
				end
			end
			if not v11 then
				v6:SetHotbarSlot("1", "WovenLasso")
			end
		end
		if not v22._tween then
			return
		end
		v22._tween:Play()
		v22._tween.Completed:Wait()
	end))
	v62:set(1)
	local v72 = CollectionService:GetTagged("TutorialLog")
	table.sort(v72, function(p1, p2) --[[ Line: 175 ]]
		return p1:GetPivot().Position.Z < p2:GetPivot().Position.Z
	end)
	local t = {}
	local v82 = nil
	local function hasLogBeenJumped(p1) --[[ hasLogBeenJumped | Line: 185 | Upvalues: t (copy) ]]
		return t[p1] == true
	end
	local function getLogPart(p1) --[[ getLogPart | Line: 190 ]]
		if p1:IsA("BasePart") then
			return p1
		end
		if not p1:IsA("Model") then
			return nil
		end
		return p1.PrimaryPart or p1:FindFirstChildOfClass("BasePart")
	end
	local function updateBeamToNextLog() --[[ updateBeamToNextLog | Line: 200 | Upvalues: v82 (ref), v2 (ref), v72 (copy), t (copy) ]]
		if v82 then
			v2.Destroy(v82)
			v82 = nil
		end
		for i, v in ipairs(v72) do
			if v and v.Parent and t[v] ~= true then
				local v22 = if v:IsA("BasePart") then v elseif v:IsA("Model") then v.PrimaryPart or v:FindFirstChildOfClass("BasePart") else nil
				if v22 then
					v82 = v2.FromPlayer(v22)
					return
				end
			end
		end
	end
	updateBeamToNextLog()
	v22:GiveTask(function() --[[ Line: 223 | Upvalues: v82 (ref), v2 (ref) ]]
		if not v82 then
			return
		end
		v2.Destroy(v82)
		v82 = nil
	end)
	v22:GiveTask(v7.JumpCompletedSignal:Connect(function(p1) --[[ Line: 230 | Upvalues: t (copy), v42 (copy), v52 (copy), updateBeamToNextLog (copy) ]]
		local Highlight = p1:FindFirstChildOfClass("Highlight")
		if Highlight then
			t[p1] = true
			Highlight:Destroy()
			v42:set(v42:get() + 1)
			v52:set(v52:get() - 1)
			updateBeamToNextLog()
		end
	end))
	v52:subscribe(function(p1) --[[ Line: 249 | Upvalues: v82 (ref), v2 (ref), v62 (copy), v22 (copy), v1 (ref), v32 (copy) ]]
		if p1 > 0 then
			return
		end
		if not v82 then
			v62:set(2)
			v22:GiveTask(task.delay(1, function() --[[ Line: 263 | Upvalues: v1 (ref) ]]
				local v12 = select(-1, next(v1.GetAllAnimals()))
				if not v12 then
					return
				end
				v12:SetMoveState("Idle")
			end))
			v32:Fire()
			return
		end
		v2.Destroy(v82)
		v82 = nil
		v62:set(2)
		v22:GiveTask(task.delay(1, function() --[[ Line: 263 | Upvalues: v1 (ref) ]]
			local v12 = select(-1, next(v1.GetAllAnimals()))
			if not v12 then
				return
			end
			v12:SetMoveState("Idle")
		end))
		v32:Fire()
	end)
	v32:Wait()
	v17.JumpTwice = nil
	if not v18 then
		v3:DisplayItem({
			Amount = 10,
			Description = "You received 10 Woven Lassos!",
			DoAnimatedIntro = false,
			ItemName = "WovenLasso"
		})
		v3.YieldForNoDisplay()
		v22:GiveTask(v14.Once(function() --[[ Line: 285 | Upvalues: v32 (copy) ]]
			v32:Fire()
		end))
	end
	Instruction.Visible = true
	if not v18 then
		v32:Wait()
	end
	v17.VisitTheHelpBoard = nil
	v62:set(3)
	v22:DoCleaning()
end
return t