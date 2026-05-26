-- https://lua.expert/
local RunService = game:GetService("RunService")
local v1 = workspace:GetAttribute("debug_tables")
workspace:GetAttributeChangedSignal("debug_tables"):Connect(function() --[[ Line: 8 | Upvalues: v1 (ref) ]]
	v1 = workspace:GetAttribute("debug_tables")
end)
local ISanTestBuffer = Instance.new("Folder")
ISanTestBuffer.Name = "ISanTestBuffer"
local function trySwapParent(p1) --[[ trySwapParent | Line: 17 | Upvalues: ISanTestBuffer (copy) ]]
	p1.Parent = ISanTestBuffer
	p1.Parent = nil
end
local function isInstanceDestroyed(p1) --[[ isInstanceDestroyed | Line: 22 | Upvalues: trySwapParent (copy) ]]
	if p1.Parent then
		return false
	end
	if p1:IsA("Player") then
		return true
	else
		return not pcall(trySwapParent, p1)
	end
end
local function traverseKV(p1, p2) --[[ traverseKV | Line: 35 ]]
	local t = {}
	local function v1(p1_2, p22_2) --[[ traverseKVInner | Line: 38 | Upvalues: p2 (copy), t (copy), v1 (copy) ]]
		for v12, v2_2 in p1_2 do
			local v3 = ("%*.%*"):format(p22_2, v12)
			p2(v12, "[key]" .. v3)
			p2(v2_2, v3)
			if type(v12) == "table" and not t[v12] then
				t[v12] = true
				v1(v12, v3)
			end
			local v4 = v3
			if type(v2_2) == "table" and not t[v2_2] then
				t[v2_2] = true
				v1(v2_2, v4)
			end
		end
	end
	return v1(p1, "")
end
local v2
if v1 then
	local t = {}
	RunService.Heartbeat:Connect(function() --[[ Line: 64 | Upvalues: t (copy), isInstanceDestroyed (ref) ]]
		task.defer(function() --[[ Line: 65 | Upvalues: t (ref), isInstanceDestroyed (ref) ]]
			local v1 = 0
			local t2 = {}
			for k, v in pairs(t) do
				local v2
				local v3 = 0
				local function f4(p1, p2) --[[ Line: 71 | Upvalues: v1 (ref), v3 (ref), isInstanceDestroyed (ref), v (copy), t (ref), k (copy) ]]
					v1 = v1 + 1
					v3 = v3 + 1
					if typeof(p1) ~= "Instance" or not isInstanceDestroyed(p1) then
						return
					end
					warn(("[ISan] Retaining destroyed reference to Instance `%s` \n ClassName: %s \nLocation: %s \nPath: %s"):format(p1:GetFullName(), p1.ClassName, v, p2 or "Unknown"))
					t[k] = nil
				end
				local t3 = {}
				v2 = function(p1_2, p22_2) --[[ traverseKVInner | Line: 38 | Upvalues: f4 (copy), t3 (copy), v2 (copy) ]]
					for v12, v2_2 in p1_2 do
						local v3 = ("%*.%*"):format(p22_2, v12)
						f4(v12, "[key]" .. v3)
						f4(v2_2, v3)
						if type(v12) == "table" and not t3[v12] then
							t3[v12] = true
							v2(v12, v3)
						end
						local v4 = v3
						if type(v2_2) == "table" and not t3[v2_2] then
							t3[v2_2] = true
							v2(v2_2, v4)
						end
					end
				end
				v2(k, "")
				t2[k] = v3
			end
		end)
	end)
	v2 = function(p1) --[[ isan | Line: 101 | Upvalues: t (copy) ]]
		local v1 = debug.traceback()
		t[p1] = v1:sub(v1:find("\n") + 1, -2)
	end
else
	v2 = function(p1) --[[ isan | Line: 107 ]] end
end
return v2