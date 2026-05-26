-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
local v4 = Sonar("AnimalGridButton")
local v5 = Sonar("AnimalRiggerService")
local v6 = Sonar("AnimalInfoFrame")
local v7 = Sonar("Button")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("SellingAnimalClient")
local v10 = Sonar("BreedingGui")
local v11 = Sonar("AnimalDataService")
local v12 = Sonar("GridSort")
local v13 = Sonar("TimeUtils")
local v14 = Sonar("DisplayAnimalClient")
local v15 = Sonar("GuiUtils")
local v16 = Sonar("Table")
local v17 = Sonar("Signal")
local v18 = Sonar("FormatNumber")
local v19 = Sonar("IssueResponseClient")
local v20 = Sonar("NotificationsClient")
local v21 = Sonar("PromptClient")
local v22 = Sonar("FormatString")
local v23 = Sonar("CharacterControls")
local v24 = Sonar("UINavigator")
local v25 = Sonar("EquipmentService")
local v26 = Sonar("CustomiseAnimalGui")
local v27 = Sonar("LevelUtils")
local v28 = Sonar("MarketplaceUtils")
local v29 = Sonar("FoldersGui")
local v30 = Sonar("TutorialService")
local v31 = Sonar("QuickFeedGui")
local v32 = Sonar("ConsumablesService")
local v33 = Sonar("AdClient")
local v34 = Sonar("spr")
local v35 = Sonar("Constants")
local FolderPrices = v35.FolderPrices
local LocalPlayer = game:GetService("Players").LocalPlayer
local v36 = Sonar("PlayerWrapper").GetClient()
local StablesGui = LocalPlayer.PlayerGui:WaitForChild("StablesGui")
local ContainerFrame = StablesGui.ContainerFrame
local Horses = ContainerFrame.Menu.Content.Horses
local Selling = ContainerFrame.Menu.Content.Selling
local Moving = ContainerFrame.Menu.Content.Moving
local v37 = v8.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v38 = v36:GetItemFolder("Animals")
local v39 = v3.new()
local t2 = {}
local v40 = v3.new()
local v41 = nil
local t3 = {}
local t4 = {}
local t5 = {}
local v42 = false
local v43 = v17.new()
local v44 = false
local t6 = {}
local v45 = nil
local v46 = nil
local v47 = tick()
local v48 = false
t.SelectionSignal = v17.new()
local v49 = v17.new()
local v50 = v3.new()
local v51 = v12.new({
	Filters = {
		PreFilter = function(p1) --[[ PreFilter | Line: 99 | Upvalues: v46 (ref) ]]
			if v46 == nil then
				return true
			end
			return p1.SlotValue.Folder.Value == v46
		end
	},
	Priority = {
		{
			Priority = 2,
			Run = function(p1) --[[ Run | Line: 111 ]]
				return p1.EquippedLabel.Visible
			end,
			Changed = function(p1) --[[ Changed | Line: 114 ]]
				return p1.EquippedLabel:GetPropertyChangedSignal("Visible")
			end
		},
		{
			Priority = 1,
			Run = function(p1) --[[ Run | Line: 121 ]]
				return p1.SlotValue.Favorite.Value
			end,
			Changed = function(p1) --[[ Changed | Line: 124 ]]
				return p1.SlotValue.Favorite:GetPropertyChangedSignal("Value")
			end
		}
	},
	Frame = ContainerFrame.Menu.Content.Sorting,
	EmptyString = {
		Text = "You do not have any horses!",
		Label = Horses.EmptyLabel
	},
	Sorts = {
		Alphabet = {
			DisplayName = "Name",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 141 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				if p3 then
					return v2 < v1
				else
					return v1 < v2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 150 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		},
		Gender = {
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 156 | Upvalues: v11 (copy) ]]
				local v1 = v11.GetGender(p1.SlotValue)
				local v2 = v11.GetGender(p2.SlotValue)
				local v3 = if v1 == "Both" then 3 elseif v1 == "Female" then 1 else 2
				local v4 = if v2 == "Both" then 3 elseif v2 == "Female" then 1 else 2
				if p3 then
					return v4 < v3
				else
					return v3 < v4
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 169 ]]
				return p1.SlotValue.Gender:GetPropertyChangedSignal("Value")
			end
		},
		TimeReceived = {
			DisplayName = "Recent",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 176 ]]
				local TimeReceived = p1.SlotValue.TimeReceived.Value
				local TimeReceived_2 = p2.SlotValue.TimeReceived.Value
				if p3 then
					return TimeReceived < TimeReceived_2
				else
					return TimeReceived_2 < TimeReceived
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 185 ]]
				return p1.SlotValue.TimeReceived:GetPropertyChangedSignal("Value")
			end
		},
		Value = {
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 191 | Upvalues: v11 (copy) ]]
				local v1 = v11.GetPriceForSlot(p1.SlotValue)
				local v2 = v11.GetPriceForSlot(p2.SlotValue)
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 200 ]]
				return p1.SlotAttributesChangedSignal
			end
		},
		TotalMutations = {
			DisplayName = "# Mutations",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 207 | Upvalues: v11 (copy) ]]
				local v1 = v11.GetTotalMutations(p1.SlotValue)
				local v2 = v11.GetTotalMutations(p2.SlotValue)
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 216 ]]
				return p1.MutationsChangedSignal
			end
		},
		TotalTraits = {
			DisplayName = "# Traits",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 223 | Upvalues: v11 (copy) ]]
				local v1 = v11.GetTotalTraits(p1.SlotValue)
				local v2 = v11.GetTotalTraits(p2.SlotValue)
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 232 ]]
				return p1.SlotAttributesChangedSignal
			end
		},
		Age = {
			DisplayName = "Age",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 239 ]]
				local Age = p1.SlotValue.Age.Value
				local Age_2 = p2.SlotValue.Age.Value
				if p3 then
					return Age < Age_2
				else
					return Age_2 < Age
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 248 ]]
				return p1.SlotValue.Age:GetPropertyChangedSignal("Value")
			end
		},
		Pregnant = {
			DisplayName = "Has Child",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 255 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				local v3 = if #p1.SlotValue.Child.Value > 0 then true else false
				local v4 = if #p2.SlotValue.Child.Value > 0 then true else false
				if v3 and v4 then
					return v1 < v2
				else
					if v3 then
						return not p3
					end
					if v4 then
						return p3
					end
					return v1 < v2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 271 ]]
				return { p1.SlotValue.Child:GetPropertyChangedSignal("Value"), p1.NameLabel:GetPropertyChangedSignal("Text") }
			end
		},
		Size = {
			DisplayName = "Size",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 281 | Upvalues: v11 (copy) ]]
				local SizeMultiplier = v11.GetSize(p1.SlotValue).SizeMultiplier
				local SizeMultiplier_2 = v11.GetSize(p2.SlotValue).SizeMultiplier
				if p3 then
					return SizeMultiplier < SizeMultiplier_2
				else
					return SizeMultiplier_2 < SizeMultiplier
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 290 ]]
				return p1.SlotValue.SizeType:GetPropertyChangedSignal("Value")
			end
		},
		Species = {
			DisplayName = "Species",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 297 ]]
				local Species = p1.SlotValue.Species.Value
				local Species_2 = p2.SlotValue.Species.Value
				if p3 then
					return Species < Species_2
				else
					return Species_2 < Species
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 307 ]]
				return p1.SlotValue.Species:GetPropertyChangedSignal("Value")
			end
		}
	},
	Search = {
		TextBox = ContainerFrame.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 316 | Upvalues: v11 (copy) ]]
			if #p1 <= 0 then
				return true
			end
			local v1 = p1:lower():gsub("%s", "")
			local v2 = p2.NameLabel.Text:lower()
			local SlotValue = p2.SlotValue
			local v3, v4
			if SlotValue then
				v3 = SlotValue.Species.Value
				if v3 then
					v4 = v1
				else
					v3 = ""
					v4 = v1
				end
			else
				v3 = ""
				v4 = v1
			end
			local v5 = v11.GetByName(v3)
			local t = { v2, (v3:lower()) }
			local v6 = nil
			if v5 and v5.SearchTerms then
				table.move(v5.SearchTerms, 1, #v5.SearchTerms, #t + 1, t)
			end
			for v7, v8 in t do
				t[v7] = v8:lower():gsub("%s", "")
			end
			for v9, v10 in t do
				local v112 = string.find(v10, v4, 1, true)
				v6 = v112
				if v112 then
					break
				end
			end
			return v6
		end
	}
})
local function setEquipButtons() --[[ setEquipButtons | Line: 358 | Upvalues: v5 (copy), v36 (copy), v41 (ref), t3 (copy) ]]
	local v1 = v5.IsAnimalEquipped(v36, v41)
	local v2 = if v41 then v41.InStorage.Value or false else false
	for k, v in pairs(t3.Equip) do
		v.Visible = not v1 and not v2
	end
	for k, v in pairs(t3.Unequip) do
		v.Visible = if v1 then not v2 else v1
	end
