-- https://lua.expert/
local function parsePath(p1) --[[ parsePath | Line: 3 ]]
	local v1 = string.split(p1, "/")
	for i = #v1, 1, -1 do
		if v1[i] == "" then
			table.remove(v1, i)
		end
	end
	return v1
end
local function isManifestResolved(p1, p2) --[[ isManifestResolved | Line: 13 ]]
	local count = 0
	for k in pairs(p1) do
		count = count + 1
	end
	assert(count <= p2, count)
	return count == p2
end
local function v1(p1, p2) --[[ unbindNodeDescend | Line: 23 | Upvalues: v1 (copy) ]]
	if p1.instance == nil then
		return
	end
	p1.instance = nil
	local connections = p1.connections
	if connections then
		for v12, v2 in connections do
			v2:Disconnect()
		end
		table.clear(connections)
	end
	if p2 and p1.alias then
		p2[p1.alias] = nil
	end
	local children = p1.children
	if not children then
		return
	end
	for k, v in pairs(children) do
		v1(v, p2)
	end
end
local t = {}
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 53 | Upvalues: parsePath (copy), v1 (copy), t (copy) ]]
	debug.profilebegin("AtomicBinding.new")
	local count = 1
	local t2 = {}
	local t3 = {}
	local t4 = {}
	for k in pairs(p2) do
		count = count + 1
	end
	local function stopBoundFn(p1) --[[ stopBoundFn | Line: 66 | Upvalues: t2 (copy) ]]
		local v1 = t2[p1]
		if not v1 then
			return
		end
		v1:destroy()
		t2[p1] = nil
	end
	local function startBoundFn(p1, p2) --[[ startBoundFn | Line: 74 | Upvalues: t2 (copy), p3 (copy) ]]
		local v1 = t2[p1]
		if v1 then
			v1:destroy()
			t2[p1] = nil
		end
		local v2 = p3(p2)
		if not v2 then
			return
		end
		t2[p1] = v2
	end
	local function bindRoot(p1) --[[ bindRoot | Line: 83 | Upvalues: t3 (copy), p2 (copy), t4 (copy), parsePath (ref), t2 (copy), v1 (ref), count (ref), p3 (copy) ]]
		assert(t3[p1] == nil)
		local t = {}
		t3[p1] = t
		debug.profilebegin("ParseTree")
		local t5 = {
			alias = "root",
			instance = p1
		}
		if next(p2) then
			t5.children = {}
			t5.connections = {}
		end
		t4[p1] = t5
		for k, v in pairs(p2) do
			local v2 = parsePath(v)
			local v3 = t5
			for v4, v5 in v2 do
				local v7 = v3.children[v5] or {}
				if if v4 == #v2 then true else false then
					if v7.alias ~= nil then
						error("Multiple aliases assigned to one instance")
					end
					v7.alias = k
				else
					v7.children = v7.children or {}
					v7.connections = v7.connections or {}
				end
				v3.children[v5] = v7
				v3 = v7
			end
		end
		debug.profileend()
		local function v10(p12) --[[ processNode | Line: 130 | Upvalues: t (copy), v10 (copy), p1 (copy), t2 (ref), v1 (ref), count (ref), p3 (ref) ]]
			local v12 = assert(p12.instance)
			local children = p12.children
			local alias = p12.alias
			local v2 = not children
			if alias then
				t[alias] = v12
			end
			if not v2 then
				local function processAddChild(p1) --[[ processAddChild | Line: 142 | Upvalues: children (copy), v10 (ref) ]]
					local v1 = children[p1.Name]
					if v1 and v1.instance == nil then
						v1.instance = p1
						v10(v1)
					end
				end
				local function processDeleteChild(p12) --[[ processDeleteChild | Line: 153 | Upvalues: children (copy), p1 (ref), t2 (ref), v1 (ref), t (ref), v12 (copy), v10 (ref) ]]
					local v13 = p12.Name
					local v2 = children[v13]
					if not v2 then
						return
					end
					if v2.instance ~= p12 then
						return
					end
					local v3 = p1
					local v4 = t2[v3]
					if v4 then
						v4:destroy()
						t2[v3] = nil
					end
					v1(v2, t)
					assert(if v2.instance == nil then true else false)
					local v6 = v12:FindFirstChild(v13)
					if not v6 then
						return
					end
					local v7 = children[v6.Name]
					if not v7 then
						return
					end
					if v7.instance ~= nil then
						return
					end
					v7.instance = v6
					v10(v7)
				end
				for v3, v4 in v12:GetChildren() do
					local v5 = children[v4.Name]
					if v5 and v5.instance == nil then
						v5.instance = v4
						v10(v5)
					end
				end
				table.insert(p12.connections, v12.ChildAdded:Connect(processAddChild))
				table.insert(p12.connections, v12.ChildRemoved:Connect(processDeleteChild))
			end
			if not v2 then
				return
			end
			local v6 = t
			local v7 = count
			local count_2 = 0
			for k in pairs(v6) do
				count_2 = count_2 + 1
			end
			assert(count_2 <= v7, count_2)
			if not (count_2 == v7) then
				return
			end
			local v102 = p1
			local v11 = t
			local v122 = t2[v102]
			if v122 then
				v122:destroy()
				t2[v102] = nil
			end
			local v13 = p3(v11)
			if not v13 then
				return
			end
			t2[v102] = v13
		end
		debug.profilebegin("ResolveTree")
		v10(t5)
		debug.profileend()
	end
	local function unbindRoot(p1) --[[ unbindRoot | Line: 204 | Upvalues: t2 (copy), t4 (copy), t3 (copy), v1 (ref) ]]
		local v12 = t2[p1]
		if v12 then
			v12:destroy()
			t2[p1] = nil
		end
		local v2 = t4[p1]
		if v2 then
			v1(v2, (assert(t3[p1])))
			t4[p1] = nil
		end
		t3[p1] = nil
	end
	for v12, v2 in { p1 } do
		task.spawn(bindRoot, v2)
	end
	p1.Destroying:Once(function() --[[ Line: 221 | Upvalues: p1 (copy), t2 (copy), t4 (copy), t3 (copy), v1 (ref) ]]
		local v12 = p1
		local v2 = t2[v12]
		if v2 then
			v2:destroy()
			t2[v12] = nil
		end
		local v3 = t4[v12]
		if v3 then
			v1(v3, (assert(t3[v12])))
			t4[v12] = nil
		end
		t3[v12] = nil
	end)
	debug.profileend()
	return setmetatable({
		_dtorMap = t2,
		_connections = {},
		_rootInstToRootNode = t4,
		_rootInstToManifest = t3
	}, t)
end
function t.destroy(p1) --[[ destroy | Line: 235 | Upvalues: v1 (copy) ]]
	debug.profilebegin("AtomicBinding:destroy")
	for k, v in pairs(p1._dtorMap) do
		v:destroy()
	end
	table.clear(p1._dtorMap)
	for v12, v2 in p1._connections do
		v2:Disconnect()
	end
	table.clear(p1._connections)
	local _rootInstToManifest = p1._rootInstToManifest
	for k, v in pairs(p1._rootInstToRootNode) do
		v1(v, (assert(_rootInstToManifest[k])))
	end
	table.clear(p1._rootInstToManifest)
	table.clear(p1._rootInstToRootNode)
	debug.profileend()
end
return t