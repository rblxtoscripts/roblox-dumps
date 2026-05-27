-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalCosmetics")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("DisplayAnimalClient")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("GuiManager")
local v7 = Sonar("GuiUtils")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("ItemReplicationService")
local v10 = Sonar("Limited")
local v11 = Sonar("Maid")
local v12 = Sonar("MarketplaceUtils")
local v13 = Sonar("MissionsService")
local v14 = Sonar("NotificationsClient")
local v15 = Sonar("PlayerWrapper")
local v16 = Sonar("PromptClient")
local v17 = Sonar("RemoteUtils")
local v18 = Sonar("StorageUtils")
local v19 = Sonar("LimitedStockUnlocks")
local v20 = Sonar("ViewportModel")
local v21 = Sonar("WeightedProbability")
local v22 = Sonar("Constants")
local v23 = Sonar(v18.Get("LimitedStockHorses"))
local v24 = Sonar(v18.Get("LimitedStockHorseProducts"))
local v25 = Sonar(v18.Get("LimitedStockProducts"))
local LocalPlayer = Players.LocalPlayer
local v26 = v15.GetClient()
local v27 = v17.GetRemoteFunction("CompleteLimitedStockUnlockRemote")
local v28 = v17.GetRemoteFunction("CancelLimitedStockUnlockRemote")
local v29 = v17.GetRemoteFunction("PinMissionRemote")
local v30 = v17.GetRemoteEvent("SetLimitedStockHorseStockId")
local v31 = v17.GetRemoteEvent("SetLimitedStockAccessoryStockId")
local v32 = v17.GetRemoteFunction("PurchaseLimitedStockHorse")
local v33 = v17.GetRemoteFunction("PurchaseLimitedStockAccessory")
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("StockItemGui").ContainerFrame
local Menu = ContainerFrame.Menu
local v34 = Menu.Content
local AcceptButton = v34.AcceptButton
local SkipButton = v34.SkipButton
local ProgressBar = v34:FindFirstChild("ProgressBar")
local ProgressLabel = v34:FindFirstChild("ProgressLabel")
local MissionList = v34:FindFirstChild("MissionList")
local StockItemTemplate = v34:FindFirstChild("StockItemTemplate")
local v35 = MissionList and MissionList:FindFirstChild("Content")
local v36 = nil
if v35 then
	for v37, v38 in v35:GetChildren() do
		if v38:IsA("Frame") and v38.Name == "Default" then
			v36 = v38
			break
		end
	end
end
if v36 then
	v36.Visible = false
end
local v39 = v11.new()
local v40 = v11.new()
local v41 = v11.new()
local v42 = nil
local v43 = nil
local v44 = false
local v45 = nil
local v46 = nil
local function findStockInfo(p1) --[[ findStockInfo | Line: 84 | Upvalues: v23 (copy), v22 (copy) ]]
	for v1, v2 in v23 do
		if v2.StockId == p1 then
			return v2, true
		end
	end
	for v3, v4 in v22.LimitedStockAccessories do
		if v4.StockId == p1 then
			return v4, false
		end
	end
	return nil, false
end
local function getMissionFolder() --[[ getMissionFolder | Line: 98 | Upvalues: v26 (copy), v42 (ref) ]]
	local LimitedStockUnlocks = v26.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return nil
	end
	for v1, v2 in LimitedStockUnlocks:GetChildren() do
		local StockId = v2:FindFirstChild("StockId")
		if StockId and StockId.Value == v42 then
			return v2
		end
	end
	return nil
end
local function getMissionState() --[[ getMissionState | Line: 112 | Upvalues: getMissionFolder (copy) ]]
	local v1 = getMissionFolder()
	if not v1 then
		return "NotStarted"
	end
	if v1:FindFirstChild("Claimed") and v1.Claimed.Value then
		return "Completed"
	end
	if v1.Completed.Value then
		return "ReadyToClaim"
	end
	if v1.Started.Value then
		return "InProgress"
	else
		return "NotStarted"
	end
end
local function hasAnyUnclaimedLimitedStockMission() --[[ hasAnyUnclaimedLimitedStockMission | Line: 129 | Upvalues: v26 (copy) ]]
	local LimitedStockUnlocks = v26.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return false
	end
	for v1, v2 in LimitedStockUnlocks:GetChildren() do
		local Claimed = v2:FindFirstChild("Claimed")
		local Started = v2:FindFirstChild("Started")
		local Completed = v2:FindFirstChild("Completed")
		local v3 = if Claimed then Claimed.Value else Claimed
		if not v3 and (Started and Started.Value or (if Completed then Completed.Value else Completed)) then
			return true
		end
	end
	return false
end
local function setMissionContentVisible(p1) --[[ setMissionContentVisible | Line: 149 | Upvalues: AcceptButton (copy), StockItemTemplate (copy), MissionList (copy), ProgressBar (copy), ProgressLabel (copy) ]]
	if AcceptButton then
		AcceptButton.Visible = p1
	end
	if StockItemTemplate and StockItemTemplate:IsA("GuiObject") then
		StockItemTemplate.Visible = p1
	end
	if MissionList and MissionList:IsA("GuiObject") then
		MissionList.Visible = p1
	end
	if ProgressBar and ProgressBar:IsA("GuiObject") then
		ProgressBar.Visible = p1
	end
	if not (ProgressLabel and ProgressLabel:IsA("GuiObject")) then
		return
	end
	ProgressLabel.Visible = p1
end
local function getMissionDefinitions(p1) --[[ getMissionDefinitions | Line: 167 | Upvalues: v19 (copy) ]]
	return v19.GetMissions(if p1 and p1:FindFirstChild("Variant") then p1.Variant.Value or "Default" else "Default") or {}
