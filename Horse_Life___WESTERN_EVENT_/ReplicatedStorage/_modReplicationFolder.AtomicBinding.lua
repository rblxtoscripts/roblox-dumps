-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local function parsePath(p1) --[[ parsePath | Line: 46 ]]
	local v1 = string.split(p1, "/")
	for i = #v1, 1, -1 do
		if v1[i] == "" then
			table.remove(v1, i)
		end
	end
	return v1
end
local function isManifestResolved(p1, p2) --[[ isManifestResolved | Line: 56 ]]
	local count = 0
	for k in pairs(p1) do
		count = count + 1
	end
	assert(count <= p2, count)
	return count == p2
end
local function v1(p1, p2) --[[ unbindNodeDescend | Line: 66 | Upvalues: v1 (copy) ]]
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
local function destroyDestructor(p1) --[[ destroyDestructor | Line: 97 ]]
	if p1 == nil then
		return
	end
	if typeof(p1) == "function" then
		p1()
		return
	end
	local v1 = p1.Destroy or (p1.destroy or (p1.DoCleaning or p1.Cleanup))
	if typeof(v1) ~= "function" then
		return
	end
	v1(p1)
end
function t.new(p1, p2, p3) --[[ new | Line: 126 | Upvalues: v1 (copy), CollectionService (copy), parsePath (copy), t (copy) ]]
	debug.profilebegin("AtomicBinding.new")
	local count = 1
	local t2 = {}
	local t3 = {}
	local t4 = {}
	local t5 = {}
	for k in pairs(p2) do
		count = count + 1
	end
	local function stopBoundFn(p1) --[[ stopBoundFn | Line: 139 | Upvalues: t2 (copy) ]]
		local v1 = t2[p1]
		if not v1 then
			return
		end
		if v1 ~= nil and typeof(v1) == "function" then
			v1()
		elseif v1 ~= nil then
			local v2 = v1.Destroy or (v1.destroy or (v1.DoCleaning or v1.Cleanup))
			if typeof(v2) == "function" then
				v2(v1)
			end
		end
		t2[p1] = nil
	end
	local function startBoundFn(p1, p2) --[[ startBoundFn | Line: 147 | Upvalues: t2 (copy), p3 (copy) ]]
		local v1 = t2[p1]
		if v1 then
			if v1 ~= nil and typeof(v1) == "function" then
				v1()
			elseif v1 ~= nil then
				local v2 = v1.Destroy or (v1.destroy or (v1.DoCleaning or v1.Cleanup))
				if typeof(v2) == "function" then
					v2(v1)
				end
			end
			t2[p1] = nil
		end
		local v3 = p3(p2)
		if not v3 then
			return
		end
		t2[p1] = v3
	end
	local function v12(p12) --[[ bindRoot | Line: 156 | Upvalues: t3 (copy), p2 (copy), t4 (copy), t2 (copy), v1 (ref), CollectionService (ref), p1 (copy), v12 (copy), parsePath (ref), count (ref), p3 (copy) ]]
		local v13 = t3[p12] == nil
		assert(v13)
		local t = {}
		t3[p12] = t
		debug.profilebegin("ParseTree")
		local t5 = {
			alias = "root",
			instance = p12
		}
		if next(p2) then
			t5.children = {}
			t5.connections = {}
		end
		t4[p12] = t5
		local function f2() --[[ Line: 175 | Upvalues: p12 (copy), t2 (ref), t3 (ref), v1 (ref), t5 (copy), t4 (ref), CollectionService (ref), p1 (ref), v12 (ref) ]]
			if p12:IsDescendantOf(game) then
				if t3[p12] ~= nil or not CollectionService:HasTag(p12, p1) then
					return
				end
				task.defer(v12, p12)
			else
				local v13 = p12
				local v2 = t2[v13]
				if v2 then
					if v2 ~= nil and typeof(v2) == "function" then
						v2()
					elseif v2 ~= nil then
						local v3 = v2.Destroy or (v2.destroy or (v2.DoCleaning or v2.Cleanup))
						if typeof(v3) == "function" then
							v3(v2)
						end
					end
					t2[v13] = nil
				end
				local v4 = t3[p12]
				if v4 then
					v1(t5, v4)
					t4[p12] = nil
					t3[p12] = nil
				end
			end
		end
		table.insert(t5.connections, p12.AncestryChanged:Connect(f2))
		for k, v in pairs(p2) do
			local v3 = parsePath(v)
			local v4 = t5
			for v5, v6 in v3 do
				local v8 = v4.children[v6] or {}
				if if v5 == #v3 then true else false then
					if v8.alias ~= nil then
						error("Multiple aliases assigned to one instance")
					end
					v8.alias = if typeof(k) == "number" then v6 else k
					if v6 == "PrimaryPart" then
						v8._resolvePrimaryPart = true
					end
				else
					v8.children = v8.children or {}
					v8.connections = v8.connections or {}
				end
				v4.children[v6] = v8
				v4 = v8
			end
		end
		debug.profileend()
		local function v122(p1) --[[ processNode | Line: 231 | Upvalues: t (copy), p12 (copy), t2 (ref), v1 (ref), v122 (copy), count (ref), p3 (ref) ]]
			local v12 = assert(p1.instance)
			local children = p1.children
			local alias = p1.alias
			local v2 = not children
			if alias then
				t[alias] = v12
			end
			if not v2 then
				local v3 = children and children.PrimaryPart
				if v3 and (v3._resolvePrimaryPart and v12:IsA("Model")) then
					local function resolvePrimary() --[[ resolvePrimary | Line: 246 | Upvalues: v12 (copy), v3 (copy), p12 (ref), t2 (ref), v1 (ref), t (ref), v122 (ref) ]]
						local PrimaryPart = v12.PrimaryPart
						if PrimaryPart == v3.instance then
							if PrimaryPart ~= nil or v3.instance == nil then
								return
							end
							local v13 = p12
							local v2 = t2[v13]
							if v2 then
								if v2 ~= nil and typeof(v2) == "function" then
									v2()
								elseif v2 ~= nil then
									local v32 = v2.Destroy or (v2.destroy or (v2.DoCleaning or v2.Cleanup))
									if typeof(v32) == "function" then
										v32(v2)
									end
								end
								t2[v13] = nil
							end
							v1(v3, t)
						else
							if v3.instance ~= nil then
								local v4 = p12
								local v5 = t2[v4]
								if v5 then
									if v5 ~= nil and typeof(v5) == "function" then
										v5()
									elseif v5 ~= nil then
										local v6 = v5.Destroy or (v5.destroy or (v5.DoCleaning or v5.Cleanup))
										if typeof(v6) == "function" then
											v6(v5)
										end
									end
									t2[v4] = nil
								end
								v1(v3, t)
							end
							if PrimaryPart ~= nil then
								v3.instance = PrimaryPart
								v122(v3)
							end
						end
					end
					resolvePrimary()
					table.insert(p1.connections, v12:GetPropertyChangedSignal("PrimaryPart"):Connect(resolvePrimary))
				end
				local function processAddChild(p1) --[[ processAddChild | Line: 270 | Upvalues: children (copy), v122 (ref) ]]
					local v1 = children[p1.Name]
					if v1 and v1.instance == nil then
						v1.instance = p1
						v122(v1)
					end
				end
				local function processDeleteChild(p1) --[[ processDeleteChild | Line: 281 | Upvalues: children (copy), p12 (ref), t2 (ref), v1 (ref), t (ref), v12 (copy), v122 (ref) ]]
					local v13 = p1.Name
					local v2 = children[v13]
					if not v2 then
						return
					end
					if v2.instance ~= p1 then
						return
					end
					local v3 = p12
					local v4 = t2[v3]
					if v4 then
						if v4 ~= nil and typeof(v4) == "function" then
							v4()
						elseif v4 ~= nil then
							local v5 = v4.Destroy or (v4.destroy or (v4.DoCleaning or v4.Cleanup))
							if typeof(v5) == "function" then
								v5(v4)
							end
						end
						t2[v3] = nil
					end
					v1(v2, t)
					assert(if v2.instance == nil then true else false)
					local v7 = v12:FindFirstChild(v13)
					if not v7 then
						return
					end
					local v8 = children[v7.Name]
					if not v8 then
						return
					end
					if v8.instance ~= nil then
						return
					end
					v8.instance = v7
					v122(v8)
				end
				for v5, v6 in v12:GetChildren() do
					local v7 = children[v6.Name]
					if v7 and v7.instance == nil then
						v7.instance = v6
						v122(v7)
					end
				end
				table.insert(p1.connections, v12.ChildAdded:Connect(processAddChild))
				table.insert(p1.connections, v12.ChildRemoved:Connect(processDeleteChild))
			end
			if not v2 then
				return
			end
			local v8 = t
			local v9 = count
			local count_2 = 0
			for k in pairs(v8) do
				count_2 = count_2 + 1
			end
			assert(count_2 <= v9, count_2)
			if not (count_2 == v9) then
				return
			end
			local v123 = p12
			local v13 = t
			local v14 = t2[v123]
			if v14 then
				if v14 ~= nil and typeof(v14) == "function" then
					v14()
				elseif v14 ~= nil then
					local v15 = v14.Destroy or (v14.destroy or (v14.DoCleaning or v14.Cleanup))
					if typeof(v15) == "function" then
						v15(v14)
					end
				end
				t2[v123] = nil
			end
			local v16 = p3(v13)
			if not v16 then
				return
			end
			t2[v123] = v16
		end
		debug.profilebegin("ResolveTree")
		v122(t5)
		debug.profileend()
	end
	local function unbindRoot(p1) --[[ unbindRoot | Line: 332 | Upvalues: t2 (copy), t4 (copy), t3 (copy), v1 (ref) ]]
		local v12 = t2[p1]
		if v12 then
			if v12 ~= nil and typeof(v12) == "function" then
				v12()
			elseif v12 ~= nil then
				local v2 = v12.Destroy or (v12.destroy or (v12.DoCleaning or v12.Cleanup))
				if typeof(v2) == "function" then
					v2(v12)
				end
			end
			t2[p1] = nil
		end
		local v3 = t4[p1]
		if v3 then
			v1(v3, (assert(t3[p1])))
			t4[p1] = nil
		end
		t3[p1] = nil
	end
	for v2, v3 in CollectionService:GetTagged(p1) do
		task.spawn(v12, v3)
	end
	local v4 = CollectionService:GetInstanceAddedSignal(p1)
	table.insert(t5, v4:Connect(v12))
	local v5 = CollectionService:GetInstanceRemovedSignal(p1)
	table.insert(t5, v5:Connect(unbindRoot))
	debug.profileend()
	return setmetatable({
		_dtorMap = t2,
		_connections = t5,
		_rootInstToRootNode = t4,
		_rootInstToManifest = t3
	}, t)
end
function t.Destroy(p1) --[[ Destroy | Line: 371 | Upvalues: v1 (copy) ]]
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