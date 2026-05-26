-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local Sonar = require(game.ReplicatedStorage.Sonar)
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
Sonar("PlayerUtils")
local v4 = not v1 and Sonar("InventoryGui")
Sonar("RemoteUtils")
if not v1 then
	Sonar("NotificationsClient")
end
local v5 = not v1 and Sonar("IssueResponseClient")
Sonar("DataUtils")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("TimeUtils")
if not v1 then
	v3.GetClient()
end
local t2 = {
	InvalidInput = "This item cannot be processed here!",
	NoItem = "You don\'t have this item!",
	NotEnoughItems = "You don\'t have enough items!",
	NotEnough = "You didn\'t input enough items!",
	AlreadyProcessing = "Already processing items!",
	NotReadyToCollect = "Processing not complete!",
	InventoryFull = "Your inventory is full!",
	NothingToCollect = "Nothing to collect!",
	ItemsToClaim = "Collect your items first!"
}
function t.new(p1) --[[ new | Line: 36 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Building = p1
	v22.Model = p1.Model
	v22.InputItems = p1.Data.InputItems
	v22.OutputItems = p1.Data.OutputItems
	v22.ProcessTime = p1.Data.ProcessTime
	v22.Maid = v2.new()
	v22.CurrentProcess = nil
	if v1 then
		v22:_initServer()
	else
		v22:_initClient()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 57 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._initServer(p1) --[[ _initServer | Line: 62 | Upvalues: v2 (copy), v3 (copy) ]]
	p1.InteractionData = p1.Building:GetOrCreateInteractionData()
	p1.ProcessingMaid = v2.new()
	p1.Maid:GiveTask(p1.ProcessingMaid)
	p1.Remote = Instance.new("RemoteFunction")
	p1.Remote.Name = "Remote"
	if p1.InteractionData.InputItem.Value ~= "" then
		p1:RunProcessLoop()
	end
	function p1.Remote.OnServerInvoke(p12, p2, ...) --[[ Line: 75 | Upvalues: v3 (ref), p1 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p12)
		if not v1 then
			return
		end
		if p12 ~= p1.Building.Player then
			return
		end
		if p2 == "Process" then
			return p1:_handleInput(v1, ...)
		end
		if p2 == "Collect" then
			return p1:_handleCollect(v1)
		else
			return false
		end
	end
	p1.Remote.Parent = p1.Model
	p1.Maid:GiveTask(p1.Remote)
end
function t._handleInput(p1, p2, p3) --[[ _handleInput | Line: 93 ]]
	if p1.InteractionData.InputItem.Value ~= p3.Name then
		if p1.InteractionData.InputTime.Value > 0 then
			return false, "AlreadyProcessing"
		end
		if p1.InteractionData.InputAmount.Value >= p1.Building.Data.InputAmount then
			return false, "AlreadyProcessing"
		end
		if p1.InteractionData.ClaimAmount.Value > 0 then
			return false, "ItemsToClaim"
		end
	end
	if not table.find(p1.InputItems, p3.Name) then
		return false, "InvalidInput"
	end
	local v1 = p2:GetItemValue(p3.Name)
	if not v1 then
		return false, "NoItem"
	end
	p3.Amount = p2:GetAmountToUse(v1, p3.Amount)
	if p3.Amount <= 0 then
		return "NotEnough"
	end
	local isNotName = p1.InteractionData.InputItem.Value ~= p3.Name
	if isNotName then
		p1:_returnItems(p2)
	end
	v1.Value = v1.Value - p3.Amount
	if p1.InteractionData.InputTime.Value > 0 then
		local InputAmount = p1.InteractionData.InputAmount
		InputAmount.Value = InputAmount.Value + p3.Amount
	else
		p1.InteractionData.InputItem.Value = p3.Name
		if isNotName then
			p1.InteractionData.InputAmount.Value = p3.Amount
		else
			local InputAmount = p1.InteractionData.InputAmount
			InputAmount.Value = InputAmount.Value + p3.Amount
		end
	end
	p1:RunProcessLoop()
	return true
end
function t._returnItems(p1, p2) --[[ _returnItems | Line: 153 ]]
	if not (#p1.InteractionData.InputItem.Value <= 0) then
		local v1 = p2:GetItemValue(p1.InteractionData.InputItem.Value)
		v1.Value = v1.Value + p1.InteractionData.InputAmount.Value
	end
end
function t.RunProcessLoop(p1) --[[ RunProcessLoop | Line: 159 | Upvalues: v7 (copy) ]]
	if p1.InteractionData.InputAmount.Value < p1.Building.Data.InputAmount or p1.InteractionData.ClaimAmount.Value >= 20 then
		p1.InteractionData.InputTime.Value = 0
	elseif not p1.RunningLoop then
		p1.RunningLoop = true
		p1.InteractionData.InputTime.Value = v7.Get()
		p1.ProcessingMaid:GiveTask(v7.AttachToTime(function() --[[ Line: 170 | Upvalues: v7 (ref), p1 (copy) ]]
			if not (v7.Get() - p1.InteractionData.InputTime.Value >= p1.Building.Data.ProccessTime) then
				return
			end
			p1:_handleOutput()
		end))
		p1.ProcessingMaid:GiveTask(function() --[[ Line: 175 | Upvalues: p1 (copy) ]]
			p1.RunningLoop = false
		end)
	end
end
function t._handleOutput(p1) --[[ _handleOutput | Line: 180 | Upvalues: v7 (copy) ]]
	local ClaimAmount = p1.InteractionData.ClaimAmount
	ClaimAmount.Value = ClaimAmount.Value + 1
	local InputAmount = p1.InteractionData.InputAmount
	InputAmount.Value = InputAmount.Value - p1.Building.Data.InputAmount
	p1.InteractionData.InputTime.Value = v7.Get()
	if not (p1.InteractionData.InputAmount.Value < p1.Building.Data.InputAmount or p1.InteractionData.ClaimAmount.Value >= 20) then
		return
	end
	p1.ProcessingMaid:DoCleaning()
	p1.InteractionData.InputTime.Value = 0
end
function t._handleCollect(p1, p2) --[[ _handleCollect | Line: 192 | Upvalues: Sonar (copy), v6 (copy) ]]
	if p1.InteractionData.ClaimAmount.Value <= 0 then
		warn("Nothing to collect")
		return false, "NothingToCollect"
	end
	if not (Sonar("Constants").IsTestGame or p2:CanGiveItem("Inventory")) then
		return false, "InventoryFull"
	end
	local ClaimAmount = p1.InteractionData.ClaimAmount.Value
	p1.InteractionData.ClaimAmount.Value = 0
	local v1 = v6.GetByName(p1.InteractionData.InputItem.Value)
	p2:GiveItem({
		Name = p1.Building.Data.OutputItems[v1.Rarity.Name],
		Amount = ClaimAmount,
		IgnoreLimit = Sonar("Constants").IsTestGame,
		Source = p1.Building.Data.Name
	})
	if p1.InteractionData.InputAmount.Value <= 0 then
		p1.InteractionData.InputItem.Value = ""
		p1.InteractionData.InputTime.Value = 0
	else
		p1:RunProcessLoop()
	end
	return true
end
function t._initClient(p1) --[[ _initClient | Line: 227 | Upvalues: Sonar (copy), RunService (copy), t2 (copy), v5 (copy), v4 (copy) ]]
	p1.IsOwner = p1.Building.Player == game.Players.LocalPlayer
	if p1.IsOwner then
		p1.InteractionData = p1.Building:GetOrCreateInteractionData()
		p1.Remote = p1.Model:WaitForChild("Remote")
		p1.Gui = script.DisplayGui:Clone()
		p1.Gui.AlwaysOnTop = true
		p1.Gui.Adornee = p1.Model
		p1.Gui.Frame.Title.Text = Sonar("DisplayUtils").GetDisplayName(p1.Building.Data.Name, p1.Building.Data)
		p1.Gui.Frame.IdleLabel.Visible = true
		p1.Gui.Frame.TimerLabel.Text = ""
		p1.Gui.Frame.SmeltedItem.Visible = false
		p1.Gui.Frame.AmountLabel.Visible = false
		p1.Gui.Frame.TimerLabel.Visible = false
		p1.Gui.Frame.OutputItem.Visible = false
		p1.Gui.Frame.FullLabel.Visible = false
		p1.Gui.Frame.Arrow.Visible = false
		p1.Gui.Frame.OutputAmountLabel.Visible = false
		p1.Gui.Frame.InputAmountLabel.Text = "x" .. p1.Building.Data.InputAmount .. " > x1"
		p1.Gui.Parent = p1.Model
		p1.Maid:GiveTask(p1.Gui)
		p1.ProccessTime = p1.Building.Data.ProccessTime
		p1.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 257 | Upvalues: p1 (copy) ]]
			p1:_updateCountdown()
		end))
		p1.InteractMenu = Sonar("InteractMenu").new(p1.Building.PrimaryPart, {
			Scale = 0.75,
			ShowHintLabel = true,
			Hint = "Interact",
			GetRange = function() --[[ GetRange | Line: 264 ]]
				return 10
			end
		})
		p1.InteractMenu:_addOption({
			Hint = "Claim",
			Image = "rbxassetid://109046276532065",
			Run = function() --[[ Run | Line: 273 | Upvalues: p1 (copy), t2 (ref), v5 (ref) ]]
				local v1, v2 = p1.Remote:InvokeServer("Collect")
				if not v1 and t2[v2] then
					v5.NotifyIssue(v2)
				end
				if not v1 then
					return
				end
				p1:_updateCountdown()
			end
		})
		p1.InteractMenu:_addOption({
			Image = "rbxassetid://16550455022",
			Hint = function() --[[ Hint | Line: 286 | Upvalues: p1 (copy) ]]
				if #p1.InteractionData.InputItem.Value > 0 then
					return "Swap Items"
				else
					return "Add Items"
				end
			end,
			HintChanged = { p1.InteractionData.InputItem:GetPropertyChangedSignal("Value") },
			Run = function() --[[ Run | Line: 295 | Upvalues: v4 (ref), p1 (copy) ]]
				v4.ResetSelection()
				v4.OpenSmelting(p1.InputItems, p1.Building.Data, p1)
			end
		})
		p1.Maid:GiveTask(p1.InteractMenu)
	end
