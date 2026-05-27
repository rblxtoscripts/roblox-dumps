-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiManager")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("ViewportUtils")
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("StallCustomizeGui").ContainerFrame
local v6 = Sonar("PlayerWrapper").GetClient()
local v7 = v1.new()
local v8 = v4.GetRemoteEvent("SelectStallRemote")
function t.Open() --[[ Open | Line: 23 | Upvalues: v6 (copy), ContainerFrame (copy), v7 (copy), v2 (copy), ReplicatedStorage (copy), v5 (copy), v3 (copy), v8 (copy) ]]
	local UnlockedStalls = v6.PlayerData.MarketStalls.UnlockedStalls
	ContainerFrame.Menu.Content.Container.Content.Template.Visible = false
	v7:DoCleaning()
	v2.OpenFrame(ContainerFrame)
	local SelectedStall = v6.PlayerData.MarketStalls.SelectedStall.Value
	local t = {}
	for v1, v22 in UnlockedStalls:GetChildren() do
		local v32 = v22.Name
		local v4 = ContainerFrame.Menu.Content.Container.Content.Template:Clone()
		v4.Name = v32
		local v62 = v5.CreateViewport(v4.Frame.ViewportFrame, ReplicatedStorage.Storage.Assets.MarketStalls:FindFirstChild(v32), false, true)
		v7:GiveTask(v4)
		v7:GiveTask(v62)
		v4.Visible = true
		v4.Parent = ContainerFrame.Menu.Content.Container.Content
		t[v32] = v4
		if v32 == SelectedStall then
			v4.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
		v3.new(v4, {
			Click = function() --[[ Click | Line: 55 | Upvalues: v8 (ref), v32 (copy) ]]
				v8:FireServer(v32)
			end
		})
	end
	v7:GiveTask(v6.PlayerData.MarketStalls.SelectedStall:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 61 | Upvalues: t (copy), SelectedStall (ref), v6 (ref) ]]
		t[SelectedStall].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SelectedStall = v6.PlayerData.MarketStalls.SelectedStall.Value
		t[SelectedStall].BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	end))
end
function t.Init() --[[ Init | Line: 69 | Upvalues: v2 (copy), ContainerFrame (copy), t (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 76 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
end
return t