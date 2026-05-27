-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("ViewportModel")
local v4 = Sonar("AnimalCosmetics")
local v5 = Sonar("DisplayUtils")
local v6 = Sonar("FormatNumber")
local v7 = Sonar("FormatString")
local v8 = Sonar("TabManager")
local v9 = Sonar("Button")
local v10 = Sonar("ButtonTest")
local v11 = Sonar("StatBar")
local v12 = Sonar("GuiUtils")
local v13 = Sonar("LevelUtils")
local v14 = Sonar("Signal")
local v15 = Sonar("TimeUtils")
local v16 = Sonar("TimeFormat")
local v17 = Sonar("ItemDataService")
local v18 = Sonar("MutationUtils")
local v19 = Sonar("MutationStatUtils")
local v20 = Sonar("PromptClient")
local v21 = Sonar("IssueResponseClient")
local v22 = Sonar("RemoteUtils")
local v23 = Sonar("AnimalRiggerService")
local v24 = Sonar("NotificationsClient")
local v25 = Sonar("ToolTipClient")
local v26 = Sonar("ConsumablesService")
local v27 = Sonar("Table")
local v28 = Sonar("OriginBuffUtils")
local v29 = Sonar("MutationRollService")
local v30 = Sonar("BreedContestService")
local v31 = Sonar("ColorUtils")
local v32 = Sonar("TutorialService")
local v33 = Sonar("TransparencyUtils")
local v34 = Sonar("ReflectanceUtils")
local v35 = Sonar("MathUtils")
local v36 = Sonar("spr")
local v37 = Sonar("Confetti")
local v38 = Sonar("StorageUtils")
local v39 = Sonar("PlaceTypeService")
local v40 = Sonar("Constants")
local ElderingStats = v40.ElderingStats
local v41 = Sonar(v38.Get("UpgradeStats"))
local sum = 0
local t2 = {
	CoatTop = 1,
	CoatBottom = 2,
	Hair = 3,
	Hoof = 4,
	Nose = 5,
	Sock = 6,
	Keratin = 7,
	Paint = 8,
	Pattern = 9
}
for k, v in pairs(v41) do
	sum = sum + v.MaxLevel
