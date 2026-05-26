-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("MissionsService")
local v3 = Sonar("Button")
local v4 = Sonar("ButtonTest")
local v5 = Sonar("GuiManager")
local v6 = Sonar("InputTypeDetector")
local v7 = Sonar("GuiUtils")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("TutorialService")
local v10 = Sonar("TrackObjectiveClient")
local v11 = Sonar("NotificationsClient")
local v12 = Sonar("ContextualUtils")
local v13 = Sonar("Marker")
local v14 = Sonar("FormatString")
local v15 = Sonar("StorageUtils")
local v16 = Sonar(v15.Get("LimitedStockHorses"))
local v17 = Sonar("LimitedStockUnlocks")
local v18 = Sonar("Constants")
local t2 = {
	DisplayName = "Stable Club",
	MissionDisplayName = "Stable Club",
	Missions = {}
}
local v19 = Sonar(ReplicatedStorage.Storage.Events.ToyEvent.AutumnEvent)
local LocalPlayer = game:GetService("Players").LocalPlayer
local v20 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local MissionsFrame = PlayerGui:WaitForChild("PinnedMissionsGui"):WaitForChild("MissionsFrame")
local v21 = v1.new()
local v22 = 0
local t3 = {}
local function limitedStockHorseDisplayName(p1) --[[ limitedStockHorseDisplayName | Line: 49 | Upvalues: v16 (copy), v18 (copy) ]]
	for v1, v2 in v16 do
		if v2.StockId == p1 then
			return v2.DisplayName or "Exclusive " .. v2.Preset[1] .. " " .. v2.Species
		end
	end
	for v4, v5 in v18.LimitedStockAccessories do
		if v5.StockId == p1 then
			return v5.DisplayName or v5.Name
		end
	end
	return "Stock Mission"
end
local function isUsingMobileThumbstick() --[[ isUsingMobileThumbstick | Line: 63 | Upvalues: v6 (copy), v20 (copy) ]]
	if not v6.IsMobileInputType() then
		return
	end
	return v20.PlayerControls:GetMoveVector().Magnitude > 0
end
local function headToAutumn() --[[ headToAutumn | Line: 69 | Upvalues: v12 (copy), v13 (copy) ]]
	local AutumnRef = workspace.Interactions:FindFirstChild("AutumnRef")
	if not (AutumnRef and AutumnRef:FindFirstChild("Part")) then
		return
	end
	local Part = AutumnRef.Part
	v12.SetGuiWorldspacePointTo(Part, nil, "Talk to Autumn")
	local v1 = v13.new({
		Duration = false,
		Root = Part
	})
	if not (v1 and v1.Maid) then
		return
	end
	v1.Maid:GiveTask(function() --[[ Line: 81 | Upvalues: v12 (ref) ]]
		v12.SetGuiWorldspacePointTo()
	end)
