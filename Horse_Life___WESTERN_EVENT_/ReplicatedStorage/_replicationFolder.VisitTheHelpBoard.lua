-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ContextualUtils")
local v2 = Sonar("GuiManager")
local v3 = Sonar("HelpGui")
local v4 = Sonar("Maid")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("Signal")
Sonar("PlaceTypeService")
local v7 = v5.GetClient()
local PlayerGui = Players.LocalPlayer.PlayerGui
local CurrentCamera = Workspace.CurrentCamera
local Container = PlayerGui:WaitForChild("NewTutorialGui").Container
function t.Run(p1) --[[ Run | Line: 35 | Upvalues: v7 (copy), v4 (copy), v6 (copy), Container (copy), CurrentCamera (copy), Workspace (copy), v1 (copy), PlayerGui (copy), v2 (copy), RunService (copy), v3 (copy) ]]
	local v12 = v7.PlayerCohorts.TrimmedTutorial:get()
	if v7.SkipTutorial then
		return
	end
	if v7.SkipHelpBoard then
		return
	end
	local v22 = v4.new()
	local v32 = v6.new()
	Container.Interactable = false
	v7.VisitTheHelpBoard = true
	CurrentCamera.CameraType = Enum.CameraType.Custom
	local InteractPart = Workspace:WaitForChild("Interactions"):WaitForChild("HelpSign"):FindFirstChild("InteractPart")
	local v42 = InteractPart and v1.FromPlayer(InteractPart) or nil
	local ContainerFrame = PlayerGui:WaitForChild("HelpGui").ContainerFrame
	local v5 = false
	v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 64 | Upvalues: v5 (ref), v42 (ref), v1 (ref) ]]
		if v5 then
			return
		end
		if not v42 then
			return
		end
		v1.Destroy(v42)
		v42 = nil
	end)
	if v12 then
		local v62 = false
		v22:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 78 | Upvalues: v62 (ref), v7 (ref), InteractPart (copy), v2 (ref), ContainerFrame (copy), v3 (ref) ]]
			if v62 then
				return
			end
			if not v7.VisitTheHelpBoard then
				return
			end
			if not InteractPart then
				return
			end
			if v2.IsFrameOpen(ContainerFrame) then
				return
			end
			if not v7:IsInRange(InteractPart.Position, 25) then
				return
			end
			v62 = true
			v3.Open()
		end))
	end
	v22:GiveTask(v3.Closed:Connect(function() --[[ Line: 92 | Upvalues: v32 (copy) ]]
		v32:Fire()
	end))
	v22:GiveTask(function() --[[ Line: 97 | Upvalues: v42 (ref), v1 (ref) ]]
		if not v42 then
			return
		end
		v1.Destroy(v42)
		v42 = nil
	end)
	v32:Wait()
	v22:DoCleaning()
	v5 = true
end
return t