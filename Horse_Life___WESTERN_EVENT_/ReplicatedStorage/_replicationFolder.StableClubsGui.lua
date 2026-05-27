-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("GuiManager")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("InstanceUtils")
local v5 = Sonar("TabManager")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("IssueResponseClient")
local v8 = Sonar("StableClubsService")
local v9 = Sonar("Maid")
local v10 = Sonar("spr")
local v11 = Sonar("StableClubLeaderboardGui")
local v12 = Sonar("NotificationsClient")
local v13 = Sonar("TimeFormat")
local v14 = Sonar("EventUtils")
local v15 = Sonar("PlayerUtils")
local v16 = Sonar("DisplayUtils")
local v17 = Sonar("Table")
local v18 = Sonar("MarketplaceUtils")
local v19 = Sonar("PromptClient")
local v20 = Sonar("Club")
local v21 = Sonar("FormatNumber")
local v22 = Sonar("ItemDataService")
local v23 = Sonar("ItemGridButton")
local v24 = Sonar("ClubShopGui")
local v25 = Sonar("MissionsService")
local v26 = Sonar("TimeUtils")
local v27 = Sonar("Signal")
local v28 = Sonar("GuiUtils")
local v29 = Sonar("Constants")
local v30 = v8.GetAllBanners()
local v31 = v8.GetAllIcons()
local v32 = v8.GetAllStatuses()
local v33 = v8.GetAllRoles()
local v34 = v8.GetAllPrivacySettings()
local ProductId = v18.GetProductFromName("CreateClub").ProductId
local MAX_CAPACITY = v8.MAX_CAPACITY
local DEFAULT_CAPACITY = v8.DEFAULT_CAPACITY
local StableClubMissionTimer = v25.StableClubMissionTimer
local CREATE_CLUB_PRICE = v8.CREATE_CLUB_PRICE
local v35 = v1.GetClient()
local v36 = v6.GetRemoteFunction("RequestCreateClub")
local v37 = v6.GetRemoteFunction("UpdateClubInfo")
local v38 = v6.GetRemoteEvent("PromoteMember")
local v39 = v6.GetRemoteEvent("DemoteMember")
local v40 = v6.GetRemoteEvent("KickMember")
local v41 = v6.GetRemoteEvent("TransferClub")
local v42 = v6.GetRemoteFunction("LeaveClub")
local v43 = v6.GetRemoteFunction("DeleteClub")
local v44 = v6.GetRemoteFunction("FetchClubData")
local v45 = v6.GetRemoteFunction("ClubRequestJoinClub")
local v46 = v6.GetRemoteFunction("ClubAcceptJoinRequest")
local v47 = v6.GetRemoteFunction("ClubDeclineJoinRequest")
local v48 = v6.GetRemoteFunction("ClubSendInvite")
local v49 = v6.GetRemoteFunction("ClubAcceptInvite")
local v50 = v6.GetRemoteFunction("ClubDeclineInvite")
local v51 = v6.GetRemoteFunction("ClubGetInvitedList")
local v52 = v6.GetRemoteFunction("ClubGetJoinRequests")
local v53 = v6.GetRemoteEvent("PurchaseClubItem")
local v54 = v6.GetRemoteEvent("ClaimClubReward")
v6.GetRemoteFunction("GetTopClubs")
local v55 = v6.GetRemoteFunction("RequestBuySlotsWithCoins")
local v56 = v6.GetRemoteFunction("CanClaimLeaderboardReward")
local v57 = v6.GetRemoteFunction("ClaimLeaderboardReward")
local StableClubsGui = v35.PlayerGui:WaitForChild("StableClubsGui")
local ContainerFrame = StableClubsGui.ContainerFrame
local ConfirmPurchase = StableClubsGui.ConfirmPurchase
local Menu = ContainerFrame.Menu
local t2 = {}
local t3 = {}
local v58 = nil
local function setupRewardProgressFrame(p1, p2, p3) --[[ setupRewardProgressFrame | Line: 96 | Upvalues: v4 (copy), v8 (copy), v9 (copy), v21 (copy), v22 (copy), v23 (copy) ]]
	local v1 = v4.GetTagged(p1, "RewardFrame")
	if not v1 then
		return
	end
	local ProgressBar = v1:FindFirstChild("ProgressBar")
	local v2 = ProgressBar and ProgressBar:FindFirstChild("Fill")
	local v3 = v4.GetTagged(v1, "PointsLabel")
	local ImageButton = v1:FindFirstChild("ImageButton")
	local v42 = ImageButton and v4.GetTagged(ImageButton, "RewardImage")
	local v5 = ImageButton and v4.GetTagged(ImageButton, "AmountLabel")
	local v6 = v8.GetAllRewards()
	local v7 = #v6
	local v82 = p2:GiveTask(v9.new())
	local function updateRewardProgress() --[[ updateRewardProgress | Line: 111 | Upvalues: v8 (ref), p3 (copy), v7 (copy), v3 (copy), v21 (ref), v2 (copy), v82 (copy), v6 (copy), v42 (copy), v22 (ref), v23 (ref), v5 (copy), v1 (copy) ]]
		local DEFAULT_CAPACITY = v8.DEFAULT_CAPACITY
		local v12, v24, v32, v4, v52
		if p3 then
			local v62, v72, v83, v9, v10 = p3:GetCurrentTier()
			_ = v9
			local v11 = p3:GetProperty("Points")
			v12, v24, v32, v4, DEFAULT_CAPACITY, v52 = v62, v11, v83, v72, p3:GetProperty("Capacity"), v10
		else
			local v13, v14, v15 = v8.GetTierInfo(0, v8.DEFAULT_CAPACITY)
			v12 = v13
			v24 = 0
			v32 = v15
			v4 = v14
			v52 = 0
		end
		local v16 = if v7 <= v12 then true else false
		if v3 and v16 then
			v3.Text = ("%* Pts"):format((v21.splice(v24)))
		elseif v3 then
			v3.Text = ("%*/%* Pts"):format(v21.splice(v24), (v21.splice(v32)))
		end
		if v2 then
			v2.Size = UDim2.fromScale(if v16 then 1 else v52, 1)
		end
		v82:DoCleaning()
		local v19 = v6[v4]
		if not (v42 and (v19 and (v19.Rewards and v19.Rewards[1]))) then
			v1.Visible = true
			return
		end
		local v20 = v19.Rewards[1]
		local v212 = v22.GetByName(v20.Name)
		local v222 = v8.ScaleRewardAmount(v20.Amount, DEFAULT_CAPACITY)
		if not v212 then
			v1.Visible = true
			return
		end
		v82:GiveTask((v23.new({
			DoNotClone = true,
			IgnoreBackgroundColor = true,
			Item = v212,
			GuiObject = v42,
			GetAmount = function() --[[ GetAmount | Line: 158 | Upvalues: v222 (copy) ]]
				return v222
			end,
			AmountLabel = v5
		})))
		v1.Visible = true
	end
	if p3 then
		p2:GiveTask(p3:GetPropertyChangedSignal("Points"):Connect(updateRewardProgress))
		p2:GiveTask(p3:GetPropertyChangedSignal("Capacity"):Connect(updateRewardProgress))
	end
	updateRewardProgress()