end
function t.AddMission(p1, p2, p3) --[[ AddMission | Line: 88 | Upvalues: v1 (copy), MissionsFrame (copy), v2 (copy), v10 (copy), v4 (copy), v11 (copy), Sonar (copy), headToAutumn (copy), v9 (copy), v6 (copy), v3 (copy), v20 (copy), t (copy) ]]
	if p2.Pinned[p3.MissionValue] then
		return
	end
	local MissionValue = p3.MissionValue
	local PreviousMissionValue = p3.PreviousMissionValue
	local MissionData = p3.MissionData
	local v12 = v1.new()
	local t2 = {}
	for k, v in pairs(MissionsFrame:GetChildren()) do
		if v:IsA("Frame") then
			local v22 = p3.Category .. "-" .. p3.Id .. "-" .. MissionValue.Name
			local v32 = v.Default:Clone()
			v.Default.Visible = false
			v32.Name = v22
			local function getTargetAmount() --[[ getTargetAmount | Line: 112 | Upvalues: p3 (copy), MissionData (copy), MissionValue (copy) ]]
				if p3.ForceMissionDataAmount then
					return MissionData.Amount
				end
				return MissionValue:FindFirstChild("TargetAmount") and MissionValue.TargetAmount.Value or MissionData.Amount
			end
			local function setAmount() --[[ setAmount | Line: 120 | Upvalues: MissionValue (copy), p3 (copy), MissionData (copy), v32 (copy), PreviousMissionValue (copy), p2 (copy) ]]
				local v1 = MissionValue.Value and (if p3.ForceMissionDataAmount then MissionData.Amount else MissionValue:FindFirstChild("TargetAmount") and MissionValue.TargetAmount.Value or MissionData.Amount) or MissionValue.Amount.Value
				v32.InnerFrame.ProgressLabel.Text = v1 .. "/" .. (if p3.ForceMissionDataAmount then MissionData.Amount else MissionValue:FindFirstChild("TargetAmount") and MissionValue.TargetAmount.Value or MissionData.Amount)
				local v5 = MissionValue.Value
				local v6 = PreviousMissionValue and not PreviousMissionValue.Value and not MissionValue.Value
				local v7 = if p3.Category == "NpcMissions" or (p3.Category == "AutumnEvent" or (p3.Category == "EventMissions" or (p3.Category == "MiniMissions" or p3.Category == "StableClubs"))) then true else p3.Category == "LimitedStockUnlocks"
				if v5 then
					v32.InnerFrame.ProgressLabel.Visible = false
					v32.InnerFrame.DescriptionLabel.Visible = false
					v32.InnerFrame.CompletedFrame.Visible = true
					v32.InnerFrame.CompletedFrame.ClaimButton.Visible = not v7 and MissionValue:FindFirstChild("Claimed")
					v32.InnerFrame.BackgroundColor3 = Color3.fromRGB(110, 255, 128)
					v32.InnerFrame.Locked.Visible = false
					v32.InnerFrame.BackgroundTransparency = 0.5
					v32.InnerFrame.UnderlineFrame.BackgroundTransparency = 0.5
					v32.InnerFrame.UnderlineFrame.BackgroundColor3 = Color3.fromRGB(8, 84, 69)
					v32.Size = PreviousMissionValue and UDim2.new(v32.Size.X.Scale, 0, 0.225) or UDim2.new(v32.Size.X.Scale, 0, 0.25)
				else
					v32.Size = v6 and UDim2.new(v32.Size.X.Scale, 0, 0.225) or UDim2.new(v32.Size.X.Scale, 0, 0.25)
					v32.InnerFrame.DescriptionLabel.Visible = true
					v32.InnerFrame.CompletedFrame.Visible = false
					v32.InnerFrame.Locked.Visible = v6
					v32.InnerFrame.CompletedFrame.ClaimButton.Visible = not v7 and MissionValue:FindFirstChild("Claimed")
					v32.InnerFrame.BackgroundColor3 = v6 and Color3.fromRGB(82, 106, 122) or Color3.fromRGB(0, 0, 0)
					v32.InnerFrame.BackgroundTransparency = if v6 then 0.75 else 0.5
					v32.InnerFrame.ProgressLabel.Visible = not v6
					v32.InnerFrame.UnderlineFrame.BackgroundColor3 = v6 and Color3.fromRGB(82, 106, 122) or Color3.fromRGB(0, 0, 0)
					v32.InnerFrame.UnderlineFrame.BackgroundTransparency = if v6 then 0.6 else 0.35
				end
				v32.LayoutOrder = PreviousMissionValue and p2.LayoutOrder + tonumber(MissionValue.Name) or (v5 and p2.LayoutOrder + 1 or p2.LayoutOrder + 2)
			end
			v12:GiveTask(MissionValue:GetPropertyChangedSignal("Value"):Connect(setAmount))
			v12:GiveTask(MissionValue.Amount:GetPropertyChangedSignal("Value"):Connect(setAmount))
			if MissionValue:FindFirstChild("TargetAmount") then
				v12:GiveTask(MissionValue.TargetAmount:GetPropertyChangedSignal("Value"):Connect(setAmount))
			end
			if PreviousMissionValue then
				v12:GiveTask(PreviousMissionValue:GetPropertyChangedSignal("Value"):Connect(setAmount))
			end
			setAmount()
			local function getMissionPreset() --[[ getMissionPreset | Line: 165 | Upvalues: MissionData (copy), v2 (ref), p3 (copy), MissionValue (copy) ]]
				return MissionData.Type and MissionData or v2.GetMissionPreset(p3.Category, p3.Id, MissionValue)
			end
			local function setTrackButtons(p1) --[[ setTrackButtons | Line: 169 | Upvalues: v32 (copy), MissionData (copy), v2 (ref), p3 (copy), MissionValue (copy), v10 (ref), v22 (copy) ]]
				if not v32:FindFirstChild("InnerFrame") then
					return
				end
				local v1 = if p1 then p1 else MissionData.Type and MissionData or v2.GetMissionPreset(p3.Category, p3.Id, MissionValue)
				if v10:GetObjectiveFromType(v1.Type) and (not MissionValue.Value and v1.TrackObjective == true) then
					v32.InnerFrame.TrackButton.Visible = not v10:IsTracked(v22)
					v32.InnerFrame.UntrackButton.Visible = not v32.InnerFrame.TrackButton.Visible
				else
					v32.InnerFrame.TrackButton.Visible = false
					v32.InnerFrame.UntrackButton.Visible = false
				end
			end
			local function setDescription() --[[ setDescription | Line: 180 | Upvalues: MissionData (copy), v2 (ref), p3 (copy), MissionValue (copy), setTrackButtons (copy), v32 (copy) ]]
				local v1 = MissionData.Type and MissionData or v2.GetMissionPreset(p3.Category, p3.Id, MissionValue)
				setTrackButtons(v1)
				local v22 = MissionValue:FindFirstChild("Type") and MissionValue.Type.Value or v1.Type
				local v3 = v1.Description or (v2.Descriptions[v22] or (v2.Descriptions[v1.Type] or v22))
				if v1.DoNotFormat then
					v32.InnerFrame.DescriptionLabel.Text = v3
					return
				end
				v32.InnerFrame.DescriptionLabel.Text = string.format(v3, if p3.ForceMissionDataAmount then MissionData.Amount else MissionValue:FindFirstChild("TargetAmount") and MissionValue.TargetAmount.Value or MissionData.Amount, v1.ItemType)
			end
			if MissionValue:FindFirstChild("Type") then
				v12:GiveTask(MissionValue.Type:GetPropertyChangedSignal("Value"):Connect(setDescription))
			end
			setDescription()
			local function setVisible() --[[ setVisible | Line: 197 | Upvalues: v32 (copy), MissionValue (copy), PreviousMissionValue (copy), setAmount (copy) ]]
				v32.Visible = MissionValue:FindFirstChild("Claimed") and not MissionValue.Claimed.Value or (PreviousMissionValue or not MissionValue:FindFirstChild("Claimed") and not MissionValue.Value)
				setAmount()
			end
			if MissionValue:FindFirstChild("Claimed") then
				v12:GiveTask(MissionValue.Claimed:GetPropertyChangedSignal("Value"):Connect(setVisible))
			end
			v32.Visible = MissionValue:FindFirstChild("Claimed") and not MissionValue.Claimed.Value or (PreviousMissionValue or not MissionValue:FindFirstChild("Claimed") and not MissionValue.Value)
			setAmount()
			v12:GiveTask(v4.new(v32.InnerFrame.CompletedFrame.ClaimButton, {
				Click = function() --[[ Click | Line: 209 | Upvalues: p3 (copy), v11 (ref), v2 (ref), MissionValue (copy), Sonar (ref), headToAutumn (ref) ]]
					if p3.Category == "KnoxMissions" then
						v11.Notify({
							Message = "Return to Knox to claim this mission!",
							Preset = "Green"
						})
						return
					end
					if p3.Category == "HourlyMissions" then
						v2.ClaimHourlyMission((tonumber(MissionValue.Name)))
						return
					end
					if p3.Category == "PassMissions" then
						v2.ClaimEventPassMission(p3.Id, MissionValue.Name)
						return
					end
					if p3.Category == "AutumnEvent" then
						local ClaimMission = Sonar("JournalGui").ClaimMission
						ClaimMission(p3.Category, p3.Id, (tonumber(MissionValue.Name)))
						headToAutumn()
						return
					end
					if p3.EventJournal then
						Sonar("EventJournalGui").ClaimMission(p3.Category, p3.CategoryId, p3.Id)
					else
						local ClaimMission = Sonar("JournalGui").ClaimMission
						ClaimMission(p3.Category, p3.Id, (tonumber(MissionValue.Name)))
					end
				end
			}))
			local function trackObjective() --[[ trackObjective | Line: 230 | Upvalues: v9 (ref), MissionData (copy), v2 (ref), p3 (copy), MissionValue (copy), v10 (ref), v22 (copy), v32 (copy) ]]
				if not v9.CanDoActionInTutorial("TrackObjective") then
					warn("Cannot track objective in tutorial")
					return
				end
				local v1 = MissionData.Type and MissionData or v2.GetMissionPreset(p3.Category, p3.Id, MissionValue)
				if type(v1.TrackObjective) == "string" then
					v10:HintObjective({
						ID = v22,
						Hint = v1.TrackObjective
					})
				else
					v10:TrackObjective({
						ID = v22,
						Type = v1.Type,
						ListenForUntrack = { v32:GetPropertyChangedSignal("Visible"), v32:GetPropertyChangedSignal("Parent"), MissionValue:GetPropertyChangedSignal("Value") }
					})
				end
			end
			v12:GiveTask(v10.TrackPinnedObjectiveSignal:Connect(function(p1) --[[ Line: 258 | Upvalues: v6 (ref), v (copy), v22 (copy), trackObjective (copy) ]]
				if not p1.Device then
					p1.Device = if v6.IsMobileInputType() then "Mobile" else "Other"
				end
				if p1.Device ~= v.Name then
					return
				end
				if p1.ID == v22 then
					trackObjective()
				end
			end))
			v12:GiveTask(v4.new(v32.InnerFrame.TrackButton, {
				Click = trackObjective
			}))
			v12:GiveTask(v4.new(v32.InnerFrame.UntrackButton, {
				Click = function() --[[ Click | Line: 272 | Upvalues: v10 (ref) ]]
					v10:StopTracking()
				end
			}))
			v32.InnerFrame.UntrackButton.Visible = false
			v12:GiveTask(MissionValue:GetPropertyChangedSignal("Value"):Connect(setTrackButtons))
			v12:GiveTask(v10.ObjectiveChangedSignal:Connect(setTrackButtons))
			setTrackButtons()
			if p3.TrackObjectiveFromTab then
				v12:GiveTask(v3.new(v32, {
					Click = function() --[[ Click | Line: 284 | Upvalues: v6 (ref), v20 (ref), v32 (copy), trackObjective (copy) ]]
						if if v6.IsMobileInputType() then v20.PlayerControls:GetMoveVector().Magnitude > 0 else nil then
							return
						end
						if v32.InnerFrame.TrackButton.Visible then
							trackObjective()
						end
					end
				}))
			end
			v32.Parent = v
			v12:GiveTask(v32)
			t2[#t2 + 1] = v32
		end
	end
	if MissionValue:FindFirstChild("Pinned") then
		v12:GiveTask(MissionValue.Pinned:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 298 | Upvalues: MissionValue (copy), p2 (copy), t (ref) ]]
			if MissionValue.Pinned.Value then
				return
			end
			local v1 = p2.Pinned[MissionValue]
			if v1 then
				v1.Maid:Destroy()
				p2.Pinned[MissionValue] = nil
			end
			if next(p2.Pinned) then
				return
			end
			t:RemoveTab(p2.Index)
		end))
	end
	p2.Pinned[MissionValue] = {
		Maid = v12,
		Frames = t2,
		MissionValue = MissionValue,
		PreviousMissionValue = PreviousMissionValue
	}
	return p2.Pinned[MissionValue]
