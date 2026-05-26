-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("PlaceTypeService")
local v4 = game:GetService("RunService"):IsStudio()
local v5 = game:GetService("RunService"):IsServer()
local v6 = v3.IsTestGame()
local v7 = v2.GetConfig("GamePermissions")()
local DeveloperHasAllPermissions = v7.DeveloperHasAllPermissions
local AdminGroups = v7.AdminGroups
local Permissions
if v5 then
	Permissions = Instance.new("Configuration")
	Permissions.Name = "Permissions"
else
	Permissions = nil
end
local function getGroupRank(p1, p2, p3) --[[ getGroupRank | Line: 58 ]]
	local v1, v2 = pcall(p1[p3], p1, p2)
	return v1 and v2
end
local function getPriorityOfGroup(p1) --[[ getPriorityOfGroup | Line: 66 | Upvalues: AdminGroups (copy) ]]
	for v1, v2 in AdminGroups do
		if v1 == p1 then
			return v2.Priority
		end
	end
	return -1
end
local function checkGroupPermissions(p1, p2) --[[ checkGroupPermissions | Line: 75 | Upvalues: AdminGroups (copy) ]]
	if not p1 or p1 == nil then
		return false, "You are not authorized to run this command"
	end
	if type(p2) == "table" and next(p2) then
		for v1, v2 in p2 do
			if p1.Name == v2 then
				return true
			end
		end
	else
		local v3
		do
			local __inline_returned = false
			for v4, v5 in AdminGroups do
				if v4 == p2 then
					v3 = v5.Priority
					__inline_returned = true
					break
				end
			end
			if not __inline_returned then
				v3 = -1
			end
		end
		if v3 <= p1.Priority then
			return true
		end
	end
	return false, "You are not authorized to run this command"
end
function t.CanRunCommand(p1, p2, p3) --[[ CanRunCommand | Line: 104 | Upvalues: v4 (copy), v6 (copy), t (copy), checkGroupPermissions (copy) ]]
	if not v4 then
		if p2.LiveServersOnly and v6 then
			return false, "This command can only be used in Live servers"
		end
		if p2.TestServersOnly and not v6 then
			return false, "This command can only be used in Test servers"
		end
	end
	local v1 = t.GetAdminGroup(p1)
	if not v1 and p3 then
		return false, "You are not authorized to run this command"
	end
	if v1 and v1.CanRunAllCommands then
		return true
	end
	local v2, v3 = checkGroupPermissions(v1, p2.Group)
	if v2 == true then
		return true
	end
	if v6 and p2.TestServerGroup then
		local v42, v5 = checkGroupPermissions(v1, p2.TestServerGroup)
		if v42 == true then
			return true
		end
		v2 = v42
		v3 = v5
	end
	return v2, v3
end
function t.GetAdminGroup(p1) --[[ GetAdminGroup | Line: 147 | Upvalues: v4 (copy), AdminGroups (copy), v6 (copy), t (copy) ]]
	if v4 then
		return AdminGroups.DeveloperAdmin
	end
	local v1 = -1
	local v2 = nil
	for v3, v42 in AdminGroups do
		if not v42.TestServersOnly or v6 then
			local v5 = false
			for v62, v7 in v42.RequiredPermissions do
				if t.HasPermission(p1, v7) then
					v5 = true
					break
				end
			end
			local v8 = false
			local v9 = false
			if v42.WhitelistedUserIds then
				for v11, v12 in v6 and { v42.WhitelistedUserIds.Test, v42.WhitelistedUserIds.Live } or { v42.WhitelistedUserIds.Live } do
					if v12 and table.find(v12, p1.UserId) then
						v8 = true
						break
					end
				end
				if v42.WhitelistedUserIds.Live then
					v9 = if table.find(v42.WhitelistedUserIds.Live, p1.UserId) == nil then false else true
				end
			end
			if (v6 or (not v42.RequireLiveWhitelist or v9)) and ((v5 or v8) and v1 < v42.Priority) then
				v1 = v42.Priority
				v2 = v42
			end
		end
	end
	return v2
end
function t.HasPermission(p1, p2) --[[ HasPermission | Line: 209 ]]
	local Permissions = p1:FindFirstChild("Permissions")
	if Permissions then
		return Permissions:GetAttribute(p2)
	end
end
function t.GetPermissionChangedSignal(p1, p2) --[[ GetPermissionChangedSignal | Line: 216 ]]
	local Permissions = p1:FindFirstChild("Permissions")
	if Permissions then
		return Permissions:GetAttributeChangedSignal(p2)
	end
end
function t.Init(p1) --[[ Init | Line: 222 | Upvalues: AdminGroups (copy), v5 (copy), v1 (copy), Permissions (ref), v7 (copy), DeveloperHasAllPermissions (copy) ]]
	for v12, v2 in AdminGroups do
		v2.Name = v12
	end
	if not v5 then
		return
	end
	v1.bindToPlayers({
		OnInit = function(p1) --[[ OnInit | Line: 229 | Upvalues: Permissions (ref), v7 (ref), DeveloperHasAllPermissions (ref) ]]
			local v1 = Permissions:Clone()
			for v2, v3 in v7.Permissions do
				for v5, v6 in v3.Groups and v3.Groups or { v3 } do
					local v8, v9 = pcall(p1[if type(v6.Rank) == "string" then "GetRoleInGroup" else "GetRankInGroup"], p1, v6.GroupId)
					local v10 = v8 and v9
					if v10 and (v6.Check and v6.Check(v10, p1) or v6.Rank == v10) then
						v1:SetAttribute(v3.Name, true)
						break
					end
				end
			end
			if DeveloperHasAllPermissions and v1:GetAttribute("Developer") then
				for v11, v12 in v7.Permissions do
					v1:SetAttribute(v12.Name, true)
				end
			end
			v1.Parent = p1
		end
	})
end
t:Init()
return t