end
local function getMissionTargetAmount(p1, p2) --[[ getMissionTargetAmount | Line: 173 ]]
	local TargetAmount = p1:FindFirstChild("TargetAmount")
	if TargetAmount then
		return math.max(1, TargetAmount.Value)
	end
	if p2 and p2.Amount then
		return math.max(1, p2.Amount)
	end
	local Amount = p1:FindFirstChild("Amount")
	if Amount then
		return math.max(1, Amount.Value)
	else
		return 1
	end
end
local function getMissionCurrentAmount(p1, p2, p3) --[[ getMissionCurrentAmount | Line: 191 ]]
	if p3 then
		return p2
	end
	local Amount = p1:FindFirstChild("Amount")
	if Amount then
		return math.clamp(Amount.Value, 0, p2)
	end
	if p1:IsA("BoolValue") and p1.Value then
		return p2
	else
		return 0
	end
end
local function getMissionDescription(p1, p2) --[[ getMissionDescription | Line: 208 | Upvalues: v13 (copy) ]]
	if not p1 then
		return "Unknown mission."
	end
	local Description = p1.Description
	if not Description then
		Description = v13.Descriptions[p1.Type]
		if not Description then
			Description = tostring(p1.Type or "Mission")
		end
	end
	if p1.DoNotFormat then
		return Description
	end
	local v2, v3 = pcall(string.format, Description, p2)
	return if v2 then if v3 then v3 else Description else Description
end
local function getDisplayNameForCurrentStock() --[[ getDisplayNameForCurrentStock | Line: 224 | Upvalues: v43 (ref), v44 (ref), v42 (ref) ]]
	if not v43 then
		return "Reward"
	end
	if v43.DisplayName then
		return v43.DisplayName
	end
	if v43.Name then
		return v43.Name
	end
	if not (v44 and v43.Species) then
		return v42 or "Reward"
	end
	local v1 = v43.Preset and v43.Preset[1]
	if v1 then
		return ("Exclusive %* %*"):format(v1, v43.Species)
	else
		return v43.Species
	end
end
local function getRemainingStockText() --[[ getRemainingStockText | Line: 248 | Upvalues: v43 (ref), v42 (ref), v10 (copy) ]]
	if not (v43 and (v43.MaxStock and v42)) then
		return "--"
	end
	local v1 = v10:GetSoldCountValue(v42)
	if v1 then
		return tostring((math.max(0, v43.MaxStock - v1.Value)))
	else
		return tostring(v43.MaxStock)
	end
end
local function getCurrentRemainingStock() --[[ getCurrentRemainingStock | Line: 261 | Upvalues: v43 (ref), v42 (ref), v10 (copy) ]]
	if not (v43 and (v43.MaxStock and v42)) then
		return (1 / 0)
	end
	local v1 = v10:GetSoldCountValue(v42)
	if v1 then
		return math.max(0, v43.MaxStock - v1.Value)
	else
		return v43.MaxStock
	end
end
local function setOverallMissionProgress(p1, p2) --[[ setOverallMissionProgress | Line: 274 | Upvalues: ProgressLabel (copy), ProgressBar (copy) ]]
	if ProgressLabel and ProgressLabel:IsA("TextLabel") then
		ProgressLabel.Text = if p2 > 0 then string.format("%d/%d Missions Completed", p1, p2) else "No Missions"
	end
	local v3 = ProgressBar and ProgressBar:FindFirstChild("Fill")
	if not (v3 and v3:IsA("Frame")) then
		return
	end
	v3.Size = UDim2.fromScale(if p2 > 0 then math.clamp(p1 / p2, 0, 1) else 0, 1)
end
local function clearRewardViewport() --[[ clearRewardViewport | Line: 288 | Upvalues: StockItemTemplate (copy) ]]
	if not (StockItemTemplate and StockItemTemplate:IsA("Frame")) then
		return
	end
	local Viewport = StockItemTemplate:FindFirstChild("Viewport")
	if not (Viewport and Viewport:IsA("ViewportFrame")) then
		return
	end
	Viewport.CurrentCamera = nil
	for v1, v2 in Viewport:GetChildren() do
		v2:Destroy()
	end
end
local function getRandomizedThemeName(p1) --[[ getRandomizedThemeName | Line: 305 | Upvalues: v21 (copy), v22 (copy) ]]
	if p1 == "Random" then
		return v21.getRandomWeightedItem(v22.RandomEquipmentDropThemes)
	else
		return p1
	end
end
local function applyThemeToAccessoryModel(p1, p2) --[[ applyThemeToAccessoryModel | Line: 312 ]]
	if not (p2 and p2.RegionsByTag) then
		return
	end
	for v2, v3 in p1:IsA("BasePart") and { p1 } or p1:GetDescendants() do
		if v3:IsA("BasePart") then
			for v4, v5 in v3:GetTags() do
				local v6 = p2.RegionsByTag[v5]
				if v6 then
					if v6.Texture and v3:IsA("MeshPart") then
						v3.TextureID = v6.Texture
					end
					if v6.Color then
						v3.Color = v6.Color
					end
					if v6.Material then
						v3.Material = Enum.Material[v6.Material]
					end
					v3.MaterialVariant = v6.MaterialVariant or ""
				end
			end
		end
	end
