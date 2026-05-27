-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
local v4 = Sonar("AnimalGridButton")
local v5 = Sonar("AnimalInfoFrame")
local v6 = Sonar("AnimalDataService")
local v7 = Sonar("Button")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("Signal")
local v10 = Sonar("TimeUtils")
local v11 = Sonar("GridSort")
local v12 = Sonar("IssueResponseClient")
local v13 = Sonar("DisplayAnimalClient")
local v14 = Sonar("NotificationsClient")
local v15 = Sonar("CharacterControls")
local v16 = Sonar("PromptClient")
local v17 = Sonar("TabManager")
local v18 = Sonar("FormatNumber")
local v19 = Sonar("MessagesClient")
local v20 = Sonar("ColorCorrectionUtils")
local v21 = Sonar("TutorialService")
local v22 = Sonar("QuickFeedGui")
local v23 = Sonar("MarketplaceUtils")
local v24 = Sonar("AdClient")
local v25 = Sonar("PlaceTypeService")
local v26 = Sonar(Sonar("StorageUtils").Get("BundleInfo"))
local v27 = Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v28 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("BreedingGui").ContainerFrame
local TabFrames = ContainerFrame.Menu.TabFrames
local BreedButton = TabFrames.Breeding.Content.Center.BreedButton
local PredictButton = TabFrames.Breeding.Content.Center.PredictButton
local FoalNow = TabFrames.Breeding.Content.Center.FoalNow
local v29 = v28:GetItemFolder("Animals")
local v30 = v3.new()
local t = {
	Male = v3.new(),
	Female = v3.new()
}
local t2 = {}
local t3 = {}
local v31 = false
local t4 = {
	Male = {},
	Female = {}
}
local t5 = {
	Male = nil,
	Female = nil
}
local t6 = {}
local t7 = { "You bred a foal! \240\159\144\180" }
for k, v in pairs({ "Male", "Female" }) do
	local v32 = TabFrames.Breeding.Content[v]
	t2[v] = v11.new({
		Priority = {
			{
				Priority = -1,
				Run = function(p1) --[[ Run | Line: 86 ]]
					return p1:HasLayoutUnableReason()
				end,
				Changed = function(p1) --[[ Changed | Line: 89 ]]
					return p1.UnableChangedSignal
				end
			}
		},
		EmptyString = {
			Text = string.format("You do not have any %s horses!", string.lower(v)),
			Label = v32.Horses.EmptyLabel
		},
		Sorts = {
			Alphabet = {
				DisplayName = "Name",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 104 ]]
					local v1 = p1.NameLabel.Text:lower()
					local v2 = p2.NameLabel.Text:lower()
					if p3 then
						return v2 < v1
					else
						return v1 < v2
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 113 ]]
					return p1.NameLabel:GetPropertyChangedSignal("Text")
				end
			},
			TimeReceived = {
				DisplayName = "Recent",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 120 ]]
					local TimeReceived = p1.SlotValue.TimeReceived.Value
					local TimeReceived_2 = p2.SlotValue.TimeReceived.Value
					if p3 then
						return TimeReceived < TimeReceived_2
					else
						return TimeReceived_2 < TimeReceived
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 129 ]]
					return p1.SlotValue.TimeReceived:GetPropertyChangedSignal("Value")
				end
			},
			Value = {
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 135 | Upvalues: v6 (copy) ]]
					local v1 = v6.GetPriceForSlot(p1.SlotValue)
					local v2 = v6.GetPriceForSlot(p2.SlotValue)
					if p3 then
						return v1 < v2
					else
						return v2 < v1
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 144 ]]
					return p1.SlotAttributesChangedSignal
				end
			},
			TotalTraits = {
				DisplayName = "# Traits",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 151 | Upvalues: v6 (copy) ]]
					local v1 = v6.GetTotalTraits(p1.SlotValue)
					local v2 = v6.GetTotalTraits(p2.SlotValue)
					if p3 then
						return v1 < v2
					else
						return v2 < v1
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 160 ]]
					return p1.SlotAttributesChangedSignal
				end
			},
			Age = {
				DisplayName = "Age",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 167 ]]
					local Age = p1.SlotValue.Age.Value
					local Age_2 = p2.SlotValue.Age.Value
					if p3 then
						return Age < Age_2
					else
						return Age_2 < Age
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 176 ]]
					return p1.SlotValue.Age:GetPropertyChangedSignal("Value")
				end
			},
			Size = {
				DisplayName = "Size",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 183 | Upvalues: v6 (copy) ]]
					local SizeMultiplier = v6.GetSize(p1.SlotValue).SizeMultiplier
					local SizeMultiplier_2 = v6.GetSize(p2.SlotValue).SizeMultiplier
					if p3 then
						return SizeMultiplier < SizeMultiplier_2
					else
						return SizeMultiplier_2 < SizeMultiplier
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 192 ]]
					return p1.SlotValue.SizeType:GetPropertyChangedSignal("Value")
				end
			},
			Gender = {
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 198 | Upvalues: v6 (copy) ]]
					local v1 = v6.GetGender(p1.SlotValue)
					local v2 = v6.GetGender(p2.SlotValue)
					local v3 = if v1 == "Both" then 3 elseif v1 == "Female" then 1 else 2
					local v4 = if v2 == "Both" then 3 elseif v2 == "Female" then 1 else 2
					if p3 then
						return v4 < v3
					else
						return v3 < v4
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 211 ]]
					return p1.SlotValue.Gender:GetPropertyChangedSignal("Value")
				end
			}
		},
		Frame = v32.Horses.Sorting,
		Search = {
			TextBox = v32.Horses.SearchBar.Content.TextBox,
			Run = function(p1, p2) --[[ Run | Line: 221 ]]
				if #p1 <= 0 then
					return true
				end
				local v1 = p1:lower()
				local v2 = p2.NameLabel.Text:lower()
				local v3 = if p2.SlotValue and p2.SlotValue.Species then p2.SlotValue.Species.Value:lower() or "" else ""
				return string.find(v2, v1) or string.find(v3, v1)
			end
		}
	})
