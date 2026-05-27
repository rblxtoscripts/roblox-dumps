-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("AnimalGridButton")
local v4 = Sonar("Button")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("FormatNumber")
local v7 = Sonar("FormatString")
local v8 = Sonar("GuiManager")
local v9 = Sonar("GuiUtils")
local v10 = Sonar("InstanceUtils")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("ItemGridButton")
local v13 = Sonar("Maid")
local v14 = Sonar("MarketplaceUtils")
local v15 = Sonar("NewMissionsService")
local v16 = Sonar("NotificationsClient")
local v17 = Sonar("PlayerUtils")
local v18 = Sonar("PlayerWrapper")
local v19 = Sonar("PromptClient")
local v20 = Sonar("RemoteUtils")
local v21 = Sonar("ShopService")
local v22 = Sonar("State")
local v23 = Sonar("StateUtils")
local v24 = Sonar("StorageUtils")
local v25 = Sonar("TimeUtils")
local v26 = Sonar("TutorialService")
local v27 = Sonar("Constants")
local v28 = v24.GetConfig("Events")()
local EventName = v27.EventName
local CurrentEvent = v27.CurrentEvent
local v29 = v28.EventsData[EventName]
local v30 = v29 and v29.Products or {}
local v31 = v18.GetClient()
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local v32 = v22.new("Featured")
local v33 = v22.new(false)
local v34 = v22.new(nil)
local v35 = v22.new("Missions")
local v36 = v20.GetRemoteFunction("PlayerGiftRemote")
local v37 = v20.GetRemoteFunction("ReplayEventMission")
local v38 = v20.GetRemoteFunction("SkipEventMission")
local v39 = ""
local v40 = ""
local v41 = setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 66 | Upvalues: PlayerGui (copy) ]]
		local EventMissionsGui = PlayerGui.EventMissionsGui
		local v1 = EventMissionsGui[p2]
		if typeof(v1) == "function" then
			local v2 = v1
			v1 = function(p1, ...) --[[ Line: 75 | Upvalues: v2 (copy), EventMissionsGui (copy) ]]
				return v2(EventMissionsGui, ...)
			end
		end
		return v1
	end
})
local function setupButtonHover(p1, p2) --[[ setupButtonHover | Line: 85 | Upvalues: v22 (copy), v1 (copy) ]]
	local v12 = p2:FindFirstChildWhichIsA("UIScale")
	if v12 then
		p1:GiveTask(p1:GiveTask(v22.fromProperty(p2, "GuiState")):subscribe(function(p1) --[[ Line: 91 | Upvalues: v1 (ref), v12 (copy) ]]
			local t = {}
			t.Scale = if p1 == Enum.GuiState.Idle then 1 else 1.2
			v1.target(v12, 1, 6, t)
		end))
	end