end
local function renderRewardViewport() --[[ renderRewardViewport | Line: 342 | Upvalues: StockItemTemplate (copy), v43 (ref), clearRewardViewport (copy), v45 (ref), v42 (ref), v44 (ref), v2 (copy), v26 (copy), v40 (copy), v9 (copy), v1 (copy), v8 (copy), v21 (copy), v22 (copy), applyThemeToAccessoryModel (copy), v20 (copy), RunService (copy) ]]
	if not (StockItemTemplate and (StockItemTemplate:IsA("Frame") and v43)) then
		clearRewardViewport()
		v45 = nil
		return
	end
	if v45 == v42 then
		return
	end
	local Viewport = StockItemTemplate:FindFirstChild("Viewport")
	if not (Viewport and Viewport:IsA("ViewportFrame")) then
		v45 = nil
		return
	end
	clearRewardViewport()
	v45 = v42
	local v12 = nil
	local v23
	if v44 then
		local t = {
			DoNotParent = true,
			DoNotIncrementCount = true,
			Age = 100,
			Species = v43.Species
		}
		t.Preset = v43.Preset and v43.Preset[1]
		local v5 = v2.CreateSlot(v26, t)
		if not v5 then
			return
		end
		v40:GiveTask(v5)
		local v6 = v2.GetByName(v5.Species.Value)
		if not v6 then
			return
		end
		v23 = v9.Get(v6):Clone()
		v23:ScaleTo(v2.GetScale(v5))
		v40:GiveTask(v1.new(v23, {
			InViewport = true,
			IsYoung = false,
			SlotValue = v5
		}))
	else
		local v7 = v8.GetByName(v43.Name)
		if not v7 then
			return
		end
		local v82 = v9.Get(v7.Name):Clone()
		v23 = Instance.new("Model")
		v82.Parent = v23
		local Theme = v43.Theme
		local v92 = if Theme == "Random" then v21.getRandomWeightedItem(v22.RandomEquipmentDropThemes) else Theme
		if v92 and v92 ~= "" then
			local v10 = v8.GetByName(v92)
			if v10 then
				applyThemeToAccessoryModel(v23, v10)
			end
		end
		v12 = v7
	end
	v23.Parent = Viewport
	v40:GiveTask(v23)
	local Camera = Instance.new("Camera")
	Camera.FieldOfView = 1
	Camera.Parent = Viewport
	Viewport.CurrentCamera = Camera
	v40:GiveTask(Camera)
	local v11 = v20(v23, Viewport, -130, -8)
	Camera.CFrame = v11
	Viewport.Ambient = Color3.fromRGB(192, 192, 192)
	Viewport.LightDirection = Camera.CFrame.LookVector
	if not v44 and (v43.Theme == "Random" and v12) then
		local t = {}
		for v122 in v22.RandomEquipmentDropThemes do
			table.insert(t, v122)
		end
		local v13 = 1
		local v14 = 0
		v40:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 431 | Upvalues: t (copy), v14 (ref), v13 (ref), v8 (ref), applyThemeToAccessoryModel (ref), v23 (ref) ]]
			if #t <= 1 then
				return
			end
			v14 = v14 + p1
			if v14 < 3 then
				return
			end
			v14 = 0
			v13 = v13 % #t + 1
			local v1 = v8.GetByName(t[v13])
			if not v1 then
				return
			end
			applyThemeToAccessoryModel(v23, v1)
		end))
	end
	local Position = v23:GetBoundingBox().Position
	local v15 = v11.Position - Position
	local Magnitude = Vector3.new(v15.X, 0, v15.Z).Magnitude
	if Magnitude <= 0.01 then
		Magnitude = 8
	end
	local Y = v15.Y
	local v16 = math.atan2(v15.Z, v15.X)
	v40:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 460 | Upvalues: v16 (ref), Magnitude (ref), Y (copy), Position (copy), Camera (copy), Viewport (copy) ]]
		v16 = v16 + 0.2617993877991494 * p1
		Camera.CFrame = CFrame.lookAt(Position + Vector3.new(math.cos(v16) * Magnitude, Y, math.sin(v16) * Magnitude), Position)
		Viewport.LightDirection = Camera.CFrame.LookVector
	end))
end
local function refreshRewardCard() --[[ refreshRewardCard | Line: 474 | Upvalues: StockItemTemplate (copy), v43 (ref), v44 (ref), v42 (ref), v10 (copy), renderRewardViewport (copy) ]]
	if not (StockItemTemplate and StockItemTemplate:IsA("Frame")) then
		return
	end
	local Title = StockItemTemplate:FindFirstChild("Title")
	if Title and Title:IsA("TextLabel") then
		local v1
		if v43 then
			if v43.DisplayName then
				v1 = v43.DisplayName
			elseif v43.Name then
				v1 = v43.Name
			elseif v44 and v43.Species then
				local v2 = v43.Preset and v43.Preset[1]
				v1 = if v2 then ("Exclusive %* %*"):format(v2, v43.Species) else v43.Species
			else
				v1 = v42 or "Reward"
			end
		else
			v1 = "Reward"
		end
		Title.Text = v1
	end
	local Locked = StockItemTemplate:FindFirstChild("Locked")
	if not Locked then
		return
	end
	local t = {}
	for v4, v5 in Locked:GetChildren() do
		if v5:IsA("TextLabel") and v5.Name == "Title" then
			table.insert(t, v5)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 495 ]]
		return p1.Position.Y.Scale < p2.Position.Y.Scale
	end)
	if t[1] then
		t[1].Text = "Stocks Left:"
	end
	if t[2] then
		local v7
		if v43 and (v43.MaxStock and v42) then
			local v8 = v10:GetSoldCountValue(v42)
			v7 = if v8 then tostring((math.max(0, v43.MaxStock - v8.Value))) else tostring(v43.MaxStock)
		else
			v7 = "--"
		end
		t[2].Text = v7
	end
	renderRewardViewport()