end
function t.RemoveTab(p1, p2) --[[ RemoveTab | Line: 321 | Upvalues: t3 (copy) ]]
	local v1 = t3[p2]
	if not v1 then
		return
	end
	for k, v in pairs(v1.Pinned) do
		v.Maid:Destroy()
	end
	v1.Maid:Destroy()
	t3[p2] = nil
end
function t.AddCategory(p1, p2) --[[ AddCategory | Line: 332 | Upvalues: t3 (copy), v2 (copy), t (copy), v22 (ref), v1 (copy), MissionsFrame (copy), v3 (copy), Sonar (copy), v6 (copy), v4 (copy), headToAutumn (copy), v8 (copy) ]]
	if p2.MissionValue then
		if not (p2.MissionValue:FindFirstChild("Pinned") and p2.MissionValue.Pinned.Value) then
			return
		end
	elseif not p2.MissionsFolder.Pinned.Value then
		return
	end
	local v12 = t3[p2.MissionCategoryData]
	if v12 then
		if not p2.AddToCategory then
			return
		end
		local v42 = p2.MissionCategoryData.Missions[tonumber(p2.MissionValue.Name) or p2.MissionValue.Name]
		if p2.Category == "StreakMissions" or p2.Category == "EventStreakMissions" then
			v42 = v2.GetMissionPreset(p2.Category, p2.Id, p2.MissionValue) or v42
		end
		if v42 and (v42.Amount == nil and p2.MissionValue:FindFirstChild("TargetAmount")) then
			v42 = setmetatable({
				Amount = p2.MissionValue.TargetAmount.Value
			}, {
				__index = v42
			})
		end
		local t2 = {
			EventJournal = p2.EventJournal,
			Category = p2.Category,
			OpenCategory = p2.OpenCategory,
			Id = p2.Id,
			CategoryId = p2.CategoryId,
			MissionValue = p2.MissionValue
		}
		local CheckUnlocked = p2.CheckUnlocked
		if CheckUnlocked then
			CheckUnlocked = p2.MissionsFolder.Missions:FindFirstChild(tonumber(p2.MissionValue.Name) - 1)
		end
		t2.PreviousMissionValue = CheckUnlocked
		t2.MissionData = v42
		t2.DoNotOpenJournal = p2.DoNotOpenJournal
		t2.TrackObjectiveFromTab = p2.TrackObjectiveFromTab
		t2.ForceMissionDataAmount = p2.ForceMissionDataAmount
		t:AddMission(v12, t2)
	else
		p2.Disabled = p2.Disabled or {}
		v22 = v22 + 1
		local v10 = v22 * 10
		local v11 = v1.new()
		local t2 = {}
		local t4 = {
			Index = p2.MissionCategoryData,
			Pinned = {},
			LayoutOrder = v10,
			Maid = v11,
			Frames = t2
		}
		t3[p2.MissionCategoryData] = t4
		local v122 = true
		local function setDropdown() --[[ setDropdown | Line: 386 | Upvalues: v122 (ref), t4 (copy), t2 (copy) ]]
			v122 = not v122
			for k, v in pairs(t4.Pinned) do
				for k2, v2 in pairs(v.Frames) do
					v2.Visible = v122 and (v.MissionValue:FindFirstChild("Claimed") and not v.MissionValue.Claimed.Value or (v.PreviousMissionValue or not v.MissionValue:FindFirstChild("Claimed") and not v.MissionValue.Value))
				end
			end
			for k, v in pairs(t2) do
				v.InnerFrame.ArrowLabel.Rotation = if v122 then 0 else 180
			end
		end
		for k, v in pairs(MissionsFrame:GetChildren()) do
			if v:IsA("Frame") then
				v11:GiveTask((v1.new()))
				local v13 = v.DefaultTab:Clone()
				v.DefaultTab.Visible = false
				v13.Name = p2.Category .. "-" .. p2.Id
				v13.Visible = true
				v13:FindFirstChild("ArrowLabel", true).Visible = not p2.DoNotAllowDropdown
				v11:GiveTask(v3.new(v13:FindFirstChild("ArrowLabel", true), {
					Click = setDropdown
				}))
				v11:GiveTask(v3.new(v13, {
					Click = function() --[[ Click | Line: 418 | Upvalues: p2 (copy), Sonar (ref) ]]
						if p2.DoNotOpenJournal then
							return
						end
						if p2.OpenCategory == "StableClubs" then
							Sonar("StableClubsGui").Open()
							return
						end
						if p2.Category == "LimitedStockUnlocks" then
							local StockId = p2.StockId
							if not StockId and p2.MissionsFolder then
								local StockId_2 = p2.MissionsFolder:FindFirstChild("StockId")
								StockId = if StockId_2 then StockId_2.Value or nil else nil
							end
							Sonar("StockItemGui").Open(StockId)
						elseif p2.EventJournal then
							Sonar("EventJournalGui").Open(p2.OpenCategory)
						else
							Sonar("JournalGui").Open(p2.OpenCategory, p2.Id)
						end
					end
				}))
				v13.Active = not v6.IsMobileInputType()
				local v14 = p2.DisplayName or ""
				if p2.MissionCategoryData.MissionDisplayName then
					v13.InnerFrame.NameLabel.Text = p2.MissionCategoryData.MissionDisplayName
				else
					v13.InnerFrame.NameLabel.Text = (p2.MissionCategoryData.DisplayName or p2.MissionCategoryData.Title or "") .. (if v14 then " " else "") .. v14
				end
				v13.LayoutOrder = v10
				v13.Parent = v
				v11:GiveTask(v13)
				local v17 = if p2.Category == "NpcMissions" or (p2.Category == "AutumnEvent" or (p2.Category == "EventMissions" or (p2.Category == "MiniMissions" or (p2.Category == "StableClubs" or p2.Category == "LimitedStockUnlocks")))) then true elseif p2.Category == "WorldMissions" then true else false
				local function setClaimed() --[[ setClaimed | Line: 449 | Upvalues: p2 (copy), v13 (copy), v17 (copy) ]]
					if p2.Category == "StableClubs" then
						return
					end
					local Completed = p2.MissionsFolder.Completed.Value
					if p2.MissionsFolder:FindFirstChild("Claimed") then
						v13.InnerFrame.CompletedFrame.ClaimButton.Visible = not v17 and not p2.MissionsFolder.Claimed.Value
						v13.InnerFrame.OptionsFrame.Visible = p2.MissionsFolder.Claimed.Value or not Completed
					else
						v13.InnerFrame.CompletedFrame.ClaimButton.Visible = false
						v13.InnerFrame.OptionsFrame.Visible = true
					end
					v13.InnerFrame.CompletedFrame.Visible = Completed
					v13.InnerFrame.BackgroundColor3 = Completed and Color3.fromRGB(110, 255, 128) or Color3.fromRGB(180, 105, 236)
					v13.InnerFrame:SetAttribute("CompleteColor", Completed and Color3.fromRGB(110, 255, 128) or Color3.fromRGB(180, 105, 236))
					v13.InnerFrame.UnderlineFrame.BackgroundColor3 = Completed and Color3.fromRGB(8, 84, 69) or Color3.fromRGB(97, 73, 151)
				end
				if p2.Category ~= "StableClubs" then
					v11:GiveTask(p2.MissionsFolder.Completed:GetPropertyChangedSignal("Value"):Connect(setClaimed))
					if p2.MissionsFolder:FindFirstChild("Claimed") then
						v11:GiveTask(p2.MissionsFolder.Claimed:GetPropertyChangedSignal("Value"):Connect(setClaimed))
					end
					setClaimed()
				end
				if p2.Category == "StableClubs" then
					v13.InnerFrame.CompletedFrame.Visible = false
					v13.InnerFrame.CompletedFrame.ClaimButton.Visible = false
					v11:GiveTask(p2.MissionValue.Pinned:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 475 | Upvalues: p2 (copy), t (ref) ]]
						if not p2.MissionValue.Pinned.Value then
							t:RemoveTab(p2.MissionCategoryData)
						end
					end))
				end
				v11:GiveTask(v4.new(v13.InnerFrame.CompletedFrame.ClaimButton, {
					Click = function() --[[ Click | Line: 482 | Upvalues: p2 (copy), Sonar (ref), headToAutumn (ref) ]]
						if p2.Category == "AutumnEvent" then
							local ClaimMission = Sonar("JournalGui").ClaimMission
							ClaimMission(p2.Category, p2.CategoryId or p2.Id, p2.CategoryId and p2.Id)
							headToAutumn()
						elseif p2.EventJournal then
							local ClaimMission = Sonar("EventJournalGui").ClaimMission
							ClaimMission(p2.Category, p2.CategoryId or p2.Id, p2.CategoryId and p2.Id)
						else
							local ClaimMission = Sonar("JournalGui").ClaimMission
							ClaimMission(p2.Category, p2.CategoryId or p2.Id, p2.CategoryId and p2.Id)
						end
					end
				}))
				v13.InnerFrame.OptionsFrame.RemoveButton.Visible = false
				v11:GiveTask(v4.new(v13.InnerFrame.OptionsFrame.RemoveButton, {
					Click = function() --[[ Click | Line: 498 | Upvalues: p2 (copy), v8 (ref) ]]
						if p2.Category == "StableClubs" and p2.MissionValue then
							v8.GetRemoteFunction("PinMissionRemote"):InvokeServer("StableClubs", p2.MissionValue.Name, nil)
							return
						end
						if not p2.MissionsFolder:FindFirstChild("Pinned") then
							v8.GetRemoteFunction("UnpinMissionCategoryRemote"):InvokeServer(p2.Category)
							return
						end
						v8.GetRemoteFunction("PinMissionRemote"):InvokeServer(p2.Category, p2.CategoryId or p2.Id, p2.CategoryId and p2.Id)
					end
				}))
				t2[#t2 + 1] = v13
			end
		end
		if p2.MissionValue then
			local v19 = tonumber(p2.MissionValue.Name) or p2.MissionValue.Name
			local t5 = {
				EventJournal = p2.EventJournal,
				Category = p2.Category,
				OpenCategory = p2.OpenCategory,
				Id = p2.Id,
				CategoryId = p2.CategoryId,
				MissionValue = p2.MissionValue
			}
			local CheckUnlocked = p2.CheckUnlocked
			if CheckUnlocked then
				CheckUnlocked = p2.MissionsFolder.Missions:FindFirstChild(tonumber(p2.MissionValue.Name) - 1)
			end
			t5.PreviousMissionValue = CheckUnlocked
			t5.MissionData = p2.MissionCategoryData.Missions[v19]
			t5.DoNotOpenJournal = p2.DoNotOpenJournal
			t5.TrackObjectiveFromTab = p2.TrackObjectiveFromTab
			t5.ForceMissionDataAmount = p2.ForceMissionDataAmount
			t:AddMission(t4, t5)
		else
			for k, v in pairs(p2.MissionsFolder.Missions:GetChildren()) do
				local v222
				if p2.Category == "PassMissions" then
					v222 = p2.MissionCategoryData.Missions[v.Name]
				elseif p2.Category == "StreakMissions" or p2.Category == "EventStreakMissions" then
					local v23 = v2.GetMissionPreset(p2.Category, p2.Id, v)
					v222 = if v23 and (v23.Amount == nil and v:FindFirstChild("TargetAmount")) then setmetatable({
	Amount = v.TargetAmount.Value
}, {
	__index = v23
}) else v23
				else
					v222 = p2.MissionCategoryData.Missions[tonumber(v.Name)]
				end
				local t5 = {
					EventJournal = p2.EventJournal,
					Category = p2.Category,
					OpenCategory = p2.OpenCategory,
					Id = p2.Id,
					CategoryId = p2.CategoryId,
					MissionValue = v
				}
				local CheckUnlocked = p2.CheckUnlocked
				if CheckUnlocked then
					CheckUnlocked = p2.MissionsFolder.Missions:FindFirstChild(tonumber(v.Name) - 1)
				end
				t5.PreviousMissionValue = CheckUnlocked
				t5.MissionData = v222
				t5.DoNotOpenJournal = p2.DoNotOpenJournal
				t5.TrackObjectiveFromTab = p2.TrackObjectiveFromTab
				t5.ForceMissionDataAmount = p2.ForceMissionDataAmount
				t:AddMission(t4, t5)
			end
			v11:GiveTask(p2.MissionsFolder.Pinned:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 560 | Upvalues: p2 (copy), t (ref) ]]
				if not p2.MissionsFolder.Pinned.Value then
					t:RemoveTab(p2.MissionCategoryData)
				end
			end))
		end
		return t4
	end