end
local function setBirthAndBreedButtons() --[[ setBirthAndBreedButtons | Line: 370 | Upvalues: v11 (copy), v36 (copy), v41 (ref), t3 (copy), v13 (copy), v33 (copy) ]]
	local v1 = v11.CanBirthSlot(v36, v41)
	local v2 = v11.GetAge(v41) ~= "Adult"
	if v1 == true or (v1 == "PregnantTimer" or v1 == "AtAnimalLimit") then
		for k, v in pairs(t3.Birth) do
			local v3 = v11.GetBirthTimeLeft(v36, v41)
			v.Top.TextLabel.Text = if v3 > 0 then "Claim Child (" .. v13.FormatDHMS(v3) .. ")" or "Claim Child" else "Claim Child"
			v.Visible = true
		end
		for k, v in pairs(t3.Breed) do
			v.Visible = false
		end
	else
		for k, v in pairs(t3.Breed) do
			local v5 = v11.GetBirthTimeLeft(v36, v41)
			v.Top.TextLabel.Text = v5 > 0 and "Breed (" .. v13.FormatDHMS(v5) .. ")" or (if v2 then "Breed (Too Young)" else "Breed")
			v.Visible = true
		end
		for k, v in pairs(t3.Birth) do
			v.Visible = false
		end
	end
	for k, v in pairs(t3.Breed) do
		if v2 then
			v.Top.BackgroundTransparency = 0.9
			v.Top.TextLabel.TextTransparency = 0.75
			v.Shadow.BackgroundTransparency = 0.75
			continue
		end
		v.Top.BackgroundTransparency = 0
		v.Top.TextLabel.TextTransparency = 0
		v.Shadow.BackgroundTransparency = 0
	end
	local v7 = false
	local v8 = v41
	if v8 then
		local v9 = v11.GetGender(v8) == "Female"
		local v10 = if #v8.Child.Value > 0 then true else false
		if v9 and (v10 and (v11.GetBirthTimeLeft(v36, v8) > 0 and v33.IsAdAvailable())) then
			v7 = v33.GetHasBreedingSpeedUpAvailable() and v33.GetIsBreedingSpeedUpTarget(v8.Name)
		end
	end
	local v12 = pairs
	for v14, v15 in v12(t3.Birth or {}) do
		local AdButton = v15:FindFirstChild("AdButton", true)
		if AdButton then
			AdButton.Visible = v7
		end
	end
end
local function setEquipmentButtons() --[[ setEquipmentButtons | Line: 428 ]] end
local function getTotalSellPrice() --[[ getTotalSellPrice | Line: 460 | Upvalues: t4 (ref), v11 (copy) ]]
	local sum = 0
	for k, v in pairs(t4) do
		sum = sum + v11.GetPriceForSlot(k)
	end
	return sum
end
local function selectAnimalToSell(p1) --[[ selectAnimalToSell | Line: 468 | Upvalues: t4 (ref), v16 (copy), v36 (copy), v19 (copy), v11 (copy), t2 (ref), v4 (copy), LocalPlayer (copy), Selling (copy), v18 (copy) ]]
	if p1 and t4[p1] then
		t2[p1]:SetSold(false)
		if t4[p1] then
			t4[p1]:Destroy()
			t4[p1] = nil
		end
	elseif p1 then
		if v16.Count(t4) + 1 == #v36:GetItemFolder("Animals"):GetChildren() then
			v19.NotifyIssue("CantSellLastHorse")
			return
		end
		local v1 = v11.CanSellSlot(v36, p1)
		if v1 ~= true then
			v19.NotifyIssue(v1)
			return
		end
		t2[p1]:SetSold(true)
		t4[p1] = v4.new({
			ForceVisible = true,
			SlotValue = p1,
			Owner = LocalPlayer,
			ParentFrame = Selling.Content.List
		})
	end
	local ValueLabel = Selling.Content.TotalAmount:FindFirstChild("ValueLabel", true)
	local sum = 0
	for k, v in pairs(t4) do
		sum = sum + v11.GetPriceForSlot(k)
	end
	ValueLabel.Text = v18.splice(sum)
	Selling.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t4)
end
local function selectAnimalToMove(p1) --[[ selectAnimalToMove | Line: 502 | Upvalues: t6 (ref), v4 (copy), LocalPlayer (copy), Moving (copy), v45 (ref), t2 (ref), v16 (copy) ]]
	if p1 and t6[p1] then
		t6[p1]:Destroy()
		t6[p1] = nil
		t2[p1].Frame.Content.Move.Visible = false
	elseif p1 then
		t6[p1] = v4.new({
			ForceVisible = true,
			ShowSellValue = false,
			SlotValue = p1,
			Owner = LocalPlayer,
			ParentFrame = Moving.Content.List,
			Icon = v45.Icon.Value
		})
		if v45 then
			t2[p1].Frame.Content.Move.Icon.Image = v45.Icon.Value
		end
		t2[p1].Frame.Content.Move.Visible = true
	end
	Moving.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t6)
end
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 532 | Upvalues: ContainerFrame (copy) ]]
	if p1 then
		ContainerFrame.Menu.Content.HorseInfo.Visible = true
		ContainerFrame.TabButtons.Visible = true
		ContainerFrame.Menu.Content.NotSelected.Visible = false
	else
		ContainerFrame.Menu.Content.HorseInfo.Visible = false
		ContainerFrame.TabButtons.Visible = false
		ContainerFrame.Menu.Content.NotSelected.Visible = true
	end
end
local function setMultiSellMode(p1) --[[ setMultiSellMode | Line: 544 | Upvalues: v42 (ref), v43 (copy), t4 (ref), v41 (ref), selectAnimalToSell (copy), ContainerFrame (copy), Selling (copy), v24 (copy), t2 (ref) ]]
	v42 = p1
	v43:Fire()
	if p1 then
		if t4[v41] or not v41 then
			ContainerFrame.Menu.Content.HorseInfo.Visible = false
			Selling.Visible = true
			v24.SetHUDNavigationEnabled(false)
			return
		end
		selectAnimalToSell(v41)
		ContainerFrame.Menu.Content.HorseInfo.Visible = false
		Selling.Visible = true
		v24.SetHUDNavigationEnabled(false)
	else
		for k, v in pairs(t2) do
			v:SetSold(false)
		end
		for k, v in pairs(t4) do
			v:Destroy()
		end
		t4 = {}
		selectAnimalToSell()
		if v41 then
			ContainerFrame.Menu.Content.HorseInfo.Visible = true
			ContainerFrame.TabButtons.Visible = true
			ContainerFrame.Menu.Content.NotSelected.Visible = false
		else
			ContainerFrame.Menu.Content.HorseInfo.Visible = false
			ContainerFrame.TabButtons.Visible = false
			ContainerFrame.Menu.Content.NotSelected.Visible = true
		end
		Selling.Visible = false
		v24.SetHUDNavigationEnabled(true)
	end
end
local function setMultiMoveMode() --[[ setMultiMoveMode | Line: 573 | Upvalues: v44 (ref), Moving (copy), ContainerFrame (copy), v24 (copy), t6 (ref), t2 (ref) ]]
	v44 = not v44
	if v44 then
		Moving.Visible = true
		ContainerFrame.Menu.Content.HorseInfo.Visible = false
		v24.SetHUDNavigationEnabled(false)
		return
	end
	Moving.Visible = false
	ContainerFrame.Menu.Content.HorseInfo.Visible = true
	for v1, v2 in t6 do
		t6[v1]:Destroy()
		t2[v1].Frame.Content.Move.Visible = false
	end
	t6 = {}
	v24.SetHUDNavigationEnabled(true)