end
local function refreshMissionRows(p1) --[[ refreshMissionRows | Line: 509 | Upvalues: v41 (copy), v35 (copy), v36 (ref), v19 (copy), v46 (ref), v13 (copy), v7 (copy), v3 (copy), v29 (copy) ]]
	v41:DoCleaning()
	if not (v35 and v36) then
		return 0, 0
	end
	for v1, v2 in v35:GetChildren() do
		if v2 ~= v36 and (v2:IsA("Frame") and v2.Name == "Default") then
			v2:Destroy()
		end
	end
	v36.Visible = false
	if not p1 then
		return 0, 0
	end
	local Missions = p1:FindFirstChild("Missions")
	if not Missions then
		return 0, 0
	end
	local list = {}
	for v32, v4 in Missions:GetChildren() do
		if v4:IsA("BoolValue") then
			table.insert(list, v4)
		end
	end
	table.sort(list, function(p1, p2) --[[ Line: 539 ]]
		local v2 = tonumber(p1.Name) or 0
		return v2 < (tonumber(p2.Name) or 0)
	end)
	local v6 = v19.GetMissions(p1 and p1:FindFirstChild("Variant") and p1.Variant.Value or "Default")
	local v72 = if v6 then v6 else {}
	local count = 0
	local count_2 = 0
	for i, v in ipairs(list) do
		local v8, v9, v10
		local v12 = v72[tonumber(v.Name)]
		if v12 then
			count = count + 1
			local v132 = v36:Clone()
			v132.Visible = true
			v132.LayoutOrder = i
			v132.Parent = v35
			local TargetAmount = v:FindFirstChild("TargetAmount")
			if TargetAmount then
				v8 = math.max(1, TargetAmount.Value)
			elseif v12 and v12.Amount then
				v8 = math.max(1, v12.Amount)
			else
				local Amount = v:FindFirstChild("Amount")
				v8 = if Amount then math.max(1, Amount.Value) else 1
			end
			local v192 = v.Value or v:FindFirstChild("Claimed") and v.Claimed.Value
			if v192 then
				count_2 = count_2 + 1
			end
			if v192 then
				v9 = v8
			else
				local Amount = v:FindFirstChild("Amount")
				v9 = if Amount then math.clamp(Amount.Value, 0, v8) elseif v:IsA("BoolValue") and v.Value then v8 else 0
			end
			v41:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(v46))
			local Amount = v:FindFirstChild("Amount")
			if Amount then
				v41:GiveTask(Amount:GetPropertyChangedSignal("Value"):Connect(v46))
			end
			local TargetAmount_2 = v:FindFirstChild("TargetAmount")
			if TargetAmount_2 then
				v41:GiveTask(TargetAmount_2:GetPropertyChangedSignal("Value"):Connect(v46))
			end
			local v22 = v132:FindFirstChild("Content")
			if v22 then
				local QuestDescription = v22:FindFirstChild("QuestDescription")
				if QuestDescription and QuestDescription:IsA("TextLabel") then
					if v12 then
						local Description = v12.Description
						if not Description then
							Description = v13.Descriptions[v12.Type]
							if not Description then
								Description = tostring(v12.Type or "Mission")
							end
						end
						if v12.DoNotFormat then
							v10 = Description
						else
							local v24, v25 = pcall(string.format, Description, v8)
							v10 = if v24 then if v25 then v25 else Description else Description
						end
					else
						v10 = "Unknown mission."
					end
					QuestDescription.Text = v10
				end
				local ProgressBar = v22:FindFirstChild("ProgressBar")
				local v26 = if ProgressBar then ProgressBar:FindFirstChild("Bar") else ProgressBar
				if v26 and v26:IsA("Frame") then
					v26.Size = UDim2.fromScale(math.clamp(v9 / v8, 0, 1), 1)
				end
				local ProgressLabel = v22:FindFirstChild("ProgressLabel")
				if ProgressLabel and ProgressLabel:IsA("TextLabel") then
					ProgressLabel.Text = string.format("%d/%d", v9, v8)
				end
				local PinButton = v22:FindFirstChild("PinButton")
				local v28 = v:FindFirstChild("Pinned") or p1:FindFirstChild("Pinned")
				if PinButton and (PinButton:IsA("GuiButton") and (v28 and v28:IsA("BoolValue"))) then
					local function setPinned() --[[ setPinned | Line: 600 | Upvalues: PinButton (copy), v28 (copy), v192 (copy), v7 (ref) ]]
						PinButton.Visible = v28.Value or not v192
						local Top = PinButton:FindFirstChild("Top")
						local v3 = if Top then Top:FindFirstChild("CrossLabel") else Top
						if v3 and v3:IsA("GuiObject") then
							v3.Visible = v28.Value
						end
						v7.SetButtonColor(PinButton, "Diagonal", if v28.Value then "Red" else "Blue")
					end
					setPinned()
					v41:GiveTask(v28:GetPropertyChangedSignal("Value"):Connect(setPinned))
					v41:GiveTask(v3.new(PinButton, {
						Click = function() --[[ Click | Line: 613 | Upvalues: v29 (ref), p1 (copy), v (copy) ]]
							v29:InvokeServer("LimitedStockUnlocks", p1.Name, v.Name)
						end
					}))
				end
			end
			local Locked = v132:FindFirstChild("Locked")
			if Locked and Locked:IsA("GuiObject") then
				Locked.Visible = false
			end
		end
	end
	return count_2, count