end
local LocalPlayer = game:GetService("Players").LocalPlayer
local v42 = Sonar("PlayerWrapper").GetClient()
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
function t._createTabs(p1) --[[ _createTabs | Line: 83 | Upvalues: t3 (copy), v8 (copy), v9 (copy), v32 (copy), v40 (copy) ]]
	if t3[p1.TabFrames] then
		return
	end
	t3[p1.TabFrames] = true
	for k, v in pairs(p1.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v1 = p1.TabFrames:FindFirstChild(v.Name)
			if v1 then
				v8.AddTab(v1, {
					ParentFrame = p1.Frame,
					Button = v
				})
				local function setSize() --[[ setSize | Line: 97 | Upvalues: v (copy), v8 (ref), v1 (copy) ]]
					v.UIScale.Scale = if v8.IsTabOpen(v1) then 1.2 else 1
				end
				v8.AddStateCallback(v1, "OnOpen", setSize)
				v8.AddStateCallback(v1, "OnClose", setSize)
				v9.new(v, {
					Click = function() --[[ Click | Line: 104 | Upvalues: v32 (ref), v (copy), v8 (ref), v1 (copy) ]]
						if v32.CanDoActionInTutorial(v.Name .. "Tab") then
							v8.OpenTab(v1)
						end
					end
				})
				local InactiveFrame = v:FindFirstChild("InactiveFrame", true)
				local function setInactiveFrame() --[[ setInactiveFrame | Line: 113 | Upvalues: InactiveFrame (copy), v32 (ref), v (copy) ]]
					if not InactiveFrame then
						return
					end
					InactiveFrame.Visible = not v32.GetGameState(v.Name .. "Tab")
				end
				v40.GameStateChangedSignal:Connect(setInactiveFrame)
				if InactiveFrame then
					InactiveFrame.Visible = not v32.GetGameState(v.Name .. "Tab")
				end
			end
		end
	end
	v8.OpenTab(p1.Tabs.Main)
end
function t._createColorTab(p1) --[[ _createColorTab | Line: 126 | Upvalues: t4 (copy), v8 (copy) ]]
	if not p1.TabFrames then
		return
	end
	if t4[p1.TabFrames] then
		return
	end
	t4[p1.TabFrames] = true
	if p1.Tabs.Breeding and not p1.Tabs.Breeding:FindFirstChild("Colors") and p1.Tabs.Breeding then
		local ColorsFrame = p1.ColorsFrame
		local ProfileInfoFrame = p1.ProfileInfoFrame
		local Breeding = p1.Tabs.Breeding
		local function setColorTab() --[[ setColorTab | Line: 137 | Upvalues: ColorsFrame (copy), v8 (ref), Breeding (copy), ProfileInfoFrame (copy) ]]
			ColorsFrame.Visible = v8.IsTabOpen(Breeding)
			ProfileInfoFrame.Visible = not ColorsFrame.Visible
		end
		v8.AddStateCallback(Breeding, "OnOpen", setColorTab)
		v8.AddStateCallback(Breeding, "OnClose", setColorTab)
		ColorsFrame.Visible = v8.IsTabOpen(Breeding)
		ProfileInfoFrame.Visible = not ColorsFrame.Visible
	end
	if not (p1.ProfileOnMainTab and p1.Tabs.Main) then
		return
	end
	local function setProfileFrame() --[[ setProfileFrame | Line: 147 | Upvalues: p1 (copy), v8 (ref) ]]
		p1.ProfileFrame.Visible = v8.IsTabOpen(p1.Tabs.Main)
	end
	v8.AddStateCallback(p1.Tabs.Main, "OnOpen", setProfileFrame)
	v8.AddStateCallback(p1.Tabs.Main, "OnClose", setProfileFrame)
end
function t._setupScrollingFrame(p1, p2) --[[ _setupScrollingFrame | Line: 155 | Upvalues: t5 (copy) ]]
	if not p2 then
		return
	end
	if not p2:IsA("ScrollingFrame") then
		return
	end
	local _ = t5[p2]
end
function t._createValueDropdown(p1) --[[ _createValueDropdown | Line: 166 | Upvalues: t6 (copy), v10 (copy) ]]
	if not p1.TopBreakdownFrame then
		return
	end
	local DropdownButton = p1.TopBreakdownFrame:FindFirstChild("DropdownButton")
	if not DropdownButton then
		return
	end
	if t6[DropdownButton] then
		return
	end
	local ActivityFrame = p1.ActivityFrame
	local Dropdown = p1.BreakdownFrame.Dropdown
	v10.new(DropdownButton, {
		Click = function() --[[ Click | Line: 176 | Upvalues: Dropdown (copy), ActivityFrame (copy) ]]
			if Dropdown.Visible then
				Dropdown.Visible = false
				ActivityFrame.Visible = true
			else
				Dropdown.Visible = true
				ActivityFrame.Visible = false
			end
		end
	})
	local function setRotation() --[[ setRotation | Line: 187 | Upvalues: DropdownButton (copy), Dropdown (copy) ]]
		DropdownButton.Top.ArrowLabel.Rotation = if Dropdown.Visible then 0 else 180
	end
	Dropdown:GetPropertyChangedSignal("Visible"):Connect(setRotation)
	DropdownButton.Top.ArrowLabel.Rotation = if Dropdown.Visible then 0 else 180
	t6[DropdownButton] = true
end
function t._resizeGuiObject(p1, p2, p3, p4) --[[ _resizeGuiObject | Line: 196 ]]
	if not p2:GetAttribute("Original" .. p3) then
		p2:SetAttribute("Original" .. p3, p2[p3])
	end
	p2[p3] = if p4 then p4 else p2:GetAttribute("Original" .. p3)
end
function t.new(p1) --[[ new | Line: 203 | Upvalues: t (copy), v1 (copy), v14 (copy), v25 (copy), v10 (copy), v2 (copy), v5 (copy), v40 (copy), v16 (copy), v6 (copy), v33 (copy), v34 (copy), v13 (copy), v41 (copy), v11 (copy), v30 (copy), v42 (copy), LocalPlayer (copy), v15 (copy), v28 (copy), v17 (copy), v18 (copy), v8 (copy), v26 (copy), v22 (copy), v24 (copy), v20 (copy), v39 (copy), ElderingStats (copy) ]]
	local v23 = setmetatable(p1, t)
	v23.ViewportMaid = v1.new()
	v23.Maid = v1.new()
	v23.Disabled = v23.Disabled or {}
	v23.Maid:GiveTask(v23.ViewportMaid)
	v23.ViewportChangedSignal = v14.new()
	v23.Maid:GiveTask(v23.ViewportChangedSignal)
	v23.ProfileFrame = v23.Frame:FindFirstChild("Profile")
	v23.ProfileInfoFrame = v23.ProfileFrame:FindFirstChild("Info") or v23.ProfileFrame:FindFirstChild("InfoFrame")
	v23.ViewportFrame = v23.ViewportFrame or v23.ProfileFrame:FindFirstChild("Viewport", true) or v23.ProfileFrame:FindFirstChild("ViewportFrame", true) or v23.Frame:FindFirstChild("Viewport", true)
	v25:RemoveToolTip()
	v23.TabFrames = v23.Frame:FindFirstChild("TabFrames")
	v23.Tabs = {}
	if v23.TabFrames then
		for k, v in pairs(v23.TabFrames:GetChildren()) do
			v23.Tabs[v.Name] = v
		end
	end
	v23.TabButtons = v23.TabButtons or v23.Frame:FindFirstChild("TabButtons")
	if v23.TabButtons and next(v23.Tabs) then
		v23:_createTabs()
		for k, v in pairs(v23.TabButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				v.Visible = not v23.Disabled[v.Name]
			end
		end
	end
	v23.Maid:GiveTask(v23.SlotValue:WaitForChild("Species"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 245 | Upvalues: v23 (copy) ]]
		v23:SetSpecies()
	end))
	v23:SetSpecies(true)
	v23.NameFrame = v23.Frame:FindFirstChild("Name")
	v23.NameLabel = v23.NameFrame and v23.NameFrame:FindFirstChild("NameLabel") or v23.Frame:FindFirstChild("NameLabel", true)
	if v23.NameLabel then
		v23.Maid:GiveTask(v23.SlotValue:WaitForChild("CustomName"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 255 | Upvalues: v23 (copy) ]]
			v23:SetName()
		end))
		if v23.SpeciesAsName then
			v23.Maid:GiveTask(v23.SlotValue:WaitForChild("Species"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 259 | Upvalues: v23 (copy) ]]
				v23:SetName()
			end))
		end
		v23:SetName()
	end
	v23.InfoButton = v23.ProfileInfoFrame and v23.ProfileInfoFrame:FindFirstChild("InfoButton")
	if v23.InfoButton then
		if v23.Disabled.InfoPopup then
			v23.InfoButton.Visible = false
		else
			v23.Maid:GiveTask(v10.new(v23.InfoButton, {
				Click = function() --[[ Click | Line: 271 | Upvalues: v25 (ref), v23 (copy) ]]
					v25:CreateToolTip({
						Type = "HorseOwnerInfo",
						GuiObject = v23.InfoButton,
						Get = function() --[[ Get | Line: 275 | Upvalues: v23 (ref) ]]
							return v23.SlotValue
						end
					})
				end
			}))
			v23.InfoButton.Visible = true
		end
	end
	if v23.ProfileInfoFrame then
		local tbl = {
			[v23.ProfileInfoFrame.Gender] = {
				Values = { v23.SlotValue.Gender },
				Get = function() --[[ Get | Line: 292 | Upvalues: v2 (ref), v23 (copy) ]]
					local v1 = v2.GetGender(v23.SlotValue)
					local v22 = v1:upper()
					if v1 == "Both" then
						return v22, "\226\173\149\239\184\143"
					end
					if v1 == "Male" then
						return v22, "\226\153\130\239\184\143"
					else
						return v22, "\226\153\128\239\184\143"
					end
				end
			},
			[v23.ProfileInfoFrame:FindFirstChild("Origins", true) or false] = {
				Values = { v23.SlotValue.Origin },
				Get = function() --[[ Get | Line: 299 | Upvalues: v2 (ref), v23 (copy) ]]
					return v2.GetOrigin(v23.SlotValue):upper()
				end
			},
			[v23.ProfileInfoFrame.Species] = {
				Values = { v23.SlotValue.Species },
				Get = function() --[[ Get | Line: 305 | Upvalues: v2 (ref), v23 (copy), v5 (ref) ]]
					local v1 = v2.GetByName(v23.SlotValue.Species.Value)
					return v5.GetDisplayName(v1.Name, v1):upper()
				end
			},
			[v23.ProfileInfoFrame:FindFirstChild("Age") or false] = {
				Values = { v23.SlotValue.Age, v23.SlotValue:WaitForChild("Eldering"):WaitForChild("Completed") },
				Get = function() --[[ Get | Line: 312 | Upvalues: v2 (ref), v23 (copy), v40 (ref) ]]
					local v1 = v2.GetAge(v23.SlotValue)
					if v23.SlotValue.Eldering.Completed.Value then
						v1 = "Elder"
					end
					return v1:upper() .. " (" .. v23.SlotValue.Age.Value .. ")", v40.AgeImages[v1]
				end
			},
			[v23.ProfileInfoFrame:FindFirstChild("SizeType") or false] = {
				Values = { v23.SlotValue.SizeType },
				Get = function() --[[ Get | Line: 324 | Upvalues: v23 (copy) ]]
					return v23.SlotValue.SizeType.Value:upper()
				end
			},
			[v23.ProfileInfoFrame:FindFirstChild("Birthday") or false] = {
				Values = { v23.SlotValue.TimeReceived },
				Get = function() --[[ Get | Line: 330 | Upvalues: v16 (ref), v23 (copy) ]]
					return v16.GetFormattedTime("j F o", v23.SlotValue.TimeReceived.Value):upper()
				end
			},
			[v23.ProfileInfoFrame:FindFirstChild("Value") or false] = {
				Values = v2.GetPriceChangeValues(v23.SlotValue),
				Get = function() --[[ Get | Line: 336 | Upvalues: v6 (ref), v2 (ref), v23 (copy) ]]
					return "$" .. v6.splice(v2.GetPriceForSlot(v23.SlotValue))
				end
			}
		}
		for k, v in pairs(tbl) do
			if k then
				if v23.Disabled[k.Name] then
					k.Visible = false
					continue
				end
				k.Visible = true
				for k2, v9 in pairs(v.Values) do
					v23.Maid:GiveTask(v9:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 349 | Upvalues: v23 (copy), k (copy), v (copy) ]]
						v23:SetProfileLabel(k, v.Get)
					end))
				end
				v23:SetProfileLabel(k, v.Get)
			end
		end
	end
	v23.ColorsFrame = v23.Tabs.Breeding and v23.Tabs.Breeding:FindFirstChild("Colors") or (v23.ProfileFrame:FindFirstChild("Colors") or v23.Frame:FindFirstChild("Colors", true))
	if v23.ColorsFrame then
		v23:_createColorTab()
		for k, v in pairs(v23.SlotValue.Colors:GetChildren()) do
			v23:CreateBodyColor(v)
		end
	end
	v23.TraitsFrame = v23.Tabs.Breeding and v23.Tabs.Breeding:FindFirstChild("Traits") or v23.Frame:FindFirstChild("Traits", true)
	if v23.TraitsFrame then
		v23.TotalTraitsLabel = v23.TraitsFrame:FindFirstChild("Total")
		if v23.TotalTraitsLabel then
			for k, v in pairs(v2.GetPriceChangeValues(v23.SlotValue)) do
				v23.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 376 | Upvalues: v23 (copy) ]]
					v23:SetTotalTraits()
				end))
			end
			v23:SetTotalTraits()
		end
		for k, v in pairs({ "Patterns", "Paints", "Cosmetics" }) do
			for k2, v19 in pairs(v23.SlotValue[v]:GetChildren()) do
				v23:CreateTrait({
					Type = v,
					Value = v19,
					Trait = v2.GetTrait(v19.Name, v)
				})
			end
		end
		for k, v in pairs(v23.SlotValue.MiscCosmetics:GetChildren()) do
			v23:CreateTrait({
				Type = v.Name .. "s",
				Value = v,
				Get = function(p1) --[[ Get | Line: 399 | Upvalues: v2 (ref), v (copy) ]]
					return v2.GetTrait(p1.Value, v.Name .. "s")
				end
			})
		end
		v23:CreateTrait({
			Type = "Eyes",
			Value = v23.SlotValue.Colors.Eye,
			Get = function(p1) --[[ Get | Line: 409 | Upvalues: v2 (ref) ]]
				return v2.GetTrait(p1.Value, "Eyes")
			end
		})
		v23:CreateTrait({
			Type = "Transparency",
			Image = "rbxassetid://86546247464515",
			IgnoreColor = true,
			Value = v23.SlotValue.Transparency,
			Get = function(p1) --[[ Get | Line: 419 | Upvalues: v2 (ref), v23 (copy), v33 (ref) ]]
				return v2.GetByName(v23.SlotValue.Species.Value).Transparency and v33.GetTransparency(p1.Value)
			end
		})
		v23:CreateTrait({
			Type = "Reflectance",
			Image = "rbxassetid://77674553526968",
			IgnoreColor = true,
			Value = v23.SlotValue.Reflectance,
			Get = function(p1) --[[ Get | Line: 430 | Upvalues: v2 (ref), v23 (copy), v34 (ref) ]]
				return v2.GetByName(v23.SlotValue.Species.Value).Reflectance and v34.GetReflectance(p1.Value)
			end
		})
	end
	if v23.Tabs.Skills then
		v23.SkillsFrame = v23.Tabs.Skills:FindFirstChild("Content") or v23.Tabs.Skills
		for k, v in pairs(v23.SkillsFrame:GetChildren()) do
			if v:IsA("Frame") then
				local Locked = v:FindFirstChild("Locked")
				if v.Name == "Fertility" then
					local function setUnlocked() --[[ setUnlocked | Line: 448 | Upvalues: v13 (ref), v23 (copy), v40 (ref), Locked (copy), v (copy) ]]
						local v1 = v13.GetTotalSkillLevels(v23.SlotValue)
						local RequiredFertilityLevel = v40.RequiredFertilityLevel
						local v2 = RequiredFertilityLevel <= v1
						if Locked then
							Locked.TotalLabel.Text = v1 .. "/" .. RequiredFertilityLevel .. " Total Skill Levels"
							Locked.Visible = not v2
						else
							v.Visible = v2
						end
					end
					for v122, v132 in v23.SlotValue.Upgrades:GetChildren() do
						v23.Maid:GiveTask(v132:GetPropertyChangedSignal("Value"):Connect(setUnlocked))
					end
					local v142 = v13.GetTotalSkillLevels(v23.SlotValue)
					local RequiredFertilityLevel = v40.RequiredFertilityLevel
					local v152 = if RequiredFertilityLevel <= v142 then true else false
					if Locked then
						Locked.TotalLabel.Text = v142 .. "/" .. RequiredFertilityLevel .. " Total Skill Levels"
						Locked.Visible = not v152
					else
						v.Visible = v152
					end
				end
				local v162 = v23.SlotValue.Upgrades[v.Name]
				v23.Maid:GiveTask(v162:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 468 | Upvalues: v23 (copy), v (copy), v162 (copy) ]]
					v23:SetSkillLevel(v, v162)
				end))
				v23:SetSkillLevel(v, v162)
				v23.Maid:GiveTask(v10.new(v:FindFirstChild("HelpButton", true), {
					Click = function() --[[ Click | Line: 474 | Upvalues: v25 (ref), v (copy), v41 (ref) ]]
						v25:CreateToolTip({
							Type = "SkillHelp",
							GuiObject = v:FindFirstChild("HelpButton", true),
							Get = function() --[[ Get | Line: 478 | Upvalues: v41 (ref), v (ref) ]]
								return v41[v.Name]
							end
						})
					end
				}))
				v23.Maid:GiveTask(v11.new({
					TweenAmount = true,
					Clipped = false,
					Frame = v:FindFirstChild("ProgressBar", true).Fill,
					AmountLabel = v:FindFirstChild("Xp", true),
					GetText = function() --[[ GetText | Line: 491 | Upvalues: v6 (ref), v162 (copy), v13 (ref) ]]
						return v6.suffix(v162.Experience.Value) .. "/" .. v6.suffix(v13.GetNextLevelExperience(v162.Value)) .. " XP"
					end,
					Get = function() --[[ Get | Line: 495 | Upvalues: v162 (copy), v13 (ref) ]]
						return v162.Experience.Value - v13.GetRequiredExperience(v162.Value)
					end,
					GetMax = function() --[[ GetMax | Line: 498 | Upvalues: v13 (ref), v162 (copy) ]]
						return v13.GetNextLevelExperience(v162.Value) - v13.GetRequiredExperience(v162.Value)
					end,
					Changed = { v162.Experience:GetPropertyChangedSignal("Value"), v162:GetPropertyChangedSignal("Value") }
				}))
			end
		end
	end
	v23.PedigreeLabel = v23.ViewportFrame:FindFirstChild("PedigreeLabel", true)
	if v23.PedigreeLabel then
		if v23.Disabled.Pedigree then
			v23.PedigreeLabel.Visible = false
		else
			v23.Maid:GiveTask(v23.SlotValue.Serial:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 513 | Upvalues: v23 (copy) ]]
				v23:SetPedigree()
			end))
			v23:SetPedigree()
		end
	end
	v23.FavoriteLabel = v23.Frame:FindFirstChild("Favorite", true)
	v23.FavoriteButton = v23.Frame:FindFirstChild("FavoriteButton", true)
	if v23.FavoriteLabel then
		if v23.Disabled.Favorite then
			v23.FavoriteLabel.Visible = false
		else
			v23.Maid:GiveTask(v23.SlotValue.Favorite:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 527 | Upvalues: v23 (copy) ]]
				v23:SetFavorite()
			end))
			v23:SetFavorite()
		end
	end
	if v23.FavoriteButton then
		v23.FavoriteButton.Visible = not v23.Disabled.Favorite
	end
	v23.ActivityFrame = v23.Tabs.Main and v23.Tabs.Main:FindFirstChild("Activity") or v23.Frame:FindFirstChild("Activity", true)
	if v23.ActivityFrame then
		if v23.Disabled.Activity then
			v23.ActivityFrame.Visible = false
		else
			v23.ActivityFrame.Visible = true
			v23.ActivityContentFrame = v23.ActivityFrame:FindFirstChild("Content") or v23.ActivityFrame
			v23.TotalActivityLabel = v23.ActivityContentFrame:FindFirstChild("Total")
			v23.AllActivity = {}
			v23.ActiveActivity = {}
			v23.ActivityChangedSignal = v14.new()
			v23.Maid:GiveTask(v23.ActivityChangedSignal)
			v23.Maid:GiveTask(function() --[[ Line: 555 | Upvalues: v23 (copy) ]]
				for k, v in pairs(v23.AllActivity) do
					v:Destroy()
				end
			end)
			v23.Maid:GiveTask(v23.ActivityChangedSignal:Connect(function() --[[ Line: 561 | Upvalues: v23 (copy) ]]
				v23:SetTotalActivity()
			end))
			v23:SetTotalActivity()
			v23:CreateActivity({
				Type = "CosmeticContest",
				Image = "rbxassetid://17173012518",
				Text = string.upper("Contest Score"),
				SubText = function() --[[ SubText | Line: 570 | Upvalues: v30 (ref), v42 (ref), v23 (copy) ]]
					if v30.CheckSubmitCondition(v42, v23.SlotValue, "CorrectSpecies") and v30.CheckSubmitCondition(v42, v23.SlotValue, "RecievedInWeek") then
						return v30.GetAccuracy(v30.CompareSlots(v23.SlotValue)) .. " Accuracy"
					else
						return "N/A"
					end
				end,
				Changed = { v30.CurrentSlotChangedSignal, v23.SlotAttributesChangedSignal, v30.RefreshTimer.SeedChanged },
				CheckActive = function() --[[ CheckActive | Line: 582 | Upvalues: v30 (ref), v42 (ref), v23 (copy) ]]
					if v30.CheckSubmitCondition(v42, v23.SlotValue, "CorrectSpecies") and v30.CheckSubmitCondition(v42, v23.SlotValue, "RecievedInWeek") then
						return true
					end
				end,
				Click = function(p1, p2, p3) --[[ Click | Line: 588 | Upvalues: v25 (ref), v30 (ref), v42 (ref), v23 (copy) ]]
					v25:CreateToolTip({
						Type = "StatusDescription",
						Offset = Vector2.new(0.9, 0.25),
						GuiObject = p1,
						Get = function() --[[ Get | Line: 593 | Upvalues: v30 (ref), v42 (ref), v23 (ref) ]]
							if v30.CheckSubmitCondition(v42, v23.SlotValue, "CorrectSpecies") and v30.CheckSubmitCondition(v42, v23.SlotValue, "RecievedInWeek") then
								return {
									Name = "CosmeticContest",
									Image = "rbxassetid://17173012518",
									Description = string.format("This horse has a %s accuracy score in the contest!", v30.GetAccuracy(v30.CompareSlots(v23.SlotValue)))
								}
							else
								return {
									Name = "CosmeticContest",
									Description = "This horse is not eligible for the contest!",
									Image = "rbxassetid://17173012518"
								}
							end
						end
					})
				end
			})
			if v23.SlotValue:FindFirstChild("LimitedSerial") then
				local LimitedSerial = v23.SlotValue.LimitedSerial.Value
				if LimitedSerial ~= 0 and (LimitedSerial ~= "" and not tostring(LimitedSerial):find(":")) then
					local v19 = tonumber(LimitedSerial)
					if v19 and v19 > 0 then
						v23:CreateActivity({
							Type = "LimitedStock",
							Text = "Stock Serial #",
							Image = "rbxassetid://17173012518",
							SubText = v23.SlotValue:FindFirstChild("LimitedSerial").Value,
							Changed = { v23.SlotValue.LimitedSerial:GetPropertyChangedSignal("Value") },
							CheckActive = function() --[[ CheckActive | Line: 629 | Upvalues: v23 (copy) ]]
								local LimitedSerial = v23.SlotValue.LimitedSerial.Value
								if LimitedSerial == 0 or (LimitedSerial == "" or tostring(LimitedSerial):find(":")) then
									return false
								end
								local v1 = tonumber(LimitedSerial)
								return if v1 then v1 > 0 else v1
							end,
							Click = function(p1, p2, p3) --[[ Click | Line: 638 | Upvalues: v25 (ref) ]]
								v25:CreateToolTip({
									Type = "StatusDescription",
									Offset = Vector2.new(0.9, 0.25),
									GuiObject = p1,
									Get = function() --[[ Get | Line: 643 ]]
										return {
											Name = "LimitedStock",
											Description = "The limited stock of the horse",
											Image = "rbxassetid://16450269627"
										}
									end
								})
							end
						})
					end
				end
			end
			if v23.Owner == LocalPlayer then
				v23:CreateActivity({
					Type = "Pregnancy",
					Image = "rbxassetid://16450269627",
					Target = function() --[[ Target | Line: 660 ]]
						return true
					end,
					Text = function() --[[ Text | Line: 663 | Upvalues: v23 (copy) ]]
						local v1 = #v23.SlotValue.Child:GetChildren() + 1
						local v2 = ("With Child"):upper()
						local v3, v4
						if v1 > 1 then
							v3 = " (x" .. v1 .. ")"
							v4 = v2
						else
							v4 = v2
							v3 = ""
						end
						return v4 .. v3
					end,
					Time = function() --[[ Time | Line: 668 | Upvalues: v2 (ref), v42 (ref), v23 (copy), v15 (ref) ]]
						local v1 = v2.GetBirthTimeLeft(v42, v23.SlotValue)
						return if v1 > 0 then v15.FormatString(v1) or "Ready!" else "Ready!"
					end,
					Changed = { v23.SlotValue.Child:GetPropertyChangedSignal("Value"), v23.SlotValue.Child.ChildAdded, v23.SlotValue.Child.ChildRemoved },
					CheckActive = function() --[[ CheckActive | Line: 677 | Upvalues: v23 (copy) ]]
						return #v23.SlotValue.Child.Value > 0
					end,
					Click = function(p1, p2, p3) --[[ Click | Line: 680 | Upvalues: v25 (ref) ]]
						v25:CreateToolTip({
							Type = "StatusDescription",
							Offset = Vector2.new(0.9, 0.25),
							GuiObject = p1,
							Get = function() --[[ Get | Line: 685 ]]
								return {
									Name = "WithChildTimer",
									Description = "Timer of when the foal can be born! (Can be reduced with food)",
									Image = "rbxassetid://16450269627"
								}
							end
						})
					end
				})
				v23:CreateActivity({
					Type = "BreedCooldown",
					Image = "rbxassetid://16450269627",
					Text = ("Breed Cooldown"):upper(),
					Time = function() --[[ Time | Line: 699 | Upvalues: v15 (ref), v2 (ref), v42 (ref), v23 (copy) ]]
						return v15.FormatString(v2.GetBirthTimeLeft(v42, v23.SlotValue))
					end,
					Changed = { v23.SlotValue.Gender:GetPropertyChangedSignal("Value"), v23.SlotValue.LastBreed:GetPropertyChangedSignal("Value") },
					CheckActive = function() --[[ CheckActive | Line: 706 | Upvalues: v2 (ref), v23 (copy), v42 (ref) ]]
						if v2.GetGender(v23.SlotValue) == "Female" then
							return
						end
						return v2.GetBirthTimeLeft(v42, v23.SlotValue) > 0
					end,
					Click = function(p1, p2, p3) --[[ Click | Line: 710 | Upvalues: v25 (ref) ]]
						v25:CreateToolTip({
							Type = "StatusDescription",
							Offset = Vector2.new(0.9, 0.25),
							GuiObject = p1,
							Get = function() --[[ Get | Line: 715 ]]
								return {
									Name = "BreedCooldown",
									Description = "Cooldown of when the horse can breed again! (Can be reduced with food)",
									Image = "rbxassetid://16450269627"
								}
							end
						})
					end
				})
				if v2.GetBreedWait(v42, v23.SlotValue) and v23.SlotValue:FindFirstChild("LastBreedFixed") then
					v23:CreateActivity({
						Type = "BreedWait",
						Image = "rbxassetid://16190517893",
						Text = ("Breed Wait"):upper(),
						Time = function() --[[ Time | Line: 731 | Upvalues: v15 (ref), v2 (ref), v42 (ref), v23 (copy) ]]
							return v15.FormatString(v2.GetBirthWaitTimeLeft(v42, v23.SlotValue))
						end,
						Changed = { v23.SlotValue.Gender:GetPropertyChangedSignal("Value"), v23.SlotValue.LastBreedFixed:GetPropertyChangedSignal("Value") },
						CheckActive = function() --[[ CheckActive | Line: 738 | Upvalues: v2 (ref), v42 (ref), v23 (copy) ]]
							if not v2.GetBreedWait(v42, v23.SlotValue) then
								return
							end
							return v2.GetBirthWaitTimeLeft(v42, v23.SlotValue) > 0
						end,
						Click = function(p1, p2, p3) --[[ Click | Line: 742 | Upvalues: v25 (ref) ]]
							v25:CreateToolTip({
								Type = "StatusDescription",
								Offset = Vector2.new(0.9, 0.25),
								GuiObject = p1,
								Get = function() --[[ Get | Line: 747 ]]
									return {
										Name = "BreedWait",
										Description = "This horse has to wait a fixed cooldown before breeding again!",
										Image = "rbxassetid://16190517893"
									}
								end
							})
						end
					})
				end
			end
			v23:CreateActivity({
				Type = "OriginBuff",
				Image = "rbxassetid://16190539141",
				SubText = "Passive",
				Text = function(p1) --[[ Text | Line: 762 | Upvalues: v23 (copy) ]]
					return v23.SlotValue.OriginBuff.Value:upper()
				end,
				Changed = { v23.SlotValue.OriginBuff:GetPropertyChangedSignal("Value") },
				CheckActive = function() --[[ CheckActive | Line: 770 | Upvalues: v23 (copy) ]]
					if v23.SlotValue.OriginBuff.Value == "Nothing" then
						return
					end
					return #v23.SlotValue.OriginBuff.Value > 0
				end,
				Click = function(p1, p2, p3) --[[ Click | Line: 774 | Upvalues: v25 (ref), v28 (ref), v23 (copy) ]]
					v25:CreateToolTip({
						Type = "StatusDescription",
						Offset = Vector2.new(0.9, 0.25),
						GuiObject = p1,
						Get = function() --[[ Get | Line: 779 | Upvalues: v28 (ref), v23 (ref) ]]
							local v1 = v28.GetType(v23.SlotValue.OriginBuff.Value)
							return {
								Image = "rbxassetid://16190539141",
								Name = v1.Name,
								DisplayName = v1.DisplayName
							}, v1.ModifierStats
						end
					})
				end
			})
			v23:CreateActivity({
				Type = "Infertile",
				Image = "rbxassetid://16289464771",
				SubText = "Passive",
				Text = string.upper("Infertile"),
				Changed = { v23.SlotValue.Infertile:GetPropertyChangedSignal("Value"), v23.SlotValue.Origin:GetPropertyChangedSignal("Value") },
				CheckActive = function() --[[ CheckActive | Line: 800 | Upvalues: v23 (copy) ]]
					if v23.SlotValue.Infertile.Value then
						return true
					end
					return v23.SlotValue.Origin.Value == "Developer"
				end,
				Click = function(p1, p2, p3) --[[ Click | Line: 807 | Upvalues: v25 (ref) ]]
					v25:CreateToolTip({
						Type = "StatusDescription",
						Offset = Vector2.new(0.9, 0.25),
						GuiObject = p1,
						Get = function() --[[ Get | Line: 812 ]]
							return {
								Name = "Infertile",
								Description = "This horse cannot be bred!",
								Image = "rbxassetid://16289464771"
							}
						end
					})
				end
			})
			v23:CreateActivity({
				Type = "Miniature",
				Image = "rbxassetid://95069162098492",
				SubText = "Passive",
				Text = string.upper("Miniature"),
				Changed = { v23.SlotValue.DownScaled:GetPropertyChangedSignal("Value") },
				CheckActive = function() --[[ CheckActive | Line: 831 | Upvalues: v23 (copy) ]]
					return v23.SlotValue.DownScaled.Value
				end,
				Click = function(p1, p2, p3) --[[ Click | Line: 834 | Upvalues: v25 (ref), v17 (ref) ]]
					v25:CreateToolTip({
						Type = "StatusDescription",
						Offset = Vector2.new(0.9, 0.25),
						GuiObject = p1,
						Get = function() --[[ Get | Line: 839 | Upvalues: v17 (ref) ]]
							return {
								Name = "Miniature",
								Image = "rbxassetid://95069162098492",
								Description = string.format("Reduces the size by %s!", (1 - v17.GetByName("MiniPotion").ScaleMultiplier) * 100) .. "%"
							}
						end
					})
				end
			})
			if v23.SlotValue:FindFirstChild("CannotAge") then
				v23:CreateActivity({
					Type = "Youth",
					Image = "rbxassetid://16190533260",
					SubText = "Passive",
					Text = string.upper("Youthful"),
					Changed = { v23.SlotValue.CannotAge:GetPropertyChangedSignal("Value") },
					CheckActive = function() --[[ CheckActive | Line: 859 | Upvalues: v23 (copy) ]]
						return v23.SlotValue.CannotAge.Value
					end,
					Click = function(p1, p2, p3) --[[ Click | Line: 862 | Upvalues: v25 (ref) ]]
						v25:CreateToolTip({
							Type = "StatusDescription",
							Offset = Vector2.new(0.9, 0.25),
							GuiObject = p1,
							Get = function() --[[ Get | Line: 867 ]]
								return {
									Name = "Youthful",
									Description = "This horse cannot age!",
									Image = "rbxassetid://16190533260"
								}
							end
						})
					end
				})
			end
			v23:CreateActivity({
				Type = "Buff",
				Image = "rbxassetid://136997448022805",
				SubText = "Passive",
				Text = string.upper("Elder"),
				Changed = { v23.SlotValue.Eldering.Completed:GetPropertyChangedSignal("Value") },
				CheckActive = function() --[[ CheckActive | Line: 887 | Upvalues: v23 (copy) ]]
					return v23.SlotValue.Eldering.Completed.Value
				end,
				Click = function(p1, p2, p3) --[[ Click | Line: 890 | Upvalues: v25 (ref) ]]
					v25:CreateToolTip({
						Type = "StatusDescription",
						Offset = Vector2.new(0.9, 0.25),
						GuiObject = p1,
						Get = function() --[[ Get | Line: 895 ]]
							return {
								Name = "Eldered",
								Description = "+25% Flying Stamina, +15% Speed & Stamina, + 25% Chance For Twins",
								Image = "rbxassetid://16830500276"
							}
						end
					})
				end
			})
			if v23.SlotValue:FindFirstChild("UpliftedWings") then
				v23:CreateActivity({
					Type = "UpliftedWings",
					Image = "rbxassetid://16830500276",
					SubText = "Animation",
					Text = string.upper("Uplifted"),
					Changed = { v23.SlotValue.UpliftedWings:GetPropertyChangedSignal("Value") },
					CheckActive = function() --[[ CheckActive | Line: 915 | Upvalues: v23 (copy) ]]
						return v23.SlotValue.UpliftedWings.Value
					end,
					Click = function(p1, p2, p3) --[[ Click | Line: 918 | Upvalues: v25 (ref) ]]
						v25:CreateToolTip({
							Type = "StatusDescription",
							Offset = Vector2.new(0.9, 0.25),
							GuiObject = p1,
							Get = function() --[[ Get | Line: 923 ]]
								return {
									Name = "UpliftedAnimation",
									Description = "This horse\'s wing idle animations are lifted up!",
									Image = "rbxassetid://16830500276"
								}
							end
						})
					end
				})
			end
			local function createActiveBoost(p1) --[[ createActiveBoost | Line: 935 | Upvalues: v23 (copy), v17 (ref), v5 (ref), v15 (ref), v25 (ref) ]]
				if v23.AllActivity[p1.Name] then
					return
				end
				local v1 = v17.GetByName(p1.Name)
				if v1 then
					v23:CreateActivity({
						RemoveWhenInactive = true,
						Type = p1.Name,
						Text = v5.GetDisplayName(v1.Name, v1):upper(),
						Image = v1.Image,
						Time = function() --[[ Time | Line: 945 | Upvalues: v15 (ref), p1 (copy) ]]
							return v15.FormatString(p1.Value - v15.Get())
						end,
						Changed = { p1:GetPropertyChangedSignal("Value"), p1:GetPropertyChangedSignal("Parent") },
						CheckActive = function() --[[ CheckActive | Line: 952 | Upvalues: p1 (copy), v15 (ref) ]]
							return p1.Parent and p1.Value - v15.Get() > 0
						end,
						Click = function(p1, p2, p3) --[[ Click | Line: 956 | Upvalues: v25 (ref), v1 (copy) ]]
							v25:CreateToolTip({
								Type = "StatusDescription",
								Offset = Vector2.new(0.9, 0.25),
								GuiObject = p1,
								Get = function() --[[ Get | Line: 961 | Upvalues: v1 (ref) ]]
									return v1, v1.ModifierStats
								end
							})
						end
					})
				end
			end
			v23.Maid:GiveTask(v23.SlotValue:WaitForChild("ActiveBoosts").ChildAdded:Connect(createActiveBoost))
			for k, v in pairs(v23.SlotValue.ActiveBoosts:GetChildren()) do
				createActiveBoost(v)
			end
			for k, v in pairs(v23.SlotValue:WaitForChild("Mutations"):GetChildren()) do
				v23:CreateActivity({
					Type = "MutationSlot" .. v.Name,
					Target = function(p1) --[[ Target | Line: 977 | Upvalues: v18 (ref), v (copy) ]]
						return v18.GetMutation(v.Value)
					end,
					Text = function(p1) --[[ Text | Line: 980 | Upvalues: v5 (ref) ]]
						return v5.GetDisplayName(p1.Name, p1):upper()
					end,
					Image = function(p1) --[[ Image | Line: 983 ]]
						return p1.Image
					end,
					SubText = function(p1) --[[ SubText | Line: 986 | Upvalues: v (copy) ]]
						if not p1.MaxLevel then
							return "Mutation"
						end
						return "Mutation " .. (if v.Level.Value >= p1.MaxLevel then "(MAX)" else "(Lvl " .. v.Level.Value .. ")")
					end,
					Changed = { v.Level:GetPropertyChangedSignal("Value"), v:GetPropertyChangedSignal("Value") },
					CheckActive = function() --[[ CheckActive | Line: 998 | Upvalues: v (copy), v18 (ref) ]]
						if v.Value == "Nothing" then
						else
							return v18.GetMutation(v.Value)
						end
					end,
					Click = function(p1, p2, p3) --[[ Click | Line: 1003 | Upvalues: v23 (copy), v8 (ref), v25 (ref) ]]
						if p2 == "Upgrade" and v23.Tabs.Mutations or v23.Tabs.Mutations and p3.MaxLevel then
							v8.OpenTab(v23.Tabs.Mutations)
							return
						end
						if p3.ModifierStats and next(p3.ModifierStats) then
							v25:CreateToolTip({
								Type = "StatusDescription",
								Offset = Vector2.new(0.9, 0.25),
								GuiObject = p1,
								Get = function() --[[ Get | Line: 1012 | Upvalues: p3 (copy) ]]
									return p3, p3.ModifierStats
								end
							})
							return
						end
						v25:CreateToolTip({
							Type = "ItemDescription",
							Offset = Vector2.new(0.9, 0.25),
							GuiObject = p1,
							Get = function() --[[ Get | Line: 1021 | Upvalues: p3 (copy) ]]
								return p3
							end
						})
					end
				})
			end
		end
	end
	v23.BreakdownFrame = v23.Tabs.Main and v23.Tabs.Main:FindFirstChild("Breakdown") or v23.Frame:FindFirstChild("Breakdown", true)
	v23.BreakdownExpandedFrame = v23.BreakdownFrame and v23.BreakdownFrame.Parent:FindFirstChild("BreakdownExpanded")
	if v23.BreakdownFrame then
		if v23.Disabled.Activity then
			v23.BreakdownFrame.Visible = false
			if v23.BreakdownExpandedFrame then
				v23.BreakdownExpandedFrame.Visible = true
				v23.BreakdownFrame = v23.BreakdownExpandedFrame
			end
		elseif v23.BreakdownExpandedFrame then
			v23.BreakdownExpandedFrame.Visible = false
		end
	end
	v23.BreakdownDropdownFrame = v23.BreakdownFrame and v23.BreakdownFrame:FindFirstChild("Dropdown")
	if v23.ActivityFrame then
		if v23.Disabled.Activity then
			v23.ActivityFrame.Visible = false
		elseif v23.BreakdownDropdownFrame then
			v23.ActivityFrame.Visible = not v23.BreakdownDropdownFrame.Visible
		else
			v23.ActivityFrame.Visible = true
		end
	end
	if v23.BreakdownFrame then
		if not v23.BreakdownFrame.Visible then
			print("breakdown not visible")
			if not (v23.BreakdownExpandedFrame and v23.BreakdownExpandedFrame.Visible) then
				print("no expand frame or not visible")
				if v23.BreakdownFrame == v23.BreakdownExpandedFrame then
					if not v23.ActivityFrame.Visible then
						print("activity not visible")
						v23.BreakdownFrame.Visible = true
					end
				else
					v23.BreakdownFrame.Visible = true
				end
			end
		end
		v23.TotalAttributes = 0
		v23.BreakdownScrollingFrame = v23.BreakdownFrame:FindFirstChildWhichIsA("ScrollingFrame")
		v23.TopBreakdownFrame = v23.BreakdownScrollingFrame and v23.BreakdownScrollingFrame:FindFirstChild("Title", true) or v23.BreakdownFrame.Content
		for k, v in pairs(v2.GetPriceChangeValues(v23.SlotValue)) do
			v23.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1093 | Upvalues: v23 (copy) ]]
				v23:SetTopBreakdownValue()
			end))
		end
		v23:SetTopBreakdownValue()
		v23:_createValueDropdown()
		for k, v in pairs(v2.GetPriceChangeValues(v23.SlotValue, "ByType")) do
			for k2, v19 in pairs(type(v) == "table" and v or { v }) do
				v23:CreateBreakdownAttribute({
					Type = k,
					DataValue = v19
				})
			end
		end
	end
	if v23.Tabs.Mutations then
		v23.AllMutations = {}
		v23.MutationsChangedSignal = v14.new()
		v23.Maid:GiveTask(v23.MutationsChangedSignal)
		v23.Maid:GiveTask(function() --[[ Line: 1118 | Upvalues: v23 (copy) ]]
			for k, v in pairs(v23.AllMutations) do
				v:Destroy()
			end
		end)
		v23.TotalMutationsLabel = v23.Tabs.Mutations:FindFirstChild("Total", true)
		if v23.TotalMutationsLabel then
			v23.Maid:GiveTask(v23.MutationsChangedSignal:Connect(function() --[[ Line: 1127 | Upvalues: v23 (copy) ]]
				pcall(function() --[[ Line: 1128 | Upvalues: v23 (ref) ]]
					v23:SetTotalMutations()
				end)
			end))
			v23:SetTotalMutations()
		end
		v23.AddSlotButtons = {}
		v23.AddSlotFrame = v23.Tabs.Mutations.Content.ScrollingFrame:FindFirstChild("AddSlotFrame", true)
		for k, v in pairs({ v23.Tabs.Mutations.Content:FindFirstChild("NoMutations"), v23.AddSlotFrame }) do
			local AddSlotButton = v:FindFirstChild("AddSlotButton", true)
			if AddSlotButton then
				v23.AddSlotButtons[AddSlotButton] = true
				v23.Maid:GiveTask(v10.new(AddSlotButton, {
					Rotate = false,
					Click = function() --[[ Click | Line: 1143 | Upvalues: v26 (ref), v23 (copy) ]]
						v26.GiveConsumable({
							Item = "MutationSlotPotion",
							Notify = true,
							PromptDoNotCheck = true,
							Slot = v23.SlotValue,
							Data = {}
						})
					end
				}))
			end
		end
		local function setAddSlotButtons() --[[ setAddSlotButtons | Line: 1156 | Upvalues: v23 (copy), v2 (ref) ]]
			if not v23.SlotValue:FindFirstChild("Mutations") then
				return
			end
			local v1 = #v23.SlotValue:WaitForChild("Mutations"):GetChildren() < v2.GetMaxMutationSlots(v23.SlotValue)
			for k, v in pairs(v23.AddSlotButtons) do
				k.Visible = v1
			end
			if not v23.AddSlotFrame then
				return
			end
			v23.AddSlotFrame.Visible = v1
		end
		v23.Maid:GiveTask(v23.SlotValue:WaitForChild("Mutations").ChildRemoved:Connect(function(p1) --[[ Line: 1167 | Upvalues: v23 (copy), setAddSlotButtons (copy) ]]
			v23:RemoveMutationSlot(p1)
			setAddSlotButtons()
		end))
		local t2 = {
			Error = "There was an error doing this action!",
			AlreadyEldered = "This horse is already Eldered!",
			AlreadyStarted = "A horse is already being eldered!",
			AlreadyCompleted = "This horse is already eldered!",
			NotStarted = "This horse hasnt started the elder process!",
			NotReadyToElder = "This horse needs more points to elder!"
		}
		local DefaultElder = v23.Tabs.Mutations:FindFirstChild("DefaultElder", true)
		if DefaultElder then
			v23.ElderingMaid = v1.new()
			v23.Maid:GiveTask(v23.ElderingMaid)
			local function setElderingFrame() --[[ setElderingFrame | Line: 1188 | Upvalues: v23 (copy), DefaultElder (copy), setAddSlotButtons (copy) ]]
				v23.ElderingMaid:DoCleaning()
				if v23.SlotValue.Age.Value >= 100 and not v23.SlotValue.Eldering.Completed.Value then
					DefaultElder.Visible = true
					if v23.SlotValue.Eldering.Started.Value then
						DefaultElder.Empty.Visible = false
						DefaultElder.Content.Visible = true
					else
						DefaultElder.Empty.Visible = true
						DefaultElder.Content.Visible = false
					end
				else
					DefaultElder.Visible = false
				end
				v23:SetNoMutationsLabel()
				setAddSlotButtons()
			end
			v23.Maid:GiveTask(v23.SlotValue:WaitForChild("Age"):GetPropertyChangedSignal("Value"):Connect(setElderingFrame))
			v23.Maid:GiveTask(v23.SlotValue:WaitForChild("Eldering"):WaitForChild("Completed"):GetPropertyChangedSignal("Value"):Connect(setElderingFrame))
			v23.Maid:GiveTask(v23.SlotValue:WaitForChild("Eldering"):WaitForChild("Started"):GetPropertyChangedSignal("Value"):Connect(setElderingFrame))
			setElderingFrame()
			v23.Maid:GiveTask(v10.new(DefaultElder.Empty.Content.Buttons.StartEldering, {
				Click = function() --[[ Click | Line: 1213 | Upvalues: v22 (ref), v23 (copy), v24 (ref), t2 (copy) ]]
					local v1, v2 = v22.GetRemoteFunction("ElderingEvent"):InvokeServer("StartEldering", v23.SlotValue.Name)
					if v1 or not v2 then
						return
					end
					v24.Notify({
						Message = t2[v2]
					})
				end
			}))
			v23.Maid:GiveTask(v10.new(DefaultElder.Content.Eldering.InfoButton, {
				Click = function() --[[ Click | Line: 1225 | Upvalues: v25 (ref), DefaultElder (copy) ]]
					v25:CreateToolTip({
						Type = "StatusDescription",
						GuiObject = DefaultElder.Content.Eldering.InfoButton,
						Get = function() --[[ Get | Line: 1229 ]]
							return {
								Name = "Eldering",
								Description = "Compete in races for 3 points, bond interactions for 1 point, and Boss Fights for 5 points.",
								Image = "rbxassetid://16830500276"
							}
						end
					})
				end
			}))
			v23.Maid:GiveTask(v10.new(DefaultElder.Content.Eldering.RemoveButton, {
				Click = function() --[[ Click | Line: 1242 | Upvalues: v20 (ref), v22 (ref), v23 (copy), v24 (ref), t2 (copy) ]]
					v20.Prompt({
						Type = "RemoveEldering",
						Setup = function(p1, p2) --[[ Setup | Line: 1246 ]] end,
						Run = function() --[[ Run | Line: 1248 | Upvalues: v22 (ref), v23 (ref), v24 (ref), t2 (ref) ]]
							local v1, v2 = v22.GetRemoteFunction("ElderingEvent"):InvokeServer("RemoveEldering", v23.SlotValue.Name)
							if v1 or not v2 then
								return true
							end
							v24.Notify({
								Message = t2[v2]
							})
							return true
						end,
						Close = function() --[[ Close | Line: 1259 ]]
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 1262 ]]
							return true
						end
					})
				end
			}))
			local function CheckPoints() --[[ CheckPoints | Line: 1269 | Upvalues: v23 (copy), v39 (ref), ElderingStats (ref), DefaultElder (copy) ]]
				if (if v39.IsTestGame() then 2 else ElderingStats.PointsNeeded) <= v23.SlotValue.Eldering.Points.Value then
					DefaultElder.Content.Eldering.ProgressBar.Visible = false
					DefaultElder.Content.Eldering.FinishEldering.Visible = true
				else
					DefaultElder.Content.Eldering.ProgressBar.Visible = true
					DefaultElder.Content.Eldering.FinishEldering.Visible = false
				end
			end
			v23.Maid:GiveTask(v23.SlotValue.Eldering.Points:GetPropertyChangedSignal("Value"):Connect(CheckPoints))
			CheckPoints()
			v23.Maid:GiveTask(v11.new({
				Clipped = true,
				Frame = DefaultElder.Content.Eldering.ProgressBar,
				AmountLabel = DefaultElder.Content.Eldering.ProgressLabel,
				Get = function() --[[ Get | Line: 1286 | Upvalues: v23 (copy) ]]
					return v23.SlotValue.Eldering.Points.Value
				end,
				GetMax = function() --[[ GetMax | Line: 1290 | Upvalues: ElderingStats (ref) ]]
					return ElderingStats.PointsNeeded
				end,
				Changed = { v23.SlotValue.Eldering.Points:GetPropertyChangedSignal("Value") }
			}))
			v23.Maid:GiveTask(v10.new(DefaultElder.Content.Eldering.FinishEldering, {
				Click = function() --[[ Click | Line: 1299 | Upvalues: v22 (ref), v23 (copy) ]]
					v22.GetRemoteFunction("ElderingEvent"):InvokeServer("ClaimEldering", v23.SlotValue.Name)
				end
			}))
		end
		v23.Maid:GiveTask(v23.SlotValue.Mutations.ChildAdded:Connect(function(p1) --[[ Line: 1305 | Upvalues: v23 (copy), setAddSlotButtons (copy) ]]
			v23:CreateMutationSlot(p1)
			setAddSlotButtons()
		end))
		for k, v in pairs(v23.SlotValue.Mutations:GetChildren()) do
			v23:CreateMutationSlot(v)
		end
		setAddSlotButtons()
		v23.Maid:GiveTask(v23.MutationsChangedSignal:Connect(function() --[[ Line: 1315 | Upvalues: v23 (copy) ]]
			v23:SetNoMutationsLabel()
		end))
		v23:SetNoMutationsLabel()
	end
	return v23
