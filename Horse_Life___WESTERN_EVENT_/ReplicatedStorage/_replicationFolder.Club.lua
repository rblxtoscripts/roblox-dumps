-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StableClubsService", {
	Deferred = true
})
local v2 = Sonar("Maid")
local v3 = Sonar("Binder")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("EventUtils")
local v6 = Sonar("Signal")
local v7 = Sonar("Table")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("StableClubsManager", {
	Deferred = true,
	Context = "Server"
})
local v10 = Sonar("NotificationsClient", "Client")
local IsClient = Sonar("Constants").IsClient
local v11 = v8.GetRemoteFunction("GetActivityFeed")
local v12 = v8.GetRemoteEvent("ReplicateClubInvite")
local t2 = {}
local v13 = v6.new()
local v14 = v6.new()
function t._memberAdded(p1, p2) --[[ _memberAdded | Line: 35 | Upvalues: v2 (copy), v6 (copy) ]]
	local v1 = v2.new()
	local Role = p2:WaitForChild("Role")
	local JoinedAt = p2:WaitForChild("JoinedAt")
	local ContributedPoints = p2:WaitForChild("ContributedPoints")
	local Contribution = p2:WaitForChild("Contribution")
	local Seed = Contribution:WaitForChild("Seed")
	local Points = Contribution:WaitForChild("Points")
	local v3 = tonumber(p2.Name)
	local function updateMemberData() --[[ updateMemberData | Line: 45 | Upvalues: p1 (copy), v3 (copy), Role (copy), JoinedAt (copy), ContributedPoints (copy), Seed (copy), Points (copy), v1 (copy), v6 (ref) ]]
		local v12 = p1.Members[v3] or {
			Role = Role.Value,
			JoinedAt = JoinedAt.Value,
			ContributedPoints = ContributedPoints.Value,
			Contribution = {
				Seed = Seed.Value,
				Points = Points.Value
			},
			MemberUpdated = v1:GiveTask(v6.new())
		}
		v12.Role = Role.Value
		v12.JoinedAt = JoinedAt.Value
		v12.ContributedPoints = ContributedPoints.Value
		v12.Contribution = {
			Seed = Seed.Value,
			Points = Points.Value
		}
		p1.Members[v3] = v12
		p1.MemberUpdated:Fire(v3, v12)
		v12.MemberUpdated:Fire(v12)
	end
	v1:GiveTask(Role:GetPropertyChangedSignal("Value"):Connect(updateMemberData))
	v1:GiveTask(JoinedAt:GetPropertyChangedSignal("Value"):Connect(updateMemberData))
	v1:GiveTask(ContributedPoints:GetPropertyChangedSignal("Value"):Connect(updateMemberData))
	v1:GiveTask(Seed:GetPropertyChangedSignal("Value"):Connect(updateMemberData))
	v1:GiveTask(Points:GetPropertyChangedSignal("Value"):Connect(updateMemberData))
	updateMemberData()
	p1.MemberAdded:Fire(v3, p1.Members[v3])
	return {
		Destroy = function() --[[ Destroy | Line: 79 | Upvalues: p1 (copy), v3 (copy), v1 (copy) ]]
			p1.Members[v3].MemberUpdated:Fire(nil)
			p1.Members[v3] = nil
			p1.MemberRemoved:Fire(v3)
			v1:Destroy()
		end
	}
end
function t.new(p1) --[[ new | Line: 88 | Upvalues: t (copy), v2 (copy), v6 (copy), v5 (copy), v13 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Instance = p1
	v22.Maid = v2.new()
	v22.ClubId = p1.Name
	v22.Members = {}
	v22.MemberUpdated = v6.new()
	v22.MemberAdded = v6.new()
	v22.MemberRemoved = v6.new()
	v22.LocalPlayerInvitedUpdated = v6.new()
	v22.JoinRequests = {}
	v22.SentInvites = {}
	v5.lightweightBinder(p1:WaitForChild("Members"), function(p1) --[[ Line: 105 | Upvalues: v22 (copy) ]]
		return v22:_memberAdded(p1)
	end, v22.Maid)
	v13:Fire(v22)
	t2[v22.ClubId] = v22
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 117 | Upvalues: v14 (copy), t2 (copy), v4 (copy) ]]
	v14:Fire(p1)
	t2[p1.ClubId] = nil
	v4(p1)
	p1.MemberUpdated:Destroy()
	p1.MemberAdded:Destroy()
	p1.MemberRemoved:Destroy()
	p1.LocalPlayerInvitedUpdated:Destroy()