end
v46 = function() --[[ Line: 629 | Upvalues: v43 (ref), setMissionContentVisible (copy), SkipButton (copy), v41 (copy), ProgressLabel (copy), ProgressBar (copy), getMissionFolder (copy), t (copy), v19 (copy), AcceptButton (copy), refreshMissionRows (copy), setOverallMissionProgress (copy), refreshRewardCard (copy) ]]
	if v43 then
		local v1 = getMissionFolder()
		if v1 then
			setMissionContentVisible(true)
			local v2 = getMissionFolder()
			local v3 = if v2 then if v2:FindFirstChild("Claimed") and v2.Claimed.Value then "Completed" elseif v2.Completed.Value then "ReadyToClaim" elseif v2.Started.Value then "InProgress" else "NotStarted" else "NotStarted"
			if v3 == "Completed" then
				t.Close()
				return
			end
			SkipButton.Visible = v19.MissionUnlockRequired(v43) and (v19.MissionUnlockSkippable(v43) and (if v3 == "InProgress" then true else false))
			if v3 == "ReadyToClaim" then
				AcceptButton.Top.TextLabel.Text = "ACCEPT"
			elseif v3 == "InProgress" then
				AcceptButton.Top.TextLabel.Text = "CANCEL"
			else
				AcceptButton.Top.TextLabel.Text = "ACCEPT"
			end
			local v5, v6 = refreshMissionRows(v1)
			setOverallMissionProgress(v5, v6)
			refreshRewardCard()
		else
			setMissionContentVisible(false)
			SkipButton.Visible = false
			v41:DoCleaning()
			if ProgressLabel and ProgressLabel:IsA("TextLabel") then
				ProgressLabel.Text = "No Missions"
			end
			local v7 = ProgressBar and ProgressBar:FindFirstChild("Fill")
			if not (v7 and v7:IsA("Frame")) then
				return
			end
			v7.Size = UDim2.fromScale(0, 1)
		end
	else
		setMissionContentVisible(false)
		SkipButton.Visible = false
		v41:DoCleaning()
		if ProgressLabel and ProgressLabel:IsA("TextLabel") then
			ProgressLabel.Text = "No Missions"
		end
		local v8 = ProgressBar and ProgressBar:FindFirstChild("Fill")
		if not (v8 and v8:IsA("Frame")) then
			return
		end
		v8.Size = UDim2.fromScale(0, 1)
	end
end
local function onAcceptPressed() --[[ onAcceptPressed | Line: 676 | Upvalues: v43 (ref), getMissionFolder (copy), v27 (copy), v44 (ref), v4 (copy), v26 (copy), v14 (copy), v28 (copy), v29 (copy), v46 (ref), hasAnyUnclaimedLimitedStockMission (copy), t (copy) ]]
	if not v43 then
		return
	end
	local v1 = getMissionFolder()
	local v2 = if v1 then if v1:FindFirstChild("Claimed") and v1.Claimed.Value then "Completed" elseif v1.Completed.Value then "ReadyToClaim" elseif v1.Started.Value then "InProgress" else "NotStarted" else "NotStarted"
	if v2 == "ReadyToClaim" then
		local v3 = getMissionFolder()
		if not v3 or (not v3.Completed.Value or v3.Claimed.Value) then
			return
		end
		local v42, v5, v6 = v27:InvokeServer(v3.Name)
		if v42 then
			if v44 and v6 then
				v4:DisplaySlot({
					Type = "Purchased",
					AllowNaming = true,
					MobileClickBackgroundToClose = true,
					Slot = v26:GetItemFolder("Animals"):WaitForChild(v6)
				})
			else
				v14.Notify({
					Preset = "Green",
					Message = "Claimed! Serial #" .. tostring(v5)
				})
			end
		else
			v14.Notify({
				Preset = "Red",
				Message = "Failed to claim mission reward: " .. tostring(v5)
			})
		end
	elseif v2 == "InProgress" then
		local v7 = getMissionFolder()
		if not v7 then
			return
		end
		local v8 = v7.Name
		local v9, v10 = v28:InvokeServer(v8)
		if v9 then
			local Missions = v7:FindFirstChild("Missions")
			if Missions then
				for v11, v12 in Missions:GetChildren() do
					local Pinned = v12:FindFirstChild("Pinned")
					if Pinned and (Pinned:IsA("BoolValue") and Pinned.Value) then
						v29:InvokeServer("LimitedStockUnlocks", v8, v12.Name)
					end
				end
			end
			v14.Notify({
				Message = "Mission cancelled.",
				Preset = "Yellow"
			})
			if v26.MissionsChangedSignal then
				v26.MissionsChangedSignal:Fire()
			end
			v46()
			if not (getMissionFolder() or hasAnyUnclaimedLimitedStockMission()) then
				t.Close()
			end
		else
			v14.Notify({
				Preset = "Red",
				Message = "Failed to cancel mission: " .. tostring(v10)
			})
		end
	end
	v46()