end
local v33 = v9.new()
local v34 = nil
local function removeAnimalFromSet(p1) --[[ removeAnimalFromSet | Line: 242 | Upvalues: t4 (ref) ]]
	for k, v in pairs(t4) do
		if v[p1] then
			v[p1] = nil
		end
	end
end
local function addAnimalToSet(p1, p2, p3) --[[ addAnimalToSet | Line: 251 | Upvalues: t4 (ref) ]]
	if p1 == "Both" then
		t4.Male[p2] = p3
		t4.Female[p2] = p3
	else
		t4[p1][p2] = p3
	end
end
local function getAnimalFromSet(p1, p2) --[[ getAnimalFromSet | Line: 261 | Upvalues: t4 (ref) ]]
	for k, v in pairs(t4) do
		if (not p2 or k == p2) and (v[p1] and v[p1].Destroy) then
			return v[p1]
		end
	end
end
local function getSelectedAnimalOfOppositeGender(p1) --[[ getSelectedAnimalOfOppositeGender | Line: 279 | Upvalues: v6 (copy), t5 (ref) ]]
	return t5[if v6.GetGender(p1) == "Male" then "Female" else "Male"]
end
local function setSelectedFrame(p1, p2) --[[ setSelectedFrame | Line: 285 | Upvalues: TabFrames (copy), ContainerFrame (copy), t5 (ref) ]]
	local v1 = TabFrames.Breeding.Content[p1]
	if p2 then
		v1.Horses.Visible = false
		v1.HorseInfo.Visible = true
		ContainerFrame["TabButtons" .. p1].Visible = true
	else
		v1.Horses.Visible = true
		v1.HorseInfo.Visible = false
		ContainerFrame["TabButtons" .. p1].Visible = false
	end
	local v2 = TabFrames.Breeding.Content.Center[p1]
	v2.Content.Visible = t5[p1]
	v2.RemoveButton.Visible = v2.Content.Visible
	v2.Unselected.Visible = not v2.Content.Visible
end
local function getUnableCheckForAnimal(p1) --[[ getUnableCheckForAnimal | Line: 303 | Upvalues: v33 (copy), v28 (copy), v10 (copy), v6 (copy), t5 (ref), v24 (copy) ]]
	return {
		Changed = {
			v33,
			v28.BreedingPermissionsChangedSignal,
			v10.OnTimeChanged,
			p1.LastBreed:GetPropertyChangedSignal("Value"),
			p1.Age:GetPropertyChangedSignal("Value"),
			p1.Infertile:GetPropertyChangedSignal("Value")
		},
		Get = function() --[[ Get | Line: 313 | Upvalues: v28 (ref), v6 (ref), p1 (copy), t5 (ref) ]]
			if not v28.HasUnlockedSpecies then
				return
			end
			return v6.CanBreedSlot(v28, p1, t5[if v6.GetGender(p1) == "Male" then "Female" else "Male"], true)
		end,
		Reasons = {
			PregnantTimer = function() --[[ PregnantTimer | Line: 326 | Upvalues: p1 (copy), v6 (ref), v28 (ref), v24 (ref), v10 (ref) ]]
				local isNotValue = p1.Child.Value ~= ""
				local v1 = v6.GetBirthTimeLeft(v28, p1)
				local v2 = if isNotValue then if v1 > 0 then v24.IsAdAvailable() else false else isNotValue
				if v2 then
					v2 = v24.GetHasBreedingSpeedUpAvailable() and v24.GetIsBreedingSpeedUpTarget(p1.Name)
				end
				local t = {}
				t.Text = if isNotValue then "With Child" else "On Cooldown"
				t.Timer = v10.FormatHMS(v1)
				t.ShowAdButton = v2
				return t
			end,
			BreedCooldown = function() --[[ BreedCooldown | Line: 339 | Upvalues: v10 (ref), v6 (ref), v28 (ref), p1 (copy) ]]
				return {
					Text = "On Cooldown",
					Timer = v10.FormatHMS(v6.GetBirthTimeLeft(v28, p1))
				}
			end,
			BreedWait = function() --[[ BreedWait | Line: 345 | Upvalues: v10 (ref), v6 (ref), v28 (ref), p1 (copy) ]]
				return {
					Text = "Wait Cooldown",
					Image = "rbxassetid://16190517893",
					Timer = v10.FormatHMS(v6.GetBirthWaitTimeLeft(v28, p1))
				}
			end,
			NotUnlocked = {
				Text = "Species Not Unlocked",
				Image = "rbxassetid://16651378674"
			},
			Pregnant = {
				Text = "With Child",
				Timer = "(Ready)"
			},
			Related = {
				Text = "Related Horses",
				Image = "rbxassetid://16369594537",
				IgnoreLayout = true
			},
			TooYoung = {
				Text = "Under-age",
				Image = "rbxassetid://16190533260"
			},
			Infertile = {
				Text = "Infertile",
				Image = "rbxassetid://16289464771"
			},
			InfertileOrigin = {
				Text = "Infertile",
				Image = "rbxassetid://16289464771"
			},
			NoBreedPermission = {
				Text = "No Breeding License",
				Image = "rbxassetid://16651378674"
			},
			NotSameSpecies = {
				Text = "Not Same Species",
				Image = "rbxassetid://16651378674"
			}
		}
	}