end
function t.Init(p1) --[[ Init | Line: 569 | Upvalues: MissionsFrame (copy), v5 (copy), v7 (copy), v9 (copy), PlayerGui (copy), v20 (copy), t (copy), v2 (copy), v21 (copy), v1 (copy), v17 (copy), limitedStockHorseDisplayName (copy), t2 (copy), v18 (copy), v14 (copy), Sonar (copy), ReplicatedStorage (copy), v15 (copy), v19 (copy) ]]
	for k, v in pairs(MissionsFrame:GetChildren()) do
		local Position = v.Position
		v5.AddFrame(v, {
			TweenAnimation = true,
			OpenPosition = v.Position,
			ClosePosition = v.Position + UDim2.new(-0.35, 0, 0, 0),
			TweenStyle = TweenInfo.new(0.175, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			InputType = v.Name,
			CheckVisibility = function() --[[ CheckVisibility | Line: 578 | Upvalues: v7 (ref), v9 (ref), v5 (ref) ]]
				if v7.GetGameState("Lassoing") then
					return
				end
				if not v9.GetGameState("PinnedMissions") then
					return
				end
				return v7.CanShowHUD() and v5.IsHUDOpen()
			end
		})
		local function setFramePosition() --[[ setFramePosition | Line: 591 | Upvalues: v5 (ref), v (copy), v7 (ref), PlayerGui (ref), Position (copy) ]]
			local v1 = v5.getFrameFromInstance(v)
			if v7.IsChatOpen() or v.Name == "Mobile" and v5.IsFrameOpen(PlayerGui.LeaderboardGui.Mobile) then
				v1.OpenPosition = Position + UDim2.new(0, 0, 0.425, 0)
			else
				v1.OpenPosition = Position + UDim2.new(0, 0, 0, 0)
			end
			v1.ClosePosition = v1.OpenPosition + UDim2.new(-0.35, 0, 0, 0)
			v5.UpdateFrame(v, {
				TweenAnimation = false
			})
		end
		if v.Name == "Mobile" then
			v5.AddStateCallback(PlayerGui.LeaderboardGui.Mobile, "OnOpen", setFramePosition)
			v5.AddStateCallback(PlayerGui.LeaderboardGui.Mobile, "OnClose", setFramePosition)
		end
		v7.GetChatVisiblityChanged(setFramePosition)
		setFramePosition()
	end
	for k, v in pairs(v20.PlayerData.Tutorial.Missions:GetChildren()) do
		local function createPin() --[[ createPin | Line: 615 | Upvalues: v (copy), t (ref), v2 (ref) ]]
			if v.Pinned.Value then
				t:AddCategory({
					DoNotOpenJournal = true,
					TrackObjectiveFromTab = true,
					DoNotAllowDropdown = true,
					Category = "Tutorial",
					Id = v.Name,
					MissionCategoryData = v2.GetType("Tutorial")[v.Name],
					MissionsFolder = v
				})
			end
		end
		v21:GiveTask(v.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin))
		createPin()
	end
	for k, v in pairs(v20.PlayerData.Missions.WorldMissions:GetChildren()) do
		local function createPin() --[[ createPin | Line: 634 | Upvalues: v (copy), t (ref), v2 (ref) ]]
			if v.Pinned.Value then
				t:AddCategory({
					DoNotOpenJournal = true,
					TrackObjectiveFromTab = true,
					DoNotAllowDropdown = true,
					Category = "WorldMissions",
					Id = v.Name,
					MissionCategoryData = v2.GetType("WorldMissions")[v.Name][v.Name],
					MissionsFolder = v
				})
			end
		end
		v21:GiveTask(v.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin))
		createPin()
	end
	for k, v in pairs(v20.PlayerData.Missions.SpeciesUnlocks:GetChildren()) do
		local function createPin() --[[ createPin | Line: 654 | Upvalues: v (copy), t (ref), v2 (ref) ]]
			if not v.Pinned.Value then
				return
			end
			local t2 = {
				OpenCategory = "Horses",
				Category = "SpeciesUnlocks",
				Id = v.Name
			}
			t2.DisplayName = if v.Name == "Horses" then false else "Breeding"
			t2.MissionCategoryData = v2.GetType("SpeciesUnlocks").Missions[v.Name]
			t2.MissionsFolder = v
			local t3 = {}
			t3.Remove = if v.Name == "Horse" then true else false
			t3.Inspect = if v.Name == "Horse" then true else false
			t2.Disabled = t3
			t2.DoNotOpenJournal = if v.Name == "Horse" then true else false
			t2.TrackObjectiveFromTab = if v.Name == "Horse" then true else false
			t2.DoNotAllowDropdown = if v.Name == "Horse" then true else false
			t:AddCategory(t2)
		end
		v21:GiveTask(v.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin))
		createPin()
	end
	local LimitedStockUnlocks = v20.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if LimitedStockUnlocks then
		local t3 = {}
		local function hookLimitedStockFolder(p1) --[[ hookLimitedStockFolder | Line: 685 | Upvalues: t3 (copy), v1 (ref), v17 (ref), t (ref), limitedStockHorseDisplayName (ref), v21 (ref) ]]
			if t3[p1] then
				return
			end
			local v12 = v1.new()
			t3[p1] = v12
			local v2 = p1:FindFirstChild("Variant") and p1.Variant.Value or "Default"
			local v3 = v17.GetMissions(v2)
			local t2 = {
				Missions = {}
			}
			local t4 = {}
			if v3 then
				for i, v in ipairs(v17.GetMissionIndices(v2)) do
					t2.Missions[v] = v3[v]
				end
			end
			local function removePin() --[[ removePin | Line: 703 | Upvalues: t (ref), t2 (copy) ]]
				t:RemoveTab(t2)
			end
			local v5 = p1:FindFirstChild("StockId") and p1.StockId.Value or ""
			local function createPinForMission(p12) --[[ createPinForMission | Line: 709 | Upvalues: t (ref), p1 (copy), v5 (copy), limitedStockHorseDisplayName (ref), t2 (copy) ]]
				local Pinned = p12:FindFirstChild("Pinned")
				if Pinned and Pinned.Value then
					t:AddCategory({
						Category = "LimitedStockUnlocks",
						AddToCategory = true,
						Id = p1.Name,
						StockId = v5,
						DisplayName = limitedStockHorseDisplayName(v5),
						MissionCategoryData = t2,
						MissionsFolder = p1,
						MissionValue = p12
					})
				end
			end
			local function hookMissionValue(p1) --[[ hookMissionValue | Line: 727 | Upvalues: t4 (copy), v1 (ref), createPinForMission (copy), v12 (copy) ]]
				if t4[p1] then
					return
				end
				local v13 = v1.new()
				t4[p1] = v13
				local function connectPinned(p12) --[[ connectPinned | Line: 734 | Upvalues: v13 (copy), createPinForMission (ref), p1 (copy) ]]
					v13:GiveTask(p12:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 735 | Upvalues: p12 (copy), createPinForMission (ref), p1 (ref) ]]
						if not p12.Value then
							return
						end
						createPinForMission(p1)
					end))
					createPinForMission(p1)
				end
				local Pinned = p1:FindFirstChild("Pinned")
				if Pinned and Pinned:IsA("BoolValue") then
					v13:GiveTask(Pinned:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 735 | Upvalues: Pinned (copy), createPinForMission (ref), p1 (copy) ]]
						if not Pinned.Value then
							return
						end
						createPinForMission(p1)
					end))
					createPinForMission(p1)
				else
					v13:GiveTask(p1.ChildAdded:Connect(function(p12) --[[ Line: 747 | Upvalues: v13 (copy), createPinForMission (ref), p1 (copy) ]]
						if p12.Name == "Pinned" and p12:IsA("BoolValue") then
							v13:GiveTask(p12:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 735 | Upvalues: p12 (copy), createPinForMission (ref), p1 (ref) ]]
								if not p12.Value then
									return
								end
								createPinForMission(p1)
							end))
							createPinForMission(p1)
						end
					end))
				end
				v13:GiveTask(p1.AncestryChanged:Connect(function(p12, p2) --[[ Line: 755 | Upvalues: v13 (copy), t4 (ref), p1 (copy) ]]
					if not p2 then
						v13:Destroy()
						t4[p1] = nil
					end
				end))
				v12:GiveTask(v13)
			end
			local Missions = p1:FindFirstChild("Missions")
			if Missions then
				for v6, v7 in Missions:GetChildren() do
					hookMissionValue(v7)
				end
				v12:GiveTask(Missions.ChildAdded:Connect(function(p1) --[[ Line: 771 | Upvalues: hookMissionValue (copy) ]]
					task.defer(function() --[[ Line: 772 | Upvalues: p1 (copy), hookMissionValue (ref) ]]
						if not p1.Parent then
							return
						end
						hookMissionValue(p1)
					end)
				end))
			end
			v12:GiveTask(p1.AncestryChanged:Connect(function(p12, p2) --[[ Line: 780 | Upvalues: t (ref), t2 (copy), v12 (copy), t3 (ref), p1 (copy) ]]
				if not p2 then
					t:RemoveTab(t2)
					v12:Destroy()
					t3[p1] = nil
				end
			end))
			v21:GiveTask(v12)
		end
		for k, v in pairs(LimitedStockUnlocks:GetChildren()) do
			hookLimitedStockFolder(v)
		end
		v21:GiveTask(LimitedStockUnlocks.ChildAdded:Connect(function(p1) --[[ Line: 795 | Upvalues: hookLimitedStockFolder (copy) ]]
			task.defer(function() --[[ Line: 796 | Upvalues: p1 (copy), hookLimitedStockFolder (ref) ]]
				if not p1.Parent then
					return
				end
				p1:WaitForChild("Missions", 20)
				if not (p1.Parent and p1:FindFirstChild("Missions")) then
					return
				end
				hookLimitedStockFolder(p1)
			end)
		end))
	end
	for k, v in pairs(v20.PlayerData.Missions.OneTimeMissions:GetChildren()) do
		local function createPin() --[[ createPin | Line: 810 | Upvalues: v (copy), t (ref), v2 (ref) ]]
			if v.Pinned.Value then
				t:AddCategory({
					Category = "OneTimeMissions",
					Id = v.Name,
					MissionCategoryData = v2.GetType("OneTimeMissions").Missions[v.Name],
					MissionsFolder = v
				})
			end
		end
		v21:GiveTask(v.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin))
		createPin()
	end
	for k, v in pairs(v20.PlayerData.Missions.SpeciesMissions:GetChildren()) do
		local function createPin() --[[ createPin | Line: 826 | Upvalues: v (copy), t (ref), v2 (ref) ]]
			if v.Pinned.Value then
				t:AddCategory({
					OpenCategory = "Horses",
					Category = "SpeciesMissions",
					DisplayName = "Quests",
					Id = v.Name,
					MissionCategoryData = v2.GetType("SpeciesMissions").Missions[v.Name],
					MissionsFolder = v
				})
			end
		end
		v21:GiveTask(v.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin))
		createPin()
	end
	for k, v in pairs(v20.PlayerData.Missions.StoryMissions:GetChildren()) do
		for k2, v3 in pairs(v.Stories:GetChildren()) do
			local function createPin() --[[ createPin | Line: 847 | Upvalues: v3 (copy), t (ref), v (copy), v2 (ref) ]]
				if v3.Pinned.Value then
					local t2 = {
						OpenCategory = "Story",
						Category = "StoryMissions",
						CheckUnlocked = true,
						CategoryId = v.Name
					}
					t2.Id = tonumber(v3.Name)
					local Chapters = v2.GetType("StoryMissions").Chapters
					local Stories = Chapters[tonumber(v.Name)].Stories
					t2.MissionCategoryData = Stories[tonumber(v3.Name)]
					t2.MissionsFolder = v3
					t:AddCategory(t2)
				end
			end
			v3.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
			createPin()
		end
	end
	local StableClubs = v20.PlayerData.Missions:FindFirstChild("StableClubs")
	if StableClubs and StableClubs:FindFirstChild("Missions") then
		local v12 = v2.GetType("StableClubMissions")
		local CompletedSets = StableClubs:FindFirstChild("CompletedSets")
		local LastMissions = StableClubs:FindFirstChild("LastMissions")
		local t3 = {}
		for v22, v3 in StableClubs.Missions:GetChildren() do
			if v3:FindFirstChild("Pinned") then
				local function createPin() --[[ createPin | Line: 876 | Upvalues: v3 (copy), CompletedSets (copy), v2 (ref), t2 (ref), v12 (copy), t (ref), StableClubs (copy) ]]
					if not v3.Pinned.Value then
						return
					end
					if not CompletedSets then
						t:AddCategory({
							OpenCategory = "StableClubs",
							Category = "StableClubs",
							AddToCategory = true,
							Id = v3.Name,
							MissionCategoryData = t2,
							MissionsFolder = StableClubs,
							MissionValue = v3
						})
						return
					end
					local v1 = v2.StableClubMissionTimer.CurrentSeed + CompletedSets.Value * 1000
					for i = 1, 4 do
						t2.Missions[i] = v2.GetStableClubMissionData(v1, v12, i)
					end
					t:AddCategory({
						OpenCategory = "StableClubs",
						Category = "StableClubs",
						AddToCategory = true,
						Id = v3.Name,
						MissionCategoryData = t2,
						MissionsFolder = StableClubs,
						MissionValue = v3
					})
				end
				table.insert(t3, createPin)
				v3.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
				createPin()
			end
		end
		local function refreshPins() --[[ refreshPins | Line: 899 | Upvalues: v21 (ref), t (ref), t2 (ref), t3 (copy) ]]
			v21._stableClubRefresh = task.defer(function() --[[ Line: 900 | Upvalues: t (ref), t2 (ref), t3 (ref) ]]
				t:RemoveTab(t2)
				for v1, v2 in t3 do
					v2()
				end
			end)
		end
		if CompletedSets then
			CompletedSets:GetPropertyChangedSignal("Value"):Connect(refreshPins)
		end
		if LastMissions then
			LastMissions:GetPropertyChangedSignal("Value"):Connect(refreshPins)
		end
	end
	if v18.EventName then
		if v20.EventData:FindFirstChild("Missions") then
			local v4 = v2.GetType("EventMissions")
			for v52, v6 in v20.EventData.Missions:GetChildren() do
				local v72 = v4 and v4[v6.Name]
				if v72 then
					local t3 = {}
					t3.Title = v72.Title or v14.separateWordsInString(v6.Name)
					t3.Missions = v72.Missions
					for v92, v10 in v6.Missions:GetChildren() do
						local function createPin() --[[ createPin | Line: 930 | Upvalues: v10 (copy), t (ref), v6 (copy), t3 (copy) ]]
							if v10.Pinned.Value then
								t:AddCategory({
									OpenCategory = "Quests",
									EventJournal = true,
									Category = "EventMissions",
									AddToCategory = true,
									CategoryId = v6.Name,
									Id = v10.Name,
									MissionCategoryData = t3,
									MissionsFolder = v6,
									MissionValue = v10
								})
							end
						end
						v10.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
						createPin()
					end
				end
			end
		end
		if v20.EventData:FindFirstChild("MiniQuests") then
			local v11 = Sonar(ReplicatedStorage.Storage.Events[v18.EventName].MiniQuests)
			for v12, v13 in v20.EventData.MiniQuests:GetChildren() do
				local v152 = v11[tonumber(v13.Name)]
				if v152 then
					local t3 = {}
					t3.Title = v152.Name or "Special Quest " .. v13.Name
					t3.Missions = v152.Missions
					for v172, v182 in v13.Missions:GetChildren() do
						local Pinned = v182:FindFirstChild("Pinned")
						if Pinned then
							local function createPin() --[[ createPin | Line: 971 | Upvalues: Pinned (copy), t (ref), v13 (copy), v182 (copy), t3 (copy) ]]
								if Pinned.Value then
									t:AddCategory({
										OpenCategory = "Quests",
										EventJournal = true,
										Category = "MiniMissions",
										AddToCategory = true,
										CategoryId = v13.Name,
										Id = v182.Name,
										MissionCategoryData = t3,
										MissionsFolder = v13,
										MissionValue = v182
									})
								end
							end
							v182.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
							createPin()
						end
					end
				end
			end
		end
	end
	local v192 = v18.IsEventWorld and (v20.EventData and v20.EventData:FindFirstChild("HourlyMissions"))
	if not v192 then
		for k, v in pairs(v20.PlayerData.Missions.StreakMissions.Missions:GetChildren()) do
			for k2, v3 in pairs(v.Missions:GetChildren()) do
				local function createPin() --[[ createPin | Line: 1004 | Upvalues: v3 (copy), t (ref), v (copy), v2 (ref) ]]
					if v3.Pinned.Value then
						local t2 = {
							DisplayName = "Daily Missions",
							OpenCategory = "Missions",
							Category = "StreakMissions",
							AddToCategory = true
						}
						t2.CategoryId = tonumber(v.Name)
						t2.Id = tonumber(v.Name)
						t2.MissionCategoryData = v2.GetType("StreakMissions")
						t2.MissionsFolder = v
						t2.MissionValue = v3
						t:AddCategory(t2)
					end
				end
				v3.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
				createPin()
			end
		end
	end
	if v192 then
		local HourlyMissions = v20.EventData.HourlyMissions
		local t3 = {
			MissionDisplayName = "Hourly Missions",
			Missions = {}
		}
		for v202, v212 in HourlyMissions.Missions:GetChildren() do
			local v23 = tonumber(v212.Name)
			t3.Missions[v23] = {
				Type = v212.Type.Value,
				Amount = v212.TargetAmount.Value
			}
			v21:GiveTask(v212.Type:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1041 | Upvalues: t3 (copy), v23 (copy), v212 (copy) ]]
				t3.Missions[v23].Type = v212.Type.Value
			end))
			v21:GiveTask(v212.TargetAmount:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1044 | Upvalues: t3 (copy), v23 (copy), v212 (copy) ]]
				t3.Missions[v23].Amount = v212.TargetAmount.Value
			end))
		end
		for v24, v25 in HourlyMissions.Missions:GetChildren() do
			local function createPin() --[[ createPin | Line: 1050 | Upvalues: v25 (copy), t (ref), t3 (copy), HourlyMissions (copy) ]]
				if v25.Pinned.Value then
					t:AddCategory({
						DisplayName = "Hourly Missions",
						DoNotOpenJournal = true,
						Category = "HourlyMissions",
						AddToCategory = true,
						Id = v25.Name,
						MissionCategoryData = t3,
						MissionsFolder = HourlyMissions,
						MissionValue = v25
					})
				end
			end
			v21:GiveTask(v25.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin))
			if v25.Pinned.Value then
				t:AddCategory({
					DisplayName = "Hourly Missions",
					DoNotOpenJournal = true,
					Category = "HourlyMissions",
					AddToCategory = true,
					Id = v25.Name,
					MissionCategoryData = t3,
					MissionsFolder = HourlyMissions,
					MissionValue = v25
				})
			end
		end
	end
	for k, v in pairs(v20.PlayerData.Missions.NPCMissions:GetChildren()) do
		if v.Name ~= "EventGuide" then
			local v26 = Sonar(v15.Get("NpcMissions"))[v.Name]
			if v26 then
				for k2, v3 in pairs(v:GetChildren()) do
					local v28 = tonumber(v3.Name)
					if v28 and v26[v28] then
						local function createPin() --[[ createPin | Line: 1082 | Upvalues: v3 (copy), v26 (copy), v28 (copy), v (copy), t (ref) ]]
							if not v3.Pinned.Value then
								return
							end
							t:AddCategory({
								OpenCategory = "Quests",
								Category = "NpcMissions",
								DisplayName = "\'s Quest",
								CheckUnlocked = false,
								ForceMissionDataAmount = true,
								CategoryId = v.Name,
								Id = v3.Name,
								MissionCategoryData = {
									Title = if v.Name == "EventGuide" then "Celeste" else v.Name,
									Missions = v26[v28].Missions
								},
								MissionsFolder = v3,
								Disabled = {
									Remove = false,
									Claim = true
								}
							})
						end
						v3.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
						createPin()
					end
				end
			end
		end
	end
	if v18.EventName and v20.EventData then
		local function setupAutumnEventPin(p1) --[[ setupAutumnEventPin | Line: 1118 | Upvalues: v19 (ref), t (ref) ]]
			local function createPin() --[[ createPin | Line: 1119 | Upvalues: p1 (copy), v19 (ref), t (ref) ]]
				if not p1.Pinned.Value then
					return
				end
				if not v19 then
					return
				end
				local v1 = t:AddCategory({
					OpenCategory = "Quests",
					Category = "AutumnEvent",
					CategoryId = "AutumnEvent",
					Id = "1",
					DisplayName = "\'s Introduction",
					CheckUnlocked = false,
					MissionCategoryData = {
						Title = "Autumn",
						Missions = v19[1].Missions
					},
					MissionsFolder = p1,
					Disabled = {
						Remove = false,
						Claim = true
					}
				})
				for v2, v3 in p1.Missions:GetChildren() do
					local t2 = {
						Category = "AutumnEvent",
						OpenCategory = "Quests",
						Id = "1",
						CategoryId = "AutumnEvent",
						MissionValue = v3
					}
					t2.MissionData = v19[1].Missions[tonumber(v3.Name)]
					t:AddMission(v1, t2)
				end
			end
			p1.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
			createPin()
		end
		local AutumnEvent = v20.EventData:FindFirstChild("AutumnEvent")
		if AutumnEvent then
			local function createPin() --[[ createPin | Line: 1119 | Upvalues: AutumnEvent (copy), v19 (ref), t (ref) ]]
				if not AutumnEvent.Pinned.Value then
					return
				end
				if not v19 then
					return
				end
				local v1 = t:AddCategory({
					OpenCategory = "Quests",
					Category = "AutumnEvent",
					CategoryId = "AutumnEvent",
					Id = "1",
					DisplayName = "\'s Introduction",
					CheckUnlocked = false,
					MissionCategoryData = {
						Title = "Autumn",
						Missions = v19[1].Missions
					},
					MissionsFolder = AutumnEvent,
					Disabled = {
						Remove = false,
						Claim = true
					}
				})
				for v2, v3 in AutumnEvent.Missions:GetChildren() do
					local t2 = {
						Category = "AutumnEvent",
						OpenCategory = "Quests",
						Id = "1",
						CategoryId = "AutumnEvent",
						MissionValue = v3
					}
					t2.MissionData = v19[1].Missions[tonumber(v3.Name)]
					t:AddMission(v1, t2)
				end
			end
			AutumnEvent.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
			createPin()
		end
		v21:GiveTask(v20.EventData.ChildAdded:Connect(function(p1) --[[ Line: 1166 | Upvalues: v19 (ref), t (ref) ]]
			if p1.Name ~= "AutumnEvent" then
				return
			end
			local function createPin() --[[ createPin | Line: 1119 | Upvalues: p1 (copy), v19 (ref), t (ref) ]]
				if not p1.Pinned.Value then
					return
				end
				if not v19 then
					return
				end
				local v1 = t:AddCategory({
					OpenCategory = "Quests",
					Category = "AutumnEvent",
					CategoryId = "AutumnEvent",
					Id = "1",
					DisplayName = "\'s Introduction",
					CheckUnlocked = false,
					MissionCategoryData = {
						Title = "Autumn",
						Missions = v19[1].Missions
					},
					MissionsFolder = p1,
					Disabled = {
						Remove = false,
						Claim = true
					}
				})
				for v2, v3 in p1.Missions:GetChildren() do
					local t2 = {
						Category = "AutumnEvent",
						OpenCategory = "Quests",
						Id = "1",
						CategoryId = "AutumnEvent",
						MissionValue = v3
					}
					t2.MissionData = v19[1].Missions[tonumber(v3.Name)]
					t:AddMission(v1, t2)
				end
			end
			p1.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
			createPin()
		end))
	end
	if v18.EventName and (v20.PlayerData.Events and (v20.PlayerData.Events[v18.EventName] and v20.PlayerData.Events[v18.EventName]:FindFirstChild("PassMissions"))) then
		for k, v in pairs(v20.PlayerData.Events[v18.EventName].PassMissions:GetChildren()) do
			local function createPin() --[[ createPin | Line: 1176 | Upvalues: v (copy), v2 (ref), t (ref) ]]
				if v.Pinned.Value then
					local v1 = v2.GetType("PassMissions")[v.Name]
					t:AddCategory({
						OpenCategory = "Pass",
						EventJournal = true,
						Category = "PassMissions",
						Id = v.Name,
						DisplayName = v1.MissionName,
						MissionCategoryData = v1,
						MissionsFolder = v
					})
				end
			end
			v.Pinned:GetPropertyChangedSignal("Value"):Connect(createPin)
			createPin()
		end
	end
	Sonar("InteractZone").GetOrCreateZone({
		Type = "DungeonZone",
		OnEntered = function() --[[ OnEntered | Line: 1198 | Upvalues: t (ref) ]]
			t:AddKirinProgressMission()
		end,
		OnLeave = function() --[[ OnLeave | Line: 1202 | Upvalues: t (ref) ]]
			t:RemoveKirinProgressMission()
		end
	})
