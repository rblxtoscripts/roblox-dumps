-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("Maid")
local v4 = Sonar("PromptClient")
local v5 = Sonar("AnimalStorageService")
local v6 = Sonar("GridSort")
local v7 = Sonar("AnimalDataService")
local v8 = Sonar("Button")
local v9 = Sonar("AnimalGridButton")
local v10 = Sonar("InputTypeDetector")
local v11 = Sonar("RemoteUtils")
local v12 = Sonar("IssueResponseClient")
local v13 = Sonar("FormatNumber")
local v14 = Sonar("MarketplaceUtils")
local v15 = Sonar("FormatString")
local v16 = Sonar("TutorialService")
local v17 = Sonar("Constants")
local v18 = Sonar("PlayerWrapper").GetClient()
local LocalPlayer = game.Players.LocalPlayer
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("AnimalStorageGui").ContainerFrame
local v19 = v3.new()
local t = {
	Storage = {},
	NotStorage = {}
}
local t2 = {}
local t3 = {}
local v20 = false
for v21, v22 in t do
	local t4 = {
		Priority = {
			{
				Priority = 2,
				Run = function(p1) --[[ Run | Line: 53 ]]
					return p1.EquippedLabel.Visible
				end,
				Changed = function(p1) --[[ Changed | Line: 56 ]]
					return p1.EquippedLabel:GetPropertyChangedSignal("Visible")
				end
			},
			{
				Priority = 1,
				Run = function(p1) --[[ Run | Line: 63 ]]
					return p1.SlotValue.Favorite.Value
				end,
				Changed = function(p1) --[[ Changed | Line: 66 ]]
					return p1.SlotValue.Favorite:GetPropertyChangedSignal("Value")
				end
			}
		}
	}
	t4.Frame = ContainerFrame.Menu.Content[if v21 == "Storage" then "StoredSorting" else "Sorting"]
	t4.Sorts = {
		Alphabet = {
			DisplayName = "Name",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 83 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				if p3 then
					return v2 < v1
				else
					return v1 < v2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 94 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		},
		Gender = {
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 100 | Upvalues: v7 (copy) ]]
				local v1 = v7.GetGender(p1.SlotValue)
				local v2 = v7.GetGender(p2.SlotValue)
				local v3 = if v1 == "Both" then 3 elseif v1 == "Female" then 1 else 2
				local v4 = if v2 == "Both" then 3 elseif v2 == "Female" then 1 else 2
				if p3 then
					return v4 < v3
				else
					return v3 < v4
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 113 ]]
				return p1.SlotValue.Gender:GetPropertyChangedSignal("Value")
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
			Run = function(p1, p2, p3) --[[ Run | Line: 135 | Upvalues: v7 (copy) ]]
				local v1 = v7.GetPriceForSlot(p1.SlotValue)
				local v2 = v7.GetPriceForSlot(p2.SlotValue)
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
		TotalMutations = {
			DisplayName = "# Mutations",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 151 | Upvalues: v7 (copy) ]]
				local v1 = v7.GetTotalMutations(p1.SlotValue)
				local v2 = v7.GetTotalMutations(p2.SlotValue)
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 160 ]]
				return p1.MutationsChangedSignal
			end
		},
		TotalTraits = {
			DisplayName = "# Traits",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 167 | Upvalues: v7 (copy) ]]
				local v1 = v7.GetTotalTraits(p1.SlotValue)
				local v2 = v7.GetTotalTraits(p2.SlotValue)
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 176 ]]
				return p1.SlotAttributesChangedSignal
			end
		},
		Age = {
			DisplayName = "Age",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 183 ]]
				local Age = p1.SlotValue.Age.Value
				local Age_2 = p2.SlotValue.Age.Value
				if p3 then
					return Age < Age_2
				else
					return Age_2 < Age
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 192 ]]
				return p1.SlotValue.Age:GetPropertyChangedSignal("Value")
			end
		},
		Pregnant = {
			DisplayName = "Has Child",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 199 ]]
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
			Changed = function(p1) --[[ Changed | Line: 217 ]]
				return { p1.SlotValue.Child:GetPropertyChangedSignal("Value"), p1.NameLabel:GetPropertyChangedSignal("Text") }
			end
		},
		Size = {
			DisplayName = "Size",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 227 | Upvalues: v7 (copy) ]]
				local SizeMultiplier = v7.GetSize(p1.SlotValue).SizeMultiplier
				local SizeMultiplier_2 = v7.GetSize(p2.SlotValue).SizeMultiplier
				if p3 then
					return SizeMultiplier < SizeMultiplier_2
				else
					return SizeMultiplier_2 < SizeMultiplier
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 236 ]]
				return p1.SlotValue.SizeType:GetPropertyChangedSignal("Value")
			end
		},
		Species = {
			DisplayName = "Species",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 243 ]]
				local Species = p1.SlotValue.Species.Value
				local Species_2 = p2.SlotValue.Species.Value
				if p3 then
					return Species < Species_2
				else
					return Species_2 < Species
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 253 ]]
				return p1.SlotValue.Species:GetPropertyChangedSignal("Value")
			end
		}
	}
	local t5 = {}
	t5.TextBox = ContainerFrame.Menu.Content[if v21 == "Storage" then "StoredSearchBar" else "SearchBar"].Content.TextBox
	function t5.Run(p1, p2) --[[ Run | Line: 261 ]]
		return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
	end
	t4.Search = t5
	t2[v21] = v6.new(t4)