end
local function selectAnimal(p1, p2, p3) --[[ selectAnimal | Line: 389 | Upvalues: ContainerFrame (copy), v31 (ref), getAnimalFromSet (copy), t5 (ref), t (copy), v33 (copy), v5 (copy), LocalPlayer (copy), TabFrames (copy), v4 (copy), getUnableCheckForAnimal (copy), setSelectedFrame (copy) ]]
	if not ContainerFrame:FindFirstChild("Menu") then
		return
	end
	if v31 and p2 then
		return
	end
	local v1 = getAnimalFromSet(t5[p1], p1)
	if v1 then
		v1:Deselect()
	end
	t[p1]:DoCleaning()
	t5[p1] = p2
	v33:Fire()
	if not p2 then
		local v2 = TabFrames.Breeding.Content[p1]
		v2.Horses.Visible = true
		v2.HorseInfo.Visible = false
		ContainerFrame["TabButtons" .. p1].Visible = false
		local v3 = TabFrames.Breeding.Content.Center[p1]
		v3.Content.Visible = t5[p1]
		v3.RemoveButton.Visible = v3.Content.Visible
		v3.Unselected.Visible = not v3.Content.Visible
		return
	end
	v31 = true
	local v42 = getAnimalFromSet(p2, p1)
	if v42 then
		v42:Select()
	end
	t[p1]:GiveTask(v5.new({
		ProfileOnMainTab = true,
		SlotValue = p2,
		Owner = LocalPlayer,
		Frame = TabFrames.Breeding.Content[p1].HorseInfo,
		TabButtons = ContainerFrame["TabButtons" .. p1]
	}))
	t[p1]:GiveTask(v4.new({
		DoNotClone = true,
		IgnoreBackgroundColor = true,
		SlotValue = p2,
		Owner = LocalPlayer,
		GuiObject = TabFrames.Breeding.Content.Center[p1].Content,
		UnableCheck = getUnableCheckForAnimal(p2)
	}))
	setSelectedFrame(p1, if p3 then p3 else TabFrames.Breeding.Content[p1].HorseInfo.Visible)
	v31 = false
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 438 | Upvalues: t5 (ref), ContainerFrame (copy), getAnimalFromSet (copy), t (copy), v33 (copy), TabFrames (copy), t4 (ref), t2 (copy) ]]
	for k, v in pairs(t5) do
		if v == p1 and ContainerFrame:FindFirstChild("Menu") then
			local v1 = getAnimalFromSet(t5[k], k)
			if v1 then
				v1:Deselect()
			end
			t[k]:DoCleaning()
			t5[k] = nil
			v33:Fire()
			local v2 = TabFrames.Breeding.Content[k]
			v2.Horses.Visible = true
			v2.HorseInfo.Visible = false
			ContainerFrame["TabButtons" .. k].Visible = false
			local v3 = TabFrames.Breeding.Content.Center[k]
			v3.Content.Visible = t5[k]
			v3.RemoveButton.Visible = v3.Content.Visible
			v3.Unselected.Visible = not v3.Content.Visible
		end
	end
	for k, v in pairs(t4) do
		local v4 = v[p1]
		if v4 then
			v[p1] = nil
			for k2, v2 in pairs(t2) do
				v2:Remove(v4)
			end
			v4:Destroy()
		end
	end
	for k, v in pairs(t4) do
		if v[p1] then
			v[p1] = nil
		end
	end
