-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("ItemDataService")
local v4 = Sonar("Maid")
local v5 = game:GetService("RunService"):IsServer()
local v6 = v1.GetRemoteEvent("SetPlayerToolEquipsLocked")
function t.GetTotalHotbarSlots(p1, p2) --[[ GetTotalHotbarSlots | Line: 20 ]]
	local v1 = if p2 then p2.PlayerData or nil else nil
	return (if v1 then v1.ExtraHotbarSlots.Value else 0) + 3
end
function t.IsHotbarSlotUnlocked(p1, p2, p3) --[[ IsHotbarSlotUnlocked | Line: 31 | Upvalues: t (copy) ]]
	if tonumber(p3) > t:GetTotalHotbarSlots(p2) then
	else
		return true
	end
end
function t.HasExtraHotbarSlots(p1, p2) --[[ HasExtraHotbarSlots | Line: 36 ]]
	return p2.PlayerData.ExtraHotbarSlots.Value > 0
end
function t.CanSetHotbarSlot(p1, p2, p3, p4) --[[ CanSetHotbarSlot | Line: 40 | Upvalues: t (copy) ]]
	local v1 = p2.HotbarData:FindFirstChild(p3)
	if not v1 then
		return
	end
	if not p4 then
		return true, v1
	end
	if not p2:HasEnoughOfItem(1, p4) then
		return "NoOwnTool"
	end
	if t:IsHotbarSlotUnlocked(p2, p3) then
		return true, v1
	else
		return "LockedHotbar"
	end
end
function t.SetHotbarSlot(p1, p2, ...) --[[ SetHotbarSlot | Line: 57 | Upvalues: v1 (copy) ]]
	return v1.GetRemoteFunction("SetHotbarRemote"):InvokeServer(p2, ...)
end
function t.CreateTool(p1, p2, p3) --[[ CreateTool | Line: 61 | Upvalues: v4 (copy), v3 (copy) ]]
	local v1 = v4.new()
	local v2 = nil
	local v32 = v3.GetItemType(p3.Name)
	local v42 = if v32 == "Seeds" then true else false
	local function hasItem() --[[ hasItem | Line: 68 | Upvalues: v42 (copy), p2 (copy), v32 (copy), p3 (copy) ]]
		if v42 then
			for v1, v2 in p2:GetItemFolder(v32):GetChildren() do
				if v2.Value == p3.Name then
					return true
				end
			end
			return false
		else
			local v3 = p2:GetItemValue(p3.Name)
			return if v3 then v3.Value > 0 else v3
		end
	end
	local function createOrDestroyTool() --[[ createOrDestroyTool | Line: 83 | Upvalues: hasItem (copy), v2 (ref), p3 (copy), p2 (copy) ]]
		if hasItem() then
			if v2 then
				return
			end
			if not p3.Model then
				return
			end
			v2 = p3.Model:Clone()
			for v1, v22 in v2:GetDescendants() do
				if not (v22:IsA("BasePart") or (v22:IsA("Attachment") or (v22:IsA("ParticleEmitter") or v22:IsA("WeldConstraint")))) then
					v22.CanCollide = false
					v22.Anchored = false
					v22.CanTouch = false
				end
			end
			v2:AddTag("Tool")
			v2:AddTag("Tool-" .. p2.Player.UserId)
			v2.Name = p3.Name
			v2.Parent = p2.Player:WaitForChild("Backpack")
			return
		end
		if not v2 then
			return
		end
		v2:Destroy()
		v2 = nil
	end
	if v42 then
		local v5 = p2:GetItemFolder(v32)
		v1:GiveTask(v5.ChildAdded:Connect(function(p1) --[[ Line: 113 | Upvalues: p3 (copy), createOrDestroyTool (copy) ]]
			if p1.Value ~= p3.Name then
				return
			end
			createOrDestroyTool()
		end))
		v1:GiveTask(v5.ChildRemoved:Connect(function(p1) --[[ Line: 118 | Upvalues: p3 (copy), createOrDestroyTool (copy) ]]
			if p1.Value ~= p3.Name then
				return
			end
			createOrDestroyTool()
		end))
	else
		local v6 = p2:GetItemValue(p3.Name)
		if v6 then
			v1:GiveTask(v6:GetPropertyChangedSignal("Value"):Connect(createOrDestroyTool))
		end
	end
	createOrDestroyTool()
	v1:GiveTask(function() --[[ Line: 131 | Upvalues: v2 (ref) ]]
		if not v2 then
			return
		end
		v2:Destroy()
		v2 = nil
	end)
	return v1
end
function t.IsItemOnHotbar(p1, p2, p3) --[[ IsItemOnHotbar | Line: 141 ]]
	for k, v in pairs(p2.HotbarData:GetChildren()) do
		if v.Value == p3 then
			return v
		end
	end
