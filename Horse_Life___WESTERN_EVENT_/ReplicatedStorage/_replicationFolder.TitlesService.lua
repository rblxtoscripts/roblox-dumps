-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataUtils")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("BadgeService")
local v4 = Sonar("Constants")
local PlayerWrappers = v4.PlayerWrappers
local TextColor = v4.PresetColors.Default.TextColor
local v5 = Sonar(v2.Get("Titles"))
local t2 = {}
local t3 = {}
local function giveContributorTitlesToPlayer(p1, p2, p3) --[[ giveContributorTitlesToPlayer | Line: 24 | Upvalues: t2 (copy), t (copy) ]]
	for k, v in pairs(t2) do
		if p3[v] then
			t.GiveTitleToPlayer(p1, v)
			continue
		end
		local v1 = p1.Data.Titles:FindFirstChild(v)
		if v1 then
			v1:Destroy()
		end
	end
end
function t.PlayerAdded(p1, p2, p3, ...) --[[ PlayerAdded | Line: 38 | Upvalues: giveContributorTitlesToPlayer (copy) ]]
	giveContributorTitlesToPlayer(p2, p3, ...)
end
function t.IncrementProgress(p1, p2) --[[ IncrementProgress | Line: 43 | Upvalues: PlayerWrappers (copy) ]]
	local v1 = PlayerWrappers[p1]
	if not v1 then
		return
	end
	if v1.TitlesWrapper then
		v1.TitlesWrapper:_incrementProgress(p2)
	end
end
function t.CheckAwardTitleWithStat(p1, p2, p3) --[[ CheckAwardTitleWithStat | Line: 51 | Upvalues: PlayerWrappers (copy), t3 (copy), t (copy) ]]
	if typeof(p2) ~= "string" then
		return
	end
	local v1 = PlayerWrappers[p1]
	if not v1 then
		return
	end
	local Titles = v1.PlayerData.Titles
	for k, v in pairs(t3[p2] or {}) do
		if t.DoesPlayerOwnTitle(Titles, v.Title) then
			if v.KeepIfGoalLost == false and (not t.HasStatsForTitle(p1, v.Title, p3) and Titles:FindFirstChild(v.Title)) then
				Titles[v.Title]:Destroy()
				print("dynamically removing title", v.Title)
			end
			continue
		end
		if v.Requirement and (v.Requirement.Stat and (v.Requirement.Stat == p2 and t.HasStatsForTitle(p1, v.Title, p3))) then
			t.GiveTitleToPlayer(p1, v.Title)
		end
	end
end
function t.CheckAwardTitleWithCustomFunction(p1, p2) --[[ CheckAwardTitleWithCustomFunction | Line: 78 | Upvalues: PlayerWrappers (copy), t (copy) ]]
	local v1 = PlayerWrappers[p1]
	if not v1 then
		return
	end
	local Titles = v1.PlayerData.Titles
	local v2 = t.GetTitleFromName(p2)
	if t.DoesPlayerOwnTitle(Titles, v2.Title) then
		if v2.KeepIfGoalLost == false and (not t.HasStatsForTitle(p1, v2.Title) and Titles:FindFirstChild(v2.Title)) then
			Titles[v2.Title]:Destroy()
			print("dynamically removing title", v2.Title)
		end
	else
		if not (v2.Requirement and (v2.Requirement.Stat and t.HasStatsForTitle(p1, v2.Title))) then
			return
		end
		t.GiveTitleToPlayer(p1, v2.Title)
	end
end
function t.GiveTitleToPlayer(p1, p2) --[[ GiveTitleToPlayer | Line: 101 | Upvalues: PlayerWrappers (copy), t (copy), v1 (copy) ]]
	local v12 = PlayerWrappers[p1]
	if not v12 then
		return
	end
	local Titles = v12.PlayerData.Titles
	if t.DoesPlayerOwnTitle(Titles, p2) then
	else
		local v2 = v1.CreateDataValueFromType("Titles")
		v2.Name = p2
		v2.Value = true
		v2.Parent = Titles
		return true
	end
end
function t.HasStatsForTitle(p1, p2, p3) --[[ HasStatsForTitle | Line: 116 | Upvalues: PlayerWrappers (copy), t (copy), v3 (copy) ]]
	local v1 = PlayerWrappers[p1]
	if not v1 then
		return
	end
	local v2 = t.GetTitleFromName(p2)
	if v2.Requirement and v2.Requirement.Stat and typeof(v2.Requirement.Stat) == "function" then
		local v32 = v2.Requirement.Stat(v1)
		if not v32 then
			return false
		end
		return if v32 == v2.Requirement.EndGoal then true else v2.Requirement.EndGoal < v32
	end
	if v2.BadgeId then
		return v3.DoesPlayerOwnBadge(p1, v2.BadgeId)
	else
		return false
	end
end
function t.DoesPlayerOwnTitle(p1, p2) --[[ DoesPlayerOwnTitle | Line: 134 ]]
	return p1:FindFirstChild(p2)
end
function t.GetTitleFromName(p1) --[[ GetTitleFromName | Line: 139 | Upvalues: v5 (copy) ]]
	for k, v in pairs(v5) do
		if v.Title == p1 then
			return v, k
		end
	end
end
function t.GetTitleFromOldName(p1) --[[ GetTitleFromOldName | Line: 148 | Upvalues: v5 (copy) ]]
	for k, v in pairs(v5) do
		if v.OldTitle == p1 then
			return v, k
		end
	end
end
function t.GetTitleFromIndex(p1) --[[ GetTitleFromIndex | Line: 157 | Upvalues: v5 (copy) ]]
	return v5[p1]
end
function t.GetChatMessageColor(p1) --[[ GetChatMessageColor | Line: 161 | Upvalues: TextColor (copy), t (copy) ]]
	local v1 = p1:FindFirstChild("Data") and p1.Data:FindFirstChild("Titles")
	if not v1 then
		return TextColor
	end
	if t.DoesPlayerOwnTitle(v1, "VIP") then
		return Color3.fromRGB(255, 232, 139)
	end
	local CurrentTitle = v1.Parent.CurrentTitle.Value
	if CurrentTitle == "Moderator" or CurrentTitle == "Admin" then
		return Color3.fromRGB(170, 85, 255)
	else
		return TextColor
	end
end
t.TitlesByName = {}
return t