end
local function v35(p1, p2, p3) --[[ createAnimal | Line: 461 | Upvalues: v6 (copy), v35 (copy), v4 (copy), LocalPlayer (copy), TabFrames (copy), getUnableCheckForAnimal (copy), t2 (copy), t4 (ref), v7 (copy), v31 (ref), t5 (ref), ContainerFrame (copy), v28 (copy), selectAnimal (copy) ]]
	if not p2 then
		task.wait(0.25)
	end
	local v1 = v6.GetGender(p1)
	local v2 = if v1 == "Both" then true else false
	local v3
	if v1 == "Both" and not p3 then
		v35(p1, p2, true)
		v3 = "Male"
	else
		v3 = "Female"
	end
	local v42 = v4.new({
		IgnoreBackgroundColor = true,
		HideGenderIfMain = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		ParentFrame = TabFrames.Breeding.Content[v3].Horses.Content,
		GuiObject = TabFrames.Breeding.Content.Male.Horses.Content.Default,
		UnableCheck = getUnableCheckForAnimal(p1)
	})
	v42:GiveTask(p1.Age:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 487 | Upvalues: v42 (copy) ]]
		v42:SetSpecies()
	end))
	local function genderChanged(p12) --[[ genderChanged | Line: 491 | Upvalues: p1 (copy), t2 (ref), v42 (copy), v2 (copy), v3 (ref), v6 (ref), t4 (ref), v35 (ref), TabFrames (ref) ]]
		if not p1.Parent then
			return
		end
		if not p12 then
			for k, v in pairs(t2) do
				v:Remove(v42)
			end
		end
		if not v2 then
			v3 = v6.GetGender(p1)
		end
		if v3 == "Both" then
			local v1 = p1
			for k, v in pairs(t4) do
				if v[v1] then
					v[v1] = nil
				end
			end
			v42:Destroy()
			v35(p1, false, false)
		else
			v42.Frame.Parent = TabFrames.Breeding.Content[v3].Horses.Content
			local v22 = v3
			local v32 = p1
			local v4 = v42
			if v22 == "Both" then
				t4.Male[v32] = v4
				t4.Female[v32] = v4
			else
				t4[v22][v32] = v4
			end
			t2[v3]:Add(v42, p12)
		end
	end
	v42:GiveTask(p1.Gender:GetPropertyChangedSignal("Value"):Connect(genderChanged))
	genderChanged(true)
	v42:GiveTask(v7.new(v42.Frame, {
		Click = function() --[[ Click | Line: 523 | Upvalues: v31 (ref), t5 (ref), v3 (ref), p1 (copy), TabFrames (ref), ContainerFrame (ref), v6 (ref), v28 (ref), selectAnimal (ref) ]]
			if v31 then
				return
			end
			if t5[v3] == p1 then
				local v1 = v3
				local v2 = TabFrames.Breeding.Content[v1]
				v2.Horses.Visible = false
				v2.HorseInfo.Visible = true
				ContainerFrame["TabButtons" .. v1].Visible = true
				local v32 = TabFrames.Breeding.Content.Center[v1]
				v32.Content.Visible = t5[v1]
				v32.RemoveButton.Visible = v32.Content.Visible
				v32.Unselected.Visible = not v32.Content.Visible
				return
			end
			if v6.CanBreedSlot(v28, p1, t5[if v6.GetGender(p1) == "Male" then "Female" else "Male"], true) == true then
				selectAnimal(v3, p1)
			end
		end
	}))
