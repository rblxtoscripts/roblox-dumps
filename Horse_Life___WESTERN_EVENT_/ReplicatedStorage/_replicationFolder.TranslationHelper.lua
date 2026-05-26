-- https://lua.expert/
local t = {}
local LocalizationService = game:GetService("LocalizationService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v1 = nil
local v2 = nil
local v3 = false
local v4 = false
task.spawn(function() --[[ Line: 15 | Upvalues: v3 (ref), v1 (ref), LocalizationService (copy), LocalPlayer (copy), v4 (ref), v2 (ref) ]]
	v3 = pcall(function() --[[ Line: 16 | Upvalues: v1 (ref), LocalizationService (ref), LocalPlayer (ref) ]]
		v1 = LocalizationService:GetTranslatorForPlayerAsync(LocalPlayer)
	end)
	v4 = pcall(function() --[[ Line: 19 | Upvalues: v2 (ref), LocalizationService (ref) ]]
		v2 = LocalizationService:GetTranslatorForLocaleAsync("en")
	end)
end)
function t.setLanguage(p1) --[[ setLanguage | Line: 25 | Upvalues: LocalizationService (copy), v1 (ref) ]]
	if p1 == "en" then
		return false
	end
	local v12, v2 = pcall(function() --[[ Line: 27 | Upvalues: LocalizationService (ref), p1 (copy) ]]
		return LocalizationService:GetTranslatorForLocaleAsync(p1)
	end)
	if v12 and v2 then
		v1 = v2
		return true
	else
		return false
	end
end
function t.Translate(p1, p2) --[[ Translate | Line: 42 | Upvalues: v3 (ref), v1 (ref), v4 (ref), v2 (ref) ]]
	if not p2 then
		p2 = game
	end
	if v3 then
		return v1:Translate(p2, p1)
	end
	if v4 then
		return v2:Translate(p2, p1)
	else
		return p1
	end
end
function t.translateByKey(p1, p2) --[[ translateByKey | Line: 57 | Upvalues: v3 (ref), v1 (ref), v4 (ref), v2 (ref) ]]
	local v12 = ""
	local v22 = if v3 then pcall(function() --[[ Line: 63 | Upvalues: v12 (ref), v1 (ref), p1 (copy), p2 (copy) ]]
	v12 = v1:FormatByKey(p1, p2)
end) else false
	if v4 and not v22 then
		v22 = pcall(function() --[[ Line: 68 | Upvalues: v12 (ref), v2 (ref), p1 (copy), p2 (copy) ]]
			v12 = v2:FormatByKey(p1, p2)
		end)
	end
	if v22 then
		return v12
	else
		return false
	end
end
return t