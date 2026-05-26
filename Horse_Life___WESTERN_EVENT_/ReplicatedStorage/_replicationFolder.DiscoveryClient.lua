-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsStudio()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("StatBar")
local v3 = Sonar("DiscoveryService")
local v4 = Sonar("Button")
local v5 = Sonar("Maid")
local v6 = Sonar("ButtonTest")
local v7 = Sonar("DisplayUtils")
local v8 = Sonar("AnimalDataService")
local v9 = Sonar("MutationUtils")
local v10 = Sonar("ViewportModel")
local v11 = Sonar("AnimalCosmetics")
local v12 = Sonar("RemoteUtils")
local v13 = Sonar("GuiUtils")
local v14 = Sonar("TabManager")
local v15 = Sonar("GuiManager")
local v16 = Sonar("ToolTipClient")
local v17 = Sonar("DisplayAnimalClient")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v18 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("JournalGui").ContainerFrame
local Index = ContainerFrame.Menu.TabFrames.Index
local Selected = Index.Content.Selected
local t2 = {
	Wings = "rbxassetid://16830500276",
	Glow = "rbxassetid://17275055613",
	Mutation = "rbxassetid://16830500650"
}
function t._createSpeciesViewport(p1, p2, p3) --[[ _createSpeciesViewport | Line: 46 | Upvalues: v5 (copy), v8 (copy), v18 (copy), Sonar (copy), v10 (copy), v11 (copy) ]]
	local v1 = v5.new()
	local v2 = v8.CreateSlot(v18, {
		Origin = "Wild",
		DoNotParent = true,
		DoNotIncrementCount = true,
		Age = 66,
		Gender = "Female",
		NoMutations = true,
		Species = p3.Name,
		Preset = p3.DiscoveryPreset or "Brown",
		Seed = v18.Player.UserId + math.random(1, 100)
	})
	for v3, v4 in { p2, p2:FindFirstChild("Viewport") } do
		local v52, v6 = Sonar("AnimalRiggerService").CreateAnimalModel({
			SlotValue = v2
		})
		v52.Parent = v4
		v1:GiveTask(v52)
		local Camera = Instance.new("Camera")
		Camera.Parent = v4
		v4.CurrentCamera = Camera
		v1:GiveTask(Camera)
		Camera.FieldOfView = 40
		Camera.CFrame = v10(v52, v4, -130, -20) * CFrame.new(-2, 0, -2)
		local Eyelid = v52:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		v4.Ambient = Color3.fromRGB(192, 192, 192)
		v4.LightDirection = Camera.CFrame.LookVector
		v1:GiveTask(v11.new(v52, {
			InViewport = true,
			SlotValue = v2
		}))
		v1:GiveTask(v6)
	end
	return v1
end
local v19 = Sonar("Constants")
local t3 = {
	Species = {
		Display = true,
		Image = "rbxassetid://16190542177",
		CreateSubTab = true,
		NextCategories = function() --[[ NextCategories | Line: 106 | Upvalues: v3 (copy), v8 (copy), t (copy) ]]
			local t2 = {}
			for v1, v2 in v3.GetCategoryByName("Species") do
				local v32 = v3.GetCategoryByName(v1)
				if v32 then
					local v4 = v8.GetByName(v1)
					local t3 = {}
					for v5, v6 in v32 do
						if type(v6) == "table" then
							t3[v1 .. "-" .. v5] = {
								Display = false
							}
						end
					end
					t2[v1] = {
						Display = true,
						LayoutOrder = v4.Index,
						Categories = t3,
						Viewport = function(p1) --[[ Viewport | Line: 127 | Upvalues: t (ref), v4 (copy) ]]
							return t:_createSpeciesViewport(p1, v4)
						end
					}
				end
			end
			return t2
		end
	},
	Mutations = {
		Display = true,
		Image = "rbxassetid://16830500650",
		CreateSubTab = true,
		NextCategories = function() --[[ NextCategories | Line: 154 | Upvalues: t2 (copy) ]]
			local t = {}
			for v1, v2 in { "Wings", "Glow", "Mutation" } do
				t[v2] = {
					Display = true,
					LayoutOrder = v1,
					Categories = {
						Mutations = {
							Display = false
						}
					},
					Image = t2[v2],
					Id = v2
				}
			end
			return t
		end
	},
	Eyes = {
		Display = true,
		Image = "rbxassetid://133007558735816",
		CreateSubTab = false
	}
}
local v20 = v5.new()
local v21 = nil
local t4 = {}
function t._getObjectDataFromName(p1, p2) --[[ _getObjectDataFromName | Line: 185 | Upvalues: v8 (copy), v9 (copy) ]]
	return v8.GetTrait(p2) or v9.GetMutation(p2)
end
function t._postCachedViewedItems(p1) --[[ _postCachedViewedItems | Line: 189 | Upvalues: v12 (copy), t4 (ref) ]]
	v12.GetRemoteEvent("ViewedDiscoveryItemsRemote"):FireServer(t4)
	t4 = {}
end
function t._cacheViewedItems(p1, p2, p3) --[[ _cacheViewedItems | Line: 194 | Upvalues: t4 (ref), v18 (copy) ]]
	for v1, v2 in p2 do
		if table.find(t4, v2) then
			p2[v1] = nil
			continue
		end
		table.insert(t4, v2)
	end
	if next(p2) then
		v18:UpdatedViewedDiscovery({
			Viewed = true,
			Objects = p2
		})
	end
	if not (p3 and next(t4)) then
		return
	end
	p1:_postCachedViewedItems()
end
function t._postItemsFromCategory(p1, p2) --[[ _postItemsFromCategory | Line: 215 | Upvalues: v18 (copy), v9 (copy), v3 (copy) ]]
	local t = {}
	if p2 and p2 ~= p1.CategoryDisplay then
		if p2.Categories then
			for v1, v2 in p2.Categories do
				local v32 = v18:GetDiscoveryCategory(v1)
				if v32 then
					for v4, v5 in v32.AllObjects do
						if v1 == "Mutations" and p2.Id then
							local v6 = v9.GetMutation(v4)
							if (not v6 or v6.Type == p2.Id) and (v18:HasNotViewedDiscovery(v4) or v3:IsItemNewAndNotViewed(v18, v4)) then
								table.insert(t, v4)
							end
						elseif v18:HasNotViewedDiscovery(v4) or v3:IsItemNewAndNotViewed(v18, v4) then
							table.insert(t, v4)
						end
					end
				end
			end
		end
		if p2.AllObjects then
			for v7, v8 in p2.AllObjects do
				if (v18:HasNotViewedDiscovery(v7) or v3:IsItemNewAndNotViewed(v18, v7)) and not table.find(t, v7) then
					table.insert(t, v7)
				end
			end
		end
	end
	p1:_cacheViewedItems(t, true)