end
local t8 = {
	Predict = function() --[[ Predict | Line: 541 | Upvalues: v21 (copy), t5 (ref), v14 (copy), v6 (copy), v28 (copy), v12 (copy), v8 (copy), v13 (copy), t6 (ref) ]]
		if not v21.CanDoActionInTutorial("PredictFoalAction") then
			return
		end
		if not (t5.Male and t5.Female) then
			v14.Notify({
				Message = "You must select a Male and Female horse!"
			})
			return
		end
		local v1 = v6.CanPredictBreed(v28)
		if v1 ~= true then
			v12.NotifyIssue(v1)
			return
		end
		local v2, v3, v4 = v8.GetRemoteFunction("PredictBreedSlotRemote"):InvokeServer(t5.Male.Name, t5.Female.Name)
		if not v2 then
			return
		end
		if v28:GetWithModifiers({
			Name = "MutationInheritanceMultiplier",
			Default = 1,
			Slot = t5.Male
		}) ~= v3 or v28:GetWithModifiers({
			Name = "MutationInheritanceMultiplier",
			Default = 1,
			Slot = t5.Female
		}) ~= v4 then
			warn("MULTIPLIERS DIFFERED PER DATAMODEL")
			warn("MULTIPLIERS DIFFERED PER DATAMODEL")
			warn("MULTIPLIERS DIFFERED PER DATAMODEL")
		end
		local _, v5 = v6.BreedSlots(v28, t5.Male, t5.Female, {
			Prediction = true,
			OffsetSeed = true,
			Seed = v2
		})
		v13:DisplaySlot({
			Type = "PredictBreeding",
			DestroySlot = true,
			MobileClickBackgroundToClose = true,
			ContinueIfType = true,
			ForceAdult = true,
			KeepMainFrameOpen = true,
			Slot = v5[1],
			OnContinue = t6.Predict
		})
	end,
	Breed = function() --[[ Breed | Line: 598 | Upvalues: t5 (ref), v14 (copy), v6 (copy), v28 (copy), v12 (copy), v19 (copy), t7 (copy), v20 (copy), v8 (copy), ContainerFrame (copy), getAnimalFromSet (copy), t (copy), v33 (copy), TabFrames (copy), v21 (copy), v2 (copy), t3 (copy) ]]
		if not (t5.Male and t5.Female) then
			v14.Notify({
				Message = "You must select a Male and Female horse!"
			})
			return
		end
		local v1 = v6.CanBreedSlots(v28, t5.Male, t5.Female)
		if v1 ~= true then
			v12.NotifyIssue(v1)
			return
		end
		v19:AddNotification({
			Type = "BreedSuccess",
			Duration = 1.5,
			CheckSetting = true,
			Text = t7[math.random(1, #t7)],
			RunBefore = function() --[[ RunBefore | Line: 617 | Upvalues: v20 (ref) ]]
				v20:Tween()
			end
		})
		if v8.GetRemoteFunction("BreedSlotsRemote"):InvokeServer(t5.Male.Name, t5.Female.Name) then
			for k, v in pairs({ "Male", "Female" }) do
				if ContainerFrame:FindFirstChild("Menu") then
					local v22 = getAnimalFromSet(t5[v], v)
					if v22 then
						v22:Deselect()
					end
					t[v]:DoCleaning()
					t5[v] = nil
					v33:Fire()
					local v3 = TabFrames.Breeding.Content[v]
					v3.Horses.Visible = true
					v3.HorseInfo.Visible = false
					ContainerFrame["TabButtons" .. v].Visible = false
					local v4 = TabFrames.Breeding.Content.Center[v]
					v4.Content.Visible = t5[v]
					v4.RemoveButton.Visible = v4.Content.Visible
					v4.Unselected.Visible = not v4.Content.Visible
				end
			end
		end
		if v21.GetGameState("OpenHUDOnBreed") then
			v2.OpenHUD()
			return
		end
		if v21.GetGameState("KeepFrameOpenOnBreed") then
			return
		end
		t3.Close()
	end,
	FoalNow = function() --[[ FoalNow | Line: 636 | Upvalues: v21 (copy), v28 (copy), t5 (ref), v14 (copy), v6 (copy), v12 (copy), v8 (copy), v23 (copy), LocalPlayer (copy) ]]
		if v21.IsInTutorial(v28) then
			return
		end
		if not (t5.Male and t5.Female) then
			v14.Notify({
				Message = "You must select a Male and Female horse!"
			})
			return
		end
		local v1 = v6.CanBreedSlots(v28, t5.Male, t5.Female)
		if v1 ~= true then
			v12.NotifyIssue(v1)
			return
		end
		if v8.GetRemoteFunction("StoreFoalNowSelectionRemote"):InvokeServer(t5.Male.Name, t5.Female.Name) then
			v23.PromptPurchase(LocalPlayer, 3330225146, "Product")
		else
			v14.Notify({
				Message = "Failed to prepare for purchase. Please try again."
			})
		end
	end,
	ClaimPredict = function() --[[ ClaimPredict | Line: 667 | Upvalues: v6 (copy), v28 (copy), v16 (copy), v23 (copy), LocalPlayer (copy), v26 (copy), v12 (copy), t5 (ref), v8 (copy), v14 (copy), v13 (copy) ]]
		if v6.CanClaimPredictBreed(v28) == "CannotAffordPredictFoalPotion" then
			v16.Prompt({
				Type = "PurchasePredictPotion",
				Run = function() --[[ Run | Line: 673 | Upvalues: v23 (ref), LocalPlayer (ref), v26 (ref) ]]
					v23.PromptPurchase(LocalPlayer, v26.BreedersBundle.ProductId, "Product")
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 678 ]]
					return true
				end
			})
		else
			v16.Prompt({
				Type = "ClaimPredictBreed",
				Run = function() --[[ Run | Line: 685 | Upvalues: v6 (ref), v28 (ref), v12 (ref), t5 (ref), v8 (ref), v14 (ref), v13 (ref) ]]
					local v1 = v6.CanClaimPredictBreed(v28)
					if v1 ~= true then
						v12.NotifyIssue(v1)
						return
					end
					local v2 = v6.CanBreedSlots(v28, t5.Male, t5.Female)
					if v2 ~= true then
						v12.NotifyIssue(v2)
						return
					end
					if not v8.GetRemoteFunction("ClaimSeededPrediction"):InvokeServer() then
						v13:Stop()
						return true
					end
					v14.Notify({
						Preset = "Green",
						Message = "Successfully predicted foal! Claim it after gestation."
					})
					v13:Stop()
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 709 ]]
					return true
				end
			})
		end
	end
}
local function autoFillHorsesForBreeding() --[[ autoFillHorsesForBreeding | Line: 717 | Upvalues: v28 (copy), v6 (copy), selectAnimal (copy) ]]
	local t = {}
	for v1, v2 in v28.PlayerData.Animals:GetChildren() do
		if not v2.InStorage.Value and v6.CanBreedSlot(v28, v2) == true then
			t[v2] = true
			for v3, v4 in v28.PlayerData.Animals:GetChildren() do
				if v2 ~= v4 and v6.CanBreedSlots(v28, v2, v4) == true then
					for v5, v62 in { v2, v4 } do
						local v7 = v6.GetGender(v62)
						selectAnimal(if v7 == "Both" then "Male" else v7, v62)
					end
					return
				end
			end
		end
	end
	for v10, v11 in t do
		local v12 = v6.GetGender(v10)
		selectAnimal(if v12 == "Both" then "Male" else v12, v10)
		return
	end
