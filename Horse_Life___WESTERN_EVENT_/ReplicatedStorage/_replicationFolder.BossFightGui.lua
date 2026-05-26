-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InteractZone")
local v2 = Sonar("TimeUtils")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("Maid")
local v7 = Sonar("GridSort")
local v8 = Sonar("Button")
local v9 = Sonar("GuiManager")
local v10 = Sonar("ButtonTest")
local v11 = Sonar("GuiUtils")
local v12 = Sonar("TabManager")
local v13 = Sonar("AnimalGridButton")
local v14 = Sonar("ItemGridButton")
local v15 = Sonar("ItemDataService")
local v16 = Sonar("ToolTipClient")
local v17 = Sonar("Table")
local v18 = Sonar("NotificationsClient")
local v19 = Sonar("BossService")
local v20 = Sonar("MarketplaceUtils")
local v21 = Sonar("TeleportService")
local v22 = Sonar("Constants")
local v23 = Sonar("PlayerWrapper").GetClient()
local LocalPlayer = game.Players.LocalPlayer
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("BossGui").ContainerFrame
local LuckPower = v23.PlayerData.BossFight.LuckPower
local v24 = v23:GetItemFolder("Animals")
local v25 = v6.new()
local t2 = {}
local t3 = {}
local v26 = 0
local v27 = nil
local function TeleportPlayerToTotem() --[[ TeleportPlayerToTotem | Line: 53 | Upvalues: LocalPlayer (copy), v21 (copy), v18 (copy) ]]
	local MobSpawns = workspace:FindFirstChild("MobSpawns")
	if not MobSpawns then
		return
	end
	local BossSpawn = MobSpawns:FindFirstChild("BossSpawn")
	if not BossSpawn then
		return
	end
	local Character = LocalPlayer.Character
	if Character and Character.PrimaryPart then
		v21.TeleportToPosition(BossSpawn.Position + Vector3.new(math.random(-50, 50), 10, math.random(-50, 50)), {
			Transition = true,
			StopMovement = true,
			PivotTo = true,
			OnTeleported = function() --[[ OnTeleported | Line: 74 | Upvalues: v18 (ref) ]]
				v18.Notify({
					Message = "You were teleported back to the boss fight!",
					Type = "BossTeleport",
					Preset = "Yellow"
				})
			end
		})
	end
end
local function CreateBossArenaZone() --[[ CreateBossArenaZone | Line: 84 | Upvalues: v27 (ref), v1 (copy), v23 (copy), TeleportPlayerToTotem (copy) ]]
	if not v27 then
		v27 = v1.GetOrCreateZone({
			Type = "BossArena",
			OnLeave = function() --[[ OnLeave | Line: 89 | Upvalues: v23 (ref), TeleportPlayerToTotem (ref) ]]
				if not (v23:IsInAction("BossFight") or v23:IsInAction("GlobalBossFight")) then
					return
				end
				TeleportPlayerToTotem()
			end
		})
	end
end
local v28 = v6.new()
local v29 = v7.new({
	Priority = {
		{
			Priority = -1,
			Run = function(p1) --[[ Run | Line: 106 ]]
				return p1:HasLayoutUnableReason()
			end,
			Changed = function(p1) --[[ Changed | Line: 109 ]]
				return p1.UnableChangedSignal
			end
		}
	},
	Sorts = {
		Alphabet = {
			DisplayName = "Name",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 119 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				if p3 then
					return v2 < v1
				else
					return v1 < v2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 130 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		}
	}
})
local function selectAnimalToGive(p1) --[[ selectAnimalToGive | Line: 137 | Upvalues: t3 (ref), v17 (copy), v23 (copy), v5 (copy), t2 (ref), ContainerFrame (copy), v3 (copy), v22 (copy) ]]
	if not p1 then
		ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.LuckLabel.Text = v3.percentage(v17.Count(t3) * v22.BossLuckPower.Horse) .. "%"
		ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.Description.Text = string.format("You are donating %s horses(s)", v17.Count(t3))
		return
	end
	if t3[p1] then
		t3[p1] = nil
		t2[p1]:Deselect()
	else
		if v17.Count(t3) + 1 == #v23:GetItemFolder("Animals"):GetChildren() then
			v5.NotifyIssue("CantDonateLastHorse")
			return
		end
		if p1.Favorite.Value then
			v5.NotifyIssue("CantDonateFavoriteHorse")
			return
		end
		t3[p1] = true
		t2[p1]:Select()
	end
	ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.LuckLabel.Text = v3.percentage(v17.Count(t3) * v22.BossLuckPower.Horse) .. "%"
	ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.Description.Text = string.format("You are donating %s horses(s)", v17.Count(t3))
