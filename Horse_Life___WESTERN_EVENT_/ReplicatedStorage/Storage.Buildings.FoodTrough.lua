-- https://lua.expert/
local t = {}
t.__index = t
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(game.ReplicatedStorage.Sonar)
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
Sonar("PlayerUtils")
if not v1 then
	Sonar("NotificationsClient")
end
local v4 = Sonar("ItemDataService")
local v5 = not v1 and Sonar("IssueResponseClient")
local v6 = Sonar("AnimalDataService")
local v7 = Sonar("TimeUtils")
local v8 = Sonar("Animal")
local IsTestGame = Sonar("Constants").IsTestGame
local v9 = 1
local v10 = not v1 and v3.GetClient()
local t2 = {
	NotFoodType = "You cannot add that type of item!",
	AlreadyAdded = "You have already added this item!"
}
function t.new(p1) --[[ new | Line: 31 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Building = p1
	v22.Model = p1.Model
	v22.Root = v22.Model
	v22.IsOwner = v22.Building.Player == game.Players.LocalPlayer
	v22.Maid = v2.new()
	if v1 then
		v22:_initServer()
	else
		v22:_initClient()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 51 ]]
	p1._destroyed = true
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._initServer(p1) --[[ _initServer | Line: 57 | Upvalues: v7 (copy), v3 (copy) ]]
	p1.InteractionData = p1.Building:GetOrCreateInteractionData()
	p1.Remote = Instance.new("RemoteFunction")
	p1.Remote.Name = "Remote"
	p1.Model:SetAttribute("L", v7.Get())
	function p1.Remote.OnServerInvoke(p12, p2, ...) --[[ Line: 65 | Upvalues: v3 (ref), p1 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p12)
		if not v1 then
			return
		end
		if p12 ~= p1.Building.Player then
			return
		end
		if p2 == "Add" then
			local v2, v32, v4 = p1:CanAdd(v1, ...)
			if v2 ~= true then
				return
			end
			if v32.Value ~= v4.Name then
				p1:RemoveItem(v1, v32)
			end
			v32.Value = v4.Name
			return true
		elseif p2 == "Remove" then
			local v5, v6 = p1:CanRemove(v1, ...)
			if v5 == true then
				return p1:RemoveItem(v1, v6)
			end
		else
			if p2 ~= "Eat" then
				return
			end
			if p1:CanEat(v1) == true then
				return p1:Eat(...)
			end
		end
	end
	p1.Remote.Parent = p1.Model
	p1.Maid:GiveTask(p1.Remote)
end
function t._initClient(p1) --[[ _initClient | Line: 99 | Upvalues: v2 (copy), v4 (copy), v10 (copy), Sonar (copy), v9 (copy), v7 (copy) ]]
	if not p1.IsOwner then
		return
	end
	p1.InteractionData = p1.Building:GetOrCreateInteractionData()
	p1.Remote = p1.Model:WaitForChild("Remote")
	p1.Gui = script.FoodTroughGui:Clone()
	p1.Gui.AlwaysOnTop = false
	p1.Gui.Adornee = p1.Building.PrimaryPart
	local t = {}
	local function setEmptyLabel() --[[ setEmptyLabel | Line: 112 | Upvalues: p1 (copy), t (ref) ]]
		p1.Gui.Frame.Foods.Visible = next(t)
		p1.Gui.Frame.EmptyLabel.Visible = not next(t)
		p1.Gui.Frame.TimerLabel.Visible = next(t)
	end
	for v1, v22 in p1.InteractionData.Items:GetChildren() do
		local v3 = v2.new()
		p1.Maid:GiveTask(v3)
		local function createOrRemoveItem() --[[ createOrRemoveItem | Line: 121 | Upvalues: v3 (copy), v4 (ref), v22 (copy), v10 (ref), Sonar (ref), p1 (copy), t (ref), setEmptyLabel (copy) ]]
			v3:DoCleaning()
			local v1 = v4.GetByName(v22.Value)
			if v1 then
				local v2 = v10:GetItemValue(v22.Value)
				v3:GiveTask(Sonar("ItemGridButton").new({
					ForceVisible = true,
					Item = v1,
					ParentFrame = p1.Gui.Frame.Foods,
					DataValue = v2,
					AmountColors = {
						None = Color3.fromRGB(255, 94, 97),
						Default = Color3.fromRGB(255, 255, 255)
					}
				}))
				t[v22] = true
			else
				t[v22] = nil
			end
			setEmptyLabel()
		end
		p1.Maid:GiveTask(v22:GetPropertyChangedSignal("Value"):Connect(createOrRemoveItem))
		createOrRemoveItem()
	end
	p1.Maid:GiveTask(function() --[[ Line: 153 | Upvalues: t (ref) ]]
		t = nil
	end)
	local function setTimeLabel() --[[ setTimeLabel | Line: 157 | Upvalues: p1 (copy), v9 (ref), v7 (ref) ]]
		local v1 = (p1.Model:GetAttribute("L") or 0) + v9 - v7.Get()
		p1.Gui.Frame.TimerLabel.Text = if v1 > 0 then v7.FormatString(v1) .. " till next feed." or "Ready to feed!" else "Ready to feed!"
	end
	p1.Maid:GiveTask(p1.Model:GetAttributeChangedSignal("L"):Connect(setTimeLabel))
	p1.Maid:GiveTask(v7.AttachToTime(setTimeLabel))
	local v42 = (p1.Model:GetAttribute("L") or 0) + v9 - v7.Get()
	p1.Gui.Frame.TimerLabel.Text = if v42 > 0 then v7.FormatString(v42) .. " till next feed." or "Ready to feed!" else "Ready to feed!"
	p1.Gui.Parent = p1.Model
	p1.Maid:GiveTask(p1.Gui)
	p1.Maid:GiveTask(Sonar("InteractMenu").new(p1.Building.PrimaryPart, {
		Scale = 0.75,
		ShowHintLabel = true,
		Hint = "Use",
		Run = function() --[[ Run | Line: 172 | Upvalues: Sonar (ref), p1 (copy) ]]
			Sonar("InventoryGui").OpenFoodTrough(p1)
		end,
		GetRange = function() --[[ GetRange | Line: 175 ]]
			return 36
		end
	}))
	task.spawn(function() --[[ Line: 181 | Upvalues: p1 (copy), v10 (ref), v9 (ref), v7 (ref) ]]
		while p1.Model and p1.Model.Parent do
			local v1, v2 = pcall(function() --[[ Line: 183 | Upvalues: p1 (ref), v10 (ref), v9 (ref) ]]
				if p1:CanEat(v10) ~= true then
					return
				end
				local v1 = p1:GetHorses()
				if not next(v1) then
					task.wait(3)
					return
				end
				if p1:Eat(v1) ~= true then
					return
				end
				task.wait(v9 / 2)
			end)
			if not v1 then
				warn(v2)
			end
			v7.OnTimeChanged:Wait()
		end
	end)
end
function t.CanEat(p1, p2) --[[ CanEat | Line: 204 | Upvalues: v9 (copy), v7 (copy) ]]
	if p1.Model:GetAttribute("L") and p1.Model:GetAttribute("L") + v9 - v7.Get() > 0 then
		return "Cooldown"
	else
		return true
	end
end
function t.GetHorses(p1) --[[ GetHorses | Line: 214 | Upvalues: v8 (copy), v6 (copy) ]]
	local t = {}
	for v1, v2 in v8.GetAll() do
		if not ((v2.Root.Position - p1.Building.PrimaryPart.Position).Magnitude > 200 or v6.GetBirthTimeLeft(p1.Building.PlayerWrapper, v2.SlotValue) <= 0) then
			t[#t + 1] = v2.SlotValue.Name
		end
	end
	return t
end
function t.Eat(p1, p2) --[[ Eat | Line: 227 | Upvalues: v1 (copy), v7 (copy), v6 (copy) ]]
	if v1 then
		p1.Model:SetAttribute("L", v7.Get())
		for v12, v2 in p2 do
			local v3 = p1.Building.PlayerWrapper.EquippedAnimals[v2]
			if v3 then
				local SlotValue = v3.SlotValue
				if SlotValue then
					local v4 = v6.GetBirthTimeLeft(p1.Building.PlayerWrapper, SlotValue)
					if not (v4 <= 0) then
						local v5, v62 = p1:GetFood(v4)
						if v5 then
							v5.Value = v5.Value - 1
							local LastBreed = SlotValue.LastBreed
							LastBreed.Value = LastBreed.Value - v62 * 1
						end
					end
				end
			end
		end
		return true
	else
		if not p1.Remote:InvokeServer("Eat", p2) then
			return
		end
		print("Successfully fed from Trough", p2)
	end
end
function t.GetFood(p1, p2) --[[ GetFood | Line: 255 | Upvalues: v4 (copy) ]]
	local t = {}
	for v1, v2 in p1.InteractionData.Items:GetChildren() do
		local v3 = p1.Building.PlayerWrapper:GetItemValue(v2.Value)
		if v3 and not (v3.Value <= 0) then
			local v42 = v4.GetByName(v2.Value)
			if v42 and v42.Gestation then
				t[#t + 1] = {
					Gestation = v42.Gestation,
					ItemValue = v3
				}
			end
		end
	end
	table.sort(t, function(p1, p22) --[[ Line: 272 | Upvalues: p2 (copy) ]]
		local v2 = math.abs(p1.Gestation - p2)
		return v2 < math.abs(p22.Gestation - p2)
	end)
	local v5 = t[1]
	if v5 then
		return v5.ItemValue, v5.Gestation
	end
end
function t.RemoveItem(p1, p2, p3) --[[ RemoveItem | Line: 282 ]]
	p3.Value = ""
end
function t.CanAdd(p1, p2, p3) --[[ CanAdd | Line: 291 | Upvalues: v1 (copy), v4 (copy) ]]
	if v1 then
		p3 = {
			Name = p3.Name,
			ItemType = p3.ItemType,
			ItemData = v4.GetByType(p3.Name, "Food"),
			DataValue = p2:GetItemValue(p3.Name, "Food"),
			Slot = p3.Slot
		}
	end
	if not p3.DataValue then
		return
	end
	if not p3.ItemData.Gestation then
		return "NotFoodType"
	end
	for v12, v2 in p1.InteractionData.Items:GetChildren() do
		if v2.Value == p3.Name then
			return "AlreadyAdded"
		end
	end
	local v3 = p1.InteractionData.Items:FindFirstChild(p3.Slot)
	if v3 then
		return true, v3, p3
	end
end
function t.AddFood(p1, p2) --[[ AddFood | Line: 325 | Upvalues: v4 (copy), v10 (copy), t2 (copy), v5 (copy) ]]
	local v1, _, v2 = p1:CanAdd(v10, {
		Name = p2.Name,
		ItemType = p2.ItemType,
		ItemData = v4.GetByType(p2.Name, "Food"),
		DataValue = v10:GetItemValue(p2.Name, "Food"),
		Slot = p2.Slot
	})
	if v1 == true then
		if not v2 or p1.Remote:InvokeServer("Add", v2) ~= true then
			return
		end
		print("Successfully add item")
	else
		if not t2[v1] then
			return
		end
		v5.NotifyIssue(v1)
	end
end
function t.RemoveFood(p1, p2) --[[ RemoveFood | Line: 347 | Upvalues: v10 (copy), t2 (copy), v5 (copy) ]]
	local v1 = p1:CanRemove(v10, p2)
	if v1 == true then
		if p1.Remote:InvokeServer("Remove", p2) ~= true then
			return
		end
		print("Successfully add item")
	else
		if not t2[v1] then
			return
		end
		v5.NotifyIssue(v1)
	end
end
function t.CanRemove(p1, p2, p3) --[[ CanRemove | Line: 360 ]]
	local v1 = p1.InteractionData.Items:FindFirstChild(p3)
	if v1 then
		return true, v1
	end
end
function t.Init(p1) --[[ Init | Line: 367 | Upvalues: v1 (copy), v5 (copy), t2 (copy) ]]
	if v1 then
		return
	end
	v5.AddResponses(t2)
end
t:Init()
return t