end
function t3.OnOpen(p1, p2) --[[ OnOpen | Line: 751 | Upvalues: v2 (copy), ContainerFrame (copy), v7 (copy), TabFrames (copy), t5 (ref), setSelectedFrame (copy), v1 (copy), getAnimalFromSet (copy), t (copy), v33 (copy), BreedButton (copy), t8 (ref), PredictButton (copy), v27 (copy), FoalNow (copy), v30 (copy), v8 (copy), v19 (copy), v20 (copy), v28 (copy), v13 (copy), v21 (copy), v15 (copy), v29 (copy), removeAnimal (copy), v35 (copy), t2 (copy), autoFillHorsesForBreeding (copy), v6 (copy), selectAnimal (copy), v17 (copy) ]]
	local v12 = v2.getFrameFromInstance(ContainerFrame)
	if not v12.Opened then
		v12.Opened = true
		for k, v in pairs({ "Male", "Female" }) do
			local v22 = ContainerFrame["TabButtons" .. v]
			v7.new(v22.Back, {
				Click = function() --[[ Click | Line: 759 | Upvalues: v (copy), TabFrames (ref), ContainerFrame (ref), t5 (ref) ]]
					local v1 = v
					local v2 = TabFrames.Breeding.Content[v1]
					v2.Horses.Visible = true
					v2.HorseInfo.Visible = false
					ContainerFrame["TabButtons" .. v1].Visible = false
					local v3 = TabFrames.Breeding.Content.Center[v1]
					v3.Content.Visible = t5[v1]
					v3.RemoveButton.Visible = v3.Content.Visible
					v3.Unselected.Visible = not v3.Content.Visible
				end
			})
			v7.new(TabFrames.Breeding.Content.Center[v], {
				Click = function() --[[ Click | Line: 765 | Upvalues: setSelectedFrame (ref), v (copy), t5 (ref) ]]
					setSelectedFrame(v, t5[v])
				end
			})
			v1.new(TabFrames.Breeding.Content.Center[v].RemoveButton, {
				Click = function() --[[ Click | Line: 771 | Upvalues: v (copy), ContainerFrame (ref), getAnimalFromSet (ref), t5 (ref), t (ref), v33 (ref), TabFrames (ref) ]]
					local v1 = v
					if not ContainerFrame:FindFirstChild("Menu") then
						return
					end
					local v2 = getAnimalFromSet(t5[v1], v1)
					local v3, v4
					if v2 then
						v2:Deselect()
					end
					t[v1]:DoCleaning()
					t5[v1] = nil
					v33:Fire()
					v3 = TabFrames.Breeding.Content[v1]
					v3.Horses.Visible = true
					v3.HorseInfo.Visible = false
					ContainerFrame["TabButtons" .. v1].Visible = false
					v4 = TabFrames.Breeding.Content.Center[v1]
					v4.Content.Visible = t5[v1]
					v4.RemoveButton.Visible = v4.Content.Visible
					v4.Unselected.Visible = not v4.Content.Visible
				end
			})
		end
		v1.new(BreedButton, {
			Click = t8.Breed
		})
		PredictButton.Top.TextLabel.Text = "Predict ($" .. v27.PredictBreedingPrice .. ")"
		v1.new(PredictButton, {
			Click = t8.Predict
		})
		v1.new(FoalNow, {
			Click = t8.FoalNow
		})
		v30:GiveTask(v33:Connect(function() --[[ updateFoalNowVisibility | Line: 790 | Upvalues: FoalNow (ref), t5 (ref) ]]
			FoalNow.Visible = if t5.Male == nil then false else t5.Female ~= nil
		end))
		local v3 = FoalNow
		v3.Visible = if t5.Male == nil then false else t5.Female ~= nil
		v30:GiveTask(v8.GetRemoteEvent("DisplayFoalNowRemote").OnClientEvent:Connect(function(p1) --[[ Line: 799 | Upvalues: v19 (ref), v20 (ref), ContainerFrame (ref), getAnimalFromSet (ref), t5 (ref), t (ref), v33 (ref), TabFrames (ref), v28 (ref), v13 (ref) ]]
			v19:AddNotification({
				Type = "BreedSuccess",
				Text = "Your foal was born instantly! \240\159\144\180",
				Duration = 1.5,
				CheckSetting = true,
				RunBefore = function() --[[ RunBefore | Line: 805 | Upvalues: v20 (ref) ]]
					v20:Tween()
				end
			})
			for k, v in pairs({ "Male", "Female" }) do
				if ContainerFrame:FindFirstChild("Menu") then
					local v1 = getAnimalFromSet(t5[v], v)
					if v1 then
						v1:Deselect()
					end
					t[v]:DoCleaning()
					t5[v] = nil
					v33:Fire()
					local v2 = TabFrames.Breeding.Content[v]
					v2.Horses.Visible = true
					v2.HorseInfo.Visible = false
					ContainerFrame["TabButtons" .. v].Visible = false
					local v3 = TabFrames.Breeding.Content.Center[v]
					v3.Content.Visible = t5[v]
					v3.RemoveButton.Visible = v3.Content.Visible
					v3.Unselected.Visible = not v3.Content.Visible
				end
			end
			task.wait(0.5)
			v13:DisplaySlot({
				Type = "Birth",
				AllowNaming = true,
				ShowMaxWarning = true,
				MobileClickBackgroundToClose = false,
				ForceAdult = true,
				Slot = v28:GetItemFolder("Animals"):WaitForChild(p1)
			})
		end))
		local function setInactiveFrame() --[[ setInactiveFrame | Line: 829 | Upvalues: PredictButton (ref), v21 (ref) ]]
			PredictButton.InactiveFrame.Visible = not v21.GetGameState("PredictFoalAction")
		end
		v27.GameStateChangedSignal:Connect(setInactiveFrame)
		PredictButton.InactiveFrame.Visible = not v21.GetGameState("PredictFoalAction")
		local v5 = v13.GetDismissFrameType("PredictBreeding")
		v5.PredictButton.Top.AmountLabel.Text = "($" .. v27.PredictBreedingPrice .. ")"
		v1.new(v5.PredictButton, {
			Click = function() --[[ Click | Line: 838 | Upvalues: v13 (ref) ]]
				local v1 = v13.GetDisplay()
				if v1 and v1.Type ~= "PredictBreeding" then
					return
				end
				v1.OnContinue()
			end
		})
		v1.new(v5.PayClaim, {
			Click = function() --[[ Click | Line: 847 | Upvalues: v13 (ref), t8 (ref) ]]
				local v1 = v13.GetDisplay()
				if not v1 or v1.Type == "PredictBreeding" then
					t8.ClaimPredict()
				end
			end
		})
		v15:AddControls("GamepadClaimPredict", { Enum.KeyCode.ButtonA }, {
			InputBegan = function() --[[ InputBegan | Line: 858 | Upvalues: t8 (ref) ]]
				t8.ClaimPredict()
			end
		}, function() --[[ Line: 861 | Upvalues: v13 (ref) ]]
			local v1 = v13.GetDisplay()
			if not v1 then
				return
			end
			if v1.Type == "PredictBreeding" then
				return v13.CanDismiss()
			end
		end, nil, true)
	end
	if not v12.ContentsLoaded then
		v12.ContentsLoaded = true
		v30:GiveTask(v29.ChildRemoved:Connect(removeAnimal))
		v30:GiveTask(v29.ChildAdded:Connect(v35))
		for k, v in pairs(v29:GetChildren()) do
			v35(v, true)
		end
		for k, v in pairs(t2) do
			v:Sort(v.SortType or "Alphabet")
		end
	end
	for k, v in pairs({ "Male", "Female" }) do
		if ContainerFrame:FindFirstChild("Menu") then
			local v62 = getAnimalFromSet(t5[v], v)
			if v62 then
				v62:Deselect()
			end
			t[v]:DoCleaning()
			t5[v] = nil
			v33:Fire()
			local v72 = TabFrames.Breeding.Content[v]
			v72.Horses.Visible = true
			v72.HorseInfo.Visible = false
			ContainerFrame["TabButtons" .. v].Visible = false
			local v82 = TabFrames.Breeding.Content.Center[v]
			v82.Content.Visible = t5[v]
			v82.RemoveButton.Visible = v82.Content.Visible
			v82.Unselected.Visible = not v82.Content.Visible
		end
	end
	if v21.GetGameState("AutoFillHorsesInBreeding") then
		autoFillHorsesForBreeding()
	else
		if not p2 then
			v17.OpenTab(ContainerFrame.Menu.TabFrames.Breeding)
			return
		end
		local v9 = v6.GetGender(p2)
		selectAnimal(if v9 == "Both" then "Male" else v9, p2)
	end
	v17.OpenTab(ContainerFrame.Menu.TabFrames.Breeding)
