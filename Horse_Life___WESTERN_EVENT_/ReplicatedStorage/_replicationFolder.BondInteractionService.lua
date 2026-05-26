-- https://lua.expert/
game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("Maid")
local v3 = Sonar("WeightedProbability")
local v4 = Sonar("EventUtils")
local v5 = Sonar("TimeUtils")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("ElderingService")
local v8 = Sonar("StableClubsManager", {
	Deferred = true
})
local v9 = RunService:IsServer()
local v10 = Sonar("Constants")
local BondRequestLoot = v10.BondRequestLoot
if not v9 then
	LocalWrapper = v1.GetClient()
end
local t = {}
t.__index = t
local t2 = {}
function t.Complete(p1, p2) --[[ Complete | Line: 29 | Upvalues: v5 (copy), v7 (copy), v3 (copy), BondRequestLoot (copy), v9 (copy), v1 (copy), v8 (copy) ]]
	if not p1.SelectedHorse then
		return "NoSelectedHorse"
	end
	local v12 = p1.SelectedHorse.AnimalData:Get("BondEvent")
	if type(v12) == "string" then
		local v2 = if p2 then p2 else p1.Wrapper.EquippedTool
		if not v2 or (if v2 then v2.ToolData and v2.ToolData.Name or v2.Name else v2) ~= v12 then
			return "WrongFood"
		end
	end
	p1.IsDelivered = nil
	p1.LastEventTime = v5.Get()
	p1.Wrapper.PlayerData.EventBondRequests.LastRequest.Value = v5.Get()
	if p1.SelectedHorse then
		p1.SelectedHorse.AnimalData:Set("BondEvent", false)
		v7.GivePoints(p1.SelectedHorse.SlotValue, "BondPoints")
		p1.SelectedHorse = nil
	end
	local v4 = BondRequestLoot[v3.getRandomWeightedItem(BondRequestLoot)]
	p1.Wrapper:GiveItem({
		Source = "HorseBondInteraction",
		IgnoreLimit = true,
		Name = v4.Name,
		Amount = v4.Amount
	})
	p1.Wrapper:IncrementMission({
		Type = "HorseBondInteraction",
		Amount = 1
	})
	if not v9 then
		return true
	end
	v8.AddClubPoints(v1.getWrapperFromPlayer(p1.Player), 15, "BondRequest")
	return true
end
function t.SelectNewHorse(p1) --[[ SelectNewHorse | Line: 80 | Upvalues: v6 (copy) ]]
	if p1.IsDelivered == true then
		warn("Already delivered")
		return
	end
	if p1.SelectedHorse and p1.SelectedHorse.AnimalData:Get("BondEvent") then
		return
	end
	if p1.SelectedHorse then
		p1.SelectedHorse.AnimalData:Set("BondEvent", false)
	end
	p1.SelectedHorse = nil
	if not p1.Wrapper.EquippedAnimals or p1.Wrapper.EquippedAnimals == {} then
		warn("No horses")
		return
	end
	local t = {}
	for v1, v2 in p1.Wrapper.EquippedAnimals do
		table.insert(t, v2)
	end
	if #t == 0 then
		return
	end
	for v3, v4 in t do
		if v4.AnimalData and (v4.AnimalData.SlotValue and (v4.AnimalData.SlotValue.Eldering and v4.AnimalData.SlotValue.Eldering.Started)) then
			p1.SelectedHorse = v4
			break
		end
	end
	if p1.SelectedHorse == nil then
		p1.SelectedHorse = t[math.random(1, #t)]
	end
	if not p1.SelectedHorse then
		return false
	end
	local t2 = {}
	for k, v in pairs(p1.Wrapper.PlayerData.Food:GetChildren()) do
		if v.Value > 0 then
			table.insert(t2, v.Name)
		end
	end
	for k, v in pairs(p1.Wrapper.PlayerData.Tools:GetChildren()) do
		if v.Value > 0 and v.Name ~= "Broom" then
			local v62 = v6.GetByName(v.Name)
			if v62 and v62.ToolType == "BondingTool" then
				table.insert(t2, v.Name)
			end
		end
	end
	if #t2 > 0 then
		p1.SelectedHorse.AnimalData:Set("BondEvent", t2[math.random(1, #t2)])
	else
		p1.SelectedHorse.AnimalData:Set("BondEvent", "Apple")
	end
	p1.SelectedMaid:DoCleaning()
	p1.SelectedMaid:GiveTask(p1.SelectedHorse.Model:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 146 | Upvalues: p1 (copy) ]]
		if p1.SelectedHorse and (p1.SelectedHorse.Model and p1.SelectedHorse.Model.Parent) then
			return
		end
		p1.SelectedHorse = nil
	end))
	return true
end
function t.new(p1) --[[ new | Line: 159 | Upvalues: t (copy), v1 (copy), v2 (copy), v5 (copy), t2 (copy) ]]
	local t3 = {}
	setmetatable(t3, t)
	t3.Player = p1
	t3.Wrapper = v1.getWrapperFromPlayer(p1)
	if t3.Wrapper then
		t3.Maid = v2.new()
		t3.LastEventTime = t3.Wrapper.PlayerData.EventBondRequests.LastRequest.Value
		t3.IsDelivered = false
		t3.SelectedHorse = nil
		t3.SelectedMaid = v2.new()
		t3.Maid:GiveTask(t3.SelectedMaid)
		t3.Maid:GiveTask(v5.AttachToTime(function() --[[ Line: 180 | Upvalues: v5 (ref), t3 (copy) ]]
			if not (v5.Get() - t3.LastEventTime >= 300) then
				return
			end
			if t3.Wrapper.EquippedAnimals == nil or t3.Wrapper.EquippedAnimals == {} then
				return
			end
			if t3.SelectedHorse ~= nil then
				return
			end
			if t3.IsDelivered then
				return
			end
			t3:SelectNewHorse()
		end))
		t3.Maid:GiveTask(function() --[[ Line: 192 | Upvalues: t3 (copy), t2 (ref) ]]
			if t3.SelectedHorse then
				t3.SelectedHorse.AnimalData:Set("BondEvent", false)
			end
			if t3.IsDelivered then
				t3.Wrapper.PlayerData.EventBondRequests.LastRequest.Value = t3.LastEventTime
			end
			t2[t3.Player.UserId] = nil
		end)
		t2[t3.Player.UserId] = t3
		return t3
	end
end
function t.CompleteDelivery(p1, p2) --[[ CompleteDelivery | Line: 209 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1.UserId]
	if not v1 then
		return "NoTimer"
	end
	if v1.IsDelivered then
		return "AlreadyDelivered"
	else
		return v1:Complete(p2)
	end
end
function t.Init(p1) --[[ Init | Line: 220 | Upvalues: v9 (copy), v4 (copy), v10 (copy), t (copy), t2 (copy) ]]
	if not v9 then
		return
	end
	v4.bindToTag(v10.LoadedPlayerTag, function(p1) --[[ Line: 223 | Upvalues: t (ref) ]]
		t.new(p1)
	end, function(p1) --[[ Line: 225 | Upvalues: t2 (ref) ]]
		local v1 = t2[p1.UserId]
		if not v1 then
			return
		end
		v1.Maid:DoCleaning()
	end)
end
t:Init()
return t