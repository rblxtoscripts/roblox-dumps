-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SocialService = game:GetService("SocialService")
local HttpService = game:GetService("HttpService")
local v1 = require(ReplicatedStorage.Sonar)("FriendsService")
function t.CanSendGameInvite(p1, p2) --[[ CanSendGameInvite | Line: 17 | Upvalues: SocialService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 18 | Upvalues: SocialService (ref), p1 (copy), p2 (copy) ]]
		return SocialService:CanSendGameInviteAsync(p1, p2 or nil)
	end)
	if v1 then
		return v1 and v2
	else
		warn("\226\154\160\239\184\143 GameInviteService, Failed to check game invite status:", v2)
		return false
	end
end
function t.PromptGameInvite(p1, p2) --[[ PromptGameInvite | Line: 34 | Upvalues: HttpService (copy), SocialService (copy) ]]
	local ExperienceInviteOptions = Instance.new("ExperienceInviteOptions")
	if ExperienceInviteOptions.InviteUser then
		ExperienceInviteOptions.InviteUser = p2.InviteUser
	end
	if ExperienceInviteOptions.PromptMessage then
		ExperienceInviteOptions.PromptMessage = p2.PromptMessage
	end
	if ExperienceInviteOptions.InviteMessageId then
		ExperienceInviteOptions.InviteMessageId = p2.InviteMessageId
	end
	if ExperienceInviteOptions.LaunchData then
		ExperienceInviteOptions.LaunchData = p2.LaunchData and HttpService:JSONEncode(p2.LaunchData)
	end
	local v2, v3 = pcall(function() --[[ Line: 49 | Upvalues: SocialService (ref), p1 (copy), ExperienceInviteOptions (copy) ]]
		return SocialService:PromptGameInvite(p1, ExperienceInviteOptions)
	end)
	if not v2 then
		warn("\226\154\160\239\184\143 GameInviteService, Failed to prompt game invite:", v3)
	end
	return v2 and v3
end
function t.GetRandomFriendToInvite(p1) --[[ GetRandomFriendToInvite | Line: 64 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetFriendsOnline(p1, {
		NotInGame = true
	})
	if v12 then
		return v12[math.random(1, #v12)]
	else
		warn("\226\154\160\239\184\143 GameInviteService, Failed to get friends online:", v12)
		return nil
	end
end
return t