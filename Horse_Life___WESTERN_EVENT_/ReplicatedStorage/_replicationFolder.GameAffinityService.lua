-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ExperienceNotificationService = game:GetService("ExperienceNotificationService")
local AvatarEditorService = game:GetService("AvatarEditorService")
local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("Signal")
local v5 = Sonar("DataUpdateService", {
	Context = "Server"
})
local v6 = Sonar("InstanceUtils")
local v7 = Sonar("NotificationsService")
local v8 = game:GetService("RunService"):IsServer()
local v9 = v3.GetConfig("GameAffinity")()
local StatusFlags = v9.StatusFlags
local StatusGroups = v9.StatusGroups
local t2 = {
	JoinedGroup = "PromptGroupJoin",
	FavouritedGame = "PromptFavouriteGame",
	ExperienceNotifications = "PromptExperienceNotifications",
	InCommunityServer = "PromptCommunityServer",
	Premium = "PromptPremium"
}
local v10 = v4.new()
local v11 = v4.new()
local v12 = false
function t.GetStatusFlagFromName(p1) --[[ GetStatusFlagFromName | Line: 195 | Upvalues: StatusFlags (copy) ]]
	return StatusFlags[p1]
end
function t.PromptStatus(p1, p2) --[[ PromptStatus | Line: 203 | Upvalues: v12 (ref), StatusGroups (copy), t (copy), Players (copy), t2 (copy), v9 (copy), v7 (copy) ]]
	if v12 then
		return
	end
	v12 = true
	local v2 = false
	for i, v in ipairs(StatusGroups[p1] or { p1 }) do
		local v3 = nil
		local v4 = t.GetAffinityPromptResultSignal(Players.LocalPlayer, v):Connect(function(p1) --[[ Line: 218 | Upvalues: v3 (ref) ]]
			if p1 ~= nil then
				v3 = p1
			end
		end)
		if t[t2[v]]() then
			while v3 == nil do
				task.wait(0.1)
			end
		else
			v2 = true
		end
		v4:Disconnect()
	end
	local v5 = t.RequestUpdatedAffinityStatus(p1)
	if p2 ~= false then
		v7.Notify(v5 and v9.Notifications.Success or v9.Notifications.Failed)
	end
	v12 = false
	return not v2, v5
end
function t.PromptSetFavorite() --[[ PromptSetFavorite | Line: 253 | Upvalues: AvatarEditorService (copy), v9 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 254 | Upvalues: AvatarEditorService (ref), v9 (ref) ]]
		return AvatarEditorService:PromptSetFavorite(v9.PlaceId, Enum.AvatarItemType.Asset, true)
	end)
	if v1 then
		return v1
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to prompt set favorite: ", v2)
		return false
	end
end
function t.PromptAllowInventoryReadAccess() --[[ PromptAllowInventoryReadAccess | Line: 266 | Upvalues: AvatarEditorService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 267 | Upvalues: AvatarEditorService (ref) ]]
		return AvatarEditorService:PromptAllowInventoryReadAccess()
	end)
	if v1 then
		return v1
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to prompt allow inventory read access: ", v2)
		return false
	end
end
function t.PromptFavouriteGame() --[[ PromptFavouriteGame | Line: 279 | Upvalues: t (copy) ]]
	return t.PromptAllowInventoryReadAccess()
end
function t.CanPromptExperienceNotifications() --[[ CanPromptExperienceNotifications | Line: 286 | Upvalues: ExperienceNotificationService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 287 | Upvalues: ExperienceNotificationService (ref) ]]
		return ExperienceNotificationService:CanPromptOptInAsync()
	end)
	if v1 then
		return v1 and v2
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to check if can prompt experience notifications: ", v2)
		return false
	end
end
function t.PromptExperienceNotifications() --[[ PromptExperienceNotifications | Line: 299 | Upvalues: ExperienceNotificationService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 300 | Upvalues: ExperienceNotificationService (ref) ]]
		return ExperienceNotificationService:PromptOptIn()
	end)
	if v1 then
		return v1
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to prompt experience notifications: ", v2)
		return false
	end
end
function t.PromptGroupJoin() --[[ PromptGroupJoin | Line: 312 | Upvalues: GroupService (copy), v9 (copy), v10 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 313 | Upvalues: GroupService (ref), v9 (ref) ]]
		return GroupService:PromptJoinAsync(v9.GroupId)
	end)
	v10:Fire(v2)
	if v1 then
		return v1
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to prompt group join: ", v2)
		return false
	end
end
function t.PromptCommunityServer() --[[ PromptCommunityServer | Line: 326 | Upvalues: t (copy), v11 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 327 | Upvalues: t (ref) ]]
		return t.RequestToUpdateAffinityStatus("InCommunityServer", true)
	end)
	v11:Fire(v2)
	if v1 then
		return v1
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to prompt community server: ", v2)
		return false
	end