end
local t9 = {
	Breeding = function(p1, p2) --[[ Breeding | Line: 905 | Upvalues: v7 (copy), v17 (copy) ]]
		v7.new(p2, {
			Click = function() --[[ Click | Line: 907 | Upvalues: v17 (ref), p1 (copy) ]]
				v17.OpenTab(p1)
			end
		})
	end,
	ColorCalculator = function(p1, p2) --[[ ColorCalculator | Line: 912 | Upvalues: v7 (copy), v28 (copy), v16 (copy), Sonar (copy), v18 (copy), v17 (copy) ]]
		v7.new(p2, {
			Click = function() --[[ Click | Line: 914 | Upvalues: v28 (ref), v16 (ref), Sonar (ref), v18 (ref), v17 (ref), p1 (copy) ]]
				if v28:GetStatValue("TotalBreeds").Value < 3 then
					v16.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 918 | Upvalues: Sonar (ref), v18 (ref), v28 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = string.format("Breed %s horses to unlock the Color Calculator!", 3)
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 932 | Upvalues: v18 (ref) ]]
									return v18.suffix(p1) .. "/" .. v18.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 936 | Upvalues: v28 (ref) ]]
									return v28:GetStatValue("TotalBreeds").Value
								end,
								GetMax = function() --[[ GetMax | Line: 939 ]]
									return 3
								end,
								Changed = { v28:GetStatValue("TotalBreeds"):GetPropertyChangedSignal("Value") }
							}))
						end,
						Run = function() --[[ Run | Line: 947 ]]
							return true
						end
					})
				else
					v17.OpenTab(p1)
				end
			end
		})
		local function setLocked() --[[ setLocked | Line: 957 | Upvalues: v28 (ref), p2 (copy) ]]
			if v28:GetStatValue("TotalBreeds").Value >= 3 then
				p2.Tab.Locked.Visible = false
			else
				p2.Tab.Locked.Visible = true
			end
		end
		v28:GetStatValue("TotalBreeds"):GetPropertyChangedSignal("Value"):Connect(setLocked)
		if v28:GetStatValue("TotalBreeds").Value >= 3 then
			p2.Tab.Locked.Visible = false
		else
			p2.Tab.Locked.Visible = true
		end
	end
}
function t3.Cleanup(p1) --[[ Cleanup | Line: 969 | Upvalues: t2 (copy), t5 (ref), t4 (ref), removeAnimal (copy), t (copy), v30 (copy), v2 (copy), ContainerFrame (copy) ]]
	for v1, v22 in t2 do
		v22:RemoveAll()
	end
	t5 = {}
	for v3, v4 in t4 do
		for v5, v6 in v4 do
			removeAnimal(v5)
		end
	end
	t4 = {
		Male = {},
		Female = {}
	}
	for k, v in pairs(t) do
		v:DoCleaning()
	end
	v30:DoCleaning()
	v2.CleanContents(ContainerFrame)