end
function t.Destroy(p1) --[[ Destroy | Line: 1324 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 1329 ]]
	return p1.Maid:GiveTask(...)
end
function t.SetPedigree(p1) --[[ SetPedigree | Line: 1333 | Upvalues: v2 (copy) ]]
	local v1, v22 = v2.GetPedigree(p1.SlotValue)
	if v22 then
		p1.PedigreeLabel.NumberLabel.Text = "#" .. v1
		p1.PedigreeLabel.NumberLabel.Visible = not v22.HideNumber
		p1.PedigreeLabel.UIGradient.Color = v22.UIGradient.Color
		p1.PedigreeLabel.NumberLabel.UIStroke.Color = v22.StrokeColor
		p1.PedigreeLabel.Visible = true
	else
		p1.PedigreeLabel.Visible = false
	end
end
function t.SetTotalMutations(p1) --[[ SetTotalMutations | Line: 1346 | Upvalues: v2 (copy) ]]
	local v1, v22 = v2.GetTotalMutations(p1.SlotValue)
	if v22 == 0 then
		p1.TotalMutationsLabel.Text = ""
	else
		p1.TotalMutationsLabel.Text = v1 .. "/" .. v22
	end
end
function t.SetNoMutationsLabel(p1) --[[ SetNoMutationsLabel | Line: 1355 ]]
	local ScrollingFrame = p1.Tabs.Mutations:FindFirstChild("ScrollingFrame", true)
	if not ScrollingFrame then
		return
	end
	if not p1.SlotValue:FindFirstChild("Age") then
		return
	end
	local v1 = if p1.SlotValue.Age.Value >= 100 then not p1.SlotValue.Eldering.Completed.Value else false
	ScrollingFrame.Visible = next(p1.AllMutations) or v1
	if not p1.Tabs.Mutations:FindFirstChild("NoMutations", true) then
		return
	end
	p1.Tabs.Mutations:FindFirstChild("NoMutations", true).Visible = not ScrollingFrame.Visible