end
function t.GetMemberData(p1, p2) --[[ GetMemberData | Line: 135 ]]
	return p1.Members[p2]
end
function t.IsInClub(p1, p2) --[[ IsInClub | Line: 140 ]]
	return p1.Members[p2] ~= nil
end
function t.BindToMembers(p1, p2, p3, p4) --[[ BindToMembers | Line: 145 ]]
	local t = {}
	if p2 then
		table.insert(t, p1.MemberAdded:Connect(p2))
		for v1, v2 in p1.Members do
			p2(v1, v2)
		end
	end
	if p3 then
		table.insert(t, p1.MemberRemoved:Connect(p3))
	end
	if not p4 then
		return
	end
	for v3, v4 in t do
		p4:GiveTask(v4)
	end
end
function t.GetProperty(p1, p2) --[[ GetProperty | Line: 167 ]]
	if p2 == "Points" then
		return p1.Instance:WaitForChild("Milestones"):WaitForChild("Points").Value
	else
		return p1.Instance:WaitForChild(p2).Value
	end
end
function t.GetPropertyChangedSignal(p1, p2) --[[ GetPropertyChangedSignal | Line: 176 ]]
	if p2 == "Points" then
		return p1.Instance:WaitForChild("Milestones"):WaitForChild("Points"):GetPropertyChangedSignal("Value")
	else
		return p1.Instance:WaitForChild(p2):GetPropertyChangedSignal("Value")
	end
end
function t.BindToProperty(p1, p2, p3) --[[ BindToProperty | Line: 186 | Upvalues: v5 (copy) ]]
	if p2 == "Points" then
		return v5.bindToProperty(p1.Instance:WaitForChild("Milestones"):WaitForChild("Points"), "Value", p3)
	else
		return v5.bindToProperty(p1.Instance:WaitForChild(p2), "Value", p3)
	end
end
function t.GetCapacity(p1) --[[ GetCapacity | Line: 195 | Upvalues: v7 (copy) ]]
	local Capacity = p1.Instance:WaitForChild("Capacity")
	return Capacity.Value, v7.Count(p1.Members)
end
function t.GetOwner(p1) --[[ GetOwner | Line: 203 | Upvalues: Players (copy) ]]
	for v1, v2 in p1.Members do
		if v2.Role == "Leader" then
			return v1, Players:GetPlayerByUserId(v1)
		end
	end
	return nil, nil
end
function t.IsOwner(p1, p2) --[[ IsOwner | Line: 214 ]]
	return p2 == p1:GetOwner()
end
function t.GetActivityFeed(p1) --[[ GetActivityFeed | Line: 219 | Upvalues: IsClient (copy), v11 (copy) ]]
	if IsClient then
		return v11:InvokeServer(p1.ClubId)
	end
end
function t.CanRequestJoin(p1, p2) --[[ CanRequestJoin | Line: 226 | Upvalues: v1 (copy) ]]
	if v1.HasClub(p2) then
		return "AlreadyHasClub"
	end
	if p1:IsInClub(p2.Player.UserId) then
		return "AlreadyInClub"
	end
	local v12, v2 = p1:GetCapacity()
	if v12 <= v2 then
		return "ClubIsFull"
	end
	if p1:GetProperty("Privacy") == "Invite Only" then
		return "InviteOnly"
	else
		return true
	end
end
function t.IsInviteOnly(p1) --[[ IsInviteOnly | Line: 249 ]]
	return p1:GetProperty("Privacy") == "Invite Only"
end
function t.AddJoinRequest(p1, p2) --[[ AddJoinRequest | Line: 254 ]]
	local v1 = p1:CanRequestJoin(p2)
	if v1 == true then
		p1.JoinRequests[p2.Player.UserId] = {}
		return true
	else
		return v1
	end
end
function t.RemoveJoinRequest(p1, p2) --[[ RemoveJoinRequest | Line: 266 ]]
	p1.JoinRequests[p2.Player.UserId] = nil
