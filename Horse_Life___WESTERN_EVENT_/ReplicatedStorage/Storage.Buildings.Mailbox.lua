-- https://lua.expert/
local t = {}
t.__index = t
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(game.ReplicatedStorage.Sonar)
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("PlayerUtils")
local v5 = not v1 and Sonar("NotificationsClient")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("DataUtils")
local v8 = Sonar("EquipmentService")
local v9 = Sonar("NotificationsService")
local v10 = not v1 and Sonar("IssueResponseClient")
local v11 = not v1 and Sonar("GuiManager")
local v12 = not v1 and Sonar("TabManager")
local v13 = Sonar("FormatNumber")
local v14 = not v1 and Sonar("GridSort")
local v15 = v1 and Sonar("LogService")
local v16 = v1 and Sonar("TradeLockService")
local v17 = not v1 and v3.GetClient()
local LocalPlayer = game.Players.LocalPlayer
local v18 = if LocalPlayer then LocalPlayer:WaitForChild("PlayerGui") else LocalPlayer
local v19 = v18 and v18:WaitForChild("MailboxGui")
local t2 = {
	NotEnoughCapacityToGet = "You do not have enough inventory capacity to get this!",
	IsMailboxFavorite = "You cannot gift favorited horses!",
	AtMaxItems = "This mailbox is full!",
	IsMailboxPregnant = "You cannot gift pregnant horses!",
	MailboxTradingBlocked = "This item cannot be sent!",
	AlreadyContributed = "You have already sent a letter!"
}
local t3 = {
	Default = {
		Get = function(p1, p2) --[[ Get | Line: 43 | Upvalues: v6 (copy) ]]
			local v1 = v6.GetByType(p2.Name, p2.ItemType)
			if v1 then
				return p1:GetItemValue(v1.Name, v1.ItemType), v1
			end
		end,
		Send = function(p1, p2, p3) --[[ Send | Line: 48 | Upvalues: v7 (copy) ]]
			local DataValue = p3.DataValue
			DataValue.Value = DataValue.Value - p3.Amount
			local v1 = v7.CreateDataValueFromType("Mailbox")
			v1.Name = v7.getIndexOfValue(p2.PlayerData.PlotSaves.Utility.Mailbox)
			v1.Item.Value = p3.Name
			v1.Amount.Value = p3.Amount
			return v1
		end,
		CanSend = function(p1, p2) --[[ CanSend | Line: 57 ]]
			p2.Amount = p1:GetAmountToUse(p2.DataValue, p2.Amount)
			if p2.Amount <= 0 then
				return "NotEnough"
			end
			if p2.ItemData.Tradelocked then
				return "MailboxTradingBlocked"
			else
				return true
			end
		end,
		CanGet = function(p1, p2) --[[ CanGet | Line: 70 ]]
			if not p1:CanGiveItem("Inventory") then
				return "MaxInventory"
			end
			local v1 = p1:GetItemLimit("Inventory")
			if v1.GetLimit() - v1.Get() - p2.Amount.Value <= 0 then
				return "NotEnoughCapacityToGet"
			else
				return true
			end
		end,
		Transfer = function(p1, p2) --[[ Transfer | Line: 83 ]]
			local v1 = p1:GetItemValue(p2.Item.Value)
			v1.Value = v1.Value + p2.Amount.Value
			return true
		end
	},
	AnimalSlots = {
		Get = function(p1, p2) --[[ Get | Line: 92 | Upvalues: v6 (copy) ]]
			local v1 = p1:GetAnimalSlot(p2.Name)
			if not v1 then
				return
			end
			local v2 = v6.GetByType(v1.Species.Value, "Animals")
			if v2 then
				return v1, v2
			end
		end,
		Send = function(p1, p2, p3) --[[ Send | Line: 101 | Upvalues: v7 (copy) ]]
			local v1 = v7.CreateDataValueFromType("Mailbox")
			v1.Name = v7.getIndexOfValue(p2.PlayerData.PlotSaves.Utility.Mailbox)
			v1.UserId.Value = p1.Player.UserId
			v1.TimeSent.Value = os.time()
			v1.Item.Value = p3.DataValue.Species.Value
			for k, v in pairs(p3.DataValue:GetChildren()) do
				v:Clone().Parent = v1.Item
			end
			v1.Amount.Value = 1
			p3.DataValue:Destroy()
			return v1
		end,
		CanSend = function(p1, p2) --[[ CanSend | Line: 116 ]]
			if not p2 then
				return
			end
			if p2.DataValue.Tradelocked.Value then
				return "MailboxTradingBlocked"
			end
			if p2.DataValue.Favorite.Value then
				return "IsMailboxFavorite"
			end
			if #p2.DataValue.Child.Value > 0 then
				return "IsMailboxPregnant"
			else
				return true
			end
		end,
		CanGet = function(p1, p2) --[[ CanGet | Line: 129 ]]
			if p1:CanGiveItem("Animals") then
				return true
			else
				return "AtAnimalLimit"
			end
		end,
		Transfer = function(p1, p2, p3) --[[ Transfer | Line: 136 | Upvalues: v7 (copy) ]]
			local v1 = Instance.new("Folder")
			for k, v in pairs(p2.Item:GetChildren()) do
				v:Clone().Parent = v1
			end
			if p3 then
				for k, v in pairs(v1.Upgrades:GetChildren()) do
					v.Value = 0
					v.Experience.Value = 0
				end
				v1.EquippedEquipment:ClearAllChildren()
				v1.Equipped.Value = false
				v1.EquippedInTradeWorld.Value = false
				v1.Eldering.Completed.Value = false
				v1.Eldering.Points.Value = 0
				v1.Eldering.Started.Value = false
			end
			v1.Name = v7.getIndexOfValue(p1:GetItemFolder("Animals"))
			v1.Parent = p1:GetItemFolder("Animals")
			return v1.Name
		end
	},
	Equipment = {
		Get = function(p1, p2) --[[ Get | Line: 160 | Upvalues: v6 (copy) ]]
			local v1 = p1:GetIndexedItemValue(p2.Name, "Equipment")
			if not v1 then
				return
			end
			local v2 = v6.GetByName(v1.Value)
			if v2 then
				return v1, v2
			end
		end,
		Send = function(p1, p2, p3) --[[ Send | Line: 169 | Upvalues: v7 (copy), v8 (copy) ]]
			local v1 = v7.CreateDataValueFromType("Mailbox")
			v1.Name = v7.getIndexOfValue(p2.PlayerData.PlotSaves.Utility.Mailbox)
			v1.UserId.Value = p1.Player.UserId
			v1.TimeSent.Value = os.time()
			v1.Item:Destroy()
			local Item = p3.DataValue:Clone()
			Item.Name = "Item"
			Item.Parent = v1
			v1.Amount.Value = 1
			v8:RemoveItemFromData(p1, p3.DataValue.Name)
			return v1
		end,
		CanSend = function(p1, p2) --[[ CanSend | Line: 182 ]]
			return true
		end,
		CanGet = function(p1, p2) --[[ CanGet | Line: 186 ]]
			if p1:CanGiveItem("Inventory") then
				return true
			else
				return "MaxInventory"
			end
		end,
		Transfer = function(p1, p2) --[[ Transfer | Line: 192 | Upvalues: v7 (copy) ]]
			local v1 = p2.Item:Clone()
			v1.Name = v7.getIndexOfValue(p1:GetItemFolder("Equipment"))
			v1.Parent = p1:GetItemFolder("Equipment")
			return true
		end
	},
	Chests = {
		Get = function(p1, p2) --[[ Get | Line: 200 | Upvalues: v6 (copy) ]]
			local v1 = p1:GetIndexedItemValue(p2.Name, "Chests")
			if not v1 then
				return
			end
			local v2 = v6.GetByName(v1.Value)
			if v2 then
				return v1, v2
			end
		end,
		Send = function(p1, p2, p3) --[[ Send | Line: 209 | Upvalues: v7 (copy) ]]
			local v1 = v7.CreateDataValueFromType("Mailbox")
			v1.Name = v7.getIndexOfValue(p2.PlayerData.PlotSaves.Utility.Mailbox)
			v1.UserId.Value = p1.Player.UserId
			v1.TimeSent.Value = os.time()
			v1.Item:Destroy()
			local Item = p3.DataValue:Clone()
			Item.Name = "Item"
			Item.Parent = v1
			v1.Amount.Value = 1
			p3.DataValue:Destroy()
			return v1
		end,
		CanSend = function(p1, p2) --[[ CanSend | Line: 222 ]]
			return true
		end,
		CanGet = function(p1, p2) --[[ CanGet | Line: 226 ]]
			if p1:CanGiveItem("Inventory") then
				return true
			else
				return "MaxInventory"
			end
		end,
		Transfer = function(p1, p2) --[[ Transfer | Line: 232 | Upvalues: v7 (copy) ]]
			local v1 = p2.Item:Clone()
			v1.Name = v7.getIndexOfValue(p1:GetItemFolder("Chests"))
			v1.Parent = p1:GetItemFolder("Chests")
			return true
		end
	},
	Seeds = {
		Get = function(p1, p2) --[[ Get | Line: 240 | Upvalues: v6 (copy) ]]
			local v1 = p1:GetIndexedItemValue(p2.Name, "Seeds")
			if not v1 then
				return
			end
			local v2 = v6.GetByName(v1.Value)
			if v2 then
				return v1, v2
			end
		end,
		Send = function(p1, p2, p3) --[[ Send | Line: 249 | Upvalues: v7 (copy) ]]
			local v1 = v7.CreateDataValueFromType("Mailbox")
			v1.Name = v7.getIndexOfValue(p2.PlayerData.PlotSaves.Utility.Mailbox)
			v1.UserId.Value = p1.Player.UserId
			v1.TimeSent.Value = os.time()
			v1.Item:Destroy()
			local Item = p3.DataValue:Clone()
			Item.Name = "Item"
			Item.Parent = v1
			v1.Amount.Value = 1
			p3.DataValue:Destroy()
			return v1
		end,
		CanSend = function(p1, p2) --[[ CanSend | Line: 262 ]]
			return true
		end,
		CanGet = function(p1, p2) --[[ CanGet | Line: 266 ]]
			if p1:CanGiveItem("Inventory") then
				return true
			else
				return "MaxInventory"
			end
		end,
		Transfer = function(p1, p2) --[[ Transfer | Line: 272 | Upvalues: v7 (copy) ]]
			local v1 = p2.Item:Clone()
			v1.Name = v7.getIndexOfValue(p1:GetItemFolder("Seeds"))
			v1.Parent = p1:GetItemFolder("Seeds")
			return true
		end
	}
}
local t4 = {
	Default = t3.Default,
	Animals = t3.AnimalSlots,
	Equipment = t3.Equipment,
	Flairs = t3.Equipment,
	Chests = t3.Chests,
	Seeds = t3.Seeds
}
local v20 = nil
function t.new(p1) --[[ new | Line: 294 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Building = p1
	v22.Model = p1.Model
	v22.MailboxData = v22.Building.PlayerWrapper.PlayerData and v22.Building.PlayerWrapper.PlayerData.PlotSaves.Utility.Mailbox
	v22.Maid = v2.new()
	v22.OpenedMaid = v2.new()
	v22.Maid:GiveTask(v22.OpenedMaid)
	if v1 then
		v22:_initServer()
	else
		v22:_initClient()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 316 | Upvalues: v20 (ref) ]]
	if v20 == p1 then
		p1:Close()
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._initServer(p1) --[[ _initServer | Line: 324 | Upvalues: v16 (copy), v3 (copy), v15 (copy), v9 (copy) ]]
	p1.Remote = Instance.new("RemoteFunction")
	p1.Remote.Name = "Remote"
	function p1.Remote.OnServerInvoke(p12, p2, ...) --[[ Line: 328 | Upvalues: v16 (ref), v3 (ref), p1 (copy), v15 (ref), v9 (ref) ]]
		if v16.IsLocked(p12) then
			return
		end
		local v1 = v3.getWrapperFromPlayer(p12)
		if not v1 then
			return
		end
		if p2 == "Send" then
			local v2, v32, v4 = p1:CanSend(v1, ...)
			if v2 ~= true then
				return
			end
			local v5 = v4.Send(v1, p1.Building.PlayerWrapper, v32)
			v15.AddLog("Mailbox", v1.Player, p1.Building.PlayerWrapper.Player, v32.DataValue, v32.Amount)
			if v5 then
				v5.UserId.Value = v1.Player.UserId
				v5.TimeSent.Value = os.time()
				v5.Parent = p1.Building.PlayerWrapper.PlayerData.PlotSaves.Utility.Mailbox
				task.spawn(function() --[[ Line: 349 | Upvalues: v1 (copy) ]]
					v1:Autosave()
				end)
				v9.NotifyPlayer(p1.Building.Player, "MailboxItemReceived", p12)
				return true
			end
		elseif p2 == "Get" then
			local v6, v7, v8 = p1:CanGet(v1, ...)
			if v6 == true then
				local v92 = v8.Transfer(v1, v7, "Claimed")
				v7:Destroy()
				return v92
			else
				return nil, v6
			end
		else
			if p2 ~= "GetAll" then
				return
			end
			local t = {}
			for v10, v11 in v1.PlayerData.PlotSaves.Utility.Mailbox:GetChildren() do
				local v12, v13, v14 = p1:CanGet(v1, v11.Name)
				if v12 ~= true then
					return nil, v12
				end
				local v152 = v14.Transfer(v1, v13, "Claimed")
				v13:Destroy()
				if type(v152) == "string" then
					t[#t + 1] = v152
				end
			end
			return if next(t) and t then t else true
		end
	end
	p1.Remote.Parent = p1.Model
	p1.Maid:GiveTask(p1.Remote)
	local function setContributions() --[[ setContributions | Line: 388 | Upvalues: p1 (copy) ]]
		p1.Model:SetAttribute("MaxItems", p1:IsAtMaxItems())
		local t = {}
		for v1, v2 in p1.MailboxData:GetChildren() do
			t[#t + 1] = v2.UserId.Value
		end
		p1.Model:SetAttribute("P", game:GetService("HttpService"):JSONEncode(t))
	end
	p1.OpenedMaid:GiveTask(p1.MailboxData.ChildAdded:Connect(setContributions))
	p1.OpenedMaid:GiveTask(p1.MailboxData.ChildRemoved:Connect(setContributions))
	setContributions()
end
function t._initClient(p1) --[[ _initClient | Line: 402 | Upvalues: v4 (copy), Sonar (copy), v17 (copy), v10 (copy) ]]
	p1.IsOwner = p1.Building.Player == game.Players.LocalPlayer
	p1.Remote = p1.Model:WaitForChild("Remote")
	p1.Gui = script.MailboxGui:Clone()
	p1.Gui.AlwaysOnTop = false
	p1.Gui.Adornee = p1.Model
	p1.Gui.Frame.PlayerImage.Image = v4.GetUserThumbnail(p1.Building.Player.UserId)
	p1.Gui.Frame.Title.Text = v4.GetPlayerName(p1.Building.Player) .. "\'s Mailbox"
	p1.Gui.Frame.StatusLabel.Text = if p1.IsOwner then "Open your Letters!" else "Send a Letter!"
	if p1.IsOwner then
		local function setUnreadLabel() --[[ setUnreadLabel | Line: 415 | Upvalues: p1 (copy) ]]
			p1.Gui.Frame.MessageLabel.Text = string.format("You have %s Unread Letters.", #p1.MailboxData:GetChildren())
		end
		p1.Maid:GiveTask(p1.MailboxData.ChildAdded:Connect(setUnreadLabel))
		p1.Maid:GiveTask(p1.MailboxData.ChildRemoved:Connect(setUnreadLabel))
		p1.Gui.Frame.MessageLabel.Text = string.format("You have %s Unread Letters.", #p1.MailboxData:GetChildren())
		p1.Gui.Frame.MessageLabel.Visible = true
	else
		p1.Gui.Frame.MessageLabel.Visible = false
	end
	p1.Gui.Parent = p1.Model
	p1.Maid:GiveTask(p1.Gui)
	local v2 = Sonar("InteractMenu").new
	local t = {
		Scale = 0.75,
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 432 | Upvalues: p1 (copy), v17 (ref), v10 (ref) ]]
			local v1 = p1:CanOpen(v17)
			if v1 == true then
				p1:Open()
			else
				v10.NotifyIssue(v1)
			end
		end,
		GetRange = function() --[[ GetRange | Line: 441 ]]
			return 36
		end
	}
	t.Hint = if p1.IsOwner then "Open Mailbox" else "Send Gifts"
	p1.Maid:GiveTask(v2(p1.Building.PrimaryPart, t))
end
function t.IsAtMaxItems(p1, p2) --[[ IsAtMaxItems | Line: 448 ]]
	if not p1.Building.PlayerWrapper.PlayerData then
		return p1.Model:GetAttribute("MaxItems")
	end
	return #p1.Building.PlayerWrapper.PlayerData.PlotSaves.Utility.Mailbox:GetChildren() >= 10
end
function t.HasSentLetter(p1, p2) --[[ HasSentLetter | Line: 456 ]]
	if not p1.Model:GetAttribute("P") then
		return false
	end
	if table.find(game:GetService("HttpService"):JSONDecode(p1.Model:GetAttribute("P")), p2.Player.UserId) then
		return true
	else
		return false
	end
end
function t.GetType(p1, p2) --[[ GetType | Line: 466 | Upvalues: t4 (copy), v6 (copy) ]]
	if type(p2) == "string" then
		return t4[p2] or t4.Default
	else
		if p2.Item:FindFirstChild("Species") then
			return t4.Animals
		end
		return t4[v6.GetItemType(p2.Item.Value)] or t4.Default
	end
end
function t.GetItem(p1, p2, p3) --[[ GetItem | Line: 479 ]]
	return p1:GetType(p3.ItemType).Get(p2, p3)
end
function t.CanOpen(p1, p2) --[[ CanOpen | Line: 484 ]]
	if p1.IsOwner then
		return true
	end
	if p1:IsAtMaxItems() then
		return "AtMaxItems"
	end
	if p1:HasSentLetter(p2) then
		return "AlreadyContributed"
	else
		return true
	end
end
function t.CanSend(p1, p2, p3) --[[ CanSend | Line: 498 | Upvalues: v1 (copy), v9 (copy) ]]
	if v1 then
		local v12, v2 = p1:GetItem(p2, p3)
		if not v12 then
			return
		end
		p3 = {
			Name = p3.Name,
			ItemType = p3.ItemType,
			Amount = p3.Amount,
			ItemData = v2,
			DataValue = v12
		}
	end
	if not game:GetService("RunService"):IsStudio() and p2.Player == p1.Building.Player then
		return
	end
	if p1:IsAtMaxItems() then
		return "AtMaxItems"
	end
	if p1:HasSentLetter(p2) then
		return "AlreadyContributed"
	end
	local v3 = p1:GetType(p3.ItemType)
	local v4 = v3.CanSend(p2, p3)
	if v4 ~= true then
		return v4
	end
	if v1 and not (p2.Autosaved or game:GetService("RunService"):IsStudio()) then
		v9.NotifyPlayer(p2.Player, "MailboxNoSyncData")
	else
		return true, p3, v3
	end
end
function t.CanGet(p1, p2, p3) --[[ CanGet | Line: 539 | Upvalues: v10 (copy), v1 (copy), v9 (copy) ]]
	if not game:GetService("RunService"):IsStudio() and p2.Player ~= p1.Building.Player then
		return
	end
	local v12 = p2.PlayerData.PlotSaves.Utility.Mailbox:FindFirstChild(p3)
	if not v12 then
		return
	end
	local v2 = p1:GetType(v12)
	local v3 = v2.CanGet(p2, v12, true)
	if v3 ~= true then
		v10.NotifyIssue(v3)
		return v3
	end
	if v1 and not (p2.Autosaved or game:GetService("RunService"):IsStudio()) then
		v9.NotifyPlayer(p2.Player, "MailboxNoSyncData")
	else
		return true, v12, v2
	end
end
function t.Open(p1) --[[ Open | Line: 564 | Upvalues: v20 (ref), v19 (copy), v2 (copy), Sonar (copy), v4 (copy), LocalPlayer (copy), v6 (copy), v11 (copy), v14 (copy), v13 (copy), v17 (copy), v12 (copy), v10 (copy), v5 (copy) ]]
	v20 = p1
	p1:Cleanup()
	if p1.IsOwner then
		local Receiving = v19.ContainerFrame.Receiving
		local function setAmountLabel() --[[ setAmountLabel | Line: 571 | Upvalues: Receiving (copy), p1 (copy) ]]
			if Receiving:FindFirstChild("Mail") then
				Receiving.Mail.CapacityLabel.Text = #p1.MailboxData:GetChildren() .. "/" .. 10
			end
		end
		p1.OpenedMaid:GiveTask(p1.MailboxData.ChildAdded:Connect(setAmountLabel))
		p1.OpenedMaid:GiveTask(p1.MailboxData.ChildRemoved:Connect(setAmountLabel))
		if Receiving:FindFirstChild("Mail") then
			Receiving.Mail.CapacityLabel.Text = #p1.MailboxData:GetChildren() .. "/" .. 10
		end
		local t = {}
		local v1 = v2.new()
		p1.OpenedMaid:GiveTask(v1)
		local function selectLetter(p12) --[[ selectLetter | Line: 582 | Upvalues: v1 (copy), p1 (copy), Receiving (copy), Sonar (ref), v4 (ref), LocalPlayer (ref), v6 (ref) ]]
			v1:DoCleaning()
			if not p12 then
				p1.SelectedLetter = nil
				Receiving.Letter.Selected.Visible = false
				Receiving.Letter.NotSelected.Visible = true
				return
			end
			p1.SelectedLetter = p12
			Receiving.Letter.Selected.Date.Text = Sonar("TimeFormat").GetFormattedTime("M. j", p12.TimeSent.Value)
			Receiving.Letter.Selected.PlayerImage.Image = v4.GetUserThumbnail(p12.UserId.Value)
			Receiving.Letter.Selected.MessageLabel.Text = "Enjoy this gift from me.\n Have a nice day!"
			Receiving.Letter.Selected.UsernameLabel.Text = v4.GetUserNameFromUserId(p12.UserId.Value, "DisplayName")
			if p12.Item:FindFirstChild("Species") then
				v1:GiveTask(Sonar("AnimalGridButton").new({
					SpeciesAsName = true,
					ForceVisible = true,
					DoNotClone = true,
					DisableAccessories = true,
					SlotValue = p12.Item,
					Owner = LocalPlayer,
					GuiObject = Receiving.Letter.Selected.HorseImage,
					ViewportFrame = Receiving.Letter.Selected.HorseImage
				}))
				Receiving.Letter.Selected.HorseImage.Visible = true
				Receiving.Letter.Selected.ItemImage.Visible = false
			else
				v1:GiveTask(Sonar("ItemGridButton").new({
					DoNotClone = true,
					ForceVisible = true,
					Item = v6.GetByName(p12.Item.Value),
					GuiObject = Receiving.Letter.Selected.ItemImage,
					ViewportFrame = Receiving.Letter.Selected.ItemImage,
					GetAmount = function() --[[ GetAmount | Line: 613 | Upvalues: p12 (copy) ]]
						return p12.Amount.Value
					end
				}))
				Receiving.Letter.Selected.HorseImage.Visible = false
				Receiving.Letter.Selected.ItemImage.Visible = true
			end
			Receiving.Letter.Selected.Visible = true
			Receiving.Letter.NotSelected.Visible = false
		end
		local function setEmptyLabel() --[[ setEmptyLabel | Line: 629 | Upvalues: Receiving (copy), t (ref) ]]
			Receiving.Mail.ScrollingFrame.Visible = next(t)
			Receiving.Mail.EmptyLabel.Visible = not next(t)
		end
		local function createLetter(p1, p2) --[[ createLetter | Line: 633 | Upvalues: v2 (ref), Receiving (copy), Sonar (ref), v4 (ref), selectLetter (copy), v6 (ref), t (ref) ]]
			if not p2 then
				task.wait()
			end
			local v1 = v2.new()
			local v22 = Receiving.Mail.ScrollingFrame.Default:Clone()
			v22.Date.Text = Sonar("TimeFormat").GetFormattedTime("M. j", p1.TimeSent.Value)
			v22.PlayerImage.Image = v4.GetUserThumbnail(p1.UserId.Value)
			v22.UsernameLabel.Text = "Loading..."
			task.spawn(function() --[[ Line: 645 | Upvalues: v22 (copy), v4 (ref), p1 (copy) ]]
				v22.UsernameLabel.Text = v4.GetUserNameFromUserId(p1.UserId.Value, "DisplayName")
			end)
			v1:GiveTask(Sonar("Button").new(v22, {
				NoHoverShadowLabel = true,
				Click = function() --[[ Click | Line: 651 | Upvalues: selectLetter (ref), p1 (copy) ]]
					selectLetter(p1)
				end
			}))
			if p1.Item:FindFirstChild("Species") then
				v22.ItemImage.Visible = false
			else
				v1:GiveTask(Sonar("ItemGridButton").new({
					DoNotClone = true,
					ForceVisible = true,
					Item = v6.GetByName(p1.Item.Value),
					GuiObject = v22.ItemImage,
					ViewportFrame = v22.ItemImage,
					GetAmount = function() --[[ GetAmount | Line: 665 | Upvalues: p1 (copy) ]]
						return p1.Amount.Value
					end
				}))
				v22.ItemImage.Visible = true
			end
			Sonar("Button"):RegisterHover(v22, function() --[[ Line: 672 | Upvalues: v22 (copy) ]]
				v22.BackgroundColor3 = Color3.fromRGB(205, 247, 174)
				v22.Date.TextColor3 = Color3.fromRGB(90, 131, 41)
			end)
			Sonar("Button"):RegisterLeave(v22, function() --[[ Line: 676 | Upvalues: v22 (copy) ]]
				v22.BackgroundColor3 = Color3.fromRGB(255, 243, 226)
				v22.Date.TextColor3 = Color3.fromRGB(180, 105, 236)
			end)
			v22.Name = p1.Name
			v22.Visible = true
			v22.LayoutOrder = p1.TimeSent.Value
			v22.Parent = Receiving.Mail.ScrollingFrame
			v1:GiveTask(v22)
			t[p1] = v1
			Receiving.Mail.ScrollingFrame.Visible = next(t)
			Receiving.Mail.EmptyLabel.Visible = not next(t)
		end
		p1.OpenedMaid:GiveTask(function() --[[ Line: 691 | Upvalues: t (ref) ]]
			for v1, v2 in t do
				v2:Destroy()
			end
			t = nil
		end)
		p1.OpenedMaid:GiveTask(p1.MailboxData.ChildAdded:Connect(createLetter))
		p1.OpenedMaid:GiveTask(p1.MailboxData.ChildRemoved:Connect(function(p12) --[[ Line: 698 | Upvalues: t (ref), p1 (copy), selectLetter (copy), Receiving (copy) ]]
			if not t[p12] then
				return
			end
			t[p12]:Destroy()
			t[p12] = nil
			if p12 == p1.SelectedLetter then
				selectLetter()
			end
			Receiving.Mail.ScrollingFrame.Visible = next(t)
			Receiving.Mail.EmptyLabel.Visible = not next(t)
		end))
		for v22, v3 in p1.MailboxData:GetChildren() do
			createLetter(v3, true)
		end
		selectLetter()
		v19.ContainerFrame.Receiving.Visible = true
		v19.ContainerFrame.Sending.Visible = false
		v11.OpenFrame(v19.ContainerFrame, {
			CloseAll = "CloseOverlay"
		})
	else
		local v42 = v11.getFrameFromInstance(v19.ContainerFrame)
		if not v42.Opened then
			v42.Opened = true
			local t = {}
			local v52 = nil
			local t2 = {
				Horses = v14.new({
					Priority = {},
					EmptyString = {
						Text = "You do not have any horses!",
						Label = v19.ContainerFrame.Sending.Menu.Items.Content.TabFrames.Horses.EmptyLabel
					},
					Sorts = {
						Alphabet = {
							DisplayName = "Name",
							Reversable = true,
							Run = function(p1, p2, p3) --[[ Run | Line: 748 ]]
								local v1 = p1.NameLabel.Text:lower()
								local v2 = p2.NameLabel.Text:lower()
								if p3 then
									return v2 < v1
								else
									return v1 < v2
								end
							end,
							Changed = function(p1) --[[ Changed | Line: 759 ]]
								return p1.NameLabel:GetPropertyChangedSignal("Text")
							end
						}
					},
					Search = {
						TextBox = v19.ContainerFrame.Sending.Menu.Items.Content.SearchBar.Content.TextBox,
						Run = function(p1, p2) --[[ Run | Line: 767 ]]
							return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
						end
					}
				}),
				Inventory = v14.new({
					Priority = {
						{
							Priority = -1,
							Run = function(p1) --[[ Run | Line: 776 ]]
								return if p1.Item.ItemType == "Equipment" then true else p1.Item.ItemType == "Flairs"
							end
						}
					},
					Filters = {
						All = true
					},
					EmptyString = {
						Text = "You do not have any items!",
						Label = v19.ContainerFrame.Sending.Menu.Items.Content.TabFrames.Inventory.EmptyLabel
					},
					Sorts = {
						Alphabet = {
							Run = function(p1, p2, p3) --[[ Run | Line: 793 ]]
								return p1.NameLabel.Text:lower() < p2.NameLabel.Text:lower()
							end,
							Changed = function(p1) --[[ Changed | Line: 798 ]]
								return p1.NameLabel:GetPropertyChangedSignal("Text")
							end
						}
					},
					Search = {
						TextBox = v19.ContainerFrame.Sending.Menu.Items.Content.SearchBar.Content.TextBox,
						Run = function(p1, p2) --[[ Run | Line: 806 ]]
							return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), p1:lower())
						end
					}
				})
			}
			local function getItemName(p1) --[[ getItemName | Line: 813 ]]
				if p1:IsA("StringValue") then
					return p1.Value
				else
					return p1.Name
				end
			end
			local function setAmount(p1, p2, p3) --[[ setAmount | Line: 821 | Upvalues: v13 (ref), v52 (ref), v17 (ref) ]]
				if p2 and #tostring(p2) > 0 then
					local v1 = v13.SanitiseInput(p2)
					local v2 = if p3 and v52.DataValue:IsA("IntValue") then v17:GetAmountToUse(v52.DataValue, v1) else v1
					v52.Amount = v2
					if p3 then
						v2 = v13.splice(v2)
					end
					p1.Text = v2
				else
					if v52 then
						v52.Amount = 1
					end
					p1.Text = ""
				end
			end
			local function setSelectedItem(p1) --[[ setSelectedItem | Line: 845 | Upvalues: v52 (ref), v19 (ref), v13 (ref) ]]
				v52 = p1
				if not p1 then
					v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.Visible = false
					v19.ContainerFrame.Sending.Menu.Items.SelectFrame.NotSelected.Visible = true
					return
				end
				if p1.DataValue:IsA("IntValue") then
					v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountDescription.Visible = true
					v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountContainer.Visible = true
				else
					v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountDescription.Visible = false
					v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountContainer.Visible = false
				end
				local Input = v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountContainer.TextContainer.Input
				local v1 = nil
				if v1 and #tostring(v1) > 0 then
					local v2 = v13.SanitiseInput(v1)
					p1.Amount = v2
					Input.Text = v2
				else
					if p1 then
						p1.Amount = 1
					end
					Input.Text = ""
				end
				v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.Visible = true
				v19.ContainerFrame.Sending.Menu.Items.SelectFrame.NotSelected.Visible = false
			end
			v11.AddStateCallback(v19.ContainerFrame, "OnOpen", function() --[[ Line: 866 | Upvalues: setSelectedItem (copy) ]]
				setSelectedItem()
			end)
			v11.AddStateCallback(v19.ContainerFrame, "OnClose", function() --[[ Line: 870 | Upvalues: v12 (ref), v19 (ref) ]]
				v12.CloseAllTabs(v19.ContainerFrame.Sending.Menu.Items)
			end)
			local function createInventoryTab(p1) --[[ createInventoryTab | Line: 874 | Upvalues: Sonar (ref), v6 (ref), LocalPlayer (ref), v20 (ref), v17 (ref), v10 (ref), setSelectedItem (copy), t (copy), t2 (copy) ]]
				if p1.Name == "Horses" then
					local function createAnimal(p12, p2) --[[ createAnimal | Line: 876 | Upvalues: Sonar (ref), v6 (ref), LocalPlayer (ref), p1 (copy), v20 (ref), v17 (ref), v10 (ref), setSelectedItem (ref), t (ref), t2 (ref) ]]
						if not p2 then
							Sonar("EventUtils").waitForFirstChild(p12)
						end
						local v1 = v6.GetByName(p12:WaitForChild("Species").Value)
						local v2 = Sonar("AnimalGridButton").new({
							DisableAccessories = true,
							SlotValue = p12,
							Owner = LocalPlayer,
							ParentFrame = p1
						})
						v2:GiveTask(Sonar("Button").new(v2.Frame, {
							Click = function() --[[ Click | Line: 889 | Upvalues: v20 (ref), v17 (ref), p12 (copy), v1 (copy), v10 (ref), setSelectedItem (ref) ]]
								local v12, v2 = v20:CanSend(v17, {
									Amount = 1,
									Name = p12.Name,
									ItemType = v1.ItemType,
									ItemData = v1,
									DataValue = p12
								})
								if v12 == true then
									setSelectedItem(v2)
								else
									v10.NotifyIssue(v12)
								end
							end
						}))
						t[p12] = v2
						t2.Horses:Add(v2, true)
					end
					local function removeAnimal(p1) --[[ removeAnimal | Line: 909 | Upvalues: t (ref), t2 (ref) ]]
						if t[p1] then
							t2.Horses:Remove(t[p1])
							t[p1]:Destroy()
							t[p1] = nil
						end
					end
					v17.PlayerData.Animals.ChildRemoved:Connect(removeAnimal)
					v17.PlayerData.Animals.ChildAdded:Connect(createAnimal)
					for k, v in pairs(v17:GetItemFolder("Animals"):GetChildren()) do
						createAnimal(v)
					end
					t2.Horses:Sort(t2.Horses.SortType or "Alphabet")
				else
					for k, v in pairs({
						"Food",
						"Tools",
						"Equipment",
						"EquipmentPalettes",
						"Flairs",
						"Resources",
						"Miscellaneous",
						"Potions",
						"Chests",
						"StackableChests",
						"Seeds"
					}) do
						local v1 = v17:GetItemFolder(v)
						if v1 then
							local t3 = {}
							local function createItem(p12, p2) --[[ createItem | Line: 944 | Upvalues: t (ref), t3 (copy), v6 (ref), Sonar (ref), p1 (copy), v20 (ref), v17 (ref), v10 (ref), setSelectedItem (ref), t2 (ref) ]]
								if t[p12] then
									return
								end
								if t3[p12] then
									return
								end
								t3[p12] = true
								if not p2 then
									task.wait(0.5)
								end
								local v2 = v6.GetByName(if p12:IsA("StringValue") then p12.Value else p12.Name)
								local v3 = Sonar("ItemGridButton").new({
									IgnoreBackgroundColor = true,
									Item = v2,
									DataValue = p12,
									ParentFrame = p1
								})
								v3:GiveTask(Sonar("Button").new(v3.Frame, {
									Click = function() --[[ Click | Line: 964 | Upvalues: v20 (ref), v17 (ref), p12 (copy), v2 (copy), v10 (ref), setSelectedItem (ref) ]]
										local v1, v22 = v20:CanSend(v17, {
											Name = p12.Name,
											Amount = p12.Value,
											ItemType = v2.ItemType,
											ItemData = v2,
											DataValue = p12
										})
										if v1 == true then
											setSelectedItem(v22)
										else
											v10.NotifyIssue(v1)
										end
									end
								}))
								t[p12] = v3
								t3[p12] = nil
								t2.Inventory:Add(v3, true)
							end
							local function removeItem(p1) --[[ removeItem | Line: 986 | Upvalues: t (ref), t2 (ref) ]]
								if t[p1] then
									t2.Inventory:Remove(t[p1])
									t[p1]:Destroy()
									t[p1] = nil
								end
							end
							local v2 = true
							for k2, v3 in pairs(v1:GetChildren()) do
								v2 = tonumber(v3.Name)
								break
							end
							if v2 then
								v17:GetItemFolder(v).ChildRemoved:Connect(removeItem)
								v17:GetItemFolder(v).ChildAdded:Connect(createItem)
								for k2, v3 in pairs(v17:GetItemFolder(v):GetChildren()) do
									createItem(v3, true)
								end
								continue
							end
							for k2, v3 in pairs(v6.GetType(v)) do
								local v5 = v17:GetItemValue(k2, v)
								if v5 then
									v5:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1015 | Upvalues: v5 (copy), createItem (copy), t (ref), t2 (ref) ]]
										if v5.Value > 0 then
											createItem(v5)
											return
										end
										local v1 = v5
										if t[v1] then
											t2.Inventory:Remove(t[v1])
											t[v1]:Destroy()
											t[v1] = nil
										end
									end)
									if v5.Value > 0 then
										createItem(v5, true)
									end
									continue
								end
								warn("No item value found for", k2, v)
							end
						end
					end
					t2.Inventory:Sort(t2.Inventory.SortType or "Alphabet")
				end
			end
			Sonar("ButtonTest").new(v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.SendButton, {
				Click = function() --[[ Click | Line: 1034 | Upvalues: v19 (ref), v5 (ref), v20 (ref), v17 (ref), v52 (ref), v10 (ref), setSelectedItem (copy), v4 (ref) ]]
					if v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountContainer.Visible and #v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountContainer.TextContainer.Input.Text <= 0 then
						v5.Notify({
							Message = "You haven\'t set an amount yet!",
							Preset = "Red",
							Type = "NoAmountSetMailbox"
						})
						return
					end
					if not v20 then
						return
					end
					local v1 = v20:CanSend(v17, v52)
					if v1 ~= true then
						v10.NotifyIssue(v1)
						return
					end
					if not v52 or v20.Remote:InvokeServer("Send", v52) ~= true then
						return
					end
					setSelectedItem()
					v5.Notify({
						Preset = "Green",
						Message = string.format("[\240\159\147\172 MAIL] You sent %s a letter!", v4.GetPlayerName(v20.Building.Player))
					})
					v20:Close()
				end
			})
			Sonar("ButtonTest").new(v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.CancelButton, {
				Click = function() --[[ Click | Line: 1066 | Upvalues: v20 (ref) ]]
					if not v20 then
						return
					end
					v20:Close()
				end
			})
			Sonar("ButtonTest").new(v19.ContainerFrame.Sending.Menu.CloseButton, {
				Click = function() --[[ Click | Line: 1074 | Upvalues: v20 (ref) ]]
					if not v20 then
						return
					end
					v20:Close()
				end
			})
			Sonar("GuiUtils").CreateInputTextBox(v19.ContainerFrame.Sending.Menu.Items.SelectFrame.SelectedFrame.AmountContainer.TextContainer.Input, setAmount, true)
			for k, v in pairs(v19.ContainerFrame.Sending.Menu.Items.Content.TabFrames:GetChildren()) do
				local v62 = v19.ContainerFrame.Sending.Menu.Items.Content.TabButtons:FindFirstChild(v.Name)
				if v62 then
					v12.AddTab(v, {
						ParentFrame = v19.ContainerFrame.Sending.Menu.Items,
						Button = v62
					})
					v12.AddStateCallback(v, "OnOpen", function() --[[ Line: 1092 | Upvalues: v19 (ref), Sonar (ref), v12 (ref), v (copy), createInventoryTab (copy) ]]
						for k, v2 in pairs(v19.ContainerFrame.Sending.Menu.Items.Content.TabFrames:GetChildren()) do
							local v1 = v19.ContainerFrame.Sending.Menu.Items.Content.TabButtons:FindFirstChild(v2.Name)
							if v1 then
								local SetButtonColor = Sonar("GuiUtils").SetButtonColor
								SetButtonColor(v1, "Diagonal", if v12.IsTabOpen(v2) then "Yellow" else "Blue")
							end
						end
						local v4 = v12.getTabFromInstance(v)
						if v4.Opened then
							return
						end
						v4.Opened = true
						createInventoryTab(v)
					end)
					Sonar("ButtonTest").new(v62, {
						Click = function() --[[ Click | Line: 1109 | Upvalues: v12 (ref), v (copy) ]]
							if not v12.IsTabOpen(v) then
								v12.OpenTab(v)
							end
						end
					})
				end
			end
			setSelectedItem()
		end
		if v12.getOpenedTab(v19.ContainerFrame.Sending.Menu.Items) then
			v19.ContainerFrame.Receiving.Visible = false
			v19.ContainerFrame.Sending.Visible = true
			v11.OpenMainFrame(v19.ContainerFrame, {
				CloseAll = "CloseOverlay"
			})
			return
		end
		v12.OpenTab(v19.ContainerFrame.Sending.Menu.Items.Content.TabFrames.Inventory)
		v19.ContainerFrame.Receiving.Visible = false
		v19.ContainerFrame.Sending.Visible = true
		v11.OpenMainFrame(v19.ContainerFrame, {
			CloseAll = "CloseOverlay"
		})
	end