end
function t.RemoveMutationSlot(p1, p2) --[[ RemoveMutationSlot | Line: 1372 ]]
	if p1.AllMutations[p2] then
		p1.AllMutations[p2]:Destroy()
		p1.AllMutations[p2] = nil
		p1.MutationsChangedSignal:Fire()
	end
end
local t7 = {
	[0.1] = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.new(1, 0.741176, 0.788235)),
		ColorSequenceKeypoint.new(0.212803, Color3.new(1, 0.905882, 0.682353)),
		ColorSequenceKeypoint.new(0.411765, Color3.new(0.803922, 0.968627, 0.682353)),
		ColorSequenceKeypoint.new(0.600346, Color3.new(0.635294, 0.894118, 1)),
		ColorSequenceKeypoint.new(0.794118, Color3.new(0.87451, 0.756863, 1)),
		ColorSequenceKeypoint.new(1, Color3.new(1, 0.741176, 0.788235))
	}),
	[0.5] = ColorSequence.new(Color3.fromRGB(255, 137, 168)),
	[1] = ColorSequence.new(Color3.fromRGB(224, 180, 255)),
	[2.5] = ColorSequence.new(Color3.fromRGB(162, 228, 255)),
	[10] = ColorSequence.new(Color3.fromRGB(255, 239, 119)),
	[25] = ColorSequence.new(Color3.fromRGB(205, 247, 174)),
	[100] = ColorSequence.new(Color3.fromRGB(255, 255, 255))
}
function t.CreateMutationSlot(p1, p2) --[[ CreateMutationSlot | Line: 1397 | Upvalues: v1 (copy), v10 (copy), v26 (copy), v29 (copy), v42 (copy), v21 (copy), v22 (copy), v18 (copy), v5 (copy), v20 (copy), t7 (copy), v12 (copy), v6 (copy), v31 (copy), v19 (copy) ]]
	local v13 = v1.new()
	local v2 = v1.new()
	v13:GiveTask(v2)
	local Default = p1.Tabs.Mutations:FindFirstChild("Default", true)
	Default.Visible = false
	local v3 = Default:Clone()
	local UpgradeButton = v3.Content:FindFirstChild("UpgradeButton", true)
	if UpgradeButton then
		v13:GiveTask(v10.new(UpgradeButton, {
			Click = function() --[[ Click | Line: 1410 | Upvalues: v26 (ref), p1 (copy), p2 (copy) ]]
				v26.GiveConsumable({
					Item = "WingUpgradePotion",
					PromptDoNotCheck = true,
					Notify = true,
					Slot = p1.SlotValue,
					Data = { p2.Name }
				})
			end
		}))
	end
	local RemoveButton = v3.Content:FindFirstChild("RemoveButton", true)
	if RemoveButton then
		v13:GiveTask(v10.new(RemoveButton, {
			Click = function() --[[ Click | Line: 1425 | Upvalues: v26 (ref), p1 (copy), p2 (copy) ]]
				v26.GiveConsumable({
					Item = "MutationDeletePotion",
					Notify = true,
					PromptDoNotCheck = true,
					Slot = p1.SlotValue,
					Data = { p2.Name }
				})
			end
		}))
	end
	for k, v in pairs({ v3.Empty, v3.Content }) do
		local RollButton = v:FindFirstChild("RollButton", true)
		if RollButton then
			v13:GiveTask(v10.new(RollButton, {
				Click = function() --[[ Click | Line: 1441 | Upvalues: v29 (ref), v42 (ref), p1 (copy), p2 (copy), v21 (ref), v22 (ref), v18 (ref), v5 (ref), v20 (ref), t7 (ref), v12 (ref), v6 (ref), v31 (ref), v10 (ref) ]]
					local v1 = nil
					local v2 = nil
					local v3 = 0
					local function checkActionDebounce() --[[ checkActionDebounce | Line: 1447 | Upvalues: v3 (ref) ]]
						if tick() - v3 <= 1 then
						else
							v3 = tick()
							return true
						end
					end
					local function rollMutation() --[[ rollMutation | Line: 1452 | Upvalues: v29 (ref), v42 (ref), p1 (ref), p2 (ref), v21 (ref), v3 (ref), v22 (ref), v2 (ref), v18 (ref), v1 (ref), v5 (ref) ]]
						local v12 = v29.CanRollMutation(v42, p1.SlotValue, p2.Name)
						if v12 ~= true then
							v21.NotifyIssue(v12)
							return
						end
						local v23
						if tick() - v3 <= 1 then
							v23 = nil
						else
							v3 = tick()
							v23 = true
						end
						if not v23 then
							return
						end
						local v32 = v22.GetRemoteFunction("RollMutationRemote"):InvokeServer(p1.SlotValue.Name, p2.Name)
						if not (v32 and v32.NewMutation) then
							return
						end
						v2 = v32
						local v4 = v18.GetMutation(v32.NewMutation)
						v1.Content.Rolled.CurrentRoll.Title.Text = v5.GetDisplayName(v4.Name, v4):upper()
						if not v4.Image then
							warn("No image found for", v4.Name)
						end
						v1.Content.Rolled.CurrentRoll.Viewport.Image = v4.Image or ""
						v1.Content.Rolled.CurrentRoll.Description.Text = v4.Description or "Error: No Description"
						v1.Content.BeforeRoll.Visible = false
						v1.Content.Rolled.KeepMutationButton.Visible = false
						v1.Content.Rolled.CloseButton.Visible = false
						v1.Content.Rolled.RollAgainButton.Visible = false
						task.delay(1, function() --[[ Line: 1478 | Upvalues: v1 (ref), v32 (copy) ]]
							v1.Content.Rolled.KeepMutationButton.Visible = v32.PreviousMutation
							if v1.Content.Rolled.KeepMutationButton.Visible then
								for k, v in pairs({ v1.Content.Rolled.CloseButton, v1.Content.Rolled.RollAgainButton }) do
									v.Position = UDim2.new(v.Position.X.Scale, 0, 0.75, 0)
								end
							else
								for k, v in pairs({ v1.Content.Rolled.CloseButton, v1.Content.Rolled.RollAgainButton }) do
									v.Position = UDim2.new(v.Position.X.Scale, 0, 0.95, 0)
								end
							end
							v1.Content.Rolled.CloseButton.Visible = true
							v1.Content.Rolled.RollAgainButton.Visible = true
						end)
						v1.Content.Rolled.Visible = true
					end
					local function keepOldMutation() --[[ keepOldMutation | Line: 1495 | Upvalues: v3 (ref), v29 (ref), v42 (ref), v21 (ref), v22 (ref), v20 (ref) ]]
						local v1
						if tick() - v3 <= 1 then
							v1 = nil
						else
							v3 = tick()
							v1 = true
						end
						if not v1 then
							return
						end
						local v2 = v29.CanKeepPreviousMutation(v42)
						if v2 == true then
							v22.GetRemoteFunction("KeepPreviousMutationRemote"):InvokeServer()
							v20.Close()
						else
							v21.NotifyIssue(v2)
						end
					end
					local function getGradientColor(p1) --[[ getGradientColor | Line: 1507 | Upvalues: t7 (ref) ]]
						local v1 = nil
						for k in pairs(t7) do
							if p1 <= k and (v1 == nil or k < v1) then
								v1 = k
							end
						end
						return t7[v1]
					end
					v20.Prompt({
						Type = "RollMutation",
						Setup = function(p12, p22) --[[ Setup | Line: 1522 | Upvalues: v1 (ref), v12 (ref), v42 (ref), v18 (ref), p2 (ref), p1 (ref), v5 (ref), v6 (ref), t7 (ref), v31 (ref), v10 (ref), keepOldMutation (copy), rollMutation (copy) ]]
							v1 = p12
							for k, v in pairs(v12.CreateCurrencyLabel({
								GuiObject = p12.Content.Coins.Content,
								Value = v42:GetCurrencyValue("Coins"),
								OnChanged = function(p1, p2) --[[ OnChanged | Line: 1527 ]] end
							})) do
								p22.Maid:GiveTask(v)
							end
							for k, v in pairs(v12.CreateCurrencyLabel({
								GuiObject = p12.Content.MutationPotion.Content,
								Value = v42:GetItemValue("MutationPotion"),
								OnChanged = function(p1, p2) --[[ OnChanged | Line: 1536 ]] end
							})) do
								p22.Maid:GiveTask(v)
							end
							local sum = 0
							local tbl = {}
							for k, v in pairs(v18.AllObtainableMutations) do
								if not (v.P <= 0) and (k ~= "Nothing" and (k ~= p2.Value and (v.Type ~= "Wings" or not v18.GetMutationOfType(p1.SlotValue, "Wings")))) and not v.ExcludeFromDrops then
									sum = sum + v.P
									tbl[k] = v
								end
							end
							for k, v in pairs(tbl) do
								local v13 = p12.Content.MutationChances.Content.Menu.Content.Default:Clone()
								p12.Content.MutationChances.Content.Menu.Content.Default.Visible = false
								local v2 = v.P / sum * 100
								v13.Name = k
								v13.Title.Text = v5.GetDisplayName(v.Name, v)
								v13.Viewport.Image = v.Image or ""
								v13.PercentageLabel.Text = v6.percentage(v2, 2) .. "%"
								v13.Visible = true
								local UIGradient = Instance.new("UIGradient", v13)
								local v3 = nil
								for k2 in pairs(t7) do
									if v2 <= k2 and (v3 == nil or k2 < v3) then
										v3 = k2
									end
								end
								local v4 = t7[v3]
								UIGradient.Color = v4
								v13.Title.TextColor3 = v31.DarkenColor(v4.Keypoints[1].Value, 0.5)
								v13.PercentageLabel.TextColor3 = v31.DarkenColor(v4.Keypoints[#v4.Keypoints].Value, 0.4)
								v13.LayoutOrder = v.P * 100
								v13.Parent = p12.Content.MutationChances.Content.Menu.Content
								p22.Maid:GiveTask(v13)
							end
							p22.Maid:GiveTask(v10.new(p12.Content.Rolled.KeepMutationButton, {
								Rotate = false,
								Click = keepOldMutation
							}))
							p22.Maid:GiveTask(v10.new(p12.Content.Rolled.RollAgainButton, {
								Rotate = false,
								Click = rollMutation
							}))
							p12.Content.BeforeRoll.Visible = true
							p12.Content.Rolled.Visible = false
						end,
						Run = rollMutation,
						Close = function() --[[ Close | Line: 1595 | Upvalues: v3 (ref), v2 (ref), v22 (ref), p1 (ref), p2 (ref) ]]
							local v1
							if tick() - v3 <= 1 then
								v1 = nil
							else
								v3 = tick()
								v1 = true
							end
							if not v1 then
								return
							end
							if not v2 then
								return true
							end
							v22.GetRemoteFunction("ClaimRolledMutationRemote"):InvokeServer(p1.SlotValue.Name, p2.Name)
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 1603 ]]
							return true
						end
					})
				end
			}))
		end
	end
	local function setMutation() --[[ setMutation | Line: 1612 | Upvalues: v2 (copy), v18 (ref), p2 (copy), v3 (copy), v5 (ref), v19 (ref), UpgradeButton (copy), p1 (copy) ]]
		v2:DoCleaning()
		local v1 = v18.GetMutation(p2.Value)
		if v1 and p2.Value ~= "Nothing" then
			v3.Empty.Visible = false
			v3.Content.Visible = true
			v3.Content.Content.Title.Text = v5.GetDisplayName(v1.Name, v1):upper()
			v3.Content.Content.Viewport.Image = v1.Image or v3.Content.Content.Viewport.Image
			local Description = v3.Content.Content:FindFirstChild("Description", true)
			local Stats = v3.Content:FindFirstChild("Stats", true)
			if v1.Stats and Stats then
				for k, v in pairs(v1.Stats) do
					local Default = Stats:FindFirstChild("Default", true)
					Default.Visible = false
					local v32 = Default:Clone()
					v32.Title.Text = v19.FormatStat(k, v):upper()
					local function setStat() --[[ setStat | Line: 1636 | Upvalues: v19 (ref), v (copy), p2 (ref), k (copy), v32 (copy) ]]
						local _, v2 = v19.FormatStat(k, (v19.GetValue(v, p2)))
						v32.Value.Text = v2
					end
					v2:GiveTask(p2.Level:GetPropertyChangedSignal("Value"):Connect(setStat))
					local v4 = v19.GetValue(v, p2)
					local _, v52 = v19.FormatStat(k, v4)
					v32.Value.Text = v52
					v32.Name = k
					v32.Visible = true
					v32.Parent = Default.Parent
					v2:GiveTask(v32)
				end
			end
			local Level = v3.Content.Content:FindFirstChild("Level", true)
			if v1.MaxLevel then
				local function setLevel() --[[ setLevel | Line: 1653 | Upvalues: Level (copy), p2 (ref), v1 (copy), UpgradeButton (ref), v19 (ref), Stats (copy), Description (copy) ]]
					Level.Text = if p2.Level.Value >= v1.MaxLevel then "MAX LVL" else "LEVEL " .. p2.Level.Value
					if UpgradeButton then
						UpgradeButton.Visible = p2.Level.Value < v1.MaxLevel
					end
					local v5 = v19.GetUnlockCondition(p2, v1.Type)
					if v5 then
						if Stats then
							Stats.Visible = false
						end
						if Description then
							Description.Text = v5.Description
							Description.Visible = true
						end
					else
						if Stats then
							Stats.Visible = true
						end
						if not Description then
							return
						end
						Description.Visible = false
					end
				end
				v2:GiveTask(p2.Level:GetPropertyChangedSignal("Value"):Connect(setLevel))
				setLevel()
				Level.Visible = true
			else
				if Description then
					Description.Text = v1.Description or ""
					Description.Visible = true
				end
				if Stats then
					Stats.Visible = false
				end
				Level.Visible = false
				if UpgradeButton then
					UpgradeButton.Visible = false
				end
			end
			local v7 = p2.Name
			v3.LayoutOrder = tonumber(v7)
		else
			v3.Empty.Visible = true
			v3.Content.Visible = false
			v3.LayoutOrder = tonumber(p2.Name) + 50
		end
		p1.MutationsChangedSignal:Fire()
	end
	v13:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setMutation))
	setMutation()
	v3.Name = p2.Name
	v3.Visible = true
	v3.Parent = Default.Parent
	v13:GiveTask(v3)
	p1.AllMutations[p2] = v13
	p1.MutationsChangedSignal:Fire()
