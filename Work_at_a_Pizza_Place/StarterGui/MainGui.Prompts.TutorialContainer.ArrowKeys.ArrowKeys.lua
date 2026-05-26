-- https://lua.expert/
wait(2)
local v1 = nil
local v2 = workspace.Main.IsNewPlayer:InvokeServer()
local UserInputService = game:GetService("UserInputService")
AlreadyShowedMessage = false
if not game:GetService("UserInputService").KeyboardEnabled then
	script.Parent:Destroy()
	return
end
if v2 and game:GetService("UserInputService").KeyboardEnabled then
	script.Parent.Changed:connect(function(p1) --[[ Line: 16 | Upvalues: v1 (ref), UserInputService (copy) ]]
		if p1 ~= "Visible" or not game:GetService("UserInputService").KeyboardEnabled then
			return
		end
		if script.Parent.Visible then
			if AlreadyShowedMessage then
				script.Parent.Visible = false
			else
				AlreadyShowedMessage = true
				v1 = UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 23 ]]
					if p1.UserInputType ~= Enum.UserInputType.Keyboard or p1.KeyCode ~= Enum.KeyCode.Up and (p1.KeyCode ~= Enum.KeyCode.Down and (p1.KeyCode ~= Enum.KeyCode.Left and (p1.KeyCode ~= Enum.KeyCode.Right and (p1.KeyCode ~= Enum.KeyCode.W and (p1.KeyCode ~= Enum.KeyCode.A and (p1.KeyCode ~= Enum.KeyCode.S and p1.KeyCode ~= Enum.KeyCode.D)))))) then
						return
					end
					wait(2)
					if not script.Parent then
						return
					end
					script.Parent:Destroy()
				end)
				wait(7)
				script.Parent:Destroy()
			end
		else
			if not v1 then
				return
			end
			v1:disconnect()
			v1 = nil
		end
	end)
else
	if not script.Parent then
		return
	end
	script.Parent:Destroy()
end