end
function t.Cleanup(p1) --[[ Cleanup | Line: 1133 ]]
	p1.OpenedMaid:DoCleaning()
end
function t.Close(p1) --[[ Close | Line: 1137 | Upvalues: v20 (ref), v11 (copy), v19 (copy) ]]
	v20 = nil
	p1:Cleanup()
	v11.CloseFrame(v19.ContainerFrame, {})
	v11.OpenHUD()
end
function t.Init(p1) --[[ Init | Line: 1148 | Upvalues: v1 (copy), LocalPlayer (copy), v11 (copy), Sonar (copy), v20 (ref), v17 (copy), v10 (copy), t2 (copy), v4 (copy) ]]
	if not v1 then
		local MailboxGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MailboxGui")
		v11.AddFrame(MailboxGui.ContainerFrame, {
			TweenAnimation = "Open",
			CloseAll = "CloseOverlay",
			Background = true,
			ShortcutToClose = true,
			OpenPosition = MailboxGui.ContainerFrame.Position,
			ClosePosition = MailboxGui.ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
		})
		Sonar("ButtonTest").new(MailboxGui.ContainerFrame.Receiving.Letter.Selected.ClaimButton, {
			Click = function() --[[ Click | Line: 1167 | Upvalues: v20 (ref), v17 (ref), v10 (ref), Sonar (ref) ]]
				if not v20 then
					return
				end
				local v1 = v20:CanGet(v17, v20.SelectedLetter.Name)
				if v1 ~= true then
					v10.NotifyIssue(v1)
					return
				end
				local v2, v3 = v20.Remote:InvokeServer("Get", v20.SelectedLetter.Name)
				if v2 and (v2 ~= true and type(v2) == "string") then
					Sonar("DisplayAnimalClient"):DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = true,
						Slot = v17:GetItemFolder("Animals"):WaitForChild(v2)
					})
					return
				end
				if not v3 then
					return
				end
				v10.NotifyIssue(v3)
			end
		})
		Sonar("ButtonTest").new(MailboxGui.ContainerFrame.Receiving.Mail.ClaimAllButton, {
			Click = function() --[[ Click | Line: 1190 | Upvalues: v20 (ref), v17 (ref), v10 (ref), Sonar (ref) ]]
				if not v20 then
					return
				end
				for v1, v2 in v17.PlayerData.PlotSaves.Utility.Mailbox:GetChildren() do
					local v3 = v20:CanGet(v17, v2.Name)
					if v3 ~= true then
						v10.NotifyIssue(v3)
						return
					end
				end
				local v4, v5 = v20.Remote:InvokeServer("GetAll")
				if type(v4) == "table" then
					for v6, v7 in v4 do
						Sonar("DisplayAnimalClient"):DisplaySlot({
							Type = "Claimed",
							AllowNaming = true,
							ShowMaxWarning = true,
							MobileClickBackgroundToClose = true,
							Slot = v17:GetItemFolder("Animals"):WaitForChild(v7)
						})
						if Sonar("DisplayAnimalClient").YieldForNoDisplay() then
							task.wait(0.5)
						end
					end
				else
					if not v5 then
						return
					end
					v10.NotifyIssue(v5)
				end
			end
		})
		Sonar("ButtonTest").new(MailboxGui.ContainerFrame.Receiving.Letter.CloseButton, {
			Click = function() --[[ Click | Line: 1225 | Upvalues: v20 (ref) ]]
				if not v20 then
					return
				end
				v20:Close()
			end
		})
		v10.AddResponses(t2)
		Sonar("NotificationsClient").AddNotificationCallback("MailboxItemReceived", function(p1) --[[ Line: 1233 | Upvalues: v4 (ref) ]]
			return {
				Preset = "Blue",
				Message = string.format("[\240\159\147\172 MAIL] %s sent you a letter!", v4.GetPlayerName(p1))
			}
		end)
		Sonar("NotificationsClient").AddNotificationCallback("MailboxNoSyncData", function(p1) --[[ Line: 1240 ]]
			return {
				Message = "Your data is still syncing, please wait!",
				Preset = "Red",
				Type = "MailboxNoSyncData"
			}
		end)
	end
end
t:Init()
return t