end
function t.SetLocalPlayerInvited(p1, p2) --[[ SetLocalPlayerInvited | Line: 271 ]]
	p1.LocalPlayerInvited = p2
	p1.LocalPlayerInvitedUpdated:Fire(p2)
end
function t.AcceptJoinRequest(p1, p2) --[[ AcceptJoinRequest | Line: 277 | Upvalues: v1 (copy), v9 (copy) ]]
	if not p1.JoinRequests[p2.Player.UserId] then
		return "NoJoinRequest"
	end
	if v1.HasClub(p2) then
		return "TheyAlreadyHaveClub"
	end
	if v9.JoinClub(p2, p1.ClubId) then
		p1:RemoveJoinRequest(p2)
		return true
	else
		return "AnErrorOccurred"
	end
end
function t.DeclineJoinRequest(p1, p2) --[[ DeclineJoinRequest | Line: 298 ]]
	if p1.JoinRequests[p2.Player.UserId] then
		p1:RemoveJoinRequest(p2)
		return true
	else
		return "NoJoinRequest"
	end
end
function t.CanSendInviteTo(p1, p2) --[[ CanSendInviteTo | Line: 309 | Upvalues: v1 (copy) ]]
	if v1.HasClub(p2) then
		return "TheyAlreadyHaveClub"
	end
	if p1:IsInClub(p2.Player.UserId) then
		return "AlreadyInClub"
	end
	local v12, v2 = p1:GetCapacity()
	if v12 <= v2 then
		return "ClubIsFull"
	else
		return true
	end
end
function t.SendInvite(p1, p2, p3) --[[ SendInvite | Line: 327 | Upvalues: v12 (copy) ]]
	if not p1:MemberHasPermission(p2, "CanInvitePlayers") then
		return "NoPermission"
	end
	local v1 = p1:CanSendInviteTo(p3)
	if v1 == true then
		p1.SentInvites[p3.Player.UserId] = {
			Inviter = p2.Player.UserId
		}
		v12:FireClient(p3.Player, p1.ClubId, true)
		return true
	else
		return v1
	end
end
function t.RemoveInvite(p1, p2) --[[ RemoveInvite | Line: 347 | Upvalues: v12 (copy) ]]
	p1.SentInvites[p2.Player.UserId] = nil
	v12:FireClient(p2.Player, p1.ClubId, false)
end
function t.AcceptInvite(p1, p2) --[[ AcceptInvite | Line: 353 | Upvalues: v1 (copy), v9 (copy) ]]
	if not p1.SentInvites[p2.Player.UserId] then
		return "NoInvite"
	end
	if v1.HasClub(p2) then
		return "AlreadyHasClub"
	end
	if p1:IsInClub(p2.Player.UserId) then
		return "AlreadyInClub"
	end
	local v12, v2 = p1:GetCapacity()
	if v12 <= v2 then
		return "ClubIsFull"
	end
	local v3 = v9.JoinClub(p2, p1.ClubId)
	if not v3 then
		return v3 or "AnErrorOccurred"
	end
	p1:RemoveInvite(p2)
	return v3 or "AnErrorOccurred"