end
local function onSkipPressed() --[[ onSkipPressed | Line: 749 | Upvalues: v43 (ref), getMissionFolder (copy), v19 (copy), v44 (ref), v24 (copy), v8 (copy), v16 (copy), v12 (copy), v3 (copy), v30 (copy), LocalPlayer (copy), v32 (copy), v4 (copy), v26 (copy), v14 (copy), v5 (copy), v25 (copy), v42 (ref), v10 (copy), v31 (copy), v33 (copy) ]]
	if not v43 then
		return
	end
	local v1 = getMissionFolder()
	if not v1 then
		return
	end
	local v2 = getMissionFolder()
	if (if v2 then if v2:FindFirstChild("Claimed") and v2.Claimed.Value then "Completed" elseif v2.Completed.Value then "ReadyToClaim" elseif v2.Started.Value then "InProgress" else "NotStarted" else "NotStarted") ~= "InProgress" then
		return
	end
	if not (v19.MissionUnlockRequired(v43) and v19.MissionUnlockSkippable(v43)) then
		return
	end
	if not v44 then
		local ProductId = v25.BuyInStock.ProductId
		local ProductId_2 = v25.BuyOutOfStock.ProductId
		local v45 = v8.GetByName(v43.Currency)
		local function promptRobuxAccessoryPurchase() --[[ promptRobuxAccessoryPurchase | Line: 910 | Upvalues: v43 (ref), v42 (ref), v10 (ref), ProductId (copy), ProductId_2 (copy), v31 (ref), v1 (copy), v12 (ref), LocalPlayer (ref) ]]
			local v13
			if v43 and (v43.MaxStock and v42) then
				local v2 = v10:GetSoldCountValue(v42)
				v13 = if v2 then math.max(0, v43.MaxStock - v2.Value) else v43.MaxStock
			else
				v13 = (1 / 0)
			end
			v31:FireServer(v43.StockId, true, v1.Name)
			v12.PromptPurchase(LocalPlayer, v13 > 0 and ProductId or ProductId_2, "Product")
		end
		local function promptRobuxMissionAccessorySoldOut() --[[ promptRobuxMissionAccessorySoldOut | Line: 917 | Upvalues: v43 (ref), v42 (ref), v10 (ref), ProductId (copy), ProductId_2 (copy), v16 (ref), v12 (ref), v31 (ref), v1 (copy), LocalPlayer (ref) ]]
			local v13
			if v43 and (v43.MaxStock and v42) then
				local v2 = v10:GetSoldCountValue(v42)
				v13 = if v2 then math.max(0, v43.MaxStock - v2.Value) else v43.MaxStock
			else
				v13 = (1 / 0)
			end
			local v5 = v13 > 0 and ProductId or ProductId_2
			v16.Prompt({
				Type = "SoldOutLimitedMissionAccessory",
				Setup = function(p1, p2) --[[ Setup | Line: 923 | Upvalues: v12 (ref), v5 (copy) ]]
					p2.Maid:GiveTask(task.spawn(function() --[[ Line: 924 | Upvalues: v12 (ref), v5 (ref), p1 (copy) ]]
						local v1 = v12.GetProductInfo(v5, Enum.InfoType.Product)
						local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
						p1.Content.RunButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
					end))
				end,
				Run = function() --[[ Run | Line: 930 | Upvalues: v31 (ref), v43 (ref), v1 (ref), v12 (ref), LocalPlayer (ref), v5 (copy) ]]
					v31:FireServer(v43.StockId, true, v1.Name)
					v12.PromptPurchase(LocalPlayer, v5, "Product")
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 935 ]]
					return true
				end
			})
		end
		v16.Prompt({
			Type = "PurchaseLimitedAccessory",
			Setup = function(p1, p2) --[[ Setup | Line: 943 | Upvalues: v45 (copy), v5 (ref), v43 (ref), v12 (ref), ProductId (copy), v3 (ref), v42 (ref), v10 (ref), ProductId_2 (copy), v31 (ref), v1 (copy), LocalPlayer (ref), v16 (ref) ]]
				if v45 then
					p1.Content.Price.IconLabel.Image = v45.Image
				end
				p1.Content.Price.TextLabel.Text = v5.splice(v43.Price)
				p2.Maid:GiveTask(task.spawn(function() --[[ Line: 949 | Upvalues: v12 (ref), ProductId (ref), p1 (copy) ]]
					local v1 = v12.GetProductInfo(ProductId, Enum.InfoType.Product)
					local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
					p1.Content.PremiumPrice.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
				end))
				p2.Maid:GiveTask(v3.new(p1.Content.PremiumPrice, {
					Click = function() --[[ Click | Line: 956 | Upvalues: v43 (ref), v42 (ref), v10 (ref), ProductId (ref), ProductId_2 (ref), v31 (ref), v1 (ref), v12 (ref), LocalPlayer (ref), v16 (ref) ]]
						local v13
						if v43 and (v43.MaxStock and v42) then
							local v2 = v10:GetSoldCountValue(v42)
							v13 = if v2 then math.max(0, v43.MaxStock - v2.Value) else v43.MaxStock
						else
							v13 = (1 / 0)
						end
						v31:FireServer(v43.StockId, true, v1.Name)
						v12.PromptPurchase(LocalPlayer, v13 > 0 and ProductId or ProductId_2, "Product")
						v16.Close()
					end
				}))
			end,
			Run = function() --[[ Run | Line: 962 | Upvalues: v31 (ref), v43 (ref), v1 (copy), v33 (ref), v14 (ref), v42 (ref), v10 (ref), ProductId (copy), ProductId_2 (copy), v12 (ref), LocalPlayer (ref), promptRobuxMissionAccessorySoldOut (copy) ]]
				v31:FireServer(v43.StockId, true, v1.Name)
				local v13, v2 = v33:InvokeServer(v43.StockId)
				if v13 then
					v14.Notify({
						Preset = "Green",
						Message = "Purchased! Serial #" .. tostring(v2)
					})
					return true
				end
				if v2 == "CannotAfford" then
					local v3
					if v43 and (v43.MaxStock and v42) then
						local v4 = v10:GetSoldCountValue(v42)
						v3 = if v4 then math.max(0, v43.MaxStock - v4.Value) else v43.MaxStock
					else
						v3 = (1 / 0)
					end
					v31:FireServer(v43.StockId, true, v1.Name)
					v12.PromptPurchase(LocalPlayer, v3 > 0 and ProductId or ProductId_2, "Product")
					return true
				elseif v2 == "LimitReached" then
					promptRobuxMissionAccessorySoldOut()
					return true
				else
					v14.Notify({
						Preset = "Red",
						Message = tostring(v2)
					})
					return false
				end
			end,
			Cancel = function() --[[ Cancel | Line: 987 ]]
				return true
			end
		})
		return
	end
	local ProductId = v24.BuyOutOfStockFertile.ProductId
	local ProductId_2 = v24.BuyOutOfStockInfertile.ProductId
	local v52 = v8.GetByName(v43.Currency)
	local function promptRobuxMissionHorseSoldOut() --[[ promptRobuxMissionHorseSoldOut | Line: 775 | Upvalues: v16 (ref), v12 (ref), ProductId (copy), ProductId_2 (copy), v3 (ref), v30 (ref), v43 (ref), v1 (copy), LocalPlayer (ref) ]]
		v16.Prompt({
			Type = "SoldOutLimitedMissionHorse",
			Setup = function(p1, p2) --[[ Setup | Line: 778 | Upvalues: v12 (ref), ProductId (ref), ProductId_2 (ref), v3 (ref), v30 (ref), v43 (ref), v1 (ref), LocalPlayer (ref), v16 (ref) ]]
				p2.Maid:GiveTask(task.spawn(function() --[[ Line: 779 | Upvalues: v12 (ref), ProductId (ref), p1 (copy), ProductId_2 (ref) ]]
					local v1 = v12.GetProductInfo(ProductId, Enum.InfoType.Product)
					local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
					p1.Content.FertileButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
					local v3 = v12.GetProductInfo(ProductId_2, Enum.InfoType.Product)
					local v4 = if v3 then v3.PriceInRobux or "N/A" else "N/A"
					p1.Content.InfertileButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v4)
				end))
				p2.Maid:GiveTask(v3.new(p1.Content.FertileButton, {
					Click = function() --[[ Click | Line: 790 | Upvalues: v30 (ref), v43 (ref), v1 (ref), v12 (ref), LocalPlayer (ref), ProductId (ref), v16 (ref) ]]
						v30:FireServer(v43.StockId, "Fertile", true, v1.Name)
						v12.PromptPurchase(LocalPlayer, ProductId, "Product")
						v16.Close()
					end
				}))
				p2.Maid:GiveTask(v3.new(p1.Content.InfertileButton, {
					Click = function() --[[ Click | Line: 798 | Upvalues: v30 (ref), v43 (ref), v1 (ref), v12 (ref), LocalPlayer (ref), ProductId_2 (ref), v16 (ref) ]]
						v30:FireServer(v43.StockId, "Infertile", true, v1.Name)
						v12.PromptPurchase(LocalPlayer, ProductId_2, "Product")
						v16.Close()
					end
				}))
			end,
			Cancel = function() --[[ Cancel | Line: 805 ]]
				return true
			end
		})
	end
	local function promptRobuxHorsePurchase(p1) --[[ promptRobuxHorsePurchase | Line: 811 | Upvalues: ProductId_2 (copy), ProductId (copy), v30 (ref), v43 (ref), v1 (copy), v12 (ref), LocalPlayer (ref) ]]
		v30:FireServer(v43.StockId, p1, true, v1.Name)
		v12.PromptPurchase(LocalPlayer, p1 == "Infertile" and ProductId_2 or ProductId, "Product")
	end
	local function purchaseHorseWithCoins(p1) --[[ purchaseHorseWithCoins | Line: 817 | Upvalues: v30 (ref), v43 (ref), v1 (copy), v32 (ref), v4 (ref), v26 (ref), ProductId_2 (copy), ProductId (copy), v12 (ref), LocalPlayer (ref), promptRobuxMissionHorseSoldOut (copy), v14 (ref) ]]
		v30:FireServer(v43.StockId, p1, true, v1.Name)
		local v13, v2, v3 = v32:InvokeServer(v43.StockId, p1)
		if v13 then
			if not v3 then
				return true
			end
			v4:DisplaySlot({
				Type = "Purchased",
				AllowNaming = true,
				MobileClickBackgroundToClose = true,
				Slot = v26:GetItemFolder("Animals"):WaitForChild(v3)
			})
			return true
		elseif v2 == "CannotAfford" then
			v30:FireServer(v43.StockId, p1, true, v1.Name)
			v12.PromptPurchase(LocalPlayer, p1 == "Infertile" and ProductId_2 or ProductId, "Product")
			return true
		elseif v2 == "LimitReached" then
			promptRobuxMissionHorseSoldOut()
			return true
		else
			v14.Notify({
				Preset = "Red",
				Message = tostring(v2)
			})
			return false
		end
	end
	if v43.FertileChoice == true then
		v16.Prompt({
			Type = "LimitedHorseChoice",
			Setup = function(p1, p2) --[[ Setup | Line: 850 | Upvalues: v52 (copy), v5 (ref), v43 (ref), v12 (ref), ProductId (copy), ProductId_2 (copy), v3 (ref), purchaseHorseWithCoins (copy), v16 (ref) ]]
				if v52 then
					p1.Content.PriceContainer.FertilePrice.IconLabel.Image = v52.Image
					p1.Content.PriceContainer.InfertilePrice.IconLabel.Image = v52.Image
				end
				p1.Content.PriceContainer.FertilePrice.TextLabel.Text = v5.splice(v43.FertilePrice)
				p1.Content.PriceContainer.InfertilePrice.TextLabel.Text = v5.splice(v43.InfertilePrice)
				p2.Maid:GiveTask(task.spawn(function() --[[ Line: 858 | Upvalues: v12 (ref), ProductId (ref), p1 (copy), ProductId_2 (ref) ]]
					local v1 = v12.GetProductInfo(ProductId, Enum.InfoType.Product)
					local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
					p1.Content.RobuxPriceContainer.FertilePrice.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
					local v3 = v12.GetProductInfo(ProductId_2, Enum.InfoType.Product)
					local v4 = if v3 then v3.PriceInRobux or "N/A" else "N/A"
					p1.Content.RobuxPriceContainer.InfertilePrice.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v4)
				end))
				p2.Maid:GiveTask(v3.new(p1.Content.Fertile, {
					Click = function() --[[ Click | Line: 869 | Upvalues: purchaseHorseWithCoins (ref), v16 (ref) ]]
						purchaseHorseWithCoins("Fertile")
						v16.Close()
					end
				}))
				p2.Maid:GiveTask(v3.new(p1.Content.Infertile, {
					Click = function() --[[ Click | Line: 876 | Upvalues: purchaseHorseWithCoins (ref), v16 (ref) ]]
						purchaseHorseWithCoins("Infertile")
						v16.Close()
					end
				}))
			end,
			Cancel = function() --[[ Cancel | Line: 882 ]]
				return true
			end
		})
	else
		v16.Prompt({
			Type = "PurchaseLimitedHorse",
			Setup = function(p1) --[[ Setup | Line: 889 | Upvalues: v52 (copy), v5 (ref), v43 (ref) ]]
				if v52 then
					p1.Content.Price.IconLabel.Image = v52.Image
				end
				p1.Content.Price.TextLabel.Text = v5.splice(v43.Price)
			end,
			Run = function() --[[ Run | Line: 895 | Upvalues: purchaseHorseWithCoins (copy) ]]
				return purchaseHorseWithCoins(nil)
			end,
			Cancel = function() --[[ Cancel | Line: 898 ]]
				return true
			end
		})
	end
