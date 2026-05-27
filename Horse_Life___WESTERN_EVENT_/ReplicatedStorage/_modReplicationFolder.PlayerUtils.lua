-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=180&h=180", 156)
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {
	[-1] = "Player1",
	[-2] = "Player2"
}
local function playerRemoved(p1) --[[ playerRemoved | Line: 19 | Upvalues: t2 (copy), t3 (copy) ]]
	t2[p1.UserId] = nil
	t3[p1.UserId] = nil
end
local function getNameFromUserIdAsync(p1) --[[ getNameFromUserIdAsync | Line: 25 | Upvalues: Players (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 26 | Upvalues: Players (ref), p1 (copy) ]]
		return Players:GetNameFromUserIdAsync(p1)
	end)
	if v1 then
		return v2
	end
end
local function getUserThumbnailAsync(p1) --[[ getUserThumbnailAsync | Line: 36 | Upvalues: v1 (copy) ]]
	if p1 <= 0 then
		return v1
	else
		return string.format("rbxthumb://type=AvatarHeadShot&id=%s&w=180&h=180", p1)
	end
end
function t.GetPlayerName(p1, p2) --[[ GetPlayerName | Line: 47 ]]
	if p2 ~= "Username" and (p1.DisplayName and #p1.DisplayName > 0) then
		return p1.DisplayName
	end
	return p1.Name
end
function t.GetUserNameFromUserId(p1) --[[ GetUserNameFromUserId | Line: 57 | Upvalues: t5 (copy), t2 (copy), Players (copy) ]]
	if t5[p1] then
		return t5[p1]
	end
	if t2[p1] then
		return t2[p1]
	end
	local v1 = Players:GetPlayerByUserId(p1)
	if v1 then
		t2[p1] = v1.Name
		return t2[p1]
	end
	local v2, v3 = pcall(function() --[[ Line: 26 | Upvalues: Players (ref), p1 (copy) ]]
		return Players:GetNameFromUserIdAsync(p1)
	end)
	local v4 = if v2 then v3 else nil
	if v4 then
		t2[p1] = v4
		return v4
	end
end
function t.GetUserIdFromUsername(p1) --[[ GetUserIdFromUsername | Line: 81 | Upvalues: t4 (copy), t5 (copy), Players (copy) ]]
	if t4[p1] then
		return t4[p1]
	end
	for v1, v2 in t5 do
		if v2 == p1 then
			return v1
		end
	end
	local v3 = Players:FindFirstChild(p1)
	if v3 and v3:IsA("Player") then
		t4[p1] = v3.UserId
		return v3.UserId
	end
	local v4, v5 = pcall(function() --[[ Line: 98 | Upvalues: Players (ref), p1 (copy) ]]
		return Players:GetUserIdFromNameAsync(p1)
	end)
	if v4 and v5 then
		t4[p1] = v5
		return v5
	end
end
function t.GetUserThumbnail(p1, p2) --[[ GetUserThumbnail | Line: 110 | Upvalues: getUserThumbnailAsync (copy) ]]
	return getUserThumbnailAsync(p1)
end
function t.IsPlayerInGame(p1) --[[ IsPlayerInGame | Line: 116 | Upvalues: Players (copy) ]]
	return p1.Parent == Players
end
Players.PlayerRemoving:Connect(playerRemoved)
return t