end
local function selectAnimal(p1, p2) --[[ selectAnimal | Line: 595 | Upvalues: ContainerFrame (copy), t (copy), v44 (ref), selectAnimalToMove (copy), v42 (ref), selectAnimalToSell (copy), setMultiSellMode (copy), t2 (ref), v41 (ref), v40 (copy), v48 (ref), v6 (copy), LocalPlayer (copy), v35 (copy), setEquipmentButtons (copy), v13 (copy), setBirthAndBreedButtons (copy), v36 (copy), setEquipButtons (copy), Moving (copy), v16 (copy), t6 (ref) ]]
	if not ContainerFrame:FindFirstChild("Menu") then
		return
	end
	t.SelectionSignal:Fire()
	if v44 then
		selectAnimalToMove(p1)
		return
	end
	if v42 and not p2 then
		if p1 then
			selectAnimalToSell(p1)
		else
			setMultiSellMode(false)
		end
	else
		local v1 = t2[v41]
		if v1 then
			v1:Deselect()
		end
		v40:DoCleaning()
		v41 = p1
		if p1 then
			v48 = true
			local v2 = t2[p1]
			if v2 then
				v2:Select()
			end
			v40:GiveTask(v6.new({
				SlotValue = p1,
				Owner = LocalPlayer,
				Frame = ContainerFrame.Menu.Content.HorseInfo,
				TabButtons = ContainerFrame.TabButtons
			}))
			for k, v in pairs(p1.Upgrades:GetChildren()) do
				v40:GiveTask(v35.GameStateChangedSignal:Connect(setEquipmentButtons))
				v40:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setEquipmentButtons))
			end
			for k, v in pairs({ p1.Child:GetPropertyChangedSignal("Value"), v13.OnTimeChanged }) do
				v40:GiveTask(v:Connect(setBirthAndBreedButtons))
			end
			setBirthAndBreedButtons()
			v40:GiveTask(v36.EquippedAnimalChangedSignal:Connect(function(p12) --[[ Line: 644 | Upvalues: p1 (copy), setEquipButtons (ref) ]]
				if p12 == p1.Name then
					setEquipButtons()
				end
			end))
			v40:GiveTask(p1.InStorage:GetPropertyChangedSignal("Value"):Connect(setEquipButtons))
			setEquipButtons()
			ContainerFrame.Menu.Content.HorseInfo.Visible = true
			ContainerFrame.TabButtons.Visible = true
			ContainerFrame.Menu.Content.NotSelected.Visible = false
			v48 = false
		else
			if v42 then
				setMultiSellMode(false)
				return
			end
			if v44 then
				Moving.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t6)
			else
				ContainerFrame.Menu.Content.HorseInfo.Visible = false
				ContainerFrame.TabButtons.Visible = false
				ContainerFrame.Menu.Content.NotSelected.Visible = true
			end
		end
	end
end
local function setStorageCapacityLabel() --[[ setStorageCapacityLabel | Line: 668 | Upvalues: v36 (copy), ContainerFrame (copy) ]]
	pcall(function() --[[ Line: 669 | Upvalues: v36 (ref), ContainerFrame (ref) ]]
		local v1 = v36:GetItemLimit("Animals")
		ContainerFrame.Menu.Content.StorageCapacity.Content.TextLabel.Text = v1.Get() .. "/" .. v1.GetLimit()
	end)
end
local function createAnimal(p1, p2) --[[ createAnimal | Line: 677 | Upvalues: v4 (copy), LocalPlayer (copy), v49 (copy), Horses (copy), v7 (copy), v41 (ref), v42 (ref), v44 (ref), v48 (ref), selectAnimal (copy), setStorageCapacityLabel (copy), v43 (copy), t2 (ref), v51 (copy) ]]
	local v1, v2
	if p2 then
		v1 = v4.new({
			ShowBreedWaitIndicator = true,
			SlotValue = p1,
			Owner = LocalPlayer,
			PregnancyChangedSignal = v49,
			ParentFrame = Horses
		})
		v1:GiveTask(v7.new(v1.Frame, {
			Click = function() --[[ Click | Line: 693 | Upvalues: v41 (ref), p1 (copy), v42 (ref), v44 (ref), v48 (ref), selectAnimal (ref) ]]
				if v41 == p1 and not (v42 or v44) then
					return
				end
				if not v48 then
					selectAnimal(p1)
				end
			end
		}))
		v1:GiveTask(task.spawn(function() --[[ Line: 705 | Upvalues: v1 (copy), p1 (copy), setStorageCapacityLabel (ref) ]]
			v1:GiveTask(p1:WaitForChild("InStorage"):GetPropertyChangedSignal("Value"):Connect(setStorageCapacityLabel))
		end))
		v2 = v1.Frame:FindFirstChild("Sell", true)
		v1:GiveTask(v43:Connect(function() --[[ setGridSellLabel | Line: 712 | Upvalues: v2 (copy), v42 (ref) ]]
			v2.Visible = v42
		end))
		v2.Visible = v42
		t2[p1] = v1
		v51:Add(v1, p2)
		return
	end
	task.wait(0.5)
	v1 = v4.new({
		ShowBreedWaitIndicator = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		PregnancyChangedSignal = v49,
		ParentFrame = Horses
	})
	v1:GiveTask(v7.new(v1.Frame, {
		Click = function() --[[ Click | Line: 693 | Upvalues: v41 (ref), p1 (copy), v42 (ref), v44 (ref), v48 (ref), selectAnimal (ref) ]]
			if v41 == p1 and not (v42 or v44) then
				return
			end
			if not v48 then
				selectAnimal(p1)
			end
		end
	}))
	v1:GiveTask(task.spawn(function() --[[ Line: 705 | Upvalues: v1 (copy), p1 (copy), setStorageCapacityLabel (ref) ]]
		v1:GiveTask(p1:WaitForChild("InStorage"):GetPropertyChangedSignal("Value"):Connect(setStorageCapacityLabel))
	end))
	v2 = v1.Frame:FindFirstChild("Sell", true)
	v1:GiveTask(v43:Connect(function() --[[ setGridSellLabel | Line: 712 | Upvalues: v2 (copy), v42 (ref) ]]
		v2.Visible = v42
	end))
	v2.Visible = v42
	t2[p1] = v1
	v51:Add(v1, p2)
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 724 | Upvalues: t2 (ref), v41 (ref), ContainerFrame (copy), t (copy), v44 (ref), Moving (copy), v16 (copy), t6 (ref), v40 (copy), v42 (ref), setMultiSellMode (copy), v49 (copy), v51 (copy) ]]
	if not t2[p1] then
		return
	end
	if v41 == p1 and ContainerFrame:FindFirstChild("Menu") then
		t.SelectionSignal:Fire()
		if v44 then
			Moving.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t6)
		else
			local v1 = t2[v41]
			if v1 then
				v1:Deselect()
			end
			v40:DoCleaning()
			v41 = nil
			if v42 then
				setMultiSellMode(false)
			elseif v44 then
				Moving.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t6)
			else
				ContainerFrame.Menu.Content.HorseInfo.Visible = false
				ContainerFrame.TabButtons.Visible = false
				ContainerFrame.Menu.Content.NotSelected.Visible = true
			end
		end
	end
	v49:Fire()
	v51:Remove(t2[p1])
	t2[p1]:Destroy()
	t2[p1] = nil
end
local function setEquipCapacityLabel() --[[ setEquipCapacityLabel | Line: 740 | Upvalues: ContainerFrame (copy), v36 (copy) ]]
	pcall(function() --[[ Line: 741 | Upvalues: ContainerFrame (ref), v36 (ref) ]]
		ContainerFrame.Menu.Content.EquipCapacity.Content.TextLabel.Text = v36:GetTotalEquippedAnimals() .. "/" .. v36:GetMaxEquipSlots()
	end)
end
local function animateUpgrade(p1) --[[ animateUpgrade | Line: 748 | Upvalues: TweenService (copy) ]]
	task.spawn(function() --[[ Line: 749 | Upvalues: TweenService (ref), p1 (copy) ]]
		for i = 1, 3 do
			local v1 = TweenService:Create(p1, TweenInfo.new(0.3), {
				BackgroundColor3 = Color3.fromRGB(232, 116, 255)
			})
			v1:Play()
			v1.Completed:Wait()
			local v2 = TweenService:Create(p1, TweenInfo.new(0.3), {
				BackgroundColor3 = Color3.fromRGB(222, 191, 172)
			})
			v2:Play()
			v2.Completed:Wait()
		end
	end)
	task.spawn(function() --[[ Line: 761 | Upvalues: TweenService (ref), p1 (copy) ]]
		for i = 1, 3 do
			local v1 = TweenService:Create(p1.Button.UIScale, TweenInfo.new(0.3), {
				Scale = 1.25
			})
			v1:Play()
			v1.Completed:Wait()
			local v2 = TweenService:Create(p1.Button.UIScale, TweenInfo.new(0.3), {
				Scale = 1
			})
			v2:Play()
			v2.Completed:Wait()
		end
	end)
