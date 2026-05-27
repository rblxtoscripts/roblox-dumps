-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("Button")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("TutorialService")
local v7 = Sonar("Signal")
local v8 = Sonar("State")
local t2 = { "Taming", "Breeding", "Journal", "HorseSkills" }
local v9 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("HelpGui").ContainerFrame
local v10 = v5.GetRemoteEvent("VisitTheHelpBoardRemote")
local v11 = v5.GetRemoteEvent("OpenedHelpGuiSectionsRemote")
local v12 = v7.new()
local ItemStreamPickUp = ReplicatedStorage:WaitForChild("Storage").SFX.ItemStreamPickUp
function t.Open(p1) --[[ Open | Line: 45 | Upvalues: v1 (copy), ContainerFrame (copy), v9 (copy), v10 (copy) ]]
	if v1.IsFrameOpen(ContainerFrame) then
		return
	end
	if not v9.PlayerData.VisitedTheHelpBoard.Value then
		v10:FireServer()
	end
	CloseCallback = p1
	v1.OpenMainFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
end
function t.Close() --[[ Close | Line: 60 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	if CloseCallback then
		local v12 = CloseCallback
		CloseCallback = nil
		v1.CloseMainFrame(ContainerFrame)
		v12()
	else
		v1.CloseMainFrame(ContainerFrame)
	end
end
function t.Init(p1) --[[ Init | Line: 74 | Upvalues: t (copy), v12 (copy), v1 (copy), ContainerFrame (copy), t2 (copy), v9 (copy), v8 (copy), ItemStreamPickUp (copy), v3 (copy), v6 (copy), v11 (copy), v2 (copy), v4 (copy) ]]
	t.Closed = v12
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ContainerFrame.Menu.Content.Tutorials.ScrollingFrame
	})
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 88 | Upvalues: v12 (ref) ]]
		v12:Fire()
	end)
	for v13, v22 in ContainerFrame.Menu.Content.Tutorials.ScrollingFrame:GetChildren() do
		if table.find(t2, v22.Name) then
			local v32 = v9.PlayerData.OpenedHelpGuiSections:FindFirstChild(v22.Name)
			local v42 = if v32 then v32.Value else false
			local Received = v22.RewardFrame.Content.Content.Received
			local v5 = v8.new(v42)
			if v32 then
				v8.fromProperty(v32, "Value"):subscribe(function(p1) --[[ Line: 103 | Upvalues: v5 (copy) ]]
					v5:set(p1)
				end)
			end
			v5:subscribe(function(p1) --[[ Line: 108 | Upvalues: v42 (copy), ItemStreamPickUp (ref), Received (copy) ]]
				if p1 and not v42 then
					ItemStreamPickUp:Play()
				end
				Received.Received.Visible = p1
				Received.NotReceived.Visible = not p1
			end)
		end
	end
	v1.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 118 | Upvalues: ContainerFrame (ref), v3 (ref), v6 (ref), t2 (ref), v11 (ref) ]]
		for k, v in pairs(ContainerFrame.Menu.Content.Tutorials.ScrollingFrame:GetChildren()) do
			if v:IsA("ImageButton") then
				local v1 = v.Name
				v3.new(v, {
					NoHoverShadowLabel = true,
					Click = function() --[[ Click | Line: 129 | Upvalues: v6 (ref), v1 (copy), t2 (ref), v11 (ref) ]]
						v6.PromptPopupInfo(v1)
						if not table.find(t2, v1) then
							return
						end
						v11:FireServer(v1)
					end
				})
				v3:RegisterHover(v, function() --[[ Line: 138 | Upvalues: v (copy) ]]
					v.Gradient.BackgroundColor3 = Color3.fromRGB(205, 247, 174)
				end)
				v3:RegisterLeave(v, function() --[[ Line: 142 | Upvalues: v (copy) ]]
					v.Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				end)
			end
		end
	end)
	v2.new(ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	task.spawn(function() --[[ Line: 152 | Upvalues: v4 (ref), v6 (ref), t (ref) ]]
		v4.new(workspace:WaitForChild("Interactions"):WaitForChild("HelpSign"):WaitForChild("InteractPart"), {
			AllowDuringTutorial = true,
			ShowHintLabel = true,
			Hint = "Help",
			GetRange = function() --[[ GetRange | Line: 158 ]]
				return 25
			end,
			Run = function() --[[ Run | Line: 162 | Upvalues: v6 (ref), t (ref) ]]
				if v6.CanDoActionInTutorial("InteractZones") then
					t.Open()
				end
			end
		})
	end)
end
t:Init()
return t