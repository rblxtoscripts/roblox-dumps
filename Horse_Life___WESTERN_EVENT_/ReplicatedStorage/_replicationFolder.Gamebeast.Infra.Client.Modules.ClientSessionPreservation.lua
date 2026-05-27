-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
shared.GBMod("Signal")
shared.GBMod("GetRemote")
local t2 = {
	sessionId = true,
	joinTime = true,
	friendClockStart = true,
	hasFriendsOnline = true,
	totalFriendPlaytime = true
}
function t.UpdateStoredData(p1, p2, p3) --[[ UpdateStoredData | Line: 45 | Upvalues: t2 (copy), TeleportService (copy) ]]
	if t2[p2] ~= nil then
		local v1 = p1:GetStoredData()
		v1[p2] = p3
		TeleportService:SetTeleportSetting("GAMEBEAST_SESSION", v1)
	end
end
function t.GetStoredData(p1) --[[ GetStoredData | Line: 56 | Upvalues: TeleportService (copy) ]]
	return TeleportService:GetTeleportSetting("GAMEBEAST_SESSION") or {}
end
return t