end
local t7 = {
	Equip = function() --[[ Equip | Line: 774 | Upvalues: v36 (copy), LocalPlayer (copy), v19 (copy), v5 (copy), v41 (ref), animateUpgrade (copy), ContainerFrame (copy), v47 (ref), v20 (copy) ]]
		if (v36:IsInAction("BossFight") or v36:IsInAction("GlobalBossFight")) and #LocalPlayer.Character.Animals:GetChildren() >= 1 then
			v19.NotifyIssue("CannotBossEquip")
			return
		end
		local v1 = v5.CanEquipAnimal(v36, v41)
		if v1 == true then
			if tick() - v47 < 1 then
				v20.Notify({
					Message = "You are doing this action too fast!"
				})
				return
			end
			v47 = tick()
			local v2 = v5.EquipAnimal(v36, v41)
			if v2 == true or type(v2) ~= "string" then
			else
				return v19.NotifyIssue(v2)
			end
		else
			if v1 ~= "MaxEquipped" then
				return v19.NotifyIssue(v1)
			end
			animateUpgrade(ContainerFrame.Menu.Content.EquipCapacity)
			return v19.NotifyIssue(v1)
		end
	end,
	Unequip = function() --[[ Unequip | Line: 801 | Upvalues: v36 (copy), Sonar (copy), v20 (copy), v47 (ref), v5 (copy), v41 (ref), v19 (copy) ]]
		if v36:IsInAction("BossFight") or (v36:IsInAction("GlobalBossFight") or (Sonar("TransitionClient").Transitioning or _G.DisableUnequip)) then
			v20.Notify({
				Message = "You cannot do that right now!",
				Type = "UnequipCannot"
			})
			return
		end
		if tick() - v47 < 1 then
			v20.Notify({
				Message = "You are doing this action too fast!"
			})
			return
		end
		v47 = tick()
		local v1 = v5.UnequipAnimal(v36, v41)
		if v1 == true or type(v1) ~= "string" then
			return
		end
		v19.NotifyIssue(v1)
	end,
	Feed = function() --[[ Feed | Line: 822 ]] end,
	Breed = function() --[[ Breed | Line: 823 | Upvalues: v11 (copy), v36 (copy), v41 (ref), v19 (copy), v32 (copy), v31 (copy), v10 (copy), t (copy) ]]
		local v1 = v11.CanBreedSlot(v36, v41, nil, true)
		if v1 ~= true then
			v19.NotifyIssue(v1)
			return
		end
		if not (v11.GetBirthTimeLeft(v36, v41) > 0) then
			v10.Open(function() --[[ Line: 841 | Upvalues: t (ref) ]]
				return t.Open()
			end, v41)
			return
		end
		local v2 = v32.GetMostAppropriateGestationFood(v36, v41)
		if not v2 then
			v10.Open(function() --[[ Line: 841 | Upvalues: t (ref) ]]
				return t.Open()
			end, v41)
			return
		end
		v31.Open({
			Item = v2,
			Slot = v41
		})
		v10.Open(function() --[[ Line: 841 | Upvalues: t (ref) ]]
			return t.Open()
		end, v41)
	end,
	SellConfirm = function() --[[ SellConfirm | Line: 845 | Upvalues: t4 (ref), setMultiSellMode (copy), v9 (copy) ]]
		local t = {}
		for k, v in pairs(t4) do
			table.insert(t, k.Name)
		end
		if next(t) then
			setMultiSellMode(false)
			v9:SellSlots(t)
		end
	end,
	SellCancel = function() --[[ SellCancel | Line: 856 | Upvalues: setMultiSellMode (copy) ]]
		setMultiSellMode(false)
	end,
	Sell = function() --[[ Sell | Line: 859 | Upvalues: v11 (copy), v36 (copy), v41 (ref), v19 (copy), v42 (ref), v43 (copy), t4 (ref), selectAnimalToSell (copy), ContainerFrame (copy), Selling (copy), v24 (copy) ]]
		local v1 = v11.CanSellSlot(v36, v41)
		if v1 ~= true then
			v19.NotifyIssue(v1)
			return
		end
		v42 = true
		v43:Fire()
		if t4[v41] or not v41 then
			ContainerFrame.Menu.Content.HorseInfo.Visible = false
			Selling.Visible = true
			v24.SetHUDNavigationEnabled(false)
			return
		end
		selectAnimalToSell(v41)
		ContainerFrame.Menu.Content.HorseInfo.Visible = false
		Selling.Visible = true
		v24.SetHUDNavigationEnabled(false)
	end,
	Favorite = function() --[[ Favorite | Line: 868 | Upvalues: v8 (copy), v41 (ref) ]]
		v8.GetRemoteFunction("FavoriteSlotRemote"):InvokeServer(v41.Name)
	end,
	Birth = function() --[[ Birth | Line: 871 | Upvalues: v11 (copy), v36 (copy), v41 (ref), v32 (copy), v31 (copy), v19 (copy), v8 (copy), t (copy), v30 (copy), v14 (copy) ]]
		local v1 = v11.CanBirthSlot(v36, v41)
		if v1 ~= true then
			if v1 ~= "PregnantTimer" then
				v19.NotifyIssue(v1)
				return
			end
			local v2 = v32.GetMostAppropriateGestationFood(v36, v41)
			if v2 then
				v31.Open({
					Item = v2,
					Slot = v41
				})
				return
			end
		end
		local v3 = v8.GetRemoteFunction("BirthSlotRemote"):InvokeServer(v41.Name)
		if not v3 then
			return
		end
		if t.OnBirthClaim then
			t.OnBirthClaim(v3)
			return
		end
		v30.SetGameElements({
			KeepHorseAction = true,
			SellingHorseAction = true
		})
		for k, v in pairs(v3) do
			v14:DisplaySlot({
				Type = "Birth",
				AllowNaming = true,
				ShowMaxWarning = true,
				MobileClickBackgroundToClose = false,
				ForceAdult = true,
				KeepMainFrameOpen = true,
				Slot = v36:GetItemFolder("Animals"):WaitForChild(v)
			})
			if v14.YieldForNoDisplay() then
				task.wait(0.5)
			end
		end
		t.ReOpen()
	end,
	PurchaseStorage = function() --[[ PurchaseStorage | Line: 920 | Upvalues: v30 (copy), v21 (copy), v11 (copy), v36 (copy), v18 (copy), v28 (copy), v1 (copy), v8 (copy), v19 (copy) ]]
		if v30.CanDoActionInTutorial("UpgradeStablesAction") then
			v21.Prompt({
				Type = "UpgradeStorage",
				Setup = function(p1, p2) --[[ Setup | Line: 935 | Upvalues: v11 (ref), v36 (ref), v18 (ref), v28 (ref), v1 (ref), v8 (ref) ]]
					local v12 = v11.GetStorageSlotPurchase(v36)
					if v12 then
						p1.Content.Price.TextLabel.Text = v18.splice(v12.Price)
						p1.Content.Price.Visible = true
						p1.Content.Label.Visible = true
						p1.Content.MaxLabel.Visible = false
					else
						p1.Content.Price.Visible = false
						p1.Content.Label.Visible = false
						p1.Content.MaxLabel.Visible = true
					end
					local function setRobuxPurchase() --[[ setRobuxPurchase | Line: 948 | Upvalues: v11 (ref), v36 (ref), v28 (ref), p1 (copy) ]]
						local v1 = v11.GetStorageSlotPurchase(v36, "Robux")
						if not v1 then
							p1.RobuxPurchase.Visible = false
							return
						end
						local v2 = v28.GetProductInfo(v1.ProductId, Enum.InfoType.Product)
						p1.RobuxPurchase.Content.RobuxLabel.Text = "\238\128\130" .. (if v2 then v2.PriceInRobux or "N/A" else "N/A")
						p1.RobuxPurchase.Content.Label.Text = "+" .. v1.Amount .. " Stable Slots"
						p1.RobuxPurchase.Visible = true
					end
					p2.Maid:GiveTask(v1.new(p1.RobuxPurchase.Content.BuyButton, {
						Click = function() --[[ Click | Line: 964 | Upvalues: v11 (ref), v36 (ref), v8 (ref) ]]
							if not v11.GetStorageSlotPurchase(v36, "Robux") then
								return
							end
							v8.GetRemoteFunction("PurchaseStorageSlotsRemote"):InvokeServer("Robux")
						end
					}))
					p2.Maid:GiveTask(v36.PlayerData.StorageTiersPurchased.RobuxTiersPurchased:GetPropertyChangedSignal("Value"):Connect(setRobuxPurchase))
					setRobuxPurchase()
				end,
				Run = function() --[[ Run | Line: 979 | Upvalues: v11 (ref), v36 (ref), v19 (ref), v8 (ref) ]]
					local v1 = v11.GetStorageSlotPurchase(v36)
					if not v1 then
						return true
					end
					if v36:CanAfford(v1.Price, v1.Currency) then
						return v8.GetRemoteFunction("PurchaseStorageSlotsRemote"):InvokeServer("Free")
					else
						return v19.NotifyIssue("CantAffordStableUpgrade")
					end
				end,
				Cancel = function() --[[ Cancel | Line: 991 ]]
					return true
				end
			})
		end
	end,
	PurchaseEquip = function() --[[ PurchaseEquip | Line: 996 | Upvalues: v30 (copy), v21 (copy), v11 (copy), v36 (copy), v18 (copy), v22 (copy), v28 (copy), v1 (copy), v8 (copy), v19 (copy) ]]
		if v30.CanDoActionInTutorial("UpgradeStablesAction") then
			v21.Prompt({
				Type = "UpgradeEquip",
				Setup = function(p1, p2) --[[ Setup | Line: 1010 | Upvalues: v11 (ref), v36 (ref), v18 (ref), v22 (ref), v28 (ref), v1 (ref), v8 (ref) ]]
					local v12 = v11.GetEquipSlotPurchase(v36)
					if v12 then
						p1.Content.Price.TextLabel.Text = v18.splice(v12.Price)
						p1.Content.Label.Text = string.format("Upgrade Equip Limit by %s slots?", v18.suffix(v12.Amount))
						for k, v in pairs(v12.Stats) do
							p1.Content[k].TextLabel.Text = v18.suffix(v36:GetStatValue(k).Value) .. "/" .. v18.suffix(v) .. " " .. v22.separateWordsInString(k)
							p1.Content[k].Visible = true
						end
						p1.Content.Price.Visible = true
						p1.Content.Label.Visible = true
						p1.Content.MaxLabel.Visible = false
					else
						p1.Content.Price.Visible = false
						p1.Content.Label.Visible = false
						p1.Content.FoodTames.Visible = false
						p1.Content.LassoTames.Visible = false
						p1.Content.MaxLabel.Visible = true
					end
					local function setRobuxPurchase() --[[ setRobuxPurchase | Line: 1035 | Upvalues: v11 (ref), v36 (ref), v28 (ref), p1 (copy) ]]
						local v1 = v11.GetEquipSlotPurchase(v36, "Robux")
						if not v1 then
							p1.RobuxPurchase.Visible = false
							return
						end
						local v2 = v28.GetProductInfo(v1.ProductId, Enum.InfoType.Product)
						p1.RobuxPurchase.Content.RobuxLabel.Text = "\238\128\130" .. (if v2 then v2.PriceInRobux or "N/A" else "N/A")
						p1.RobuxPurchase.Content.Label.Text = "+" .. v1.Amount .. " Equip Limit"
						p1.RobuxPurchase.Visible = true
					end
					p2.Maid:GiveTask(v1.new(p1.RobuxPurchase.Content.BuyButton, {
						Click = function() --[[ Click | Line: 1051 | Upvalues: v11 (ref), v36 (ref), v8 (ref) ]]
							if not v11.GetEquipSlotPurchase(v36, "Robux") then
								return
							end
							v8.GetRemoteFunction("PurchaseEquipSlotsRemote"):InvokeServer("Robux")
						end
					}))
					p2.Maid:GiveTask(v36.PlayerData.EquipTiersPurchased.RobuxTiersPurchased:GetPropertyChangedSignal("Value"):Connect(setRobuxPurchase))
					setRobuxPurchase()
				end,
				Run = function() --[[ Run | Line: 1066 | Upvalues: v11 (ref), v36 (ref), v19 (ref), v8 (ref) ]]
					local v1 = v11.GetEquipSlotPurchase(v36)
					if not v1 then
						return true
					end
					for k, v in pairs(v1.Stats) do
						if v36:GetStatValue(k).Value < v then
							return v19.NotifyIssue("NotEnoughStats")
						end
					end
					if v36:CanAfford(v1.Price, v1.Currency) then
						return v8.GetRemoteFunction("PurchaseEquipSlotsRemote"):InvokeServer("Free")
					else
						return v19.NotifyIssue("CantAffordStableUpgrade")
					end
				end,
				Cancel = function() --[[ Cancel | Line: 1084 ]]
					return true
				end
			})
		end
	end,
	EditName = function() --[[ EditName | Line: 1090 | Upvalues: v21 (copy), v41 (ref), v11 (copy), v36 (copy), v19 (copy), v8 (copy) ]]
		v21.Prompt({
			Type = "RenameSlot",
			Setup = function(p1) --[[ Setup | Line: 1093 | Upvalues: v41 (ref), v11 (ref) ]]
				p1.Content.NameTag.Visible = v41.GivenFirstName.Value
				p1.Content.Unnamed.Visible = not p1.Content.NameTag.Visible
				p1.Content.NameFrame.Content.TextBox.Text = v11.GetCustomName(v41)
			end,
			Run = function(p1) --[[ Run | Line: 1099 | Upvalues: v11 (ref), v36 (ref), v41 (ref), v19 (ref), v8 (ref) ]]
				local v1 = v11.CanNameSlot(v36, v41)
				if v1 == true then
					return v8.GetRemoteFunction("NameSlotRemote"):InvokeServer(v41.Name, p1.Content.NameFrame.Content.TextBox.Text)
				else
					return v19.NotifyIssue(v1)
				end
			end,
			Cancel = function() --[[ Cancel | Line: 1109 ]]
				return true
			end
		})
	end,
	Edit = function() --[[ Edit | Line: 1115 | Upvalues: v25 (copy), v41 (ref), v21 (copy), Sonar (copy), v18 (copy), v27 (copy), LocalPlayer (copy), v20 (copy), v36 (copy), v26 (copy) ]]
		if not v25.HasSlotUnlockedEquipment(v41) then
			v21.Prompt({
				Type = "FeatureLocked",
				Setup = function(p1, p2) --[[ Setup | Line: 1119 | Upvalues: v25 (ref), v41 (ref), Sonar (ref), v18 (ref), v27 (ref) ]]
					p1.Content.ProgressDescription.Description.Text = string.format("Level up your horse %s times in any skills to unlock Horse Customisation!", v25.GetLevelRequireToEdit())
					p1.Content.Description.Visible = false
					p1.Content.ProgressDescription.Visible = true
					local t = {}
					for k, v in pairs(v41.Upgrades:GetChildren()) do
						table.insert(t, v:GetPropertyChangedSignal("Value"))
					end
					p2.Maid:GiveTask(Sonar("StatBar").new({
						TweenAmount = true,
						Clipped = false,
						Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
						AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
						GetText = function(p1, p2) --[[ GetText | Line: 1138 | Upvalues: v18 (ref) ]]
							return v18.suffix(p1) .. "/" .. v18.suffix(p2)
						end,
						Get = function() --[[ Get | Line: 1142 | Upvalues: v27 (ref), v41 (ref) ]]
							return v27.GetTotalSkillLevels(v41)
						end,
						GetMax = function() --[[ GetMax | Line: 1145 | Upvalues: v25 (ref) ]]
							return v25.GetLevelRequireToEdit()
						end,
						Changed = t
					}))
				end,
				Run = function() --[[ Run | Line: 1151 ]]
					return true
				end
			})
			return
		end
		local v1 = LocalPlayer.Character.Animals:FindFirstChild(v41.Name)
		if not v1 then
			v20.Notify({
				Message = "You must equip this horse in order to customise it!",
				Type = "NoEquipCustomiseHorse"
			})
			return
		end
		if v36:GetCurrentAnimal() then
			v20.Notify({
				Message = "You cannot customise whilst riding a horse!",
				Type = "NoRideCustomiseHorse",
				Preset = "Red"
			})
			return
		end
		if LocalPlayer.Character.Humanoid.SeatPart and tonumber(LocalPlayer.Character.Humanoid.SeatPart.Parent) then
			v20.Notify({
				Message = "You cannot customise whilst riding a horse!",
				Type = "NoRideCustomiseHorse",
				Preset = "Red"
			})
			return
		end
		if v1.RiderSeat.Occupant then
			v20.Notify({
				Message = "You cannot customise whilst someone is riding your horse!",
				Type = "SomeoneRideCustomiseHorse",
				Preset = "Red"
			})
		else
			v26:EnterMode(v1)
		end
	end,
	MoveConfirm = function() --[[ MoveConfirm | Line: 1194 | Upvalues: t6 (ref), v8 (copy), v45 (ref), v36 (copy), t (copy), setMultiMoveMode (copy) ]]
		local t2 = {}
		for v1, v2 in t6 do
			table.insert(t2, v2.SlotValue.Name)
		end
		local v4 = v8.GetRemoteFunction("MoveAnimalToFolder"):InvokeServer(v45.Name, t2)
		if v4 then
			for v5, v6 in v4 do
				for v7, v82 in t6 do
					if v82.SlotValue.Name == v6 then
						local Folder = v36.PlayerData.Animals[v6].Folder
						if Folder then
							Folder.Value = v45.Name
						end
						t.SortByFolder(v45.Name)
					end
				end
			end
		end
		setMultiMoveMode()
	end,
	MoveCancel = function() --[[ MoveCancel | Line: 1221 | Upvalues: setMultiMoveMode (copy) ]]
		setMultiMoveMode()
	end
}
function t.SortByFolder(p1) --[[ SortByFolder | Line: 1226 | Upvalues: v46 (ref), v51 (copy) ]]
	v46 = if p1 == nil or (p1 == "FoldersButton" or p1 == 0) then nil else p1
	v51:UpdateVisibleGrid()
