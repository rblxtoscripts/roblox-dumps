-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("GuiManager")
local v6 = Sonar("Maid")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("Signal")
local v9 = Sonar("State")
local v10 = Sonar("TapToContinue")
Sonar("PlaceTypeService")
local v11 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true)
local v12 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t2 = {
	{
		Name = "Hazel",
		Image = "rbxassetid://125052816154744",
		Dialog = "Hi! I\'m Hazel. Let\'s play!",
		Response = "Let\'s play!"
	},
	{
		Name = "Hazel",
		Image = "rbxassetid://89564559451462",
		Dialog = "Ride your Horse to get started!"
	}
}
local Tutorial = ReplicatedStorage:WaitForChild("Storage").Assets.Tutorial
local v13 = v7.GetClient()
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local Character = LocalPlayer.Character
local Container = LocalPlayer.PlayerGui:WaitForChild("NewTutorialGui").Container
local Container_2 = Container.Container
local DialogBox = Container_2.DialogBox
local Instruction = DialogBox.Instruction
local v14 = false
local v15 = v8.new()
local v16 = v9.new(1)
function t.Run(p1) --[[ Run | Line: 68 | Upvalues: v13 (copy), v6 (copy), Instruction (copy), v4 (copy), CurrentCamera (copy), v5 (copy), Container (copy), v16 (copy), t2 (copy), v14 (ref), Container_2 (copy), DialogBox (copy), TweenService (copy), v12 (copy), v15 (copy), v1 (copy), v2 (copy), Tutorial (copy), v11 (copy), v3 (copy), v10 (copy), Character (copy) ]]
	local v17 = v13.PlayerCohorts.TrimmedTutorial:get()
	if v13.SkipTutorial then
		return
	end
	local v22 = v6.new()
	local v32 = v6.new()
	local Text = Instruction.Text
	local v42 = nil
	local v52 = false
	Instruction.Visible = false
	v4:Disable()
	CurrentCamera.CameraType = Enum.CameraType.Custom
	v5.CloseHUD()
	v5.OpenFrame(Container)
	v32:GiveTask(v16:subscribe(function(p1) --[[ Line: 91 | Upvalues: t2 (ref), v14 (ref), Container_2 (ref), DialogBox (ref), Instruction (ref), v22 (copy), TweenService (ref), v12 (ref), v17 (copy), v15 (ref), v52 (ref) ]]
		local v1 = t2[p1]
		v14 = true
		local xAxis = Vector2.xAxis
		local v4 = UDim2.fromScale(0.006, 0.006)
		Container_2.AnchorPoint = xAxis
		Container_2.Position = v4
		Container_2.ImageLabel.Image = v1.Image
		DialogBox.Description.Text = v1.Dialog
		if v1.Response then
			Instruction.Text = v1.Response
		end
		v22._tween = if v22._tween then v22._tween:Pause() else nil
		v22._tween = TweenService:Create(Container_2, v12, {
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromScale(0.006, 0.006)
		})
		v22._tween:Play()
		v22._tween.Completed:Wait()
		v14 = false
		if v17 then
			task.wait(1)
		else
			if not v52 then
				return
			end
			v52 = false
		end
		v15:Fire()
	end))
	local v62 = nil
	v22:GiveTask(v16:changed(function(p1) --[[ Line: 125 | Upvalues: v1 (ref), v62 (ref), v2 (ref), v42 (ref), Tutorial (ref), v22 (copy), TweenService (ref), v11 (ref) ]]
		if p1 ~= 2 then
			return
		end
		local v12 = select(-1, next(v1.GetAllAnimals()))
		if not (v12 and v12.Model) then
			return
		end
		local v23 = v12.Model.PrimaryPart or v12.Model:FindFirstChildOfClass("BasePart")
		if v23 then
			v62 = v2.FromPlayer(v23)
		end
		v42 = Tutorial.Highlight:Clone()
		v42.Adornee = v12.Model
		v42.Enabled = true
		v42.Parent = v12.Model
		v22:GiveTask(TweenService:Create(v42, v11, {
			FillTransparency = 1,
			OutlineTransparency = 1
		})):Play()
		v22:GiveTask(v42)
	end))
	v22:GiveTask(function() --[[ Line: 154 | Upvalues: v62 (ref), v2 (ref) ]]
		if not v62 then
			return
		end
		v2.Destroy(v62)
		v62 = nil
	end)
	v22:GiveTask(v16:changed(function(p1) --[[ Line: 161 | Upvalues: v4 (ref), v13 (ref), v3 (ref), Container (ref), Instruction (ref) ]]
		if p1 ~= 2 then
			return
		end
		v4:Enable()
		v13:EnablePlayerControls()
		v3.SetGameElements({
			TouchNode = true
		})
		Container.Interactable = false
		Instruction.Visible = false
	end))
	Instruction.Visible = true
	if v17 then
		task.wait(1)
		v15:Fire()
	else
		v22._activated = v10.Connect(function() --[[ Line: 179 | Upvalues: v14 (ref), v52 (ref), v15 (ref) ]]
			if v14 then
				v52 = true
			else
				v15:Fire()
			end
		end)
	end
	for i = 2, #t2 do
		v15:Wait()
		v16:set(i)
	end
	repeat
		local SeatPart = Character.Humanoid.SeatPart
		task.wait()
	until SeatPart and SeatPart:IsDescendantOf(next(v1.GetAllAnimals()))
	if v62 then
		v2.Destroy(v62)
		v62 = nil
	end
	Instruction.Text = Text
	Instruction.Visible = true
	v3.SetGameElements({
		PlayerLeaderboard = false
	}, true)
	v22:DoCleaning()
	v32:DoCleaning()
end
return t