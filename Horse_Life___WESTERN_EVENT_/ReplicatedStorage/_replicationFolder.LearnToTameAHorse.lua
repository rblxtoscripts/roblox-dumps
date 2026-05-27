-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("DisplayAnimalClient")
local v4 = Sonar("GuiUtils")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("Lasso")
local v7 = Sonar("Maid")
local v8 = Sonar("MobAnimator")
local v9 = Sonar("PlayerWrapper")
local v10 = Sonar("RemoteUtils")
local v11 = Sonar("State")
Sonar("PlaceTypeService")
local v12 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true)
local v13 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t2 = {
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Use your Lasso on the Horse!"
	},
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Nice! You tamed your first Horse!"
	}
}
local v14 = v9.GetClient()
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Character = LocalPlayer.Character
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local Container = PlayerGui:WaitForChild("NewTutorialGui").Container
local Container_2 = Container.Container
local DialogBox = Container_2.DialogBox
local Instruction = DialogBox.Instruction
local Tutorial = ReplicatedStorage:WaitForChild("Storage").Assets.Tutorial
local v15 = v11.new(1)
local function equipLassoFromHotbar(p1) --[[ equipLassoFromHotbar | Line: 66 | Upvalues: v14 (copy), LocalPlayer (copy), v10 (copy) ]]
	if not p1 then
		return
	end
	local v1 = v14.HotbarData[tostring(p1)]
	local v2 = if v1 then v1.Value else v1
	if not v2 or #v2 <= 0 then
		return
	end
	local v3 = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local Humanoid = v3:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		return
	end
	local v4 = LocalPlayer.Backpack:FindFirstChild(v2) or v3:FindFirstChild(v2)
	if not v4 then
		v10.GetRemoteFunction("RefreshBackpackRemote"):InvokeServer()
		v4 = LocalPlayer.Backpack:WaitForChild(v2, 3)
	end
	if not v4 or v4.Parent ~= LocalPlayer.Backpack then
		return
	end
	Humanoid:EquipTool(v4)
end
local function getClosestHorse(p1) --[[ getClosestHorse | Line: 92 | Upvalues: v8 (copy), v14 (copy) ]]
	local v1 = (1 / 0)
	local v2 = nil
	for k, v in pairs(v8.GetAll()) do
		if v.Model:GetAttribute("Local") and (v.Destroy and not v.GivenRewards) then
			local Magnitude = (v14.PrimaryPart.Position - v.CosmeticModel.PrimaryPart.Position).Magnitude
			if Magnitude < v1 then
				v1 = Magnitude
				v2 = v
			end
		end
	end
	return v2
end
local function isInLassoRange(p1) --[[ isInLassoRange | Line: 112 | Upvalues: v14 (copy) ]]
	if not v14.EquippedTool then
		return false
	end
	if not (p1 and (p1.CosmeticModel and p1.CosmeticModel.PrimaryPart)) then
		return false
	end
	return v14.EquippedTool.ToolClass.LassoHitRange + 15 >= (v14.PrimaryPart.Position - p1.CosmeticModel.PrimaryPart.Position).Magnitude