end
function t.CanLeave(p1, p2) --[[ CanLeave | Line: 382 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetMemberData(p2.Player.UserId)
	if not v12 then
		return false
	end
	return v12.Role ~= v1.HIGHEST_ROLE.Name
end
function t.CanDelete(p1, p2) --[[ CanDelete | Line: 392 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetMemberData(p2.Player.UserId)
	if not v12 then
		return false
	end
	return v12.Role == v1.HIGHEST_ROLE.Name
end
function t.CanTransfer(p1, p2, p3) --[[ CanTransfer | Line: 402 ]]
	if p2.Player.UserId == p3 then
		return false
	else
		return p1:IsOwner(p2.Player.UserId) and p1:IsInClub(p3)
	end
end
function t.CanChangeRank(p1, p2, p3, p4) --[[ CanChangeRank | Line: 414 | Upvalues: v1 (copy) ]]
	if p2.Player.UserId == p3 then
		return false
	end
	local v12 = p1:GetMemberData(p2.Player.UserId)
	local v2 = p1:GetMemberData(p3)
	if not (v12 and v2) then
		return false
	end
	if not p1:MemberHasPermission(p2, "CanChangeRole") then
		return false
	end
	local v4 = v1.ConvertRole(v2.Role, if p4 then 1 else -1)
	if not v4 then
		return false
	end
	return v1.GetAllRoles()[v12.Role].RoleId > v4.RoleId
end
function t.CanKick(p1, p2, p3) --[[ CanKick | Line: 440 | Upvalues: v1 (copy) ]]
	if p2.Player.UserId == p3 then
		return false
	end
	local v12 = p1:GetMemberData(p2.Player.UserId)
	local v2 = p1:GetMemberData(p3)
	if not (v12 and v2) then
		return false
	end
	if not p1:MemberHasPermission(p2, "CanKick") then
		return false
	end
	local v3 = v1.GetAllRoles()[v12.Role]
	return v3.RoleId > v1.GetAllRoles()[v2.Role].RoleId
end
function t.MemberHasPermission(p1, p2, p3) --[[ MemberHasPermission | Line: 463 | Upvalues: v1 (copy) ]]
	if not p1:IsInClub(p2.Player.UserId) then
		return false
	end
	local v12 = p1:GetMemberData(p2.Player.UserId)
	if v12 then
		return v1.GetAllRoles()[v12.Role][p3]
	else
		return false
	end
end
function t.CanUpdate(p1, p2, p3) --[[ CanUpdate | Line: 478 | Upvalues: v1 (copy) ]]
	if p3 then
		local v12 = v1.ValidateClubData(p2, p3, {
			Name = p1:GetProperty("Name")
		})
		if v12 ~= true then
			return v12
		end
	end
	if p1:MemberHasPermission(p2, "CanEditInfo") then
		return true
	else
		return "NoPermission"
	end
end
function t.HasItem(p1, p2, p3) --[[ HasItem | Line: 494 | Upvalues: v1 (copy) ]]
	if v1.GetAll()[p2][p3].Free then
		return true
	end
	return p1.Instance:WaitForChild(p2):FindFirstChild(p3) ~= nil
end
function t.GetItemAddedSignal(p1, p2, p3) --[[ GetItemAddedSignal | Line: 504 ]]
	return p1.Instance:WaitForChild(p2).ChildAdded
end
function t.GetCurrentTier(p1) --[[ GetCurrentTier | Line: 509 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetProperty("Points")
	return v1.GetTierInfo(v12, (p1:GetProperty("Capacity")))
end
function t.ScaleGoalForCapacity(p1, p2) --[[ ScaleGoalForCapacity | Line: 516 | Upvalues: v1 (copy) ]]
	return v1.ScaleGoalAmount(p2, (p1:GetProperty("Capacity")))
end
function t.ScaleRewardForCapacity(p1, p2) --[[ ScaleRewardForCapacity | Line: 522 | Upvalues: v1 (copy) ]]
	return v1.ScaleRewardAmount(p2, (p1:GetProperty("Capacity")))
end
function t.GetCapacityTier(p1) --[[ GetCapacityTier | Line: 529 | Upvalues: v1 (copy) ]]
	return v1.GetCapacityTier((p1:GetProperty("Capacity")))
end
function t.GetAll() --[[ GetAll | Line: 535 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetById(p1) --[[ GetById | Line: 540 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.InitClient(p1) --[[ InitClient | Line: 545 | Upvalues: v12 (copy), t (copy), v10 (copy) ]]
	v12.OnClientEvent:Connect(function(p1, p2) --[[ Line: 546 | Upvalues: t (ref), v10 (ref) ]]
		local v1 = t.GetById(p1)
		if not v1 then
			return
		end
		if p2 then
			v10.Notify({
				Preset = "Green",
				Message = ("You have been invited to %*!"):format((v1:GetProperty("Name")))
			})
		end
		v1:SetLocalPlayerInvited(p2)
	end)
end
function t.Init(p1) --[[ Init | Line: 563 | Upvalues: v3 (copy), t (copy), IsClient (copy) ]]
	v3.new("Club", t):Init()
	if not IsClient then
		return
	end
	t:InitClient()
end
t.ClubAdded = v13
t.ClubRemoved = v14
t:Init()
return t