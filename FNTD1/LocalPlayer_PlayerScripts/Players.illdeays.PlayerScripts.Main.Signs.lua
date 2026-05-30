-- https://lua.expert/
local LocalizationService = game:GetService("LocalizationService")
local LocalPlayer = game.Players.LocalPlayer
local v1, v2 = pcall(function() --[[ Line: 5 | Upvalues: LocalizationService (copy), LocalPlayer (copy) ]]
	return LocalizationService:GetTranslatorForPlayerAsync(LocalPlayer)
end)
local t = {
	["en-us"] = "English",
	["pl-pl"] = "Polish",
	["pt-br"] = "Portuguese",
	["ru-ru"] = "Russian",
	["es-es"] = "Spanish"
}
function changeLanguageSigns() --[[ changeLanguageSigns | Line: 10 | Upvalues: v2 (copy), t (copy) ]]
	local LocaleId = v2.LocaleId
	local v1 = if t[LocaleId] then t[LocaleId] else "English"
	if workspace.Lobby["3D Signs"]:FindFirstChild(v1) or not game.ReplicatedStorage.Objects["Translated 3D Text Signs"]:FindFirstChild(v1) then
		return
	end
	for k, v in pairs(workspace.Lobby["3D Signs"]:GetChildren()) do
		v.Parent = game.ReplicatedStorage.Objects["Translated 3D Text Signs"]
	end
	game.ReplicatedStorage.Objects["Translated 3D Text Signs"][v1].Parent = workspace.Lobby["3D Signs"]
end
if v1 then
	v2:GetPropertyChangedSignal("LocaleId"):Connect(function() --[[ Line: 24 ]]
		changeLanguageSigns()
	end)
else
	warn("GetTranslatorForPlayerAsync failed: " .. v2)
end
task.wait(5)
task.spawn(changeLanguageSigns)