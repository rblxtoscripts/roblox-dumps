-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
game:GetService("ReplicatedStorage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("spr")
local v3 = Sonar("GuiManager")
local v4 = Sonar("Signal")
local v5 = Sonar("PlayerUtils")
local v6 = Sonar("Button")
local v7 = Sonar("LightingService")
local v8 = Sonar("CharacterEffects")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v9 = Sonar("PlayerWrapper").GetClient()
local CurrentCamera = workspace.CurrentCamera
local v10 = LocalPlayer:GetMouse()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("DynamicNPCGui").ContainerFrame
local BottomFrame = ContainerFrame.BottomFrame
local DialogContainer = BottomFrame.Menu.DialogContainer
local SFX = game.ReplicatedStorage.Storage.SFX
local v11 = nil
local v12 = 0
function t.Start(p1) --[[ Start | Line: 39 | Upvalues: v11 (ref), t (copy) ]]
	if v11 then
	else
		v11 = t.new(p1)
		return v11
	end
end
function t.Stop() --[[ Stop | Line: 47 | Upvalues: v11 (ref) ]]
	if not v11 then
		return
	end
	v11:Destroy()
	v11 = nil
end
function t.IsActive() --[[ IsActive | Line: 54 | Upvalues: v11 (ref) ]]
	return v11 ~= nil
end
function t.new(p1) --[[ new | Line: 58 | Upvalues: t (copy), v1 (copy), LocalPlayer (copy), v4 (copy), UserInputService (copy), BottomFrame (copy), v12 (ref), v9 (copy), RunService (copy), v10 (copy), CurrentCamera (copy), v2 (copy), v7 (copy), v8 (copy), v3 (copy), ContainerFrame (copy) ]]
	local v13 = t
	local v22 = setmetatable({}, v13)
	v22.Maid = v1.new()
	v22.ChoicesMaid = v1.new()
	v22.Maid:GiveTask(v22.ChoicesMaid)
	v22.DialogOptions = p1
	v22.Target = p1.Target
	v22.Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	v22.ProceedSignal = v4.new()
	v22.Maid:GiveTask(v22.ProceedSignal)
	v22.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 69 | Upvalues: v22 (copy) ]]
		local v1 = if p1.UserInputType == Enum.UserInputType.MouseButton1 or (p1.UserInputType == Enum.UserInputType.Touch or p1.KeyCode == Enum.KeyCode.ButtonX) then true else p1.KeyCode == Enum.KeyCode.X
		if not v1 and p2 then
			return
		end
		if not v1 then
			return
		end
		v22:Proceed()
	end))
	v22.Image = p1.Image
	if v22.Image then
		BottomFrame.ImageFrame.Visible = true
		BottomFrame.ImageFrame.Image = v22.Image
	else
		BottomFrame.ImageFrame.Visible = false
		BottomFrame.ImageFrame.Image = ""
	end
	v22.Maid:GiveTask(v22.Target.AncestryChanged:Connect(function() --[[ Line: 90 | Upvalues: t (ref) ]]
		t.Stop()
	end))
	v22.Maid:GiveTask(UserInputService.InputChanged:Connect(function(p1, p2) --[[ Line: 94 | Upvalues: v12 (ref) ]]
		if p2 then
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseWheel then
			v12 = math.clamp(v12 + p1.Position.Z * 1.5, -1, 12)
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.Gamepad1 or p1.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			return
		end
		v12 = math.clamp(v12 - p1.Position.Y * 0.5, -1, 12)
	end))
	local v42 = 1
	v22.Maid:GiveTask(UserInputService.TouchPinch:Connect(function(p1, p2, p3, p4) --[[ Line: 104 | Upvalues: v42 (ref), v12 (ref) ]]
		if p4 == Enum.UserInputState.Begin then
			v42 = p2
			return
		end
		if p4 ~= Enum.UserInputState.Change then
			return
		end
		v12 = math.clamp(v12 - (p2 - v42) * 10, -1, 12)
		v42 = p2
	end))
	v9:SetActionState("SpeakingToNPC", true)
	v12 = 0
	local CurrentCamera_2 = workspace.CurrentCamera
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = CurrentCamera_2.CFrame
	v22.Maid:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 121 | Upvalues: v22 (copy), v10 (ref), CurrentCamera (ref), v12 (ref), v2 (ref), CFrameValue (copy), CurrentCamera_2 (copy), UserInputService (ref), t (ref) ]]
		local v1
		if v22.Target:IsA("Model") then
			v1 = v22.Target:GetPivot()
		else
			if not v22.Target:IsA("BasePart") then
				return
			end
			v1 = v22.Target.CFrame
		end
		local Position = v1.Position
		local Position_2 = v22.Character:GetPivot().Position
		local v3 = if v22.DialogOptions.CameraMode == "LookVector" then CFrame.lookAt(Position, Position + (v1.LookVector * Vector3.new(1, 0, 1)).Unit) else CFrame.lookAt(Position, Position_2)
		local v6 = CFrame.Angles(0, 2.9670597283903604, 0) * CFrame.Angles(-0.2617993877991494, 0, 0) * CFrame.new(0, 0, 7)
		local v8 = CFrame.Angles(0, -(v10.X / (CurrentCamera.ViewportSize.X / 2) - 1) / 12, 0)
		v2.target(CFrameValue, 1, 1, {
			Value = v3 * v6 * CFrame.new(0, -v12 / 4, v12) * v8
		})
		CurrentCamera_2.CFrame = CFrameValue.Value
		if UserInputService.MouseBehavior ~= Enum.MouseBehavior.Default then
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end
		if not ((Position_2 - Position).Magnitude > 32.5) then
			return
		end
		t.Stop()
	end))
	v22.Maid:GiveTask(function() --[[ Line: 160 | Upvalues: v2 (ref), CFrameValue (copy), v22 (copy) ]]
		v2.stop(CFrameValue)
		CFrameValue:Destroy()
		if not v22.DialogOptions.OnEnd then
			return
		end
		v22.DialogOptions.OnEnd(v22)
	end)
	v7.setLightingMode("NPCDialog", true)
	v8.UpdateVisibility(true)
	BottomFrame.Menu.NameLabel.Text = p1.Name or "Dialog"
	v3.OpenMainFrame(ContainerFrame, {
		Blur = false,
		DisableControls = true,
		CloseAll = true
	})
	for k, v in pairs({ BottomFrame }) do
		v3.UpdateFrame(v)
	end
	v22:Parse(v22.DialogOptions)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 184 | Upvalues: v9 (copy), v7 (copy), v3 (copy), v8 (copy) ]]
	v9:SetActionState("SpeakingToNPC", false)
	v7.setLightingMode("NPCDialog", false, nil, true)
	v3.OpenHUD()
	v8.UpdateVisibility()
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Proceed(p1) --[[ Proceed | Line: 198 ]]
	if p1.CanProceed then
		p1.ProceedSignal:Fire()
	else
		p1.Clicked = true
	end
