-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("GetRemote")
local v3 = shared.GBMod("Signal")
local v4 = shared.GBMod("SignalConnection")
local v5 = v2("Function", "Get")
v2("Function", "GetEventData")
v2("Event", "EventDataUpdated")
local v6 = v2("Event", "ConfigChanged")
local v7 = v3.new()
local v8 = v3.new()
local v9 = false
local t2 = {
	DevConfigs = {},
	DevConfigsByPlayer = {},
	GBConfigs = {},
	ClientConfigs = {}
}
local t3 = {}
local t4 = {}
local function IsPathPrivate(p1, p2) --[[ IsPathPrivate | Line: 72 ]]
	for v1, v2 in p2 do
		if not (#p1 < #v2) then
			local v3 = true
			for i, v in ipairs(p1) do
				if v2[i] == nil then
					return true
				end
				if v ~= v2[i] then
					v3 = false
					break
				end
			end
			if v3 then
				return true
			end
		end
	end
	return false
end
local function FilterConfigForClient(p1, p2, p3) --[[ FilterConfigForClient | Line: 96 | Upvalues: v1 (copy) ]]
	local v12 = if typeof(p2) == "table" then v1.recursiveCopy(p2) else p2
	local t = {}
	for v2, v3 in p3 do
		local v4 = true
		for i, v in ipairs(p1) do
			if v3[i] == nil then
				break
			end
			if v ~= v3[i] then
				v4 = false
				break
			end
		end
		if v4 then
			local v5 = table.clone(v3)
			for i = 1, #p1 do
				table.remove(v5, 1)
			end
			table.insert(t, v5)
		end
	end
	for v6, v7 in t do
		if #v7 == 0 then
			return nil
		end
		local v8 = v12
		for v9, v10 in v7 do
			if v9 == #v7 then
				v8[v10] = nil
				break
			end
			v8 = v8[v10]
			if v8 == nil then
				v1.GBWarn("Privacy path " .. table.concat(v7, ".") .. " does not exist in config.")
				break
			end
		end
	end
	return v12
end
function t.IsReady(p1) --[[ IsReady | Line: 154 | Upvalues: v9 (ref) ]]
	return v9
end
function t.OnReady(p1, p2) --[[ OnReady | Line: 158 | Upvalues: v9 (ref), v7 (copy), t2 (copy), v4 (copy) ]]
	if v9 then
		task.spawn(p2, t2.DevConfigs)
		return v4.new()
	else
		return v7:Once(p2)
	end
end
function t.WaitForConfigsReady(p1) --[[ WaitForConfigsReady | Line: 167 | Upvalues: v9 (ref), v7 (copy) ]]
	if v9 then
		return true
	end
	v7:Wait()
	return true
end
function t.OnChanged(p1, p2, p3, p4) --[[ OnChanged | Line: 174 | Upvalues: v8 (copy), t2 (copy) ]]
	if type(p3) == "string" then
		p3 = { p3 }
	end
	return v8:Connect(function(p12, p22, p32) --[[ Line: 180 | Upvalues: p2 (copy), t2 (ref), p3 (ref), p4 (copy), p1 (copy) ]]
		local v1 = if p12 == nil then true else false
		if p2 == nil and not v1 then
			return
		end
		if p2 and v1 then
			if t2.DevConfigsByPlayer[p2] then
				return
			end
		elseif p2 and p12 ~= p2 then
			return
		end
		for v2, v3 in p22 do
			local v4 = true
			for v5, v6 in p3 do
				if v3.path[v5] == nil then
					break
				end
				if v6 ~= v3.path[v5] then
					v4 = false
					break
				end
			end
			if v4 then
				p4(p1:Get(p2, p3), p1:Get(p2, p3, p32))
				return
			end
		end
	end)
end
function t._checkConfigChanged(p1, p2, p3) --[[ _checkConfigChanged | Line: 216 ]]
	local t = {}
	local function addToBatch(p1, p2, p3) --[[ addToBatch | Line: 219 | Upvalues: t (copy) ]]
		table.insert(t, {
			path = p1,
			newValue = p2
		})
	end
	local function v1(p1, p2, p3) --[[ recursiveChangedFinder | Line: 223 | Upvalues: t (copy), v1 (copy) ]]
		local v2 = if p3 then p3 else {}
		for v3, v4 in p1 do
			local v5 = table.clone(v2)
			table.insert(v5, v3)
			local v6 = p2[v3]
			if v6 == nil then
				table.insert(t, {
					newValue = nil,
					path = v5
				})
				continue
			end
			if type(v6) == type(v4) then
				if type(v6) == "table" then
					v1(v4, v6, v5)
					continue
				end
				if v6 ~= v4 then
					table.insert(t, {
						path = v5,
						newValue = v6
					})
				end
				continue
			end
			table.insert(t, {
				path = v5,
				newValue = v6
			})
		end
		for v10, v11 in p2 do
			local v122 = table.clone(v2)
			table.insert(v122, v10)
			if p1[v10] == nil then
				table.insert(t, {
					path = v122,
					newValue = v11
				})
			end
		end
	end
	v1(p2, p3)
	return t
end
function t.ApplyInternalConfigs(p1, p2) --[[ ApplyInternalConfigs | Line: 261 | Upvalues: t2 (copy) ]]
	for v1, v2 in p2 do
		t2.GBConfigs[v1] = v2
	end
end
local function addRootmostPathToSet(p1, p2) --[[ addRootmostPathToSet | Line: 271 ]]
	if #p2 == 0 then
		table.clear(p1)
	end
	local v1 = table.create(#p2)
	for v2, v3 in p2 do
		table.insert(v1, (v3:gsub("\\", "\\\\"):gsub("%.", "\\.")))
	end
	local v5 = table.concat(v1, ".")
	if p1[v5] then
		return
	end
	for v6 in p1 do
		if string.sub(v5, 1, #v6) == v6 then
			if #v5 < #v6 then
				p1[v6] = nil
				p1[v5] = p2
			end
			return
		end
	end
	p1[v5] = p2
end
function t.ApplyConfigs(p1, p2, p3, p4, p5) --[[ ApplyConfigs | Line: 309 | Upvalues: v1 (copy), t2 (copy), t4 (copy), t3 (ref), t (copy), v8 (copy), IsPathPrivate (copy), addRootmostPathToSet (copy), FilterConfigForClient (copy), v6 (copy), Players (copy), v9 (ref), v7 (copy) ]]
	if not p2 then
		assert(p3, "Server configs cannot be cleared")
		assert(p4, "Server config privacy cannot be cleared")
	end
	local v2 = v1.recursiveCopy(p2 and t2.DevConfigsByPlayer[p2] or t2.DevConfigs)
	local v3 = p2 and t4[p2] or t3
	if p2 then
		t4[p2] = p4
	else
		t3 = p4
	end
	local function v4(p1) --[[ recursiveFreeze | Line: 336 | Upvalues: v4 (copy) ]]
		if not table.isfrozen(p1) then
			table.freeze(p1)
		end
		for v1, v2 in p1 do
			if type(v2) == "table" then
				v4(v2)
			end
		end
	end
	if p3 then
		v4(p3)
	end
	if p2 then
		t2.DevConfigsByPlayer[p2] = p3
		if p3 == nil then
			p3 = t2.DevConfigs
		end
		if p4 == nil then
			p4 = t3
		end
	else
		t2.DevConfigs = p3
	end
	if p5 ~= true then
		local v5 = t:_checkConfigChanged(v2, p3)
		if #v5 > 0 then
			v8:Fire(p2, v5, v2)
		end
		local t5 = {}
		for v62, v72 in p4 do
			local v82 = if v1.getValueAtPath(v2, v72) == nil then false else true
			if v82 and not IsPathPrivate(v72, v3) then
				addRootmostPathToSet(t5, v72)
			end
		end
		local v92 = v1.getTableValues(t5)
		local t6 = {}
		for v10, v11 in v3 do
			if not IsPathPrivate(v11, p4) then
				addRootmostPathToSet(t6, v11)
			end
		end
		local v122 = v1.getTableValues(t6)
		local v13 = table.create(#v5)
		for v14, v15 in v5 do
			if not (IsPathPrivate(v15.path, v92) or IsPathPrivate(v15.path, v122)) then
				table.insert(v13, v15)
			end
		end
		local v17 = v13
		for v18, v19 in t5 do
			table.insert(v17, {
				newValue = nil,
				isPrivacyTransition = true,
				path = v19
			})
		end
		for v20, v21 in t6 do
			local v22 = v1.getValueAtPath(p3, v21)
			if v22 ~= nil then
				table.insert(v17, {
					isPrivacyTransition = true,
					path = v21,
					newValue = v22
				})
			end
		end
		if #v17 > 0 then
			local t7 = {}
			for v23, v24 in v17 do
				if v24.isPrivacyTransition or not IsPathPrivate(v24.path, p4) then
					v24.newValue = FilterConfigForClient(v24.path, v24.newValue, p4)
					table.insert(t7, v24)
				end
			end
			if p2 then
				v6:FireClient(p2, t7)
			else
				for v25, v26 in Players:GetPlayers() do
					if not t2.DevConfigsByPlayer[v26] then
						v6:FireClient(v26, t7)
					end
				end
			end
		end
	end
	v9 = true
	v7:Fire(p3)
end
function t.Get(p1, p2, p3, p4) --[[ Get | Line: 463 | Upvalues: v1 (copy), t2 (copy) ]]
	if typeof(p3) ~= "table" and typeof(p3) ~= "string" then
		v1.GBWarn("Config path must be a string or list of strings.")
		return nil
	end
	local v12 = typeof(p3) == "string" and { p3 } or p3
	if not p4 then
		p1:WaitForConfigsReady()
	end
	local v4 = p4 or (p2 and t2.DevConfigsByPlayer[p2] or t2.DevConfigs)
	for i, v in ipairs(v12) do
		v4 = v4[v]
		if v4 == nil then
			return nil
		end
	end
	return v4
end
function t.GetActiveConfig(p1, p2) --[[ GetActiveConfig | Line: 491 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.GetEventData(p1, p2) --[[ GetEventData | Line: 496 | Upvalues: t2 (copy), v1 (copy) ]]
	local v12 = t2.GBConfigs.GBEventData[p2]
	if v12 then
		return v12
	end
	v1.GBWarn("No Gamebeast event named " .. p2)
	return v12
end
function t.Init(p1) --[[ Init | Line: 507 | Upvalues: v5 (copy), t4 (copy), t3 (ref), t2 (copy), FilterConfigForClient (copy), IsPathPrivate (copy) ]]
	function v5.OnServerInvoke(p12, p2) --[[ Line: 510 | Upvalues: p1 (copy), t4 (ref), t3 (ref), t2 (ref), FilterConfigForClient (ref), IsPathPrivate (ref) ]]
		p1:WaitForConfigsReady()
		local v1 = t4[p12] or t3
		if p2 == nil then
			return FilterConfigForClient({}, p12 and t2.DevConfigsByPlayer[p12] or t2.DevConfigs, v1)
		elseif IsPathPrivate(p2, v1) then
			return nil
		else
			return FilterConfigForClient(p2, p1:Get(p12, p2), v1)
		end
	end
end
return t