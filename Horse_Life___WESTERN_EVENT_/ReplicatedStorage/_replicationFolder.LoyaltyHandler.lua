-- https://lua.expert/
local t = {
	ClassName = "LoyaltyHandler"
}
t.__index = t
local AvatarEditorService = game:GetService("AvatarEditorService")
local HttpService = game:GetService("HttpService")
local PolicyService = game:GetService("PolicyService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("State")
local v3 = Sonar("PlaceTypeService")
local v4 = Sonar("Constants")
local IsServer = v4.IsServer
local v5 = not IsServer and game:GetService("Players").LocalPlayer
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (ref), v5 (copy), v1 (copy), v2 (copy), PolicyService (copy), IsServer (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = p1.Maid
	v22.Player = p1.Player
	v22.IsLocalPlayer = v5 and (if v22.Player == v5 then true else false)
	v22.PlayerWrapper = p1
	v22.PlayerWrapper.LoyaltyHandler = v22
	if v22.PlayerWrapper.PlayerData then
		v22.LoyaltyData = v22.PlayerWrapper.PlayerData:WaitForChild("Loyalty")
		v22.FavoritedGameValue = v22.LoyaltyData:WaitForChild("FavoritedGame")
		v22.InGroupValue = v22.LoyaltyData:WaitForChild("InGroup")
		v22.CommunityValue = v22.LoyaltyData:WaitForChild("InCommunity")
		v22.FavoritedGame = v22.FavoritedGameValue.Value
		v22.InGroup = v22.InGroupValue.Value
		v22.InCommunity = v22.CommunityValue.Value
		v22.CommunityActiveChangedSignal = v1.new()
		v22.Maid:GiveTask(v22.CommunityActiveChangedSignal)
		v22.LoyaltyActiveChangedSignal = v1.new()
		v22.Maid:GiveTask(v22.LoyaltyActiveChangedSignal)
		v22.LoyaltyActiveValueBase = Instance.new("BoolValue")
		v22.Maid:GiveTask(v22.LoyaltyActiveValueBase)
		p1.CommunityActiveChangedSignal = v22.CommunityActiveChangedSignal
		p1.LoyaltyChangedSignal = v22.LoyaltyActiveChangedSignal
		p1.LoyaltyActiveValueBase = v22.LoyaltyActiveValueBase
		v22:_setLoyaltyActive()
		v22.Maid:GiveTask(v22.FavoritedGameValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 66 | Upvalues: v22 (copy) ]]
			v22.FavoritedGame = v22.FavoritedGameValue.Value
			v22:_setLoyaltyActive()
		end))
		v22.Maid:GiveTask(v22.InGroupValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
			v22.InGroup = v22.InGroupValue.Value
			v22:_setLoyaltyActive()
		end))
		v22.Maid:GiveTask(v22.CommunityValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 76 | Upvalues: v22 (copy) ]]
			v22.InCommunity = v22.CommunityValue.Value
			v22:_setLoyaltyActive()
		end))
		p1.PolicyInfo = v2.new(nil)
		if v22.IsLocalPlayer then
			p1.PolicyInfo:set(PolicyService:GetPolicyInfoForPlayerAsync(v22.Player))
		end
		if IsServer then
			v22:_initServer()
			return v22
		end
		if v22.IsLocalPlayer then
			v22:_initClient()
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 100 ]]
	p1.Maid:Destroy()
	table.clear(p1)
	setmetatable(p1, nil)
end
function t._setLoyaltyActive(p1) --[[ _setLoyaltyActive | Line: 107 ]]
	p1.LoyaltyActive = true
	p1.CommunityActive = true
	if p1.LastLoyaltyActive == nil then
		p1.LastLoyaltyActive = p1.LoyaltyActive
	end
	if p1.LoyaltyActive ~= p1.LastLoyaltyActive then
		p1.LoyaltyActiveChangedSignal:Fire()
	end
	if p1.CommunityActive ~= p1.LastCommunityActive then
		p1.CommunityActiveChangedSignal:Fire()
	end
	p1.LastLoyaltyActive = p1.LoyaltyActive
	p1.LastCommunityActive = p1.CommunityActive
end
function t._testBloxlink(p1) --[[ _testBloxlink | Line: 127 | Upvalues: HttpService (copy) ]]
	local v1 = HttpService:RequestAsync({
		Method = "GET",
		Url = ("https://api.blox.link/v4/public/guilds/1196293227976863806/roblox-to-discord/%*"):format(p1.Player.UserId),
		Headers = {
			Authorization = "9142c8b9-9d9a-47ae-a564-df7fffc31173"
		}
	})
	if v1.Success == false then
		local _ = HttpService:JSONDecode(v1.Body).error
		return nil
	else
		if v1.StatusCode == 404 then
			return false
		end
		if v1.StatusCode == 200 then
			return true
		end
	end
