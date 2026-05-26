-- https://lua.expert/
local Players = game:GetService("Players")
local t = {
	Color3.new(253/255, 41/255, 67/255),
	Color3.new(1/255, 162/255, 255/255),
	Color3.new(2/255, 184/255, 87/255),
	BrickColor.new("Bright violet").Color,
	BrickColor.new("Bright orange").Color,
	BrickColor.new("Bright yellow").Color,
	BrickColor.new("Light reddish violet").Color,
	BrickColor.new("Brick yellow").Color
}
local t2 = {}
local function GetClassicNameValue(p1) --[[ GetClassicNameValue | Line: 20 ]]
	local sum = 0
	for i = 1, #p1 do
		local v2 = string.byte((string.sub(p1, i, i)))
		local count = #p1 - i + 1
		if #p1 % 2 == 1 then
			count = count - 1
		end
		if count % 4 >= 2 then
			v2 = -v2
		end
		sum = sum + v2
	end
	return sum
end
local function ComputeClassicNameColor(p1) --[[ ComputeClassicNameColor | Line: 41 | Upvalues: t (copy), GetClassicNameValue (copy) ]]
	return t[(GetClassicNameValue(p1) + 0) % #t + 1]
end
local function OnPlayerAdded(p1) --[[ OnPlayerAdded | Line: 45 | Upvalues: t2 (copy), t (copy), GetClassicNameValue (copy) ]]
	t2[p1] = t[(GetClassicNameValue(p1.Name) + 0) % #t + 1]
end
local function OnPlayerRemoving(p1) --[[ OnPlayerRemoving | Line: 49 | Upvalues: t2 (copy) ]]
	t2[p1] = nil
end
Players.PlayerAdded:Connect(OnPlayerAdded)
Players.PlayerRemoving:Connect(OnPlayerRemoving)
for v1, v2 in Players:GetPlayers() do
	task.spawn(OnPlayerAdded, v2)
end
return function(p1) --[[ ClassicNameColors | Line: 60 | Upvalues: t2 (copy), t (copy), GetClassicNameValue (copy) ]]
	if not t2[p1] then
		t2[p1] = t[(GetClassicNameValue(p1.Name) + 0) % #t + 1]
	end
	return t2[p1]
end