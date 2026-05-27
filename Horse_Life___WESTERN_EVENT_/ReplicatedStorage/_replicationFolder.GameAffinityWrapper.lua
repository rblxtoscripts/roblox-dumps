-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")
local ExperienceNotificationService = game:GetService("ExperienceNotificationService")
local PolicyService = game:GetService("PolicyService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("GameAffinityService")
local v3 = Sonar("FormatTime")
local v4 = Sonar("Promise")
local v5 = Sonar("Signal")
local v6 = Sonar("retryAsync")
local v7 = Sonar("Maid")
local v8 = game:GetService("RunService"):IsServer()
local v9 = v1.GetConfig("GameAffinity")()
local PlaceId = v9.PlaceId
local StatusGroups = v9.StatusGroups
local StatusFlags = v9.StatusFlags
function t.new(p1) --[[ new | Line: 134 | Upvalues: t (copy), v5 (copy), v8 (copy), Players (copy), StatusFlags (copy), v4 (copy), StatusGroups (copy), HttpService (copy), AvatarEditorService (copy), PlaceId (copy), v2 (copy), ExperienceNotificationService (copy), MarketplaceService (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = p1.Maid
	v22.Player = p1.Player
	v22.PlayerWrapper = p1
	v22.IsLocalPlayer = p1.IsLocalPlayer
	if p1:IsLocalOrServer() then
		v22.StatusData = p1.PlayerData.GameAffinity
		v22.PolicyInfoChangedSignal = v22.Maid:GiveTask(v5.new())
	end
	if v8 then
		v22.StatesFolder = Instance.new("Configuration")
		v22.StatesFolder.Name = "GameAffinity"
		v22.StatesFolder.Parent = v22.Player
		v22.Maid:GiveTask(v22.StatesFolder)
		v22.Maid:GiveTask(Players.PlayerMembershipChanged:Connect(function(p1) --[[ Line: 155 | Upvalues: v22 (copy) ]]
			if p1 == v22.Player then
				v22:_updateAffinityStatus("Premium")
			end
		end))
		for v3, v42 in StatusFlags do
			if v42.CheckOnInit == "OnlyIfEnabled" and not v22:_getStatusValue(v3) then
				warn(string.format("\226\154\160\239\184\143 GameAffinityWrapper, %s flag has CheckOnInit set to OnlyIfEnabled, but does not have a persistent data value in player data", v3))
			end
			v22:_initStatus(v3)
		end
		v22.Maid:GivePromise(v4.new(function(p1) --[[ Line: 175 | Upvalues: v22 (copy) ]]
			local v1, v2 = v22:_getPolicyInfoAsync()
			if not (v1 and v2) then
				return
			end
			p1(v2)
		end)):andThen(function(p1) --[[ Line: 180 | Upvalues: v22 (copy) ]]
			v22:_setPolicyInfo(p1)
			v22:_initStatus("InCommunityServer")
		end)
		for v52, v6 in StatusGroups do
			for v7, v82 in v6 do
				v22.Maid:GiveTask(v22:GetAffinityStatusChangedSignal(v82):Connect(function() --[[ Line: 190 | Upvalues: v22 (copy), v52 (copy) ]]
					v22:_updateAffinityStatusGroup(v52)
				end))
			end
			v22:_updateAffinityStatusGroup(v52)
		end
	else
		v22.StatesFolder = v22.Player:WaitForChild("GameAffinity")
		if v22.IsLocalPlayer then
			local function onPolicyInfoChanged() --[[ onPolicyInfoChanged | Line: 203 | Upvalues: v22 (copy), HttpService (ref) ]]
				local v1 = v22.PlayerWrapper:GetReplicatedData("PolicyInfo")
				if v1 then
					v22:_setPolicyInfo(HttpService:JSONDecode(v1))
				end
			end
			v22.Maid:GiveTask(v22.PlayerWrapper:GetReplicatedDataChangedSignal("PolicyInfo"):Connect(onPolicyInfoChanged))
			local v9 = v22.PlayerWrapper:GetReplicatedData("PolicyInfo")
			if v9 then
				v22:_setPolicyInfo(HttpService:JSONDecode(v9))
			end
			v22.Maid:GiveTask(AvatarEditorService.PromptAllowInventoryReadAccessCompleted:Connect(function(p1) --[[ Line: 214 | Upvalues: AvatarEditorService (ref), PlaceId (ref), v22 (copy), v2 (ref) ]]
				if p1 ~= Enum.AvatarPromptResult.Success then
					v22:GetAffinityPromptResultSignal("FavouritedGame"):Fire(p1)
					return
				end
				local _, v1 = pcall(function() --[[ Line: 218 | Upvalues: AvatarEditorService (ref), PlaceId (ref) ]]
					return AvatarEditorService:GetFavorite(PlaceId, Enum.AvatarItemType.Asset)
				end)
				if v1 then
					v2.RequestToUpdateAffinityStatus("FavouritedGame", v1)
					v22:GetAffinityPromptResultSignal("FavouritedGame"):Fire(v1)
					return
				end
				if v22._fromFavoritePrompt then
					v22._fromFavoritePrompt = false
				elseif v2.PromptSetFavorite() then
					return
				end
				v2.RequestToUpdateAffinityStatus("FavouritedGame", v1)
				v22:GetAffinityPromptResultSignal("FavouritedGame"):Fire(v1)
			end))
			v22.Maid:GiveTask(AvatarEditorService.PromptSetFavoriteCompleted:Connect(function(p1) --[[ Line: 241 | Upvalues: v22 (copy), v2 (ref) ]]
				if p1 ~= Enum.AvatarPromptResult.Success then
					v22._fromFavoritePrompt = true
					v2.PromptFavouriteGame()
				end
				v2.PromptAllowInventoryReadAccess()
			end))
			v22.Maid:GiveTask(ExperienceNotificationService.OptInPromptClosed:Connect(function(p1) --[[ Line: 253 | Upvalues: v2 (ref), v22 (copy) ]]
				v2.RequestToUpdateAffinityStatus("ExperienceNotifications", true)
				v22:GetAffinityPromptResultSignal("ExperienceNotifications"):Fire(true)
			end))
			v22.Maid:GiveTask(v2.PromptGroupJoinCompleted:Connect(function(p1) --[[ Line: 261 | Upvalues: v2 (ref), v22 (copy) ]]
				v2.RequestToUpdateAffinityStatus("JoinedGroup", if p1 == Enum.GroupMembershipStatus.Joined then true elseif p1 == Enum.GroupMembershipStatus.AlreadyMember then true else false)
				v22:GetAffinityPromptResultSignal("JoinedGroup"):Fire(p1)
			end))
			v22.Maid:GiveTask(v2.PromptCommunityServerCompleted:Connect(function(p1) --[[ Line: 270 | Upvalues: v22 (copy) ]]
				v22:GetAffinityPromptResultSignal("InCommunityServer"):Fire(p1)
			end))
			v22.Maid:GiveTask(MarketplaceService.PromptPremiumPurchaseFinished:Connect(function() --[[ Line: 275 | Upvalues: v22 (copy), v2 (ref) ]]
				local isPremium = v22.Player.MembershipType == Enum.MembershipType.Premium
				v2.RequestToUpdateAffinityStatus("Premium", isPremium)
				v22:GetAffinityPromptResultSignal("Premium"):Fire(isPremium)
			end))
		end
	end
	return v22
end
function t._getPolicyInfoAsync(p1) --[[ _getPolicyInfoAsync | Line: 287 | Upvalues: v6 (copy) ]]
	return v6(function() --[[ Line: 288 | Upvalues: p1 (copy) ]]
		return p1:GetPolicyInfo()
	end)
end
function t.GetPolicyInfo(p1) --[[ GetPolicyInfo | Line: 295 | Upvalues: PolicyService (copy) ]]
	if p1.PolicyInfo then
		return p1.PolicyInfo
	else
		local v1, v2 = pcall(function() --[[ Line: 300 | Upvalues: PolicyService (ref), p1 (copy) ]]
			return PolicyService:GetPolicyInfoForPlayerAsync(p1.Player)
		end)
		return v1 and v2
	end
end
function t.OnPolicyInfoReceived(p1, p2) --[[ OnPolicyInfoReceived | Line: 309 | Upvalues: v7 (copy), v4 (copy) ]]
	local v1 = v7.new()
	v1:GivePromise(v4.new(function(p12, p2) --[[ Line: 312 | Upvalues: p1 (copy) ]]
		if not p1.PolicyInfo then
			p1.PolicyInfoChangedSignal:Wait()
		end
		if p1.PolicyInfo then
			p12(p1.PolicyInfo)
		else
			p2()
		end
	end):andThen(function(p1) --[[ Line: 321 | Upvalues: p2 (copy) ]]
		p2(p1)
	end))
	return v1
end
function t.CheckAllowedExternalLinkReferencesAsync(p1, p2) --[[ CheckAllowedExternalLinkReferencesAsync | Line: 331 ]]
	if not p1:GetPolicyInfo() then
		p1.PolicyInfoChangedSignal:Wait()
	end
	local v1 = p1:GetPolicyInfo()
	for v3, v4 in type(p2) == "string" and { p2 } or p2 do
		if not table.find(v1.AllowedExternalLinkReferences, v4) then
			return false
		end
	end
	return true
end
function t._setPolicyInfo(p1, p2) --[[ _setPolicyInfo | Line: 347 | Upvalues: v8 (copy), HttpService (copy) ]]
	p1.PolicyInfo = if p2 then p2 else p1:GetPolicyInfo()
	p1.PolicyInfoChangedSignal:Fire()
	if not (p1.PolicyInfo and v8) then
		return
	end
	p1.PlayerWrapper:SetReplicatedData("PolicyInfo", HttpService:JSONEncode(p1.PolicyInfo))
end
function t._initStatus(p1, p2) --[[ _initStatus | Line: 357 ]]
	local v1, v2 = p1:_getStatus(p2, true)
	p1:SetAffinityStatus(p2, v1, v2)
end
function t._getStatusValue(p1, p2) --[[ _getStatusValue | Line: 362 ]]
	return p1.StatusData:FindFirstChild(p2)
end
function t._setNextVerifyTime(p1, p2, p3) --[[ _setNextVerifyTime | Line: 366 | Upvalues: StatusFlags (copy), v3 (copy) ]]
	local v1 = p1:_getStatusValue(p2)
	if not v1 then
		return
	end
	local NextVerify = v1:FindFirstChild("NextVerify")
	if not NextVerify then
		return
	end
	local v2 = StatusFlags[p2]
	if not v2 then
		return
	end
	if v2.NextVerify then
		NextVerify.Value = v3.GetTime() + v2.NextVerify(p3)
	end
end
function t.GetNextAffinityStatusVerifyTime(p1, p2) --[[ GetNextAffinityStatusVerifyTime | Line: 392 ]]
	local v1 = p1:_getStatusValue(p2)
	if not v1 then
		return nil
	end
	local NextVerify = v1:FindFirstChild("NextVerify")
	if NextVerify then
		return NextVerify.Value
	else
		return nil
	end
end
function t._getStatus(p1, p2, p3) --[[ _getStatus | Line: 406 | Upvalues: StatusFlags (copy), v9 (copy) ]]
	local v1 = StatusFlags[p2]
	local v2 = p1:_getStatusValue(p2)
	local v3, v4, v5, v6
	if p3 and (v1.CheckOnInit == true or v1.CheckOnInit == "OnlyIfEnabled" and (v2 and v2.Value)) and p1:_canUpdateAffinityStatus(p2) then
		v3 = v1.Get
		if type(v3) == "function" then
			v4 = v1.Get(p1, v9)
			if v4 ~= nil or v4 == nil and not p3 then
				return v4
			end
		end
		if not v2 then
			return false
		end
		v5 = v2.Value
		v6 = if p3 then v1.CheckOnInit == "OnlyIfEnabled" else p3
		return v5, v6
	end
	if not p3 then
		v3 = v1.Get
		if type(v3) == "function" then
			v4 = v1.Get(p1, v9)
			if v4 ~= nil or v4 == nil and not p3 then
				return v4
			end
		end
	end
	if not v2 then
		return false
	end
	v5 = v2.Value
	v6 = if p3 then v1.CheckOnInit == "OnlyIfEnabled" else p3
	return v5, v6
end
function t._canUpdateAffinityStatus(p1, p2) --[[ _canUpdateAffinityStatus | Line: 432 | Upvalues: v3 (copy) ]]
	local v1 = p1:_getStatusValue(p2)
	if not v1 then
		return true
	end
	local NextVerify = v1:FindFirstChild("NextVerify")
	if NextVerify and v3.GetTime() < NextVerify.Value then
	else
		return true
	end
end
function t._updateAffinityStatus(p1, p2, p3, p4) --[[ _updateAffinityStatus | Line: 446 | Upvalues: StatusFlags (copy) ]]
	local v1 = StatusFlags[p2]
	if p4 and not v1.ClientCanUpdate then
		return
	end
	if v1.TrustClientResponse == false then
		p3 = p1:_getStatus(p2)
	end
	if p3 == nil then
		p1:_setNextVerifyTime(p2, p3)
	else
		p1:SetAffinityStatus(p2, p3)
	end
	return p3
end
function t._updateAffinityStatusGroup(p1, p2) --[[ _updateAffinityStatusGroup | Line: 476 | Upvalues: StatusGroups (copy) ]]
	local v1 = true
	for v2, v3 in StatusGroups[p2] do
		if not p1:GetAffinityStatus(v3) then
			v1 = false
			break
		end
	end
	p1:SetAffinityStatus(p2, v1)
end
function t.SetAffinityStatus(p1, p2, p3, p4) --[[ SetAffinityStatus | Line: 492 ]]
	if type(p3) ~= "boolean" then
		warn("\226\154\160\239\184\143 GameAffinityWrapper, SetAffinityStatus value must be a boolean and not nil")
		return
	end
	p1.StatesFolder:SetAttribute(p2, p3)
	local v1 = p1:_getStatusValue(p2)
	if not v1 then
		return
	end
	v1.Value = p3
	if p4 then
		return
	end
	p1:_setNextVerifyTime(p2, p3)
end
function t.GetAffinityStatus(p1, p2) --[[ GetAffinityStatus | Line: 517 ]]
	return p1.StatesFolder:GetAttribute(p2)
end
function t.IsAffinityStatusEnabled(p1, p2) --[[ IsAffinityStatusEnabled | Line: 524 ]]
	return p1:GetAffinityStatus(p2) == true
end
function t.GetAffinityStatusChangedSignal(p1, p2) --[[ GetAffinityStatusChangedSignal | Line: 531 ]]
	return p1.StatesFolder:GetAttributeChangedSignal(p2)
end
function t.GetAffinityPromptResultSignal(p1, p2) --[[ GetAffinityPromptResultSignal | Line: 538 | Upvalues: v5 (copy) ]]
	if not p1.PromptResultSignals then
		p1.PromptResultSignals = {}
	end
	if not p1.PromptResultSignals[p2] then
		p1.PromptResultSignals[p2] = v5.new()
	end
	return p1.PromptResultSignals[p2]
end
function t.IsAffinityStatusAllowed(p1, p2) --[[ IsAffinityStatusAllowed | Line: 551 | Upvalues: StatusFlags (copy) ]]
	local v1 = StatusFlags[p2]
	if not v1 then
		return false
	end
	if v1.IsAllowed then
		return v1.IsAllowed(p1, v1)
	else
		return true
	end
end
function t.OnAffinityStatusInitialised(p1, p2, p3) --[[ OnAffinityStatusInitialised | Line: 567 | Upvalues: v7 (copy), StatusGroups (copy), StatusFlags (copy) ]]
	local v1 = v7.new()
	local v2 = StatusGroups[p2] or { p2 }
	local v3 = false
	local function checkAllowed() --[[ checkAllowed | Line: 576 | Upvalues: v2 (ref), p1 (copy), v3 (ref), p3 (copy) ]]
		for v1, v22 in v2 do
			if not p1:IsAffinityStatusAllowed(v22) then
				return
			end
		end
		if v3 then
			return
		end
		v3 = true
		p3()
	end
	for v4, v5 in v2 do
		if StatusFlags[v5].RequiresPolicyInfo then
			v1:GiveTask(p1:OnPolicyInfoReceived(checkAllowed))
			continue
		end
		checkAllowed()
	end
	return v1
end
return t