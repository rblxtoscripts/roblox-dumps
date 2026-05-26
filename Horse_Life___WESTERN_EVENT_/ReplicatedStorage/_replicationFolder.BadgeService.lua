-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local BadgeService = game:GetService("BadgeService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar(Sonar("StorageUtils").Get("Badges"))
local v2 = game:GetService("RunService"):IsStudio()
local Badges
if game:GetService("RunService"):IsServer() then
	Badges = Instance.new("Folder")
	Badges.Name = "Badges"
	local function createBadge(p1) --[[ createBadge | Line: 24 | Upvalues: Badges (ref) ]]
		local v1 = Instance.new("BoolValue")
		v1.Name = p1
		v1.Parent = Badges
	end
	for k, v in pairs(v1) do
		local v3 = Instance.new("BoolValue")
		v3.Name = k
		v3.Parent = Badges
	end
else
	Badges = nil
end
function t.GetOwnedBadges(p1) --[[ GetOwnedBadges | Line: 35 | Upvalues: Badges (ref), v1 (copy), t (copy) ]]
	local v12 = Badges:Clone()
	for k, v in pairs(v1) do
		v12[k].Value = t.DoesPlayerOwnBadge(p1, v.BadgeId)
	end
	v12.Parent = p1
	return v12
end
function t.GetBadgeFromId(p1, p2) --[[ GetBadgeFromId | Line: 44 | Upvalues: v1 (copy), t (copy) ]]
	for k, v in pairs(v1) do
		if v.BadgeId == p2 then
			return t.GetBadgeValueFromName(p1, k)
		end
	end
end
function t.GetBadgeValueFromName(p1, p2) --[[ GetBadgeValueFromName | Line: 52 ]]
	local Badges = p1:FindFirstChild("Badges")
	if Badges then
		return Badges:FindFirstChild(p2)
	end
end
function t.PlayerOwnsBadge(p1, p2) --[[ PlayerOwnsBadge | Line: 59 | Upvalues: t (copy) ]]
	local v1 = t.GetBadgeValueFromName(p1, p2)
	return if v1 then v1.Value else v1
end
function t.GiveBadgeToPlayer(p1, p2, p3) --[[ GiveBadgeToPlayer | Line: 65 | Upvalues: v2 (copy), BadgeService (copy), t (copy) ]]
	task.spawn(function() --[[ Line: 66 | Upvalues: v2 (ref), p1 (copy), p2 (copy), BadgeService (ref), t (ref), p3 (copy) ]]
		local count = 0
		local v1 = nil
		repeat
			if v2 then
				print("Badge Service - Giving badge in studio", p1, p2)
				v1 = true
			elseif p2 > 0 then
				local v22 = pcall(BadgeService.AwardBadge, BadgeService, p1.UserId, p2)
				if not v22 then
					wait()
				end
				v1 = v22
			end
			count = count + 1
		until v1 or count >= 3
		if not v1 then
			return
		end
		local v4 = t.GetBadgeFromId(p1, (tonumber(p2)))
		if v4 then
			v4.Value = true
		end
		if not p3 then
			return
		end
		p3()
	end)
end
function t.DoesPlayerOwnBadge(p1, p2) --[[ DoesPlayerOwnBadge | Line: 96 | Upvalues: BadgeService (copy) ]]
	local v1, v2 = pcall(BadgeService.UserHasBadgeAsync, BadgeService, p1.UserId, p2)
	return v1 and v2
end
return t