end
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 1236 | Upvalues: v2 (copy), ContainerFrame (copy), t3 (copy), v1 (copy), v30 (copy), t7 (copy), v35 (copy), v39 (copy), v33 (copy), Selling (copy), Moving (copy), v21 (copy), v15 (copy), v22 (copy), v7 (copy), v36 (copy), setStorageCapacityLabel (copy), v38 (copy), setEquipCapacityLabel (copy), v23 (copy), v42 (ref), v44 (ref), removeAnimal (copy), createAnimal (copy), v51 (copy), v48 (ref), selectAnimal (copy), v50 (copy), v34 (copy), t (copy), v45 (ref), t6 (ref), t2 (ref), t5 (ref), v46 (ref), v41 (ref) ]]
	local v12 = v2.getFrameFromInstance(ContainerFrame)
	if not v12.Opened then
		v12.Opened = true
		for k, v in pairs(ContainerFrame.Menu.Content.HorseInfo.TabFrames:GetChildren()) do
			local Buttons = v:FindFirstChild("Buttons")
			if Buttons then
				for k2, v3 in pairs(Buttons:GetChildren()) do
					if v3:IsA("ImageButton") then
						if not t3[v3.Name] then
							t3[v3.Name] = {}
						end
						table.insert(t3[v3.Name], v3)
						v1.new(v3, {
							Click = function() --[[ Click | Line: 1256 | Upvalues: v30 (ref), v3 (copy), t7 (ref) ]]
								if v30.CanDoActionInTutorial(v3.Name .. "Action") then
									t7[v3.Name]()
								end
							end
						})
						local InactiveFrame = v3:FindFirstChild("InactiveFrame", true)
						local function setInactiveFrame() --[[ setInactiveFrame | Line: 1265 | Upvalues: InactiveFrame (copy), v30 (ref), v3 (copy) ]]
							if not InactiveFrame then
								return
							end
							InactiveFrame.Visible = not v30.GetGameState(v3.Name .. "Action")
						end
						v35.GameStateChangedSignal:Connect(setInactiveFrame)
						if InactiveFrame then
							InactiveFrame.Visible = not v30.GetGameState(v3.Name .. "Action")
						end
					end
				end
			end
		end
		for v5, v6 in pairs(t3.Birth or {}) do
			local AdButton = v6:FindFirstChild("AdButton", true)
			if AdButton then
				v39:GiveTask(v1.new(AdButton, {
					Click = function() --[[ Click | Line: 1280 | Upvalues: v33 (ref) ]]
						v33.ShowAdWithoutPrompt("BreedingSpeedUp")
					end
				}))
			end
		end
		for k, v in pairs(Selling.Content.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t3[v.Name] then
					t3[v.Name] = {}
				end
				table.insert(t3[v.Name], v)
				v1.new(v, {
					Click = t7[v.Name]
				})
			end
		end
		for v8, v9 in Moving.Content.Buttons:GetChildren() do
			if v9:IsA("ImageButton") then
				if not t3[v9.Name] then
					t3[v9.Name] = {}
				end
				table.insert(t3[v9.Name], v9)
				v1.new(v9, {
					Click = t7[v9.Name]
				})
			end
		end
		v1.new(ContainerFrame.Menu.Content.HorseInfo:FindFirstChild("FavoriteButton", true), {
			Click = t7.Favorite
		})
		v15.CreateInputTextBox(v21.GetPromptFrame("RenameSlot").Content.NameFrame.Content.TextBox, function(p1, p2, p3) --[[ Line: 1324 | Upvalues: v22 (ref), v35 (ref) ]]
			p1.Text = v22.trimString(p2, v35.MaxAnimalNameLength)
		end, true)
		v7.new(ContainerFrame.Menu.Content.HorseInfo.NameFrame.EditButton, {
			Click = t7.EditName
		})
		v1.new(ContainerFrame.Menu.Content.StorageCapacity.Button, {
			Click = t7.PurchaseStorage
		})
		local function setInactiveFrame() --[[ setInactiveFrame | Line: 1340 | Upvalues: ContainerFrame (ref), v30 (ref) ]]
			ContainerFrame.Menu.Content.StorageCapacity.Button.InactiveFrame.Visible = not v30.GetGameState("UpgradeStablesAction")
		end
		v35.GameStateChangedSignal:Connect(setInactiveFrame)
		ContainerFrame.Menu.Content.StorageCapacity.Button.InactiveFrame.Visible = not v30.GetGameState("UpgradeStablesAction")
		v36.MaxSlotsChangedSignal:Connect(setStorageCapacityLabel)
		v36.DailyLoginData.Streak:GetPropertyChangedSignal("Value"):Connect(setStorageCapacityLabel)
		for k, v in pairs({ "ChildAdded", "ChildRemoved" }) do
			v38[v]:Connect(setStorageCapacityLabel)
		end
		pcall(function() --[[ Line: 669 | Upvalues: v36 (ref), ContainerFrame (ref) ]]
			local v1 = v36:GetItemLimit("Animals")
			ContainerFrame.Menu.Content.StorageCapacity.Content.TextLabel.Text = v1.Get() .. "/" .. v1.GetLimit()
		end)
		v1.new(ContainerFrame.Menu.Content.EquipCapacity.Button, {
			Click = t7.PurchaseEquip
		})
		local function setInactiveFrameEquip() --[[ setInactiveFrameEquip | Line: 1357 | Upvalues: ContainerFrame (ref), v30 (ref) ]]
			ContainerFrame.Menu.Content.EquipCapacity.Button.InactiveFrame.Visible = not v30.GetGameState("UpgradeStablesAction")
		end
		v35.GameStateChangedSignal:Connect(setInactiveFrameEquip)
		ContainerFrame.Menu.Content.EquipCapacity.Button.InactiveFrame.Visible = not v30.GetGameState("UpgradeStablesAction")
		v36.MaxEquipChangedSignal:Connect(setEquipCapacityLabel)
		v36.EquippedAnimalCountChangedSignal:Connect(setEquipCapacityLabel)
		pcall(function() --[[ Line: 741 | Upvalues: ContainerFrame (ref), v36 (ref) ]]
			ContainerFrame.Menu.Content.EquipCapacity.Content.TextLabel.Text = v36:GetTotalEquippedAnimals() .. "/" .. v36:GetMaxEquipSlots()
		end)
		v23:AddControls("GamepadCancelAction", { Enum.KeyCode.ButtonB }, {
			InputBegan = function() --[[ InputBegan | Line: 1371 | Upvalues: v42 (ref), t7 (ref), v44 (ref) ]]
				if v42 then
					t7.SellCancel()
					return
				end
				if not v44 then
					return
				end
				t7.MoveCancel()
			end
		}, function() --[[ Line: 1378 | Upvalues: v42 (ref), v44 (ref), v2 (ref), ContainerFrame (ref) ]]
			return if v42 then v2.IsFrameOpen(ContainerFrame) else v44 and v2.IsFrameOpen(ContainerFrame)
		end, nil, true)
		v23:AddControls("GamepadConfirmSell", { Enum.KeyCode.ButtonY }, {
			InputBegan = function() --[[ InputBegan | Line: 1385 | Upvalues: v42 (ref), t7 (ref), v44 (ref) ]]
				if v42 then
					t7.SellConfirm()
					return
				end
				if not v44 then
					return
				end
				t7.MoveConfirm()
			end
		}, function() --[[ Line: 1392 | Upvalues: v42 (ref), v44 (ref), v2 (ref), ContainerFrame (ref) ]]
			return if v42 then v2.IsFrameOpen(ContainerFrame) else v44 and v2.IsFrameOpen(ContainerFrame)
		end, nil, true)
	end
	if not v12.ContentsLoaded then
		v12.ContentsLoaded = true
		v39:GiveTask(v38.ChildRemoved:Connect(removeAnimal))
		v39:GiveTask(v38.ChildAdded:Connect(createAnimal))
		for v122, v13 in v38:GetChildren() do
			v39:GiveTask(task.spawn(createAnimal, v13, true))
		end
		v51:Sort(v51.SortType or "Alphabet")
	end
	if p2 and not v48 then
		selectAnimal(p2)
	end
	local v14 = nil
	v50:GiveTask(v7.new(ContainerFrame.FolderButtons.FoldersButton, {
		OnHover = function() --[[ OnHover | Line: 1416 | Upvalues: v34 (ref), ContainerFrame (ref) ]]
			v34.target(ContainerFrame.FolderButtons.FoldersButton.Tab, 0.5, 2, {
				Position = UDim2.new(0, 0, 0, 0)
			})
		end,
		OnLeave = function() --[[ OnLeave | Line: 1419 | Upvalues: v34 (ref), ContainerFrame (ref) ]]
			v34.target(ContainerFrame.FolderButtons.FoldersButton.Tab, 0.5, 2, {
				Position = UDim2.new(0.25, 0, 0, 0)
			})
		end,
		Click = function() --[[ Click | Line: 1422 | Upvalues: v44 (ref), v14 (ref), v34 (ref), t (ref), v45 (ref), t6 (ref), t2 (ref) ]]
			if v44 then
				v45 = {
					Name = 0,
					Icon = {
						Value = "rbxassetid://18223660793"
					}
				}
				for v1, v2 in t6 do
					t2[v1].Frame.Content.Move.Icon.Image = v45.Icon.Value
					v2:UpdateIcon(v45.Icon.Value)
				end
			else
				if not v14 then
					t.SortByFolder()
					return
				end
				v34.target(v14.Tab, 0.5, 2, {
					Position = UDim2.new(0.25, 0, 0, 0)
				})
				v14 = nil
				t.SortByFolder()
			end
		end
	}))
	local v152 = false
	for v16, v17 in v36.PlayerData.AnimalFolders:GetChildren() do
		local v18 = ContainerFrame.FolderButtons.Template:Clone()
		local v19 = string.split(v17.Color.Value, ",")
		v18.Tab.Icon.Image = v17.Icon.Value
		v18.Tab.BackgroundColor3 = Color3.fromRGB(unpack(v19))
		v18.Parent = ContainerFrame.FolderButtons
		v18.Visible = true
		v18.LayoutOrder = tonumber(v17.Name)
		v18.Name = v17.Name
		table.insert(t5, v18)
		v50:GiveTask(v7.new(v18, {
			OnHover = function() --[[ OnHover | Line: 1464 | Upvalues: v34 (ref), v18 (copy) ]]
				v34.target(v18.Tab, 0.5, 2, {
					Position = UDim2.new(0, 0, 0, 0)
				})
			end,
			OnLeave = function() --[[ OnLeave | Line: 1467 | Upvalues: v14 (ref), v18 (copy), v34 (ref) ]]
				if v14 == v18 then
					return
				end
				v34.target(v18.Tab, 0.5, 2, {
					Position = UDim2.new(0.25, 0, 0, 0)
				})
			end,
			Click = function() --[[ Click | Line: 1473 | Upvalues: v44 (ref), v45 (ref), v17 (copy), t6 (ref), t2 (ref), v14 (ref), v18 (copy), t (ref), v34 (ref) ]]
				if v44 then
					v45 = v17
					for v1, v2 in t6 do
						t2[v1].Frame.Content.Move.Icon.Image = v17.Icon.Value
						v2:UpdateIcon(v17.Icon.Value)
					end
				else
					if v14 == v18 then
						t.SortByFolder(nil)
						v34.target(v14.Tab, 0.5, 2, {
							Position = UDim2.new(0.25, 0, 0, 0)
						})
						v14 = nil
						return
					end
					if not v14 then
						t.SortByFolder(v17.Name)
						v34.target(v18.Tab, 0.5, 2, {
							Position = UDim2.new(0, 0, 0, 0)
						})
						v14 = v18
						return
					end
					v34.target(v14.Tab, 0.5, 2, {
						Position = UDim2.new(0.25, 0, 0, 0)
					})
					t.SortByFolder(v17.Name)
					v34.target(v18.Tab, 0.5, 2, {
						Position = UDim2.new(0, 0, 0, 0)
					})
					v14 = v18
				end
			end
		}))
		if v46 ~= nil and v46 == v17.Name then
			v152 = true
			t.SortByFolder(v17.Name)
			v34.target(v18.Tab, 0.5, 2, {
				Position = UDim2.new(0, 0, 0, 0)
			})
			v14 = v18
		end
	end
	if v46 ~= nil and not v152 then
		t.SortByFolder(nil)
	end
	if v36:GetStatValue("FoalsBorn").Value >= 20 then
		ContainerFrame.Menu.Content.HorseInfo.Move.Visible = true
		ContainerFrame.FolderButtons.Visible = true
		ContainerFrame.Menu.FoldersButton.Visible = true
	else
		ContainerFrame.Menu.Content.HorseInfo.Move.Visible = false
		ContainerFrame.FolderButtons.Visible = false
		ContainerFrame.Menu.FoldersButton.Visible = false
	end
	if v41 then
		return
	end
	ContainerFrame.Menu.Content.HorseInfo.Visible = false
end
function t.OnClose(p1) --[[ OnClose | Line: 1529 | Upvalues: setMultiSellMode (copy), v44 (ref), setMultiMoveMode (copy), Moving (copy), ContainerFrame (copy), v2 (copy), t (copy), v50 (copy), t5 (ref) ]]
	setMultiSellMode(false)
	if v44 then
		setMultiMoveMode()
	end
	Moving.Visible = false
	ContainerFrame.Menu.Content.HorseInfo.Visible = true
	if v2.MainFrameOpen == ContainerFrame then
		t.Close(true)
	end
	v50:DoCleaning()
	for v1, v22 in t5 do
		v22:Destroy()
	end
	t5 = {}
end
function t.Cleanup(p1) --[[ Cleanup | Line: 1553 | Upvalues: selectAnimal (copy), t2 (ref), v41 (ref), ContainerFrame (copy), t (copy), v44 (ref), Moving (copy), v16 (copy), t6 (ref), v40 (copy), v42 (ref), setMultiSellMode (copy), v49 (copy), v51 (copy), v39 (copy), v2 (copy) ]]
	selectAnimal()
	for k, v in pairs(t2) do
		if t2[k] then
			if v41 == k and ContainerFrame:FindFirstChild("Menu") then
				t.SelectionSignal:Fire()
				if v44 then
					Moving.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t6)
				else
					local v1 = t2[v41]
					if v1 then
						v1:Deselect()
					end
					v40:DoCleaning()
					v41 = nil
					if v42 then
						setMultiSellMode(false)
					elseif v44 then
						Moving.Content.TotalSold:FindFirstChild("ValueLabel", true).Text = v16.Count(t6)
					else
						ContainerFrame.Menu.Content.HorseInfo.Visible = false
						ContainerFrame.TabButtons.Visible = false
						ContainerFrame.Menu.Content.NotSelected.Visible = true
					end
				end
			end
			v49:Fire()
			v51:Remove(t2[k])
			t2[k]:Destroy()
			t2[k] = nil
		end
	end
	t2 = {}
	v39:DoCleaning()
	v2.CleanContents(ContainerFrame)