end
local function initializeClubSettingsScreen(p1, p2, p3) --[[ initializeClubSettingsScreen | Line: 180 | Upvalues: v4 (copy), v3 (copy), v35 (copy), v7 (copy), v37 (copy), t (copy), v21 (copy), CREATE_CLUB_PRICE (copy), v36 (copy), v18 (copy), ProductId (copy), DEFAULT_CAPACITY (copy), v10 (copy), v9 (copy), ConfirmPurchase (copy), v31 (copy), v30 (copy), v13 (copy), v14 (copy), v15 (copy), v2 (copy), v53 (copy), v32 (copy), v34 (copy), v22 (copy) ]]
	local v1 = v4.GetTagged(p1, "NameTextBox")
	local v23 = v4.GetTagged(p1, "AboutTextBox")
	local v33 = v4.GetTemplate(p1, "DefaultIcon")
	local v42 = v4.GetTemplate(p1, "DefaultBanner")
	local v5 = v4.GetTemplate(p1, "DefaultStatus")
	local v6 = v4.GetTemplate(p1, "DefaultPrivacy")
	local t2 = {}
	local t3 = {}
	local v72 = p3 and p3:GetProperty("Status")
	local v8 = p3 and p3:GetProperty("Privacy")
	local t4 = {}
	local v92 = p3 and p3:GetProperty("CurrentIcon")
	local t5 = {}
	local v102 = p3 and p3:GetProperty("CurrentBanner")
	v4.GetTagged(p1, "ScrollingFrame").CanvasPosition = Vector2.new(0, 0)
	if p3 then
		v1.Text = p3:GetProperty("Name")
		v23.Text = p3:GetProperty("About")
		p2:GiveTask(v3.new(v4.GetTagged(p1, "SaveButton"), {
			Click = function() --[[ Click | Line: 210 | Upvalues: p3 (copy), v35 (ref), v7 (ref), v37 (ref), v1 (copy), v23 (copy), v72 (ref), v8 (ref), v92 (ref), v102 (ref), t (ref) ]]
				local v12 = p3:CanUpdate(v35)
				if v12 ~= true then
					v7.NotifyIssue(v12)
					return
				end
				local v2 = v37:InvokeServer({
					Name = v1.Text,
					About = v23.Text,
					Status = v72,
					Privacy = v8,
					CurrentIcon = v92,
					CurrentBanner = v102
				})
				if v2 == true then
					t.OpenTab("MyClub")
				else
					v7.NotifyIssue(v2)
				end
			end
		}))
		p2:GiveTask(v3.new(v4.GetTagged(p1, "UndoButton"), {
			Click = function() --[[ Click | Line: 237 | Upvalues: t (ref) ]]
				t.OpenTab("MyClub")
			end
		}))
		p2:GiveTask(v3.new(v4.GetTagged(p1, "BackButton"), {
			Click = function() --[[ Click | Line: 244 | Upvalues: t (ref) ]]
				t.OpenTab("MyClub")
			end
		}))
	else
		v1.Text = ""
		v23.Text = ""
		v4.GetTagged(p1, "CostLabel").Text = v21.splice(CREATE_CLUB_PRICE)
		local v142 = v4.GetTagged(p1, "CreateButton")
		local v152 = v4.GetTagged(p1, "RobuxBuyButton")
		for v16, v17 in { v142, v152 } do
			p2:GiveTask(v3.new(v17, {
				Click = function() --[[ Click | Line: 260 | Upvalues: v36 (ref), v17 (copy), v152 (copy), v1 (copy), v23 (copy), v72 (ref), v8 (ref), v92 (ref), v102 (ref), v7 (ref), CREATE_CLUB_PRICE (ref), t (ref) ]]
					local t2 = {}
					t2.WithRobux = v17 == v152
					t2.Name = v1.Text
					t2.About = v23.Text
					t2.Status = v72
					t2.Privacy = v8
					t2.CurrentIcon = v92
					t2.CurrentBanner = v102
					local v3 = v36:InvokeServer(t2)
					if v3 == true then
						t.OpenTab("MyClub")
					else
						v7.NotifyIssue(v3, CREATE_CLUB_PRICE)
					end
				end
			}))
		end
		local v182 = v4.GetTagged(v152, "TextLabel")
		p2:GiveTask(task.spawn(function() --[[ Line: 282 | Upvalues: v18 (ref), ProductId (ref), v182 (copy) ]]
			v182.Text = v18.GetPriceForProduct(ProductId, true, true) .. " "
		end))
		p2:GiveTask(v3.new(v4.GetTagged(p1, "CancelButton"), {
			Click = function() --[[ Click | Line: 289 | Upvalues: t (ref) ]]
				t.OpenTab("MainMenu")
			end
		}))
		v4.GetTagged(p1, "Info").Text = ("You will start with %* Member Slots."):format(DEFAULT_CAPACITY)
	end
	local function updateButtonColors(p1, p2) --[[ updateButtonColors | Line: 298 | Upvalues: v10 (ref) ]]
		for v1, v2 in p1 do
			local isName = v2.Button.Name == p2
			local Selected = v2.Button:FindFirstChild("Selected")
			if Selected then
				local t = {}
				t.Transparency = if isName then 0 else 1
				v10.target(Selected, 1, 2, t)
				continue
			end
			v2:SetColor(if isName then "Green" else "Red")
		end
	end
	local function openConfirmPurchase(p1, p22) --[[ openConfirmPurchase | Line: 311 | Upvalues: p2 (copy), v9 (ref), ConfirmPurchase (ref), v31 (ref), v92 (ref), v30 (ref), v102 (ref), v1 (copy), v23 (copy), v72 (ref), v13 (ref), p3 (copy), v14 (ref), v15 (ref), v21 (ref), v2 (ref), v3 (ref), v53 (ref), updateButtonColors (copy), t4 (copy), t5 (copy) ]]
		local v12 = p2:GiveTask(v9.new())
		local ClubFrame = ConfirmPurchase.Content.PreviewModal.ClubFrame
		local v22 = ConfirmPurchase.Content.PurchaseModal.Content
		ClubFrame.ClubIcon.Image = p1 == "Icons" and p22.Image or v31[v92].Image
		ClubFrame.ClubBanner.Image = p1 == "Banners" and p22.Image or v30[v102].Image
		ClubFrame.ClubName.Text = v1.Text
		ClubFrame.ClubAbout.Text = v23.Text
		ClubFrame.ClubStatus.Text = v72 or ""
		ClubFrame.ClubCreation.Text = "Created " .. v13.GetFormattedTime("F j, Y", p3:GetProperty("CreatedAt"))
		v12:GiveTask(task.spawn(function() --[[ Line: 323 | Upvalues: p3 (ref), v14 (ref), v15 (ref), ClubFrame (copy) ]]
			ClubFrame.ClubLeader.Text = "Lead by " .. (v14.safeCall(v15.GetUserNameFromUserId, (p3:GetOwner())) or "Unknown")
		end))
		v22.CostFrame.Coins.PriceLabel.Text = v21.splice(p22.Price)
		v2.OpenFrame(ConfirmPurchase)
		local function closeConfirm() --[[ closeConfirm | Line: 332 | Upvalues: v2 (ref), ConfirmPurchase (ref), v12 (copy) ]]
			v2.CloseFrame(ConfirmPurchase)
			v12:DoCleaning()
		end
		v12:GiveTask(v3.new(v22.RunButton, {
			Click = function() --[[ Click | Line: 338 | Upvalues: v53 (ref), p1 (copy), p22 (copy), v92 (ref), updateButtonColors (ref), t4 (ref), v102 (ref), t5 (ref), v2 (ref), ConfirmPurchase (ref), v12 (copy) ]]
				v53:FireServer(p1, p22.Name)
				if p1 == "Icons" then
					v92 = p22.Name
					updateButtonColors(t4, v92)
				else
					if p1 ~= "Banners" then
						v2.CloseFrame(ConfirmPurchase)
						v12:DoCleaning()
						return
					end
					v102 = p22.Name
					updateButtonColors(t5, v102)
				end
				v2.CloseFrame(ConfirmPurchase)
				v12:DoCleaning()
			end
		}))
		v12:GiveTask(v3.new(v22.CancelButton, {
			Click = closeConfirm
		}))
	end
	for v20, v212 in v32 do
		local v222 = v5:Clone()
		v222.Name = v212
		v222.LayoutOrder = v20
		if v20 == 1 and not p3 then
			v72 = v212
		end
		local t6 = {
			Click = function() --[[ Click | Line: 367 | Upvalues: v72 (ref), v212 (copy), updateButtonColors (copy), t2 (copy) ]]
				v72 = v212
				updateButtonColors(t2, v212)
			end
		}
		table.insert(t2, v3.new(v222, t6))
		v222.Top.TextLabel.Text = v212
		p2:GiveTask(v222)
		v222.Visible = true
		v222.Parent = v5.Parent
	end
	for v24, v25 in v34 do
		local v26 = v6:Clone()
		v26.Name = v25
		v26.LayoutOrder = v24
		if v24 == 1 and not p3 then
			v8 = v25
		end
		local t6 = {
			Click = function() --[[ Click | Line: 392 | Upvalues: v8 (ref), v25 (copy), updateButtonColors (copy), t3 (copy) ]]
				v8 = v25
				updateButtonColors(t3, v25)
			end
		}
		table.insert(t3, v3.new(v26, t6))
		v26.Top.TextLabel.Text = v25
		p2:GiveTask(v26)
		v26.Visible = true
		v26.Parent = v6.Parent
	end
	for v28, v29 in v31 do
		local v302 = v29.ProductId or v29.Price
		if p3 or not v302 then
			local v312 = v33:Clone()
			v312.Name = v29.Name
			if v29.Default and not p3 then
				v92 = v29.Name
			end
			local v322 = v4.GetTagged(v312, "RobuxFrame")
			local v332 = v4.GetTagged(v312, "CostFrame")
			if v302 then
				local function updateOverlayFrames() --[[ updateOverlayFrames | Line: 423 | Upvalues: p3 (copy), v29 (copy), v322 (copy), v332 (copy), p2 (copy), v4 (ref), v18 (ref), v312 (copy), v21 (ref), v22 (ref) ]]
					if p3:HasItem("Icons", v29.Name) then
						v322.Visible = false
						v332.Visible = false
						return
					end
					if v29.ProductId then
						p2:GiveTask(task.spawn(function() --[[ Line: 428 | Upvalues: v4 (ref), v322 (ref), v18 (ref), v29 (ref), v312 (ref) ]]
							local v1 = v4.GetTagged(v322, "AmountLabel")
							local v2 = v18.GetPriceForProduct(v29.ProductId)
							v1.Text = v2
							v322.Visible = true
							v312.LayoutOrder = 1000000000 + v2
						end))
						return
					end
					if not v29.Price then
						return
					end
					v4.GetTagged(v332, "AmountLabel").Text = v21.splice(v29.Price)
					v4.GetTagged(v332, "ImageButton").Image = v22.GetByName(v29.Currency).Image
					v332.Visible = true
					v312.LayoutOrder = v29.Price
				end
				p2:GiveTask(p3:GetItemAddedSignal("Icons"):Connect(updateOverlayFrames))
				updateOverlayFrames()
			end
			local function onInteraction() --[[ onInteraction | Line: 448 | Upvalues: v312 (copy), v10 (ref), v332 (copy) ]]
				local GuiState = v312.GuiState
				local v1 = if GuiState == Enum.GuiState.Hover then true else GuiState == Enum.GuiState.Press
				local t = {}
				t.BackgroundTransparency = if v1 then 1 else 0.2
				v10.target(v332, 1, 4, t)
				local t2 = {}
				t2.ImageTransparency = if v1 then 1 else 0
				v10.target(v332.ImageButton, 1, 4, t2)
				local t3 = {}
				t3.TextTransparency = if v1 then 1 else 0
				v10.target(v332.AmountLabel, 1, 4, t3)
				local t4 = {}
				t4.Transparency = if v1 then 1 else 0
				v10.target(v332.AmountLabel.UIStroke, 1, 4, t4)
			end
			local t6 = {
				OnHover = onInteraction,
				OnLeave = onInteraction,
				OnDown = onInteraction,
				OnUp = onInteraction,
				Click = function() --[[ Click | Line: 464 | Upvalues: v302 (copy), p3 (copy), v29 (copy), v92 (ref), updateButtonColors (copy), t4 (copy), v18 (ref), v35 (ref), v7 (ref), openConfirmPurchase (copy) ]]
					if not v302 or p3:HasItem("Icons", v29.Name) then
						v92 = v29.Name
						updateButtonColors(t4, v92)
						return
					end
					if v29.ProductId then
						v18.PromptPurchase(v35.Player, v29.ProductId)
						return
					end
					if not v29.Price then
						return
					end
					if not v35:CanAfford(v29.Price, v29.Currency) then
						v7.NotifyIssue("CantAfford")
						return
					end
					openConfirmPurchase("Icons", v29)
				end
			}
			table.insert(t4, v3.new(v312, t6))
			v312.ImageLabel.Image = v29.Image
			p2:GiveTask(v312)
			v312.Visible = true
			v312.Parent = v33.Parent
		end
	end
	for v352, v362 in v30 do
		local v372 = v362.ProductId or v362.Price
		if p3 or not v372 then
			local v38 = v42:Clone()
			v38.Name = v362.Name
			if v362.Default and not p3 then
				v102 = v362.Name
			end
			local v39 = v4.GetTagged(v38, "RobuxFrame")
			local v40 = v4.GetTagged(v38, "CostFrame")
			if v372 then
				local function updateOverlayFrames() --[[ updateOverlayFrames | Line: 507 | Upvalues: p3 (copy), v362 (copy), v39 (copy), v40 (copy), p2 (copy), v4 (ref), v18 (ref), v38 (copy), v21 (ref), v22 (ref) ]]
					if p3:HasItem("Banners", v362.Name) then
						v39.Visible = false
						v40.Visible = false
						return
					end
					if v362.ProductId then
						p2:GiveTask(task.spawn(function() --[[ Line: 512 | Upvalues: v4 (ref), v39 (ref), v18 (ref), v362 (ref), v38 (ref) ]]
							local v1 = v4.GetTagged(v39, "AmountLabel")
							local v2 = v18.GetPriceForProduct(v362.ProductId)
							v1.Text = v2
							v39.Visible = true
							v38.LayoutOrder = 1000000000 + v2
						end))
						return
					end
					if not v362.Price then
						return
					end
					v4.GetTagged(v40, "AmountLabel").Text = v21.splice(v362.Price)
					v4.GetTagged(v40, "ImageButton").Image = v22.GetByName(v362.Currency).Image
					v40.Visible = true
					v38.LayoutOrder = v362.Price
				end
				p2:GiveTask(p3:GetItemAddedSignal("Banners"):Connect(updateOverlayFrames))
				updateOverlayFrames()
			end
			local function onInteraction() --[[ onInteraction | Line: 532 | Upvalues: v38 (copy), v10 (ref), v40 (copy) ]]
				local GuiState = v38.GuiState
				local v1 = if GuiState == Enum.GuiState.Hover then true else GuiState == Enum.GuiState.Press
				local t = {}
				t.BackgroundTransparency = if v1 then 1 else 0.2
				v10.target(v40, 1, 4, t)
				local t2 = {}
				t2.ImageTransparency = if v1 then 1 else 0
				v10.target(v40.ImageButton, 1, 4, t2)
				local t3 = {}
				t3.TextTransparency = if v1 then 1 else 0
				v10.target(v40.AmountLabel, 1, 4, t3)
				local t4 = {}
				t4.Transparency = if v1 then 1 else 0
				v10.target(v40.AmountLabel.UIStroke, 1, 4, t4)
			end
			local t6 = {
				OnHover = onInteraction,
				OnLeave = onInteraction,
				OnDown = onInteraction,
				OnUp = onInteraction,
				Click = function() --[[ Click | Line: 548 | Upvalues: v372 (copy), p3 (copy), v362 (copy), v102 (ref), updateButtonColors (copy), t5 (copy), v18 (ref), v35 (ref), v7 (ref), openConfirmPurchase (copy) ]]
					if not v372 or p3:HasItem("Banners", v362.Name) then
						v102 = v362.Name
						updateButtonColors(t5, v102)
						return
					end
					if v362.ProductId then
						v18.PromptPurchase(v35.Player, v362.ProductId)
						return
					end
					if not v362.Price then
						return
					end
					if not v35:CanAfford(v362.Price, v362.Currency) then
						v7.NotifyIssue("CantAfford")
						return
					end
					openConfirmPurchase("Banners", v362)
				end
			}
			table.insert(t5, v3.new(v38, t6))
			v38.ImageLabel.Image = v362.Image
			p2:GiveTask(v38)
			v38.Visible = true
			v38.Parent = v42.Parent
		end
	end
	updateButtonColors(t2, v72)
	updateButtonColors(t3, v8)
	updateButtonColors(t4, v92)
	updateButtonColors(t5, v102)
