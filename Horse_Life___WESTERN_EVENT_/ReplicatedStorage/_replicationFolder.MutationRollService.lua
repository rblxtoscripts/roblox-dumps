-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("MutationUtils")
local v5 = Sonar("ItemDataService")
local v6 = v1 and Sonar("AnimalManager")
local v7 = v1 and Sonar("AnalyticsService")
local t2 = { "DoNotLog" }
local function addItemAnalytics(p1, p2, p3, p4, p5, p6) --[[ addItemAnalytics | Line: 25 | Upvalues: t2 (copy), v7 (copy) ]]
	if not table.find(t2, p5) then
		v7.ReportResourceEvent(p1, p2, p3, p4, p5, p6)
	end
end
function t.CanRollMutation(p1, p2, p3) --[[ CanRollMutation | Line: 33 | Upvalues: v4 (copy), v5 (copy) ]]
	if not p1:HasEnoughOfItem(1, "MutationPotion") then
		game:GetService("MarketplaceService"):PromptProductPurchase(p1.Player, 1860937786)
		return "CantAffordMutationRoll"
	end
	local v1 = p2.Mutations:FindFirstChild(p3)
	if not v1 then
		return
	end
	local v2 = v4.GetMutation(v1.Value)
	if v2 and (v2.Type == "Wings" and p2.Species.Value == "Peryton") then
		return "CannotDeleteWingsOnPeryton"
	end
	local v3 = v5.GetByType(p2.Species.Value, "Animals")
	if v3 and (v3.ToyEvent or v3.ToyHorse) then
		return "ToyHorseCannotRerollMutation"
	else
		return true, v1
	end
end
function t.CanKeepPreviousMutation(p1) --[[ CanKeepPreviousMutation | Line: 65 | Upvalues: v1 (copy) ]]
	if v1 and not p1.RolledMutation then
		return "NoMutationRoll"
	end
	local v12 = p1:CanAfford(1000, "Coins")
	if v12 then
		return true, v12
	else
		return "CannotAfford"
	end
end
function t.SetMutationToRoll(p1, p2) --[[ SetMutationToRoll | Line: 80 | Upvalues: v6 (copy) ]]
	if p2.RolledMutation then
		p2.RolledMutation.MutationSlotValue.Value = p2.RolledMutation.NewMutation
		p2.RolledMutation.MutationSlotValue.Level.Value = 1
		local SlotValue = p2.RolledMutation.SlotValue
		task.spawn(function() --[[ Line: 86 | Upvalues: v6 (ref), p2 (copy), SlotValue (copy) ]]
			v6.RefreshAnimal(p2, SlotValue)
		end)
		p2.RolledMutation = nil
		return true
	end
end
function t.Init(p1) --[[ Init | Line: 93 | Upvalues: v1 (copy), v3 (copy), t (copy), v2 (copy), v4 (copy), t2 (copy), v7 (copy) ]]
	if not v1 then
		return
	end
	v3.bindToPlayers(function(p1) --[[ Line: 95 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		local function f2() --[[ Line: 98 | Upvalues: v1 (copy), t (ref) ]]
			if not v1.RolledMutation then
				return
			end
			if not workspace:GetAttribute("ShuttingDown") then
				t:SetMutationToRoll(v1)
				return
			end
			local v12 = v1:GetItemValue("MutationPotion")
			v12.Value = v12.Value + 1
		end
		table.insert(v1.OnRemoved, f2)
	end)
	v2.GetRemoteFunction("RollMutationRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 111 | Upvalues: v3 (ref), t (ref), v4 (ref), t2 (ref), v7 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1:GetAnimalSlot(p2)
		if not v2 then
			return
		end
		local v32, v42 = t.CanRollMutation(v1, v2, p3)
		if v32 ~= true then
			return
		end
		local v5, v6
		if #v42.Value > 0 and v42.Value ~= "Nothing" then
			v5 = v42.Value
			if v5 then
				v6 = v2
			else
				v5 = nil
				v6 = v2
			end
		else
			v5 = nil
			v6 = v2
		end
		v1.RolledMutation = {
			PreviousMutation = v5,
			NewMutation = v4.GetRandomMutation(v6, nil, {
				MutationChances = {
					Nothing = 0,
					[v5 or false] = 0,
					[v1.RolledMutation and v1.RolledMutation.NewMutation or false] = 0
				}
			}),
			MutationSlotValue = v42,
			SlotValue = v6
		}
		local v8 = v1:GetItemValue("MutationPotion")
		v8.Value = v8.Value - 1
		if table.find(t2, "MutationRoll") then
			return v1.RolledMutation
		end
		v7.ReportResourceEvent(v1.Player, "Sink", "Potions", "MutationPotion", "MutationRoll", 1)
		return v1.RolledMutation
	end
	v2.GetRemoteFunction("KeepPreviousMutationRemote").OnServerInvoke = function(p1) --[[ Line: 135 | Upvalues: v3 (ref), t (ref), t2 (ref), v7 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32 = t.CanKeepPreviousMutation(v1)
		if v2 ~= true then
			return
		end
		v32.Value = v32.Value - 1000
		if table.find(t2, "KeepMutation") then
			v1.RolledMutation = nil
			return true
		end
		v7.ReportResourceEvent(p1, "Sink", "Currency", v32.Name, "KeepMutation", 1000)
		v1.RolledMutation = nil
		return true
	end
	v2.GetRemoteFunction("ClaimRolledMutationRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 150 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			return t:SetMutationToRoll(v1)
		end
	end
end
t:Init()
return t