end
local function setupMissionTab(p1, p2, p3) --[[ setupMissionTab | Line: 97 | Upvalues: v31 (copy), v13 (copy), v15 (copy), v22 (copy), v10 (copy), setupButtonHover (copy), v7 (copy), v25 (copy), v11 (copy), EventName (copy), v29 (copy), v2 (copy), v3 (copy), v12 (copy), v23 (copy), v1 (copy), v4 (copy), v37 (copy), v14 (copy), LocalPlayer (copy), v38 (copy), v34 (copy) ]]
	local Template = p2.ScrollingFrame.Template
	local v16 = p1:GiveTask(v31.NewMissionsWrapper:GetMissionsChangedSignal())
	local NewMissions = v31.PlayerData.NewMissions
	local v24 = p1:GiveTask(v13.new())
	local function onMissionsChanged() --[[ onMissionsChanged | Line: 104 | Upvalues: v24 (copy), v31 (ref), NewMissions (copy), v15 (ref), p3 (copy), v13 (ref), v22 (ref), Template (copy), v10 (ref), setupButtonHover (ref), v7 (ref), v25 (ref), v11 (ref), EventName (ref), v29 (ref), v2 (ref), p1 (copy), v3 (ref), v12 (ref), v23 (ref), v1 (ref), v4 (ref), v37 (ref), v14 (ref), LocalPlayer (ref), v38 (ref), v34 (ref), p2 (copy) ]]
		local t = {}
		for v16, v26 in { v24._tasks, v31.PlayerData.NewMissions:GetChildren() } do
			for v32, v42 in v26 do
				for v5, v6 in { v32, v42 } do
					if typeof(v6) == "Instance" and not table.find(t, v6) then
						table.insert(t, v6)
					end
				end
			end
		end
		for v72, v8 in t do
			if v8:IsDescendantOf(NewMissions) then
				if not v24[v8] then
					local MissionName = v8.MissionName.Value
					local v9 = v15.GetMissionData(MissionName)
					if v9 then
						local MissionTier = v9.MissionTier
						if table.find(p3, v9.Category) then
							local v102 = v31.NewMissionsWrapper:GetMission(MissionName)
							local v112 = v13.new()
							local v122 = v112:GiveTask(v22.new(v102:ArePrerequisitesMet()))
							v112:GiveTask(v112:GiveTask(v102:GetPrerequisitesMetChangedSignal()):Connect(function() --[[ Line: 152 | Upvalues: v122 (copy), v102 (copy) ]]
								v122:set(v102:ArePrerequisitesMet())
							end))
							local v132 = v112:GiveTask(Template:Clone())
							local v142 = table.unpack(v10.GetAllTagged(v132, "Actions"))
							local v152 = table.unpack(v10.GetAllTagged(v142, "Replay"))
							local v16 = table.unpack(v10.GetAllTagged(v142, "Skip"))
							local v17 = table.unpack(v10.GetAllTagged(v142, "View"))
							setupButtonHover(v112, v16)
							setupButtonHover(v112, v17)
							local Locked = v132.Container.Content.Locked
							local v18 = v10.GetAllTagged(Locked.Content.Title, "Title")
							local Mission = v132.Container.Content.Mission
							local v19 = v10.GetAllTagged(Mission.Content.Title, "Title")
							local v20 = table.unpack(v10.GetAllTagged(v132, "Reward"))
							local v21 = table.unpack(v10.GetAllTagged(v20, "Locked"))
							local v222 = table.unpack(v10.GetAllTagged(v20, "Icon"))
							local v232 = v132.Container.Content.Container.Content.Reward.Content
							local Complete = v232.Complete
							local v26 = v7.separateWordsInString(v102.MissionData.Name)
							for v27, v28 in v19 do
								v28.Text = v26
							end
							local v292 = v102:GetReward()
							local RewardData = v102.RewardData
							local v30 = v112:GiveTask(v13.new())
							local UIPageLayout = v222.UIPageLayout
							local v312 = v112:GiveTask(v22.new(false))
							local v32 = v112:GiveTask(v22.new(false))
							local v33 = v112:GiveTask(v22.new(false))
							local v342 = v112:GiveTask(v22.fromProperty(v25.ValueBase, "Value"))
							local v35 = v112:GiveTask(v22.new(false))
							v112:GiveTask(v342:subscribe(function(p1, p2) --[[ Line: 199 | Upvalues: v9 (copy), v35 (copy) ]]
								p2:add(task.defer(function() --[[ Line: 200 | Upvalues: v9 (ref), v35 (ref) ]]
									v35:set(DateTime.now().UnixTimestamp >= v9.UnlockTime.UnixTimestamp)
								end))
							end))
							v112:GiveTask(v22.subscribeMulti({ v35, v342 }, function(p1) --[[ Line: 208 | Upvalues: v102 (copy), v7 (ref), v9 (copy), v25 (ref), v18 (copy) ]]
								local v1
								if v102:ArePrerequisitesMet() then
									v1 = ""
								else
									local MissionName = table.remove((v102:GetRequiredMissions())).MissionName
									v1 = ("You must complete \"<i>%*</i>\" to unlock this mission!"):format((v7.separateWordsInString(MissionName)))
								end
								if not p1 then
									v1 = ("\240\159\149\157 Unlocks in: %*"):format((v25.FormatDHMS(v9.UnlockTime.UnixTimestamp - DateTime.now().UnixTimestamp)))
								end
								for v72, v8 in v18 do
									v8.Text = v1
								end
							end))
							local v36 = v112:GiveTask(v22.deriveMulti({ v122, v35 }, function(p1, p2) --[[ Line: 238 | Upvalues: v9 (copy), v102 (copy) ]]
								local v1 = DateTime.now().UnixTimestamp < v9.UnlockTime.UnixTimestamp
								return nil or v1 or (if v102:ArePrerequisitesMet() == false then true else false)
							end))
							for v372 in RewardData do
								v33:set(string.find(v372, "BreedingLicense") and true or false)
								if v33:get() then
									local v382 = v11.GetByName(v372)
									local v39 = v31:GetItemValue(v372)
									if v382 and v39 then
										local v40 = v112:GiveTask(v22.fromProperty(v39, "Value"))
										v32:set(nil or (if v382.Rarity.Name == EventName then true else false) or v382.Rarity.Name == v29.Data.EventRarityName)
										v312 = v112:GiveTask(v22.derive(v40, function(p1) --[[ Line: 270 ]]
											return p1 > 0
										end))
										break
									end
								end
							end
							local ShowMissionRewards = v9.ShowMissionRewards
							local v43 = v112:GiveTask(v102:GetRepetitionsChangedSignal())
							local v44 = v112:GiveTask(v22.new(0))
							v112:GiveTask(v43:Connect(function() --[[ Line: 282 | Upvalues: v44 (copy), v102 (copy) ]]
								v44:set(v102:GetRepetitions())
							end))
							v112:GiveTask(v22.subscribeMulti({ v36, v33, v32, v312, v44 }, function(p12, p2, p3, p4, p5) --[[ Line: 286 | Upvalues: v292 (copy), v30 (copy), ShowMissionRewards (copy), RewardData (copy), v11 (ref), v2 (ref), v31 (ref), p1 (ref), v222 (copy), v3 (ref), v12 (ref), UIPageLayout (copy), Locked (copy), v21 (copy), v142 (copy), v16 (copy), v17 (copy), Mission (copy) ]]
								local v1 = v292
								v30:DoCleaning()
								if p2 and not ShowMissionRewards then
									local v22 = nil
									for v32 in RewardData do
										if string.find(v32, "BreedingLicense") then
											v22 = v32
											break
										end
									end
									if p3 or not p4 then
										v1 = {
											{
												Name = v22,
												Amount = RewardData[v22]
											}
										}
									end
								end
								for v4, v5 in v1 do
									local v6 = v11.GetByName(v5.Name)
									local v7 = v2.GetByName(v5.Name)
									if v6 or v7 then
										if v7 then
											local t = {}
											for v8, v9 in v5.ExtraData do
												if v8 == "Presets" then
													v8 = "Preset"
												end
												t[v8] = v9
											end
											t.DoNotIncrementCount = true
											t.DoNotParent = true
											local v10 = v30:GiveTask(v2.CreateSlot(v31, t))
											local v112 = p1:GiveTask(v222.Default:Clone())
											v30:GiveTask(v3.new({
												DoNotClone = true,
												SpeciesAsName = true,
												GuiObject = v112,
												SlotValue = v10,
												ViewportFrame = v112.Content.HorseViewport.Viewport
											}))
											v112.Content.Viewport.Visible = false
											v112.Content.HorseViewport.Visible = true
											v112.Content.HorseViewport.Viewport.Visible = true
											v112.Parent = v222
											v112.Visible = true
											continue
										end
										v30:GiveTask(v12.new({
											ForceVisible = true,
											Item = v6,
											ParentFrame = v222,
											GetAmount = function() --[[ GetAmount | Line: 358 | Upvalues: v5 (copy) ]]
												return v5.Amount
											end
										}))
									end
								end
								v30:GiveTask(task.spawn(function() --[[ Line: 366 | Upvalues: v1 (ref), UIPageLayout (ref) ]]
									while #v1 > 0 do
										pcall(UIPageLayout.Next, UIPageLayout)
										task.wait(4)
									end
								end))
								Locked.Visible = if p12 == true then true else false
								v21.Visible = if p12 == true and p2 == false then if ShowMissionRewards == false then true else false else false
								v142.Visible = if p12 == false then true else false
								v16.Visible = v142.Visible
								v17.Visible = v142.Visible
								Mission.Visible = if p12 == false then true else false
								v222.Visible = if ShowMissionRewards == true or (p12 == false or p2 == true) then true else p5 > 0
							end))
							local v45 = v112:GiveTask(v22.new(0))
							local v46 = v112:GiveTask(v22.new(0))
							local v47 = v112:GiveTask(v102:GetChangedSignal())
							local Progress = Mission.Content.Progress
							local v48 = v10.GetAllTagged(Progress.Content.ProgressBars.InProgress, "UIGradient")
							local v49 = v10.GetAllTagged(Progress.Content.ProgressBars.Completed, "UIGradient")
							local Status = Progress.Content.Status
							local UIStroke = Status.UIStroke
							v112:GiveTask(v23.stateToProperty({
								Property = "Offset",
								State = v45,
								Instances = v48,
								Transform = function(p1) --[[ Transform | Line: 401 ]]
									return Vector2.xAxis * p1
								end
							}))
							v112:GiveTask(v23.stateToProperty({
								Property = "Offset",
								State = v46,
								Instances = v49,
								Transform = function(p1) --[[ Transform | Line: 411 ]]
									return Vector2.xAxis * p1
								end
							}))
							v112:GiveTask(v23.subscribeToSignals({
								Signals = { v47 },
								Callback = function() --[[ Callback | Line: 419 | Upvalues: v102 (copy), v1 (ref), v45 (copy), v46 (copy), v16 (copy), v36 (copy), v17 (copy), v152 (copy), v9 (copy), Status (copy), UIStroke (copy), Progress (copy), v232 (copy), Complete (copy) ]]
									local v12 = v102:GetTasks()
									local sum = 0
									for v2, v3 in v12 do
										sum = sum + v3:GetGoalProgress()
									end
									local v4 = if #v12 > 0 then sum / #v12 or 0 else 0
									local v5 = v102:IsComplete() or v102:IsClaimed()
									local v6 = v102:IsClaimed()
									v1.targetState(v45, 1, 3, if v5 then 0 else v4)
									v1.targetState(v46, 1, 3, if v5 then 1 else 0)
									v16.Visible = not v5 and not v36:get()
									v17.Visible = not v6 and not v36:get()
									v152.Visible = if v6 then not v36:get() and v9.Replayable == true else v6
									local FontFace = Status.FontFace
									local v21 = Font.new(FontFace.Family, FontFace.Weight, Enum.FontStyle.Italic)
									if v6 then
										Status.TextTransparency = 1
										UIStroke.Transparency = 1
										Status.FontFace = v21
										Status.Text = "Claimed!"
										Status.TextColor3 = Progress.Content.ProgressBars.InProgress.BackgroundColor3
										UIStroke.Color = Progress.Content.ProgressBars.InProgress.BackgroundColor3
										v1.target(Status, 1, 3, {
											TextTransparency = 0
										})
										v1.target(UIStroke, 1, 3, {
											Transparency = 0
										})
										for v22, v23 in v232:GetChildren() do
											if v23:IsA("GuiObject") and v23 ~= Complete then
												v23.Visible = false
											end
										end
										Complete.ImageTransparency = 1
										Complete.Visible = true
										v1.target(Complete, 1, 3, {
											ImageTransparency = 0
										})
									else
										if v5 then
											Status.FontFace = v21
											Status.TextColor3 = Color3.fromRGB(255, 255, 255)
											UIStroke.Color = Color3.fromRGB(255, 255, 255)
											Status.Text = "Ready to Claim!"
										else
											Status.FontFace = FontFace
											Status.TextColor3 = Color3.fromRGB(255, 255, 255)
											UIStroke.Color = Color3.fromRGB(255, 255, 255)
											Status.Text = ("%*%%"):format((string.format("%.0f", (math.min(100, v4 * 100)))))
										end
										Complete.Visible = false
									end
								end
							}))
							v112:GiveTask(v4.new(v152, {
								Click = function() --[[ Click | Line: 482 | Upvalues: v37 (ref), MissionName (copy), v14 (ref), LocalPlayer (ref) ]]
									if not v37:InvokeServer(MissionName) then
										return
									end
									local v1 = v14.GetProductFromName("ReplayEventMission")
									if v1 then
										v14.PromptPurchase(LocalPlayer, v1.ProductId, "Product")
									end
								end
							}))
							v112:GiveTask(v4.new(v16, {
								Click = function() --[[ Click | Line: 501 | Upvalues: v38 (ref), MissionName (copy), MissionTier (copy), v14 (ref), LocalPlayer (ref) ]]
									if not v38:InvokeServer(MissionName) then
										return
									end
									local v2 = v14.GetProductFromName((("SkipEventMissionTier%*"):format(MissionTier)))
									if v2 then
										v14.PromptPurchase(LocalPlayer, v2.ProductId, "Product")
									end
								end
							}))
							v112:GiveTask(v4.new(v17, {
								Click = function() --[[ Click | Line: 520 | Upvalues: v34 (ref), MissionName (copy) ]]
									v34:set(MissionName)
								end
							}))
							v132.Name = MissionName
							v132.Visible = true
							v132.Parent = p2.ScrollingFrame
							v24[v8] = v112
						end
					end
				end
				continue
			end
			v24[v8] = nil
		end
		local function getUnlockTime(p1) --[[ getUnlockTime | Line: 539 | Upvalues: v15 (ref) ]]
			local v1 = v15.GetMissionData(p1)
			local v2 = if v1 then v1.UnlockTime else v1
			if typeof(v2) == "DateTime" then
				return v2.UnixTimestamp
			else
				return v2 or 0
			end
		end
		local function sortByUnlockTime(p1) --[[ sortByUnlockTime | Line: 550 | Upvalues: v15 (ref) ]]
			table.sort(p1, function(p1_2_2, p2_2_2) --[[ Line: 551 | Upvalues: v15 (ref) ]]
				local v1 = v15.GetMissionData(p1_2_2)
				local v2 = if v1 then v1.UnlockTime else v1
				local v3 = if typeof(v2) == "DateTime" then v2.UnixTimestamp else v2 or 0
				local v4 = v15.GetMissionData(p2_2_2)
				local v5 = if v4 then v4.UnlockTime else v4
				return v3 < (if typeof(v5) == "DateTime" then v5.UnixTimestamp else v5 or 0)
			end)
		end
		local t2 = {}
		local t3 = {}
		local t4 = {}
		local t5 = {}
		local v50 = 0
		for v51, v52 in p2.ScrollingFrame:GetChildren() do
			if v52:IsA("GuiObject") and v52.Name ~= "Template" then
				t2[v52.Name] = v52
			end
		end
		for v53 in t2 do
			local v54 = v15.GetMissionData(v53)
			local v55 = v54 and v54.RequiredMissions
			local v56 = true
			if v55 then
				for v57, v58 in v55 do
					if t2[v58] then
						v56 = false
						t3[v58] = t3[v58] or {}
						table.insert(t3[v58], v53)
					end
				end
			end
			if v56 then
				table.insert(t4, v53)
			end
		end
		table.sort(t4, function(p1_2_2, p2_2_2) --[[ Line: 551 | Upvalues: v15 (ref) ]]
			local v1 = v15.GetMissionData(p1_2_2)
			local v2 = if v1 then v1.UnlockTime else v1
			local v3 = if typeof(v2) == "DateTime" then v2.UnixTimestamp else v2 or 0
			local v4 = v15.GetMissionData(p2_2_2)
			local v5 = if v4 then v4.UnlockTime else v4
			return v3 < (if typeof(v5) == "DateTime" then v5.UnixTimestamp else v5 or 0)
		end)
		for v61, v62 in t3 do
			table.sort(v62, function(p1_2_2, p2_2_2) --[[ Line: 551 | Upvalues: v15 (ref) ]]
				local v1 = v15.GetMissionData(p1_2_2)
				local v2 = if v1 then v1.UnlockTime else v1
				local v3 = if typeof(v2) == "DateTime" then v2.UnixTimestamp else v2 or 0
				local v4 = v15.GetMissionData(p2_2_2)
				local v5 = if v4 then v4.UnlockTime else v4
				return v3 < (if typeof(v5) == "DateTime" then v5.UnixTimestamp else v5 or 0)
			end)
		end
		local function v63(p1) --[[ assignOrder | Line: 590 | Upvalues: t5 (copy), t2 (copy), v50 (ref), t3 (copy), v63 (copy) ]]
			if t5[p1] or not t2[p1] then
				return
			end
			t5[p1] = true
			v50 = v50 + 1
			t2[p1].LayoutOrder = v50
			for v2, v3 in t3[p1] or {} do
				v63(v3)
			end
		end
		for v64, v65 in t4 do
			v63(v65)
		end
	end
	v16:GiveTask(v16:Connect(onMissionsChanged))
	onMissionsChanged()
