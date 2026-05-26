-- https://lua.expert/
local t = {}
local t2 = {}
local v1 = game:GetService("RunService"):IsServer()
local v2 = if v1 then game:GetService("ServerStorage"):WaitForChild("DataTemplate") else v1
local v3 = pcall(function() --[[ Line: 11 ]]
	return game["Run Service"]:IsEdit()
end) and game.ServerScriptService:FindFirstChild("DataTemplates", true) or game.ReplicatedStorage.Storage.DataTemplates
local function getIndexOfValue(p1) --[[ getIndexOfValue | Line: 17 ]]
	local v1 = p1:GetChildren()
	for i = 1, #v1 do
		if not p1:FindFirstChild(i) then
			return i
		end
	end
	return #v1 + 1
end
local function setValuesOfDataValue(p1, p2) --[[ setValuesOfDataValue | Line: 28 ]]
	if p2.Value then
		p1.Value = p2.Value
	end
	for k, v in pairs(p2) do
		if k ~= "Value" then
			local v1 = p1:FindFirstChild(k, true)
			if v1 then
				v1.Value = v
			end
		end
	end
end
function t.SetValuesOfDataValue(p1, p2) --[[ SetValuesOfDataValue | Line: 42 | Upvalues: setValuesOfDataValue (copy) ]]
	setValuesOfDataValue(p1, p2)
end
function t.getIndexOfValue(p1) --[[ getIndexOfValue | Line: 47 | Upvalues: getIndexOfValue (copy) ]]
	return getIndexOfValue(p1)
end
function t.GetIndexOfValue(p1) --[[ GetIndexOfValue | Line: 52 ]]
	local v1 = p1:GetChildren()
	for i = 1, #v1 do
		if not p1:FindFirstChild(i) then
			return i
		end
	end
	return #v1 + 1
end
function t.CreateIndexedDataValue(p1, p2, p3) --[[ CreateIndexedDataValue | Line: 65 | Upvalues: t (copy), setValuesOfDataValue (copy) ]]
	local v2 = if p1 then t.GetIndexOfValue(p1) else nil
	local v3 = t.CreateDataValueFromType(p2 and p2.DataValueName or p1.Name)
	v3.Name = if v2 then v2 else v3.Name
	if p2 then
		setValuesOfDataValue(v3, p2)
	end
	if p3 then
		v3.Parent = p1
	end
	return v3
end
function t.CreateDataValueFromType(p1, p2) --[[ CreateDataValueFromType | Line: 85 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]
	local v2 = if v1 then v1:Clone() else nil
	if v2 and p2 then
		v2.Parent = p2
	end
	return v2
end
function t.GetDataValueFromType(p1) --[[ GetDataValueFromType | Line: 97 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.ResetDataValue(p1) --[[ ResetDataValue | Line: 102 ]]
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("StringValue") then
			v.Value = ""
			continue
		end
		if v:IsA("IntValue") or v:IsA("NumberValue") then
			v.Value = 0
			continue
		end
		if v:IsA("BoolValue") then
			v.Value = false
		end
	end
end
function t.IsValueObject(p1) --[[ IsValueObject | Line: 115 ]]
	return p1.ClassName:match("Value$") ~= nil
end
function t.FormatSize(p1) --[[ FormatSize | Line: 120 ]]
	local t = { "B", "KB", "MB", "GB", "TB" }
	local v1 = #p1
	local v2 = "B"
	for v3, v4 in t do
		if not (v1 >= 1024 and v3 < #t) then
			break
		end
		v2 = t[v3 + 1]
		v1 = v1 / 1024
	end
	return string.format("%.1f %s", v1, v2)
end
for k, v in pairs(v3:GetChildren()) do
	if t2[v.Name] then
		warn("Data Value Template already found for", v.Name)
	end
	t2[v.Name] = v
end
t.DataTemplate = v2
t.Data_Template = v2
t.DATA_TEMPLATES = t2
return t