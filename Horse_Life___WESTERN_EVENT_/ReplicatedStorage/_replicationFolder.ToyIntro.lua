-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("ContextualUtils")
local v4 = Sonar("Marker")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("PlayerWrapper")
Sonar("Constants")
local v7 = Sonar("PlaceTypeService")
local ContainerFrame = game.Players.LocalPlayer.PlayerGui:WaitForChild("LegoEventIntro").ContainerFrame
local v8 = v5.GetRemoteEvent("SetToyIntroOpenLegoRemote")
function t.OpenFromJoin(p1) --[[ OpenFromJoin | Line: 18 | Upvalues: v7 (copy), v6 (copy), v1 (copy), ContainerFrame (copy) ]]
	if v7.IsMarketWorld() then
		return
	end
	local v12 = v6.GetClient()
	if not (v12 and v12.PlayerData:FindFirstChild("OpenLego2")) then
		return
	end
	if v12.PlayerData.OpenLego2.Value then
		return
	end
	v1.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	repeat
		task.wait()
	until not v1.IsFrameOpen(ContainerFrame)
end
function t.Close() --[[ Close | Line: 37 | Upvalues: v1 (copy), ContainerFrame (copy), v8 (copy) ]]
	v1.CloseMainFrame(ContainerFrame)
	v1.OpenHUD({
		DoNotCloseMainFrame = true
	})
	v8:FireServer()
end
function t.Init(p1) --[[ Init | Line: 44 | Upvalues: v1 (copy), ContainerFrame (copy), v2 (copy), t (copy), v3 (copy), v4 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.new(ContainerFrame.Featured.CloseButton, {
		Click = t.Close
	})
	v2.new(ContainerFrame.Logs.Selected.BackButton, {
		Click = function() --[[ Click | Line: 58 | Upvalues: t (ref), v3 (ref), v4 (ref) ]]
			t.Close()
			local Part = workspace.Interactions:FindFirstChild("AutumnRef").Part
			if not Part then
				return
			end
			v3.SetGuiWorldspacePointTo(Part, nil, "Talk to Autumn")
			local v1 = v4.new({
				Duration = false,
				Root = Part
			})
			if not (v1 and v1.Maid) then
				return
			end
			v1.Maid:GiveTask(function() --[[ Line: 74 | Upvalues: v3 (ref) ]]
				v3.SetGuiWorldspacePointTo()
			end)
		end
	})
end
t:Init()
return t