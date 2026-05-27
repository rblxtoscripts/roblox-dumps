-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Button")
local v2 = Sonar("FormatString")
local v3 = Sonar("GameState")
local v4 = Sonar("GuiUtils")
local v5 = Sonar("InputTypeDetector")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("Maid")
local v8 = Sonar("MarketplaceUtils")
local v9 = Sonar("PlayerWrapper")
local v10 = Sonar("Signal")
local v11 = Sonar("StorageUtils")
local v12 = Sonar("TimeUtils")
Sonar(v11.Get("Products"))
local v13 = v8.GetDeveloperProducts()
local v14 = v9.GetClient()
local HUDGui = Players.LocalPlayer.PlayerGui:WaitForChild("HUDGui")
local PromoButton = HUDGui.RightFrame.Other.ButtonsFrame.LeftFrame.PromoButton
local PromoButton_2 = HUDGui.MobileRightFrame.Core.Other.PromoButton
local PromoFrame = PromoButton.PromoFrame
local Default = PromoFrame.Default
Default.Visible = false
PromoFrame.Active = true
PromoFrame.Visible = false
local CloseLabel = PromoButton.CloseLabel
local v15 = false
local v16 = false
local v17 = false
local v18 = 0
local v19 = false
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local v20 = v7.new()
local v21 = v7.new()
t.OpenBundleSignal = v10.new()
local function updateOpenState() --[[ updateOpenState | Line: 69 | Upvalues: PromoButton (copy), v16 (ref), CloseLabel (copy) ]]
	PromoButton.HeaderLabel.Visible = not v16
	PromoButton.HoverUpLabel.Visible = not v16
	CloseLabel.Visible = v16
end
local function setOpen(p1) --[[ setOpen | Line: 76 | Upvalues: v16 (ref), PromoButton (copy), CloseLabel (copy) ]]
	v16 = p1
	PromoButton.HeaderLabel.Visible = not p1
	PromoButton.HoverUpLabel.Visible = not p1
	CloseLabel.Visible = p1
end
local function updatePromoFrameParent() --[[ updatePromoFrameParent | Line: 82 | Upvalues: PromoFrame (copy), v5 (copy), PromoButton_2 (copy), PromoButton (copy) ]]
	PromoFrame.Parent = v5.IsMobileInputType() and PromoButton_2 or PromoButton
	PromoFrame.Position = v5.IsMobileInputType() and UDim2.new(0.5, 0, 1, 12) or UDim2.new(0.5, 0, -1, -12)
	PromoFrame.UIGridLayout.VerticalAlignment = v5.IsMobileInputType() and Enum.VerticalAlignment.Top or Enum.VerticalAlignment.Bottom
end
local function setupComingSoonOverlay(p1, p2) --[[ setupComingSoonOverlay | Line: 89 ]]
	local v1 = if p2.IsComingSoon == true then true else false
	local HoverUpLabel = p1.HoverUpLabel
	HoverUpLabel.QuestionMark.Visible = v1
	HoverUpLabel.ImageColor3 = if v1 then Color3.new() else Color3.new(255/255, 255/255, 255/255)
end
local function setupOnClick(p1) --[[ setupOnClick | Line: 98 | Upvalues: t (copy) ]]
	if p1.ProductType then
		function p1.onClick() --[[ Line: 103 | Upvalues: p1 (copy), t (ref) ]]
			if p1.IsComingSoon ~= true then
				t.OpenBundleSignal:Fire(p1.Tab)
				t.ClosePromoFrame()
			end
		end
	end
end
local function isPromoUnlocked(p1, p2) --[[ isPromoUnlocked | Line: 114 ]]
	return not p1.UnlockTime or p1.UnlockTime <= p2
end
local function isPromoExpired(p1, p2) --[[ isPromoExpired | Line: 119 ]]
	return p1.RemoveTime and p1.RemoveTime <= p2 and true or false
end
local function isPromoPromoted(p1) --[[ isPromoPromoted | Line: 124 ]]
	return p1.Promote