end
local function createAnimal(p1, p2) --[[ createAnimal | Line: 169 | Upvalues: v13 (copy), LocalPlayer (copy), ContainerFrame (copy), v8 (copy), selectAnimalToGive (copy), t2 (ref), v29 (copy) ]]
	local v1
	if p2 then
		v1 = v13.new({
			IgnoreBackgroundColor = true,
			SlotValue = p1,
			Owner = LocalPlayer,
			ParentFrame = ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.Horses,
			UnableCheck = {
				ListenForValueAttributes = true,
				Changed = {},
				Get = function() --[[ Get | Line: 182 | Upvalues: p1 (copy) ]]
					if p1.Favorite.Value then
						return "CantDonateFavoriteHorse"
					else
						return true
					end
				end,
				Reasons = {}
			}
		})
		v1:GiveTask(v8.new(v1.Frame, {
			Click = function() --[[ Click | Line: 193 | Upvalues: selectAnimalToGive (ref), p1 (copy) ]]
				selectAnimalToGive(p1)
			end
		}))
		t2[p1] = v1
		v29:Add(v1, p2)
		return
	end
	task.wait(0.5)
	v1 = v13.new({
		IgnoreBackgroundColor = true,
		SlotValue = p1,
		Owner = LocalPlayer,
		ParentFrame = ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.Horses,
		UnableCheck = {
			ListenForValueAttributes = true,
			Changed = {},
			Get = function() --[[ Get | Line: 182 | Upvalues: p1 (copy) ]]
				if p1.Favorite.Value then
					return "CantDonateFavoriteHorse"
				else
					return true
				end
			end,
			Reasons = {}
		}
	})
	v1:GiveTask(v8.new(v1.Frame, {
		Click = function() --[[ Click | Line: 193 | Upvalues: selectAnimalToGive (ref), p1 (copy) ]]
			selectAnimalToGive(p1)
		end
	}))
	t2[p1] = v1
	v29:Add(v1, p2)
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 203 | Upvalues: t2 (ref), v29 (copy) ]]
	if t2[p1] then
		v29:Remove(t2[p1])
		t2[p1]:Destroy()
		t2[p1] = nil
	end
end
function t.OnClose(p1) --[[ OnClose | Line: 216 | Upvalues: t2 (ref), t3 (ref), selectAnimalToGive (copy), v26 (ref), ContainerFrame (copy), v9 (copy), t (copy) ]]
	for k, v in pairs(t2) do
		v:Deselect()
	end
	t3 = {}
	selectAnimalToGive()
	v26 = 0
	ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Coins.DonateContainer.TextContainer.TextBox.Text = ""
	ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Coins.LuckLabel.Text = "0%"
	if v9.MainFrameOpen ~= ContainerFrame then
		return
	end
	t.Close(true)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 233 | Upvalues: t2 (ref), v29 (copy), v28 (copy), v25 (copy), v9 (copy), ContainerFrame (copy) ]]
	for k, v in pairs(t2) do
		if t2[k] then
			v29:Remove(t2[k])
			t2[k]:Destroy()
			t2[k] = nil
		end
	end
	t2 = {}
	v28:DoCleaning()
	v25:DoCleaning()
	v9.CleanContents(ContainerFrame)
end
function t.Open(...) --[[ Open | Line: 245 | Upvalues: v9 (copy), ContainerFrame (copy), t (copy) ]]
	if v9.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v9.OpenFrame(ContainerFrame, {
			CloseAll = "CloseOverlay",
			CallbackArgs = { ... }
		})
	end