end
function t3.OnClose(p1) --[[ OnClose | Line: 992 | Upvalues: v2 (copy), ContainerFrame (copy), t3 (copy) ]]
	if v2.MainFrameOpen ~= ContainerFrame then
		return
	end
	t3.Close(true)
end
function t3.Open(p1, ...) --[[ Open | Line: 998 | Upvalues: v2 (copy), ContainerFrame (copy), v34 (ref), t3 (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		t3.Close()
	else
		v34 = p1
		v2.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t3.Close(p1) --[[ Close | Line: 1012 | Upvalues: v34 (ref), v2 (copy), ContainerFrame (copy) ]]
	if v34 and not p1 then
		v34()
		v34 = nil
		return
	end
	v34 = nil
	v2.CloseFrame(ContainerFrame, {})
	v2.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t3.GetSelectedAnimals() --[[ GetSelectedAnimals | Line: 1027 | Upvalues: t5 (ref) ]]
	return t5
end
function t3.Init(p1) --[[ Init | Line: 1032 | Upvalues: v2 (copy), ContainerFrame (copy), TabFrames (copy), v17 (copy), t9 (copy), t3 (copy), v22 (copy), v1 (copy), Sonar (copy), v25 (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = function() --[[ SelectOnOpen | Line: 1039 | Upvalues: TabFrames (ref) ]]
			for k, v in pairs({ "Female", "Male" }) do
				if TabFrames.Breeding.Content.Center[v].Unselected.Visible then
					return TabFrames.Breeding.Content.Center[v]
				end
			end
			return TabFrames.Breeding.Content.Center.Female
		end
	})
	for k, v in pairs(ContainerFrame.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v12 = ContainerFrame.Menu.TabFrames:FindFirstChild(v.Name)
			if v12 then
				v17.AddTab(v12, {
					ParentFrame = ContainerFrame,
					Button = v
				})
				t9[v.Name](v12, v)
				local function setSize() --[[ setSize | Line: 1061 | Upvalues: v (copy), v17 (ref), v12 (copy) ]]
					v.UIScale.Scale = if v17.IsTabOpen(v12) then 1.2 else 1
				end
				v17.AddStateCallback(v12, "OnOpen", setSize)
				v17.AddStateCallback(v12, "OnClose", setSize)
			end
		end
	end
	v2.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 1075 | Upvalues: t3 (ref) ]]
		t3:OnOpen(...)
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1078 | Upvalues: t3 (ref) ]]
		t3:OnClose()
	end)
	v2.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 1081 | Upvalues: t3 (ref) ]]
		t3:Cleanup()
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1084 | Upvalues: v22 (ref) ]]
		v22.Close()
	end)
	v1.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 1089 | Upvalues: t3 (ref) ]]
			t3.Close()
		end
	})
	v1.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 1094 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("Breeding")
		end
	})
	if not v25.IsMainWorld() then
		return
	end
	local InteractPart = workspace:WaitForChild("Interactions"):WaitForChild("AnimalBreeding").InteractPart
	if not InteractPart then
		return
	end
	Sonar("InteractMenu").new(InteractPart, {
		ShowHintLabel = true,
		Hint = "Open Breeding",
		Run = function() --[[ Run | Line: 1105 | Upvalues: t3 (ref) ]]
			t3.Open()
		end,
		GetRange = function() --[[ GetRange | Line: 1108 ]]
			return 25
		end
	})
end
t3:Init()
return t3