end
function t.Run(p1) --[[ Run | Line: 120 | Upvalues: v14 (copy), v4 (copy), v7 (copy), Instruction (copy), v15 (copy), t2 (copy), Container_2 (copy), DialogBox (copy), TweenService (copy), v13 (copy), v1 (copy), Character (copy), v8 (copy), Tutorial (copy), v12 (copy), v2 (copy), RunService (copy), v5 (copy), equipLassoFromHotbar (copy), HUDGui (copy), Container (copy), v6 (copy), getClosestHorse (copy), v10 (copy), v3 (copy) ]]
	local v16 = v14.PlayerCohorts.TrimmedTutorial:get()
	if v14.SkipTutorial then
		return
	end
	v4.SetGameElements({
		Currency = false,
		Inventory = false,
		ItemStream = false,
		Map = false,
		Menu = false,
		Promo = false,
		Quests = false,
		SideFrame = false,
		Stables = false
	}, true)
	local v22 = v7.new()
	local v32 = v22:GiveTask(v7.new())
	local v42 = false
	local v52 = nil
	local tbl = {}
	Instruction.Visible = false
	v32:GiveTask(v15:subscribe(function(p1) --[[ Line: 150 | Upvalues: t2 (ref), Container_2 (ref), DialogBox (ref), v22 (copy), TweenService (ref), v13 (ref) ]]
		local v1 = t2[p1]
		if not v1 then
			return
		end
		local xAxis = Vector2.xAxis
		local v4 = UDim2.fromScale(0.006, 0.006)
		Container_2.AnchorPoint = xAxis
		Container_2.Position = v4
		Container_2.ImageLabel.Image = v1.Image
		DialogBox.Description.Text = v1.Dialog
		v22._tween = if v22._tween then v22._tween:Pause() else nil
		v22._tween = TweenService:Create(Container_2, v13, {
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromScale(0.006, 0.006)
		})
		v22._tween:Play()
		v22._tween.Completed:Wait()
	end))
	v15:set(1)
	Instruction.Visible = true
	v14.LearnToTameAHorse = true
	local v62 = select(-1, next(v1.GetAllAnimals()))
	if v62 then
		v62:_sit()
		repeat
			task.wait()
		until Character.Humanoid.SeatPart:IsDescendantOf(v62.Model)
	end
	local TutorialHorse = v14.TutorialHorse
	v14.TutorialHorse = nil
	function TutorialHorse.OnTameCompleted() --[[ Line: 185 | Upvalues: v42 (ref), v52 (ref) ]]
		v42 = true
		v52 = 1
	end
	tbl[1] = TutorialHorse
	local v72 = v8.getMobFromModel(TutorialHorse.Model)
	local v82 = Tutorial.Highlight:Clone()
	v82.Parent = v72.CosmeticModel
	v22:GiveTask(TweenService:Create(v82, v12, {
		FillTransparency = 1,
		OutlineTransparency = 1
	})):Play()
	v72.Maid:GiveTask(v82)
	v15:set(1)
	Instruction.Visible = true
	local v9 = nil
	local function updateBeamToHorse() --[[ updateBeamToHorse | Line: 207 | Upvalues: v72 (copy), v42 (ref), v9 (ref), v2 (ref) ]]
		if v72 and (v72.CosmeticModel and not v42) then
			local v1 = v72.CosmeticModel.PrimaryPart or v72.CosmeticModel:FindFirstChildOfClass("BasePart")
			if not v1 then
				return
			end
			if v9 then
				v2.UpdatePosition(v9, v1)
			else
				v9 = v2.FromPlayer(v1)
			end
			return
		end
		if not v9 then
			return
		end
		v2.Destroy(v9)
		v9 = nil
	end
	v22:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 226 | Upvalues: v42 (ref), updateBeamToHorse (copy) ]]
		if v42 then
			return
		end
		updateBeamToHorse()
	end))
	v22:GiveTask(function() --[[ Line: 233 | Upvalues: v9 (ref), v2 (ref) ]]
		if not v9 then
			return
		end
		v2.Destroy(v9)
		v9 = nil
	end)
	local v102 = nil
	for i = 1, 50 do
		for j = 1, 6 do
			local v11 = v14.HotbarData[tostring(j)]
			local v122 = if v11 then if #v11.Value > 0 then v5.GetByName(v11.Value) else false else v11
			if v122 and v122.ToolType == "Lasso" then
				v102 = j
				break
			end
		end
		if v102 then
			break
		end
		task.wait(0.1)
	end
	local function isLassoEquippedOrTamed() --[[ isLassoEquippedOrTamed | Line: 262 | Upvalues: v42 (ref), v14 (ref) ]]
		if v42 then
			return false
		end
		local EquippedTool = v14.EquippedTool
		local v1 = if EquippedTool then EquippedTool.ToolData else EquippedTool
		return (not v1 or v1.ToolType ~= "Lasso") and true or false
	end
	if v16 then
		equipLassoFromHotbar(v102)
	elseif v102 then
		for v132, v142 in HUDGui.BottomFrame:GetChildren() do
			local Bottom = v142:FindFirstChild("Bottom")
			local v152 = if Bottom then Bottom:FindFirstChild("Slot" .. v102) else Bottom
			if v152 then
				v22:GiveTask(v2.SetGuiPointTo({
					Direction = "Down",
					Offset = -3,
					GuiElement = v152,
					NextElement = isLassoEquippedOrTamed
				}))
			end
		end
		local v162 = HUDGui.Hotbar:FindFirstChild((tostring(v102)))
		if v162 then
			v22:GiveTask(v2.SetGuiPointTo({
				Direction = "Down",
				Offset = -3,
				GuiElement = v162,
				NextElement = isLassoEquippedOrTamed
			}))
		end
	end
	Container.Interactable = false
	Instruction.Visible = false
	local v17 = false
	v22:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 316 | Upvalues: v6 (ref), getClosestHorse (ref), tbl (copy), v82 (ref), v14 (ref), v17 (ref) ]]
		local v1 = v6.GetTarget() or getClosestHorse(tbl)
		if not v1 then
			return
		end
		if v82 and v82.Parent ~= v1.CosmeticModel then
			v82.Parent = v1.CosmeticModel
		end
		local v2 = if v14.EquippedTool and (v1 and (v1.CosmeticModel and v1.CosmeticModel.PrimaryPart)) then v14.EquippedTool.ToolClass.LassoHitRange + 15 >= (v14.PrimaryPart.Position - v1.CosmeticModel.PrimaryPart.Position).Magnitude else false
		if not (v2 or v6.GetTarget()) or v17 then
			return
		end
		v17 = true
	end))
	repeat
		task.wait()
	until v42
	if v9 then
		v2.Destroy(v9)
		v9 = nil
	end
	local v18
	if v52 then
		local v19 = v10.GetRemoteFunction("TameTutorialHorseRemote"):InvokeServer(v52)
		v18 = v14:GetItemFolder("Animals"):FindFirstChild(v19)
	else
		v18 = nil
	end
	for k, v in pairs(tbl) do
		if v and (v.Destroy and not v.GivenRewards) then
			v:Destroy()
		end
	end
	v15:set(2)
	if v18 then
		v3:DisplaySlot({
			AllowNaming = true,
			Description = "Awesome!",
			DoAnimatedIntro = false,
			ForceAdult = true,
			Type = "TutorialTamed",
			Slot = v18
		})
		Container.Interactable = false
		Instruction.Visible = true
		v3.YieldForNoDisplay()
	end
	v14.LearnToTameAHorse = nil
	v32:DoCleaning()
	v22:DoCleaning()
	v62:SetMoveState("Idle")
end
return t