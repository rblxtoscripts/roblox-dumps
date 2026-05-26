-- https://lua.expert/
local t = {}
require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = if game:GetService("LocalizationService").RobloxLocaleId == "" then "en-us" else game:GetService("LocalizationService").RobloxLocaleId or "en-us"
local v2 = string.sub(v1, 1, 2)
if v1 == "pt-br" then
	v2 = "pt-br"
end
if v1 == "zh-cn" or (v1 == "zh-hans" or v1 == "zh-cjv") then
	v2 = "zh-hans"
end
if v1 == "zh-tw" or v1 == "zh-hant" then
	v2 = "zh-hant"
end
local v3 = game.LocalizationService.MainLocalization:GetTranslator(v2)
local v4 = game.LocalizationService.MainLocalization:GetTranslator("en-us")
function t.IsEnglish() --[[ IsEnglish | Line: 29 | Upvalues: t (copy) ]]
	return t:GetLanguageId() == "en"
end
function t.GetLanguageId(p1) --[[ GetLanguageId | Line: 34 ]]
	game:GetService("LocalizationService")
	return string.sub(if game:GetService("LocalizationService").RobloxLocaleId == "" then "en-us" else game:GetService("LocalizationService").RobloxLocaleId or "en-us", 1, 2)
end
function t.FormatNumber(p1, p2, p3) --[[ FormatNumber | Line: 59 | Upvalues: v3 (copy), v4 (copy) ]]
	local v1 = tonumber(p2)
	local v2, v32 = pcall(function() --[[ Line: 61 | Upvalues: v3 (ref), p1 (copy), v1 (ref) ]]
		return v3:FormatByKey(p1, { v1 })
	end)
	if p3 then
		p3.AutoLocalize = false
	end
	if not v2 then
		v32 = v4:FormatByKey(p1, { v1 })
	end
	if p1 == "Number" or p1 == "Plus" then
		v32 = string.sub(v32, 1, string.len(v32) - 3)
	elseif p1 == "Countdown" and v1 == 0 then
		v32 = string.sub(v32, 2, (string.len(v32)))
	end
	return v32
end
function t.Translate(p1, p2, ...) --[[ Translate | Line: 89 | Upvalues: v3 (copy), v4 (copy) ]]
	if p2 then
		p2.AutoLocalize = false
	end
	local t = { ... }
	if t[1] == "Boy" or (t[1] == "Girl" or t[1] == "None") then
		if t[1] == "None" then
			t[1] = "Boy"
		end
		p1 = p1 .. t[1]
	end
	local v1, v2 = pcall(function() --[[ Line: 103 | Upvalues: v3 (ref), p1 (ref), t (copy) ]]
		return v3:FormatByKey(p1, t) or nil
	end)
	if not v1 then
		v2 = v4:FormatByKey(p1, t) or nil
	end
	return v2
end
return t