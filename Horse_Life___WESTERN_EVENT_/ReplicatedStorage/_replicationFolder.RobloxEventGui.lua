-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("StatBar")
local v7 = Sonar("RemoteUtils")
local v8 = Sonar("Maid")
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("RobloxEventGui").ContainerFrame
local v9 = false
local v10 = v5.GetClient()
local v11 = Sonar(v3.Get("RobloxEventMissions"))
local t2 = {
	"EasyQuest",
	"MediumQuest",
	"HardQuest",
	"LudicrousQuest"
}
local function setupEventContents() --[[ setupEventContents | Line: 34 | Upvalues: v11 (copy), t2 (copy), ContainerFrame (copy), v10 (copy), v6 (copy), v2 (copy), v7 (copy), v8 (copy) ]]
	for v1, v22 in v11 do
		local v4 = ContainerFrame.Menu:FindFirstChild(t2[v1])
		if v4 then
			v4.Description.Text = v22.Description
			local v5 = v10.PlayerData.Missions.RobloxEvent[v1]
			if v5 then
				v6.new({
					TweenAmount = true,
					Frame = v4.ProgressBar.Bar,
					AmountLabel = v4.ProgressLabel,
					Get = function() --[[ Get | Line: 51 | Upvalues: v5 (copy) ]]
						return v5.Amount.Value
					end,
					GetMax = function() --[[ GetMax | Line: 55 | Upvalues: v22 (copy) ]]
						return v22.Amount
					end,
					Changed = { v5.Amount:GetPropertyChangedSignal("Value") }
				})
				local v62 = v1 > 1 and v10.PlayerData.Missions.RobloxEvent[v1 - 1] or nil
				local function UpdateButtons() --[[ UpdateButtons | Line: 66 | Upvalues: v5 (copy), v22 (copy), v4 (copy), v1 (copy), v62 (copy) ]]
					if v5.Amount.Value >= v22.Amount then
						v4.ClaimButton.Visible = true
						v4.ProgressBar.Visible = false
						v4.ProgressLabel.Visible = false
						v4.ProgressBar.Bar.Visible = false
					else
						v4.ClaimButton.Visible = false
						v4.ProgressBar.Visible = true
						v4.ProgressLabel.Visible = true
					end
					local v12 = (not (v1 > 1) or (not v62 or v62.CompletedOnce.Value)) and true or false
					if v5.Started.Value then
						v4.StartButton.Visible = false
						v4.ProgressBar.Visible = true
						v4.ProgressLabel.Visible = true
						v4.ProgressBar.Bar.Visible = true
					else
						v4.StartButton.Visible = v12
						v4.ProgressBar.Visible = false
						v4.ProgressLabel.Visible = false
						v4.ProgressBar.Bar.Visible = false
					end
				end
				UpdateButtons()
				v5.Amount:GetPropertyChangedSignal("Value"):Connect(UpdateButtons)
				v5.Started:GetPropertyChangedSignal("Value"):Connect(UpdateButtons)
				v5.CompletedOnce:GetPropertyChangedSignal("Value"):Connect(UpdateButtons)
				if v62 then
					v62.CompletedOnce:GetPropertyChangedSignal("Value"):Connect(UpdateButtons)
				end
				v2.new(v4.ClaimButton, {
					Click = function() --[[ Click | Line: 109 | Upvalues: v7 (ref), v1 (copy), UpdateButtons (copy) ]]
						if not v7.GetRemoteFunction("ClaimRobloxEventMission"):InvokeServer(v1) then
							return
						end
						UpdateButtons()
					end
				})
				v2.new(v4.StartButton, {
					Click = function() --[[ Click | Line: 119 | Upvalues: v7 (ref), v1 (copy), UpdateButtons (copy) ]]
						if not v7.GetRemoteFunction("StartRobloxEventMission"):InvokeServer(v1) then
							return
						end
						UpdateButtons()
					end
				})
			end
		end
	end
	local HardQuest = ContainerFrame.Menu.HardQuest
	local v72 = v8.new()
	local function UpdateSpeciesTames() --[[ UpdateSpeciesTames | Line: 133 | Upvalues: v72 (copy), v10 (ref), HardQuest (copy) ]]
		v72:DoCleaning()
		for v1, v2 in v10.PlayerData.RobloxEventSpeciesTamed:GetChildren() do
			local v3 = HardQuest.SpeciesTracker.ScrollingFrame.Default:Clone()
			v3.TextLabel.Text = v2.Name
			v3.Parent = HardQuest.SpeciesTracker.ScrollingFrame
			v3.Visible = true
			v72:GiveTask(v3)
		end
	end
	v10.PlayerData.RobloxEventSpeciesTamed.ChildRemoved:Connect(UpdateSpeciesTames)
	v10.PlayerData.RobloxEventSpeciesTamed.ChildAdded:Connect(UpdateSpeciesTames)
	UpdateSpeciesTames()
end
function t.Open(p1) --[[ Open | Line: 153 | Upvalues: v1 (copy), ContainerFrame (copy), v9 (ref), setupEventContents (copy) ]]
	v1.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	if not v9 then
		v9 = true
		setupEventContents()
	end
end
function t.Close() --[[ Close | Line: 165 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.CloseFrame(ContainerFrame)
end
function t.OnOpen(p1) --[[ OnOpen | Line: 169 ]] end
function t.OnClose(p1) --[[ OnClose | Line: 173 ]] end
function t.Init(p1) --[[ Init | Line: 178 | Upvalues: v1 (copy), ContainerFrame (copy), t (copy), v2 (copy), v4 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 190 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v1.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 193 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v2.new(ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	v4.new(workspace.Interactions:WaitForChild("QuestInteract").InteractPart, {
		ShowHintLabel = true,
		Hint = "Open Roblox Event",
		Run = function() --[[ Run | Line: 203 | Upvalues: t (ref) ]]
			t.Open()
		end,
		GetRange = function() --[[ GetRange | Line: 206 ]]
			return 50
		end
	})
end
t:Init()
return t