-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("InstanceUtils")
local function createInstanceValueFor(p1) --[[ createInstanceValueFor | Line: 11 | Upvalues: v1 (copy) ]]
	if typeof(p1) == "table" then
		return v1.Create("Folder")
	end
	if typeof(p1) == "string" then
		return v1.Create("StringValue", {
			Value = p1
		})
	end
	if typeof(p1) == "number" then
		return v1.Create("NumberValue", {
			Value = p1
		})
	end
	if typeof(p1) == "boolean" then
		return v1.Create("BoolValue", {
			Value = p1
		})
	end
end
local function getExpectedClassName(p1) --[[ getExpectedClassName | Line: 30 ]]
	local v1 = typeof(p1)
	if v1 == "table" then
		return "Folder"
	end
	if v1 == "string" then
		return "StringValue"
	end
	if v1 == "number" then
		return "NumberValue"
	end
	if v1 == "boolean" then
		return "BoolValue"
	else
		return nil
	end
end
function t.ReplicateTable(p1, p2) --[[ ReplicateTable | Line: 45 | Upvalues: createInstanceValueFor (copy), t (copy) ]]
	if typeof(p2) ~= "table" then
		return
	end
	for v1, v2 in p2 do
		local v3 = tostring(v1)
		local v4 = typeof(v2)
		local v5 = if v4 == "table" then "Folder" elseif v4 == "string" then "StringValue" elseif v4 == "number" then "NumberValue" elseif v4 == "boolean" then "BoolValue" else nil
		if v5 then
			local v6 = p1:FindFirstChild(v3)
			if v6 and v6.ClassName ~= v5 then
				v6:Destroy()
				v6 = nil
			end
			if v6 then
				if not v6:IsA("Folder") then
					v6.Value = v2
				end
				if v6:IsA("Folder") then
					t.ReplicateTable(v6, v2)
				end
			else
				local v7 = createInstanceValueFor(v2)
				if v7 then
					v7.Name = v3
					v7.Parent = p1
					v6 = v7
					if v7:IsA("Folder") then
						t.ReplicateTable(v7, v2)
					end
				end
			end
		end
	end
	for v8, v9 in p1:GetChildren() do
		local v10 = v9.Name
		local v11 = tonumber(v10)
		if p2[v10] == nil and (v11 == nil or p2[v11] == nil) then
			v9:Destroy()
		end
	end
end
return t