end
function t.SetTotalTraits(p1) --[[ SetTotalTraits | Line: 1721 | Upvalues: v2 (copy) ]]
	p1.TotalTraitsLabel.Text = v2.GetTotalTraits(p1.SlotValue)
end
function t.SetFavorite(p1) --[[ SetFavorite | Line: 1725 ]]
	p1.FavoriteLabel.Image = if p1.SlotValue.Favorite.Value then "rbxassetid://16171174133" else "rbxassetid://16171173579"
	if p1.FavoriteLabel.Parent.Name == "Top" then
		return
	end
	p1.FavoriteLabel.Visible = p1.SlotValue.Favorite.Value
end
function t.SetSkillLevel(p1, p2, p3) --[[ SetSkillLevel | Line: 1732 | Upvalues: v6 (copy) ]]
	p2:FindFirstChild("ProgressBar", true).Level.Text = "Lv. " .. v6.suffix(p3.Value)
end
function t.SetTopBreakdownValue(p1) --[[ SetTopBreakdownValue | Line: 1736 | Upvalues: v6 (copy), v2 (copy) ]]
	p1.TopBreakdownFrame.Total.Text = "$" .. v6.splice(v2.GetPriceForSlot(p1.SlotValue))
end
function t._getTraitColorFromPart(p1, p2) --[[ _getTraitColorFromPart | Line: 1740 | Upvalues: v2 (copy) ]]
	if not p1.SpeciesModel then
		return
	end
	local v1 = v2.GetTraitFromSpecies(v2.GetByName(p1.SlotValue.Species.Value), p2.Name)
	if not v1 then
		warn("No trait can be found for", p1.SpeciesModel.Name, p2.Name)
		return
	end
	if not (v1.Models and next(v1.Models)) then
		warn("No trait models can be found for", p1.SpeciesModel.Name, p2.Name)
		return
	end
	local v22 = p1.SlotValue.Colors:FindFirstChild(v1.ColorRegion)
	if v22 then
		return v22
	end
