-- https://lua.expert/
game.Players.LocalPlayer:GetMouse()
local v1 = nil
workspace.Tool.OnToolEquiped.OnClientEvent:connect(function(p1, p2, p3, p4) --[[ Line: 4 | Upvalues: v1 (ref) ]]
	if not game:GetService("UserInputService").TouchEnabled then
		v1 = game:GetService("UserInputService").InputBegan:connect(function(p12, p2) --[[ Line: 7 | Upvalues: p1 (copy) ]]
			if p2 or p12.UserInputType ~= Enum.UserInputType.MouseButton1 and (p12.UserInputType ~= Enum.UserInputType.Gamepad1 or p12.KeyCode ~= Enum.KeyCode.ButtonR2) then
				return
			end
			workspace.Tool.ToolActivated:FireServer(p1)
		end)
	end
	local function activate(p12, p2, p3) --[[ activate | Line: 16 | Upvalues: p1 (copy) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		workspace.Tool.ToolActivated:FireServer(p1)
	end
	local function drop(p12, p2, p3) --[[ drop | Line: 28 | Upvalues: p1 (copy) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		workspace.Tool.DropTool:FireServer(p1)
	end
	game:GetService("ContextActionService"):UnbindAction("DefaultToolAction")
	if p3 then
		game:GetService("ContextActionService"):BindAction("DefaultToolAction", activate, true)
		game:GetService("ContextActionService"):SetImage("DefaultToolAction", p4)
	end
	if not p2 then
		return
	end
	game:GetService("ContextActionService"):BindAction("Drop", drop, true, Enum.KeyCode.Backspace)
	game:GetService("ContextActionService"):SetImage("Drop", "rbxassetid://3745498789")
end)
workspace.Tool.OnToolUnequiped.OnClientEvent:connect(function() --[[ Line: 56 | Upvalues: v1 (ref) ]]
	if not v1 then
		game:GetService("ContextActionService"):UnbindAction("DefaultToolAction")
		game:GetService("ContextActionService"):UnbindAction("Drop")
		return
	end
	v1:disconnect()
	game:GetService("ContextActionService"):UnbindAction("DefaultToolAction")
	game:GetService("ContextActionService"):UnbindAction("Drop")
end)