end
local function setStorageCapacityLabel() --[[ setStorageCapacityLabel | Line: 268 | Upvalues: v18 (copy), ContainerFrame (copy) ]]
	pcall(function() --[[ Line: 269 | Upvalues: v18 (ref), ContainerFrame (ref) ]]
		local v1 = v18:GetItemLimit("Animals")
		local v2 = v18:GetItemLimit("AnimalStorage")
		ContainerFrame.Menu.Content.StorageCapacity.Content.TextLabel.Text = v1.Get() .. "/" .. v1.GetLimit()
		ContainerFrame.Menu.Content.BoardingStorageCapacity.Content.TextLabel.Text = v2.Get() .. "/" .. v2.GetLimit()
	end)
end
local function createAnimal(p1, p2) --[[ createAnimal | Line: 277 | Upvalues: v9 (copy), LocalPlayer (copy), ContainerFrame (copy), v8 (copy), v5 (copy), v18 (copy), v12 (copy), v4 (copy), v17 (copy), Sonar (copy), v13 (copy), v20 (ref), v11 (copy), t (ref), t2 (copy), v10 (copy) ]]
	local v1, v2
	if not p2 then
		task.wait(0.5)
	end
	v1 = v9.new({
		SlotValue = p1,
		Owner = LocalPlayer,
		ParentFrame = ContainerFrame.Menu.Content.Horses,
		Disabled = {
			Storage = true
		}
	})
	v1:GiveTask(v8.new(v1.Frame, {
		Click = function() --[[ Click | Line: 292 | Upvalues: v5 (ref), v18 (ref), p1 (copy), v12 (ref), v4 (ref), v17 (ref), Sonar (ref), v13 (ref), v20 (ref), v11 (ref) ]]
			local v1 = v5:CanStoreSlot(v18, p1, not p1.InStorage.Value)
			if v1 ~= true then
				v12.NotifyIssue(v1)
				return
			end
			if p1.InStorage.Value then
				if not v5:HasUnlockedStorage(v18) then
					v4.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 303 | Upvalues: v17 (ref), v18 (ref), Sonar (ref), v13 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = "To take out horses, complete " .. v17.SpeciesNeededForStorage .. " species unlocks in your journal!"
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							local t = {}
							for v1, v2 in v18.PlayerData.Missions.SpeciesUnlocks:GetChildren() do
								table.insert(t, v2.Completed:GetPropertyChangedSignal("Value"))
							end
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 318 | Upvalues: v13 (ref) ]]
									return v13.suffix(p1) .. "/" .. v13.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 322 | Upvalues: v18 (ref) ]]
									local count = 0
									for v1, v2 in v18.PlayerData.Missions.SpeciesUnlocks:GetChildren() do
										if v2.Completed.Value then
											count = count + 1
										end
									end
									return count
								end,
								GetMax = function() --[[ GetMax | Line: 330 | Upvalues: v17 (ref) ]]
									return v17.SpeciesNeededForStorage
								end,
								Changed = t
							}))
						end,
						Run = function() --[[ Run | Line: 336 ]]
							return true
						end
					})
					return
				end
			elseif not (v5:HasUnlockedStorage(v18) or v20) then
				v4.Prompt({
					Type = "ConfirmAnimalStorage",
					Setup = function(p1) --[[ Setup | Line: 347 | Upvalues: v17 (ref) ]]
						p1.Content.Description.Text = "Complete " .. v17.SpeciesNeededForStorage .. " species unlocks to take horses out of Boarding Storage."
					end,
					Run = function() --[[ Run | Line: 350 | Upvalues: v20 (ref), v11 (ref), p1 (ref) ]]
						v20 = true
						v11.GetRemoteEvent("StoreAnimalRemote"):FireServer(p1.Name, not p1.InStorage.Value)
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 355 ]]
						return true
					end
				})
				return
			end
			v11.GetRemoteEvent("StoreAnimalRemote"):FireServer(p1.Name, not p1.InStorage.Value)
		end
	}))
	v2 = function(p12) --[[ setInStorage | Line: 369 | Upvalues: t (ref), p1 (copy), t2 (ref), v1 (copy), ContainerFrame (ref), v10 (ref), v18 (ref) ]]
		if not p12 then
			for k, v in pairs(t) do
				if v[p1] then
					v[p1] = nil
					t2[k]:Remove(v1, p12)
				end
			end
		end
		local v12 = if p1.InStorage.Value then "Storage" else "NotStorage"
		local v2 = v12 == "Storage" and ContainerFrame.Menu.Content.StoredHorses or ContainerFrame.Menu.Content.Horses
		v1.Frame.Parent = v10.IsMobileInputType() and v2:FindFirstChild("ContentMobile") or v2:FindFirstChild("Content")
		for k, v in pairs(v2:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Visible = v1.Frame.Parent == v
			end
		end
		t[v12][p1] = v1
		t2[v12]:Add(v1, p12)
		if p12 then
			return
		end
		pcall(function() --[[ Line: 269 | Upvalues: v18 (ref), ContainerFrame (ref) ]]
			local v1 = v18:GetItemLimit("Animals")
			local v2 = v18:GetItemLimit("AnimalStorage")
			ContainerFrame.Menu.Content.StorageCapacity.Content.TextLabel.Text = v1.Get() .. "/" .. v1.GetLimit()
			ContainerFrame.Menu.Content.BoardingStorageCapacity.Content.TextLabel.Text = v2.Get() .. "/" .. v2.GetLimit()
		end)
	end
	v1:GiveTask(p1.InStorage:GetPropertyChangedSignal("Value"):Connect(v2))
	v2(true)
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 402 | Upvalues: t (ref), t2 (copy) ]]
	for k, v in pairs(t) do
		if v[p1] then
			t2[k]:Remove(v[p1])
			v[p1]:Destroy()
			v[p1] = nil
		end
	end