end
function t._verifyCommunity(p1) --[[ _verifyCommunity | Line: 162 ]]
	if os.time() < p1.PlayerWrapper.PlayerData.Loyalty.NextVerify.Value then
		return
	end
	local v1 = p1:_testBloxlink()
	if v1 ~= nil then
		p1.PlayerWrapper.PlayerData.Loyalty.InCommunity.Value = v1
	end
	p1.PlayerWrapper.PlayerData.Loyalty.NextVerify.Value = os.time() + (if v1 == nil then 60 else 86400)
end
function t._initServer(p1) --[[ _initServer | Line: 177 | Upvalues: v4 (copy) ]]
	p1.UpdateFavoritedRemote = Instance.new("RemoteEvent")
	p1.Maid:GiveTask(p1.UpdateFavoritedRemote.OnServerEvent:Connect(function(p12, p2, p3) --[[ Line: 179 | Upvalues: p1 (copy) ]]
		if p12 ~= p1.Player then
			return
		end
		if p2 ~= nil then
			p1.FavoritedGameValue.Value = p2
		end
		if p3 == nil then
			p1:_verifyCommunity()
			return
		end
		p1.InGroupValue.Value = p3
		p1:_verifyCommunity()
	end))
	p1.UpdateFavoritedRemote.Name = "UpdateFavoritedRemote"
	p1.UpdateFavoritedRemote.Parent = p1.Player:WaitForChild("Settings")
	task.spawn(function() --[[ Line: 193 | Upvalues: p1 (copy), v4 (ref) ]]
		if p1.Player:IsInGroup(v4.GroupId) then
			p1.InGroupValue.Value = true
		else
			p1.InGroupValue.Value = false
		end
	end)
	task.spawn(function() --[[ Line: 204 | Upvalues: p1 (copy) ]]
		local v1 = p1.PlayerWrapper.PolicyInfo:get()
		if not v1 then
			p1.PlayerWrapper.PlayerData.Metadata.PolicyCheck.Value = false
			return
		end
		p1.PlayerWrapper.PlayerData.Metadata.PolicyCheck.Value = table.find(v1.AllowedExternalLinkReferences, "Discord") ~= nil
		if not p1.PlayerWrapper.PlayerData.Metadata.PolicyCheck.Value then
			return
		end
		p1:_verifyCommunity()
	end)
end
function t._initClient(p1) --[[ _initClient | Line: 223 | Upvalues: v1 (copy), AvatarEditorService (copy), v4 (copy), v3 (copy) ]]
	p1.PromptActiveChanged = v1.new()
	p1:_setPromptActive(true)
	p1.UpdateFavoritedRemote = p1.Player:WaitForChild("Settings"):WaitForChild("UpdateFavoritedRemote")
	p1.ComingFromFavoritePrompt = false
	task.spawn(function() --[[ Line: 230 | Upvalues: p1 (copy), AvatarEditorService (ref), v4 (ref), v3 (ref) ]]
		local v1 = nil
		local v2 = false
		p1.Maid:GiveTask(AvatarEditorService.PromptAllowInventoryReadAccessCompleted:Connect(function(p12) --[[ Line: 234 | Upvalues: v2 (ref), p1 (ref), v4 (ref), v1 (ref), AvatarEditorService (ref), v3 (ref) ]]
			v2 = p1.Player:IsInGroup(v4.GroupId)
			if p12 == Enum.AvatarPromptResult.Success then
				if pcall(function() --[[ Line: 238 | Upvalues: v1 (ref), AvatarEditorService (ref), v3 (ref) ]]
					v1 = AvatarEditorService:GetFavorite(v3.GetMainWorldId(), Enum.AvatarItemType.Asset)
				end) then
					if not v1 then
						local v12 = false
						pcall(function() --[[ Line: 244 | Upvalues: p1 (ref), AvatarEditorService (ref), v3 (ref), v12 (ref) ]]
							if not p1.ComingFromFavoritePrompt then
								p1.ComingFromFavoritePrompt = false
								AvatarEditorService:PromptSetFavorite(v3.GetMainWorldId(), Enum.AvatarItemType.Asset, true)
								v12 = true
							end
						end)
					end
				else
					warn("LoyaltyHandler - Failed to determine FavoritedState")
				end
			end
			p1.UpdateFavoritedRemote:FireServer(v1, v2)
			p1:_setPromptActive(false)
		end))
		p1.Maid:GiveTask(AvatarEditorService.PromptSetFavoriteCompleted:Connect(function(p12) --[[ Line: 264 | Upvalues: p1 (ref) ]]
			if p12 ~= Enum.AvatarPromptResult.Success then
				p1.ComingFromFavoritePrompt = true
				p1:_setPromptActive(false)
			end
		end))
		p1:_setPromptActive(false)
	end)
end
function t._promptAllowInventoryReadAccess(p1) --[[ _promptAllowInventoryReadAccess | Line: 281 | Upvalues: AvatarEditorService (copy) ]]
	if not p1.PromptActive then
		p1:_setPromptActive(true)
		p1.ComingFromFavoritePrompt = false
		AvatarEditorService:PromptAllowInventoryReadAccess()
	end
end
function t._setPromptActive(p1, p2) --[[ _setPromptActive | Line: 290 ]]
	p1.PromptActive = p2
	p1.PromptActiveChanged:Fire()
end
return t