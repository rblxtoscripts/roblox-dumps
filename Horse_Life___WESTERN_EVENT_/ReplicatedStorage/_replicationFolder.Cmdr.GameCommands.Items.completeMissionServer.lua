-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("PlayerWrapper")
local function resetDataValue(p1) --[[ resetDataValue | Line: 4 ]]
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
local function fillDataValue(p1) --[[ fillDataValue | Line: 16 ]]
	for k, v in pairs(p1:GetDescendants()) do
		if v.Name ~= "Claimed" then
			if v:IsA("StringValue") then
				v.Value = ""
				continue
			end
			if v:IsA("IntValue") or v:IsA("NumberValue") then
				v.Value = 1000000
				continue
			end
			if v:IsA("BoolValue") then
				v.Value = true
			end
		end
	end
end
return function(p1, p2, p3, p4) --[[ Line: 30 | Upvalues: v1 (copy), fillDataValue (copy), resetDataValue (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	if not v12 then
		return "Failed to find this player"
	end
	local v2 = v12.PlayerData.Missions:FindFirstChild(p3, true)
	v2.Value = -1
	local v3 = if p4 == nil then true else p4
	if v3 then
		fillDataValue(v2)
	else
		resetDataValue(v2)
	end
	return string.format("%* %* for player %*", p3, if v3 then "complete" else "cleared", p2.Name)
end