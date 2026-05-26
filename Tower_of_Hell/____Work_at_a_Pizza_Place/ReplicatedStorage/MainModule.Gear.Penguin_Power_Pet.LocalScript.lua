-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
Slide = Tool:WaitForChild("Slide")
ClientControl = Tool:WaitForChild("ClientControl")
ServerControl = Tool:WaitForChild("ServerControl")
function ServerControl.OnClientInvoke(p1, p2) --[[ Line: 13 ]]
	if p1 ~= "Animation" then
		return Humanoid.TargetPoint
	end
	if p2 then
		SlideAnim = Humanoid:LoadAnimation(Slide)
		if SlideAnim then
			SlideAnim:Play()
		end
	elseif not p2 and SlideAnim then
		SlideAnim:Stop()
	end
end
function Click(p1) --[[ Click | Line: 30 ]]
	if Player and (Humanoid and Humanoid.Health ~= 0) then
		pcall(function() --[[ Line: 34 | Upvalues: p1 (copy) ]]
			ClientControl:InvokeServer("Click", p1)
		end)
	end
end
function Equipped(p1) --[[ Equipped | Line: 39 ]]
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	if Player and (Humanoid and Humanoid.Health ~= 0) then
		p1.Button1Down:connect(function() --[[ Line: 46 ]]
			Click(true)
		end)
		p1.Button1Up:connect(function() --[[ Line: 49 ]]
			Click(false)
		end)
	end
end
function Unequipped() --[[ Unequipped | Line: 54 ]]
	PlayerMouse = nil
	if not SlideAnim then
		return
	end
	SlideAnim:Stop()
end
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)