end
local t4 = {
	SendFrame = function(p1, p2, p3) --[[ SendFrame | Line: 581 | Upvalues: v4 (copy), v35 (copy), v9 (copy), v15 (copy), v3 (copy), v48 (copy), v7 (copy), v12 (copy), v14 (copy), Players (copy) ]]
		local v1 = v4.GetTemplate(p1, "DefaultSend")
		local function playerJoined(p1) --[[ playerJoined | Line: 584 | Upvalues: v35 (ref), v9 (ref), v1 (copy), v4 (ref), v15 (ref), v3 (ref), v48 (ref), v7 (ref), v12 (ref), p3 (copy) ]]
			if p1 == v35.Player then
			else
				local v13 = v9.new()
				local v2 = v1:Clone()
				v2.Name = p1.UserId
				v4.GetTagged(v2, "UsernameLabel").Text = ("@%*"):format(p1.Name)
				v4.GetTagged(v2, "DisplayNameLabel").Text = p1.Name
				v4.GetTagged(v2, "PlayerImage").Image = v15.GetUserThumbnail(p1.UserId, "AvatarBust")
				local v32 = v4.GetTagged(v2, "InviteButton")
				v13:GiveTask(v3.new(v32, {
					Click = function() --[[ Click | Line: 604 | Upvalues: v48 (ref), p1 (copy), v7 (ref), v12 (ref) ]]
						local v1 = v48:InvokeServer(p1.UserId)
						if v1 == true then
							v12.Notify({
								Preset = "Green",
								Message = ("Invite sent to %*!"):format(p1.Name)
							})
						else
							v7.NotifyIssue(v1)
						end
					end
				}))
				local function updateButtonVisibility() --[[ updateButtonVisibility | Line: 618 | Upvalues: p3 (ref), v35 (ref), v32 (copy) ]]
					v32.Visible = p3:MemberHasPermission(v35, "CanInvitePlayers")
				end
				v13:GiveTask(p3.MemberUpdated:Connect(updateButtonVisibility))
				v32.Visible = p3:MemberHasPermission(v35, "CanInvitePlayers")
				local function updateVisibility() --[[ updateVisibility | Line: 625 | Upvalues: p3 (ref), p1 (copy), v2 (copy) ]]
					v2.Visible = not p3:IsInClub(p1.UserId)
				end
				v13:GiveTask(p3.MemberAdded:Connect(updateVisibility))
				v13:GiveTask(p3.MemberRemoved:Connect(updateVisibility))
				v2.Visible = not p3:IsInClub(p1.UserId)
				v13:GiveTask(v2)
				v2.Parent = v1.Parent
				return v13
			end
		end
		v14.lightweightBinder(Players, playerJoined, p2)
	end,
	InvitedFrame = function(p1, p2, p3) --[[ InvitedFrame | Line: 642 | Upvalues: v4 (copy), v51 (copy), Players (copy), v15 (copy), v3 (copy), v50 (copy), v7 (copy), v12 (copy), v35 (copy) ]]
		local v1 = v4.GetTemplate(p1, "DefaultInvite")
		for v2, v32 in v51:InvokeServer() do
			local v42 = tonumber(v2)
			local v5 = Players:GetPlayerByUserId(v42)
			if v5 then
				local v6 = v1:Clone()
				v6.Name = v42
				v4.GetTagged(v6, "UsernameLabel").Text = ("@%*"):format(v5.Name)
				v4.GetTagged(v6, "DisplayNameLabel").Text = v5.Name
				v4.GetTagged(v6, "PlayerImage").Image = v15.GetUserThumbnail(v42, "AvatarBust")
				p2:GiveTask(task.spawn(function() --[[ Line: 665 | Upvalues: v4 (ref), v6 (copy), v15 (ref), v32 (copy) ]]
					v4.GetTagged(v6, "InviterLabel").Text = ("Invited by %*..."):format((v15.GetUserNameFromUserId(v32.Inviter, "Username")))
				end))
				local v72 = v4.GetTagged(v6, "RevokeButton")
				p2:GiveTask(v3.new(v72, {
					Click = function() --[[ Click | Line: 672 | Upvalues: v50 (ref), v42 (ref), v7 (ref), v12 (ref), v5 (copy), v6 (copy) ]]
						local v1 = v50:InvokeServer(v42)
						if v1 == true then
							v12.Notify({
								Preset = "Green",
								Message = ("Invite revoked from %*!"):format(v5.Name)
							})
							v6:Destroy()
						else
							v7.NotifyIssue(v1)
						end
					end
				}))
				local function updateButtonVisibility() --[[ updateButtonVisibility | Line: 688 | Upvalues: p3 (copy), v35 (ref), v72 (copy) ]]
					v72.Visible = p3:MemberHasPermission(v35, "CanInvitePlayers")
				end
				p2:GiveTask(p3.MemberUpdated:Connect(updateButtonVisibility))
				v72.Visible = p3:MemberHasPermission(v35, "CanInvitePlayers")
				p2:GiveTask(v6)
				v6.Visible = true
				v6.Parent = v1.Parent
			end
		end
	end
}
local t5 = {
	MyClubRequests = function(p1, p2, p3) --[[ MyClubRequests | Line: 704 | Upvalues: t3 (copy), v4 (copy), v9 (copy), v5 (copy), v3 (copy), t4 (copy), t (copy), v52 (copy), Players (copy), v15 (copy), v46 (copy), v7 (copy), v12 (copy), v47 (copy), v35 (copy), v19 (copy), v6 (copy) ]]
		for v1, v2 in t3 do
			p2:GiveTask(v2)
		end
		for v32, v42 in { "Send", "Invited" } do
			local v53 = v4.GetTagged(p1, v42 .. "Button")
			local v62 = v4.GetTagged(p1, v42 .. "Frame")
			if not t3[v62.Name] then
				t3[v62.Name] = v9.new()
			end
			local v72 = v5.AddTab(v62, {
				ParentFrame = p1
			})
			p2:GiveTask(v3.new(v53, {
				Click = function() --[[ Click | Line: 722 | Upvalues: v53 (copy), v5 (ref), v62 (copy), p3 (copy) ]]
					if v53.Name == "SendButton" then
						v5.OpenTab(v62, { p3 })
					else
						v5.OpenTab(v62, { p3 })
					end
				end
			}))
			if v72 then
				v5.AddStateCallback(v62, "BeforeOpen", function(...) --[[ Line: 732 | Upvalues: t3 (ref), t4 (ref), v62 (copy) ]]
					for v1, v2 in t3 do
						v2:DoCleaning()
					end
					if not t4[v62.Name] then
						return
					end
					t4[v62.Name](v62, t3[v62.Name], ...)
				end)
			end
		end
		local v8 = v4.GetTagged(p1, "SendFrame")
		v5.OpenTab(v8, { p3 })
		local v92 = v4.GetTagged(p1, "BackButton")
		p2:GiveTask(v3.new(v92, {
			Click = function() --[[ Click | Line: 749 | Upvalues: t (ref) ]]
				t.OpenTab("MyClub")
			end
		}))
		local v10 = v4.GetTemplate(p1, "DefaultJoin")
		for v11, v122 in v52:InvokeServer() do
			local v13 = tonumber(v122)
			local v14 = Players:GetPlayerByUserId(v13)
			if v14 then
				local v152 = v10:Clone()
				v152.Name = v13
				v4.GetTagged(v152, "PlayerImage").Image = v15.GetUserThumbnail(v13, "AvatarBust")
				v4.GetTagged(v152, "UsernameLabel").Text = ("@%*"):format((v15.GetUserNameFromUserId(v13)))
				v4.GetTagged(v152, "DisplayNameLabel").Text = v15.GetUserNameFromUserId(v13, "Username")
				local v16 = v4.GetTagged(v152, "AcceptButton")
				p2:GiveTask(v3.new(v16, {
					Click = function() --[[ Click | Line: 777 | Upvalues: v46 (ref), v13 (ref), v7 (ref), v12 (ref), v14 (copy), v152 (copy) ]]
						local v1 = v46:InvokeServer(v13)
						if v1 == true then
							v12.Notify({
								Preset = "Green",
								Message = ("Accepted %*!"):format(v14.Name)
							})
							v152:Destroy()
						else
							v7.NotifyIssue(v1)
						end
					end
				}))
				local v17 = v4.GetTagged(v152, "DeclineButton")
				p2:GiveTask(v3.new(v17, {
					Click = function() --[[ Click | Line: 795 | Upvalues: v47 (ref), v13 (ref), v7 (ref), v12 (ref), v14 (copy), v152 (copy) ]]
						local v1 = v47:InvokeServer(v13)
						if v1 == true then
							v12.Notify({
								Preset = "Green",
								Message = ("Declined %*!"):format(v14.Name)
							})
							v152:Destroy()
						else
							v7.NotifyIssue(v1)
						end
					end
				}))
				local function updateButtonVisibility() --[[ updateButtonVisibility | Line: 811 | Upvalues: p3 (copy), v35 (ref), v16 (copy), v17 (copy) ]]
					local v1 = p3:MemberHasPermission(v35, "CanInvitePlayers")
					v16.Visible = v1
					v17.Visible = v1
				end
				p2:GiveTask(p3.MemberUpdated:Connect(updateButtonVisibility))
				local v18 = p3:MemberHasPermission(v35, "CanInvitePlayers")
				v16.Visible = v18
				v17.Visible = v18
				p2:GiveTask(v152)
				v152.Visible = true
				v152.Parent = v10.Parent
			end
		end
		local v192 = v4.GetTagged(p1, "CodeButton")
		p2:GiveTask(v3.new(v192, {
			Click = function() --[[ Click | Line: 827 | Upvalues: v19 (ref), v4 (ref), v6 (ref), v12 (ref), v7 (ref) ]]
				v19.Prompt({
					Type = "GenericTextInput",
					Setup = function(p1, p2) --[[ Setup | Line: 830 | Upvalues: v4 (ref), v6 (ref) ]]
						local Maid = p2.Maid
						local v1 = v4.GetTagged(p1, "DescriptionLabel")
						local v2 = v4.GetTagged(p1, "TextBox")
						local v3 = v4.GetTagged(p1, "RunButton")
						local Text = v3.Top.TextLabel.Text
						v1.Text = "Share this code to invite players to your club. Press the button below to generate a new code."
						v2.TextEditable = false
						v2.ClearTextOnFocus = false
						v2.Text = "Loading..."
						v3.Top.TextLabel.Text = "Generate New Code"
						Maid:GiveTask(function() --[[ Line: 845 | Upvalues: v2 (copy), v3 (copy), Text (copy) ]]
							v2.TextEditable = true
							v2.ClearTextOnFocus = true
							v2.Text = ""
							v3.Top.TextLabel.Text = Text
						end)
						Maid:GiveTask(task.spawn(function() --[[ Line: 853 | Upvalues: v6 (ref), v2 (copy) ]]
							local v1 = v6.GetRemoteFunction("GetInviteCodeFromClubId"):InvokeServer()
							if v1 and v1 ~= "NoPermission" then
								v2.Text = v1
							else
								v2.Text = "No code generated yet"
							end
						end))
					end,
					Run = function(p1) --[[ Run | Line: 862 | Upvalues: v4 (ref), v6 (ref), v12 (ref), v7 (ref) ]]
						local v1 = v4.GetTagged(p1, "TextBox")
						v1.Text = "Generating..."
						local v2 = v6.GetRemoteFunction("GenerateInviteCode"):InvokeServer()
						if v2 and (v2 ~= "NoPermission" and v2 ~= "AnErrorOccurred") then
							v1.Text = v2
							v12.Notify({
								Message = "New invite code generated!"
							})
						else
							v1.Text = "Failed to generate code"
							v7.NotifyIssue(v2 or "AnErrorOccurred")
						end
						return false
					end
				})
			end
		}))
		local function updateCodeButtonVisibility() --[[ updateCodeButtonVisibility | Line: 883 | Upvalues: v192 (copy), p3 (copy), v35 (ref) ]]
			v192.Visible = p3:MemberHasPermission(v35, "CanInvitePlayers")
		end
		p2:GiveTask(p3.MemberUpdated:Connect(updateCodeButtonVisibility))
		v192.Visible = p3:MemberHasPermission(v35, "CanInvitePlayers")
	end,
	ClubDirectory = function(p1, p2) --[[ ClubDirectory | Line: 889 | Upvalues: v4 (copy), v27 (copy), v9 (copy), v31 (copy), v30 (copy), v14 (copy), v15 (copy), v3 (copy), v49 (copy), v7 (copy), v12 (copy), t (copy), v35 (copy), v45 (copy), v8 (copy), v58 (ref), v20 (copy), v19 (copy), v29 (copy), v6 (copy) ]]
		local v1 = v4.GetTemplate(p1, "DefaultClub")
		local t2 = {}
		local v2 = true
		local v32 = p2:GiveTask(v27.new())
		local function clubAdded(p1) --[[ clubAdded | Line: 898 | Upvalues: v9 (ref), v1 (copy), v4 (ref), v31 (ref), v30 (ref), v14 (ref), v15 (ref), v3 (ref), v49 (ref), v7 (ref), v12 (ref), t (ref), v35 (ref), v45 (ref), v8 (ref), v58 (ref), v2 (ref), v32 (copy), p2 (copy), t2 (copy) ]]
			local v13 = v9.new()
			local v22 = v1:Clone()
			v13:GiveTask(v22)
			v22.Name = p1:GetProperty("Name")
			local v33 = v4.GetTagged(v22, "ClubName")
			v13:GiveTask(p1:BindToProperty("Name", function(p1) --[[ Line: 906 | Upvalues: v33 (copy) ]]
				v33.Text = p1
			end))
			local v42 = v4.GetTagged(v22, "ClubIcon")
			v13:GiveTask(p1:BindToProperty("CurrentIcon", function(p1) --[[ Line: 911 | Upvalues: v42 (copy), v31 (ref) ]]
				v42.Image = v31[p1].Image
			end))
			local v5 = v4.GetTagged(v22, "ClubBanner")
			v13:GiveTask(p1:BindToProperty("CurrentBanner", function(p1) --[[ Line: 916 | Upvalues: v5 (copy), v30 (ref) ]]
				v5.Image = v30[p1].Image
			end))
			local v6 = v4.GetTagged(v22, "ClubStatus")
			v13:GiveTask(p1:BindToProperty("Status", function(p1) --[[ Line: 921 | Upvalues: v6 (copy) ]]
				v6.Text = p1
			end))
			local v72 = v4.GetTagged(v22, "CapacityLabel")
			local function updateCapacity() --[[ updateCapacity | Line: 926 | Upvalues: p1 (copy), v72 (copy) ]]
				local v1, v2 = p1:GetCapacity()
				v72.Text = ("%*/%*"):format(v2, v1)
			end
			v13:GiveTask(p1:GetPropertyChangedSignal("Capacity"):Connect(updateCapacity))
			v13:GiveTask(p1.MemberAdded:Connect(updateCapacity))
			v13:GiveTask(p1.MemberRemoved:Connect(updateCapacity))
			local v82, v92 = p1:GetCapacity()
			v72.Text = ("%*/%*"):format(v92, v82)
			local v10 = v4.GetTagged(v22, "TierLabel")
			local function updateTier() --[[ updateTier | Line: 936 | Upvalues: p1 (copy), v10 (copy) ]]
				v10.Text = ("T%*"):format((p1:GetCapacityTier()))
			end
			v13:GiveTask(p1:GetPropertyChangedSignal("Capacity"):Connect(updateTier))
			v10.Text = ("T%*"):format((p1:GetCapacityTier()))
			local v11 = v4.GetTagged(v22, "ClubLeader")
			local function updateClubLeader() --[[ updateClubLeader | Line: 944 | Upvalues: p1 (copy), v14 (ref), v15 (ref), v11 (copy) ]]
				local v1 = p1:GetOwner()
				v11.Text = "Lead by " .. (v14.safeCall(function() --[[ Line: 946 | Upvalues: v15 (ref), v1 (copy) ]]
					return v15.GetUserNameFromUserId(v1)
				end) or "Unknown")
			end
			v13:GiveTask(p1.MemberUpdated:Connect(updateClubLeader))
			local v122 = p1:GetOwner()
			v11.Text = "Lead by " .. (v14.safeCall(function() --[[ Line: 946 | Upvalues: v15 (ref), v122 (copy) ]]
				return v15.GetUserNameFromUserId(v122)
			end) or "Unknown")
			local v132 = v4.GetTagged(v22, "RequestButton")
			local v142 = v4.GetTagged(v22, "NegativeLabel")
			local v152 = v3.new(v132, {
				Click = function() --[[ Click | Line: 957 | Upvalues: p1 (copy), v49 (ref), v7 (ref), v12 (ref), t (ref), v35 (ref), v45 (ref) ]]
					if p1.LocalPlayerInvited then
						local v1 = v49:InvokeServer(p1.ClubId)
						if v1 == true then
							v12.Notify({
								Preset = "Green",
								Message = ("Accepted invite from %*!"):format((p1:GetProperty("Name")))
							})
							t.OpenTab("MyClub")
						else
							v7.NotifyIssue(v1)
						end
					else
						local v2 = p1:CanRequestJoin(v35)
						if v2 ~= true then
							v7.NotifyIssue(v2)
							return
						end
						if v45:InvokeServer(p1.ClubId) then
							v12.Notify({
								Preset = "Green",
								Message = ("Request sent to %*!"):format((p1:GetProperty("Name")))
							})
						else
							v12.Notify({
								Message = "Failed to send request",
								Preset = "Red"
							})
						end
					end
				end
			})
			local function updateRequestButton() --[[ updateRequestButton | Line: 994 | Upvalues: p1 (copy), v132 (copy), v142 (copy), v152 (copy), v35 (ref) ]]
				if p1.LocalPlayerInvited then
					v132.Visible = true
					v142.Visible = false
					v152:SetText("Accept Invite")
					return
				end
				local v1 = p1:CanRequestJoin(v35)
				v132.Visible = v1 == true
				v142.Visible = v1 ~= true
				if v1 == "ClubIsFull" then
					v142.Text = "FULL"
				elseif v1 == "InviteOnly" then
					v142.Text = "INVITE ONLY"
				else
					v142.Visible = false
				end
				v152:SetText("Request Join")
			end
			v13:GiveTask(v8.GetPlayersClub(v35):GetPropertyChangedSignal("Value"):Connect(updateRequestButton))
			v13:GiveTask(p1.MemberAdded:Connect(updateRequestButton))
			v13:GiveTask(p1.MemberRemoved:Connect(updateRequestButton))
			v13:GiveTask(p1:GetPropertyChangedSignal("Capacity"):Connect(updateRequestButton))
			v13:GiveTask(p1.LocalPlayerInvitedUpdated:Connect(updateRequestButton))
			updateRequestButton()
			v13:GiveTask(v3.new(v4.GetTagged(v22, "ViewButton"), {
				Click = function() --[[ Click | Line: 1024 | Upvalues: v58 (ref), p1 (copy), t (ref) ]]
					v58 = p1
					t.OpenTab("MyClub", { p1 })
				end
			}))
			local function updateLayoutOrder() --[[ updateLayoutOrder | Line: 1030 | Upvalues: p1 (copy), v2 (ref), v22 (copy) ]]
				local _, v1 = p1:GetCapacity()
				if v2 then
					v22.LayoutOrder = -v1
				else
					v22.LayoutOrder = v1
				end
			end
			v13:GiveTask(v32:Connect(updateLayoutOrder))
			v13:GiveTask(p1.MemberAdded:Connect(updateLayoutOrder))
			v13:GiveTask(p1.MemberRemoved:Connect(updateLayoutOrder))
			local _, v17 = p1:GetCapacity()
			if v2 then
				v22.LayoutOrder = -v17
			else
				v22.LayoutOrder = v17
			end
			p2[p1.ClubId] = v13
			t2[p1] = v22
			v22.Visible = true
			v22.Parent = v1.Parent
		end
		local function clubRemoved(p1) --[[ clubRemoved | Line: 1050 | Upvalues: t2 (copy), p2 (copy) ]]
			t2[p1] = nil
			p2[p1.ClubId] = nil
		end
		p2:GiveTask(v20.ClubAdded:Connect(clubAdded))
		p2:GiveTask(v20.ClubRemoved:Connect(clubRemoved))
		for v42, v5 in v20.GetAll() do
			clubAdded(v5)
		end
		local v62 = v4.GetTagged(p1, "SearchTextBox")
		v62.Text = ""
		local v72 = v4.GetTagged(p1, "HideButton")
		local v82 = v4.GetTagged(v72, "Checkmark")
		v82.Visible = false
		local function updateVisibleClubs() --[[ updateVisibleClubs | Line: 1069 | Upvalues: v62 (copy), t2 (copy), v82 (copy) ]]
			local Text = v62.Text
			if #Text > 0 then
				local v1 = Text:lower()
				for v2, v3 in t2 do
					if v82.Visible and v2:IsInviteOnly() then
						v3.Visible = false
						continue
					end
					if v3.Name:lower():find(v1, 1, true) then
						v3.Visible = true
						continue
					end
					v3.Visible = false
				end
			else
				for v4, v5 in t2 do
					if v82.Visible and v4:IsInviteOnly() then
						v5.Visible = false
						continue
					end
					v5.Visible = true
				end
			end
		end
		p2:GiveTask(v62:GetPropertyChangedSignal("Text"):Connect(updateVisibleClubs))
		updateVisibleClubs()
		p2:GiveTask(v3.new(v72, {
			Click = function() --[[ Click | Line: 1101 | Upvalues: v82 (copy), updateVisibleClubs (copy) ]]
				v82.Visible = not v82.Visible
				updateVisibleClubs()
			end
		}))
		local v92 = v4.GetTagged(p1, "HelpButton")
		p2:GiveTask(v3.new(v92, {
			Click = function() --[[ Click | Line: 1109 | Upvalues: v19 (ref), v4 (ref), v29 (ref) ]]
				v19.Prompt({
					Type = "Tutorial",
					Setup = function(p1, p2) --[[ Setup | Line: 1112 | Upvalues: v4 (ref), v29 (ref) ]]
						for v1, v2 in p1.Content.Prompts:GetChildren() do
							v2.Visible = v2.Name == "Template"
						end
						local Template = p1.Content.Prompts:FindFirstChild("Template")
						local v3 = v4.GetTemplate(Template, "Default")
						for v42, v5 in v29.StableClubsPromptData.FindClub do
							local v6 = v3:Clone()
							p2.Maid:GiveTask(v6)
							v6.LayoutOrder = v42
							v4.GetTagged(v6, "TitleLabel").Text = ""
							v4.GetTagged(v6, "FrameText").Text = v5
							v6.Visible = true
							v6.Parent = v3.Parent
						end
					end,
					Run = function() --[[ Run | Line: 1136 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1139 ]]
						return true
					end
				})
			end
		}))
		local v10 = v4.GetTagged(p1, "SortButton")
		p2:GiveTask(v3.new(v10, {
			Click = function() --[[ Click | Line: 1148 | Upvalues: v2 (ref), v32 (copy) ]]
				v2 = not v2
				v32:Fire()
			end
		}))
		local v11 = v4.GetTagged(p1, "CodeButton")
		p2:GiveTask(v3.new(v11, {
			Click = function() --[[ Click | Line: 1156 | Upvalues: v8 (ref), v35 (ref), v7 (ref), v19 (ref), v4 (ref), v6 (ref), v12 (ref), t (ref) ]]
				if v8.HasClub(v35) then
					v7.NotifyIssue("AlreadyInClub")
				else
					v19.Prompt({
						Type = "GenericTextInput",
						Setup = function(p1, p2) --[[ Setup | Line: 1165 | Upvalues: v4 (ref) ]]
							local v1 = v4.GetTagged(p1, "DescriptionLabel")
							local v2 = v4.GetTagged(p1, "TextBox")
							local v3 = v4.GetTagged(p1, "RunButton")
							local Text = v3.Top.TextLabel.Text
							v1.Text = "Enter the invite code your friend shared with you to join their club."
							v2.Text = ""
							v2.ClearTextOnFocus = false
							v2.PlaceholderText = "Enter invite code..."
							v3.Top.TextLabel.Text = "Join Club"
							p2.Maid:GiveTask(function() --[[ Line: 1179 | Upvalues: v2 (copy), v3 (copy), Text (copy) ]]
								v2.Text = ""
								v2.ClearTextOnFocus = true
								v2.PlaceholderText = ""
								v3.Top.TextLabel.Text = Text
							end)
						end,
						Run = function(p1) --[[ Run | Line: 1186 | Upvalues: v4 (ref), v7 (ref), v6 (ref), v12 (ref), t (ref) ]]
							local v3 = string.upper((string.gsub(v4.GetTagged(p1, "TextBox").Text, "%s+", "")))
							if v3 == "" then
								v7.NotifyIssue("InvalidCode")
								return false
							end
							local v42 = v6.GetRemoteFunction("JoinClubViaInviteCode"):InvokeServer(v3)
							if v42 == true then
								v12.Notify({
									Message = "Successfully joined the club!",
									Preset = "Green"
								})
								t.OpenTab("MyClub")
								return true
							else
								v7.NotifyIssue(v42 or "AnErrorOccurred")
								return false
							end
						end
					})
				end
			end
		}))
	end,
	ClubRewards = function(p1, p2) --[[ ClubRewards | Line: 1213 | Upvalues: v4 (copy), StableClubMissionTimer (copy), v26 (copy), v8 (copy), v35 (copy), v20 (copy), v3 (copy), v7 (copy), t (copy), v25 (copy), v21 (copy), v6 (copy), v28 (copy), v9 (copy), v54 (copy), v22 (copy), v23 (copy), v19 (copy), v29 (copy), RunService (copy) ]]
		local v1 = v4.GetTagged(p1, "TimerLabel")
		local function updateTimerLabel() --[[ updateTimerLabel | Line: 1215 | Upvalues: StableClubMissionTimer (ref), v26 (ref), v1 (copy) ]]
			local v12 = StableClubMissionTimer:GetTime()
			v1.Text = string.format("%02dD %02dH %02dM", math.floor(v12 / v26.Cycles.Day), math.floor(v12 % v26.Cycles.Day / v26.Cycles.Hour), (math.floor(v12 % v26.Cycles.Hour / v26.Cycles.Minute)))
		end
		p2:GiveTask(v26.AttachToTime(updateTimerLabel))
		updateTimerLabel()
		local v2 = v4.GetTagged(p1, "Tasks")
		local v32 = v4.GetTagged(p1, "Track")
		local v42 = v8.GetPlayersClub(v35)
		local v5 = v20.GetById(v42.Value)
		local v62 = v4.GetTagged(p1, "List")
		local v72 = v4.GetTagged(p1, "NoClubFrame")
		local v82 = v4.GetTagged(p1, "MileStoneFiveFrame")
		local function updateNoClubState() --[[ updateNoClubState | Line: 1235 | Upvalues: v8 (ref), v35 (ref), v5 (copy), v82 (copy), v72 (copy), v62 (copy), v2 (copy), v32 (copy) ]]
			local v1 = v8.HasClub(v35)
			local v22 = false
			if v1 then
				local v4 = v8.GetClubData(v8.GetPlayersClub(v35).Value)
				if v4 then
					v22 = v8.ScaleRewardAmount(2000, v5:GetProperty("Capacity")) <= v4.Milestones.Points.Value
				end
			end
			v82.Visible = v1 and v22
			v72.Visible = not v1 and not v22
			v62.Visible = not v22
			v2.Visible = v1
			v32.Visible = v1
		end
		p2:GiveTask(v42:GetPropertyChangedSignal("Value"):Connect(updateNoClubState))
		updateNoClubState()
		local v92 = v4.GetTagged(v72, "CreateButton")
		p2:GiveTask(v3.new(v92, {
			Click = function() --[[ Click | Line: 1260 | Upvalues: v8 (ref), v35 (ref), v7 (ref), t (ref) ]]
				local v1, v2 = v8.CanCreateClub(v35)
				if v1 == true then
					t.OpenTab("CreateClub")
				else
					v7.NotifyIssue(v1, v2)
				end
			end
		}))
		local v10 = v4.GetTagged(v72, "JoinButton")
		p2:GiveTask(v3.new(v10, {
			Click = function() --[[ Click | Line: 1273 | Upvalues: t (ref) ]]
				t.OpenTab("ClubDirectory")
			end
		}))
		local v11 = v4.GetTagged(v32, "Tiers")
		local v12 = v4.GetTagged(v32, "NextProgressBar")
		local v13 = v4.GetTagged(v32, "TotalProgressBar")
		local v14 = v4.GetTagged(v32, "NextTierLabel")
		local v15 = v4.GetTagged(v32, "NextTierGoalLabel")
		local v16 = v4.GetTemplate(v2, "DefaultTask")
		local StableClubs = v35.PlayerData.Missions.StableClubs
		local CompletedSets = StableClubs.CompletedSets
		local v17 = v25.GetType("StableClubMissions")
		local function getMissionData(p1) --[[ getMissionData | Line: 1292 | Upvalues: v25 (ref), CompletedSets (copy), v17 (copy) ]]
			return v25.GetStableClubMissionData(v25.StableClubMissionTimer.CurrentSeed + CompletedSets.Value * 1000, v17, p1)
		end
		for v18, v192 in StableClubs.Missions:GetChildren() do
			local v202 = v16:Clone()
			v202.Name = v192.Name
			local Amount = v192.Amount
			local TargetAmount = v192.TargetAmount
			local v212 = v4.GetTagged(v202, "Bar")
			local v222 = v4.GetTagged(v202, "PointsLabel")
			local v232 = v4.GetTagged(v202, "DescriptionLabel")
			local function updateAmount() --[[ updateAmount | Line: 1310 | Upvalues: v192 (copy), v25 (ref), CompletedSets (copy), v17 (copy), v232 (copy), TargetAmount (copy), Amount (copy), v212 (copy), v222 (copy), v21 (ref) ]]
				local v4 = v25.GetStableClubMissionData(v25.StableClubMissionTimer.CurrentSeed + CompletedSets.Value * 1000, v17, (tonumber(v192.Name)))
				v232.Text = ("%* (%*/%*)"):format(string.format(v25.Descriptions[v4.Type] or v4.Type, TargetAmount.Value), Amount.Value, TargetAmount.Value)
				v212.Size = UDim2.new(Amount.Value / TargetAmount.Value, 0, 1, 0)
				v222.Text = v21.splice(v4.Reward.Amount) .. " Pts"
			end
			p2:GiveTask(Amount:GetPropertyChangedSignal("Value"):Connect(updateAmount))
			p2:GiveTask(TargetAmount:GetPropertyChangedSignal("Value"):Connect(updateAmount))
			p2:GiveTask(v192.Type:GetPropertyChangedSignal("Value"):Connect(updateAmount))
			p2:GiveTask(CompletedSets:GetPropertyChangedSignal("Value"):Connect(updateAmount))
			updateAmount()
			p2:GiveTask(v3.new(v202.PinButton, {
				Click = function() --[[ Click | Line: 1327 | Upvalues: v8 (ref), v35 (ref), v192 (copy), v6 (ref) ]]
					if not v8.HasClub(v35) then
						return
					end
					if not (v192:FindFirstChild("Pinned") and v6.GetRemoteFunction("PinMissionRemote"):InvokeServer("StableClubs", v192.Name, nil)) then
						return
					end
					warn("[StableClubs] Pin toggled successfully for mission", v192.Name)
				end
			}))
			local Claimed = v192.Claimed
			if v192:FindFirstChild("Pinned") then
				local function setPinned() --[[ setPinned | Line: 1342 | Upvalues: v192 (copy), v202 (copy), Claimed (copy), v28 (ref) ]]
					local Pinned = v192.Pinned.Value
					v202.PinButton.Visible = if Pinned then Pinned else not Claimed.Value
					v202.PinButton.Top.CrossLabel.Visible = Pinned
					v28.SetButtonColor(v202.PinButton, "Diagonal", if Pinned then "Red" else "Blue")
				end
				p2:GiveTask(v192.Pinned:GetPropertyChangedSignal("Value"):Connect(setPinned))
				p2:GiveTask(Claimed:GetPropertyChangedSignal("Value"):Connect(setPinned))
				local Pinned = v192.Pinned.Value
				v202.PinButton.Visible = if Pinned then Pinned else not Claimed.Value
				v202.PinButton.Top.CrossLabel.Visible = Pinned
				local SetButtonColor = v28.SetButtonColor
				SetButtonColor(v202.PinButton, "Diagonal", if Pinned then "Red" else "Blue")
			end
			local v27 = v4.GetTagged(v202, "CompletedFrame")
			local function updateCompleted() --[[ updateCompleted | Line: 1354 | Upvalues: v27 (copy), Claimed (copy) ]]
				v27.Visible = Claimed.Value
			end
			p2:GiveTask(Claimed:GetPropertyChangedSignal("Value"):Connect(updateCompleted))
			v27.Visible = Claimed.Value
			p2:GiveTask(v202)
			v202.Visible = true
			v202.Parent = v16.Parent
		end
		if v5 then
			local v282 = v8.GetAllRewards()
			local v292 = #v282
			local function updatePoints() --[[ updatePoints | Line: 1370 | Upvalues: v5 (copy), v292 (copy), v14 (copy), v15 (copy), v21 (ref), v13 (copy), v12 (copy) ]]
				local v1, v2, v3, v4, v52 = v5:GetCurrentTier()
				local v6 = v292 <= v1
				v14.Text = v2
				if v6 then
					v15.Text = ("%* Pts"):format((v21.splice(v5:GetProperty("Points"))))
				else
					v15.Text = ("%*/%* Pts"):format(v21.splice(v5:GetProperty("Points")), (v21.splice(v3)))
				end
				v13.Size = UDim2.fromScale(v4, 1)
				v12.Size = UDim2.fromScale(if v6 then 1 else v52, 1)
			end
			p2:GiveTask(v5:GetPropertyChangedSignal("Capacity"):Connect(updatePoints))
			p2:GiveTask(v5:GetPropertyChangedSignal("Points"):Connect(updatePoints))
			p2:GiveTask(v8.GetStableRewardSeed(v35):GetPropertyChangedSignal("Value"):Connect(updatePoints))
			updatePoints()
			local v30 = p2:GiveTask(v9.new())
			local function setupRewardTiers() --[[ setupRewardTiers | Line: 1394 | Upvalues: v30 (copy), v5 (copy), v4 (ref), v11 (copy), v3 (ref), v54 (ref), v282 (copy), v22 (ref), v8 (ref), v23 (ref), v35 (ref), v21 (ref) ]]
				v30:DoCleaning()
				local v1 = v5:GetProperty("Capacity")
				for i = 1, 5 do
					local v2 = v4.GetTagged(v11, "TierReward" .. i)
					local v32 = v4.GetTagged(v2, "PointsLabel")
					local v42 = v4.GetTagged(v2, "ClaimButton")
					v30:GiveTask(v3.new(v42, {
						Click = function() --[[ Click | Line: 1405 | Upvalues: v54 (ref), i (copy) ]]
							v54:InvokeServer(i)
						end
					}))
					local v52 = v4.GetTagged(v2, "RewardImage")
					local v6 = v4.GetTagged(v2, "AmountLabel")
					local v7 = v282[i]
					if v7 and (v7.Rewards and v7.Rewards[1]) then
						local v82 = v7.Rewards[1]
						local v9 = v22.GetByName(v82.Name)
						local v10 = v8.ScaleRewardAmount(v82.Amount, v1)
						v30:GiveTask((v23.new({
							DoNotClone = true,
							IgnoreBackgroundColor = true,
							Item = v9,
							GuiObject = v52,
							GetAmount = function() --[[ GetAmount | Line: 1425 | Upvalues: v10 (copy) ]]
								return v10
							end,
							AmountLabel = v6
						})))
					end
					local function updateCanClaim() --[[ updateCanClaim | Line: 1434 | Upvalues: v8 (ref), v35 (ref), i (copy), v32 (copy), v42 (copy), v21 (ref) ]]
						local v1, v2 = v8.CanClaimTierReward(v35, i)
						local v3 = v1 == true
						v32.Visible = not v3
						v42.Visible = v3
						if v3 then
							return
						end
						if typeof(v2) == "string" then
							v32.Text = v2
							return
						end
						v32.Text = ("%* Pts"):format((v21.splice(v2)))
					end
					v30:GiveTask(v8.GetStableRewardSeed(v35):GetPropertyChangedSignal("Value"):Connect(updateCanClaim))
					v30:GiveTask(v8.GetStableRewardTier(v35, i):GetPropertyChangedSignal("Value"):Connect(updateCanClaim))
					v30:GiveTask(v5:GetPropertyChangedSignal("Points"):Connect(updateCanClaim))
					local v112, v12 = v8.CanClaimTierReward(v35, i)
					local v13 = if v112 == true then true else false
					v32.Visible = not v13
					v42.Visible = v13
					if not v13 then
						if typeof(v12) == "string" then
							v32.Text = v12
							continue
						end
						v32.Text = ("%* Pts"):format((v21.splice(v12)))
					end
				end
			end
			p2:GiveTask(v5:GetPropertyChangedSignal("Capacity"):Connect(function() --[[ Line: 1457 | Upvalues: setupRewardTiers (copy), updatePoints (copy) ]]
				setupRewardTiers()
				updatePoints()
			end))
			setupRewardTiers()
		else
			local DEFAULT_CAPACITY = v8.DEFAULT_CAPACITY
			local _, v31, v322, _2, _3 = v8.GetTierInfo(0, DEFAULT_CAPACITY)
			v14.Text = v31
			v15.Text = ("0/%* Pts"):format((v21.splice(v322)))
			v13.Size = UDim2.fromScale(0, 1)
			v12.Size = UDim2.fromScale(0, 1)
			local v33 = v8.GetAllRewards()
			for i = 1, 5 do
				local v34 = v4.GetTagged(v11, "TierReward" .. i)
				local v352 = v4.GetTagged(v34, "PointsLabel")
				local v36 = v4.GetTagged(v34, "ClaimButton")
				local v37 = v4.GetTagged(v34, "RewardImage")
				local v38 = v4.GetTagged(v34, "AmountLabel")
				local v39 = v33[i]
				if v39 then
					v352.Text = v21.splice((v8.ScaleGoalAmount(v39.Goal, DEFAULT_CAPACITY))) .. " Pts"
					v352.Visible = true
				end
				v36.Visible = false
				if v39 and (v39.Rewards and v39.Rewards[1]) then
					local v41 = v39.Rewards[1]
					local v422 = v22.GetByName(v41.Name)
					local v43 = v8.ScaleRewardAmount(v41.Amount, DEFAULT_CAPACITY)
					p2:GiveTask((v23.new({
						DoNotClone = true,
						IgnoreBackgroundColor = true,
						Item = v422,
						GuiObject = v37,
						GetAmount = function() --[[ GetAmount | Line: 1503 | Upvalues: v43 (copy) ]]
							return v43
						end,
						AmountLabel = v38
					})))
				end
			end
		end
		local v44 = v4.GetTagged(p1, "HelpButton")
		p2:GiveTask(v3.new(v44, {
			Click = function() --[[ Click | Line: 1516 | Upvalues: v19 (ref), v4 (ref), v29 (ref) ]]
				v19.Prompt({
					Type = "Tutorial",
					Setup = function(p1, p2) --[[ Setup | Line: 1519 | Upvalues: v4 (ref), v29 (ref) ]]
						for v1, v2 in p1.Content.Prompts:GetChildren() do
							v2.Visible = v2.Name == "Template"
						end
						local Template = p1.Content.Prompts:FindFirstChild("Template")
						local v3 = v4.GetTemplate(Template, "Default")
						for v42, v5 in v29.StableClubsPromptData.ClubMissionPoints do
							local v6 = v3:Clone()
							p2.Maid:GiveTask(v6)
							v6.LayoutOrder = v42
							v4.GetTagged(v6, "TitleLabel").Text = ""
							v4.GetTagged(v6, "FrameText").Text = v5
							v6.Visible = true
							v6.Parent = v3.Parent
						end
					end,
					Run = function() --[[ Run | Line: 1543 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1546 ]]
						return true
					end
				})
			end
		}))
		local v45 = v4.GetTagged(p1, "MoreTasksButton")
		p2:GiveTask(v3.new(v45, {
			Click = function() --[[ Click | Line: 1555 | Upvalues: v19 (ref), v4 (ref), v35 (ref), v8 (ref), v29 (ref), RunService (ref) ]]
				v19.Prompt({
					Type = "Tutorial",
					Setup = function(p1, p2) --[[ Setup | Line: 1558 | Upvalues: v4 (ref), v35 (ref), v8 (ref), v29 (ref), RunService (ref) ]]
						for v1, v2 in p1.Content.Prompts:GetChildren() do
							v2.Visible = v2.Name == "ClubPoints"
						end
						local ClubPoints = p1.Content.Prompts:FindFirstChild("ClubPoints")
						local v3 = v4.GetTemplate(ClubPoints, "Default")
						local v42 = v3.Parent
						local StableClubs = v35.PlayerData.StableClubs
						local Cooldowns = StableClubs.Cooldowns
						local DailyPoints = StableClubs.DailyPoints
						local v5 = v8.GetDailyPointCaps()
						for v6, v7 in v29.StableClubsPromptData.EarnMorePoints do
							local v82 = v3:Clone()
							v82.Size = UDim2.fromScale(1, 0.66)
							p2.Maid:GiveTask(v82)
							local v9 = v4.GetTagged(v82, "DailyCapText")
							local v10 = DailyPoints:FindFirstChild(v6)
							if v10 and v5[v6] then
								v9.Text = ("Daily Points:<br/><font color=\'#D4A853\'><b>%*/%*</b></font>"):format(v10.Value, v5[v6])
								p2.Maid:GiveTask(v10:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1583 | Upvalues: v9 (copy), v10 (copy), v5 (copy), v6 (copy) ]]
									v9.Text = ("Daily Points:<br/><font color=\'#D4A853\'><b>%*/%*</b></font>"):format(v10.Value, v5[v6])
								end))
							else
								v9.Text = "Daily Points:<br/><font color=\'#D4A853\'><b>Unlimited</b></font>"
							end
							local v11 = v82
							v4.GetTagged(v11, "FrameText").Text = v7
							v11.Visible = true
							v11.Name = v6
							v11.Parent = v42
						end
						p2.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 1597 | Upvalues: Cooldowns (copy), v42 (copy), v4 (ref) ]]
							local v1 = workspace:GetServerTimeNow()
							for v2, v3 in Cooldowns:GetChildren() do
								local v43 = v42:FindFirstChild(v3.Name)
								if v43 then
									local v5 = v4.GetTagged(v43, "CooldownText")
									local v6 = v3.Value - v1
									if v6 <= 0 then
										v5.Text = "Cooldown:<br/> <font color=\'#D4A853\'><b>Avaliable</b></font>"
										continue
									end
									local v8 = math.floor((math.clamp(v6 / 60, 0, 999)))
									local v10 = math.floor((math.clamp(v6 - v8 * 60, 0, 59)))
									if #tostring(v8) <= 1 then
										v8 = ("0%*"):format(v8)
									end
									if #tostring(v10) <= 1 then
										v10 = ("0%*"):format(v10)
									end
									v5.Text = ("Cooldown:<br/> <font color=\'#D4A853\'><b>%*:%*</b></font>"):format(v8, v10)
								end
							end
						end))
					end,
					Run = function() --[[ Run | Line: 1628 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1631 ]]
						return true
					end
				})
			end
		}))
	end,
	MainMenu = function(p1, p2) --[[ MainMenu | Line: 1638 | Upvalues: v8 (copy), v35 (copy), v4 (copy), v3 (copy), v7 (copy), t (copy), v19 (copy), v29 (copy), v9 (copy), v20 (copy), setupRewardProgressFrame (copy), v14 (copy), v17 (copy), v15 (copy), v13 (copy), v11 (copy), v44 (copy), v58 (ref), v56 (copy), v21 (copy), v57 (copy) ]]
		local v1 = v8.GetPlayersClub(v35)
		local v2 = v4.GetTagged(p1, "NoClubFrame")
		local function UpdateClubInfo() --[[ UpdateClubInfo | Line: 1641 | Upvalues: v2 (copy), v8 (ref), v35 (ref) ]]
			v2.Visible = not v8.HasClub(v35)
		end
		p2:GiveTask(v1:GetPropertyChangedSignal("Value"):Connect(UpdateClubInfo))
		v2.Visible = not v8.HasClub(v35)
		local v32 = v4.GetTagged(p1, "CreateButton")
		p2:GiveTask(v3.new(v32, {
			Click = function() --[[ Click | Line: 1649 | Upvalues: v8 (ref), v35 (ref), v7 (ref), t (ref) ]]
				local v1, v2 = v8.CanCreateClub(v35)
				if v1 == true then
					t.OpenTab("CreateClub")
				else
					v7.NotifyIssue(v1, v2)
				end
			end
		}))
		local v42 = v4.GetTagged(p1, "CreateHelpButton")
		p2:GiveTask(v3.new(v42, {
			Click = function() --[[ Click | Line: 1662 | Upvalues: v19 (ref), v4 (ref), v29 (ref) ]]
				v19.Prompt({
					Type = "Tutorial",
					Setup = function(p1, p2) --[[ Setup | Line: 1665 | Upvalues: v4 (ref), v29 (ref) ]]
						for v1, v2 in p1.Content.Prompts:GetChildren() do
							v2.Visible = v2.Name == "Template"
						end
						local Template = p1.Content.Prompts:FindFirstChild("Template")
						local v3 = v4.GetTemplate(Template, "Default")
						for v42, v5 in v29.StableClubsPromptData.CreateClubText do
							local v6 = v3:Clone()
							p2.Maid:GiveTask(v6)
							v6.LayoutOrder = v42
							v4.GetTagged(v6, "TitleLabel").Text = ""
							v4.GetTagged(v6, "FrameText").Text = v5
							v6.Visible = true
							v6.Parent = v3.Parent
						end
					end,
					Run = function() --[[ Run | Line: 1689 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1692 ]]
						return true
					end
				})
			end
		}))
		local v5 = v4.GetTagged(p1, "JoinButton")
		p2:GiveTask(v3.new(v5, {
			Click = function() --[[ Click | Line: 1701 | Upvalues: t (ref) ]]
				t.OpenTab("ClubDirectory")
			end
		}))
		local v6 = p2:GiveTask(v9.new())
		local function setupRewardFrame() --[[ setupRewardFrame | Line: 1708 | Upvalues: v6 (copy), v20 (ref), v1 (copy), setupRewardProgressFrame (ref), p1 (copy) ]]
			v6:DoCleaning()
			setupRewardProgressFrame(p1, v6, (v20.GetById(v1.Value)))
		end
		p2:GiveTask(v1:GetPropertyChangedSignal("Value"):Connect(setupRewardFrame))
		v6:DoCleaning()
		setupRewardProgressFrame(p1, v6, (v20.GetById(v1.Value)))
		local v72 = v4.GetTemplate(p1, "DefaultText")
		local v82 = v4.GetTemplate(p1, "DefaultTextWithImage")
		p2:GiveTask(task.spawn(function() --[[ Line: 1718 | Upvalues: v20 (ref), v1 (copy), v14 (ref), v17 (ref), v15 (ref), v82 (copy), v72 (copy), v4 (ref), v13 (ref), p2 (copy) ]]
			local v12 = v20.GetById(v1.Value)
			if not v12 then
				return
			end
			local v2 = v14.safeCall(function() --[[ Line: 1724 | Upvalues: v12 (copy) ]]
				return v12:GetActivityFeed()
			end)
			if not v2 or v17.Count(v2) == 0 then
				task.wait(1)
				v2 = v12:GetActivityFeed()
			end
			if not v2 or v17.Count(v2) == 0 then
				return
			end
			for v5, v6 in v2 do
				local v42
				if v6.Player then
					v6.Image = v15.GetUserThumbnail(v6.Player, "AvatarBust")
				end
				v42 = if v6.Image then v82:Clone() else v72:Clone()
				v42.LayoutOrder = -v5
				v4.GetTagged(v42, "Timestamp").Text = ("%* (%*)"):format(v13.GetFormattedTime("h:i A", v5), (v13.GetFormattedTime("M. j", v5)))
				v4.GetTagged(v42, "TextLabel").Text = v6.Text
				if v6.Image then
					v4.GetTagged(v42, "PlayerImage").Image = v6.Image
				end
				p2:GiveTask(v42)
				v42.Visible = true
				v42.Parent = v72.Parent
			end
		end))
		p2:GiveTask(task.spawn(function() --[[ Line: 1770 | Upvalues: p2 (copy), v11 (ref), p1 (copy), v20 (ref), v44 (ref), v58 (ref), t (ref) ]]
			p2:GiveTask(v11.new(p1, {
				ViewButtonCallback = function(p1) --[[ ViewButtonCallback | Line: 1772 | Upvalues: v20 (ref), v44 (ref), v58 (ref), t (ref) ]]
					local v1 = p1.ClubId and v20.GetById(p1.ClubId)
					if not v1 and (p1.ClubId and v44:InvokeServer(p1.ClubId)) then
						local v2 = os.clock() + 5
						local v3
						repeat
							task.wait()
							v3 = v20.GetById(p1.ClubId)
						until v3 or v2 < os.clock()
						v1 = v3
					end
					if not v1 then
						return
					end
					v58 = v1
					t.OpenTab("MyClub", { v1 })
				end
			}))
		end))
		local v92 = v4.GetTagged(p1, "HelpButton")
		p2:GiveTask(v3.new(v92, {
			Click = function() --[[ Click | Line: 1795 | Upvalues: v19 (ref), v4 (ref), v29 (ref) ]]
				v19.Prompt({
					Type = "Tutorial",
					Setup = function(p1, p2) --[[ Setup | Line: 1798 | Upvalues: v4 (ref), v29 (ref) ]]
						for v1, v2 in p1.Content.Prompts:GetChildren() do
							v2.Visible = v2.Name == "Template"
						end
						local Template = p1.Content.Prompts:FindFirstChild("Template")
						local v3 = v4.GetTemplate(Template, "Default")
						for v42, v5 in v29.StableClubsPromptData.Leaderboard do
							local v6 = v3:Clone()
							p2.Maid:GiveTask(v6)
							v6.LayoutOrder = v42
							v4.GetTagged(v6, "TitleLabel").Text = ""
							v4.GetTagged(v6, "FrameText").Text = v5
							v6.Visible = true
							v6.Parent = v3.Parent
						end
					end,
					Run = function() --[[ Run | Line: 1822 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 1825 ]]
						return true
					end
				})
			end
		}))
		local v10 = v4.GetTagged(p1, "LeaderboardRewards")
		local v112 = v4.GetTagged(p1, "RewardFrame")
		local v12 = v4.GetTagged(p1, "ClaimLabel")
		local function updateLeaderboardRewardVisibility() --[[ updateLeaderboardRewardVisibility | Line: 1837 | Upvalues: v56 (ref), v112 (copy), v10 (copy), v12 (copy), v21 (ref) ]]
			local v1, v2, v3 = pcall(function() --[[ Line: 1838 | Upvalues: v56 (ref) ]]
				return v56:InvokeServer()
			end)
			if not v1 then
				v2 = false
				v3 = nil
			end
			v112.Visible = not v2
			v10.Visible = v2
			if not v3 then
				return
			end
			v12.Text = ("Your club came in %* place last week, claim your reward below!"):format((v21.GetOrdinalOfNumber(v3)))
		end
		p2:GiveTask(task.spawn(updateLeaderboardRewardVisibility))
		local v132 = v4.GetTagged(p1, "ClaimButton")
		p2:GiveTask(v3.new(v132, {
			Click = function() --[[ Click | Line: 1858 | Upvalues: v57 (ref), v7 (ref), p2 (copy), updateLeaderboardRewardVisibility (copy) ]]
				local v1 = v57:InvokeServer()
				if v1 == true then
					p2:GiveTask(task.spawn(updateLeaderboardRewardVisibility))
				else
					v7.NotifyIssue(v1)
				end
			end
		}))
	end,
	CreateClub = function(p1, p2) --[[ CreateClub | Line: 1869 | Upvalues: initializeClubSettingsScreen (copy) ]]
		initializeClubSettingsScreen(p1, p2, false)
	end,
	MyClubEditing = function(p1, p2, p3) --[[ MyClubEditing | Line: 1872 | Upvalues: initializeClubSettingsScreen (copy) ]]
		initializeClubSettingsScreen(p1, p2, p3)
	end,
	MyClub = function(p1, p2, p3) --[[ MyClub | Line: 1875 | Upvalues: v58 (ref), v8 (copy), v35 (copy), v20 (copy), t (copy), v4 (copy), v31 (copy), v30 (copy), v13 (copy), v14 (copy), v15 (copy), Players (copy), setupRewardProgressFrame (copy), v9 (copy), v33 (copy), v16 (copy), StableClubMissionTimer (copy), v21 (copy), v17 (copy), v3 (copy), v7 (copy), v52 (copy) ]]
		v58 = nil
		local v1 = v8.GetPlayersClub(v35)
		local v2 = p3 or v20.GetById(v1.Value)
		if not v2 then
			t.OpenTab("MainMenu")
			return
		end
		local v32 = v2:GetMemberData(v35.Player.UserId)
		local v42 = v4.GetTagged(p1, "ClubName")
		p2:GiveTask(v2:BindToProperty("Name", function(p1) --[[ Line: 1888 | Upvalues: v42 (copy) ]]
			v42.Text = p1
		end))
		local v5 = v4.GetTagged(p1, "ClubAbout")
		p2:GiveTask(v2:BindToProperty("About", function(p1) --[[ Line: 1893 | Upvalues: v5 (copy) ]]
			v5.Text = p1
		end))
		local v6 = v4.GetTagged(p1, "ClubStatus")
		p2:GiveTask(v2:BindToProperty("Status", function(p1) --[[ Line: 1898 | Upvalues: v6 (copy) ]]
			v6.Text = p1
		end))
		local v72 = v4.GetTagged(p1, "ClubIcon")
		p2:GiveTask(v2:BindToProperty("CurrentIcon", function(p1) --[[ Line: 1903 | Upvalues: v72 (copy), v31 (ref) ]]
			v72.Image = v31[p1].Image
		end))
		local v82 = v4.GetTagged(p1, "ClubBanner")
		p2:GiveTask(v2:BindToProperty("CurrentBanner", function(p1) --[[ Line: 1908 | Upvalues: v82 (copy), v30 (ref) ]]
			v82.Image = v30[p1].Image
		end))
		local v92 = v4.GetTagged(p1, "ClubCreation")
		p2:GiveTask(v2:BindToProperty("CreatedAt", function(p1) --[[ Line: 1913 | Upvalues: v92 (copy), v13 (ref) ]]
			v92.Text = "Created " .. v13.GetFormattedTime("F j, Y", p1)
		end))
		local v10 = v4.GetTagged(p1, "ClubLeader")
		local function updateClubLeader() --[[ updateClubLeader | Line: 1918 | Upvalues: v2 (copy), v14 (ref), v15 (ref), v10 (copy) ]]
			v10.Text = "Lead by " .. (v14.safeCall(v15.GetUserNameFromUserId, (v2:GetOwner())) or "Unknown")
		end
		p2:GiveTask(v2.MemberUpdated:Connect(updateClubLeader))
		task.spawn(updateClubLeader)
		local v11 = v4.GetTagged(p1, "CapacityLabel")
		local function updateCapacity() --[[ updateCapacity | Line: 1927 | Upvalues: v2 (copy), v11 (copy) ]]
			local v1, v22 = v2:GetCapacity()
			v11.Text = ("%*/%* Members"):format(v22, v1)
		end
		p2:GiveTask(v2:GetPropertyChangedSignal("Capacity"):Connect(updateCapacity))
		p2:GiveTask(v2.MemberAdded:Connect(updateCapacity))
		p2:GiveTask(v2.MemberRemoved:Connect(updateCapacity))
		local v12, v132 = v2:GetCapacity()
		v11.Text = ("%*/%* Members"):format(v132, v12)
		local function updateOnlineStatus() --[[ updateOnlineStatus | Line: 1936 | Upvalues: v4 (ref), p1 (copy), Players (ref), v2 (copy) ]]
			local v1 = v4.GetTagged(p1, "OnlineLabel")
			local count = 0
			for v22, v3 in Players:GetPlayers() do
				if v2:IsInClub(v3.UserId) then
					count = count + 1
				end
			end
			v1.Text = ("%* in-game"):format(count)
		end
		v14.bindToAddRemove(Players, updateOnlineStatus, updateOnlineStatus, p2)
		p2:GiveTask(v2.MemberAdded:Connect(updateOnlineStatus))
		p2:GiveTask(v2.MemberRemoved:Connect(updateOnlineStatus))
		updateOnlineStatus()
		setupRewardProgressFrame(p1, p2, v2)
		local v142 = v4.GetTemplate(p1, "DefaultMember")
		v2:BindToMembers(function(p1, p22) --[[ Line: 1958 | Upvalues: v9 (ref), p2 (copy), v142 (copy), v4 (ref), v33 (ref), v16 (ref), v14 (ref), v15 (ref), Players (ref), StableClubMissionTimer (ref), v21 (ref) ]]
			local v1 = v9.new()
			p2[p1] = v1
			local v2 = v142:Clone()
			v2.Name = p1
			local v3 = v4.GetTagged(v2, "RankLabel")
			local v42 = v4.GetTagged(v2, "Tag")
			local function updateRole() --[[ updateRole | Line: 1967 | Upvalues: v33 (ref), p22 (copy), v3 (copy), v16 (ref), v42 (copy) ]]
				local v1 = v33[p22.Role]
				v3.Text = v16.GetDisplayName(v1.Name, v1)
				v3.TextColor3 = v1.TextColor
				v42.BackgroundColor3 = v1.BackgroundColor
			end
			v1:GiveTask(p22.MemberUpdated:Connect(updateRole))
			local v5 = v33[p22.Role]
			v3.Text = v16.GetDisplayName(v5.Name, v5)
			v3.TextColor3 = v5.TextColor
			v42.BackgroundColor3 = v5.BackgroundColor
			v1:GiveTask(task.spawn(function() --[[ Line: 1977 | Upvalues: v4 (ref), v2 (copy), v14 (ref), v15 (ref), p1 (copy) ]]
				v4.GetTagged(v2, "DisplayNameLabel").Text = v14.safeCall(function() --[[ Line: 1979 | Upvalues: v15 (ref), p1 (ref) ]]
					return v15.GetUserNameFromUserId(p1, "Username")
				end) or "Unknown"
			end))
			v1:GiveTask(task.spawn(function() --[[ Line: 1985 | Upvalues: v4 (ref), v2 (copy), v14 (ref), v15 (ref), p1 (copy) ]]
				v4.GetTagged(v2, "UsernameLabel").Text = "@" .. (v14.safeCall(function() --[[ Line: 1987 | Upvalues: v15 (ref), p1 (ref) ]]
					return v15.GetUserNameFromUserId(p1)
				end) or "Unknown")
			end))
			v1:GiveTask(task.spawn(function() --[[ Line: 1993 | Upvalues: v4 (ref), v2 (copy), v14 (ref), v15 (ref), p1 (copy) ]]
				v4.GetTagged(v2, "PlayerImage").Image = v14.safeCall(function() --[[ Line: 1995 | Upvalues: v15 (ref), p1 (ref) ]]
					return v15.GetUserThumbnail(p1)
				end) or ""
			end))
			local v6 = v4.GetTagged(v2, "OfflineFrame")
			local function updateOnlineStatus(p12, p2) --[[ updateOnlineStatus | Line: 2003 | Upvalues: Players (ref), p1 (copy), v6 (copy), v33 (ref), p22 (copy), v2 (copy) ]]
				if p2 then
					return
				end
				local v1 = Players:GetPlayerByUserId(p1)
				v6.Visible = not v1
				v2.LayoutOrder = -((if v1 then 1000 else 0) + v33[p22.Role].RoleId)
			end
			v14.bindToAddRemove(Players, updateOnlineStatus, updateOnlineStatus, v1)
			local v7 = Players:GetPlayerByUserId(p1)
			v6.Visible = not v7
			local v8 = v33[p22.Role]
			v2.LayoutOrder = -((if v7 then 1000 else 0) + v8.RoleId)
			local v10 = v4.GetTagged(v2, "PointsLabel")
			local function updatePointTotal() --[[ updatePointTotal | Line: 2019 | Upvalues: StableClubMissionTimer (ref), p22 (copy), v10 (copy), v21 (ref) ]]
				local Contribution = p22.Contribution
				v10.Text = ("%* Pts"):format((v21.splice(if Contribution and Contribution.Seed == StableClubMissionTimer.CurrentSeed then Contribution.Points or 0 else 0)))
			end
			v1:GiveTask(p22.MemberUpdated:Connect(updatePointTotal))
			v1:GiveTask(StableClubMissionTimer.SeedChanged:Connect(updatePointTotal))
			local CurrentSeed = StableClubMissionTimer.CurrentSeed
			local Contribution = p22.Contribution
			v10.Text = ("%* Pts"):format((v21.splice(if Contribution and Contribution.Seed == CurrentSeed then Contribution.Points or 0 else 0)))
			v1:GiveTask(v2)
			v2.Visible = true
			v2.Parent = v142.Parent
		end, function(p1) --[[ Line: 2038 | Upvalues: p2 (copy) ]]
			p2[p1] = nil
		end, p2)
		local v152 = v4.GetTemplate(p1, "DefaultText")
		local v162 = v4.GetTemplate(p1, "DefaultTextWithImage")
		p2:GiveTask(task.spawn(function() --[[ Line: 2044 | Upvalues: v14 (ref), v2 (copy), v17 (ref), v15 (ref), v162 (copy), v152 (copy), v4 (ref), v13 (ref), p2 (copy) ]]
			local v1 = v14.safeCall(function() --[[ Line: 2045 | Upvalues: v2 (ref) ]]
				return v2:GetActivityFeed()
			end)
			if not v1 or v17.Count(v1) == 0 then
				task.wait(1)
				v1 = v2:GetActivityFeed()
			end
			if not v1 or v17.Count(v1) == 0 then
				return
			end
			for v42, v5 in v1 do
				local v3
				if v5.Player then
					v5.Image = v15.GetUserThumbnail(v5.Player, "AvatarBust")
				end
				v3 = if v5.Image then v162:Clone() else v152:Clone()
				v3.LayoutOrder = -v42
				v4.GetTagged(v3, "Timestamp").Text = ("%* (%*)"):format(v13.GetFormattedTime("h:i A", v42), (v13.GetFormattedTime("M. j", v42)))
				v4.GetTagged(v3, "TextLabel").Text = v5.Text
				if v5.Image then
					v4.GetTagged(v3, "PlayerImage").Image = v5.Image
				end
				p2:GiveTask(v3)
				v3.Visible = true
				v3.Parent = v152.Parent
			end
		end))
		local v172 = v4.GetTagged(p1, "EditButton")
		local v18 = v4.GetTagged(p1, "RequestsButton")
		local v19 = v4.GetTagged(p1, "ViewButton")
		v19.Visible = v32 ~= nil
		p2:GiveTask(v3.new(v19, {
			Click = function() --[[ Click | Line: 2097 | Upvalues: t (ref), v2 (copy) ]]
				t.OpenTab("MyClubMembers", { v2 })
			end
		}))
		if not v32 then
			v172.Visible = false
			v18.Visible = false
			v4.GetTemplate(p1, "DefaultRecentRequest").Parent.Visible = false
			return
		end
		p2:GiveTask(v3.new(v172, {
			Click = function() --[[ Click | Line: 2104 | Upvalues: v2 (copy), v35 (ref), v7 (ref), t (ref) ]]
				local v1 = v2:CanUpdate(v35)
				if v1 == true then
					t.OpenTab("MyClubEditing", { v2 })
				else
					v7.NotifyIssue(v1)
				end
			end
		}))
		local function updateEditButton() --[[ updateEditButton | Line: 2114 | Upvalues: v172 (copy), v2 (copy), v35 (ref) ]]
			v172.Visible = v2:CanUpdate(v35)
		end
		p2:GiveTask(v32.MemberUpdated:Connect(updateEditButton))
		v172.Visible = v2:CanUpdate(v35)
		p2:GiveTask(v3.new(v18, {
			Click = function() --[[ Click | Line: 2121 | Upvalues: t (ref), v2 (copy) ]]
				t.OpenTab("MyClubRequests", { v2 })
			end
		}))
		local v212 = v4.GetTemplate(p1, "DefaultRecentRequest")
		if v2:IsOwner(v35.Player.UserId) then
			local v22 = v4.GetTagged(v18, "Notification")
			local v23 = v4.GetTagged(v22, "TextLabel")
			local v24 = p2:GiveTask(v9.new())
			local function updateRecentRequestFrame() --[[ updateRecentRequestFrame | Line: 2133 | Upvalues: v52 (ref), v17 (ref), v22 (copy), v23 (copy), v24 (copy), v212 (copy), v15 (ref) ]]
				local v1 = v52:InvokeServer()
				local v2 = v17.Count(v1)
				v22.Visible = v2 > 0
				v23.Text = v2
				v24:DoCleaning()
				local count = 0
				for v5, v6 in v1 do
					if count >= 3 then
						break
					end
					local v7 = tonumber(v6)
					local v8 = v212:Clone()
					v8.Name = v7
					v8.LayoutOrder = -count
					v8.Image = v15.GetUserThumbnail(v7, "AvatarBust")
					v8.ImageTransparency = count * 0.2 + 0.2
					v24:GiveTask(v8)
					v8.Visible = true
					v8.Parent = v212.Parent
					count = count + 1
				end
			end
			p2:GiveTask(v14.spawnLoop(updateRecentRequestFrame, 10))
			updateRecentRequestFrame()
		else
			v212.Parent.Visible = false
		end
	end,
	MyClubMembers = function(p1, p2, p3) --[[ MyClubMembers | Line: 2175 | Upvalues: t (copy), v4 (copy), v35 (copy), v9 (copy), v33 (copy), v16 (copy), v13 (copy), v21 (copy), v14 (copy), v15 (copy), v3 (copy), v39 (copy), v38 (copy), v40 (copy), v19 (copy), v12 (copy), v41 (copy), v55 (copy), v7 (copy), v8 (copy), v18 (copy), MAX_CAPACITY (copy), v42 (copy), v43 (copy), v29 (copy) ]]
		if not p3 then
			t.OpenTab("MainMenu")
			return
		end
		local v1 = p3:GetProperty("Name")
		local v2 = v4.GetTemplate(p1, "DefaultMember")
		local v32 = p3:GetMemberData(v35.Player.UserId)
		p2:GiveTask(p3:BindToProperty("Name", function(p1) --[[ Line: 2185 | Upvalues: v1 (ref) ]]
			v1 = p1
		end))
		p3:BindToMembers(function(p1, p22) --[[ Line: 2189 | Upvalues: v9 (ref), v2 (copy), v4 (ref), p3 (copy), v33 (ref), v16 (ref), v13 (ref), v21 (ref), p2 (copy), v14 (ref), v15 (ref), v3 (ref), v35 (ref), v39 (ref), v32 (copy), v38 (ref), v40 (ref), v19 (ref), v1 (ref), v12 (ref), v41 (ref) ]]
			local v17 = v9.new()
			local v22 = v2:Clone()
			v17:GiveTask(v22)
			v22.Name = p1
			local v34 = v4.GetTagged(v22, "RankLabel")
			local v42 = v4.GetTagged(v22, "Tag")
			local function updateRole() --[[ updateRole | Line: 2198 | Upvalues: p3 (ref), p1 (copy), v33 (ref), v22 (copy), v34 (copy), v16 (ref), v42 (copy) ]]
				local v1 = p3:GetMemberData(p1)
				if v1 then
					local v2 = v33[v1.Role]
					v22.LayoutOrder = -v2.RoleId
					v34.Text = v16.GetDisplayName(v2.Name, v2)
					v34.TextColor3 = v2.TextColor
					v42.BackgroundColor3 = v2.BackgroundColor
				end
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updateRole))
			local v5 = p3:GetMemberData(p1)
			if v5 then
				local v6 = v33[v5.Role]
				v22.LayoutOrder = -v6.RoleId
				v34.Text = v16.GetDisplayName(v6.Name, v6)
				v34.TextColor3 = v6.TextColor
				v42.BackgroundColor3 = v6.BackgroundColor
			end
			local v7 = v4.GetTagged(v22, "JoinLabel")
			local function updateJoinLabel() --[[ updateJoinLabel | Line: 2214 | Upvalues: p3 (ref), p1 (copy), v7 (copy), v13 (ref) ]]
				local v1 = p3:GetMemberData(p1)
				if not v1 then
					return
				end
				v7.Text = "Joined\n" .. v13.GetFormattedTime("M. j, Y", v1.JoinedAt)
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updateJoinLabel))
			local v8 = p3:GetMemberData(p1)
			if v8 then
				v7.Text = "Joined\n" .. v13.GetFormattedTime("M. j, Y", v8.JoinedAt)
			end
			local v92 = v4.GetTagged(v22, "PointsLabel")
			local function updatePoints() --[[ updatePoints | Line: 2224 | Upvalues: v92 (copy), v21 (ref), p22 (copy) ]]
				v92.Text = ("%* Pts"):format((v21.suffix(p22.ContributedPoints)))
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updatePoints))
			v92.Text = ("%* Pts"):format((v21.suffix(p22.ContributedPoints)))
			p2:GiveTask(task.spawn(function() --[[ Line: 2230 | Upvalues: v4 (ref), v22 (copy), v14 (ref), v15 (ref), p1 (copy) ]]
				v4.GetTagged(v22, "DisplayNameLabel").Text = v14.safeCall(function() --[[ Line: 2232 | Upvalues: v15 (ref), p1 (ref) ]]
					return v15.GetUserNameFromUserId(p1, "Username")
				end) or "Unknown"
			end))
			p2:GiveTask(task.spawn(function() --[[ Line: 2238 | Upvalues: v4 (ref), v22 (copy), v14 (ref), v15 (ref), p1 (copy) ]]
				v4.GetTagged(v22, "UsernameLabel").Text = "@" .. (v14.safeCall(function() --[[ Line: 2240 | Upvalues: v15 (ref), p1 (ref) ]]
					return v15.GetUserNameFromUserId(p1)
				end) or "Unknown")
			end))
			p2:GiveTask(task.spawn(function() --[[ Line: 2246 | Upvalues: v4 (ref), v22 (copy), v14 (ref), v15 (ref), p1 (copy) ]]
				v4.GetTagged(v22, "PlayerImage").Image = v14.safeCall(function() --[[ Line: 2248 | Upvalues: v15 (ref), p1 (ref) ]]
					return v15.GetUserThumbnail(p1)
				end) or ""
			end))
			local v10 = v4.GetTagged(v22, "DemoteButton")
			v17:GiveTask(v3.new(v10, {
				Click = function() --[[ Click | Line: 2257 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v39 (ref) ]]
					if p3:CanChangeRank(v35, p1, false) then
						v39:FireServer(p1)
					end
				end
			}))
			local function updateDemoteButton() --[[ updateDemoteButton | Line: 2266 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v10 (copy) ]]
				local v1 = p3:CanChangeRank(v35, p1, false)
				v10.Visible = p3:MemberHasPermission(v35, "CanChangeRole") and v1
			end
			if v32 then
				v17:GiveTask(v32.MemberUpdated:Connect(updateDemoteButton))
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updateDemoteButton))
			local v11 = p3:CanChangeRank(v35, p1, false)
			v10.Visible = p3:MemberHasPermission(v35, "CanChangeRole") and v11
			local v122 = v4.GetTagged(v22, "PromoteButton")
			v17:GiveTask(v3.new(v122, {
				Click = function() --[[ Click | Line: 2279 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v38 (ref) ]]
					if p3:CanChangeRank(v35, p1, true) then
						v38:FireServer(p1)
					end
				end
			}))
			local function updatePromoteButton() --[[ updatePromoteButton | Line: 2288 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v122 (copy) ]]
				local v1 = p3:CanChangeRank(v35, p1, true)
				v122.Visible = p3:MemberHasPermission(v35, "CanChangeRole") and v1
			end
			if v32 then
				v17:GiveTask(v32.MemberUpdated:Connect(updatePromoteButton))
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updatePromoteButton))
			local v132 = p3:CanChangeRank(v35, p1, true)
			v122.Visible = p3:MemberHasPermission(v35, "CanChangeRole") and v132
			local v142 = v4.GetTagged(v22, "KickButton")
			v17:GiveTask(v3.new(v142, {
				Click = function() --[[ Click | Line: 2301 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v40 (ref) ]]
					if p3:CanKick(v35, p1) then
						v40:FireServer(p1)
					end
				end
			}))
			local function updateKickButton() --[[ updateKickButton | Line: 2310 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v142 (copy) ]]
				local v1 = p3:CanKick(v35, p1)
				v142.Visible = p3:MemberHasPermission(v35, "CanKick") and v1
			end
			if v32 then
				v17:GiveTask(v32.MemberUpdated:Connect(updateKickButton))
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updateKickButton))
			local v152 = p3:CanKick(v35, p1)
			v142.Visible = p3:MemberHasPermission(v35, "CanKick") and v152
			local v162 = v4.GetTagged(v22, "TransferButton")
			v17:GiveTask(v3.new(v162, {
				Click = function() --[[ Click | Line: 2323 | Upvalues: p3 (ref), v35 (ref), p1 (copy), v19 (ref), v4 (ref), v1 (ref), v15 (ref), v12 (ref), v41 (ref) ]]
					if p3:CanTransfer(v35, p1) then
						local v13 = false
						v19.Prompt({
							Type = "TransferOwnership",
							Setup = function(p12, p2) --[[ Setup | Line: 2333 | Upvalues: v4 (ref), v1 (ref), v15 (ref), p1 (ref), v13 (ref) ]]
								local v12 = v4.GetTagged(p12, "Label")
								p2.Maid:GiveTask(task.spawn(function() --[[ Line: 2335 | Upvalues: v12 (copy), v1 (ref), v15 (ref), p1 (ref) ]]
									v12.Text = ("Are you sure you want to transfer %* to @%*?"):format(v1, (v15.GetUserNameFromUserId(p1, "Username")))
									local v13 = v12
									v13.Text = v13.Text .. "\n\nType the exact club name to confirm."
								end))
								local v2 = v4.GetTagged(p12, "TextBox")
								p2.Maid:GiveTask(v2:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 2341 | Upvalues: v13 (ref), v2 (copy), v1 (ref) ]]
									v13 = v2.Text == v1
								end))
								p2.Maid:GiveTask(function() --[[ Line: 2345 | Upvalues: v12 (copy) ]]
									v12.Text = ""
								end)
							end,
							Run = function() --[[ Run | Line: 2349 | Upvalues: v13 (ref), v12 (ref), v41 (ref), p1 (ref) ]]
								if v13 then
									v41:FireServer(p1)
									return true
								else
									v12.Notify({
										Message = "The club name does not match!",
										Preset = "Red"
									})
								end
							end
						})
					end
				end
			}))
			local function updateTransferButton() --[[ updateTransferButton | Line: 2365 | Upvalues: v162 (copy), p3 (ref), v35 (ref), p1 (copy) ]]
				v162.Visible = p3:CanTransfer(v35, p1)
			end
			if v32 then
				v17:GiveTask(v32.MemberUpdated:Connect(updateTransferButton))
			end
			v17:GiveTask(p22.MemberUpdated:Connect(updateTransferButton))
			v162.Visible = p3:CanTransfer(v35, p1)
			p2[p1] = v17
			v22.Visible = true
			v22.Parent = v2.Parent
		end, function(p1) --[[ Line: 2378 | Upvalues: p2 (copy) ]]
			p2[p1] = nil
		end, p2)
		local v44 = v4.GetTagged(p1, "BuyButton")
		local v5 = v4.GetTagged(p1, "RobuxBuyButton")
		local v6 = v4.GetTagged(p1, "BuyLabel")
		p2:GiveTask(v3.new(v44, {
			Click = function() --[[ Click | Line: 2386 | Upvalues: v55 (ref), v7 (ref), v12 (ref) ]]
				local v1 = v55:InvokeServer()
				if v1 == true then
					v12.Notify({
						Message = "You bought 4 club slots!",
						Preset = "Green"
					})
				else
					v7.NotifyIssue(v1)
				end
			end
		}))
		p2:GiveTask(v3.new(v5, {
			Click = function() --[[ Click | Line: 2400 | Upvalues: p3 (copy), v8 (ref), v18 (ref), v35 (ref) ]]
				local _, v2 = v8.GetUpgradePriceForCapacity((p3:GetCapacity()))
				v18.PromptPurchase(v35.Player, v2)
			end
		}))
		local function updateBuyButtons() --[[ updateBuyButtons | Line: 2406 | Upvalues: p3 (copy), MAX_CAPACITY (ref), v35 (ref), v44 (copy), v5 (copy), v6 (copy), v4 (ref), p2 (copy), v8 (ref), v21 (ref), v18 (ref) ]]
			local v1 = p3:GetCapacity()
			local v2 = v1 < MAX_CAPACITY
			if p3:MemberHasPermission(v35, "CanBuySlots") and v2 then
				v44.Visible = v2
				v5.Visible = v2
				v6.Visible = v2
				local v3 = v4.GetTagged(v44, "TextLabel")
				local v42 = v4.GetTagged(v5, "TextLabel")
				p2:GiveTask(task.spawn(function() --[[ Line: 2425 | Upvalues: v8 (ref), v1 (copy), v3 (copy), v21 (ref), v42 (copy), v18 (ref) ]]
					local v12, v2 = v8.GetUpgradePriceForCapacity(v1)
					v3.Text = v21.suffix(v12)
					v42.Text = v18.GetPriceForProduct(v2, true, true) .. " "
				end))
			else
				v44.Visible = false
				v5.Visible = false
				v6.Visible = false
			end
		end
		p2:GiveTask(p3:GetPropertyChangedSignal("Capacity"):Connect(updateBuyButtons))
		if v32 then
			p2:GiveTask(v32.MemberUpdated:Connect(updateBuyButtons))
		end
		updateBuyButtons()
		local v72 = v4.GetTagged(p1, "CapacityLabel")
		local function updateCapacityLabel() --[[ updateCapacityLabel | Line: 2438 | Upvalues: p3 (copy), v72 (copy) ]]
			local v1, v2 = p3:GetCapacity()
			v72.Text = ("%*/%* Members"):format(v2, v1)
		end
		p2:GiveTask(p3:GetPropertyChangedSignal("Capacity"):Connect(updateCapacityLabel))
		p2:GiveTask(p3.MemberAdded:Connect(updateCapacityLabel))
		p2:GiveTask(p3.MemberRemoved:Connect(updateCapacityLabel))
		local v82, v92 = p3:GetCapacity()
		v72.Text = ("%*/%* Members"):format(v92, v82)
		local v10 = v4.GetTagged(p1, "LeaveButton")
		p2:GiveTask(v3.new(v10, {
			Click = function() --[[ Click | Line: 2449 | Upvalues: p3 (copy), v35 (ref), v19 (ref), v4 (ref), v1 (ref), v42 (ref), v12 (ref), t (ref) ]]
				if p3:CanLeave(v35) then
					v19.Prompt({
						Type = "LeaveClub",
						Setup = function(p1, p2) --[[ Setup | Line: 2457 | Upvalues: v4 (ref), v1 (ref) ]]
							v4.GetTagged(p1, "Label").Text = ("Are you sure you want to leave %*?"):format(v1)
						end,
						Run = function() --[[ Run | Line: 2461 | Upvalues: v42 (ref), v12 (ref), t (ref) ]]
							if v42:InvokeServer() then
								v12.Notify({
									Message = "You left the club!",
									Preset = "Green"
								})
								t.OpenTab("MainMenu")
								return true
							end
						end
					})
				end
			end
		}))
		local function updateLeaveButton() --[[ updateLeaveButton | Line: 2479 | Upvalues: v10 (copy), p3 (copy), v35 (ref) ]]
			v10.Visible = p3:CanLeave(v35)
		end
		if v32 then
			p2:GiveTask(v32.MemberUpdated:Connect(updateLeaveButton))
		end
		v10.Visible = p3:CanLeave(v35)
		local v11 = v4.GetTagged(p1, "DeleteButton")
		p2:GiveTask(v3.new(v11, {
			Click = function() --[[ Click | Line: 2489 | Upvalues: p3 (copy), v35 (ref), v19 (ref), v4 (ref), v1 (ref), v12 (ref), v43 (ref), t (ref) ]]
				if p3:CanDelete(v35) then
					local v13 = false
					v19.Prompt({
						Type = "DeleteClub",
						Setup = function(p1, p2) --[[ Setup | Line: 2499 | Upvalues: v4 (ref), v1 (ref), v13 (ref) ]]
							v4.GetTagged(p1, "Label").Text = ("Are you sure you want to delete %*? If so, type the exact club name to confirm."):format(v1)
							local v12 = v4.GetTagged(p1, "TextBox")
							p2.Maid:GiveTask(v12:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 2504 | Upvalues: v13 (ref), v12 (copy), v1 (ref) ]]
								v13 = v12.Text == v1
							end))
							p2.Maid:GiveTask(function() --[[ Line: 2508 | Upvalues: v12 (copy) ]]
								v12.Text = ""
							end)
						end,
						Run = function() --[[ Run | Line: 2512 | Upvalues: v13 (ref), v12 (ref), v43 (ref), t (ref) ]]
							if not v13 then
								v12.Notify({
									Message = "The club name does not match!",
									Preset = "Red"
								})
								return
							end
							if v43:InvokeServer() then
								v12.Notify({
									Message = "Club deleted!",
									Preset = "Green"
								})
								t.OpenTab("MainMenu")
								return true
							end
						end
					})
				end
			end
		}))
		local function updateDeleteButton() --[[ updateDeleteButton | Line: 2537 | Upvalues: v11 (copy), p3 (copy), v35 (ref) ]]
			v11.Visible = p3:CanDelete(v35)
		end
		if v32 then
			p2:GiveTask(v32.MemberUpdated:Connect(updateDeleteButton))
		end
		v11.Visible = p3:CanDelete(v35)
		local v122 = v4.GetTagged(p1, "BackButton")
		p2:GiveTask(v3.new(v122, {
			Click = function() --[[ Click | Line: 2547 | Upvalues: t (ref) ]]
				t.OpenTab("MyClub")
			end
		}))
		local v132 = v4.GetTagged(p1, "HelpButton")
		p2:GiveTask(v3.new(v132, {
			Click = function() --[[ Click | Line: 2554 | Upvalues: v19 (ref), v4 (ref), v29 (ref) ]]
				v19.Prompt({
					Type = "Tutorial",
					Setup = function(p1, p2) --[[ Setup | Line: 2557 | Upvalues: v4 (ref), v29 (ref) ]]
						for v1, v2 in p1.Content.Prompts:GetChildren() do
							v2.Visible = v2.Name == "Template"
						end
						local Template = p1.Content.Prompts:FindFirstChild("Template")
						local v3 = v4.GetTemplate(Template, "Default")
						for v42, v5 in v29.StableClubsPromptData.ManageMembers do
							local v6 = v3:Clone()
							p2.Maid:GiveTask(v6)
							v6.LayoutOrder = v42
							v4.GetTagged(v6, "TitleLabel").Text = ""
							v4.GetTagged(v6, "FrameText").Text = v5
							v6.Visible = true
							v6.Parent = v3.Parent
						end
					end,
					Run = function() --[[ Run | Line: 2581 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 2584 ]]
						return true
					end
				})
			end
		}))
	end
}
function t.OpenTab(p1, p2) --[[ OpenTab | Line: 2594 | Upvalues: Menu (copy), v5 (copy) ]]
	local v1 = Menu.TabFrames:FindFirstChild(p1)
	if not v1 then
		return
	end
	v5.OpenTab(v1, p2)