end
function t._isReadyToCollect(p1) --[[ _isReadyToCollect | Line: 303 | Upvalues: v7 (copy) ]]
	return v7.Get() - p1.InteractionData.InputTime.Value >= p1.Building.Data.ProccessTime
end
function t._updateCountdown(p1) --[[ _updateCountdown | Line: 307 | Upvalues: v7 (copy), v6 (copy) ]]
	if #p1.InteractionData.InputItem.Value <= 0 then
		p1.Gui.Frame.SmeltedItem.Visible = false
		p1.Gui.Frame.AmountLabel.Visible = false
		p1.Gui.Frame.TimerLabel.Visible = false
		p1.Gui.Frame.OutputItem.Visible = false
		p1.Gui.Frame.Arrow.Visible = false
		p1.Gui.Frame.OutputAmountLabel.Visible = false
		p1.Gui.Frame.IdleLabel.Text = "Idle"
		p1.Gui.Frame.IdleLabel.Visible = true
		p1.Gui.Frame.FullLabel.Visible = false
		return
	end
	if p1.InteractionData.InputTime.Value > 0 then
		local v2 = math.max(0, p1.Building.Data.ProccessTime - (v7.Get() - p1.InteractionData.InputTime.Value))
		p1.Gui.Frame.IdleLabel.Visible = false
		p1.Gui.Frame.TimerLabel.Visible = true
		p1.Gui.Frame.FullLabel.Visible = false
		p1.Gui.Frame.TimerLabel.Text = v7.FormatString((math.max(v2, 0)))
	else
		p1.Gui.Frame.TimerLabel.Visible = false
		p1.Gui.Frame.FullLabel.Visible = p1.InteractionData.ClaimAmount.Value >= 20
		p1.Gui.Frame.IdleLabel.Text = "Needs more resources!"
		p1.Gui.Frame.IdleLabel.Visible = not p1.Gui.Frame.FullLabel.Visible
	end
	p1.Gui.Frame.SmeltedItem.Visible = true
	p1.Gui.Frame.AmountLabel.Visible = true
	p1.Gui.Frame.OutputItem.Visible = true
	p1.Gui.Frame.Arrow.Visible = true
	p1.Gui.Frame.OutputAmountLabel.Visible = true
	local v4 = v6.GetByName(p1.InteractionData.InputItem.Value)
	p1.Gui.Frame.SmeltedItem.Image = v4.Image
	p1.Gui.Frame.AmountLabel.Text = tostring(p1.InteractionData.InputAmount.Value)
	p1.Gui.Frame.OutputItem.Image = v6.GetByName(p1.Building.Data.OutputItems[v4.Rarity.Name]).Image
	p1.Gui.Frame.OutputAmountLabel.Text = p1.InteractionData.ClaimAmount.Value
end
function t.AddItem(p1, p2, p3) --[[ AddItem | Line: 355 | Upvalues: v4 (copy), t2 (copy), v5 (copy) ]]
	v4.Close()
	local v1, v2 = p1.Remote:InvokeServer("Process", {
		Name = p2,
		Amount = p3
	})
	if v1 or not t2[v2] then
		return
	end
	v5.NotifyIssue(v2)
end
function t.Init(p1) --[[ Init | Line: 368 | Upvalues: v1 (copy), v5 (copy), t2 (copy) ]]
	if v1 then
		return
	end
	v5.AddResponses(t2)
end
t:Init()
return t