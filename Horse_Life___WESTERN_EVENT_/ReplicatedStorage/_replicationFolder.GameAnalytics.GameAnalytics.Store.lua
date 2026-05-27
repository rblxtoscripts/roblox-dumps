-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local RunService = game:GetService("RunService")
local t = {
	AutoSaveData = 300
}
t.PlayerDS = RunService:IsStudio() and {} or DataStoreService:GetDataStore("GA_PlayerDS_1.0.0")
t.BasePlayerData = {
	Sessions = 0,
	Transactions = 0,
	CurrentCustomDimension01 = "",
	CurrentCustomDimension02 = "",
	CurrentCustomDimension03 = "",
	ConfigsHash = "",
	AbId = "",
	AbVariantId = "",
	InitAuthorized = false,
	ClientServerTimeOffset = 0,
	RemoteConfigsIsReady = false,
	PlayerTeleporting = false,
	OwnedGamepasses = nil,
	CountryCode = "",
	CustomUserId = "",
	ProgressionTries = {},
	SdkConfig = {},
	Configurations = {}
}
t.DataToSave = { "Sessions", "Transactions", "ProgressionTries", "CurrentCustomDimension01", "CurrentCustomDimension02", "CurrentCustomDimension03", "OwnedGamepasses" }
t.PlayerCache = {}
t.EventsQueue = {}
function t.GetPlayerData(p1, p2) --[[ GetPlayerData | Line: 43 | Upvalues: RunService (copy), t (copy) ]]
	if type(p2) == "table" then
		return {}
	end
	local v1 = nil
	if not pcall(function() --[[ Line: 49 | Upvalues: v1 (ref), RunService (ref), t (ref), p2 (copy) ]]
		v1 = RunService:IsStudio() and {} or (t.PlayerDS:GetAsync(p2.UserId) or {})
	end) then
		v1 = {}
	end
	return v1
end
function t.GetPlayerDataFromCache(p1, p2) --[[ GetPlayerDataFromCache | Line: 60 | Upvalues: t (copy) ]]
	local v1 = t.PlayerCache[tonumber(p2)]
	if v1 then
		return v1
	else
		return t.PlayerCache[tostring(p2)]
	end
end
function t.GetErrorDataStore(p1, p2) --[[ GetErrorDataStore | Line: 69 | Upvalues: RunService (copy), DataStoreService (copy) ]]
	local v1 = nil
	if not pcall(function() --[[ Line: 71 | Upvalues: v1 (ref), RunService (ref), DataStoreService (ref), p2 (copy) ]]
		v1 = RunService:IsStudio() and {} or DataStoreService:GetDataStore("GA_ErrorDS_1.0.0", p2)
	end) then
		v1 = {}
	end
	return v1
end
function t.SavePlayerData(p1, p2) --[[ SavePlayerData | Line: 82 | Upvalues: t (copy), RunService (copy) ]]
	if type(p2) == "table" then
		return
	end
	local v1 = t:GetPlayerDataFromCache(p2.UserId)
	local t2 = {}
	if not v1 then
		return
	end
	for k, v in pairs(t.DataToSave) do
		t2[v] = v1[v]
	end
	if RunService:IsStudio() then
		return
	end
	pcall(function() --[[ Line: 102 | Upvalues: t (ref), p2 (copy), t2 (copy) ]]
		t.PlayerDS:SetAsync(p2.UserId, t2)
	end)
end
function t.IncrementErrorCount(p1, p2, p3, p4) --[[ IncrementErrorCount | Line: 108 | Upvalues: RunService (copy) ]]
	if not p3 then
		return
	end
	local v1 = 0
	if not RunService:IsStudio() then
		pcall(function() --[[ Line: 116 | Upvalues: v1 (ref), p2 (copy), p3 (copy), p4 (copy) ]]
			v1 = p2:IncrementAsync(p3, p4)
		end)
	end
	return v1
end
return t