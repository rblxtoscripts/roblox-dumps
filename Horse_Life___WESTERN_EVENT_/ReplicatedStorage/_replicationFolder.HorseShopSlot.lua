-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("HorseShopService")
local v2 = Sonar("InteractMenu")
local v3 = Sonar("DisplayAnimalClient")
local v4 = Sonar("AnimalDataService")
local v5 = Sonar("Maid")
local v6 = Sonar("TimeUtils")
local v7 = Sonar("IssueResponseClient")
local v8 = Sonar("MarketplaceUtils")
local v9 = Sonar("NotificationsClient")
local v10 = Sonar("FormatNumber")
local v11 = Sonar("InfoOverlayGui")
local v12 = Sonar("spr")
local v13 = Sonar("Binder")
local v14 = Sonar("AnimalRiggerService")
local v15 = Sonar("MutationUtils")
local v16 = Sonar("InteractZone")
local v17 = Sonar("PromptClient")
local v18 = Sonar("PremiumShopGui")
local v19 = Sonar("ItemDataService")
local v20 = Sonar("DisplayUtils")
local v21 = Sonar("TutorialService")
local v22 = Sonar("Constants")
local v23 = Sonar("PlaceTypeService")
local t2 = {
	Piaffe = true,
	HappyStomp = true,
	HeadShake = true,
	HoofDig = true,
	LegRest = true
}
local v24 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 41 | Upvalues: t (copy), v5 (copy), v22 (copy), v1 (copy), v24 (copy), v11 (copy), v10 (copy), v19 (copy), v17 (copy), v4 (copy), v20 (copy), Sonar (copy), v18 (copy), v7 (copy), v8 (copy), v3 (copy), v9 (copy), v6 (copy), v2 (copy), v21 (copy), v12 (copy) ]]
	local v23 = setmetatable({}, t)
	v23.Maid = v5.new()
	v23.SlotType = p1:GetAttribute("ShopType") or "Default"
	if v23.SlotType == "Event" and not v22.EventName then
		return v23
	end
	v23.IsEventShop = if v23.SlotType == "Event" then true elseif v23.SlotType == "ExclusiveEvent" then true else false
	v23.LastUpdate = tick()
	v23.SlotMaid = v5.new()
	v23.Maid:GiveTask(v23.SlotMaid)
	v23.Model = p1
	v23.Timer = v1.RefreshTimers[v23.SlotType]
	v23.SlotValue = v1.GetPurchasedSlotValue(v24, v23.SlotType, p1.Name)
	v23.SlotData = v1.GetSlotFromIndex(v23.SlotType, p1.Name)
	v23.SlotIndex = tonumber(p1.Name)
	v23.BillboardGui = p1:WaitForChild("BillboardGui")
	v23.BillboardFrame = v23.BillboardGui:WaitForChild("Frame")
	v23.SpawnPart = p1:WaitForChild("Spawn")
	v23.InteractPart = p1:WaitForChild("Interact")
	local function viewSlot(p1) --[[ viewSlot | Line: 71 | Upvalues: v11 (ref), v23 (copy), v10 (ref), v1 (ref), v24 (ref), v19 (ref), v17 (ref), v4 (ref), v20 (ref), Sonar (ref), v22 (ref), v18 (ref), v7 (ref), v8 (ref), v3 (ref) ]]
		v11.Open({
			HeadViewport = true,
			SpeciesAsName = true,
			SlotValue = p1,
			Disabled = {
				Pedigree = true,
				InfoPopup = true,
				Favorite = true,
				Birthday = true
			},
			ActionButtons = {
				HorseShopBuy = {
					Setup = function(p1) --[[ Setup | Line: 85 | Upvalues: v23 (ref), v10 (ref), v1 (ref), v24 (ref), v19 (ref) ]]
						if v23.Product.ProductId then
							p1.Top.TextLabel.Text = v23.BillboardFrame.Robux.Robux.Text
							p1.Top.CurrencyIcon.Visible = false
						else
							p1.Top.TextLabel.Text = v10.splice(v1.GetPriceForSlot(v24, v23.SlotType, v23.SlotIndex))
							local v2 = v19.GetByName(v23.SlotData.Currency or "Coins")
							p1.Top.CurrencyIcon.Visible = true
							p1.Top.CurrencyIcon.Image = v2.Image
						end
					end,
					Run = function() --[[ Run | Line: 98 | Upvalues: v1 (ref), v24 (ref), v23 (ref), v17 (ref), v4 (ref), p1 (copy), v20 (ref), Sonar (ref), v22 (ref), v18 (ref), v7 (ref), v8 (ref), v3 (ref) ]]
						local v12 = v1.CanPurchaseSlot(v24, v23.SlotType, v23.SlotIndex)
						if v12 == true or (v12 ~= "LockedSpecies" or v23.Product.ProductId) and v12 == "LockedSpecies" then
							if v23.Product.ProductId then
								v8.PromptPurchase(v24.Player, v23.Product.ProductId, "Product")
								return
							end
							local v2 = v1:PurchaseSlot(v23.SlotType, v23.SlotIndex)
							if v2 then
								task.spawn(function() --[[ Line: 143 | Upvalues: v3 (ref), v23 (ref), v22 (ref), v24 (ref), v2 (copy) ]]
									local t = {
										Type = "Purchased",
										AllowNaming = true,
										ShowMaxWarning = true,
										MobileClickBackgroundToClose = true
									}
									t.Currency = v23.IsEventShop and v22.EventCurrencyName
									t.Slot = v24:GetItemFolder("Animals"):WaitForChild(v2)
									v3:DisplaySlot(t)
								end)
								return true
							end
						else
							if v12 == "LockedSpecies" then
								v17.Prompt({
									Type = "LockedJournal",
									Setup = function(p12) --[[ Setup | Line: 106 | Upvalues: v23 (ref), v4 (ref), p1 (ref), v20 (ref) ]]
										if v23.IsEventShop then
											p12.Content.Description.Text = "To buy this species you must complete the #5 Alces Quests!"
										else
											local v1 = v4.GetByName(p1.Species.Value)
											p12.Content.Description.Text = string.format("To buy this species you must complete the %s Quests!", v20.GetDisplayName(v1.Name, v1))
										end
									end,
									Run = function() --[[ Run | Line: 114 | Upvalues: v23 (ref), Sonar (ref) ]]
										if v23.IsEventShop then
											return true
										end
										Sonar("JournalGui").Open("Horses")
										return true
									end,
									Cancel = function() --[[ Cancel | Line: 121 ]]
										return true
									end
								})
								return
							end
							if v12 == "CannotAfford" and (not v22.EventCurrencyName or v23.SlotData.Currency ~= v22.EventCurrencyName) then
								v18.Open("Coins")
								return true
							else
								v7.NotifyIssue(v12)
							end
						end
					end
				}
			}
		})
	end
	local function canViewSlot() --[[ canViewSlot | Line: 162 | Upvalues: v23 (copy), v9 (ref), v6 (ref) ]]
		if v23.SlotType == "ExclusiveEvent" and not v23.Timer:IsActive() then
			v9.Notify({
				Preset = "Red",
				Message = string.format("The stables is not open yet, come back in %s!", v6.FormatString(v23.Timer:GetTimeUntilNextChange())),
				Type = "OpenShopSlot" .. v23.SlotIndex
			})
		else
			return true
		end
	end
	local v52 = v2.new(v23.InteractPart, {
		ShowHintLabel = true,
		Hint = "Unlock",
		Run = function() --[[ Run | Line: 178 | Upvalues: v21 (ref), v24 (ref), v9 (ref), canViewSlot (copy), v1 (ref), v23 (copy), viewSlot (copy) ]]
			if not v21.HasCompletedPrimaryTutorial(v24) then
				v9.Notify({
					Message = "You must complete the tutorial to interact with the horse shop!",
					Preset = "Red"
				})
				return
			end
			if not v21.CanDoActionInTutorial("InteractZones") then
				return
			end
			if canViewSlot() then
				viewSlot(v1.CreateOrGetSlotInfo(v24, v23.SlotType, v23.SlotIndex)[1])
			end
		end,
		GetRange = function() --[[ GetRange | Line: 196 ]]
			return 25
		end,
		OnFocus = function() --[[ OnFocus | Line: 201 | Upvalues: v12 (ref), v23 (copy) ]]
			v12.target(v23.BillboardFrame, 1, 5, {
				Size = UDim2.new(0.7, 0, 0.7, 0)
			})
		end,
		OnUnfocus = function() --[[ OnUnfocus | Line: 204 | Upvalues: v12 (ref), v23 (copy) ]]
			v12.target(v23.BillboardFrame, 1, 8, {
				Size = UDim2.new(0.5, 0, 0.5, 0)
			})
		end,
		OpenBranch = function() --[[ OpenBranch | Line: 207 | Upvalues: v21 (ref), v1 (ref), v24 (ref), v23 (copy) ]]
			if not v21.GetGameState("InteractZones") then
				return
			end
			return #v1.CreateOrGetSlotInfo(v24, v23.SlotType, v23.SlotIndex) > 1
		end
	})
	for i = 1, 2 do
		local v62 = if i == 1 then "Male" else "Female"
		v52:_addOption({
			Hint = function() --[[ Hint | Line: 215 | Upvalues: v62 (copy) ]]
				local v1 = v62
				local v2 = nil
				if v62 == "Both" then
					return v1, v2, "\226\173\149\239\184\143"
				end
				if v62 == "Male" then
					return v1, v2, "\226\153\130\239\184\143"
				else
					return v1, v2, "\226\153\128\239\184\143"
				end
			end,
			Run = function() --[[ Run | Line: 218 | Upvalues: canViewSlot (copy), v1 (ref), v24 (ref), v23 (copy), viewSlot (copy), i (copy) ]]
				if canViewSlot() then
					viewSlot(v1.CreateOrGetSlotInfo(v24, v23.SlotType, v23.SlotIndex)[i])
				end
			end
		})
	end
	v23.Maid:GiveTask(v52)
	v23.Maid:GiveTask(v23.SlotValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 228 | Upvalues: v23 (copy) ]]
		v23:Update()
	end))
	local v72 = v23.SlotType == "Event" and v24.EventData.HorseShop or (v23.SlotType == "ExclusiveEvent" and v24.EventData.ExclusiveHorseShop or v24.PlayerData.HorseShop)
	v23.Maid:GiveTask(v72.LastSeed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 235 | Upvalues: v23 (copy) ]]
		v23:Update()
	end))
	v23:Update()
	return v23