end
function t.Close(p1) --[[ Close | Line: 257 | Upvalues: v9 (copy), ContainerFrame (copy) ]]
	v9.CloseFrame(ContainerFrame, {})
	v9.OpenHUD({
		DoNotCloseMainFrame = p1
	})
end
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 266 | Upvalues: v9 (copy), ContainerFrame (copy), v3 (copy), LuckPower (copy), v25 (copy), v12 (copy), v11 (copy), v10 (copy), t3 (ref), v4 (copy), selectAnimalToGive (copy), v18 (copy), v20 (copy), LocalPlayer (copy), v19 (copy), v23 (copy), v26 (ref), v22 (copy), v24 (copy), removeAnimal (copy), createAnimal (copy), v29 (copy), v28 (copy), v2 (copy), t (copy), v6 (copy), v15 (copy), v14 (copy), v8 (copy), v16 (copy), Sonar (copy) ]]
	local v1 = v9.getFrameFromInstance(ContainerFrame)
	if not v1.Opened then
		v1.Opened = true
		local function setLuckPowerLabel() --[[ setLuckPowerLabel | Line: 271 | Upvalues: ContainerFrame (ref), v3 (ref), LuckPower (ref) ]]
			ContainerFrame.Menu.Content.BossFrame.LuckContainer.LuckLabel.Text = v3.percentage(LuckPower.Value) .. "%"
			if LuckPower.Value >= 100 then
				ContainerFrame.Menu.Content.BossFrame.LuckContainer.MaxLuck.Visible = false
			else
				ContainerFrame.Menu.Content.BossFrame.LuckContainer.MaxLuck.Visible = true
			end
		end
		v25:GiveTask(LuckPower:GetPropertyChangedSignal("Value"):Connect(setLuckPowerLabel))
		setLuckPowerLabel()
		for k, v in pairs(ContainerFrame.Menu.Content.DonationsFrame.TabButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				local v27 = ContainerFrame.Menu.Content.DonationsFrame.TabFrames:FindFirstChild(v.Name)
				if v27 then
					v12.AddTab(v27, {
						ParentFrame = ContainerFrame,
						Button = v
					})
					local function setColor() --[[ setColor | Line: 293 | Upvalues: v11 (ref), v (copy), v12 (ref), v27 (copy) ]]
						v11.SetButtonColor(v, "Diagonal", if v12.IsTabOpen(v27) then "Purple" else "Blue")
					end
					v12.AddStateCallback(v27, "OnOpen", setColor)
					v12.AddStateCallback(v27, "OnClose", setColor)
					v10.new(v, {
						Click = function() --[[ Click | Line: 301 | Upvalues: v12 (ref), v27 (copy) ]]
							v12.OpenTab(v27)
						end
					})
				end
			end
		end
		v10.new(ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses.DonateButton, {
			Click = function() --[[ Click | Line: 309 | Upvalues: t3 (ref), v4 (ref), selectAnimalToGive (ref), v18 (ref) ]]
				local t = {}
				for k, v in pairs(t3) do
					table.insert(t, k.Name)
				end
				if not next(t) then
					return
				end
				if not v4.GetRemoteFunction("BossDonateSlotsRemote"):InvokeServer(t) then
					return
				end
				t3 = {}
				selectAnimalToGive()
				v18.Notify({
					Preset = "Green",
					Message = string.format("Successfully donated %s horse(s) to the Totem!", #t)
				})
			end
		})
		v10.new(ContainerFrame.Menu.Content.BossFrame.LuckContainer.MaxLuck, {
			Click = function() --[[ Click | Line: 329 | Upvalues: v20 (ref), LocalPlayer (ref) ]]
				v20.PromptPurchase(LocalPlayer, 3405955284, "Product")
			end
		})
		v11.CreateInputTextBox(ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Coins.DonateContainer.TextContainer.TextBox, function(p1, p2, p3) --[[ Line: 334 | Upvalues: v19 (ref), v23 (ref), v26 (ref), v3 (ref), v22 (ref), ContainerFrame (ref) ]]
			if p2 and #tostring(p2) > 0 then
				local v1 = v19.GetCoinAmountToDonate(v23, p2, not p3)
				v26 = v3.roundToNearestMultiple(v1, v22.BossLuckPower.Coins.Rate)
				p1.Text = if p3 then v3.splice(v1) else v1
			else
				v26 = 0
			end
			ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Coins.LuckLabel.Text = v3.percentage(v26 / v22.BossLuckPower.Coins.Rate * v22.BossLuckPower.Coins.Power) .. "%"
		end, true)
		v10.new(ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Coins.DonateButton, {
			Click = function() --[[ Click | Line: 351 | Upvalues: v26 (ref), v4 (ref), v18 (ref), v3 (ref), ContainerFrame (ref) ]]
				if v26 <= 0 then
					return
				end
				if not v4.GetRemoteFunction("BossDonateCoinsRemote"):InvokeServer(v26) then
					return
				end
				v18.Notify({
					Preset = "Green",
					Message = string.format("Successfully donated %s Coins to the Totem!", v3.splice(v26))
				})
				v26 = 0
				ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Coins.DonateContainer.TextContainer.TextBox.Text = ""
			end
		})
		v12.OpenTab(ContainerFrame.Menu.Content.DonationsFrame.TabFrames.Horses)
	end
	if not v1.ContentsLoaded then
		v1.ContentsLoaded = true
		v25:GiveTask(v24.ChildRemoved:Connect(removeAnimal))
		v25:GiveTask(v24.ChildAdded:Connect(createAnimal))
		for k, v in pairs(v24:GetChildren()) do
			createAnimal(v, true)
		end
		v29:Sort("Alphabet")
	end
	selectAnimalToGive()
	v28:DoCleaning()
	local function setTimerLabel() --[[ setTimerLabel | Line: 384 | Upvalues: p2 (copy), v2 (ref), v22 (ref), ContainerFrame (ref) ]]
		ContainerFrame.Menu.Content.Timer.TextLabel.Text = "Starts in " .. v2.FormatString(p2.Object:GetAttribute("BossTimestamp") and p2.Object:GetAttribute("BossTimestamp") - v2.Get() or v22.BossFightWarningDuration)
	end
	v28:GiveTask(p2.Object:GetAttributeChangedSignal("BossTimestamp"):Connect(setTimerLabel))
	v28:GiveTask(v2.AttachToTime(setTimerLabel))
	setTimerLabel()
	v28:GiveTask(p2.Object:GetAttributeChangedSignal("BossSpawned"):Connect(function() --[[ Line: 392 | Upvalues: t (ref) ]]
		t.Close()
	end))
	local v32 = v6.new()
	local function setBossTier() --[[ setBossTier | Line: 397 | Upvalues: v32 (copy), p2 (copy), v22 (ref), ContainerFrame (ref), v15 (ref), v14 (ref), v8 (ref), v16 (ref) ]]
		v32:DoCleaning()
		local v1 = p2.Object:GetAttribute("BossTier")
		local v2 = p2.Object:GetAttribute("BossType") or ""
		ContainerFrame.Menu.Content.BossFrame.BossInfo.BossTierLabel.Text = (if v2 == "" then "SPIRIT" else v2:upper()) .. " TIER " .. v1
		ContainerFrame.Menu.Content.BossFrame.BossInfo.DescriptionLabel.Text = string.format("All participants will earn <stroke color=\"#c3612f\" joins=\"miter\" thickness=\"2\" transparency=\"0\"><font color=\"#ffe16a\">%s REWARD(S)!</font></stroke>", 5 + (v1 - 1) * 2)
		ContainerFrame.Menu.Content.BossFrame.BossInfo.NextTierLabel.Text = (v22[v2 .. "BossTierAmounts"] or v22.BossTierAmounts)[p2.Object:GetAttribute("BossTier") + 1] and "TIER " .. v1 + 1 or "MAX TIER"
		for k, v in pairs((v22["BossTier" .. v1] or v22.BossTier1).Drops) do
			if v15.GetByName(v.Name) then
				local v7 = v14.new({
					ForceVisible = true,
					Item = v15.GetByName(v.Name),
					ParentFrame = ContainerFrame.Menu.Content.BossFrame.AllRewards,
					GetAmount = function() --[[ GetAmount | Line: 421 | Upvalues: v (copy) ]]
						return v.Amount
					end
				})
				local ChanceLabel = v7.Frame:FindFirstChild("ChanceLabel", true)
				if v.P then
					ChanceLabel.Text = v.P .. "%"
					ChanceLabel.Visible = true
				else
					ChanceLabel.Visible = false
				end
				v7.Frame.LayoutOrder = -v.P
				v7:GiveTask(v8.new(v7.Frame, {
					Click = function() --[[ Click | Line: 437 | Upvalues: v16 (ref), v7 (copy), v15 (ref), v (copy) ]]
						v16:CreateToolTip({
							Type = "ItemDescription",
							Offset = Vector2.new(0.65, 0.5),
							GuiObject = v7.Frame,
							Get = function() --[[ Get | Line: 442 | Upvalues: v15 (ref), v (ref) ]]
								return v15.GetByName(v.Name)
							end
						})
					end
				}))
				v32:GiveTask(v7)
			end
		end
	end
	v28:GiveTask(v32)
	v28:GiveTask(p2.Object:GetAttributeChangedSignal("BossTier"):Connect(setBossTier))
	setBossTier()
	v28:GiveTask(Sonar("StatBar").new({
		TweenAmount = false,
		Clipped = false,
		Frame = ContainerFrame.Menu.Content.BossFrame.BossInfo.ProgressBar.Fill,
		AmountLabel = ContainerFrame.Menu.Content.BossFrame.BossInfo.ProgressBar.ValueLabel,
		GetText = function(p1, p2) --[[ GetText | Line: 461 | Upvalues: v3 (ref) ]]
			return v3.percentage(p1 / p2 * 100) .. "%"
		end,
		Get = function() --[[ Get | Line: 465 | Upvalues: p2 (copy), v22 (ref) ]]
			local v1 = v22[(p2.Object:GetAttribute("BossType") or "") .. "BossTierAmounts"] or v22.BossTierAmounts
			if v1[p2.Object:GetAttribute("BossTier") + 1] then
				local v2 = v1[p2.Object:GetAttribute("BossTier")] or 0
				return p2.Object:GetAttribute("BossDonations") - v2
			else
				return 1
			end
		end,
		GetMax = function() --[[ GetMax | Line: 476 | Upvalues: p2 (copy), v22 (ref) ]]
			local v1 = v22[(p2.Object:GetAttribute("BossType") or "") .. "BossTierAmounts"] or v22.BossTierAmounts
			local v2 = v1[p2.Object:GetAttribute("BossTier") + 1]
			if v2 then
				return v2 - (v1[p2.Object:GetAttribute("BossTier")] or 0)
			else
				return 1
			end
		end,
		Changed = { p2.Object:GetAttributeChangedSignal("BossTier"), p2.Object:GetAttributeChangedSignal("BossDonations") }
	}))
	if not (LuckPower.Value > 0) then
		return
	end
	v4.GetRemoteEvent("BossJoinRemote"):FireServer()
end
function t.Init(p1) --[[ Init | Line: 498 | Upvalues: v9 (copy), ContainerFrame (copy), t (copy), v10 (copy), Sonar (copy) ]]
	v9.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v9.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 507 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v9.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 510 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v9.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 513 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v10.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 518 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v10.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 523 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("BossFight")
		end
	})
end
if v27 then
	t:Init()
	return t
end
v27 = v1.GetOrCreateZone({
	Type = "BossArena",
	OnLeave = function() --[[ OnLeave | Line: 89 | Upvalues: v23 (copy), TeleportPlayerToTotem (copy) ]]
		if not (v23:IsInAction("BossFight") or v23:IsInAction("GlobalBossFight")) then
			return
		end
		TeleportPlayerToTotem()
	end
})
t:Init()
return t