end
function t.Open(...) --[[ Open | Line: 1565 | Upvalues: v33 (copy), v30 (copy), v10 (copy), v41 (ref), v2 (copy), ContainerFrame (copy), v37 (copy), t (copy) ]]
	v33.CheckAdAvailability()
	if v30.GetGameState("OpenBreedingFromStablesHUD") then
		v10.Open(nil, v41)
		return
	end
	if v2.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v37:FireServer("AccessedMajorInterface", "Stables")
		v2.OpenMainFrame(ContainerFrame, {
			CallbackArgs = { ... }
		})
	end
end
function t.ReOpen(p1) --[[ ReOpen | Line: 1583 | Upvalues: v2 (copy), ContainerFrame (copy), v46 (ref), t (copy), v48 (ref), selectAnimal (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) and not p1 then
		return
	end
	v2.OpenMainFrame(ContainerFrame, {
		CallbackArgs = { p1 }
	})
	if v46 ~= nil then
		t.SortByFolder(v46)
	end
	if not p1 or v48 then
		return
	end
	selectAnimal(p1)
end
function t.Close(p1) --[[ Close | Line: 1601 | Upvalues: v2 (copy), ContainerFrame (copy), v37 (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		v37:FireServer("ClosedMajorInterface", "Stables")
	end
	if p1 then
		v2.CloseFrame(ContainerFrame)
		v2.OpenHUD({
			DoNotCloseMainFrame = p1
		})
	else
		v2.CloseMainFrame(ContainerFrame)
	end
end
function t.Init(p1) --[[ Init | Line: 1617 | Upvalues: v2 (copy), ContainerFrame (copy), Horses (copy), v24 (copy), t (copy), v31 (copy), v1 (copy), Sonar (copy), v8 (copy), v30 (copy), v14 (copy), v36 (copy), v38 (copy), v11 (copy), v49 (copy), FolderPrices (copy), v21 (copy), v20 (copy), v29 (copy), StablesGui (copy), v44 (ref), v45 (ref), t6 (ref), t2 (ref), v41 (ref), selectAnimalToMove (copy), setMultiMoveMode (copy), setMultiSellMode (copy), selectAnimal (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = Horses.Content
	})
	v24.SetUnselectableWhenSelected(Horses.Content)
	v2.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 1628 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1631 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1634 | Upvalues: v2 (ref), v31 (ref) ]]
		if not v2.MainFrameOpen then
			v31.Close()
		end
	end)
	v2.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 1640 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 1645 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v1.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 1650 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("Stables")
		end
	})
	v1.new(ContainerFrame.Menu.ClaimAllFoals, {
		Click = function() --[[ Click | Line: 1656 | Upvalues: v8 (ref), t (ref), v30 (ref), v14 (ref), v36 (ref) ]]
			local v1 = false
			local function ClaimFoal(p1) --[[ ClaimFoal | Line: 1659 | Upvalues: v8 (ref), v1 (ref), t (ref), v30 (ref), v14 (ref), v36 (ref) ]]
				local v12 = v8.GetRemoteFunction("BirthSlotRemote"):InvokeServer(p1.Name)
				if not v12 then
					return
				end
				v1 = true
				if t.OnBirthClaim then
					t.OnBirthClaim(v12)
					return
				end
				v30.SetGameElements({
					KeepHorseAction = true,
					SellingHorseAction = true
				})
				for k, v in pairs(v12) do
					v14:DisplaySlot({
						Type = "Birth",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = false,
						ForceAdult = true,
						KeepMainFrameOpen = true,
						Slot = v36:GetItemFolder("Animals"):WaitForChild(v)
					})
					if v14.YieldForNoDisplay() then
						task.wait(0.25)
					end
				end
			end
			for v2, v3 in t.GetAllClaimableHorses() do
				ClaimFoal(v3)
			end
			if v1 and not t.OnBirthClaim then
				t.ReOpen()
			end
		end
	})
	local function setUnclaimed() --[[ setUnclaimed | Line: 1705 | Upvalues: v38 (ref), v11 (ref), v36 (ref), ContainerFrame (ref) ]]
		local count = 0
		for v1, v2 in v38:GetChildren() do
			if not (v2.InStorage.Value or (#v2.Child.Value <= 0 or v11.GetBirthTimeLeft(v36, v2) > 0)) then
				count = count + 1
			end
		end
		ContainerFrame.Menu.ClaimAllFoals.Visible = count > 0
	end
	v49:Connect(setUnclaimed)
	task.spawn(setUnclaimed)
	v1.new(ContainerFrame.Menu.FoldersButton, {
		Click = function() --[[ Click | Line: 1728 | Upvalues: v8 (ref), FolderPrices (ref), v21 (ref), v36 (ref), v20 (ref), v29 (ref), v2 (ref), StablesGui (ref), ContainerFrame (ref) ]]
			if v8.GetRemoteFunction("GetNextFolder"):InvokeServer() ~= 1 then
				v2.OpenMainFrame(StablesGui.FolderContainer)
				v2.CloseFrame(ContainerFrame)
				return
			end
			local v1 = v8.GetRemoteFunction("GetNextFolder"):InvokeServer()
			if FolderPrices[v1] then
				local Foals = FolderPrices[v1].Foals
				v21.Prompt({
					Type = "BuyFolder",
					Setup = function(p1) --[[ Setup | Line: 1740 | Upvalues: v8 (ref), FolderPrices (ref), v36 (ref) ]]
						local v1 = v8.GetRemoteFunction("GetNextFolder"):InvokeServer()
						p1.Content.Price.TextLabel.Text = FolderPrices[v1].Coins
						p1.Content.FoalsBorn.TextLabel.Text = (math.clamp(v36:GetStatValue("FoalsBorn").Value, 0, FolderPrices[v1].Foals) .. "/" .. FolderPrices[v1].Foals) .. " Foals Born"
					end,
					Run = function() --[[ Run | Line: 1751 | Upvalues: v36 (ref), Foals (copy), v20 (ref), v8 (ref), v29 (ref), v2 (ref), StablesGui (ref), ContainerFrame (ref) ]]
						if v36:GetStatValue("FoalsBorn").Value < Foals then
							v20.Notify({
								Message = "You haven\'t completed all the tasks",
								Preset = "Red"
							})
							return
						end
						local v1, v22 = v8.GetRemoteFunction("NewAnimalFolder"):InvokeServer()
						if v1 and v22 then
							v29.NewFolder(v1, v22)
							v2.OpenMainFrame(StablesGui.FolderContainer)
							v2.CloseFrame(ContainerFrame)
						else
							v20.Notify({
								Message = "You cannot afford this",
								Preset = "Red"
							})
						end
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1775 ]]
						return true
					end
				})
			end
		end
	})
	v1.new(ContainerFrame.Menu.Content.HorseInfo.Move, {
		Click = function() --[[ Click | Line: 1787 | Upvalues: v44 (ref), v45 (ref), v36 (ref), t6 (ref), t2 (ref), v41 (ref), selectAnimalToMove (ref), setMultiMoveMode (ref) ]]
			if not v44 then
				v45 = v36.PlayerData.AnimalFolders:GetChildren()[1]
				for v1, v2 in t6 do
					t2[v1].Frame.Content.Move.Icon.Image = v45.Icon.Value
				end
				if v41 then
					selectAnimalToMove(v41)
				end
			end
			setMultiMoveMode()
		end
	})
	setMultiSellMode(false)
	selectAnimal()
end
function t.GetSelectedSlot() --[[ GetSelectedSlot | Line: 1809 | Upvalues: v41 (ref) ]]
	return v41
end
function t.GetAllClaimableHorses() --[[ GetAllClaimableHorses | Line: 1813 | Upvalues: v38 (copy), v11 (copy), v36 (copy) ]]
	local t = {}
	for v1, v2 in v38:GetChildren() do
		if not (v2.InStorage.Value or (#v2.Child.Value <= 0 or v11.GetBirthTimeLeft(v36, v2) > 0)) then
			table.insert(t, v2)
		end
	end
	return t
end
function t.SelectSlot(p1) --[[ SelectSlot | Line: 1835 | Upvalues: selectAnimal (copy) ]]
	selectAnimal(p1)
end
t:Init()
return t