end
function t.AddKirinProgressMission(p1) --[[ AddKirinProgressMission | Line: 1260 | Upvalues: t3 (copy), v22 (ref), v1 (copy), MissionsFrame (copy), v3 (copy), v20 (copy), v4 (copy), v8 (copy) ]]
	if t3.KirinProgress then
		return
	end
	v22 = v22 + 1
	local v12 = v22 * 10
	local v2 = v1.new()
	local t = {}
	local t2 = {
		Index = "KirinProgress",
		Pinned = {},
		LayoutOrder = v12,
		Maid = v2,
		Frames = t
	}
	t3.KirinProgress = t2
	local v32 = true
	local function setDropdown() --[[ setDropdown | Line: 1280 | Upvalues: v32 (ref), t2 (copy), t (copy) ]]
		v32 = not v32
		for k, v in pairs(t2.Pinned) do
			for k2, v2 in pairs(v.Frames) do
				v2.Visible = v32
			end
		end
		for k, v in pairs(t) do
			v.InnerFrame.ArrowLabel.Rotation = if v32 then 0 else 180
		end
	end
	for k, v in pairs(MissionsFrame:GetChildren()) do
		if v:IsA("Frame") then
			local KirinProgress = v.DefaultTab:Clone()
			v.DefaultTab.Visible = false
			KirinProgress.Name = "KirinProgress"
			KirinProgress.Visible = true
			KirinProgress:FindFirstChild("ArrowLabel", true).Visible = true
			v2:GiveTask(v3.new(KirinProgress:FindFirstChild("ArrowLabel", true), {
				Click = setDropdown
			}))
			KirinProgress.InnerFrame.NameLabel.Text = "Kirin Progress"
			KirinProgress.LayoutOrder = v12
			KirinProgress.Parent = v
			v2:GiveTask(KirinProgress)
			KirinProgress.InnerFrame.CompletedFrame.Visible = false
			KirinProgress.InnerFrame.OptionsFrame.Visible = false
			t[#t + 1] = KirinProgress
		end
	end
	local function createKirinMission(p1, p2, p3, p4) --[[ createKirinMission | Line: 1319 | Upvalues: v20 (ref), v1 (ref), MissionsFrame (ref), v12 (copy), v4 (ref), v8 (ref), t2 (copy) ]]
		local v13 = v20.PlayerData.KirinProgress.Progress:FindFirstChild(p1)
		local TotalCollected = v13:FindFirstChild("TotalCollected")
		local v2 = v1.new()
		local t = {}
		for k, v in pairs(MissionsFrame:GetChildren()) do
			if v:IsA("Frame") then
				local v3 = v.Default:Clone()
				v.Default.Visible = false
				v3.Name = p1
				v3.Visible = true
				v3.LayoutOrder = v12 + p3
				v3.InnerFrame.TrackButton.Visible = false
				v3.InnerFrame.UntrackButton.Visible = false
				local function setAmount() --[[ setAmount | Line: 1340 | Upvalues: TotalCollected (copy), v3 (copy), p4 (copy), v13 (copy) ]]
					local v1 = TotalCollected.Value
					v3.InnerFrame.ProgressLabel.Text = v1 .. "/" .. p4
					if p4 <= v1 then
						v3.InnerFrame.ProgressLabel.Visible = false
						v3.InnerFrame.DescriptionLabel.Visible = false
						v3.InnerFrame.CompletedFrame.Visible = true
						v3.InnerFrame.CompletedFrame.ClaimButton.Visible = not v13.Claimed.Value
						v3.InnerFrame.BackgroundColor3 = Color3.fromRGB(110, 255, 128)
						v3.InnerFrame.BackgroundTransparency = 0.5
						v3.InnerFrame.UnderlineFrame.BackgroundTransparency = 0.5
						v3.InnerFrame.UnderlineFrame.BackgroundColor3 = Color3.fromRGB(8, 84, 69)
					else
						v3.InnerFrame.DescriptionLabel.Visible = true
						v3.InnerFrame.CompletedFrame.Visible = false
						v3.InnerFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						v3.InnerFrame.BackgroundTransparency = 0.5
						v3.InnerFrame.ProgressLabel.Visible = true
						v3.InnerFrame.UnderlineFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						v3.InnerFrame.UnderlineFrame.BackgroundTransparency = 0.35
					end
				end
				v2:GiveTask(TotalCollected:GetPropertyChangedSignal("Value"):Connect(setAmount))
				v2:GiveTask(v13.Claimed:GetPropertyChangedSignal("Value"):Connect(setAmount))
				setAmount()
				v3.InnerFrame.DescriptionLabel.Text = p2
				v2:GiveTask(v4.new(v3.InnerFrame.CompletedFrame.ClaimButton, {
					Click = function() --[[ Click | Line: 1372 | Upvalues: v8 (ref), p1 (copy) ]]
						v8.GetRemoteFunction("DestroyKirinResource"):InvokeServer(p1)
					end
				}))
				v3.Parent = v
				v2:GiveTask(v3)
				t[#t + 1] = v3
			end
		end
		t2.Pinned[p1] = {
			Maid = v2,
			Frames = t,
			MissionValue = TotalCollected
		}
	end
	createKirinMission("Whisps", "Collect Fire Wisps", 1, 10)
	createKirinMission("Resources", "Clear Cobwebs", 2, 10)
	createKirinMission("Dance", "Complete Kirin Dance", 3, 1)
	return t2
end
function t.RemoveKirinProgressMission(p1) --[[ RemoveKirinProgressMission | Line: 1397 | Upvalues: t3 (copy) ]]
	local KirinProgress = t3.KirinProgress
	if not KirinProgress then
		return
	end
	for k, v in pairs(KirinProgress.Pinned) do
		v.Maid:Destroy()
	end
	KirinProgress.Maid:Destroy()
	t3.KirinProgress = nil
end
t:Init()
return t