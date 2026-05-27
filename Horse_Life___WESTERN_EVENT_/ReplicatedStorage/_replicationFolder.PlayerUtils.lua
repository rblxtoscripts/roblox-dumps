-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserService = game:GetService("UserService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlaceTypeService")
Sonar("Constants")
local v2 = game:GetService("RunService"):IsStudio()
local t2 = {}
local t3 = {}
local t4 = {}
local function playerRemoved(p1) --[[ playerRemoved | Line: 24 | Upvalues: t2 (copy), t3 (copy), t4 (copy) ]]
	t2[p1.UserId] = nil
	t3[p1.UserId] = nil
	t4[p1.UserId] = nil
end
local function getInfoUserIdAsync(p1) --[[ getInfoUserIdAsync | Line: 31 | Upvalues: t4 (copy), UserService (copy) ]]
	local v1 = tonumber(p1)
	if t4[v1] then
		return t4[v1]
	end
	local count = 0
	local v2 = nil
	repeat
		local v3, v4 = pcall(function() --[[ Line: 41 | Upvalues: UserService (ref), v1 (ref) ]]
			return UserService:GetUserInfosByUserIdsAsync({ v1 })
		end)
		if v3 then
			for k, v in pairs(v4) do
				v2 = v
				break
			end
			continue
		end
		wait()
		count = count + 1
	until v2 or count >= 1
	t4[v1] = v2
	return v2
end
local function getUserThumbnail(p1, p2) --[[ getUserThumbnail | Line: 62 ]]
	local v1 = tonumber(p1) or 0
	if v1 <= 0 then
		v1 = 156
	end
	if typeof(p2) ~= "string" then
		p2 = "AvatarHeadShot"
	end
	return ("rbxthumb://type=%*&id=%*&w=180&h=180"):format(p2, v1)
end
function t.GetPlayerName(p1, p2) --[[ GetPlayerName | Line: 78 ]]
	if p2 ~= "Username" and (p1.DisplayName and #p1.DisplayName > 0) then
		return p1.DisplayName
	end
	return p1.Name
end
function t.GetUserNameFromUserId(p1, p2) --[[ GetUserNameFromUserId | Line: 88 | Upvalues: t2 (copy), Players (copy), t (copy), getInfoUserIdAsync (copy) ]]
	local v1 = p2 or "DisplayName"
	if not t2[p1] then
		t2[p1] = {}
	end
	if t2[p1][v1] then
		return t2[p1][v1]
	end
	t2[p1] = {}
	local v2 = Players:GetPlayerByUserId(p1)
	if v2 then
		t2[p1][v1] = t.GetPlayerName(v2, v1)
		return t2[p1][v1]
	end
	local v3 = getInfoUserIdAsync(p1)
	local v4 = v3[v1] and #v3[v1] > 0 and v3[v1] or v3.Username
	if v4 then
		t2[p1][v1] = v4
		return v4
	end
end
function t.GetUserThumbnail(...) --[[ GetUserThumbnail | Line: 117 ]]
	local v1, v2 = ...
	local v3 = tonumber(v1) or 0
	if v3 <= 0 then
		v3 = 156
	end
	if typeof(v2) ~= "string" then
		v2 = "AvatarHeadShot"
	end
	return ("rbxthumb://type=%*&id=%*&w=180&h=180"):format(v2, v3)
end
function t.IsPlayerInGame(p1) --[[ IsPlayerInGame | Line: 123 | Upvalues: Players (copy) ]]
	return p1.Parent == Players
end
function t.CanRunCommand(p1, p2) --[[ CanRunCommand | Line: 128 | Upvalues: v2 (copy), v1 (copy) ]]
	if v2 then
		return true
	end
	if p1.Player.UserId == 6891908 then
		return true
	end
	if p2 and (p2 ~= "DefaultUtil" and (p2 ~= "DefaultDebug" and p2 ~= "UserAlias")) then
		if v1.IsTestGame() and (p1:HasPermission("Tester") or p1:HasPermission("SonarTester")) then
			return true
		end
		return p1:HasPermission(p2)
	else
		if p2 == "Developer" and p1:HasPermission("Developer") then
			return true
		end
		if p1:HasPermission("Developer") or (p1:HasPermission("Admin") or p1:HasPermission("Staff")) then
			return true
		else
			return v1.IsTestGame() and (p1:HasPermission("Tester") or p1:HasPermission("SonarTester")) and true or false
		end
	end
end
Players.PlayerRemoving:Connect(playerRemoved)
return t