end
function t.SetCanProceed(p1, p2, p3) --[[ SetCanProceed | Line: 209 | Upvalues: DialogContainer (copy) ]]
	p1.CanProceed = p2
	if p3 then
		DialogContainer.ProceedLabel.Visible = false
	else
		DialogContainer.ProceedLabel.Visible = p2
	end
end
function t.Parse(p1, p2) --[[ Parse | Line: 218 | Upvalues: DialogContainer (copy), v5 (copy), LocalPlayer (copy), SFX (copy), t (copy) ]]
	p1.ChoicesMaid:DoCleaning()
	local Dialog = p2.Dialog
	if type(Dialog) == "string" then
		Dialog = { Dialog }
	end
	for v1, v2 in Dialog do
		p1:SetCanProceed(false)
		DialogContainer.DialogLabel.Text = v2:gsub("PLAYERNAME", v5.GetPlayerName(LocalPlayer))
		DialogContainer.DialogLabel.MaxVisibleGraphemes = 0
		local v3 = utf8.len(DialogContainer.DialogLabel.ContentText)
		for i = 1, v3 do
			if p1.Clicked then
				p1.Clicked = false
				DialogContainer.DialogLabel.MaxVisibleGraphemes = v3
				break
			end
			if i % 6 == 0 then
				SFX.TypeWrite:Play()
			end
			task.wait(0.015)
			DialogContainer.DialogLabel.MaxVisibleGraphemes = i
		end
		p1:SetCanProceed(true)
		if #Dialog > 1 then
			p1.ProceedSignal:Wait()
		end
	end
	if p2.Choices then
		p1:CreateChoices(p2.Choices)
		return
	end
	if p2.OnEnd then
		p2.OnEnd(p1)
	else
		t.Stop()
	end
end
function t.CreateChoices(p1, p2) --[[ CreateChoices | Line: 273 | Upvalues: BottomFrame (copy), v6 (copy) ]]
	p1.ChoicesMaid:DoCleaning()
	for i, v in ipairs(p2) do
		local v1 = BottomFrame.ChatOptions.Default:Clone()
		v1.Name = tostring(i)
		v1.Content.TextLabel.Text = v.Text
		v1.Visible = true
		if v.Update then
			v.Update(p1, v1)
		end
		p1.ChoicesMaid:GiveTask(v6.new(v1, {
			Click = function() --[[ Click | Line: 291 | Upvalues: v (copy), p1 (copy) ]]
				if v.OnRun then
					v.OnRun(p1)
				end
				if not v.Dialog then
					return
				end
				p1:Parse(v)
			end
		}))
		v1.Parent = BottomFrame.ChatOptions
		p1.ChoicesMaid:GiveTask(v1)
	end
end
function t.RunDialog(p1) --[[ RunDialog | Line: 306 | Upvalues: t (copy), LocalPlayer (copy), SFX (copy) ]]
	local Object = p1.Object
	local Dialog = p1.Dialog
	local OnEnd = p1.OnEnd
	local t2 = {}
	if typeof(Dialog.Choice) == "string" then
		t2 = {
			{
				Text = Dialog.Choice,
				OnRun = function() --[[ OnRun | Line: 318 | Upvalues: t (ref) ]]
					t.Stop()
				end
			}
		}
	elseif typeof(Dialog.Choice) == "table" then
		t2 = Dialog.Choice
	end
	local Text = Dialog.Text
	if typeof(Text) == "string" then
		Text = { Text }
	end
	local v1 = Dialog.Name or "Mysterious Stranger"
	if v1 == "Player" then
		v1 = LocalPlayer.DisplayName
	end
	local t3 = {
		Target = Object:FindFirstChild("CameraPart") or Object,
		Name = v1,
		Dialog = Text,
		Choices = t2,
		CameraMode = p1.CameraMode,
		OnEnd = function() --[[ OnEnd | Line: 343 | Upvalues: OnEnd (copy) ]]
			if not OnEnd then
				return
			end
			OnEnd()
		end
	}
	SFX.Paper:Play()
	t.Start(t3)
end
function t.Init(p1) --[[ Init | Line: 353 ]] end
t:Init()
return t