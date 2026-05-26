-- https://lua.expert/
local t = {}
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local v1 = shared.GBMod("Utilities")
local t2 = {}
local function ConvertLocaleToISO(p1) --[[ ConvertLocaleToISO | Line: 38 ]]
	return string.lower(string.split(p1, "-")[1])
end
function t.GetRegionId(p1, p2) --[[ GetRegionId | Line: 48 | Upvalues: v1 (copy), t2 (copy), LocalizationService (copy) ]]
	local v12 = v1.resolvePlayerObject(p2)
	if not t2[v12] then
		t2[v12] = {}
	end
	if t2[v12].regionId then
		return t2[v12].regionId
	end
	local v2 = v1.promiseReturn(1, function() --[[ Line: 59 | Upvalues: LocalizationService (ref), v12 (ref) ]]
		return LocalizationService:GetCountryRegionForPlayerAsync(v12)
	end)
	if t2[v12] then
		t2[v12].regionId = v2
	end
	return v2 or "unknown"
end
function t.GetLocaleId(p1, p2) --[[ GetLocaleId | Line: 73 | Upvalues: v1 (copy), t2 (copy), ConvertLocaleToISO (copy), LocalizationService (copy) ]]
	local v12 = v1.resolvePlayerObject(p2)
	if not t2[v12] then
		t2[v12] = {}
	end
	if t2[v12].localeId then
		return t2[v12].localeId
	end
	local v2 = v1.promiseReturn(1, function() --[[ Line: 84 | Upvalues: ConvertLocaleToISO (ref), LocalizationService (ref), v12 (ref) ]]
		return ConvertLocaleToISO(LocalizationService:GetTranslatorForPlayerAsync(v12).LocaleId)
	end)
	if t2[v12] then
		t2[v12].localeId = v2
	end
	return v2 or "unknown"
end
function t.Init(p1) --[[ Init | Line: 96 | Upvalues: Players (copy), t2 (copy) ]]
	Players.PlayerRemoving:Connect(function(p1) --[[ Line: 97 | Upvalues: t2 (ref) ]]
		t2[p1] = nil
	end)
end
return t