end
local t2 = {
	Currency = function(p1, p2) --[[ Currency | Line: 615 | Upvalues: v30 (copy), v14 (copy), CurrentEvent (copy), v5 (copy), LocalPlayer (copy), v19 (copy), v9 (copy), v13 (copy), v4 (copy), v36 (copy), v17 (copy), Players (copy), v7 (copy), v6 (copy) ]]
		local t = {}
		for v1, v2 in v30 do
			if v2.ProductType == "EventCurrency" then
				table.insert(t, v2)
			end
		end
		table.sort(t, function(p1, p2) --[[ Line: 626 ]]
			return p1.Rewards[1].Amount < p2.Rewards[1].Amount
		end)
		for v3, v42 in t do
			p1:GiveTask(task.spawn(function() --[[ Line: 631 | Upvalues: v14 (ref), v42 (copy), p2 (copy), v3 (copy), CurrentEvent (ref), p1 (copy), v5 (ref), LocalPlayer (ref), v19 (ref), v9 (ref), v13 (ref), v4 (ref), v36 (ref), v17 (ref), Players (ref), v7 (ref), v6 (ref) ]]
				local v1 = v14.GetProductInfo(v42.ProductId, Enum.InfoType.Product)
				local v32 = p2.Content[tostring(v3)]
				v32.UIGradient.Color = CurrentEvent.UICosmetics.CurrencyColor
				v32.Buy.Top.TextLabel.Text = ("%* %*"):format(utf8.char(57346), v1.PriceInRobux)
				p1:GiveTask(v5.new(v32.Buy, {
					Click = function() --[[ Click | Line: 640 | Upvalues: v14 (ref), LocalPlayer (ref), v42 (ref) ]]
						v14.PromptPurchase(LocalPlayer, v42.ProductId, "Product")
					end
				}))
				p1:GiveTask(v5.new(v32.GiftButton, {
					Click = function() --[[ Click | Line: 646 | Upvalues: v19 (ref), v9 (ref), v13 (ref), LocalPlayer (ref), v4 (ref), v36 (ref), v42 (ref), v14 (ref), v17 (ref), Players (ref), v7 (ref), v1 (copy) ]]
						v19.Prompt({
							Type = "GiftPlayer",
							Close = function() --[[ Close | Line: 650 ]]
								return true
							end,
							Setup = function(p1, p2) --[[ Setup | Line: 654 | Upvalues: v9 (ref), v13 (ref), LocalPlayer (ref), v4 (ref), v36 (ref), v42 (ref), v14 (ref), v19 (ref), v17 (ref), Players (ref), v7 (ref), v1 (ref) ]]
								v9.manageCanvasSize(p1.Content.ScrollingFrame.UIListLayout, {
									y = true
								})
								local Default = p1.Content.ScrollingFrame.Default
								local v12 = v13.new()
								local function onPlayerAdded(p1) --[[ onPlayerAdded | Line: 660 | Upvalues: LocalPlayer (ref), v12 (copy), v13 (ref), Default (copy), v4 (ref), v36 (ref), v42 (ref), v14 (ref), v19 (ref), v17 (ref) ]]
									if p1 ~= LocalPlayer then
										v12[p1.UserId] = v13.new()
										local UserId = p1.UserId
										local v1 = v12[UserId]
										local v2 = v1:GiveTask(Default:Clone())
										v1:GiveTask(v4.new(v2.GiftButton, {
											Click = function() --[[ Click | Line: 672 | Upvalues: v36 (ref), UserId (copy), v42 (ref), v14 (ref), LocalPlayer (ref), v19 (ref) ]]
												if v36:InvokeServer(UserId, v42.ProductId) then
													v14.PromptPurchase(LocalPlayer, v42.ProductId, "Product")
													v19.Close()
												end
											end
										}))
										v2.PlayerIcon.Image = v17.GetUserThumbnail(math.abs(UserId), "AvatarBust")
										v2.Label.Text = p1.Name
										v2.Name = p1.UserId
										v2.Visible = true
										v2.Parent = Default.Parent
									end
								end
								local function onPlayerRemoving(p1) --[[ onPlayerRemoving | Line: 692 | Upvalues: LocalPlayer (ref), v12 (copy) ]]
									if p1 ~= LocalPlayer then
										v12[p1.UserId] = nil
									end
								end
								v12:GiveTask(Players.PlayerAdded:Connect(onPlayerAdded))
								v12:GiveTask(Players.PlayerRemoving:Connect(onPlayerRemoving))
								for v2, v3 in Players:GetPlayers() do
									onPlayerAdded(v3)
								end
								p1.Content.Gift.Content.NameLabel.Text = v7.separateWordsInString(v1.Name)
								p1.Content.Gift.Content.PriceLabel.Text = v14.GetPriceForProduct(v42.ProductId, true, true)
								v12:GiveTask(task.spawn(function() --[[ Line: 710 | Upvalues: v14 (ref), v42 (ref), p1 (copy) ]]
									p1.Content.Gift.Icon.Image = "rbxassetid://" .. v14.GetProductInfo(v42.ProductId, Enum.InfoType.Product).IconImageAssetId
								end))
								p2.Maid:GiveTask(v12)
							end
						})
					end
				}))
				v32.Icon.Image = CurrentEvent.UICosmetics.CurrencyImage
				v32.IconBG.Image = CurrentEvent.UICosmetics.CurrencyImage
				v32.AmountLabel.Text = ("$%*"):format((v6.splice(v42.Rewards[1].Amount)))
				v32.Visible = true
			end))
		end
	end,
	Featured = function(p1, p2) --[[ Featured | Line: 730 | Upvalues: v22 (copy), v13 (copy), v30 (copy), v31 (copy), v21 (copy), v25 (copy), v7 (copy), v11 (copy), v14 (copy), v5 (copy), LocalPlayer (copy), v19 (copy), v4 (copy), v36 (copy), v17 (copy), Players (copy), v10 (copy), v1 (copy), CurrentEvent (copy), EventName (copy), v16 (copy) ]]
		local Items = p2.Items
		local ItemDefault = Items.ItemDefault
		local Bundles = p2.Bundles
		local UIGridLayout = Bundles.UIGridLayout
		local FeaturedBundleDefault = Bundles.FeaturedBundleDefault
		local v12 = p1:GiveTask(v22.fromProperty(UIGridLayout, "AbsoluteContentSize"))
		local v2 = p1:GiveTask(v13.new())
		local v3 = p1:GiveTask(v22.new(0))
		for v42, v52 in { "ChildAdded", "ChildRemoved" } do
			p1:GiveTask(Bundles[v52]:Connect(function() --[[ Line: 743 | Upvalues: p1 (copy), v52 (copy), v3 (copy), Bundles (copy) ]]
				p1[("_bundlesFrame%*"):format(v52)] = task.defer(function() --[[ Line: 744 | Upvalues: v3 (ref), Bundles (ref) ]]
					v3:set(#Bundles:GetChildren())
				end)
			end))
		end
		p1:GiveTask(v22.subscribeMulti({ v12, v3 }, function() --[[ Line: 750 | Upvalues: v2 (copy), Bundles (copy), UIGridLayout (copy) ]]
			v2._thread = task.defer(function() --[[ Line: 751 | Upvalues: Bundles (ref), UIGridLayout (ref) ]]
				UIGridLayout.CellSize = UDim2.fromScale(1 / math.max(0, #Bundles:GetChildren() - 2), 0.95)
			end)
		end))
		local t = {}
		for v6, v72 in v30 do
			local ProductType = v72.ProductType
			if ProductType == "EventBundle" or (ProductType == "EventCapsule" or ProductType == "Items") then
				table.insert(t, v72)
			end
		end
		table.sort(t, function(p1, p2) --[[ Line: 771 ]]
			return p1.ProductId < p2.ProductId
		end)
		for v8, v9 in t do
			p1:GiveTask(p1:GiveTask(v22.fromProperty(v31.PlayerData.ProductPurchases[v9.Name], "Value")):subscribe(function(p1, p2) --[[ Line: 779 | Upvalues: v9 (copy), v21 (ref), v22 (ref), v25 (ref), FeaturedBundleDefault (copy), v7 (ref), v8 (copy), Bundles (copy), v11 (ref), v14 (ref), v5 (ref), LocalPlayer (ref), v19 (ref), v13 (ref), v4 (ref), v36 (ref), v17 (ref), Players (ref), ItemDefault (copy), Items (copy) ]]
				if v9.ProductType == "EventBundle" then
					local v1 = v21.ResolveEventBundleRewards(v9, p1)
					if not v1 or #v1 == 0 then
						return
					end
					local v2 = p2:add(v22.fromProperty(v25.ValueBase, "Value"))
					local v3 = p2:add(v22.new(false))
					local v42 = p2:add(FeaturedBundleDefault:Clone())
					v42.Name = v9.Name
					v42.Title.Text = v7.separateWordsInString(v9.Name)
					v42.LayoutOrder = v8
					v42.Visible = true
					p2:add(v2:subscribe(function(p1, p2) --[[ Line: 797 | Upvalues: v9 (ref), v3 (copy) ]]
						p2:add(task.defer(function() --[[ Line: 798 | Upvalues: v9 (ref), v3 (ref) ]]
							local UnixTimestamp_3 = DateTime.now().UnixTimestamp
							v3:set(if v9.StartTime.UnixTimestamp <= UnixTimestamp_3 then UnixTimestamp_3 <= v9.EndTime.UnixTimestamp else false)
						end))
					end))
					p2:add(v3:subscribe(function(p1) --[[ Line: 809 | Upvalues: v42 (ref), Bundles (ref) ]]
						v42.Parent = if p1 then Bundles or nil else nil
					end))
					local BundleItems = v42.BundleItems
					local Default = BundleItems.Default
					for v52, v6 in v1 do
						local v72 = v11.GetByName(v6.Name)
						if v72 then
							local v82 = p2:add(Default:Clone())
							v82.Icon.Image = v72.Image
							local v92 = v7.separateWordsInString(v72.Name)
							local Theme = v82:FindFirstChild("Theme")
							if v6.Theme then
								local v10 = v11.GetByName(v6.Theme)
								if v10 then
									v92 = v92 .. " (" .. v7.separateWordsInString(v6.Theme) .. ")"
									if Theme then
										local ImageLabel = Theme:FindFirstChild("ImageLabel")
										if ImageLabel and v10.Texture then
											ImageLabel.Image = v10.Texture
											local UIGradient = ImageLabel:FindFirstChild("UIGradient")
											if UIGradient then
												UIGradient.Enabled = false
											end
										elseif ImageLabel then
											ImageLabel.Image = ""
											local UIGradient = ImageLabel:FindFirstChild("UIGradient")
											if UIGradient and v10.ColorSequence then
												UIGradient.Color = v10.ColorSequence
												UIGradient.Enabled = true
											end
										end
										Theme.Visible = true
									end
								end
							elseif Theme then
								Theme.Visible = false
							end
							if v72.ColorSequence then
								local UIGradient = v82.Icon:FindFirstChild("UIGradient")
								if UIGradient then
									UIGradient.Color = v72.ColorSequence
									UIGradient.Enabled = true
								end
							end
							v82.ItemName.Text = "x" .. (v6.Amount or 1) .. " " .. v92
							v82.Size = UDim2.fromScale(0.35, 1)
							v82.Visible = true
							v82.Parent = BundleItems
						end
					end
					local v112 = v14.GetPriceForProduct(v9.ProductId, true)
					v42.BuyButton.Top.TextLabel.Text = v112 or ""
					p2:add(v5.new(v42.BuyButton, {
						Click = function() --[[ Click | Line: 878 | Upvalues: v14 (ref), LocalPlayer (ref), v9 (ref) ]]
							v14.PromptPurchase(LocalPlayer, v9.ProductId, "Product")
						end
					}))
					p2:add(v5.new(v42.GiftButton, {
						Click = function() --[[ Click | Line: 884 | Upvalues: v19 (ref), v13 (ref), LocalPlayer (ref), v4 (ref), v36 (ref), v9 (ref), v14 (ref), v17 (ref), Players (ref), v7 (ref) ]]
							v19.Prompt({
								Type = "GiftPlayer",
								Close = function() --[[ Close | Line: 888 ]]
									return true
								end,
								Setup = function(p1, p2) --[[ Setup | Line: 893 | Upvalues: v13 (ref), LocalPlayer (ref), v4 (ref), v36 (ref), v9 (ref), v14 (ref), v19 (ref), v17 (ref), Players (ref), v7 (ref) ]]
									local Default = p1.Content.ScrollingFrame.Default
									local v1 = v13.new()
									local function onPlayerAdded(p1) --[[ onPlayerAdded | Line: 897 | Upvalues: LocalPlayer (ref), v1 (copy), v13 (ref), Default (copy), v4 (ref), v36 (ref), v9 (ref), v14 (ref), v19 (ref), v17 (ref) ]]
										if p1 ~= LocalPlayer then
											v1[p1.UserId] = v13.new()
											local UserId = p1.UserId
											local v12 = v1[UserId]
											local v2 = v12:GiveTask(Default:Clone())
											v12:GiveTask(v4.new(v2.GiftButton, {
												Click = function() --[[ Click | Line: 909 | Upvalues: v36 (ref), UserId (copy), v9 (ref), v14 (ref), LocalPlayer (ref), v19 (ref) ]]
													if v36:InvokeServer(UserId, v9.ProductId) then
														v14.PromptPurchase(LocalPlayer, v9.ProductId, "Product")
														v19.Close()
													end
												end
											}))
											v2.PlayerIcon.Image = v17.GetUserThumbnail(math.abs(UserId), "AvatarBust")
											v2.Label.Text = p1.Name
											v2.Name = p1.UserId
											v2.Visible = true
											v2.Parent = Default.Parent
										end
									end
									local function onPlayerRemoving(p1) --[[ onPlayerRemoving | Line: 929 | Upvalues: LocalPlayer (ref), v1 (copy) ]]
										if p1 ~= LocalPlayer then
											v1[p1.UserId] = nil
										end
									end
									v1:GiveTask(Players.PlayerAdded:Connect(onPlayerAdded))
									v1:GiveTask(Players.PlayerRemoving:Connect(onPlayerRemoving))
									for v2, v3 in Players:GetPlayers() do
										onPlayerAdded(v3)
									end
									p1.Content.Gift.Content.NameLabel.Text = v7.separateWordsInString(v9.Name)
									p1.Content.Gift.Content.PriceLabel.Text = v14.GetPriceForProduct(v9.ProductId, true, true)
									v1:GiveTask(task.spawn(function() --[[ Line: 947 | Upvalues: v14 (ref), v9 (ref), p1 (copy) ]]
										p1.Content.Gift.Icon.Image = "rbxassetid://" .. v14.GetProductInfo(v9.ProductId, Enum.InfoType.Product).IconImageAssetId
									end))
									p2.Maid:GiveTask(v1)
								end
							})
						end
					}))
				else
					local v12 = v11.GetByName(v9.Name)
					if v12 then
						local v132 = p2:add(ItemDefault:Clone())
						v132.Name = v9.Name
						v132.Visible = true
						v132.Parent = Items
						v132.ItemImage.Image = v12.Image
						v132.Amount.Text = "x1"
						v132.Sale.Visible = false
						v132.Title.Text = v7.separateWordsInString(v9.Name)
						local v142 = v14.GetPriceForProduct(v9.ProductId, true)
						v132.BuyButton.Top.TextLabel.Text = v142 or ""
						p2:add(v5.new(v132.BuyButton, {
							Click = function() --[[ Click | Line: 980 | Upvalues: v14 (ref), LocalPlayer (ref), v9 (ref) ]]
								v14.PromptPurchase(LocalPlayer, v9.ProductId, "Product")
							end
						}))
						p2:add(v5.new(v132.GiftButton, {
							Click = function() --[[ Click | Line: 986 | Upvalues: v19 (ref), v13 (ref), LocalPlayer (ref), v4 (ref), v36 (ref), v9 (ref), v14 (ref), v17 (ref), Players (ref), v7 (ref) ]]
								v19.Prompt({
									Type = "GiftPlayer",
									Close = function() --[[ Close | Line: 990 ]]
										return true
									end,
									Setup = function(p1, p2) --[[ Setup | Line: 994 | Upvalues: v13 (ref), LocalPlayer (ref), v4 (ref), v36 (ref), v9 (ref), v14 (ref), v19 (ref), v17 (ref), Players (ref), v7 (ref) ]]
										local Default = p1.Content.ScrollingFrame.Default
										local v1 = v13.new()
										local function onPlayerAdded(p1) --[[ onPlayerAdded | Line: 998 | Upvalues: LocalPlayer (ref), v1 (copy), v13 (ref), Default (copy), v4 (ref), v36 (ref), v9 (ref), v14 (ref), v19 (ref), v17 (ref) ]]
											if p1 ~= LocalPlayer then
												v1[p1.UserId] = v13.new()
												local UserId = p1.UserId
												local v12 = v1[UserId]
												local v2 = v12:GiveTask(Default:Clone())
												v12:GiveTask(v4.new(v2.GiftButton, {
													Click = function() --[[ Click | Line: 1010 | Upvalues: v36 (ref), UserId (copy), v9 (ref), v14 (ref), LocalPlayer (ref), v19 (ref) ]]
														if v36:InvokeServer(UserId, v9.ProductId) then
															v14.PromptPurchase(LocalPlayer, v9.ProductId, "Product")
															v19.Close()
														end
													end
												}))
												v2.PlayerIcon.Image = v17.GetUserThumbnail(math.abs(UserId), "AvatarBust")
												v2.Label.Text = p1.Name
												v2.Name = p1.UserId
												v2.Visible = true
												v2.Parent = Default.Parent
											end
										end
										local function onPlayerRemoving(p1) --[[ onPlayerRemoving | Line: 1030 | Upvalues: LocalPlayer (ref), v1 (copy) ]]
											if p1 ~= LocalPlayer then
												v1[p1.UserId] = nil
											end
										end
										v1:GiveTask(Players.PlayerAdded:Connect(onPlayerAdded))
										v1:GiveTask(Players.PlayerRemoving:Connect(onPlayerRemoving))
										for v2, v3 in Players:GetPlayers() do
											onPlayerAdded(v3)
										end
										p1.Content.Gift.Content.NameLabel.Text = v7.separateWordsInString(v9.Name)
										p1.Content.Gift.Content.PriceLabel.Text = v14.GetPriceForProduct(v9.ProductId, true, true)
										v1:GiveTask(task.spawn(function() --[[ Line: 1048 | Upvalues: v14 (ref), v9 (ref), p1 (copy) ]]
											p1.Content.Gift.Icon.Image = "rbxassetid://" .. v14.GetProductInfo(v9.ProductId, Enum.InfoType.Product).IconImageAssetId
										end))
										p2.Maid:GiveTask(v1)
									end
								})
							end
						}))
					end
				end
			end))
		end
		local v112 = p1:GiveTask(v22.new(v31:GetWithModifiers({
			Name = "GoldCoinsMultiplier",
			Default = 0
		})))
		local Boosts = p2.Boosts
		for v122, v132 in v30 do
			if v132.ProductType == "CurrencyBoost" then
				local v142 = ("%*Modifier"):format(v132.Name)
				local v15 = Boosts:FindFirstChild(v132.Name)
				local v162 = v15
				if v162 then
					v162 = table.unpack(v10.GetAllTagged(v15, "BuyButton"))
				end
				if v15 and v162 then
					p1:GiveTask(v31:GetModifierChangedSignal(v142):Connect(function() --[[ Line: 1080 | Upvalues: v1 (ref), v112 (copy), v31 (ref) ]]
						v1.targetState(v112, 1, 3, v31:GetWithModifiers({
							Name = "GoldCoinsMultiplier",
							Default = 0
						}))
					end))
					v15.Description.Text = v132.Description
					v15.UIGradient.Color = CurrentEvent.UICosmetics.CurrencyColor
					v15.ImageLabel.Image = CurrentEvent.UICosmetics.CurrencyImage
					v15.Title.Text = v7.separateWordsInString(v132.Name)
					p1:GiveTask(v5.new(v162, {
						Click = function() --[[ Click | Line: 1090 | Upvalues: v31 (ref), EventName (ref), v132 (copy), v7 (ref), v16 (ref), v14 (ref), LocalPlayer (ref) ]]
							if v132.MaximumPurchases and v132.MaximumPurchases <= v31.PlayerData.Events[EventName].CurrencyBoost[v132.Name].Value then
								v16.Notify({
									Preset = "Red",
									Message = ("You have reached the maximum number of purchases for the %* boost!"):format((v7.separateWordsInString(v132.Name)))
								})
							else
								v14.PromptPurchase(LocalPlayer, v132.ProductId, "Product")
							end
						end
					}))
					p1:GiveTask(task.spawn(function() --[[ Line: 1111 | Upvalues: v14 (ref), v132 (copy), v162 (copy) ]]
						local v1 = v14.GetProductInfo(v132.ProductId, Enum.InfoType.Product)
						v162.Top.TextLabel.Text = ("%* %*"):format(utf8.char(57346), v1.PriceInRobux)
					end))
				end
			end
		end
		p1:GiveTask(v112:subscribe(function(p1) --[[ Line: 1118 | Upvalues: Boosts (copy) ]]
			Boosts.Title.Text = ("Current Boost: %*%%"):format((tonumber(string.format("%.0f", p1 * 100))))
		end))
	end,
	Items = function(p1, p2) --[[ Items | Line: 1123 | Upvalues: CurrentEvent (copy), v21 (copy), v11 (copy), v22 (copy), v25 (copy), v7 (copy), v6 (copy), v5 (copy), v31 (copy), Sonar (copy), v16 (copy) ]]
		local ScrollingFrame = p2.ScrollingFrame
		local Default = ScrollingFrame.Default
		Default.Visible = false
		Default.BuyButton.Top.PriceFrame.AmountLabel.UIGradient.Color = CurrentEvent.UICosmetics.CurrencyColor
		local v1 = v21.GetItems("Event")
		if not v1 then
			return
		end
		local function applyThemeGradient(p1, p2) --[[ applyThemeGradient | Line: 1134 ]]
			local UIGradient = p1.ItemImage:FindFirstChild("UIGradient")
			if UIGradient and p2.ColorSequence then
				UIGradient.Color = p2.ColorSequence
				UIGradient.Enabled = true
			else
				UIGradient.Enabled = false
			end
		end
		for v2, v3 in v1 do
			local v4 = v3.Name
			local Price = v3.Price
			local v52 = v11.GetByName(v4)
			if v52 then
				local v62 = p1:GiveTask(v22.fromProperty(v25.ValueBase, "Value"))
				local v72 = p1:GiveTask(v22.new(false))
				local v8 = p1:GiveTask(Default:Clone())
				v8.Name = v4
				v8.LayoutOrder = Price
				v8.Parent = ScrollingFrame
				p1:GiveTask(v62:subscribe(function(p1, p2) --[[ Line: 1159 | Upvalues: v3 (copy), v72 (copy) ]]
					p2:add(task.defer(function() --[[ Line: 1160 | Upvalues: v3 (ref), v72 (ref) ]]
						local UnixTimestamp_3 = DateTime.now().UnixTimestamp
						v72:set(if v3.StartTime.UnixTimestamp <= UnixTimestamp_3 then UnixTimestamp_3 <= v3.EndTime.UnixTimestamp else false)
					end))
				end))
				p1:GiveTask(v72:subscribe(function(p1) --[[ Line: 1171 | Upvalues: v8 (copy) ]]
					v8.Visible = p1
				end))
				v8.ItemImage.Image = v52.Image
				v8.Title.Text = v7.separateWordsInString(v4)
				v8.Amount.Text = "x" .. (v3.Amount or 1)
				v8.Sale.Visible = false
				local UIGradient = v8.ItemImage:FindFirstChild("UIGradient")
				if UIGradient and v52.ColorSequence then
					UIGradient.Color = v52.ColorSequence
					UIGradient.Enabled = true
				else
					UIGradient.Enabled = false
				end
				local PriceFrame = v8.BuyButton.Top.PriceFrame
				PriceFrame.AmountLabel.Text = v6.splice(Price)
				local UIGradient_2 = PriceFrame:FindFirstChild("UIGradient")
				PriceFrame.Icon.Image = CurrentEvent.UICosmetics.CurrencyImage
				if UIGradient_2 then
					UIGradient_2.Rotation = 90
				end
				p1:GiveTask(v5.new(v8.BuyButton, {
					Click = function() --[[ Click | Line: 1194 | Upvalues: v21 (ref), v31 (ref), v4 (copy), Sonar (ref), v16 (ref), CurrentEvent (ref) ]]
						local v1 = v21.CanPurchaseEventItem(v31, v4)
						if v1 == true then
							v21:PurchaseEventItem(v4)
							return
						end
						if v1 == "MaxInventory" then
							Sonar("InventoryGui").UpgradeSlots()
							return
						end
						if v1 ~= "CannotAfford" then
							return
						end
						v16.Notify({
							Preset = "Red",
							Message = ("You don\'t have enough %* to buy this item!"):format(CurrentEvent.UICosmetics.CurrencyDisplayName)
						})
					end
				}))
			end
		end
	end
}
local t3 = {
	EventActivities = function(p1, p2) --[[ EventActivities | Line: 1218 | Upvalues: v29 (copy) ]]
		local ScrollingFrame = p2.ScrollingFrame
		ScrollingFrame.Template.Visible = false
		for v1, v2 in v29.Data.EventActivities do
			local v3 = p1:GiveTask(ScrollingFrame.Template:Clone())
			v3.Title.Text = v2.Name
			v3.Description.Text = v2.Description
			v3.Duration.Text = v2.Duration .. " Seconds"
			v3.ImageLabel.Image = v2.Image
			v3.Name = v2.Name
			v3.Visible = true
			v3.Parent = ScrollingFrame
		end
	end,
	EventShop = function(p1, p2) --[[ EventShop | Line: 1238 | Upvalues: v13 (copy), v4 (copy), v16 (copy), v32 (copy), t2 (copy) ]]
		local v2 = p2.TabFrames.Content
		local v3 = p1:GiveTask(v13.new())
		for v42, v5 in p2.TabButtons.Content:GetChildren() do
			if v5:IsA("GuiButton") then
				p1:GiveTask(v4.new(v5, {
					Click = function() --[[ Click | Line: 1250 | Upvalues: v5 (copy), v16 (ref), v32 (ref) ]]
						if v5.Name == "Gift" then
							v16.Notify({
								Message = "Gifting is not available yet! Come back soon!",
								Preset = "Red"
							})
						else
							v32:set(v5.Name)
						end
					end
				}))
			end
		end
		p1:GiveTask(v32:subscribe(function(p1) --[[ Line: 1264 | Upvalues: v3 (copy), v2 (copy), t2 (ref) ]]
			v3:DoCleaning()
			for v1, v22 in v2:GetChildren() do
				if v22:IsA("GuiObject") then
					v22.Visible = v22.Name == p1
				end
			end
			local v32 = t2[p1]
			if not v32 then
				return
			end
			v32(v3, v2[p1])
		end))
	end,
	Missions = function(p1, p2) --[[ Missions | Line: 1283 | Upvalues: setupMissionTab (copy) ]]
		setupMissionTab(p1, p2, { "EventMissions" })
	end,
	SpecialQuests = function(p1, p2) --[[ SpecialQuests | Line: 1289 | Upvalues: setupMissionTab (copy) ]]
		setupMissionTab(p1, p2, { "EventSpecialQuests", "EventHourlyMissions" })
	end,
	View = function(p1, p2) --[[ View | Line: 1296 | Upvalues: v34 (copy), v31 (copy), v10 (copy), setupButtonHover (copy), v2 (copy), v3 (copy), v11 (copy), v12 (copy), v22 (copy), v23 (copy), v1 (copy), v4 (copy), v15 (copy) ]]
		local v13 = v34:get()
		local v24 = v31.NewMissionsWrapper:GetMission(v13)
		local v32 = v24:GetTasks()
		local GetAllTagged = v10.GetAllTagged
		local v42 = table.unpack(GetAllTagged(p2, "Back"))
		local GetAllTagged_2 = v10.GetAllTagged
		local v5 = table.unpack(GetAllTagged_2(p2.Header, "Title"))
		local v6 = string.gsub(v13, "(%l)(%u)", "%1 %2")
		for v7, v8 in v10.GetAllTagged(v5, "Title") do
			v8.Text = v6
		end
		local Rewards = p2.Rewards
		local Icon = Rewards.Reward.Content.Icon
		local Claim = Rewards.Claim
		setupButtonHover(p1, Claim)
		local v9 = v24:GetReward()
		local UIPageLayout = Icon.UIPageLayout
		for v112, v122 in v9 or {} do
			local v14 = v122.Amount or 1
			if if v122.RewardType == "Species" then true else false then
				local t = {}
				for v16, v17 in v122.ExtraData do
					if v16 ~= "DefaultToRewardsIfAlreadyOwned" and v16 ~= "Rewards" then
						if v16 == "Presets" then
							v16 = "Preset"
						end
						t[v16] = v17
					end
				end
				t.Origin = "Wild"
				t.DoNotParent = true
				t.DoNotIncrementCount = true
				local v18 = p1:GiveTask(v2.CreateSlot(v31, t))
				local v19 = p1:GiveTask(Icon.Default:Clone())
				p1:GiveTask(v3.new({
					DoNotClone = true,
					SpeciesAsName = true,
					GuiObject = v19,
					SlotValue = v18,
					ViewportFrame = v19.Content.HorseViewport.Viewport
				}))
				v19.Content.Viewport.Visible = false
				v19.Content.HorseViewport.Visible = true
				v19.Content.HorseViewport.Viewport.Visible = true
				v19.Parent = Icon
				v19.Visible = true
				continue
			end
			local v20 = v11.GetByName(v122.Name)
			if v20 then
				p1:GiveTask(v12.new({
					ForceVisible = true,
					Item = v20,
					ParentFrame = Icon,
					GetAmount = function() --[[ GetAmount | Line: 1373 | Upvalues: v14 (copy) ]]
						return v14
					end
				}))
			end
		end
		p1:GiveTask(task.spawn(function() --[[ Line: 1380 | Upvalues: UIPageLayout (copy) ]]
			while pcall(UIPageLayout.Next, UIPageLayout) do
				task.wait(6)
			end
		end))
		local v21 = p1:GiveTask(v22.new(0))
		local v222 = p1:GiveTask(v22.new(0))
		local Progress = Rewards.Progress
		local v232 = v10.GetAllTagged(Progress.Content.ProgressBars.InProgress, "UIGradient")
		local v242 = v10.GetAllTagged(Progress.Content.ProgressBars.Completed, "UIGradient")
		local Status = Progress.Content.Status
		local UIStroke = Status.UIStroke
		p1:GiveTask(v23.stateToProperty({
			Property = "Offset",
			State = v21,
			Instances = v232,
			Transform = function(p1) --[[ Transform | Line: 1398 ]]
				return Vector2.xAxis * p1
			end
		}))
		p1:GiveTask(v23.stateToProperty({
			Property = "Offset",
			State = v222,
			Instances = v242,
			Transform = function(p1) --[[ Transform | Line: 1407 ]]
				return Vector2.xAxis * p1
			end
		}))
		local v25 = p1:GiveTask(v24:GetChangedSignal())
		p1:GiveTask(v23.subscribeToSignals({
			Signals = { v25 },
			Callback = function() --[[ Callback | Line: 1416 | Upvalues: v32 (copy), v24 (copy), v1 (ref), v21 (copy), v222 (copy), Claim (copy), Status (copy), UIStroke (copy), Progress (copy) ]]
				local sum = 0
				for v12, v2 in v32 do
					sum = sum + v2:GetGoalProgress()
				end
				local v3 = if #v32 > 0 then sum / #v32 or 0 else 0
				local v4 = v24:IsComplete() or v24:IsClaimed()
				local v5 = v24:IsClaimed()
				v1.targetState(v21, 1, 3, if v4 then 0 else v3)
				v1.targetState(v222, 1, 3, if v4 then 1 else 0)
				Claim.Visible = if v4 then not v5 else v4
				local FontFace = Status.FontFace
				local v16 = Font.new(FontFace.Family, FontFace.Weight, Enum.FontStyle.Italic)
				if v5 then
					Status.TextTransparency = 1
					UIStroke.Transparency = 1
					Status.FontFace = v16
					Status.Text = "Claimed!"
					Status.TextColor3 = Progress.Content.ProgressBars.InProgress.BackgroundColor3
					UIStroke.Color = Progress.Content.ProgressBars.InProgress.BackgroundColor3
					v1.target(Status, 1, 3, {
						TextTransparency = 0
					})
					v1.target(UIStroke, 1, 3, {
						Transparency = 0
					})
					return
				end
				if v4 then
					Status.FontFace = v16
					Status.TextColor3 = Color3.fromRGB(255, 255, 255)
					UIStroke.Color = Color3.fromRGB(255, 255, 255)
					Status.Text = "Ready to Claim!"
				else
					Status.FontFace = FontFace
					Status.TextColor3 = Color3.fromRGB(255, 255, 255)
					UIStroke.Color = Color3.fromRGB(255, 255, 255)
					Status.Text = ("%*%%"):format((string.format("%.0f", (math.min(100, v3 * 100)))))
				end
			end
		}))
		p1:GiveTask(v4.new(Claim, {
			Click = function() --[[ Click | Line: 1459 | Upvalues: v15 (ref), v13 (copy) ]]
				v15.RequestToClaimMission({
					MissionId = v13
				})
			end
		}))
		local Template = p2.Tasks.ScrollingFrame.Template
		local count = 0
		for v26, v27 in v32 do
			local v28 = p1:GiveTask(v27:GetChangedSignal())
			local v29 = p1:GiveTask(v22.new(0))
			local v30 = p1:GiveTask(v22.new(0))
			local v312 = count * 0.1
			local v322 = p1:GiveTask(Template:Clone())
			local GetAllTagged_3 = v10.GetAllTagged
			local v33 = table.unpack(GetAllTagged_3(v322, "Status"))
			local UIStroke_2 = v33.UIStroke
			local GetAllTagged_4 = v10.GetAllTagged
			local v342 = table.unpack(GetAllTagged_4(v322, "Title"))
			p1:GiveTask(v23.stateToProperty({
				Property = "Offset",
				State = v29,
				Instances = v10.GetAllTagged(v322.Progress.Content.ProgressBars.InProgress, "UIGradient"),
				Transform = function(p1) --[[ Transform | Line: 1484 ]]
					return Vector2.xAxis * p1
				end
			}))
			p1:GiveTask(v23.stateToProperty({
				Property = "Offset",
				State = v30,
				Instances = v10.GetAllTagged(v322.Progress.Content.ProgressBars.Completed, "UIGradient"),
				Transform = function(p1) --[[ Transform | Line: 1495 ]]
					return Vector2.xAxis * p1
				end
			}))
			p1:GiveTask(v23.subscribeToSignals({
				Signals = { v28 },
				Callback = function() --[[ Callback | Line: 1503 | Upvalues: v27 (copy), v312 (copy), v1 (ref), v29 (copy), v30 (copy), v33 (copy), UIStroke_2 (copy), v322 (copy), v10 (ref), v342 (copy) ]]
					local v12 = v27:IsComplete() or v27:IsClaimed()
					local v2 = v27:GetGoalProgress()
					task.delay(v312, function() --[[ Line: 1507 | Upvalues: v1 (ref), v29 (ref), v12 (copy), v2 (copy), v30 (ref), v33 (ref), UIStroke_2 (ref), v322 (ref) ]]
						v1.targetState(v29, 1, 3, if v12 then 0 else v2)
						v1.targetState(v30, 1, 3, if v12 then 1 else 0)
						if v12 then
							v33.TextTransparency = 1
							UIStroke_2.Transparency = 1
							v33.Text = "Completed"
							v33.TextColor3 = v322.Progress.Content.ProgressBars.InProgress.BackgroundColor3
							UIStroke_2.Color = v322.Progress.Content.ProgressBars.InProgress.BackgroundColor3
							v1.target(v33, 1, 3, {
								TextTransparency = 0
							})
							v1.target(UIStroke_2, 1, 3, {
								Transparency = 0
							})
						else
							v33.TextColor3 = Color3.fromRGB(255, 255, 255)
							UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
							v33.Text = ("%*%%"):format((string.format("%.0f", (math.min(100, v2 * 100)))))
						end
					end)
					local v3 = v27:GetDescription()
					for v4, v5 in v10.GetAllTagged(v342, "Title") do
						v5.Text = v3
					end
				end
			}))
			v322.LayoutOrder = v27.TaskId
			v322.Name = v27.TaskId
			v322.Visible = true
			v322.Parent = Template.Parent
			count = count + 1
		end
		p1:GiveTask(v4.new(v42, {
			Click = function() --[[ Click | Line: 1543 | Upvalues: v34 (ref) ]]
				v34:set(nil)
			end
		}))
	end
}
function v41._setupTabButtons(p1) --[[ _setupTabButtons | Line: 1551 | Upvalues: v22 (copy), v1 (copy), v4 (copy), v34 (copy), v35 (copy) ]]
	for v12, v2 in p1.Container.TabButtons.Content:GetChildren() do
		if v2:IsA("GuiButton") then
			local v3 = v2.Name
			local SlidingGradient = v2.Top.SlidingGradient
			local UIGradient = SlidingGradient.UIGradient
			local UIScale = v2.UIScale
			v22.fromProperty(v2, "GuiState"):subscribe(function(p1, p2) --[[ Line: 1564 | Upvalues: v1 (ref), UIScale (copy), SlidingGradient (copy), UIGradient (copy) ]]
				local v12 = if p1 == Enum.GuiState.Idle then true else false
				local v2 = if p1 == Enum.GuiState.Press then true else false
				local target = v1.target
				local t = {}
				t.Scale = if v2 then 0.9 else 1
				target(UIScale, 1, 6, t)
				if v12 then
					v1.stop(UIGradient, "Offset")
					SlidingGradient.Visible = false
					UIGradient.Offset = Vector2.new(-1.5, 0)
				else
					SlidingGradient.Visible = true
					UIGradient.Offset = Vector2.new(-1.5, 0)
					v1.target(UIGradient, 1, 3, {
						Offset = Vector2.new(1.5, 0)
					})
					p2:add(task.spawn(function() --[[ Line: 1575 | Upvalues: UIGradient (ref), v1 (ref) ]]
						while true do
							task.wait(3)
							UIGradient.Offset = Vector2.new(-1.5, 0)
							v1.target(UIGradient, 1, 3, {
								Offset = Vector2.new(1.5, 0)
							})
						end
					end))
				end
			end)
			v4.new(v2, {
				Click = function() --[[ Click | Line: 1590 | Upvalues: v34 (ref), v35 (ref), v3 (copy) ]]
					v34:set(nil)
					v35:set(v3)
				end
			})
		end
	end
end
function v41._setupTabFrames(p1) --[[ _setupTabFrames | Line: 1599 | Upvalues: v13 (copy), v22 (copy), v33 (copy), v34 (copy), v35 (copy), t3 (copy) ]]
	local v1 = v13.new()
	v22.subscribeMulti({ v33, v34, v35 }, function(p12, p2, p3) --[[ Line: 1602 | Upvalues: v1 (copy), p1 (copy), t3 (ref) ]]
		v1:DoCleaning()
		if not p12 then
			return
		end
		if p2 then
			p3 = "View"
		end
		for v12, v2 in p1.Container.TabFrames.Content:GetChildren() do
			if v2:IsA("GuiObject") then
				local v3 = t3[v2.Name]
				local isName = p3 == v2.Name
				v2.Visible = isName
				if isName then
					v3(v1, v2)
				end
			end
		end
	end)
end
function v41._setupTopFrame(p1) --[[ _setupTopFrame | Line: 1634 | Upvalues: v35 (copy), v7 (copy), v4 (copy) ]]
	local v1 = p1.Container.TopFrame.Content
	local Title = v1.Title
	v35:subscribe(function(p12) --[[ Line: 1640 | Upvalues: p1 (copy), Title (copy), v7 (ref) ]]
		if p12 == "View" then
			return
		end
		local UIGradient = p1.Container.TabButtons.Content[p12].Top.UIGradient
		for v1, v2 in { "Color", "Offset", "Rotation", "Transparency" } do
			Title.UIGradient[v2] = UIGradient[v2]
		end
		Title.Text = v7.separateWordsInString(p12)
	end)
	v4.new(v1.Close, {
		Click = p1.Close
	})
	v4.new(v1.Help, {
		Click = p1.OpenHelp
	})
end
function v41.Close(p1, ...) --[[ Close | Line: 1662 | Upvalues: v41 (copy), v34 (copy), v35 (copy), v32 (copy), v33 (copy), v8 (copy) ]]
	if p1 ~= v41 then
		p1 = v41
	end
	v34:set(nil)
	v35:set("Missions")
	v32:set("Featured")
	v33:set(false)
	v8.CloseMainFrame(p1.Container)
	p1.Container.UIScale.Scale = 1.2
end
function v41.SetPendingClaimableMission(p1, p2) --[[ SetPendingClaimableMission | Line: 1676 | Upvalues: v39 (ref) ]]
	v39 = p2
end
function v41.SetPendingClaimableTab(p1, p2) --[[ SetPendingClaimableTab | Line: 1681 | Upvalues: v40 (ref) ]]
	v40 = p2
end
function v41.Open(p1, p2, p3) --[[ Open | Line: 1686 | Upvalues: v41 (copy), v39 (ref), v40 (ref), v35 (copy), v32 (copy), v8 (copy), v33 (copy), v1 (copy), v9 (copy) ]]
	local v12, v2
	if p1 == v41 then
		v12 = p2
		v2 = p3
	else
		v12 = nil
		v2 = nil
	end
	if p1 ~= v41 then
		p1 = v41
	end
	local v3 = v39
	local v4 = v40
	if v3 ~= "" and not v12 then
		v12 = v4
	end
	v39 = nil
	v40 = nil
	if v12 then
		v35:set(v12)
	end
	if v2 then
		v32:set(v2)
	end
	v8.OpenMainFrame(p1.Container)
	v33:set(true)
	v1.target(p1.Container.UIScale, 1, 6, {
		Scale = 1.5
	})
	if not v3 then
		return
	end
	task.defer(function() --[[ Line: 1721 | Upvalues: p1 (ref), v4 (copy), v3 (copy), v9 (ref) ]]
		local v1 = p1.Container.TabFrames.Content:FindFirstChild(v4)
		if not v1 then
			return
		end
		local ScrollingFrame = v1.ScrollingFrame
		local v2 = ScrollingFrame:FindFirstChild(v3)
		if v2 then
			v9.scrollToGuiElement(ScrollingFrame, v2)
		end
	end)
end
function v41.OpenHelp(p1) --[[ OpenHelp | Line: 1741 | Upvalues: v41 (copy), v26 (copy) ]]
	v26.PromptPopupInfo("Event")
end
function v41.Init(p1) --[[ Init | Line: 1748 | Upvalues: v8 (copy) ]]
	p1.Container.UIScale.Scale = 1.2
	p1:_setupTabButtons()
	p1:_setupTabFrames()
	p1:_setupTopFrame()
	v8.AddFrame(p1.Container, {
		Blur = true,
		KeepPosition = true,
		TweenAnimation = false
	})
end
v41:Init()
return v41