end
function t.SetTotalActivity(p1) --[[ SetTotalActivity | Line: 1769 | Upvalues: v27 (copy) ]]
	local v1 = p1.ActivityContentFrame:FindFirstChild("List") or (p1.ActivityContentFrame:FindFirstChild("Content") or p1.ActivityContentFrame:FindFirstChild("ScrollingFrame"))
	v1.Visible = p1:HasActiveActivity()
	if p1.TotalActivityLabel then
		p1.TotalActivityLabel.Text = v27.Count(p1.ActiveActivity)
	end
	if not p1.ActivityContentFrame:FindFirstChild("NoActivity") then
		return
	end
	p1.ActivityContentFrame.NoActivity.Visible = not v1.Visible
end
function t.HasActiveActivity(p1) --[[ HasActiveActivity | Line: 1783 ]]
	return next(p1.ActiveActivity)
end
function t.CreateActivity(p1, p2) --[[ CreateActivity | Line: 1787 | Upvalues: v1 (copy), v9 (copy), v10 (copy), v15 (copy) ]]
	local v12 = v1.new()
	local v2 = v1.new()
	v2:GiveTask(v12)
	local v3 = nil
	local function v4() --[[ createOrDestroyActivity | Line: 1792 | Upvalues: p2 (copy), v3 (ref), p1 (copy), v12 (copy), v9 (ref), v10 (ref), v15 (ref), v4 (copy), v2 (copy) ]]
		if p2.CheckActive() then
			if v3 then
				return
			end
			local tbl = {}
			local v1 = nil
			p1.ActiveActivity[p2.Type] = true
			p1.ActivityChangedSignal:Fire()
			local Default = p1.ActivityContentFrame:FindFirstChild("Default", true)
			Default.Visible = false
			v3 = Default:Clone()
			v3.Visible = true
			v3.Parent = Default.Parent
			local function f2(p1) --[[ Line: 1806 | Upvalues: v1 (ref) ]]
				v1 = p1
			end
			table.insert(tbl, f2)
			local v32 = v3:FindFirstChild("Content") or v3
			if v32:IsA("ImageButton") and p2.Click then
				v32.AutoButtonColor = false
				v12:GiveTask(v9.new(v32, {
					HoverUpLabel = v32:FindFirstChild("Icon"),
					Click = function() --[[ Click | Line: 1815 | Upvalues: p2 (ref), v3 (ref), v1 (ref) ]]
						return p2.Click(v3, "Interact", v1)
					end
				}))
			end
			p1:_setupScrollingFrame(Default.Parent)
			for k, v in pairs({ v32:FindFirstChild("UpgradeButton"), v32:FindFirstChild("InfoButton") }) do
				v12:GiveTask(v10.new(v, {
					Click = function() --[[ Click | Line: 1824 | Upvalues: p2 (ref), v3 (ref), v1 (ref) ]]
						return p2.Click(v3, "ShowInfo", v1)
					end
				}))
			end
			table.insert(tbl, function(p1) --[[ Line: 1829 | Upvalues: v32 (copy) ]]
				for k, v in pairs({ v32:FindFirstChild("UpgradeButton"), v32:FindFirstChild("InfoButton") }) do
					if v.Name:find("Upgrade") then
						v.Visible = if p1 then p1.MaxLevel else p1
						continue
					end
					v.Visible = not p1 or not p1.MaxLevel
				end
			end)
			v12:GiveTask(v3)
			v12:GiveTask(function() --[[ Line: 1840 | Upvalues: v3 (ref), tbl (ref) ]]
				v3 = nil
				tbl = nil
			end)
			local function setTitleLabel(p1) --[[ setTitleLabel | Line: 1845 | Upvalues: v32 (copy), p2 (ref) ]]
				v32.Title.Text = type(p2.Text) == "function" and p2.Text(p1) or p2.Text
			end
			table.insert(tbl, setTitleLabel)
			if p2.Time then
				v12:GiveTask(v15.OnTimeChanged:Connect(v4))
			end
			local Label = v32:FindFirstChild("Label")
			if Label and p2.Time then
				local function setTimeLabel() --[[ setTimeLabel | Line: 1858 | Upvalues: p2 (ref), Label (copy), v3 (ref) ]]
					local v1 = p2.Time()
					if v1 then
						Label.Text = v1
						v3.LayoutOrder = -1
					end
				end
				v12:GiveTask(v15.OnTimeChanged:Connect(setTimeLabel))
				for k, v in pairs(p2.Changed) do
					v12:GiveTask(v:Connect(setTimeLabel))
				end
				local v42 = p2.Time()
				if v42 then
					Label.Text = v42
					v3.LayoutOrder = -1
				end
			elseif Label and p2.SubText then
				local function setSubTextLabel(p1) --[[ setSubTextLabel | Line: 1870 | Upvalues: Label (copy), p2 (ref) ]]
					Label.Text = type(p2.SubText) == "function" and p2.SubText(p1) or p2.SubText
				end
				table.insert(tbl, setSubTextLabel)
			end
			local function setIconLabel(p1) --[[ setIconLabel | Line: 1878 | Upvalues: v32 (copy), p2 (ref) ]]
				local Icon = v32:FindFirstChild("Icon")
				if not (Icon and p2.Image) then
					return
				end
				Icon.Image = type(p2.Image) == "function" and p2.Image(p1) or p2.Image
			end
			local v5 = tbl
			table.insert(v5, setIconLabel)
			if p2.Target then
				for k, v in pairs(p2.Changed) do
					v12:GiveTask(v:Connect(function() --[[ Line: 1889 | Upvalues: tbl (ref), p2 (ref) ]]
						if not tbl then
							return
						end
						for k, v in pairs(tbl) do
							if p2.Target() then
								local v1 = p2.Target()
								v(if v1 == true then false else v1)
							end
						end
					end))
				end
			end
			local v6 = p2.Target and p2.Target()
			for k, v in pairs(tbl) do
				v(if v6 == true then false else v6)
			end
			return
		end
		v12:DoCleaning()
		p1.ActiveActivity[p2.Type] = nil
		if p2.RemoveWhenInactive then
			v2:DoCleaning()
			p1.AllActivity[p2.Type] = nil
		end
		p1.ActivityChangedSignal:Fire()
	end
	for k, v in pairs(p2.Changed) do
		v2:GiveTask(v:Connect(v4))
	end
	v4()
	p1.AllActivity[p2.Type] = v2
