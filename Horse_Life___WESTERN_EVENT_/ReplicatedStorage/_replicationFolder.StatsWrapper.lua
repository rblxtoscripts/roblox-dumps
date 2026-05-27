-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("InstanceUtils")
local v3 = Sonar("DataUpdateService", {
	Context = "Server"
})
local v4 = v1.GetConfig("Stat")()
local v5 = game:GetService("RunService"):IsServer()
local PlayerStatTypes = v4.PlayerStatTypes
local t2 = {}
local StatGroups = v4.StatGroups
function t.new(p1) --[[ new | Line: 104 | Upvalues: t (copy), v5 (copy), v2 (copy), PlayerStatTypes (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = p1.Maid
	v22.Player = p1.Player
	v22.PlayerWrapper = p1
	v22.PlayerData = v22.PlayerWrapper.PlayerData
	if v22.PlayerWrapper:IsLocalOrServer() then
		v22.StatsData = v22.PlayerData.Stats
	end
	if v5 then
		v22.SessionStatsFolder = v2.Create("Configuration", {
			Name = "SessionStats",
			Parent = v22.Player
		})
		v22.Maid:GiveTask(v22.SessionStatsFolder)
		for v3, v4 in PlayerStatTypes.SessionStats do
			v22:SetStat(v3, v4.DefaultValue or 0)
		end
		v22.PlayerWrapper:AddOnTickCallback(function() --[[ Line: 131 | Upvalues: v22 (copy) ]]
			v22:IncrementStat({
				Name = "TimePlayed",
				Amount = 1
			})
		end)
		for v52, v6 in PlayerStatTypes.SavedStats do
			if v6.Init then
				v6.Init(v22.PlayerWrapper)
			end
		end
	else
		v22.SessionStatsFolder = v22.Player:WaitForChild("SessionStats")
	end
	if v5 then
		for v7, v8 in PlayerStatTypes do
			for v9, v10 in v8 do
				if v10.Derive then
					v22:_recomputeDerivedStat(v9, v10)
				end
			end
		end
	end
	return v22
end
function t._getStatData(p1, p2) --[[ _getStatData | Line: 160 | Upvalues: PlayerStatTypes (copy) ]]
	for v1, v2 in PlayerStatTypes do
		local v3 = v2[p2]
		if v3 then
			return v3
		end
	end
	return nil
end
function t._getStatGroupData(p1, p2) --[[ _getStatGroupData | Line: 170 | Upvalues: StatGroups (copy) ]]
	return StatGroups[p2]
end
function t._recomputeDerivedStat(p1, p2, p3) --[[ _recomputeDerivedStat | Line: 174 | Upvalues: StatGroups (copy) ]]
	if p3.DeriveFrom then
		local t = {}
		for v1, v2 in p3.DeriveFrom do
			table.insert(t, p1:GetStat(v2) or 0)
		end
		p1:SetStat(p2, p3.Derive(p1.PlayerWrapper, unpack(t)))
		for v4 in StatGroups do
			local t2 = {}
			for v5, v6 in p3.DeriveFrom do
				table.insert(t2, p1:GetStat(v6, v4) or 0)
			end
			p1:SetStat(p2, p3.Derive(p1.PlayerWrapper, unpack(t2)), v4)
		end
	else
		if not p3.Derive then
			return
		end
		local v8 = p3.Derive(p1.PlayerWrapper)
		p1:SetStat(p2, v8)
		for v9 in StatGroups do
			p1:SetStat(p2, v8, v9)
		end
	end
end
function t._updateDerivedStats(p1, p2, p3, p4) --[[ _updateDerivedStats | Line: 198 | Upvalues: t2 (copy) ]]
	if not t2[p2] then
		return
	end
	for v1 in t2[p2] do
		local v2 = p1:_getStatData(v1)
		if v2 then
			if v2.Derive then
				p1:_recomputeDerivedStat(v1, v2)
				continue
			end
			if v2.IncrementFrom then
				local v3 = table.clone(p4)
				v3.Name = v1
				v3.Amount = p3
				p1:IncrementStat(v3)
			end
		end
	end
end
function t.IncrementStat(p1, p2) --[[ IncrementStat | Line: 220 | Upvalues: StatGroups (copy) ]]
	local v1 = p2.Name
	local v2 = p1:_getStatData(v1)
	if not v2 then
		p1:_updateDerivedStats(v1, p2.Amount, p2)
		return
	end
	if v2.DeriveFrom then
		return
	end
	if v2.Derive then
		p1:_recomputeDerivedStat(v1, v2)
		return
	end
	local v3 = if v2.ValueToUse then p2[v2.ValueToUse] elseif v2.ValueOverride then v2.ValueOverride else p2.Amount or 1
	if not v3 then
		return
	end
	if v2.CanIncrement and not v2.CanIncrement(p1.PlayerWrapper, v1, v3, p2) then
		return
	end
	local function applyAmount(p1) --[[ applyAmount | Line: 255 | Upvalues: v2 (copy), v3 (ref) ]]
		if v2.KeepHighest then
			return math.max(p1, v3)
		end
		if not v2.KeepLowest then
			return p1 + v3
		end
		if p1 == 0 then
			return v3
		else
			return math.min(p1, v3)
		end
	end
	local v4 = p1:GetStat(v1) or 0
	local v5 = if v2.KeepHighest then math.max(v4, v3) elseif v2.KeepLowest then if v4 == 0 then v3 else math.min(v4, v3) else v4 + v3
	p1:SetStat(v1, v5)
	for v11, v12 in StatGroups do
		local v10
		local v13 = p1:GetStat(v1, v11) or 0
		v10 = if v2.KeepHighest then math.max(v13, v3) elseif v2.KeepLowest then if v13 == 0 then v3 else math.min(v13, v3) else v13 + v3
		p1:SetStat(v1, v10, v11)
	end
	p1:_updateDerivedStats(v1, v3, p2)
end
function t.SetStat(p1, p2, p3, p4) --[[ SetStat | Line: 276 ]]
	local v1 = p1:_getStatData(p2)
	local v2 = p1:GetStatValue(p2, p4)
	if v2 then
		v2.Value = p3
	end
	if v1.ReplicateToAll then
		local v3, v4
		if p4 then
			v3 = "_" .. p4
			v4 = p2
		else
			v4 = p2
			v3 = ""
		end
		p1.SessionStatsFolder:SetAttribute(v4 .. v3, p3)
	else
		if v2 then
			return
		end
		local v5, v6
		if p4 then
			v5 = "_" .. p4
			v6 = p2
		else
			v6 = p2
			v5 = ""
		end
		p1.PlayerWrapper:SetReplicatedData(v6 .. v5, p3)
	end
end
function t.GetStatValue(p1, p2, p3) --[[ GetStatValue | Line: 294 ]]
	local v1 = if p3 then p1:_getStatGroupData(p3).Data(p1.PlayerWrapper) else p1.StatsData
	if v1 then
		return v1:FindFirstChild(p2)
	end
end
function t.GetStat(p1, p2, p3) --[[ GetStat | Line: 308 ]]
	local v1 = p1:GetStatValue(p2, p3)
	if v1 then
		return v1.Value
	end
	local v2, v3
	if p3 then
		v2 = "_" .. p3
		v3 = p2
	else
		v3 = p2
		v2 = ""
	end
	local v4 = p1.SessionStatsFolder:GetAttribute(v3 .. v2)
	if v4 then
		return v4
	end
	if v1 or not p1.PlayerWrapper:IsLocalOrServer() then
		return nil
	end
	local v5, v6
	if p3 then
		v5 = "_" .. p3
		v6 = p2
	else
		v6 = p2
		v5 = ""
	end
	return p1.PlayerWrapper:GetReplicatedData(v6 .. v5)
end
function t.GetStatChangedSignal(p1, p2, p3) --[[ GetStatChangedSignal | Line: 326 ]]
	local v1 = p1:GetStatValue(p2, p3)
	if v1 then
		return v1:GetPropertyChangedSignal("Value")
	end
	if p1:_getStatData(p2).ReplicateToAll then
		local v2, v3
		if p3 then
			v2 = "_" .. p3
			v3 = p2
		else
			v3 = p2
			v2 = ""
		end
		return p1.SessionStatsFolder:GetAttributeChangedSignal(v3 .. v2)
	else
		if not p1.PlayerWrapper:IsLocalOrServer() then
			return nil
		end
		local v4, v5
		if p3 then
			v4 = "_" .. p3
			v5 = p2
		else
			v5 = p2
			v4 = ""
		end
		return p1.PlayerWrapper:GetReplicatedDataChangedSignal(v5 .. v4)
	end
end
function t.ResetStat(p1, p2, p3, p4) --[[ ResetStat | Line: 342 ]]
	local v1 = p1:_getStatData(p2)
	if not v1 then
		return
	end
	p1:SetStat(p2, if p3 then p3 else v1.DefaultValue or 0, p4)
end
function t.ResetStatsOfType(p1, p2, ...) --[[ ResetStatsOfType | Line: 351 | Upvalues: PlayerStatTypes (copy) ]]
	for v1, v2 in PlayerStatTypes do
		for v3, v4 in v2 do
			if v4.Type == p2 then
				p1:ResetStat(v3, ...)
			end
		end
	end
end
function t.GetStatsOfType(p1, p2) --[[ GetStatsOfType | Line: 361 | Upvalues: PlayerStatTypes (copy) ]]
	local t = {}
	for v1, v2 in PlayerStatTypes do
		for v3, v4 in v2 do
			if v4.Type == p2 then
				t[v3] = p1:GetStat(v3)
			end
		end
	end
	return t
end
function t.Init(p1) --[[ Init | Line: 373 | Upvalues: PlayerStatTypes (copy), t2 (copy), v5 (copy), v3 (copy), v2 (copy), StatGroups (copy) ]]
	for v1, v22 in PlayerStatTypes do
		for v32, v4 in v22 do
			v4.IsSessionStat = v1 == "SessionStats"
			if v4.IncrementFrom then
				if not t2[v4.IncrementFrom] then
					t2[v4.IncrementFrom] = {}
				end
				t2[v4.IncrementFrom][v32] = true
			end
			if v4.DeriveFrom then
				for v6, v7 in v4.DeriveFrom do
					if not t2[v7] then
						t2[v7] = {}
					end
					t2[v7][v32] = true
				end
			end
		end
	end
	if not v5 then
		return
	end
	v3.AddRigDataCallback(function(p1) --[[ Line: 398 | Upvalues: v2 (ref), PlayerStatTypes (ref), StatGroups (ref) ]]
		local Stats = p1:FindFirstChild("Stats")
		if not Stats then
			Stats = v2.Create("Folder", {
				Name = "Stats",
				Parent = p1
			})
		end
		for v22, v3 in PlayerStatTypes.SavedStats do
			if not Stats:FindFirstChild(v22) then
				v2.Create("IntValue", {
					Name = v22,
					Value = v3.DefaultValue or 0,
					Parent = Stats
				})
			end
		end
		for v4, v5 in StatGroups do
			v5.Init(p1, v5.Stats)
		end
	end)
end
return t