end
function t._selectCategory(p1, p2) --[[ _selectCategory | Line: 266 | Upvalues: v20 (copy), v21 (ref), Index (copy), v18 (copy), v3 (copy), v8 (copy), v7 (copy), Selected (copy), v6 (copy), v16 (copy), Sonar (copy), v10 (copy), v11 (copy), v1 (copy), v12 (copy), v17 (copy), v9 (copy), v4 (copy), v19 (copy), v2 (copy) ]]
	v20:DoCleaning()
	v21 = p2
	local v13
	if p2.Frame then
		local function v22(p1) --[[ recurse | Line: 271 | Upvalues: p2 (copy), v22 (copy) ]]
			if p1.Frame then
				p1.Frame.Visible = p1.Frame == p2.Frame
			end
			if not p1.Categories then
				return
			end
			for v1, v2 in p1.Categories do
				v22(v2)
			end
		end
		local CategoryDisplay = p1.CategoryDisplay
		if CategoryDisplay.Frame then
			CategoryDisplay.Frame.Visible = CategoryDisplay.Frame == p2.Frame
		end
		if CategoryDisplay.Categories then
			for v32, v42 in CategoryDisplay.Categories do
				v22(v42)
			end
		end
		Index.Content.Selected.Visible = false
		Index.Content.Categories.Visible = true
		Index.Title.Text = "Discovery Index"
		local t = {}
		if p2.AllObjects then
			for v5, v62 in p2.AllObjects do
				if v18:HasNotViewedDiscovery(v5) or v3:IsItemNewAndNotViewed(v18, v5) then
					table.insert(t, v5)
				end
			end
		end
		p1:_cacheViewedItems(t, true)
	else
		Index.Content.Selected.Visible = true
		Index.Content.Categories.Visible = false
		if p2.ParentCategory and p2.ParentCategory.Id == "Species" then
			local v72 = v8.GetByName(p2.Id)
			Index.Title.Text = "Discovery Index | " .. (v8.GetByName(p2.Id) and v7.GetDisplayName(v72.Name, v72) or p2.Id)
		else
			Index.Title.Text = "Discovery Index"
		end
		local v92 = nil
		local t = {}
		local t2 = {}
		local v102 = false
		local t3 = {
			Patterns = "Pattern",
			Paints = "Paint",
			Cosmetics = "Cosmetic"
		}
		local function getTraitMax(p1) --[[ getTraitMax | Line: 317 | Upvalues: v8 (ref), p2 (copy), t3 (copy) ]]
			local v1 = v8.GetByName(p2.Id)
			if v1 and (v1.MaxTraits and t3[p1]) then
				return v1.MaxTraits[t3[p1]]
			else
				return nil
			end
		end
		local function countActiveTraits(p1) --[[ countActiveTraits | Line: 325 | Upvalues: v92 (ref) ]]
			if not v92 then
				return 0
			end
			local v1 = v92:FindFirstChild(p1)
			if not v1 then
				return 0
			end
			local count = 0
			for v2, v3 in v1:GetChildren() do
				if v3.Value == true then
					count = count + 1
				end
			end
			return count
		end
		local t4 = {
			Tails = "Tail",
			Manes = "Mane",
			Horns = "Horn",
			Ears = "Ear",
			Whiskers = "Whisker",
			Sticker = "Sticker"
		}
		local function isTraitSelected(p1, p2) --[[ isTraitSelected | Line: 347 | Upvalues: v92 (ref), t4 (copy) ]]
			if not v92 then
				return false
			end
			local v1 = t4[p1]
			if v1 then
				local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
				if not MiscCosmetics then
					return false
				end
				local v2 = MiscCosmetics:FindFirstChild(v1)
				if not v2 then
					return false
				end
				return v2.Value == p2
			else
				local v3 = v92:FindFirstChild(p1)
				if not v3 then
					return false
				end
				local v4 = v3:FindFirstChild(p2)
				if not v4 then
					return false
				end
				return v4.Value == true
			end
		end
		local count, v112, v122, v132, v14, v15, v162, v172, v182, v192, v202, v212, v22, v23, v24
		if p2.ParentCategory and p2.ParentCategory.Id == "Species" then
			local v25 = v8.GetByName(p2.Id)
			if v25 then
				local v26, v27, v28
				if v25.ToyHorse then
					v26 = "Not Breedable"
					v27 = "This species cannot be bred."
					v28 = "Not Breedable"
				else
					local v31 = v8.GetSeasonBreedWait(p2.Id)
					v28 = "Season: " .. (v25.InSeasonStart or "January") .. " - " .. (v25.InSeasonEnd or "December")
					if v31 and v31 > 0 then
						v28 = v28 .. " | Breedwait: " .. math.floor(v31 / 3600) .. " hrs"
					end
					v26 = "Breeding Season"
					v27 = "Breedwait is lowest during the season and increases the further you are from it."
				end
				Selected.SeasonFrame.HelpButton.Visible = true
				Selected.SeasonFrame.NotSelected.Visible = true
				Selected.SeasonFrame.NotSelected.Text = v28
				v20:GiveTask(v6.new(Selected.SeasonFrame.HelpButton, {
					Click = function() --[[ Click | Line: 403 | Upvalues: v16 (ref), Selected (ref), v26 (ref), v27 (ref) ]]
						v16:CreateToolTip({
							Type = "StatusDescription",
							Offset = Vector2.new(1, 0.5),
							GuiObject = Selected.SeasonFrame.HelpButton,
							Get = function() --[[ Get | Line: 408 | Upvalues: v26 (ref), v27 (ref) ]]
								return {
									Name = v26,
									Description = v27
								}
							end
						})
					end
				}))
				v92 = v8.CreateSlot(v18, {
					Origin = "Wild",
					DoNotParent = true,
					DoNotIncrementCount = true,
					Age = 66,
					Gender = "Female",
					NoMutations = true,
					NoPatterns = true,
					Species = v25.Name,
					Preset = v25.DiscoveryPreset or "Brown",
					Seed = v18.Player.UserId
				})
				for v32, v33 in { Selected.Viewport, Selected.Viewport:FindFirstChild("Viewport") } do
					if v33 then
						local v34, v35 = Sonar("AnimalRiggerService").CreateAnimalModel({
							SlotValue = v92
						})
						v34.Parent = v33
						v20:GiveTask(v34)
						v20:GiveTask(v35)
						local Camera = Instance.new("Camera")
						Camera.Parent = v33
						v33.CurrentCamera = Camera
						v20:GiveTask(Camera)
						Camera.FieldOfView = 20
						Camera.CFrame = v10(v34, v33, -130, -20)
						local Eyelid = v34:FindFirstChild("Eyelid")
						if Eyelid then
							Eyelid:Destroy()
						end
						v33.Ambient = Color3.fromRGB(192, 192, 192)
						v33.LightDirection = Camera.CFrame.LookVector
						local v36 = v11.new(v34, {
							InViewport = true,
							SlotValue = v92
						})
						table.insert(t, v36)
						v20:GiveTask(v36)
					end
				end
				if v1 then
					local GiveButton = Selected.Viewport:FindFirstChild("GiveButton")
					if GiveButton then
						GiveButton.Visible = true
						v20:GiveTask(v6.new(GiveButton, {
							Click = function() --[[ Click | Line: 470 | Upvalues: v25 (copy), v92 (ref), v12 (ref), v18 (ref), v17 (ref) ]]
								local t = {
									Species = v25.Name,
									Preset = v25.DiscoveryPreset or "Brown",
									Patterns = {},
									Paints = {},
									Cosmetics = {},
									MiscCosmetics = {}
								}
								for v1, v2 in { "Patterns", "Paints", "Cosmetics" } do
									local v3 = v92:FindFirstChild(v2)
									if v3 then
										for v4, v5 in v3:GetChildren() do
											if v5.Value == true then
												table.insert(t[v2], v5.Name)
											end
										end
									end
								end
								local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
								if MiscCosmetics then
									for v8, v9 in MiscCosmetics:GetChildren() do
										if v9.Value and (v9.Value ~= "Nothing" and v9.Value ~= "") then
											t.MiscCosmetics[v9.Name] = v9.Value
										end
									end
								end
								local v10 = v12.GetRemoteFunction("StudioGiveDiscoveryHorse"):InvokeServer(t)
								if v10 then
									local v11 = v18:GetItemFolder("Animals"):WaitForChild(v10, 5)
									if v11 then
										v17:DisplaySlot({
											Type = "Claimed",
											AllowNaming = true,
											ShowMaxWarning = false,
											MobileClickBackgroundToClose = true,
											Slot = v11
										})
									end
								else
									warn("Failed to give horse - Studio only!")
								end
							end
						}))
						v20:GiveTask(function() --[[ Line: 517 | Upvalues: GiveButton (copy) ]]
							GiveButton.Visible = false
						end)
					else
						count = 0
						if p2.Categories then
							for v37, v38 in p2.Categories do
								v112 = v18:GetDiscoveryCategory(v37)
								if v112 then
									for v39, v40 in v112.AllObjects do
										if v37 == "Mutations" and p2.Id then
											v122 = v9.GetMutation(v39)
											if not v122 or v122.Type == p2.Id then
												v132 = p1:_getObjectDataFromName(v39)
												if v132 then
													count = count + 1
													v14 = Index.Content.Selected.Objects.Content.Default:Clone()
													Index.Content.Selected.Objects.Content.Default.Visible = false
													v15 = function(p1_2_2_2) --[[ setState | Line: 553 | Upvalues: v3 (ref), v18 (ref), v39 (copy), v14 (copy), count (ref) ]]
														local v1 = v3:IsItemNewAndNotViewed(v18, v39)
														v14.NewTag.Visible = v1
														v14.NewlyDiscoveredTag.Visible = not v1 and v18:HasNotViewedDiscovery(v39)
														v14.BackgroundTransparency = if v18:IsDiscovered(v39) then 0 else 0.8
														if not p1_2_2_2 then
															return
														end
														v14.LayoutOrder = v14.NewTag.Visible and -count * 1000 or (v14.NewlyDiscoveredTag.Visible and -count or count)
													end
													v20:GiveTask(v18:GetDiscoveryStateChangedSignal(v39):Connect(v15))
													v15(true)
													v20:GiveTask(v4.new(v14, {
														Click = function() --[[ Click | Line: 570 | Upvalues: v102 (ref), p1 (copy), v39 (copy), v92 (ref), v132 (copy), t4 (copy), t (copy), t2 (copy), v14 (copy), v8 (ref), p2 (copy), t3 (copy), countActiveTraits (copy) ]]
															if v102 then
																return
															end
															v102 = true
															p1:_cacheViewedItems({ v39 })
															local v1 = false
															if v92 and v132.TraitType then
																local v2 = t4[v132.TraitType]
																if v2 then
																	local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
																	if MiscCosmetics then
																		local v3 = MiscCosmetics:FindFirstChild(v2)
																		if v3 and v3.Value == v132.Name then
																			for v4, v5 in t do
																				v5:TraitRemoved(v3)
																			end
																			v3.Value = "Nothing"
																			t2[v2] = nil
																			v1 = false
																		elseif v3 then
																			if t2[v2] then
																				t2[v2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
																			end
																			for v6, v7 in t do
																				v7:TraitRemoved(v3)
																			end
																			v3.Value = v132.Name
																			t2[v2] = v14
																			v1 = true
																			for v82, v9 in t do
																				v9:TraitAdded("MiscCosmetics", v3)
																			end
																		end
																	end
																else
																	local v10 = v92:FindFirstChild(v132.TraitType)
																	if v10 then
																		local v11 = v10:FindFirstChild(v132.Name)
																		if v11 then
																			local v12_2 = not v11.Value
																			local TraitType = v132.TraitType
																			local v13 = v8.GetByName(p2.Id)
																			local v142 = if v13 and (v13.MaxTraits and t3[TraitType]) then v13.MaxTraits[t3[TraitType]] else nil
																			if v12_2 and (v142 and v142 <= countActiveTraits(v132.TraitType)) then
																				v102 = false
																				return
																			end
																			v11.Value = v12_2
																			v1 = v11.Value
																			if not v1 then
																				for v15, v16 in t do
																					v16:TraitRemoved(v11)
																				end
																			end
																		else
																			local TraitType = v132.TraitType
																			local v17 = v8.GetByName(p2.Id)
																			local v18 = if v17 and (v17.MaxTraits and t3[TraitType]) then v17.MaxTraits[t3[TraitType]] else nil
																			if v18 and v18 <= countActiveTraits(v132.TraitType) then
																				v102 = false
																				return
																			end
																			local v19 = Instance.new("BoolValue")
																			v19.Name = v132.Name
																			v19.Value = true
																			v19.Parent = v10
																			v1 = true
																			for v20, v21 in t do
																				v21:ListenForTrait(v132.TraitType, v19)
																			end
																		end
																	end
																end
															end
															if v1 then
																v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
															else
																v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															end
															task.delay(0.5, function() --[[ Line: 671 | Upvalues: v102 (ref) ]]
																v102 = false
															end)
														end
													}))
													v14.Title.Text = v7.GetDisplayName(v132.Name, v132)
													v162 = v14.Icon
													v172 = v132.Image or v19.TraitImages[v132.TraitType] or "rbxassetid://15799553218"
													v162.Image = v172
													v14.Name = v39
													v14.Visible = true
													v14.Parent = Index.Content.Selected.Objects.Content
													v20:GiveTask(v14)
													if v132.TraitType and isTraitSelected(v132.TraitType, v132.Name) then
														v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
														v182 = t4[v132.TraitType]
														if v182 then
															t2[v182] = v14
														end
													end
													continue
												end
												warn("No object data can be found for", v39)
											end
										else
											v132 = p1:_getObjectDataFromName(v39)
											if v132 then
												count = count + 1
												v14 = Index.Content.Selected.Objects.Content.Default:Clone()
												Index.Content.Selected.Objects.Content.Default.Visible = false
												v15 = function(p1_2_2_2) --[[ setState | Line: 553 | Upvalues: v3 (ref), v18 (ref), v39 (copy), v14 (copy), count (ref) ]]
													local v1 = v3:IsItemNewAndNotViewed(v18, v39)
													v14.NewTag.Visible = v1
													v14.NewlyDiscoveredTag.Visible = not v1 and v18:HasNotViewedDiscovery(v39)
													v14.BackgroundTransparency = if v18:IsDiscovered(v39) then 0 else 0.8
													if not p1_2_2_2 then
														return
													end
													v14.LayoutOrder = v14.NewTag.Visible and -count * 1000 or (v14.NewlyDiscoveredTag.Visible and -count or count)
												end
												v20:GiveTask(v18:GetDiscoveryStateChangedSignal(v39):Connect(v15))
												v15(true)
												v20:GiveTask(v4.new(v14, {
													Click = function() --[[ Click | Line: 570 | Upvalues: v102 (ref), p1 (copy), v39 (copy), v92 (ref), v132 (copy), t4 (copy), t (copy), t2 (copy), v14 (copy), v8 (ref), p2 (copy), t3 (copy), countActiveTraits (copy) ]]
														if v102 then
															return
														end
														v102 = true
														p1:_cacheViewedItems({ v39 })
														local v1 = false
														if v92 and v132.TraitType then
															local v2 = t4[v132.TraitType]
															if v2 then
																local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
																if MiscCosmetics then
																	local v3 = MiscCosmetics:FindFirstChild(v2)
																	if v3 and v3.Value == v132.Name then
																		for v4, v5 in t do
																			v5:TraitRemoved(v3)
																		end
																		v3.Value = "Nothing"
																		t2[v2] = nil
																		v1 = false
																	elseif v3 then
																		if t2[v2] then
																			t2[v2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
																		end
																		for v6, v7 in t do
																			v7:TraitRemoved(v3)
																		end
																		v3.Value = v132.Name
																		t2[v2] = v14
																		v1 = true
																		for v82, v9 in t do
																			v9:TraitAdded("MiscCosmetics", v3)
																		end
																	end
																end
															else
																local v10 = v92:FindFirstChild(v132.TraitType)
																if v10 then
																	local v11 = v10:FindFirstChild(v132.Name)
																	if v11 then
																		local v12_2 = not v11.Value
																		local TraitType = v132.TraitType
																		local v13 = v8.GetByName(p2.Id)
																		local v142 = if v13 and (v13.MaxTraits and t3[TraitType]) then v13.MaxTraits[t3[TraitType]] else nil
																		if v12_2 and (v142 and v142 <= countActiveTraits(v132.TraitType)) then
																			v102 = false
																			return
																		end
																		v11.Value = v12_2
																		v1 = v11.Value
																		if not v1 then
																			for v15, v16 in t do
																				v16:TraitRemoved(v11)
																			end
																		end
																	else
																		local TraitType = v132.TraitType
																		local v17 = v8.GetByName(p2.Id)
																		local v18 = if v17 and (v17.MaxTraits and t3[TraitType]) then v17.MaxTraits[t3[TraitType]] else nil
																		if v18 and v18 <= countActiveTraits(v132.TraitType) then
																			v102 = false
																			return
																		end
																		local v19 = Instance.new("BoolValue")
																		v19.Name = v132.Name
																		v19.Value = true
																		v19.Parent = v10
																		v1 = true
																		for v20, v21 in t do
																			v21:ListenForTrait(v132.TraitType, v19)
																		end
																	end
																end
															end
														end
														if v1 then
															v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
														else
															v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
														end
														task.delay(0.5, function() --[[ Line: 671 | Upvalues: v102 (ref) ]]
															v102 = false
														end)
													end
												}))
												v14.Title.Text = v7.GetDisplayName(v132.Name, v132)
												v162 = v14.Icon
												v172 = v132.Image or v19.TraitImages[v132.TraitType] or "rbxassetid://15799553218"
												v162.Image = v172
												v14.Name = v39
												v14.Visible = true
												v14.Parent = Index.Content.Selected.Objects.Content
												v20:GiveTask(v14)
												if v132.TraitType and isTraitSelected(v132.TraitType, v132.Name) then
													v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
													v182 = t4[v132.TraitType]
													if v182 then
														t2[v182] = v14
													end
												end
												continue
											end
											warn("No object data can be found for", v39)
										end
									end
								end
							end
						elseif p2.AllObjects then
							for v41, v42 in p2.AllObjects do
								v192 = p1:_getObjectDataFromName(v41)
								if v192 then
									count = count + 1
									v202 = Index.Content.Selected.Objects.Content.Default:Clone()
									Index.Content.Selected.Objects.Content.Default.Visible = false
									v212 = function(p1_2) --[[ setState | Line: 708 | Upvalues: v3 (ref), v18 (ref), v41 (copy), v202 (copy), count (ref) ]]
										local v1 = v3:IsItemNewAndNotViewed(v18, v41)
										v202.NewTag.Visible = v1
										v202.NewlyDiscoveredTag.Visible = not v1 and v18:HasNotViewedDiscovery(v41)
										v202.BackgroundTransparency = if v18:IsDiscovered(v41) then 0 else 0.8
										if not p1_2 then
											return
										end
										v202.LayoutOrder = v202.NewTag.Visible and -count * 1000 or (v202.NewlyDiscoveredTag.Visible and -count or count)
									end
									v20:GiveTask(v18:GetDiscoveryStateChangedSignal(v41):Connect(v212))
									v212(true)
									v20:GiveTask(v4.new(v202, {
										Click = function() --[[ Click | Line: 725 | Upvalues: v102 (ref), p1 (copy), v41 (copy), v92 (ref), v192 (copy), t4 (copy), t (copy), t2 (copy), v202 (copy), v8 (ref), p2 (copy), t3 (copy), countActiveTraits (copy) ]]
											if v102 then
												return
											end
											v102 = true
											p1:_cacheViewedItems({ v41 })
											local v1 = false
											if v92 and v192.TraitType then
												local v2 = t4[v192.TraitType]
												if v2 then
													local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
													if MiscCosmetics then
														local v3 = MiscCosmetics:FindFirstChild(v2)
														if v3 and v3.Value == v192.Name then
															for v4, v5 in t do
																v5:TraitRemoved(v3)
															end
															v3.Value = "Nothing"
															t2[v2] = nil
															v1 = false
														elseif v3 then
															if t2[v2] then
																t2[v2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															end
															for v6, v7 in t do
																v7:TraitRemoved(v3)
															end
															v3.Value = v192.Name
															t2[v2] = v202
															v1 = true
															for v82, v9 in t do
																v9:TraitAdded("MiscCosmetics", v3)
															end
														end
													end
												else
													local v10 = v92:FindFirstChild(v192.TraitType)
													if v10 then
														local v11 = v10:FindFirstChild(v192.Name)
														if v11 then
															local v12_2 = not v11.Value
															local TraitType = v192.TraitType
															local v13 = v8.GetByName(p2.Id)
															local v14 = if v13 and (v13.MaxTraits and t3[TraitType]) then v13.MaxTraits[t3[TraitType]] else nil
															if v12_2 and (v14 and v14 <= countActiveTraits(v192.TraitType)) then
																v102 = false
																return
															end
															v11.Value = v12_2
															v1 = v11.Value
															if not v1 then
																for v15, v16 in t do
																	v16:TraitRemoved(v11)
																end
															end
														else
															local TraitType = v192.TraitType
															local v17 = v8.GetByName(p2.Id)
															local v18 = if v17 and (v17.MaxTraits and t3[TraitType]) then v17.MaxTraits[t3[TraitType]] else nil
															if v18 and v18 <= countActiveTraits(v192.TraitType) then
																v102 = false
																return
															end
															local v19 = Instance.new("BoolValue")
															v19.Name = v192.Name
															v19.Value = true
															v19.Parent = v10
															v1 = true
															for v20, v21 in t do
																v21:ListenForTrait(v192.TraitType, v19)
															end
														end
													end
												end
											end
											if v1 then
												v202.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
											else
												v202.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
											end
											task.delay(0.5, function() --[[ Line: 811 | Upvalues: v102 (ref) ]]
												v102 = false
											end)
										end
									}))
									v202.Title.Text = v7.GetDisplayName(v192.Name, v192)
									v22 = v202.Icon
									v23 = v192.Image or v19.TraitImages[v192.TraitType] or "rbxassetid://15799553218"
									v22.Image = v23
									v202.Name = v41
									v202.Visible = true
									v202.Parent = Index.Content.Selected.Objects.Content
									v20:GiveTask(v202)
									if v192.TraitType and isTraitSelected(v192.TraitType, v192.Name) then
										v202.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
										v24 = t4[v192.TraitType]
										if v24 then
											t2[v24] = v202
										end
									end
									continue
								end
								warn("No object data can be found for", v41)
							end
						end
						v20:GiveTask(function() --[[ Line: 837 | Upvalues: p1 (copy), p2 (copy) ]]
							p1:_postItemsFromCategory(p2)
						end)
						v20:GiveTask(v2.new({
							TweenAmount = false,
							Clipped = false,
							Frame = Selected.ProgressBar.Bar,
							AmountLabel = Selected.ProgressLabel,
							GetText = function(p1_2, p2_2) --[[ GetText | Line: 847 ]]
								local v1 = p1_2 / p2_2 * 100
								return (if v1 % 1 == 0 then string.format("%d%%", v1) else string.format("%.2f%%", v1)) .. " Discovered"
							end,
							Get = function() --[[ Get | Line: 856 | Upvalues: p1 (copy), p2 (copy) ]]
								return p1:_getTotalDiscoveredForCategory(p2)
							end,
							GetMax = function() --[[ GetMax | Line: 859 | Upvalues: p1 (copy), p2 (copy) ]]
								return p1:_getTotalToDiscoverForCategory(p2)
							end,
							Changed = p1:_getChangedSignalsForCategory(p2),
							OnChanged = function(p1_2, p2_2) --[[ OnChanged | Line: 863 | Upvalues: Index (ref) ]]
								Index.Content.Selected.TotalDiscovered.Content.TextLabel.Text = p1_2 .. "/" .. p2_2
							end
						}))
						v13 = Index.Content.Selected.Visible
						Index.Content.BackButton.Visible = not p2.IsMain or v13
						return
					end
				end
			end
		elseif p2.ParentCategory and p2.ParentCategory.Id == "Mutations" then
			Selected.SeasonFrame.HelpButton.Visible = false
			Selected.SeasonFrame.NotSelected.Visible = false
		end
		count = 0
		if p2.Categories then
			for v37, v38 in p2.Categories do
				v112 = v18:GetDiscoveryCategory(v37)
				if v112 then
					for v39, v40 in v112.AllObjects do
						if v37 == "Mutations" and p2.Id then
							v122 = v9.GetMutation(v39)
							if not v122 or v122.Type == p2.Id then
								v132 = p1:_getObjectDataFromName(v39)
								if v132 then
									count = count + 1
									v14 = Index.Content.Selected.Objects.Content.Default:Clone()
									Index.Content.Selected.Objects.Content.Default.Visible = false
									v15 = function(p1_2_2_2) --[[ setState | Line: 553 | Upvalues: v3 (ref), v18 (ref), v39 (copy), v14 (copy), count (ref) ]]
										local v1 = v3:IsItemNewAndNotViewed(v18, v39)
										v14.NewTag.Visible = v1
										v14.NewlyDiscoveredTag.Visible = not v1 and v18:HasNotViewedDiscovery(v39)
										v14.BackgroundTransparency = if v18:IsDiscovered(v39) then 0 else 0.8
										if not p1_2_2_2 then
											return
										end
										v14.LayoutOrder = v14.NewTag.Visible and -count * 1000 or (v14.NewlyDiscoveredTag.Visible and -count or count)
									end
									v20:GiveTask(v18:GetDiscoveryStateChangedSignal(v39):Connect(v15))
									v15(true)
									v20:GiveTask(v4.new(v14, {
										Click = function() --[[ Click | Line: 570 | Upvalues: v102 (ref), p1 (copy), v39 (copy), v92 (ref), v132 (copy), t4 (copy), t (copy), t2 (copy), v14 (copy), v8 (ref), p2 (copy), t3 (copy), countActiveTraits (copy) ]]
											if v102 then
												return
											end
											v102 = true
											p1:_cacheViewedItems({ v39 })
											local v1 = false
											if v92 and v132.TraitType then
												local v2 = t4[v132.TraitType]
												if v2 then
													local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
													if MiscCosmetics then
														local v3 = MiscCosmetics:FindFirstChild(v2)
														if v3 and v3.Value == v132.Name then
															for v4, v5 in t do
																v5:TraitRemoved(v3)
															end
															v3.Value = "Nothing"
															t2[v2] = nil
															v1 = false
														elseif v3 then
															if t2[v2] then
																t2[v2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
															end
															for v6, v7 in t do
																v7:TraitRemoved(v3)
															end
															v3.Value = v132.Name
															t2[v2] = v14
															v1 = true
															for v82, v9 in t do
																v9:TraitAdded("MiscCosmetics", v3)
															end
														end
													end
												else
													local v10 = v92:FindFirstChild(v132.TraitType)
													if v10 then
														local v11 = v10:FindFirstChild(v132.Name)
														if v11 then
															local v12_2 = not v11.Value
															local TraitType = v132.TraitType
															local v13 = v8.GetByName(p2.Id)
															local v142 = if v13 and (v13.MaxTraits and t3[TraitType]) then v13.MaxTraits[t3[TraitType]] else nil
															if v12_2 and (v142 and v142 <= countActiveTraits(v132.TraitType)) then
																v102 = false
																return
															end
															v11.Value = v12_2
															v1 = v11.Value
															if not v1 then
																for v15, v16 in t do
																	v16:TraitRemoved(v11)
																end
															end
														else
															local TraitType = v132.TraitType
															local v17 = v8.GetByName(p2.Id)
															local v18 = if v17 and (v17.MaxTraits and t3[TraitType]) then v17.MaxTraits[t3[TraitType]] else nil
															if v18 and v18 <= countActiveTraits(v132.TraitType) then
																v102 = false
																return
															end
															local v19 = Instance.new("BoolValue")
															v19.Name = v132.Name
															v19.Value = true
															v19.Parent = v10
															v1 = true
															for v20, v21 in t do
																v21:ListenForTrait(v132.TraitType, v19)
															end
														end
													end
												end
											end
											if v1 then
												v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
											else
												v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
											end
											task.delay(0.5, function() --[[ Line: 671 | Upvalues: v102 (ref) ]]
												v102 = false
											end)
										end
									}))
									v14.Title.Text = v7.GetDisplayName(v132.Name, v132)
									v162 = v14.Icon
									v172 = v132.Image or v19.TraitImages[v132.TraitType] or "rbxassetid://15799553218"
									v162.Image = v172
									v14.Name = v39
									v14.Visible = true
									v14.Parent = Index.Content.Selected.Objects.Content
									v20:GiveTask(v14)
									if v132.TraitType and isTraitSelected(v132.TraitType, v132.Name) then
										v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
										v182 = t4[v132.TraitType]
										if v182 then
											t2[v182] = v14
										end
									end
									continue
								end
								warn("No object data can be found for", v39)
							end
						else
							v132 = p1:_getObjectDataFromName(v39)
							if v132 then
								count = count + 1
								v14 = Index.Content.Selected.Objects.Content.Default:Clone()
								Index.Content.Selected.Objects.Content.Default.Visible = false
								v15 = function(p1_2_2_2) --[[ setState | Line: 553 | Upvalues: v3 (ref), v18 (ref), v39 (copy), v14 (copy), count (ref) ]]
									local v1 = v3:IsItemNewAndNotViewed(v18, v39)
									v14.NewTag.Visible = v1
									v14.NewlyDiscoveredTag.Visible = not v1 and v18:HasNotViewedDiscovery(v39)
									v14.BackgroundTransparency = if v18:IsDiscovered(v39) then 0 else 0.8
									if not p1_2_2_2 then
										return
									end
									v14.LayoutOrder = v14.NewTag.Visible and -count * 1000 or (v14.NewlyDiscoveredTag.Visible and -count or count)
								end
								v20:GiveTask(v18:GetDiscoveryStateChangedSignal(v39):Connect(v15))
								v15(true)
								v20:GiveTask(v4.new(v14, {
									Click = function() --[[ Click | Line: 570 | Upvalues: v102 (ref), p1 (copy), v39 (copy), v92 (ref), v132 (copy), t4 (copy), t (copy), t2 (copy), v14 (copy), v8 (ref), p2 (copy), t3 (copy), countActiveTraits (copy) ]]
										if v102 then
											return
										end
										v102 = true
										p1:_cacheViewedItems({ v39 })
										local v1 = false
										if v92 and v132.TraitType then
											local v2 = t4[v132.TraitType]
											if v2 then
												local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
												if MiscCosmetics then
													local v3 = MiscCosmetics:FindFirstChild(v2)
													if v3 and v3.Value == v132.Name then
														for v4, v5 in t do
															v5:TraitRemoved(v3)
														end
														v3.Value = "Nothing"
														t2[v2] = nil
														v1 = false
													elseif v3 then
														if t2[v2] then
															t2[v2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
														end
														for v6, v7 in t do
															v7:TraitRemoved(v3)
														end
														v3.Value = v132.Name
														t2[v2] = v14
														v1 = true
														for v82, v9 in t do
															v9:TraitAdded("MiscCosmetics", v3)
														end
													end
												end
											else
												local v10 = v92:FindFirstChild(v132.TraitType)
												if v10 then
													local v11 = v10:FindFirstChild(v132.Name)
													if v11 then
														local v12_2 = not v11.Value
														local TraitType = v132.TraitType
														local v13 = v8.GetByName(p2.Id)
														local v142 = if v13 and (v13.MaxTraits and t3[TraitType]) then v13.MaxTraits[t3[TraitType]] else nil
														if v12_2 and (v142 and v142 <= countActiveTraits(v132.TraitType)) then
															v102 = false
															return
														end
														v11.Value = v12_2
														v1 = v11.Value
														if not v1 then
															for v15, v16 in t do
																v16:TraitRemoved(v11)
															end
														end
													else
														local TraitType = v132.TraitType
														local v17 = v8.GetByName(p2.Id)
														local v18 = if v17 and (v17.MaxTraits and t3[TraitType]) then v17.MaxTraits[t3[TraitType]] else nil
														if v18 and v18 <= countActiveTraits(v132.TraitType) then
															v102 = false
															return
														end
														local v19 = Instance.new("BoolValue")
														v19.Name = v132.Name
														v19.Value = true
														v19.Parent = v10
														v1 = true
														for v20, v21 in t do
															v21:ListenForTrait(v132.TraitType, v19)
														end
													end
												end
											end
										end
										if v1 then
											v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
										else
											v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										end
										task.delay(0.5, function() --[[ Line: 671 | Upvalues: v102 (ref) ]]
											v102 = false
										end)
									end
								}))
								v14.Title.Text = v7.GetDisplayName(v132.Name, v132)
								v162 = v14.Icon
								v172 = v132.Image or v19.TraitImages[v132.TraitType] or "rbxassetid://15799553218"
								v162.Image = v172
								v14.Name = v39
								v14.Visible = true
								v14.Parent = Index.Content.Selected.Objects.Content
								v20:GiveTask(v14)
								if v132.TraitType and isTraitSelected(v132.TraitType, v132.Name) then
									v14.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
									v182 = t4[v132.TraitType]
									if v182 then
										t2[v182] = v14
									end
								end
								continue
							end
							warn("No object data can be found for", v39)
						end
					end
				end
			end
		elseif p2.AllObjects then
			for v41, v42 in p2.AllObjects do
				v192 = p1:_getObjectDataFromName(v41)
				if v192 then
					count = count + 1
					v202 = Index.Content.Selected.Objects.Content.Default:Clone()
					Index.Content.Selected.Objects.Content.Default.Visible = false
					v212 = function(p1_2) --[[ setState | Line: 708 | Upvalues: v3 (ref), v18 (ref), v41 (copy), v202 (copy), count (ref) ]]
						local v1 = v3:IsItemNewAndNotViewed(v18, v41)
						v202.NewTag.Visible = v1
						v202.NewlyDiscoveredTag.Visible = not v1 and v18:HasNotViewedDiscovery(v41)
						v202.BackgroundTransparency = if v18:IsDiscovered(v41) then 0 else 0.8
						if not p1_2 then
							return
						end
						v202.LayoutOrder = v202.NewTag.Visible and -count * 1000 or (v202.NewlyDiscoveredTag.Visible and -count or count)
					end
					v20:GiveTask(v18:GetDiscoveryStateChangedSignal(v41):Connect(v212))
					v212(true)
					v20:GiveTask(v4.new(v202, {
						Click = function() --[[ Click | Line: 725 | Upvalues: v102 (ref), p1 (copy), v41 (copy), v92 (ref), v192 (copy), t4 (copy), t (copy), t2 (copy), v202 (copy), v8 (ref), p2 (copy), t3 (copy), countActiveTraits (copy) ]]
							if v102 then
								return
							end
							v102 = true
							p1:_cacheViewedItems({ v41 })
							local v1 = false
							if v92 and v192.TraitType then
								local v2 = t4[v192.TraitType]
								if v2 then
									local MiscCosmetics = v92:FindFirstChild("MiscCosmetics")
									if MiscCosmetics then
										local v3 = MiscCosmetics:FindFirstChild(v2)
										if v3 and v3.Value == v192.Name then
											for v4, v5 in t do
												v5:TraitRemoved(v3)
											end
											v3.Value = "Nothing"
											t2[v2] = nil
											v1 = false
										elseif v3 then
											if t2[v2] then
												t2[v2].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
											end
											for v6, v7 in t do
												v7:TraitRemoved(v3)
											end
											v3.Value = v192.Name
											t2[v2] = v202
											v1 = true
											for v82, v9 in t do
												v9:TraitAdded("MiscCosmetics", v3)
											end
										end
									end
								else
									local v10 = v92:FindFirstChild(v192.TraitType)
									if v10 then
										local v11 = v10:FindFirstChild(v192.Name)
										if v11 then
											local v12_2 = not v11.Value
											local TraitType = v192.TraitType
											local v13 = v8.GetByName(p2.Id)
											local v14 = if v13 and (v13.MaxTraits and t3[TraitType]) then v13.MaxTraits[t3[TraitType]] else nil
											if v12_2 and (v14 and v14 <= countActiveTraits(v192.TraitType)) then
												v102 = false
												return
											end
											v11.Value = v12_2
											v1 = v11.Value
											if not v1 then
												for v15, v16 in t do
													v16:TraitRemoved(v11)
												end
											end
										else
											local TraitType = v192.TraitType
											local v17 = v8.GetByName(p2.Id)
											local v18 = if v17 and (v17.MaxTraits and t3[TraitType]) then v17.MaxTraits[t3[TraitType]] else nil
											if v18 and v18 <= countActiveTraits(v192.TraitType) then
												v102 = false
												return
											end
											local v19 = Instance.new("BoolValue")
											v19.Name = v192.Name
											v19.Value = true
											v19.Parent = v10
											v1 = true
											for v20, v21 in t do
												v21:ListenForTrait(v192.TraitType, v19)
											end
										end
									end
								end
							end
							if v1 then
								v202.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
							else
								v202.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							end
							task.delay(0.5, function() --[[ Line: 811 | Upvalues: v102 (ref) ]]
								v102 = false
							end)
						end
					}))
					v202.Title.Text = v7.GetDisplayName(v192.Name, v192)
					v22 = v202.Icon
					v23 = v192.Image or v19.TraitImages[v192.TraitType] or "rbxassetid://15799553218"
					v22.Image = v23
					v202.Name = v41
					v202.Visible = true
					v202.Parent = Index.Content.Selected.Objects.Content
					v20:GiveTask(v202)
					if v192.TraitType and isTraitSelected(v192.TraitType, v192.Name) then
						v202.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
						v24 = t4[v192.TraitType]
						if v24 then
							t2[v24] = v202
						end
					end
					continue
				end
				warn("No object data can be found for", v41)
			end
		end
		v20:GiveTask(function() --[[ Line: 837 | Upvalues: p1 (copy), p2 (copy) ]]
			p1:_postItemsFromCategory(p2)
		end)
		v20:GiveTask(v2.new({
			TweenAmount = false,
			Clipped = false,
			Frame = Selected.ProgressBar.Bar,
			AmountLabel = Selected.ProgressLabel,
			GetText = function(p1_2, p2_2) --[[ GetText | Line: 847 ]]
				local v1 = p1_2 / p2_2 * 100
				return (if v1 % 1 == 0 then string.format("%d%%", v1) else string.format("%.2f%%", v1)) .. " Discovered"
			end,
			Get = function() --[[ Get | Line: 856 | Upvalues: p1 (copy), p2 (copy) ]]
				return p1:_getTotalDiscoveredForCategory(p2)
			end,
			GetMax = function() --[[ GetMax | Line: 859 | Upvalues: p1 (copy), p2 (copy) ]]
				return p1:_getTotalToDiscoverForCategory(p2)
			end,
			Changed = p1:_getChangedSignalsForCategory(p2),
			OnChanged = function(p1_2, p2_2) --[[ OnChanged | Line: 863 | Upvalues: Index (ref) ]]
				Index.Content.Selected.TotalDiscovered.Content.TextLabel.Text = p1_2 .. "/" .. p2_2
			end
		}))
	end
	v13 = Index.Content.Selected.Visible
	Index.Content.BackButton.Visible = not p2.IsMain or v13
end
function t._createCategoriesFrame(p1, p2) --[[ _createCategoriesFrame | Line: 873 | Upvalues: Index (copy), v8 (copy), v7 (copy), v2 (copy), v4 (copy) ]]
	local Category = p2.Category
	local Categories = Category.Categories
	local v1 = Index.Content.Categories.Default:Clone()
	Index.Content.Categories.Default.Visible = false
	v1.Name = if p2.IsMain then "Main" else Category.Id
	Category.Frame = v1
	Category.IsMain = p2.IsMain
	if Categories then
		for v3, v42 in Categories do
			if v42.Display then
				v42.ParentCategory = Category
				local v5 = v42.LayoutOrder or 100
				local v6 = v1.Default:Clone()
				v1.Default.Visible = false
				local v72 = v42.Title or v3
				if v42.ParentCategory and v42.ParentCategory.Id == "Species" then
					local v82 = v8.GetByName(v3)
					if v82 then
						v72 = v7.GetDisplayName(v82.Name, v82)
					end
				end
				v6:FindFirstChild("Title", true).Text = v72:upper()
				if v42.ParentCategory and v42.ParentCategory.Id == "Species" then
					local v10 = v8.GetByName(v3)
					if v10 and v10.Rarity then
						local RarityFrame = v6:FindFirstChild("RarityFrame")
						if RarityFrame then
							local v11 = RarityFrame:FindFirstChild(v10.Rarity.Name)
							if v11 then
								v11.Visible = true
							end
						end
					end
				end
				v2.new({
					TweenAmount = false,
					Clipped = false,
					Frame = v6.Content.ProgressBar.Bar,
					AmountLabel = v6.Content.ProgressLabel,
					GetText = function(p1, p2) --[[ GetText | Line: 925 ]]
						local v1 = p1 / p2 * 100
						return (if v1 % 1 == 0 then string.format("%d%%", v1) else string.format("%.2f%%", v1)) .. " Discovered"
					end,
					Get = function() --[[ Get | Line: 934 | Upvalues: p1 (copy), v42 (copy) ]]
						return p1:_getTotalDiscoveredForCategory(v42)
					end,
					GetMax = function() --[[ GetMax | Line: 937 | Upvalues: p1 (copy), v42 (copy) ]]
						return p1:_getTotalToDiscoverForCategory(v42)
					end,
					Changed = p1:_getChangedSignalsForCategory(v42),
					OnChanged = function() --[[ OnChanged | Line: 941 | Upvalues: v6 (copy), p1 (copy), v42 (copy), v5 (copy) ]]
						v6.NewTag.Visible = p1:_hasNewItemsInCategory(v42)
						local v1 = p1:_getTotalNewlyDiscoveryForCategory(v42)
						v6.DiscoveredTag.Content.TextLabel.Text = "+" .. v1
						v6.DiscoveredTag.Visible = v1 > 0
						v6.LayoutOrder = v6.NewTag.Visible and -v5 * 1000 or (v6.DiscoveredTag.Visible and -v5 or v5)
					end
				})
				if v42.Image then
					v6.ImageLabel.Image = v42.Image
					v6.ImageLabel.Visible = true
					v6.Viewport.Visible = false
				elseif v42.Viewport then
					v42.Viewport(v6.Viewport)
					v6.ImageLabel.Visible = false
					v6.Viewport.Visible = true
				end
				v42.ParentFrame = v1
				if v42.CreateSubTab then
					p1:_createCategoriesFrame({
						Category = v42
					})
				end
				v4.new(v6, {
					HoverUpPosition = 0.03,
					Click = function() --[[ Click | Line: 973 | Upvalues: p1 (copy), v42 (copy) ]]
						p1:_selectCategory(v42)
					end
				})
				v6.Visible = true
				v6.Name = v3
				v6.Parent = v1
			end
		end
	end
	v1.Visible = p2.IsMain
	v1.Parent = Index.Content.Categories
	return Category
end
function t._hasNewItemsInCategory(p1, p2) --[[ _hasNewItemsInCategory | Line: 990 | Upvalues: v3 (copy), v18 (copy), v9 (copy) ]]
	if p2.AllObjects then
		for v1, v2 in p2.AllObjects do
			if v3:IsItemNewAndNotViewed(v18, v1) then
				return true
			end
		end
	end
	if not p2.Categories then
		return false
	end
	for v32, v4 in p2.Categories do
		if if v32 == "Mutations" then p2.Id else false then
			local v6 = v18:GetDiscoveryCategory(v32)
			if v6 then
				for v7, v8 in v6.AllObjects do
					local v92 = v9.GetMutation(v7)
					if v92 and (v92.Type == p2.Id and v3:IsItemNewAndNotViewed(v18, v7)) then
						return true
					end
				end
			end
			continue
		end
		if p1:_hasNewItemsInCategory(v4) then
			return true
		end
	end
	return false
end
function t._getChangedSignalsForCategory(p1, p2, p3) --[[ _getChangedSignalsForCategory | Line: 1028 | Upvalues: v18 (copy) ]]
	local v1 = if p3 then p3 else {}
	if p2.Id then
		v1[#v1 + 1] = v18:GetDiscoveryCategoryChangedSignal(p2.Id)
	end
	local v2 = v1
	if p2.Categories then
		for v3, v4 in p2.Categories do
			v2 = p1:_getChangedSignalsForCategory(v4, v2)
		end
	end
	return v2
end
function t._getTotalToDiscoverForCategory(p1, p2, p3) --[[ _getTotalToDiscoverForCategory | Line: 1041 | Upvalues: v18 (copy), v9 (copy), v3 (copy) ]]
	local sum = p3 or 0
	if p2.Id then
		if p2.Categories and (p2.Categories.Mutations and p2.Id ~= "Mutations") then
			local v1 = v18:GetDiscoveryCategory("Mutations")
			if v1 then
				for v2, v32 in v1.AllObjects do
					local v4 = v9.GetMutation(v2)
					if v4 and v4.Type == p2.Id then
						sum = sum + 1
					end
				end
			end
		else
			sum = sum + v3:GetTotalToDiscover(v18, p2.Id)
		end
	end
	if p2.Categories then
		for v5, v6 in p2.Categories do
			if v5 ~= "Mutations" or not p2.Id then
				sum = p1:_getTotalToDiscoverForCategory(v6, sum)
			end
		end
	end
	return sum
end
function t._getTotalDiscoveredForCategory(p1, p2, p3) --[[ _getTotalDiscoveredForCategory | Line: 1069 | Upvalues: v18 (copy), v9 (copy), v3 (copy) ]]
	local sum = p3 or 0
	if p2.Id then
		if p2.Categories and (p2.Categories.Mutations and p2.Id ~= "Mutations") then
			local v1 = v18:GetDiscoveryCategory("Mutations")
			if v1 then
				for v2, v32 in v1.Discovered do
					local v4 = v9.GetMutation(v2)
					if v4 and (v4.Type == p2.Id and v18:IsDiscovered(v2)) then
						sum = sum + 1
					end
				end
			end
		else
			sum = sum + v3:GetTotalDiscovered(v18, p2.Id)
		end
	end
	if p2.Categories then
		for v5, v6 in p2.Categories do
			if v5 ~= "Mutations" or not p2.Id then
				sum = p1:_getTotalDiscoveredForCategory(v6, sum)
			end
		end
	end
	return sum
end
function t._getTotalNewlyDiscoveryForCategory(p1, p2, p3) --[[ _getTotalNewlyDiscoveryForCategory | Line: 1097 | Upvalues: v18 (copy), v9 (copy), v3 (copy) ]]
	local sum = p3 or 0
	if p2.Id then
		if p2.Categories and (p2.Categories.Mutations and p2.Id ~= "Mutations") then
			local v1 = v18:GetDiscoveryCategory("Mutations")
			if v1 then
				for v2, v32 in v1.Discovered do
					local v4 = v9.GetMutation(v2)
					if v4 and (v4.Type == p2.Id and v18:HasNotViewedDiscovery(v2)) then
						sum = sum + 1
					end
				end
			end
		else
			sum = sum + v3:GetTotalNewlyDiscovered(v18, p2.Id)
		end
	end
	if p2.Categories then
		for v5, v6 in p2.Categories do
			if v5 ~= "Mutations" or not p2.Id then
				sum = p1:_getTotalNewlyDiscoveryForCategory(v6, sum)
			end
		end
	end
	return sum
end
function t._initTabButton(p1, p2) --[[ _initTabButton | Line: 1125 | Upvalues: v13 (copy), v19 (copy), v14 (copy), Index (copy), v21 (ref), v15 (copy), ContainerFrame (copy) ]]
	local function updateTabButton() --[[ updateTabButton | Line: 1126 | Upvalues: v13 (ref), p2 (copy), p1 (copy) ]]
		if not v13.GetGameState("JournalTabs") then
			p2.DiscoveredTag.Visible = false
			p2.NewTag.Visible = false
			return
		end
		p2.NewTag.Visible = p1:_hasNewItemsInCategory(p1.CategoryDisplay)
		local v1 = p1:_getTotalNewlyDiscoveryForCategory(p1.CategoryDisplay)
		p2.DiscoveredTag.Content.TextLabel.Text = "+" .. v1
		p2.DiscoveredTag.Visible = v1 > 0
	end
	v19.GameStateChangedSignal:Connect(updateTabButton)
	for v1, v2 in p1:_getChangedSignalsForCategory(p1.CategoryDisplay) do
		v2:Connect(updateTabButton)
	end
	updateTabButton()
	v14.AddStateCallback(Index, "OnClose", function() --[[ Line: 1143 | Upvalues: p1 (copy), v21 (ref) ]]
		p1:_postItemsFromCategory(v21)
	end)
	v15.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1147 | Upvalues: p1 (copy), v21 (ref) ]]
		p1:_postItemsFromCategory(v21)
	end)
end
function t.Init(p1) --[[ Init | Line: 1152 | Upvalues: v18 (copy), t3 (copy), v6 (copy), Index (copy), v21 (ref) ]]
	local function v1(p1, p2) --[[ recurse | Line: 1153 | Upvalues: v1 (copy), v18 (ref) ]]
		p2.Id = p1
		local t = {}
		if p2.NextCategories then
			for v12, v2 in p2.NextCategories() do
				t[v12] = v2
			end
		end
		if next(t) then
			p2.Categories = p2.Categories or {}
			for v4, v5 in t do
				p2.Categories[v4] = v5
			end
		end
		if p2.Categories then
			for v6, v7 in p2.Categories do
				v1(v6, v7)
			end
		end
		local v8 = v18:GetDiscoveryCategory(p1)
		if not v8 then
			return
		end
		p2.AllObjects = v8.AllObjects
	end
	for v2, v3 in t3 do
		v1(v2, v3)
	end
	v6.new(Index.Content.BackButton, {
		Click = function() --[[ Click | Line: 1184 | Upvalues: Index (ref), p1 (copy), v21 (ref) ]]
			if Index.Content.Selected.Visible then
				p1:_selectCategory(v21.ParentCategory or p1.CategoryDisplay)
			else
				p1:_selectCategory(v21.ParentCategory or p1.CategoryDisplay)
			end
		end
	})
	Index.Content.Selected.ViewButton.Visible = false
	v6.new(Index.Content.Selected.ViewButton, {
		Click = function() --[[ Click | Line: 1196 | Upvalues: p1 (copy), v21 (ref) ]]
			p1:_postItemsFromCategory(v21)
		end
	})
	p1.CategoryDisplay = p1:_createCategoriesFrame({
		IsMain = true,
		Category = {
			Categories = t3
		}
	})
	p1:_selectCategory(p1.CategoryDisplay)
end
t:Init()
return t