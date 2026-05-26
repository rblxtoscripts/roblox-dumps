-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("GuiManager")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("Maid")
local v6 = Sonar("PlayerWrapper")
local v7 = Sonar("TapToContinue")
Sonar("PlaceTypeService")
local v8 = v6.GetClient()
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local Character = LocalPlayer.Character
local Container = LocalPlayer.PlayerGui:WaitForChild("NewTutorialGui").Container
local DialogBox = Container.Container.DialogBox
local Assets = ReplicatedStorage:WaitForChild("Storage").Tutorial.Assets
function t.Run(p1, p2) --[[ Run | Line: 40 | Upvalues: v8 (copy), DialogBox (copy), v5 (copy), v4 (copy), v3 (copy), v2 (copy), Container (copy), Character (copy), Assets (copy), v1 (copy), CurrentCamera (copy), RunService (copy), v7 (copy) ]]
	local v12 = v8.PlayerCohorts.TrimmedTutorial:get()
	if v8.SkipTutorial then
		return
	end
	local Instruction = DialogBox.Instruction
	local Text = Instruction.Text
	local v22 = v5.new()
	Instruction.Visible = false
	v4:Disable()
	v3.SetCoreGui(Enum.CoreGuiType.Chat, false)
	v3.SetGameElements({
		BossFight = false,
		Promo = false,
		TopBar = false,
		TopFrame = false,
		TouchNode = false,
		RaceClient = false
	})
	v2.CloseAllFrames()
	v2.OpenMainFrame(Container)
	v2.SetBlur(true, nil, {
		Size = 0
	})
	Character:PivotTo(CFrame.new(Assets.PlayerSpawn.Position + Vector3.new(0, 1, 0) * Character:GetExtentsSize() * 0.5))
	local v32
	repeat
		task.wait()
		v32 = v1.GetAllAnimals()
	until next(v32)
	local v42, v52 = next(v32)
	local v6 = v42:GetExtentsSize()
	local v72 = (CFrame.new(Assets.HorseSpawn.Position + Vector3.new(0, 1, 0) * v6 * 0.5) + Vector3.new(0, 1, 0) * v6 * 0.5) * CFrame.Angles(0, -1.5707963267948966, 0)
	v42:PivotTo(v72)
	v52:ChangeCommand("Stay")
	if v12 then
		v52:_sit()
	end
	local CameraType = CurrentCamera.CameraType
	local Position = v72.Position
	local v82 = false
	RunService:BindToRenderStep("PreTutorialCameraPoint", Enum.RenderPriority.Camera.Value, function() --[[ Line: 97 | Upvalues: v82 (ref), CurrentCamera (ref), Position (copy), RunService (ref), CameraType (copy) ]]
		if not v82 then
			local Position_2 = CurrentCamera.CFrame.Position
			local v1 = Position - Position_2
			local Unit = Vector3.new(v1.X, 0, v1.Z).Unit
			CurrentCamera.CameraType = Enum.CameraType.Scriptable
			CurrentCamera.CFrame = CFrame.lookAt(Position_2, Position_2 + Unit)
			v82 = true
			RunService:UnbindFromRenderStep("PreTutorialCameraPoint")
			task.delay(0.1, function() --[[ Line: 119 | Upvalues: CurrentCamera (ref), CameraType (ref) ]]
				CurrentCamera.CameraType = CameraType
			end)
		end
	end)
	v22:GiveTask(function() --[[ Line: 124 | Upvalues: RunService (ref) ]]
		RunService:UnbindFromRenderStep("PreTutorialCameraPoint")
	end)
	v22:GiveTask(function() --[[ Line: 150 | Upvalues: Instruction (copy), Text (copy) ]]
		Instruction.Text = Text
		Instruction.Visible = true
	end)
	Instruction.Visible = true
	if not v12 then
		v7.Wait()
	end
	if v22._cam then
		v22._cam:Pause()
	end
	v22:DoCleaning()
end
return t