end
function t.Open() --[[ Open | Line: 2602 | Upvalues: v2 (copy), ContainerFrame (copy) ]]
	v2.OpenMainFrame(ContainerFrame)
end
function t.Close() --[[ Close | Line: 2607 | Upvalues: t2 (copy), v5 (copy), ContainerFrame (copy), v58 (ref), v2 (copy) ]]
	for v1, v22 in t2 do
		v22:DoCleaning()
	end
	v5.CloseAllTabs(ContainerFrame)
	v58 = nil
	v2.CloseFrame(ContainerFrame)
	v2.OpenHUD()
end
function t.Init(p1) --[[ Init | Line: 2620 | Upvalues: v2 (copy), ConfirmPurchase (copy), ContainerFrame (copy), v4 (copy), Menu (copy), v3 (copy), t (copy), t2 (copy), v9 (copy), v5 (copy), v58 (ref), v8 (copy), v35 (copy), v12 (copy), t5 (copy), v24 (copy) ]]
	v2.AddFrame(ConfirmPurchase, {
		KeepPosition = true
	})
	v2.AddFrame(ContainerFrame)
	v3.new(v4.GetTagged(Menu, "CloseButton"), {
		Click = t.Close
	})
	local TabButtons = Menu.TabButtons
	local TabFrames = Menu.TabFrames
	for v22, v32 in TabFrames:GetChildren() do
		if v32:IsA("Frame") then
			local v42 = TabButtons:FindFirstChild(v32.Name)
			t2[v32.Name] = v9.new()
			v5.AddTab(v32, {
				ParentFrame = ContainerFrame,
				Button = v42,
				CanOpen = function() --[[ CanOpen | Line: 2642 | Upvalues: v32 (copy), v58 (ref), v8 (ref), v35 (ref), v12 (ref) ]]
					if v32.Name ~= "MyClub" then
						return true
					end
					if v58 then
						return true
					end
					local v1 = v8.HasClub(v35)
					if v1 then
						return v1
					end
					v12.Notify({
						Message = "You don\'t have a club!",
						Type = "NoClub",
						Preset = "Red"
					})
					return v1
				end
			})
			if v42 then
				local v52 = v3.new(v42, {
					Click = function() --[[ Click | Line: 2666 | Upvalues: v5 (ref), v32 (copy) ]]
						v5.OpenTab(v32)
					end
				})
				local function setSize() --[[ setSize | Line: 2671 | Upvalues: v5 (ref), v32 (copy), v42 (copy), v52 (copy) ]]
					local v1 = if v5.IsTabOpen(v32) then 1.5 else 1
					v42.UIScale.Scale = v1
					v52:SetScaleOverride(v1)
				end
				v5.AddStateCallback(v32, "OnOpen", setSize)
				v5.AddStateCallback(v32, "OnClose", setSize)
			end
			v5.AddStateCallback(v32, "BeforeOpen", function(...) --[[ Line: 2680 | Upvalues: t2 (ref), t5 (ref), v32 (copy), v8 (ref), v35 (ref), t (ref) ]]
				for v1, v2 in t2 do
					v2:DoCleaning()
				end
				if not t5[v32.Name] then
					return
				end
				t5[v32.Name](v32, t2[v32.Name], ...)
				t2[v32.Name]:GiveTask(v8.GetPlayersClub(v35):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2691 | Upvalues: v8 (ref), v35 (ref), t (ref) ]]
					if v8.HasClub(v35) then
						t.OpenTab("MyClub")
					else
						t.OpenTab("MainMenu")
					end
				end))
			end)
		end
	end
	local ClubShop = TabButtons:FindFirstChild("ClubShop")
	v3.new(ClubShop, {
		Click = function() --[[ Click | Line: 2704 | Upvalues: v24 (ref) ]]
			v24.Open()
		end
	})
	v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 2709 | Upvalues: v5 (ref), ContainerFrame (ref), TabFrames (copy), v8 (ref), v35 (ref), v58 (ref), TabButtons (copy), t (ref) ]]
		local v2 = (v5.getOpenedTab(ContainerFrame) or TabFrames:FindFirstChild("MainMenu")).Name
		if v2 == "MyClub" and not (v8.HasClub(v35) or v58) then
			v2 = "MainMenu"
		end
		v5.CloseAllTabs(ContainerFrame)
		if TabButtons:FindFirstChild(v2) then
			t.OpenTab(v2)
		else
			t.OpenTab("MainMenu")
		end
	end)
end
t:Init()
return t