end
function t.SetStockContext(p1) --[[ SetStockContext | Line: 993 | Upvalues: v40 (copy), v42 (ref), v45 (ref), clearRewardViewport (copy), v43 (ref), v44 (ref), v23 (copy), v22 (copy), SkipButton (copy), v26 (copy), v46 (ref), v10 (copy) ]]
	v40:DoCleaning()
	v42 = p1
	v45 = nil
	clearRewardViewport()
	local v1, v2
	if p1 then
		local v3, v4
		for v5, v6 in v23 do
			if v6.StockId == p1 then
				v3 = v6
				v4 = true
				v43 = v3
				v44 = v4
				if not v3 then
					SkipButton.Visible = false
					return
				end
				if v26.MissionsChangedSignal then
					v40:GiveTask(v26.MissionsChangedSignal:Connect(v46))
				end
				v1 = v26.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
				if v1 then
					v40:GiveTask(v1.ChildAdded:Connect(v46))
					v40:GiveTask(v1.ChildRemoved:Connect(v46))
				end
				if not p1 then
					v46()
					return
				end
				v2 = v10:GetSoldCountValue(p1)
				if not v2 then
					v46()
					return
				end
				v40:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(v46))
				v46()
				return
			end
		end
		for v7, v8 in v22.LimitedStockAccessories do
			if v8.StockId == p1 then
				v3 = v8
				v4 = false
				break
			end
		end
		v43 = v3
		v44 = v4
	else
		v43 = nil
		v44 = false
	end
	if not v43 then
		SkipButton.Visible = false
		return
	end
	if v26.MissionsChangedSignal then
		v40:GiveTask(v26.MissionsChangedSignal:Connect(v46))
	end
	v1 = v26.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if v1 then
		v40:GiveTask(v1.ChildAdded:Connect(v46))
		v40:GiveTask(v1.ChildRemoved:Connect(v46))
	end
	if p1 then
		v2 = v10:GetSoldCountValue(p1)
		if v2 then
			v40:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(v46))
		end
	end
	v46()
