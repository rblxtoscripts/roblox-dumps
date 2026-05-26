-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("Maid")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("AnimalInfoFrame")
local LocalPlayer = game:GetService("Players").LocalPlayer
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("InfoOverlayGui").ContainerFrame
local v5 = v2.new()
local v6 = nil
function t.Open(p1) --[[ Open | Line: 27 | Upvalues: t (copy), ContainerFrame (copy), LocalPlayer (copy), v6 (ref), v5 (copy), v4 (copy), v1 (copy) ]]
	local v12 = tick()
	t:Cleanup()
	p1.Frame = ContainerFrame.Menu.Content.HorseInfo
	p1.Owner = p1.Owner or LocalPlayer
	p1.TabButtons = ContainerFrame.TabButtons
	v6 = p1
	v5:GiveTask(v4.new(p1))
	v5:GiveTask(p1.SlotValue.AncestryChanged:Connect(function() --[[ Line: 40 | Upvalues: p1 (copy), v1 (ref), ContainerFrame (ref) ]]
		if not p1.SlotValue.Parent then
			v1.CloseFrame(ContainerFrame, {
				Position = ContainerFrame.Position
			})
		end
	end))
	local v3 = false
	if p1.ActionButtons then
		for k, v in pairs(ContainerFrame.Menu.Content.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				local v42 = p1.ActionButtons[v.Name]
				if v42 then
					if v42.Setup then
						v42.Setup(v, v5)
					end
					v.Visible = true
					v3 = true
					continue
				end
				v.Visible = false
			end
		end
	end
	if p1.ActionButtons and v3 then
		ContainerFrame.Menu.Content.Buttons.Visible = true
		ContainerFrame.Menu.Content.NoActions.Visible = false
	else
		ContainerFrame.Menu.Content.Buttons.Visible = false
		ContainerFrame.Menu.Content.NoActions.Visible = true
	end
	v1.OpenFrame(ContainerFrame)
	return v12
end
function t.Close() --[[ Close | Line: 79 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.CloseFrame(ContainerFrame)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 83 | Upvalues: v1 (copy), ContainerFrame (copy), v5 (copy) ]]
	v1.CleanContents(ContainerFrame)
	v5:DoCleaning()
end
function t.Init(p1) --[[ Init | Line: 89 | Upvalues: v3 (copy), ContainerFrame (copy), t (copy), v1 (copy), v6 (ref) ]]
	v3.new(ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		ShortcutToClose = true,
		Overlay = true,
		CheckVisibility = function(p1) --[[ CheckVisibility | Line: 95 | Upvalues: v6 (ref) ]]
			return not p1 and v6
		end,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = function() --[[ SelectOnOpen | Line: 102 | Upvalues: ContainerFrame (ref) ]]
			for k, v in pairs(ContainerFrame.Menu.Content.Buttons:GetChildren()) do
				if v:IsA("ImageButton") and v.Visible then
					return v
				end
			end
		end
	})
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 111 | Upvalues: v6 (ref) ]]
		v6 = nil
	end)
	v1.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 114 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	for k, v in pairs(ContainerFrame.Menu.Content.Buttons:GetChildren()) do
		if v:IsA("ImageButton") then
			v3.new(v, {
				Click = function() --[[ Click | Line: 122 | Upvalues: v6 (ref), v (copy), t (ref) ]]
					if not v6 then
						return
					end
					local v1 = v6.ActionButtons and v6.ActionButtons[v.Name]
					if not v1 then
						return
					end
					if not v1.Run() then
						return
					end
					t.Close()
				end
			})
		end
	end
end
t:Init()
return t