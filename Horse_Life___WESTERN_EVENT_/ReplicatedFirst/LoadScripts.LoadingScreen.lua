-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
game:GetService("TeleportService")
game:GetService("TweenService")
game:GetService("RunService")
game:GetService("StarterGui")
local v1 = require("./ScreenTransitioner")
local function setup() --[[ setup | Line: 16 | Upvalues: v1 (copy), UserInputService (copy) ]]
	local v12 = v1.new("Main")
	UserInputService.InputBegan:Connect(function(p1_2, p2_2) --[[ Line: 19 | Upvalues: v12 (copy) ]]
		if p2_2 or p1_2.KeyCode ~= Enum.KeyCode.J then
			return
		end
		if v12.IsActive then
			v12:Exit()
		else
			v12:Enter(true)
		end
	end)
	v12:Enter(false)
end
local v2 = v1.new("Main")
UserInputService.InputBegan:Connect(function(p1_2, p2_2) --[[ Line: 19 | Upvalues: v2 (copy) ]]
	if p2_2 or p1_2.KeyCode ~= Enum.KeyCode.J then
		return
	end
	if v2.IsActive then
		v2:Exit()
	else
		v2:Enter(true)
	end
end)
v2:Enter(false)