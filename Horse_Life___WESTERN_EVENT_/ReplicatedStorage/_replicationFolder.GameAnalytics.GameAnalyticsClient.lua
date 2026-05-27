-- https://lua.expert/
local t = {}
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
game:GetService("ReplicatedStorage")
game:GetService("ScriptContext")
function t.initClient() --[[ initClient | Line: 16 | Upvalues: GuiService (copy), UserInputService (copy) ]]
	local Postie = require(script.Parent.GameAnalytics.Postie)
	local function getPlatform() --[[ getPlatform | Line: 40 | Upvalues: GuiService (ref), UserInputService (ref) ]]
		if GuiService:IsTenFootInterface() then
			return "Console"
		end
		if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
			return "Mobile"
		else
			return "Desktop"
		end
	end
	Postie.setCallback("getPlatform", getPlatform)
end
return t