end
function t3.OnClose(p1) --[[ OnClose | Line: 414 | Upvalues: v1 (copy), ContainerFrame (copy), t3 (copy) ]]
	if v1.MainFrameOpen ~= ContainerFrame then
		return
	end
	t3.Close(true)
end
function t3.Cleanup(p1) --[[ Cleanup | Line: 420 | Upvalues: t (ref), t2 (copy), v19 (copy), v1 (copy), ContainerFrame (copy) ]]
	for k, v in pairs(t) do
		for k2, v2 in pairs(v) do
			t2[k]:Remove(v2)
			v2:Destroy()
		end
	end
	t = {
		Storage = {},
		NotStorage = {}
	}
	v19:DoCleaning()
	v1.CleanContents(ContainerFrame)
end
function t3.Open(...) --[[ Open | Line: 437 | Upvalues: v1 (copy), ContainerFrame (copy), t3 (copy) ]]
	if v1.IsFrameOpen(ContainerFrame) then
		t3.Close()
	else
		v1.OpenMainFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t3.Close(p1) --[[ Close | Line: 449 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.CloseFrame(ContainerFrame, {})
	v1.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t3.OnOpen(p1, p2) --[[ OnOpen | Line: 458 | Upvalues: v1 (copy), ContainerFrame (copy), v2 (copy), v4 (copy), v7 (copy), v18 (copy), v13 (copy), v14 (copy), v11 (copy), v12 (copy), v5 (copy), v15 (copy), v19 (copy), setStorageCapacityLabel (copy), removeAnimal (copy), createAnimal (copy), t2 (copy) ]]
	local v16 = v1.getFrameFromInstance(ContainerFrame)
	if not v16.Opened then
		v16.Opened = true
		v2.new(ContainerFrame.Menu.Content.StorageCapacity.Button, {
			Click = function() --[[ Click | Line: 465 | Upvalues: v4 (ref), v7 (ref), v18 (ref), v13 (ref), v14 (ref), v2 (ref), v11 (ref), v12 (ref) ]]
				v4.Prompt({
					Type = "UpgradeStorage",
					Setup = function(p1, p2) --[[ Setup | Line: 468 | Upvalues: v7 (ref), v18 (ref), v13 (ref), v14 (ref), v2 (ref), v11 (ref) ]]
						local v1 = v7.GetStorageSlotPurchase(v18)
						if v1 then
							p1.Content.Price.TextLabel.Text = v13.splice(v1.Price)
							p1.Content.Price.Visible = true
							p1.Content.Label.Visible = true
							p1.Content.MaxLabel.Visible = false
						else
							p1.Content.Price.Visible = false
							p1.Content.Label.Visible = false
							p1.Content.MaxLabel.Visible = true
						end
						local function setRobuxPurchase() --[[ setRobuxPurchase | Line: 481 | Upvalues: v7 (ref), v18 (ref), v14 (ref), p1 (copy) ]]
							local v1 = v7.GetStorageSlotPurchase(v18, "Robux")
							if not v1 then
								p1.RobuxPurchase.Visible = false
								return
							end
							local v2 = v14.GetProductInfo(v1.ProductId, Enum.InfoType.Product)
							p1.RobuxPurchase.Content.RobuxLabel.Text = "\238\128\130" .. (if v2 then v2.PriceInRobux or "N/A" else "N/A")
							p1.RobuxPurchase.Content.Label.Text = "+" .. v1.Amount .. " Stable Slots"
							p1.RobuxPurchase.Visible = true
						end
						p2.Maid:GiveTask(v2.new(p1.RobuxPurchase.Content.BuyButton, {
							Click = function() --[[ Click | Line: 495 | Upvalues: v7 (ref), v18 (ref), v11 (ref) ]]
								if not v7.GetStorageSlotPurchase(v18, "Robux") then
									return
								end
								v11.GetRemoteFunction("PurchaseStorageSlotsRemote"):InvokeServer("Robux")
							end
						}))
						p2.Maid:GiveTask(v18.PlayerData.StorageTiersPurchased.RobuxTiersPurchased:GetPropertyChangedSignal("Value"):Connect(setRobuxPurchase))
						setRobuxPurchase()
					end,
					Run = function() --[[ Run | Line: 506 | Upvalues: v7 (ref), v18 (ref), v12 (ref), v11 (ref) ]]
						local v1 = v7.GetStorageSlotPurchase(v18)
						if not v1 then
							return true
						end
						if v18:CanAfford(v1.Price, v1.Currency) then
							return v11.GetRemoteFunction("PurchaseStorageSlotsRemote"):InvokeServer("Free")
						else
							return v12.NotifyIssue("CantAffordStableUpgrade")
						end
					end,
					Cancel = function() --[[ Cancel | Line: 516 ]]
						return true
					end
				})
			end
		})
		v2.new(ContainerFrame.Menu.Content.BoardingStorageCapacity.Button, {
			Click = function() --[[ Click | Line: 524 | Upvalues: v4 (ref), v5 (ref), v18 (ref), v13 (ref), v15 (ref), v14 (ref), v2 (ref), v11 (ref), v12 (ref) ]]
				v4.Prompt({
					Type = "UpgradeAnimalStorage",
					Setup = function(p1, p2) --[[ Setup | Line: 527 | Upvalues: v5 (ref), v18 (ref), v13 (ref), v15 (ref), v14 (ref), v2 (ref), v11 (ref) ]]
						local v1 = v5.GetAnimalStorageSlotPurchase(v18)
						if v1 then
							p1.Content.Label.Text = string.format("Increase Stable Storage Capacity by %s slots?", v13.suffix(v1.Amount))
							for k, v in pairs(v1.Stats) do
								p1.Content[k].TextLabel.Text = v13.suffix(v18:GetStatValue(k).Value) .. "/" .. v13.suffix(v) .. " " .. v15.separateWordsInString(k)
								p1.Content[k].Visible = true
							end
							p1.Content.Price.TextLabel.Text = v13.splice(v1.Price)
							p1.Content.Price.Visible = true
							p1.Content.Label.Visible = true
							p1.Content.MaxLabel.Visible = false
						else
							p1.Content.ReplayQuestsCompleted.Visible = false
							p1.Content.Label.Visible = false
							p1.Content.Price.Visible = false
							p1.Content.MaxLabel.Visible = true
						end
						local function setRobuxPurchase() --[[ setRobuxPurchase | Line: 546 | Upvalues: v5 (ref), v18 (ref), v14 (ref), p1 (copy) ]]
							local v1 = v5.GetAnimalStorageSlotPurchase(v18, "Robux")
							if not v1 then
								p1.RobuxPurchase.Visible = false
								return
							end
							local v2 = v14.GetProductInfo(v1.ProductId, Enum.InfoType.Product)
							p1.RobuxPurchase.Content.RobuxLabel.Text = "\238\128\130" .. (if v2 then v2.PriceInRobux or "N/A" else "N/A")
							p1.RobuxPurchase.Content.Label.Text = "+" .. v1.Amount .. " Storage Capacity"
							p1.RobuxPurchase.Visible = true
						end
						p2.Maid:GiveTask(v2.new(p1.RobuxPurchase.Content.BuyButton, {
							Click = function() --[[ Click | Line: 560 | Upvalues: v5 (ref), v18 (ref), v11 (ref) ]]
								if not v5.GetAnimalStorageSlotPurchase(v18, "Robux") then
									return
								end
								v11.GetRemoteFunction("PurchaseAnimalStorageSlotsRemote"):InvokeServer("Robux")
							end
						}))
						p2.Maid:GiveTask(v18.PlayerData.AnimalStorageTiersPurchased.RobuxTiersPurchased:GetPropertyChangedSignal("Value"):Connect(setRobuxPurchase))
						setRobuxPurchase()
					end,
					Run = function() --[[ Run | Line: 571 | Upvalues: v5 (ref), v18 (ref), v12 (ref), v11 (ref) ]]
						local v1 = v5.GetAnimalStorageSlotPurchase(v18)
						if not v1 then
							return true
						end
						if v1.Stats then
							for k, v in pairs(v1.Stats) do
								if v18:GetStatValue(k).Value < v then
									return v12.NotifyIssue("NotEnoughStats")
								end
							end
						end
						if v1.Price and not v18:CanAfford(v1.Price, v1.Currency) then
							return v12.NotifyIssue("CantAffordStableUpgrade")
						else
							return v11.GetRemoteFunction("PurchaseAnimalStorageSlotsRemote"):InvokeServer("Free")
						end
					end,
					Cancel = function() --[[ Cancel | Line: 591 ]]
						return true
					end
				})
			end
		})
	end
	if v16.ContentsLoaded then
		return
	end
	v16.ContentsLoaded = true
	v19:GiveTask(v18.MaxSlotsChangedSignal:Connect(setStorageCapacityLabel))
	for k, v in pairs({ "ChildAdded", "ChildRemoved" }) do
		v19:GiveTask(v18:GetItemFolder("Animals")[v]:Connect(setStorageCapacityLabel))
	end
	v19:GiveTask(v18:GetItemFolder("Animals").ChildRemoved:Connect(removeAnimal))
	v19:GiveTask(v18:GetItemFolder("Animals").ChildAdded:Connect(createAnimal))
	for k, v in pairs(v18:GetItemFolder("Animals"):GetChildren()) do
		createAnimal(v, true)
	end
	pcall(function() --[[ Line: 269 | Upvalues: v18 (ref), ContainerFrame (ref) ]]
		local v1 = v18:GetItemLimit("Animals")
		local v2 = v18:GetItemLimit("AnimalStorage")
		ContainerFrame.Menu.Content.StorageCapacity.Content.TextLabel.Text = v1.Get() .. "/" .. v1.GetLimit()
		ContainerFrame.Menu.Content.BoardingStorageCapacity.Content.TextLabel.Text = v2.Get() .. "/" .. v2.GetLimit()
	end)
	for v22, v3 in t2 do
		v3:Sort(v3.SortType or "Alphabet")
	end
end
function t3.Init(p1) --[[ Init | Line: 621 | Upvalues: v1 (copy), ContainerFrame (copy), t3 (copy), v2 (copy), Sonar (copy), v16 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 630 | Upvalues: t3 (ref) ]]
		t3:OnOpen(...)
	end)
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 633 | Upvalues: t3 (ref) ]]
		t3:OnClose()
	end)
	v1.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 636 | Upvalues: t3 (ref) ]]
		t3:Cleanup()
	end)
	v2.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 641 | Upvalues: t3 (ref) ]]
			t3.Close()
		end
	})
	Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("AnimalStorage"):WaitForChild("InteractPart"), {
		ShowHintLabel = true,
		Hint = "Open",
		Run = function() --[[ Run | Line: 648 | Upvalues: v16 (ref), t3 (ref) ]]
			if v16.CanDoActionInTutorial("InteractZones") then
				t3.Open()
			end
		end,
		GetRange = function() --[[ GetRange | Line: 655 ]]
			return 25
		end
	})
end
t3:Init()
return t3