end
function t.CreateTrait(p1, p2) --[[ CreateTrait | Line: 1922 | Upvalues: v1 (copy), v5 (copy), v42 (copy), v35 (copy), v10 (copy), v25 (copy), v31 (copy), v40 (copy) ]]
	local v12 = nil
	local v2 = v1.new()
	p1.Maid:GiveTask(v2)
	local function getTrait() --[[ getTrait | Line: 1927 | Upvalues: p2 (copy) ]]
		if not p2.Value:IsA("BoolValue") then
			return p2.Get(p2.Value)
		end
		if not p2.Value.Value then
			return
		end
		if p2.Get then
			return p2.Get(p2.Value)
		else
			return p2.Trait
		end
	end
	local function createOrDestroyTrait() --[[ createOrDestroyTrait | Line: 1941 | Upvalues: p2 (copy), v2 (copy), v12 (ref), p1 (copy), v5 (ref), v42 (ref), v35 (ref), v10 (ref), v25 (ref), v1 (ref), v31 (ref), v40 (ref) ]]
		local v13 = if p2.Value:IsA("BoolValue") then if p2.Value.Value then if p2.Get then p2.Get(p2.Value) else p2.Trait else nil else p2.Get(p2.Value)
		if v13 and v13.Name ~= "Nothing" then
			v2:DoCleaning()
			if not v12 then
				local Default = p1.TraitsFrame:FindFirstChild("Default", true)
				Default.Visible = false
				v12 = Default:Clone()
				v12.Visible = true
				v12.Parent = Default.Parent
				p1:_setupScrollingFrame(Default.Parent)
			end
			local Title = v12.Title
			Title.Text = string.format(p2.DisplayText or "%s", p2.Text or v5.GetDisplayName(v13.Name, v13)):upper()
			local v4 = p2 and (p2.Trait and p2.Trait.Strength or p2.Get and (if v13 then v13.Strength else v13))
			if v12:FindFirstChild("InfoButton") and not v4 then
				warn(p2)
				v12:FindFirstChild("InfoButton").Visible = false
			end
			if v12:FindFirstChild("InfoButton") and v4 then
				local v52 = v42:GetWithModifiers({
					Name = "TraitInheritanceMultiplier",
					Default = 1,
					Slot = p1.SlotValue
				})
				local v6 = v42:GetWithModifiers({
					Name = "Bond",
					Default = 1,
					Slot = p1.SlotValue
				})
				local v7 = v35.map(p1.SlotValue.Upgrades.Bond.Value, 0, 1, 1, 1.25, true) * v6
				local v8 = p2.Trait and p2.Trait.Strength or v13.Strength
				local v9 = v8 * v52 * v7
				local v102 = v9 - v8
				local v11 = "Inherit Chance " .. v9 .. "%"
				if v102 ~= 0 then
					v11 = v11 .. " (+" .. v102 .. "%)"
				end
				v2:GiveTask(v10.new(v12:FindFirstChild("InfoButton"), {
					Click = function() --[[ Click | Line: 1996 | Upvalues: v25 (ref), v12 (ref), v13 (copy), v11 (ref) ]]
						v25:CreateToolTip({
							Type = "StatusDescription",
							GuiObject = v12:FindFirstChild("InfoButton"),
							Offset = Vector2.new(0.9, 0.25),
							Get = function() --[[ Get | Line: 2001 | Upvalues: v13 (ref), v11 (ref) ]]
								return {
									Image = "rbxassetid://16830500650",
									Name = v13.Name,
									Description = v11
								}
							end
						})
					end
				}))
			end
			local Discovered = v12:FindFirstChild("Discovered", true)
			if Discovered then
				Discovered.Visible = false
			end
			if v13.Type == "Eyes" then
				v12.EyeBottom.Visible = true
				for k, v in pairs({ "EyeTop", "EyeBottom" }) do
					v12:FindFirstChild(v, true).BackgroundColor3 = v13[v] or v12:FindFirstChild(v, true).BackgroundColor3
				end
				v12.Icon.Visible = false
			else
				local v14 = v1.new()
				v2:GiveTask(v14)
				local function setTraitPart() --[[ setTraitPart | Line: 2033 | Upvalues: v14 (copy), p1 (ref), v13 (copy), v31 (ref), v12 (ref) ]]
					v14:DoCleaning()
					local v1 = p1:_getTraitColorFromPart(v13)
					if not v1 then
						return
					end
					local function setColor() --[[ setColor | Line: 2040 | Upvalues: v31 (ref), v1 (copy), v12 (ref) ]]
						local v13 = v31.GetColor(v1.Value)
						if not v13 then
							return
						end
						v12.Icon.ImageColor3 = v13.ColorRGB
					end
					v14:GiveTask(v1:GetPropertyChangedSignal("Value"):Connect(setColor))
					local v2 = v31.GetColor(v1.Value)
					if not v2 then
						return
					end
					v12.Icon.ImageColor3 = v2.ColorRGB
				end
				if p2.IgnoreColor then
					v12.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
				else
					v2:GiveTask(p1.ViewportChangedSignal:Connect(setTraitPart))
					setTraitPart()
				end
				if Discovered and v42:_getCategoryFromItem(v13.Name) then
					local function setDiscovered() --[[ setDiscovered | Line: 2060 | Upvalues: Discovered (copy), v42 (ref), v13 (copy) ]]
						Discovered.Visible = v42:HasNotViewedDiscovery(v13.Name)
					end
					v2:GiveTask(v42:GetDiscoveryStateChangedSignal(v13.Name):Connect(setDiscovered))
					Discovered.Visible = v42:HasNotViewedDiscovery(v13.Name)
				end
				v12.EyeBottom.Visible = false
				local Icon = v12.Icon
				local Image = p2.Image
				if not Image then
					Image = v40.TraitImages[v13.Type or p2.Type]
				end
				Icon.Image = Image
				v12.Icon.Visible = true
			end
		else
			v2:DoCleaning()
			if not v12 then
				return
			end
			v12:Destroy()
			v12 = nil
		end
	end
	p1.Maid:GiveTask(function() --[[ Line: 2079 | Upvalues: v12 (ref) ]]
		if not v12 then
			return
		end
		v12:Destroy()
		v12 = nil
	end)
	p1.Maid:GiveTask(p2.Value:GetPropertyChangedSignal("Value"):Connect(createOrDestroyTrait))
	createOrDestroyTrait()
