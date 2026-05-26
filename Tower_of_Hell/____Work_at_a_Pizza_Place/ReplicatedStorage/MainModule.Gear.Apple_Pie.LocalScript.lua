-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
Animations = {}
ServerControl = Tool:WaitForChild("ServerControl")
ClientControl = Tool:WaitForChild("ClientControl")
ToolEquipped = false
function SetAnimation(p1, p2) --[[ SetAnimation | Line: 15 ]]
	if p1 == "PlayAnimation" and (p2 and (ToolEquipped and Humanoid)) then
		for k, v in pairs(Animations) do
			if v.Animation == p2.Animation then
				v.AnimationTrack:Stop()
				table.remove(Animations, k)
			end
		end
		local v1 = Humanoid:LoadAnimation(p2.Animation)
		local v2 = Animations
		table.insert(v2, {
			Animation = p2.Animation,
			AnimationTrack = v1
		})
		v1:Play(p2.FadeTime, p2.Weight, p2.Speed)
	else
		if p1 ~= "StopAnimation" or not p2 then
			return
		end
		for k, v in pairs(Animations) do
			if v.Animation == p2.Animation then
				v.AnimationTrack:Stop()
				table.remove(Animations, k)
			end
		end
	end
end
function CheckIfAlive() --[[ CheckIfAlive | Line: 36 ]]
	return Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid.Health > 0 and (Player and Player.Parent))))) and true or false
end
function Equipped(p1) --[[ Equipped | Line: 40 ]]
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	ToolEquipped = true
	if CheckIfAlive() then
		PlayerMouse = Player:GetMouse()
		p1.Button1Down:connect(function() --[[ Line: 49 ]]
			InvokeServer("MouseClick", {
				Down = true
			})
		end)
		p1.Button1Up:connect(function() --[[ Line: 52 ]]
			InvokeServer("MouseClick", {
				Down = false
			})
		end)
		p1.KeyDown:connect(function(p1) --[[ Line: 55 ]]
			InvokeServer("KeyPress", {
				Down = true,
				Key = p1
			})
		end)
		p1.KeyUp:connect(function(p1) --[[ Line: 58 ]]
			InvokeServer("KeyPress", {
				Down = false,
				Key = p1
			})
		end)
		p1.Move:connect(function() --[[ Line: 61 | Upvalues: p1 (copy) ]]
			InvokeServer("MouseMove", {
				Position = p1.Hit.p,
				Target = p1.Target
			})
		end)
	end
end
function Unequipped() --[[ Unequipped | Line: 66 ]]
	Animations = {}
	ToolEquipped = false
end
function InvokeServer(p1, p2) --[[ InvokeServer | Line: 71 ]]
	pcall(function() --[[ Line: 72 | Upvalues: p1 (copy), p2 (copy) ]]
		return ServerControl:InvokeServer(p1, p2)
	end)
end
function OnClientInvoke(p1, p2) --[[ OnClientInvoke | Line: 78 ]]
	if p1 == "PlayAnimation" and (p2 and (ToolEquipped and Humanoid)) then
		SetAnimation("PlayAnimation", p2)
		return
	end
	if p1 == "StopAnimation" and p2 then
		SetAnimation("StopAnimation", p2)
		return
	end
	if p1 == "PlaySound" and p2 then
		p2:Play()
		return
	end
	if p1 == "StopSound" and p2 then
		p2:Stop()
		return
	end
	if p1 == "MousePosition" then
		return {
			Position = PlayerMouse.Hit.p,
			Target = PlayerMouse.Target
		}
	end
end
ClientControl.OnClientInvoke = OnClientInvoke
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)