end
function t.PromptPremium() --[[ PromptPremium | Line: 340 | Upvalues: MarketplaceService (copy), Players (copy), v11 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 341 | Upvalues: MarketplaceService (ref), Players (ref) ]]
		return MarketplaceService:PromptPremiumPurchase(Players.LocalPlayer)
	end)
	v11:Fire(v2)
	if v1 then
		return v1
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to prompt premium: ", v2)
		return false
	end
end
function t.CheckAllowedExternalLinkReferencesAsync(p1, p2) --[[ CheckAllowedExternalLinkReferencesAsync | Line: 356 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:CheckAllowedExternalLinkReferencesAsync(p2)
	else
		return false
	end
end
function t.RequestToUpdateAffinityStatus(p1, p2) --[[ RequestToUpdateAffinityStatus | Line: 368 | Upvalues: v1 (copy) ]]
	local v12, v2 = pcall(function() --[[ Line: 369 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		return v1.GetRemoteFunction("UpdateAffinityStatusRemote"):InvokeServer(p1, p2)
	end)
	if v12 then
		return v12 and v2
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to request to update affinity status: ", v2)
		return false, v2
	end
end
function t.RequestUpdatedAffinityStatus(p1) --[[ RequestUpdatedAffinityStatus | Line: 382 | Upvalues: v1 (copy) ]]
	local v12, v2 = pcall(function() --[[ Line: 383 | Upvalues: v1 (ref), p1 (copy) ]]
		return v1.GetRemoteFunction("GetUpdatedAffinityStatusRemote"):InvokeServer(p1)
	end)
	if v12 then
		return v12 and v2
	else
		warn("\226\154\160\239\184\143 GameAffinityService, Failed to request updated affinity status: ", v2)
		return false, v2
	end
end
function t.UpdateAffinityStatus(p1, p2, p3) --[[ UpdateAffinityStatus | Line: 398 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return
	end
	if v1:_canUpdateAffinityStatus(p2) then
		return v1:_updateAffinityStatus(p2, p3 or false, true)
	end
end
function t.OnAffinityStatusInitialised(p1, p2, p3) --[[ OnAffinityStatusInitialised | Line: 419 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		v1:OnAffinityStatusInitialised(p2, p3)
	end
end
function t.IsAffinityStatusAllowed(p1, p2) --[[ IsAffinityStatusAllowed | Line: 431 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:IsAffinityStatusAllowed(p2)
	else
		return false
	end
end
function t.IsAffinityStatusEnabled(p1, p2) --[[ IsAffinityStatusEnabled | Line: 443 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:IsAffinityStatusEnabled(p2)
	else
		return false
	end
end
function t.GetAffinityStatus(p1, p2) --[[ GetAffinityStatus | Line: 455 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetAffinityStatus(p2)
	else
		return nil
	end
end
function t.GetNextAffinityStatusVerifyTime(p1, p2) --[[ GetNextAffinityStatusVerifyTime | Line: 469 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetNextAffinityStatusVerifyTime(p2)
	else
		return nil
	end
end
function t.GetAffinityStatusChangedSignal(p1, p2) --[[ GetAffinityStatusChangedSignal | Line: 481 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetAffinityStatusChangedSignal(p2)
	else
		return nil
	end
end
function t.GetAffinityPromptResultSignal(p1, p2) --[[ GetAffinityPromptResultSignal | Line: 493 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetAffinityPromptResultSignal(p2)
	else
		return nil
	end
end
function t.Init(p1) --[[ Init | Line: 501 | Upvalues: t (copy), v10 (copy), v11 (copy), v8 (copy), v5 (copy), v6 (copy), StatusFlags (copy), v1 (copy) ]]
	t.PromptGroupJoinCompleted = v10
	t.PromptCommunityServerCompleted = v11
	if v8 then
		v5.AddRigDataCallback(function(p1) --[[ Line: 506 | Upvalues: v6 (ref), StatusFlags (ref) ]]
			local GameAffinity = p1:FindFirstChild("GameAffinity")
			if not GameAffinity then
				GameAffinity = v6.Create("Folder", {
					Name = "GameAffinity",
					Parent = p1
				})
			end
			for v2, v3 in StatusFlags do
				if (v3.CheckOnInit == "OnlyIfEnabled" or v3.UseDataValue) and not GameAffinity:FindFirstChild(v2) then
					local v4 = v6.Create("BoolValue", {
						Name = v2,
						Parent = GameAffinity
					})
					if v3.NextVerify then
						v6.Create("IntValue", {
							Name = "NextVerify",
							Parent = v4
						})
					end
				end
			end
		end)
	end
	if not v8 then
		return
	end
	v1.GetRemoteFunction("UpdateAffinityStatusRemote").OnServerInvoke = function(p1, ...) --[[ Line: 536 | Upvalues: t (ref) ]]
		return t.UpdateAffinityStatus(p1, ...)
	end
	v1.GetRemoteFunction("GetUpdatedAffinityStatusRemote").OnServerInvoke = function(p1, ...) --[[ Line: 539 | Upvalues: t (ref) ]]
		return t.GetAffinityStatus(p1, ...)
	end
end
t:Init()
return t