end
function t.CreateBreakdownAttribute(p1, p2) --[[ CreateBreakdownAttribute | Line: 2089 | Upvalues: v2 (copy), v6 (copy) ]]
	local Default = (p1.BreakdownFrame:FindFirstChild("Dropdown") or p1.BreakdownFrame):FindFirstChild("Default", true)
	local v22 = Default:Clone()
	Default.Visible = false
	local v3 = v22:FindFirstChild("Content") or v22
	v3.Title.Text = v2.FormatPriceAttribute(p2.DataValue.Name, p2.Type, p2.DataValue)
	local function setValue() --[[ setValue | Line: 2099 | Upvalues: v2 (ref), p2 (copy), p1 (copy), v3 (copy), v6 (ref), v22 (copy) ]]
		local v1 = v2.GetPriceForAttribute(p2.Type, p1.SlotValue, p2.DataValue.Name)
		if p2.ValueFormat then
			v3.Price.Text = p2.ValueFormat(v1)
		else
			v3.Price.Text = "+$" .. v6.suffix(v1)
		end
		v22.Visible = v1 ~= 0
		v22.LayoutOrder = p2.LayoutOrder or -v1
	end
	p1.Maid:GiveTask(p2.DataValue:GetPropertyChangedSignal("Value"):Connect(setValue))
	setValue()
	v3.BackgroundTransparency = p2.BackgroundTransparency or v3.BackgroundTransparency
	v3.Price.TextColor3 = p2.TextColor or v3.Price.TextColor3
	v3.Title.TextColor3 = p2.TextColor or v3.Title.TextColor3
	v3.BackgroundColor3 = p2.BackgroundColor or v3.BackgroundColor3
	v22.Name = p2.Type
	v22.Parent = Default.Parent
	p1.Maid:GiveTask(v22)
	p1:_setupScrollingFrame(Default.Parent)
	p1.TotalAttributes = p1.TotalAttributes + 1
end
function t.CreateBodyColor(p1, p2) --[[ CreateBodyColor | Line: 2129 | Upvalues: v7 (copy), t2 (copy), v31 (copy) ]]
	if p2.Name ~= "Eye" then
		local Default = p1.ColorsFrame:FindFirstChild("Default", true)
		local v1 = Default:Clone()
		Default.Visible = false
		v1.Title.Text = v7.separateWordsInString(p2.Name):upper()
		v1.LayoutOrder = t2[p2.Name] or 100
		local function setColor() --[[ setColor | Line: 2139 | Upvalues: v31 (ref), p2 (copy), v1 (copy) ]]
			local v12 = v31.GetColor(p2.Value)
			v1.Color.BackgroundColor3 = v12.ColorRGB
			v1.Label.Text = v12.Name:upper()
		end
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setColor))
		local v2 = v31.GetColor(p2.Value)
		v1.Color.BackgroundColor3 = v2.ColorRGB
		v1.Label.Text = v2.Name:upper()
		v1.Visible = true
		v1.Parent = Default.Parent
		p1.Maid:GiveTask(v1)
		p1:_setupScrollingFrame(Default.Parent)
	end
end
function t.SetProfileLabel(p1, p2, p3) --[[ SetProfileLabel | Line: 2154 ]]
	local v1, v2 = p3()
	if p2:IsA("TextLabel") then
		p2.Text = v1
	else
		p2.Label.Text = v1
	end
	if not (p2:FindFirstChild("Icon") and v2) then
		return
	end
	if p2.Icon:IsA("ImageLabel") then
		p2.Icon.Image = v2
		return
	end
	p2.Icon.Text = v2
end
function t.SetSpecies(p1, ...) --[[ SetSpecies | Line: 2172 | Upvalues: v2 (copy) ]]
	p1.SpeciesData = v2.GetByName(p1.SlotValue.Species.Value)
	p1:SetViewport(...)
end
function t._createViewport(p1) --[[ _createViewport | Line: 2177 | Upvalues: v23 (copy), v3 (copy), v4 (copy), Sonar (copy), v42 (copy), v37 (copy) ]]
	if not p1.ViewportFrame then
		return
	end
	p1.ViewportMaid:DoCleaning()
	p1.SpeciesModel = p1.SpeciesData.Model
	local v1, v2 = v23.CreateAnimalModel({
		SlotValue = p1.SlotValue,
		ForceAdult = p1.ForceAdult
	})
	v1.Parent = p1.ViewportFrame
	p1.ViewportMaid:GiveTask(v2)
	p1.ViewportMaid:GiveTask(v1)
	local Camera = Instance.new("Camera")
	Camera.Parent = p1.ViewportFrame
	p1.ViewportFrame.CurrentCamera = Camera
	p1.ViewportMaid:GiveTask(Camera)
	if p1.HeadViewport then
		Camera.FieldOfView = 1
		local Model = Instance.new("Model")
		local Part = Instance.new("Part", Model)
		Part.CFrame = v1:FindFirstChild("Head", true).WorldCFrame - Vector3.new(0, 1.35, 0)
		Part.Size = Vector3.new(4.5, 0, 4.5)
		Camera.CFrame = v3(Model, p1.ViewportFrame, 130, -8)
		Model:Destroy()
	else
		Camera.FieldOfView = 1
		Camera.CFrame = v3(v1, p1.ViewportFrame, -130, -8)
	end
	local Eyelid = v1:FindFirstChild("Eyelid")
	if Eyelid then
		Eyelid:Destroy()
	end
	p1.ViewportFrame.Ambient = Color3.fromRGB(192, 192, 192)
	p1.ViewportFrame.LightDirection = Camera.CFrame.LookVector
	local t = {
		InViewport = true,
		SlotValue = p1.SlotValue,
		DisableAccessories = p1.DisableAccessories
	}
	t.IsYoung = Sonar("AnimalDataService").IsFoal(p1.SlotValue) and (if p1.ForceAdult == true then false else true)
	p1.ViewportMaid:GiveTask(v4.new(v1, t))
	if p1.DoAnimatedIntro then
		if v42.PlayerData.Settings.States.ScreenFlashes.Value then
			v37.Emit(100)
		end
		p1:_addSpinningEntranceAnimation(v1)
	end
	p1.ViewportMaid:GiveTask(p1.SlotValue.Age:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2240 | Upvalues: p1 (copy) ]]
		if p1.SlotValue.Age.Value ~= 0 and not (p1.SlotValue.Age.Value > 44) then
			return
		end
		p1:_createViewport()
	end))
	p1.ViewportChangedSignal:Fire()
end
function t._addSpinningEntranceAnimation(p1, p2) --[[ _addSpinningEntranceAnimation | Line: 2249 | Upvalues: v36 (copy) ]]
	local v1 = p2:GetPivot()
	p2:ScaleTo(0.1)
	p2:PivotTo(v1 * CFrame.Angles(0, 3.3161255787892263, 0))
	v36.target(p2, 0.4, 2.5, {
		Scale = 1
	})
	v36.target(p2, 0.8, 1.3, {
		Pivot = v1
	})
end
function t.SetViewport(p1, p2) --[[ SetViewport | Line: 2264 ]]
	if p1.LastViewportChange and tick() - p1.LastViewportChange < 0.1 then
		return
	end
	p1.LastViewportChange = tick()
	if p2 then
		p1:_createViewport()
	else
		task.delay(0.1, function() --[[ Line: 2271 | Upvalues: p1 (copy) ]]
			p1:_createViewport()
		end)
	end
end
function t.SetName(p1) --[[ SetName | Line: 2279 | Upvalues: v2 (copy), v5 (copy) ]]
	if p1.SpeciesAsName then
		local v1 = v2.GetByName(p1.SlotValue.Species.Value)
		p1.NameLabel.Text = v5.GetDisplayName(v1.Name, v1)
	else
		p1.NameLabel.Text = v2.GetCustomName(p1.SlotValue)
	end
end
return t