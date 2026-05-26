-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("Button")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("DailyLoginService")
local v5 = Sonar("GuiManager")
local v6 = Sonar("InteractMenu")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("State")
local v10 = Sonar("StateUtils")
local v11 = Sonar("TutorialService")
local v12 = Sonar("StorageUtils")
local v13 = Sonar("PlaceTypeService")
local v14 = RunService:IsStudio() and false
local v15 = v8.GetClient()
local v16 = v9.fromProperty(v15.PlayerData.Loyalty.InCommunity, "Value")
local v17 = v9.fromProperty(v15.PlayerData.Metadata.PolicyCheck, "Value")
local PolicyInfo = v15.PolicyInfo
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("RewardsGuiNew").ContainerFrame
local DiscordContainer = ContainerFrame.DiscordContainer
local Menu = ContainerFrame.Menu
local CloseButton = Menu.CloseButton
local v18 = ContainerFrame.TabButtons:GetChildren()
local v19 = Menu.TabFrames:GetChildren()
local Position = ContainerFrame.Position
local v20 = Position + UDim2.fromScale(0, 0.15)
local t2 = { 15696848933, 16727629658, 16618922530 }
local v21 = v9.fromProperty(v15.DailyLoginData.Streak, "Value")
local v22 = v21:get()
local v23 = v9.new("DailyLogin")
local t3 = {
	DailyLogin = Sonar(script.DailyLogin),
	DailyBonus = Sonar(script.DailyBonus),
	Streak = Sonar(script.Streak),
	Codes = Sonar(script.Codes),
	Stipend = Sonar(script.Stipend)
}
function t.Close(p1) --[[ Close | Line: 80 | Upvalues: v5 (copy), ContainerFrame (copy), v23 (copy) ]]
	v5.CloseMainFrame(ContainerFrame)
	v5.OpenHUD({
		DoNotCloseMainFrame = p1
	})
	v23:set("DailyLogin")
end
function t.Open(p1) --[[ Open | Line: 88 | Upvalues: v5 (copy), ContainerFrame (copy), v21 (copy), v22 (ref), v7 (copy), v23 (copy) ]]
	if v5.IsFrameOpen(ContainerFrame) then
		return
	end
	if v21:get() == 1 and v22 > 1 then
		v7.Notify({
			Preset = "Red",
			ChatMessage = true,
			Message = ("You lost your %* day streak!"):format(v22)
		})
	end
	if typeof(p1) == "string" then
		v23:set(p1)
	end
	v5.OpenMainFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
end
function t.OpenFromJoin() --[[ OpenFromJoin | Line: 109 | Upvalues: t2 (copy), v11 (copy), v15 (copy), v4 (copy), t (copy), v5 (copy), ContainerFrame (copy) ]]
	if not table.find(t2, game.PlaceId) then
		return
	end
	if not v11.HasCompletedPrimaryTutorial(v15) then
		return
	end
	if not v4:CanClaimReward(v15) then
		return
	end
	t.Open()
	repeat
		task.wait()
	until not v5.IsFrameOpen(ContainerFrame)
end
function t._setupCloseButton(p1) --[[ _setupCloseButton | Line: 130 | Upvalues: v3 (copy), CloseButton (copy), t (copy) ]]
	v3.new(CloseButton, {
		Click = function() --[[ Click | Line: 132 | Upvalues: t (ref) ]]
			t.Close(true)
		end
	})
end
function t._setupContainerFrame(p1) --[[ _setupContainerFrame | Line: 139 | Upvalues: v5 (copy), ContainerFrame (copy), Position (copy), v20 (copy) ]]
	v5.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = Position,
		ClosePosition = v20
	})
end
function t._setupInteractMenu(p1) --[[ _setupInteractMenu | Line: 151 | Upvalues: v13 (copy), v12 (copy), v6 (copy), v11 (copy), t (copy) ]]
	if v13.IsMainWorld() or v13.IsMarketWorld() then
		v6.new(v12.GetFromPath("Workspace/Interactions/LoyaltyRewards/InteractPart"), {
			Hint = "Open Rewards",
			ShowHintLabel = true,
			GetRange = function() --[[ GetRange | Line: 162 ]]
				return 25
			end,
			Run = function() --[[ Run | Line: 166 | Upvalues: v11 (ref), t (ref) ]]
				if v11.CanDoActionInTutorial("InteractZones") then
					t.Open()
				end
			end
		})
	end
end
function t._setupTabs(p1) --[[ _setupTabs | Line: 177 | Upvalues: v18 (copy), v19 (copy), v2 (copy), v23 (copy), v1 (copy), t3 (copy) ]]
	for i = #v18, 1, -1 do
		if not v18[i]:IsA("GuiButton") then
			table.remove(v18, i)
		end
	end
	for j = #v19, 1, -1 do
		if not v19[j]:IsA("GuiObject") then
			table.remove(v19, j)
		end
	end
	for v12, v22 in v18 do
		local v3 = v22.Name
		local v4 = false
		for v5, v6 in v19 do
			v4 = v6.Name == v3
			if v4 then
				break
			end
		end
		if v4 then
			v2.new(v22, {
				Click = function() --[[ Click | Line: 211 | Upvalues: v23 (ref), v3 (copy) ]]
					v23:set(v3)
				end
			})
		end
	end
	v23:subscribe(function(p1) --[[ Line: 217 | Upvalues: v18 (ref), v1 (ref), t3 (ref), v19 (ref) ]]
		for v12, v2 in v18 do
			v1.target(v2.UIScale, 0.75, 2, {
				Scale = (if p1 == v2.Name then 0.2 else 0) + 1
			})
		end
		for v4, v5 in t3 do
			v5:Run(p1 == v4)
		end
		for v7, v8 in v19 do
			v8.Visible = v8.Name == p1
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 238 | Upvalues: v21 (copy), v22 (ref), v7 (copy), v10 (copy), DiscordContainer (copy), v17 (copy), v16 (copy), ContainerFrame (copy), PolicyInfo (copy), v14 (copy) ]]
	p1:_setupCloseButton()
	p1:_setupContainerFrame()
	p1:_setupInteractMenu()
	p1:_setupTabs()
	v21:subscribe(function(p1) --[[ Line: 244 | Upvalues: v22 (ref), v7 (ref) ]]
		if p1 == v22 then
			return
		end
		if p1 == 1 and p1 < v22 then
			v7.Notify({
				ChatMessage = true,
				Preset = "Red",
				Message = ("You lost your %* day streak!"):format(v22)
			})
		end
		v22 = p1
	end)
	v10.stateToProperty({
		Property = "Visible",
		Instance = DiscordContainer,
		State = v17
	})
	v10.stateToProperty({
		Property = "Visible",
		Instance = DiscordContainer.StatusLabel,
		State = v16
	})
	v10.stateToProperty({
		Property = "Visible",
		Instance = ContainerFrame.TabButtons.DailyBonus,
		State = PolicyInfo:derive(function(p1) --[[ Line: 283 | Upvalues: v14 (ref) ]]
			local v1 = nil
			local v2 = (if v1 then v1 elseif typeof(p1) == "table" then true else false) and p1.AreAdsAllowed
			if v14 then
				warn(v2, p1)
			end
			return v2
		end)
	})
end
t:Init()
return t