end
function t.Destroy(p1) --[[ Destroy | Line: 243 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Update(p1) --[[ Update | Line: 248 ]]
	local v1 = tick()
	p1.LastUpdate = v1
	task.wait()
	if v1 ~= p1.LastUpdate then
		return
	end
	p1.SlotMaid:DoCleaning()
	for k, v in pairs(p1:CreateVisualModel()) do
		p1.SlotMaid:GiveTask(v)
	end
	p1:SetSlotInfo()
end
function t.SetSlotInfo(p1) --[[ SetSlotInfo | Line: 263 | Upvalues: v1 (copy), v24 (copy), v4 (copy), v20 (copy), v8 (copy), v19 (copy), v10 (copy) ]]
	local v12 = v1.CreateOrGetSlotInfo(v24, p1.SlotType, p1.SlotIndex)
	if #v12 == 1 then
		p1.Product = p1.SlotData
		local v2 = v4.GetGender(v12[1])
		local v3 = v4.GetByName(v12[1].Species.Value)
		p1.BillboardFrame.InfoFrame.Species.Text = (if v2 == "Both" then "\226\173\149\239\184\143" elseif v2 == "Male" then "\226\153\130\239\184\143" else "\226\153\128\239\184\143") .. " " .. v20.GetDisplayName(v3.Name, v3) .. " "
		p1.BillboardFrame.InfoFrame.Species.BreedingPair.Enabled = false
	else
		p1.Product = p1.SlotData.BreedingPair
		p1.BillboardFrame.InfoFrame.Species.Text = "\226\153\130\239\184\143 Duo Pair \226\153\128\239\184\143"
		p1.BillboardFrame.InfoFrame.Species.BreedingPair.Enabled = true
	end
	p1.BillboardFrame:WaitForChild("Coins").Visible = not p1.Product.ProductId
	p1.BillboardFrame:WaitForChild("Robux").Visible = p1.Product.ProductId
	if p1.Product.ProductId then
		local v6 = v8.GetProductInfo(p1.Product.ProductId, Enum.InfoType.Product)
		p1.BillboardFrame.Robux.Robux.Text = "\238\128\130" .. (if v6 then v6.PriceInRobux or "N/A" else "N/A")
	end
	if p1.Product.ProductId then
		return
	end
	local v9 = v19.GetByName(p1.SlotData.Currency or "Coins")
	p1.BillboardFrame.Coins.Price.TextLabel.Text = v10.splice(v1.GetPriceForSlot(v24, p1.SlotType, p1.SlotIndex))
	if v9.Name == "Coins" then
		return
	end
	p1.BillboardFrame.Coins.Price.IconLabel.Image = v9.Image
	p1.BillboardFrame.Coins.Price.IconLabel.IconLabel.Image = p1.BillboardFrame.Coins.Price.IconLabel.Image
	p1.BillboardFrame.Coins.Price.TextLabel.UIGradient.Color = v9.UIGradient.Color
end
function t.CreateVisualModel(p1) --[[ CreateVisualModel | Line: 299 | Upvalues: v1 (copy), v24 (copy), v14 (copy), v4 (copy), v22 (copy), t2 (copy), v15 (copy) ]]
	local v12 = v1.CreateOrGetSlotInfo(v24, p1.SlotType, p1.SlotIndex, true)
	local t = {}
	for k, v in pairs(v12) do
		local SlotInfo = v:Clone()
		local v2, v3 = v14.CreateAnimalModel({
			ForceAdult = true,
			SlotValue = SlotInfo,
			PlayerWrapper = v24
		})
		v3:GiveTask(v2)
		local v42 = v4.GetByName(SlotInfo.Species.Value)
		SlotInfo.Name = "SlotInfo"
		SlotInfo.Parent = v2
		for v5, v6 in v2:GetDescendants() do
			if v6:IsA("BasePart") then
				v6.Massless = true
				v6.CanCollide = false
				v6.CanTouch = false
				v6.CanQuery = false
				v6.EnableFluidForces = false
				if v6.Name ~= "RootPart" then
					v6.RootPriority = -127
				end
			end
		end
		v2:ScaleTo((v4.GetScale(SlotInfo)))
		local v8 = p1.SpawnPart.CFrame * CFrame.new(if #v12 == 1 then 0 elseif k == 1 then 3 else -3, 0, 0)
		v2:PivotTo(v8 + Vector3.new(0, v2.HumanoidRootPart.Size.Y / 2 - (v2.HumanoidRootPart.Position - v2.PrimaryPart.Position).Y, 0))
		local Eyelid = v2:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		v2.PrimaryPart.CanCollide = false
		v2.PrimaryPart.Anchored = true
		v2.PrimaryPart.BodyVelocity:Destroy()
		v2.PrimaryPart.BodyGyro:Destroy()
		v2:AddTag(v22.AnimalWithCosmeticsTag)
		v2.Parent = p1.Model
		local v10 = v2:FindFirstChild("AnimationController") or Instance.new("AnimationController", v2)
		local Animation = Instance.new("Animation")
		Animation.AnimationId = v42.Animations.Idle
		local v11 = v10:LoadAnimation(Animation)
		Animation:Destroy()
		local t3 = {}
		for v122, v13 in v42.Animations do
			if t2[v122] then
				local Animation_2 = Instance.new("Animation")
				Animation_2.AnimationId = v13
				table.insert(t3, v10:LoadAnimation(Animation_2))
				Animation_2:Destroy()
			end
		end
		task.spawn(function() --[[ Line: 367 | Upvalues: v2 (copy), t3 (copy), v11 (copy) ]]
			local v1 = nil
			while v2.Parent do
				if v1 then
					v1:Stop()
				end
				v1 = t3[math.random(#t3)]
				v1:Play()
				task.wait(v1.Length)
				v11:Play()
				task.wait(math.random(2, 6))
			end
		end)
		task.defer(function() --[[ Line: 381 | Upvalues: v15 (ref), SlotInfo (copy), v2 (copy), v (copy), v22 (ref) ]]
			local v1 = v15.GetMutationOfType(SlotInfo, "Wings")
			if not v1 then
				return
			end
			local v23 = v2:WaitForChild(v1.Name)
			local v3 = v23:FindFirstChild("AnimationController") or Instance.new("AnimationController", v23)
			local Animation = Instance.new("Animation")
			Animation.AnimationId = v:WaitForChild("UpliftedWings").Value and (v1.Animations.UPLIFTED_WING_IDLE_ANIMATION or v22.UPLIFTED_WING_IDLE_ANIMATION) or v1.Animations.Idle
			local v5 = v3:LoadAnimation(Animation)
			v5.Priority = Enum.AnimationPriority.Action4
			v5:Play()
			Animation:Destroy()
		end)
		t[k] = v3
	end
	return t
end
function t.Init(p1) --[[ Init | Line: 404 | Upvalues: v13 (copy), t (copy), v9 (copy), v11 (copy), v3 (copy), v22 (copy), v24 (copy), v16 (copy), v23 (copy), v6 (copy), v1 (copy) ]]
	v13.new("HorseShopSlot", t):Init()
	v9.AddNotificationCallback("PurchasedHorseShopSlot", function(p1) --[[ Line: 407 | Upvalues: v11 (ref), v3 (ref), v22 (ref), v24 (ref) ]]
		task.wait()
		v11.Close()
		for k, v in pairs(p1[1]) do
			local t = {
				Type = "Purchased",
				AllowNaming = true,
				ShowMaxWarning = true,
				MobileClickBackgroundToClose = true
			}
			t.Currency = if p1[2] == "Event" then v22.EventCurrencyName else false
			t.Slot = v24:GetItemFolder("Animals"):WaitForChild(v)
			v3:DisplaySlot(t)
			if v3.YieldForNoDisplay() then
				task.wait(0.5)
			end
		end
	end)
	local HorseShop = workspace:WaitForChild("Interactions"):FindFirstChild("HorseShop")
	local v12 = HorseShop and HorseShop:WaitForChild("TimerSign")
	if v12 then
		local function setTimerLabel() --[[ setTimerLabel | Line: 431 | Upvalues: v16 (ref), v23 (ref), v12 (copy), v6 (ref), v1 (ref) ]]
			if v16.IsInZone("Town") or v23.IsMarketWorld() then
				v12.SurfaceGui.TimerLabel.Text = v6.FormatString(v1.RefreshTimer:GetTime())
				v12.SurfaceGui.Enabled = true
			else
				v12.SurfaceGui.Enabled = false
			end
		end
		v1.RefreshTimer.TimeChanged:Connect(setTimerLabel)
		setTimerLabel()
	end
	local v2 = v22.EventName and workspace:WaitForChild("Interactions"):FindFirstChild("EventHorseShop")
	if v2 and v22.EventHasHorseShopTimer then
		local TimerSign = v2:WaitForChild("TimerSign")
		local function setTimerLabel() --[[ setTimerLabel | Line: 449 | Upvalues: TimerSign (copy), v6 (ref), v1 (ref) ]]
			TimerSign.SurfaceGui.TimerLabel.Text = v6.FormatString(v1.RefreshTimers.Event:GetTime())
			TimerSign.SurfaceGui.Enabled = true
		end
		v1.RefreshTimers.Event.TimeChanged:Connect(setTimerLabel)
		TimerSign.SurfaceGui.TimerLabel.Text = v6.FormatString(v1.RefreshTimers.Event:GetTime())
		TimerSign.SurfaceGui.Enabled = true
	end
	local v32 = v22.EventName and workspace:WaitForChild("Interactions"):FindFirstChild("EventExclusiveHorseShop")
	if not v32 then
		return
	end
	local TimerSign = v32:WaitForChild("TimerSign")
	local ExclusiveEvent = v1.RefreshTimers.ExclusiveEvent
	local function setTimerLabel() --[[ setTimerLabel | Line: 462 | Upvalues: v16 (ref), v22 (ref), ExclusiveEvent (copy), TimerSign (copy), v6 (ref) ]]
		if not (v16.IsInZone("Town") or v22.IsEventWorld) then
			TimerSign.SurfaceGui.Enabled = false
			return
		end
		if ExclusiveEvent:IsActive() then
			TimerSign.SurfaceGui.TextLabel.Text = "CLOSES IN"
		else
			TimerSign.SurfaceGui.TextLabel.Text = "OPENS IN"
		end
		TimerSign.SurfaceGui.TimerLabel.Text = v6.FormatString(ExclusiveEvent:GetTimeUntilNextChange())
		TimerSign.SurfaceGui.Enabled = true
	end
	ExclusiveEvent.TimeChanged:Connect(setTimerLabel)
	ExclusiveEvent.StateChanged:Connect(setTimerLabel)
	setTimerLabel()
end
t:Init()
return t