end
local function createPromotionEntry(p1, p2) --[[ createPromotionEntry | Line: 129 | Upvalues: v2 (copy), Default (copy), v6 (copy), t3 (copy), Sonar (copy), v11 (copy), PromoFrame (copy), v14 (copy), v1 (copy), v17 (ref), v16 (ref), t (copy) ]]
	local v12 = if p2.World then "World Pack" else v2.separateWordsInString(p1)
	local v3 = Default:Clone()
	v3.HeaderLabel.Title.Text = p2.PromoTitle or v12
	if p2.RotateItemImages or p2.ProductType and p2.RotateProductTypeImages then
		local v4 = Random.new()
		local t2 = {}
		local v5 = nil
		if p2.RotateItemImages then
			for v62 in p2.Items do
				local v7 = v6.GetByName(v62)
				local v8 = if v7 then v7.Image else v7
				if v8 then
					t3[v62] = v8
					table.insert(t2, v8)
				end
			end
		elseif p2.RotateProductTypeImages then
			for v9, v10 in Sonar(v11.Get(p2.ProductType)) do
				table.insert(t2, v10.Image)
				if v10.ProductImages then
					for v112, v122 in v10.ProductImages do
						table.insert(t2, v122)
					end
				end
			end
		end
		for v13, v142 in t2 do
			t3[("Item%*"):format(v13)] = v142
		end
		local v15 = task.spawn(function() --[[ Line: 175 | Upvalues: v4 (copy), t2 (copy), v5 (ref), v3 (ref) ]]
			while true do
				local v1
				repeat
					v1 = v4:NextInteger(1, #t2)
					task.wait()
				until v1 ~= v5
				v5 = v1
				v3.HoverUpLabel.Image = t2[v1]
				task.wait(3)
			end
		end)
		if p2.onDestroy == nil then
			p2.onDestroy = {}
		end
		table.insert(p2.onDestroy, function() --[[ Line: 193 | Upvalues: v15 (copy) ]]
			task.cancel(v15)
		end)
	else
		local v162 = t3[p1]
		v3.HoverUpLabel.Image = if type(v162) == "function" then v162() else v162
	end
	v3.LayoutOrder = p2.LayoutOrder or v3.LayoutOrder
	v3.Name = v12
	v3.Visible = true
	v3.Parent = PromoFrame
	p2.Button = v3
	local Notification = v3:FindFirstChild("Notification")
	if Notification then
		Notification.Visible = p2.New == true
	end
	local v19 = v3
	local v20 = if p2.IsComingSoon == true then true else false
	local HoverUpLabel = v19.HoverUpLabel
	HoverUpLabel.QuestionMark.Visible = v20
	HoverUpLabel.ImageColor3 = if v20 then Color3.new() else Color3.new(255/255, 255/255, 255/255)
	local NotificationLabel = v3:FindFirstChild("NotificationLabel")
	if NotificationLabel then
		v14.AlertsWrapper:ConnectUIToAlert(NotificationLabel, p1)
	end
	if p2.PromoteChanged ~= nil then
		local v222 = p2.PromoteChanged:Connect(function() --[[ Line: 222 | Upvalues: v3 (ref), p2 (copy) ]]
			v3.Visible = p2.Promote
		end)
		if p2.onDestroy == nil then
			p2.onDestroy = {}
		end
		table.insert(p2.onDestroy, function() --[[ Line: 230 | Upvalues: v222 (ref) ]]
			if not v222 then
				return
			end
			v222:Disconnect()
			v222 = nil
		end)
	end
	if p2.onClick ~= nil then
		v1.new(v3)
		v1:RegisterClick(v3, function() --[[ Line: 243 | Upvalues: v17 (ref), v16 (ref), p2 (copy), v3 (ref), t (ref) ]]
			if not v17 and v16 then
				p2.onClick(v3)
				t.ClosePromoFrame()
			end
		end)
	end
end
local function updatePromoButton() --[[ updatePromoButton | Line: 255 | Upvalues: v20 (copy), PromoButton (copy), t3 (copy), PromoButton_2 (copy) ]]
	v20:DoCleaning()
	if not PromoButton.Visible then
		return
	end
	local t = {}
	for v1, v2 in t3 do
		table.insert(t, { v1, v2 })
	end
	v20:GiveTask(task.defer(function() --[[ Line: 268 | Upvalues: t3 (ref), PromoButton (ref), PromoButton_2 (ref) ]]
		local v1 = nil
		while true do
			local v2
			local v3 = Random.new()
			local t = {}
			for v4, v5 in t3 do
				if typeof(v5) == "string" then
					table.insert(t, v5)
				end
			end
			repeat
				v2 = v3:NextInteger(1, #t)
				task.wait()
			until v2 ~= v1
			local v6 = t[v2]
			v1 = v2
			for v7, v8 in { PromoButton, PromoButton_2 } do
				local HoverUpLabel = v8:FindFirstChild("HoverUpLabel")
				if HoverUpLabel then
					HoverUpLabel.Image = v6
				end
			end
			task.wait(3)
		end
	end))
end
local function setupPromoItems() --[[ setupPromoItems | Line: 306 | Upvalues: t2 (copy), createPromotionEntry (copy), updatePromoButton (copy) ]]
	for v1, v2 in t2 do
		createPromotionEntry(v1, v2)
	end
	updatePromoButton()
end
local function hasNewPromotions() --[[ hasNewPromotions | Line: 315 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		if v2.New then
			return true
		end
	end
	return false
end
local function updateMainButtonNotification() --[[ updateMainButtonNotification | Line: 326 | Upvalues: t2 (copy), PromoButton (copy), PromoButton_2 (copy) ]]
	local v1 = false
	for v2, v3 in t2 do
		if v3.New then
			v1 = true
			break
		end
	end
	for v4, v5 in { PromoButton, PromoButton_2 } do
		v5.Notification.Visible = v1
	end
end
function t.OpenPromoFrame() --[[ OpenPromoFrame | Line: 335 | Upvalues: v19 (ref), t2 (copy), createPromotionEntry (copy), updatePromoButton (copy), v16 (ref), PromoButton (copy), CloseLabel (copy), v17 (ref), v18 (ref), PromoButton_2 (copy), PromoFrame (copy) ]]
	if not v19 then
		for v1, v2 in t2 do
			createPromotionEntry(v1, v2)
		end
		updatePromoButton()
	end
	v16 = true
	PromoButton.HeaderLabel.Visible = not v16
	PromoButton.HoverUpLabel.Visible = not v16
	CloseLabel.Visible = v16
	v17 = true
	v18 = v18 + 1
	local v3 = v18
	local count = 0
	for v4, v5 in t2 do
		local Button = v5.Button
		if v5.onOpen ~= nil then
			v5.onOpen(Button)
		end
		if v5.New then
			v5.New = nil
			local Notification = Button:FindFirstChild("Notification")
			if Notification then
				Notification.Visible = false
			end
		end
		if Button.Visible then
			count = count + 1
		end
	end
	local v6 = false
	for v7, v8 in t2 do
		if v8.New then
			v6 = true
			break
		end
	end
	for v9, v10 in { PromoButton, PromoButton_2 } do
		v10.Notification.Visible = v6
	end
	PromoFrame.Visible = true
	task.delay(0, function() --[[ Line: 374 | Upvalues: v18 (ref), v3 (copy), v17 (ref) ]]
		if v18 == v3 then
			v17 = false
		end
	end)
	v19 = true
end
local function setupPromoButton(p1) --[[ setupPromoButton | Line: 386 | Upvalues: v1 (copy), v17 (ref), t (copy) ]]
	v1.new(p1)
	v1:RegisterClick(p1, function() --[[ Line: 388 | Upvalues: v17 (ref), t (ref) ]]
		if v17 then
			return
		end
		if t.IsPromoFrameOpen() then
			t.ClosePromoFrame()
		else
			t.OpenPromoFrame()
		end
	end)
end
local function addPromoToActiveList(p1, p2) --[[ addPromoToActiveList | Line: 402 | Upvalues: t2 (copy), t3 (copy), t (copy), v19 (ref), createPromotionEntry (copy), updatePromoButton (copy) ]]
	t2[p1] = table.clone(p2)
	local v1 = p2.PromoImage or (if type(p2.Image) == "function" then p2.Image() else p2.Image)
	t3[p1] = if typeof(v1) == "number" then ("rbxassetid://%*"):format(v1) else v1
	if p2.ProductType then
		function p2.onClick() --[[ Line: 103 | Upvalues: p2 (copy), t (ref) ]]
			if p2.IsComingSoon ~= true then
				t.OpenBundleSignal:Fire(p2.Tab)
				t.ClosePromoFrame()
			end
		end
	end
	if v19 then
		createPromotionEntry(p1, p2)
	end
	updatePromoButton()
end
local function removePromoFromActiveList(p1) --[[ removePromoFromActiveList | Line: 428 | Upvalues: t2 (copy), t3 (copy), updatePromoButton (copy) ]]
	local v1 = t2[p1]
	if not v1 then
		return
	end
	t2[p1] = nil
	t3[p1] = nil
	if v1.Button then
		v1.Button:Destroy()
		v1.Button = nil
	end
	if v1.onDestroy == nil then
		updatePromoButton()
		return
	end
	for v2, v3 in v1.onDestroy do
		v3()
	end
	updatePromoButton()
end
local function checkTimedPromotions(p1) --[[ checkTimedPromotions | Line: 452 | Upvalues: t4 (copy), addPromoToActiveList (copy), t5 (copy), removePromoFromActiveList (copy) ]]
	for i = #t4, 1, -1 do
		local v1 = t4[i]
		local data = v1.data
		if not data.UnlockTime or (if data.UnlockTime <= p1 then true else false) then
			table.remove(t4, i)
			addPromoToActiveList(v1.name, v1.data)
		end
	end
	for j = #t5, 1, -1 do
		local v3
		local v4 = t5[j]
		local data = v4.data
		v3 = data.RemoveTime and data.RemoveTime <= p1 and true or false
		if v3 then
			table.remove(t5, j)
			removePromoFromActiveList(v4.name)
		end
	end
end
local function initializePromotions() --[[ initializePromotions | Line: 471 | Upvalues: v13 (copy), v12 (copy), t4 (copy), addPromoToActiveList (copy), t5 (copy), t2 (copy), PromoButton (copy), PromoButton_2 (copy) ]]
	for v2, v3 in v13 do
		local v1
		if v3.Promote then
			local v4 = v3.Name or v3.BundleName
			if v3.Header and (v3.Header.NameLabel and v3.Header.NameLabel.Text) then
				v4 = v3.Header.NameLabel.Text
			end
			local v5 = v12.Get()
			local v6
			if v3.UnlockTime then
				if not v3.UnlockTime or (if v3.UnlockTime <= v5 then true else false) then
					if v3.RemoveTime then
						v1 = v3.RemoveTime and v3.RemoveTime <= v5 and true or false
						if not v1 and (not v3.Developer or v3.IsComingSoon == true) then
							addPromoToActiveList(v4, v3)
							if v3.RemoveTime then
								v6 = t5
								table.insert(t5, {
									name = v4,
									data = v3
								})
							end
						end
					elseif not v3.Developer or v3.IsComingSoon == true then
						addPromoToActiveList(v4, v3)
						if v3.RemoveTime then
							v6 = t5
							table.insert(t5, {
								name = v4,
								data = v3
							})
						end
					end
					continue
				end
				table.insert(t4, {
					name = v4,
					data = v3
				})
			elseif v3.RemoveTime then
				v1 = v3.RemoveTime and v3.RemoveTime <= v5 and true or false
				if not v1 and (not v3.Developer or v3.IsComingSoon == true) then
					addPromoToActiveList(v4, v3)
					if v3.RemoveTime then
						v6 = t5
						table.insert(t5, {
							name = v4,
							data = v3
						})
					end
				end
			elseif not v3.Developer or v3.IsComingSoon == true then
				addPromoToActiveList(v4, v3)
				if v3.RemoveTime then
					v6 = t5
					table.insert(t5, {
						name = v4,
						data = v3
					})
				end
			end
		end
	end
	local v9 = false
	for v10, v11 in t2 do
		if v11.New then
			v9 = true
			break
		end
	end
	for v122, v132 in { PromoButton, PromoButton_2 } do
		v132.Notification.Visible = v9
	end
end
function t.CreateCustomButton(p1) --[[ CreateCustomButton | Line: 511 | Upvalues: v12 (copy), t4 (copy), addPromoToActiveList (copy), t5 (copy), t2 (copy), PromoButton (copy), PromoButton_2 (copy) ]]
	local v1 = v12.Get()
	local v2 = p1.Name
	p1.IsCustom = true
	if p1.UnlockTime and (p1.UnlockTime and not (if p1.UnlockTime <= v1 then true else false)) then
		table.insert(t4, {
			name = v2,
			data = p1
		})
		return
	end
	if p1.RemoveTime and (p1.RemoveTime and p1.RemoveTime <= v1) then
		return
	end
	addPromoToActiveList(v2, p1)
	if p1.RemoveTime then
		table.insert(t5, {
			name = v2,
			data = p1
		})
	end
	local v7 = false
	for v8, v9 in t2 do
		if v9.New then
			v7 = true
			break
		end
	end
	for v10, v11 in { PromoButton, PromoButton_2 } do
		v11.Notification.Visible = v7
	end
end
function t.GetPromotionEntries() --[[ GetPromotionEntries | Line: 536 | Upvalues: t2 (copy) ]]
	return t2
end
function t.IsPromoFrameOpen() --[[ IsPromoFrameOpen | Line: 541 | Upvalues: v16 (ref) ]]
	return v16
end
function t.ClosePromoFrame() --[[ ClosePromoFrame | Line: 546 | Upvalues: t (copy), v16 (ref), PromoButton (copy), CloseLabel (copy), v17 (ref), v18 (ref), t2 (copy), TweenService (copy), Default (copy), PromoFrame (copy) ]]
	if not t.IsPromoFrameOpen() then
		return
	end
	v16 = false
	PromoButton.HeaderLabel.Visible = not v16
	PromoButton.HoverUpLabel.Visible = not v16
	CloseLabel.Visible = v16
	v17 = true
	v18 = v18 + 1
	local v1 = v18
	for v2, v3 in t2 do
		local Button = v3.Button
		TweenService:Create(Button, TweenInfo.new(0), {
			Position = Default.Position,
			Size = Default.Size
		}):Play()
		if v3.onClose ~= nil then
			v3.onClose(Button)
		end
	end
	task.delay(0, function() --[[ Line: 569 | Upvalues: v18 (ref), v1 (copy), PromoFrame (ref), v17 (ref) ]]
		if v18 == v1 then
			PromoFrame.Visible = false
			v17 = false
		end
	end)
end
function t.CreatePromoHudButton() --[[ CreatePromoHudButton | Line: 580 | Upvalues: v15 (ref), PromoButton (copy), PromoButton_2 (copy), v1 (copy), v17 (ref), t (copy), v3 (copy), v4 (copy) ]]
	if v15 then
		return
	end
	v15 = true
	for v12, v2 in { PromoButton, PromoButton_2 } do
		v1.new(v2)
		v1:RegisterClick(v2, function() --[[ Line: 388 | Upvalues: v17 (ref), t (ref) ]]
			if v17 then
				return
			end
			if t.IsPromoFrameOpen() then
				t.ClosePromoFrame()
			else
				t.OpenPromoFrame()
			end
		end)
	end
	v3:subscribe(function() --[[ Line: 591 | Upvalues: v4 (ref), PromoButton (ref), PromoButton_2 (ref) ]]
		local v1 = v4.GetGameState("Promo")
		for v2, v3 in { PromoButton, PromoButton_2 } do
			v3.Parent.Visible = v1
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 600 | Upvalues: v5 (copy), updatePromoFrameParent (copy), v21 (copy), v12 (copy), checkTimedPromotions (copy), initializePromotions (copy), PromoButton (copy), updatePromoButton (copy) ]]
	v5.InputTypeChanged:Connect(updatePromoFrameParent)
	updatePromoFrameParent()
	v21:GiveTask(v12.AttachToTime(function(p1) --[[ Line: 604 | Upvalues: checkTimedPromotions (ref) ]]
		checkTimedPromotions(p1)
	end))
	initializePromotions()
	PromoButton:GetPropertyChangedSignal("Visible"):Connect(updatePromoButton)
	updatePromoButton()
end
t:Init()
return t