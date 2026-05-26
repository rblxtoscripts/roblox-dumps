-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
RemoteControl = Tool:WaitForChild("RemoteControl")
ServerControl = RemoteControl:WaitForChild("ServerControl")
ClientControl = RemoteControl:WaitForChild("ClientControl")
ToolEquipped = false
MouseControls = {}
function ClientControl.OnClientInvoke(p1, p2) --[[ Line: 16 ]]
	if p1 == "PlaySound" and p2 then
		p2:Play()
		return
	end
	if p1 == "PlaySound" and p2 then
		p2:Play()
		return
	end
	if p1 == "MousePosition" then
		return PlayerMouse.Hit.p
	end
end
function InvokeServer(p1, p2) --[[ InvokeServer | Line: 26 ]]
	local v1 = nil
	pcall(function() --[[ Line: 28 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		v1 = ServerControl:InvokeServer(p1, p2)
	end)
	return v1
end
function CheckIfAlive() --[[ CheckIfAlive | Line: 34 ]]
	return Player and (Player.Parent and (Humanoid and (Humanoid.Parent and Humanoid.Health > 0))) and true or false
end
function Equipped(p1) --[[ Equipped | Line: 38 ]]
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	ToolEquipped = true
	if not CheckIfAlive() then
		return
	end
	PlayerMouse = p1
	for k, v in pairs(MouseControls) do
		if v then
			v:disconnect()
		end
	end
	MouseControls = {}
	MouseDown = PlayerMouse.Button1Down:connect(function() --[[ Line: 53 ]]
		InvokeServer("MouseClick", {
			Down = true
		})
	end)
	MouseUp = PlayerMouse.Button1Up:connect(function() --[[ Line: 56 ]]
		InvokeServer("MouseClick", {
			Down = false
		})
	end)
end
function Unequipped() --[[ Unequipped | Line: 61 ]]
	ToolEquipped = false
	for k, v in pairs(MouseControls) do
		if v then
			v:disconnect()
		end
	end
	MouseControls = {}
end
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)