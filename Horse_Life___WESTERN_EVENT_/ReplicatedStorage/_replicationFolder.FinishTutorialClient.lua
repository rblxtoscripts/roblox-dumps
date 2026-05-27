-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DisplayAnimalClient")
local v2 = Sonar("GuiManager")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("Maid")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("State")
local v9 = Sonar("TapToContinue")
local v10 = Sonar("TutorialClient")
local v11 = Sonar("TutorialService")
local v12 = Sonar("PlaceTypeService")
local v13 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t2 = {
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "I\'ve trained this horse for you! It has wings and can fly, too!"
	}
}
local v14 = v5.GetClient()
local NewTutorial = v14.PlayerCohorts.NewTutorial
local v15 = v8.fromProperty(v14.PlayerData.NewTutorialComplete, "Value")
local Container = Players.LocalPlayer.PlayerGui:WaitForChild("NewTutorialGui").Container
local Container_2 = Container.Container
local DialogBox = Container_2.DialogBox
local Instruction = DialogBox.Instruction
local v16 = v6.GetRemoteEvent("NewTutorialRemote")
function t.StartFromJoin() --[[ StartFromJoin | Line: 56 | Upvalues: NewTutorial (copy), Container_2 (copy), v14 (copy), v11 (copy), v4 (copy), Instruction (copy), v16 (copy), v15 (copy), v12 (copy), v7 (copy), v2 (copy), Container (copy), t2 (copy), DialogBox (copy), TweenService (copy), v13 (copy), v9 (copy), v1 (copy), v10 (copy), v3 (copy) ]]
	if not NewTutorial:get() then
		Container_2.Visible = false
		return
	end
	if v14.PrimaryTutorialStageValue and v11.HasCompletedPrimaryTutorial(v14) then
		Container_2.Visible = false
		return
	end
	local v17 = v4.new()
	Instruction.Visible = false
	v16:FireServer("FinishTutorial")
	repeat
		task.wait()
	until v15:get()
	local v22 = v14.PlayerCohorts.TrimmedTutorial:get() or v12.IsTestGame()
	local v32 = v14:GetItemFolder("Animals")
	local v42 = v7.new()
	local v5 = v4.new()
	local v6 = nil
	local function onTutorialSlotAdded() --[[ onTutorialSlotAdded | Line: 87 | Upvalues: v32 (copy), v6 (ref), v5 (copy), v42 (copy) ]]
		task.defer(function() --[[ Line: 88 | Upvalues: v32 (ref), v6 (ref), v5 (ref), v42 (ref) ]]
			for v1, v2 in v32:GetChildren() do
				local Serial = v2:FindFirstChild("Serial")
				if if Serial then string.find(Serial.Value, "TutorialCompletion", 1, true) and true or false else nil then
					v6 = v2
					break
				end
			end
			if v6 then
				v5:DoCleaning()
				v42:Fire()
			end
		end)
	end
	v5:GiveTask(v32.ChildAdded:Connect(onTutorialSlotAdded))
	task.defer(function() --[[ Line: 88 | Upvalues: v32 (copy), v6 (ref), v5 (copy), v42 (copy) ]]
		for v1, v2 in v32:GetChildren() do
			local Serial = v2:FindFirstChild("Serial")
			if if Serial then string.find(Serial.Value, "TutorialCompletion", 1, true) and true or false else nil then
				v6 = v2
				break
			end
		end
		if v6 then
			v5:DoCleaning()
			v42:Fire()
		end
	end)
	v42:Wait()
	v2.CloseHUD()
	v2.OpenFrame(Container)
	local v72 = t2[1]
	local xAxis = Vector2.xAxis
	local v102 = UDim2.fromScale(0.006, 0.006)
	Container_2.AnchorPoint = xAxis
	Container_2.Position = v102
	Container_2.ImageLabel.Image = v72.Image
	DialogBox.Description.Text = v72.Dialog
	v17._tween = TweenService:Create(Container_2, v13, {
		AnchorPoint = Vector2.zero,
		Position = UDim2.fromScale(0.006, 0.006)
	})
	v17._tween:Play()
	Instruction.Visible = true
	if v22 then
		task.wait(1)
	else
		v9.Wait()
	end
	v1:DisplaySlot({
		AllowNaming = true,
		Description = "Nice work!",
		DoAnimatedIntro = false,
		ForceAdult = true,
		Type = "TutorialTamed",
		Slot = v6
	})
	Instruction.Visible = true
	v1.YieldForNoDisplay()
	v17:DoCleaning()
	Container_2.Visible = false
	v2.CloseFrame(Container)
	v2.OpenHUD()
	v10.ResetHUDandControls()
	v3.SetGameElements({
		Map = true,
		Menu = true,
		Promo = true,
		Quests = true
	})
end
return t