end
function t.UpdateBackpack(p1, p2) --[[ UpdateBackpack | Line: 149 | Upvalues: t (copy), v3 (copy) ]]
	for k, v in pairs(p2.Hotbar) do
		if not t:IsItemOnHotbar(p2, k.Name) then
			p2.Hotbar[k]:Destroy()
			p2.Hotbar[k] = nil
		end
	end
	for k, v in pairs(p2.HotbarData:GetChildren()) do
		local v1 = v3.GetByName(v.Value)
		if v1 and not p2.Hotbar[v1] then
			p2.Hotbar[v1] = t:CreateTool(p2, v1)
		end
	end
end
function t.ResetBackpack(p1, p2) --[[ ResetBackpack | Line: 169 ]]
	for k, v in pairs(p2.Hotbar) do
		v:Destroy()
	end
	p2.Hotbar = {}
end
function t.EquipToolIntoEmptySlot(p1, p2, p3) --[[ EquipToolIntoEmptySlot | Line: 176 | Upvalues: t (copy) ]]
	local v1 = p2.HotbarData:GetChildren()
	table.sort(v1, function(p1, p2) --[[ Line: 178 ]]
		local v2 = tonumber(p1.Name) or 0
		return v2 < (tonumber(p2.Name) or 0)
	end)
	for v2, v3 in v1 do
		local v5 = tonumber(v3.Name)
		if v5 and not (t:GetTotalHotbarSlots(p2) < v5 or #v3.Value > 0) then
			v3.Value = p3
			t:UpdateBackpack(p2)
			return
		end
	end
end
function t.GetEmptyToolSlot(p1, p2) --[[ GetEmptyToolSlot | Line: 195 | Upvalues: t (copy) ]]
	local v1 = p2.HotbarData:GetChildren()
	table.sort(v1, function(p1, p2) --[[ Line: 197 ]]
		local v2 = tonumber(p1.Name) or 0
		return v2 < (tonumber(p2.Name) or 0)
	end)
	for v2, v3 in v1 do
		local v5 = tonumber(v3.Name)
		if v5 and not (t:GetTotalHotbarSlots(p2) < v5 or #v3.Value > 0) then
			return v3
		end
	end
end
function t.SetToolEquipsLocked(p1, p2) --[[ SetToolEquipsLocked | Line: 210 | Upvalues: v2 (copy), v5 (copy), v6 (copy) ]]
	if not p1 or p1:GetAttribute("IsToolEquipsLocked") == p2 then
		return
	end
	p1:SetAttribute("IsToolEquipsLocked", p2)
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 and v1.Humanoid then
		v1.Humanoid:UnequipTools()
	end
	if v5 then
		v6:FireClient(p1, p2)
	else
		v6:FireServer(p2)
	end
end
function t.Init(p1) --[[ Init | Line: 228 | Upvalues: v5 (copy), v2 (copy), t (copy), v1 (copy), v6 (copy), Players (copy) ]]
	if v5 then
		v2.bindToPlayers(function(p1) --[[ Line: 230 | Upvalues: v2 (ref), t (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if v1 then
				v1.Hotbar = {}
				v1.Maid:GiveTask(p1.ChildAdded:Connect(function(p1) --[[ Line: 236 | Upvalues: t (ref), v1 (copy) ]]
					if p1.Name ~= "Backpack" then
						return
					end
					t:ResetBackpack(v1)
					t:UpdateBackpack(v1)
				end))
				t:UpdateBackpack(v1)
				local function updateBackpack() --[[ updateBackpack | Line: 244 | Upvalues: v1 (copy), t (ref) ]]
					local v12 = false
					for k, v in pairs(v1.HotbarData:GetChildren()) do
						if not (#v.Value <= 0 or t:IsHotbarSlotUnlocked(v1, (tonumber(v.Name)))) then
							v.Value = ""
							v12 = true
						end
					end
					if not v12 then
						return
					end
					t:UpdateBackpack(v1)
				end
				v1.Maid:GiveTask(v1.PlayerData.ExtraHotbarSlots:GetPropertyChangedSignal("Value"):Connect(updateBackpack))
				updateBackpack()
			end
		end)
		v1.GetRemoteFunction("SetHotbarRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 261 | Upvalues: v2 (ref), t (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22, v3 = t:CanSetHotbarSlot(v1, p2, p3)
			if v22 ~= true then
				return
			end
			for k, v in pairs(v1.HotbarData:GetChildren()) do
				if v == v3 then
					v3.Value = p3 or ""
					continue
				end
				if v.Value == p3 then
					v.Value = ""
				end
			end
			t:UpdateBackpack(v1)
			return true
		end
		v1.GetRemoteFunction("RefreshBackpackRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 281 | Upvalues: v2 (ref), t (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if v1 then
				t:UpdateBackpack(v1)
				return true
			end
		end
		v6.OnServerEvent:Connect(function(p1, p2) --[[ Line: 289 | Upvalues: t (ref) ]]
			t.SetToolEquipsLocked(p1, p2)
		end)
	else
		v6.OnClientEvent:Connect(function(p1) --[[ Line: 293 | Upvalues: t (ref), Players (ref) ]]
			t.SetToolEquipsLocked(Players.LocalPlayer, p1)
		end)
	end
end
t:Init()
return t