end
function t.Open(p1) --[[ Open | Line: 1031 | Upvalues: t (copy), v43 (ref), v6 (copy), ContainerFrame (copy) ]]
	t.SetStockContext(p1)
	if v43 then
		v6.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay"
		})
	end
end
function t.Close() --[[ Close | Line: 1042 | Upvalues: v40 (copy), v45 (ref), clearRewardViewport (copy), v6 (copy), ContainerFrame (copy) ]]
	v40:DoCleaning()
	v45 = nil
	clearRewardViewport()
	v6.CloseMainFrame(ContainerFrame)
end
function t.Init() --[[ Init | Line: 1049 | Upvalues: v6 (copy), ContainerFrame (copy), v34 (copy), v40 (copy), v45 (ref), clearRewardViewport (copy), Menu (copy), v39 (copy), v3 (copy), t (copy) ]]
	v6.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = v34
	})
	v6.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1059 | Upvalues: v40 (ref), v45 (ref), clearRewardViewport (ref) ]]
		v40:DoCleaning()
		v45 = nil
		clearRewardViewport()
	end)
	local CloseButton = Menu:FindFirstChild("CloseButton")
	if not (CloseButton and CloseButton:IsA("GuiButton")) then
		return
	end
	v39:GiveTask(v3.new(CloseButton, {
		Click = t.Close
	}))
end
v39:GiveTask(v3.new(AcceptButton, {
	Click = onAcceptPressed
}))
v39:GiveTask(v3.new(SkipButton, {
	Click = onSkipPressed
}))
SkipButton.Visible = false
t.Init()
return t