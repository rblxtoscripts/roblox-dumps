-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("BadgeService")
local v5 = Sonar("DataUtils")
local v6 = Sonar("StorageUtils")
local v7 = game:GetService("RunService"):IsServer()
local tbl = {
	{
		Name = "Developer",
		Groups = {
			{
				GroupId = 34961104,
				Check = function(p1, p2) --[[ Check | Line: 24 ]]
					return p1 == 235
				end
			}
		}
	},
	ContributingDeveloper = {
		Name = "ContributingDeveloper",
		Groups = {
			{
				GroupId = 34961104,
				Check = function(p1, p2) --[[ Check | Line: 36 ]]
					return p1 == 110
				end
			}
		}
	},
	{
		Name = "Admin",
		GroupId = 34961104,
		Check = function(p1, p2) --[[ Check | Line: 46 ]]
			return p1 >= 231
		end
	},
	{
		Name = "Admin",
		GroupId = 34961104,
		Check = function(p1, p2) --[[ Check | Line: 54 ]]
			return p1 >= 231
		end
	},
	{
		Name = "Staff",
		GroupId = 34961104,
		Check = function(p1, p2) --[[ Check | Line: 61 ]]
			return p1 >= 230
		end
	},
	{
		Name = "ContentCreator",
		GroupId = 2919215,
		Check = function(p1, p2) --[[ Check | Line: 68 ]]
			return p1 == 3
		end
	},
	{
		Name = "Tester",
		GroupId = 34961104,
		Check = function(p1, p2) --[[ Check | Line: 75 ]]
			return if p1 == 99 then true else p1 == 100
		end
	},
	{
		Name = "SonarTester",
		GroupId = 2919215,
		Check = function(p1, p2) --[[ Check | Line: 82 ]]
			return p1 == 2
		end
	},
	{
		Name = "Contributor",
		GroupId = 34961104,
		Check = function(p1, p2) --[[ Check | Line: 89 ]]
			return p1 == 25
		end
	},
	{
		Name = "Moderator",
		GroupId = 34961104,
		Check = function(p1, p2) --[[ Check | Line: 96 ]]
			return if p1 == 230 then true else p1 == 231
		end
	}
}
local t2 = {}
local v8 = Sonar(v6.Get("StipendSets"))
local v9 = Sonar(v6.Get("Badges"))
local Permissions
if v7 then
	Permissions = Instance.new("Folder")
	Permissions.Name = "Permissions"
	local function createPermission(p1) --[[ createPermission | Line: 128 | Upvalues: Permissions (ref) ]]
		local v1 = Instance.new("BoolValue")
		v1.Name = p1
		v1.Parent = Permissions
	end
	for k, v in pairs(tbl) do
		local v11 = Instance.new("BoolValue")
		v11.Name = v.Name
		v11.Parent = Permissions
	end
	for k, v in pairs(v8) do
		local v12 = Instance.new("IntValue")
		v12.Name = k
		v12.Parent = v5.DataTemplate.PermissionStipend
	end
else
	Permissions = nil
end
local function getGroup(p1, p2, p3) --[[ getGroup | Line: 146 ]]
	local v1, v2 = pcall(p1[p3], p1, p2)
	return v1 and v2
end
function t.GetPermissions(p1) --[[ GetPermissions | Line: 152 | Upvalues: Permissions (ref), tbl (copy), t2 (copy) ]]
	local v1 = Permissions:Clone()
	local tbl2 = {}
	for k, v in pairs(tbl) do
		for v3, v4 in v.Groups and v.Groups or { v } do
			local v6, v7 = pcall(p1[if type(v4.Rank) == "string" then "GetRoleInGroup" else "GetRankInGroup"], p1, v4.GroupId)
			local v8 = v6 and v7
			if v8 and (v4.Check and v4.Check(v8, p1) or v4.Rank == v8) then
				tbl2[v.Name] = true
				v1[v.Name].Value = true
				break
			end
			if tbl2.Developer then
				tbl2[v.Name] = true
				v1[v.Name].Value = true
				break
			end
		end
	end
	v1.Parent = p1
	local v9 = 0
	local v10 = nil
	for k, v in pairs(tbl2) do
		local v11 = t2[k]
		if v11 and (v11.Priority and v9 < v11.Priority) then
			v9 = v11.Priority
			v10 = v11
		end
	end
	return tbl2, v10
end
function t.GetStipendSets() --[[ GetStipendSets | Line: 187 | Upvalues: v8 (copy) ]]
	return v8
end
function t.GetStipendByName(p1) --[[ GetStipendByName | Line: 191 | Upvalues: v8 (copy) ]]
	return v8[p1]
end
function t.CanClaimStipend(p1, p2) --[[ CanClaimStipend | Line: 195 | Upvalues: t (copy), v9 (copy), v4 (copy), v3 (copy) ]]
	local v1 = t.GetStipendByName(p2)
	if not v1 then
		return
	end
	if v9[p2] then
		if not v4.PlayerOwnsBadge(p1.Player, p2) then
			return "NoPermission"
		end
	elseif not p1:HasPermission(p2) then
		return "NoPermission"
	end
	local v2 = p1.PlayerData.PermissionStipend[p2]
	if v3.Get() - v2.Value < 2592000 then
		return "ClaimTooEarly"
	else
		return true, v1, v2
	end
end
function t.ClaimStipend(p1, ...) --[[ ClaimStipend | Line: 217 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("GetPermissionStipendRemote"):InvokeServer(...)
end
function t.Init(p1) --[[ Init | Line: 221 | Upvalues: t (copy), v7 (copy), v2 (copy), v1 (copy), v3 (copy) ]]
	t.TimeToGiveStipend = 2592000
	if not v7 then
		return
	end
	v2.GetRemoteFunction("GetPermissionStipendRemote").OnServerInvoke = function(p1, p2) --[[ Line: 225 | Upvalues: v1 (ref), t (ref), v3 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		local v2, v32, v4 = t.CanClaimStipend(v12, p2)
		if v2 ~= true then
			return
		end
		v4.Value = v3.Get()
		for k, v in pairs({ v32.Items, v32.ExtraItems, v32.Horses }) do
			for k2, v5 in pairs(v) do
				local v52 = if typeof(v5) == "table" then true else false
				local t2 = {
					IgnoreLimit = true,
					Name = k2,
					Amount = if v52 then v5.Amount or 1 elseif v5 then v5 else 1,
					Theme = if v52 then v5.Theme else v52,
					ThemeChance = if v52 then v5.ThemeChance else v52,
					Source = p2 .. "Stipend"
				}
				t2.ItemStream = if k2 == "Coins" then true else false
				v12:GiveItem(t2)
			end
		end
		return true
	end
end
t:Init()
return t