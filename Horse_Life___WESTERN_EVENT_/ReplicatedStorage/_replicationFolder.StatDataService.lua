-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("ItemDataService", {
	Deferred = true
})
local v2 = Sonar("TableUtils")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("FormatTime")
local Presets = v3.GetConfig("Stat")().Presets
local v5 = v3.Get("Stats")()
local t2 = {
	Time = function(p1) --[[ Time | Line: 106 | Upvalues: v4 (copy) ]]
		return v4.FormatString(p1)
	end
}
local t3 = {}
function t._getObject(p1, p2) --[[ _getObject | Line: 119 | Upvalues: v1 (copy) ]]
	return if type(p2) == "table" and p2 then p2 else v1.GetByName(p2)
end
function t._getStatValueInObject(p1, p2, p3) --[[ _getStatValueInObject | Line: 129 ]]
	return p2.Stats and p2.Stats[p3] or p2[p3]
end
function t._getStat(p1, p2, p3, p4) --[[ _getStat | Line: 141 | Upvalues: t (copy), v2 (copy) ]]
	local v1 = if p4 then p4 else {}
	if v1.IgnoreZeroValues then
		if typeof(p3) == "number" and p3 == 0 then
			return nil
		end
		if typeof(p3) == "table" and not next(p3) then
			return nil
		end
	end
	local v22 = v1
	local v3 = t.GetByName(p2)
	if not v3 then
		return nil
	end
	if v22.ValueOnly then
		return p3
	end
	local t2 = {
		Value = p3
	}
	if v22.Format then
		t2.ValueString = t.FormatStat(p2, p3)
		t2.LayoutOrder = v3.LayoutOrder or (1 / 0)
	end
	return v2.Merge(v3, t2)
end
function t.GetByName(p1) --[[ GetByName | Line: 178 | Upvalues: v5 (copy) ]]
	return v5[p1]
end
function t.GetCategoryByName(p1) --[[ GetCategoryByName | Line: 185 | Upvalues: v5 (copy) ]]
	return v5._Categories[p1]
end
function t.GetCategoryByStat(p1) --[[ GetCategoryByStat | Line: 192 | Upvalues: v5 (copy) ]]
	return v5._Categories[p1]
end
function t.GetCategories() --[[ GetCategories | Line: 198 | Upvalues: v5 (copy) ]]
	return v5._Categories
end
function t.FormatStat(p1, p2) --[[ FormatStat | Line: 206 | Upvalues: t (copy), t2 (copy) ]]
	local v1 = t.GetByName(p1)
	if not v1 then
		return tostring(p2)
	end
	local v2 = t2[v1.Format]
	if v2 then
		return v2(p2)
	end
	local v3, v4
	if typeof(v1.Format) == "string" then
		v3 = string.format(v1.Format, p2)
		if not v3 then
			v4 = v1.Format
			v3 = typeof(v4) == "function" and v1.Format(p2) or tostring(p2)
		end
	else
		v4 = v1.Format
		v3 = typeof(v4) == "function" and v1.Format(p2) or tostring(p2)
	end
	return v3
end
function t.FormatStatDelta(p1, p2) --[[ FormatStatDelta | Line: 227 | Upvalues: t (copy) ]]
	local v1 = t.GetByName(p1)
	if not v1 then
		return tostring(p2)
	end
	if typeof(v1.FormatDelta) == "function" then
		return v1.FormatDelta(p2)
	end
	local v2 = t.FormatStat(p1, p2)
	if typeof(p2) == "number" and p2 >= 0 then
		return "+" .. v2
	else
		return v2
	end
end
function t.FormatDescription(p1, p2) --[[ FormatDescription | Line: 252 | Upvalues: t (copy) ]]
	local v1 = if p2 then p2 else p1.Description
	if v1 then
		return v1:gsub("{(%w+)}", function(p12) --[[ Line: 258 | Upvalues: t (ref), p1 (copy) ]]
			local v1 = t:_getStatValueInObject(p1, p12)
			if v1 == nil then
				return "{" .. p12 .. "}"
			else
				return t.FormatStat(p12, v1)
			end
		end)
	else
		return nil
	end
end
function t.GetAll() --[[ GetAll | Line: 270 | Upvalues: v5 (copy) ]]
	return v5
end
function t.GetStatsFrom(p1, p2) --[[ GetStatsFrom | Line: 281 | Upvalues: t (copy) ]]
	local v2 = t:_getObject(p1)
	if not v2 then
		warn("\226\154\160\239\184\143 StatDataService, Object data not found for", v2)
		return nil
	end
	local v3, v4 = if p2 then p2 else {}, {}
	for v5, v6 in { v2.Stats, v2 } do
		for v7, v8 in v6 do
			local v9 = t:_getStat(v7, v8, v3)
			if v9 then
				if v3.ValueOnly then
					v4[v7] = v9.Value
					continue
				end
				table.insert(v4, v9)
			end
		end
	end
	if not v3.ValueOnly and v3.Format then
		table.sort(v4, function(p1, p2) --[[ Line: 308 ]]
			return p1.LayoutOrder < p2.LayoutOrder
		end)
	end
	return if next(v4) and v4 then v4 else nil
end
function t.GetStatValuesFrom(p1, p2) --[[ GetStatValuesFrom | Line: 322 | Upvalues: t (copy) ]]
	local v1 = if p2 then p2 else {}
	v1.ValueOnly = true
	return t.GetStatsFrom(p1, v1)
end
function t.GetStatFrom(p1, p2, p3) --[[ GetStatFrom | Line: 336 | Upvalues: t (copy) ]]
	local v1 = t:_getObject(p1)
	if not v1 then
		warn("\226\154\160\239\184\143 StatDataService, Object data not found for", v1)
		return nil
	end
	local v2 = t:_getStatValueInObject(v1, p2)
	if not v2 then
		return nil
	end
	if t.GetByName(p2) then
		return t:_getStat(p2, v2, p3)
	else
		warn("\226\154\160\239\184\143 StatDataService, Stat name not found for", p2)
		return nil
	end
end
function t.Init(p1) --[[ Init | Line: 361 | Upvalues: v5 (copy), v2 (copy), Presets (copy), t3 (copy) ]]
	v5._Categories = v5.Categories
	v5.Categories = nil
	if v5._Categories then
		v2.Map(v5, function(p1_2, p2_2) --[[ Line: 368 | Upvalues: Presets (ref), t3 (ref), v2 (ref) ]]
			p2_2.Name = p1_2
			if not p2_2.Preset then
				return p2_2
			end
			local v1 = Presets[p2_2.Preset]
			if v1 then
				return v2.MergeOriginal(p2_2, v1, true)
			else
				t3[p1_2] = p2_2.Preset
				return p2_2
			end
		end)
		v2.LogTable({
			Message = "\226\154\160\239\184\143 StatDataService, Stat data has a preset but not found in the config:",
			Table = t3,
			Output = warn
		})
		return
	end
	v5._Categories = {}
	v2.Map(v5, function(p1_2, p2_2) --[[ Line: 368 | Upvalues: Presets (ref), t3 (ref), v2 (ref) ]]
		p2_2.Name = p1_2
		if not p2_2.Preset then
			return p2_2
		end
		local v1 = Presets[p2_2.Preset]
		if v1 then
			return v2.MergeOriginal(p2_2, v1, true)
		else
			t3[p1_2] = p2_2.Preset
			return p2_2
		end
	end)
	v2.LogTable({
		Message = "\226\154\160\239\184\143 StatDataService, Stat data has a preset but not found in the config:",
		Table = t3,
		Output = warn
	})
end
t:Init()
return t