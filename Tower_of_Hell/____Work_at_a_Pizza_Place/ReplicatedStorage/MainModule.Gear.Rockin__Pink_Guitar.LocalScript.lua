-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
Debris = game:GetService("Debris")
RunService = game:GetService("RunService")
Camera = game:GetService("Workspace").CurrentCamera
LightningModule = require(Tool:WaitForChild("LightningModule"))
BaseUrl = "http://www.roblox.com/asset/?id="
Animations = {}
LocalObjects = {}
ServerControl = Tool:WaitForChild("ServerControl")
ClientControl = Tool:WaitForChild("ClientControl")
ShiftDown = false
ToolEquipped = false
function SetAnimation(p1, p2) --[[ SetAnimation | Line: 25 ]]
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
function DisableJump(p1) --[[ DisableJump | Line: 46 ]]
	if PreventJump then
		PreventJump:disconnect()
	end
	if not p1 then
		return
	end
	PreventJump = Humanoid.Changed:connect(function(p1) --[[ Line: 51 ]]
		if p1 ~= "Jump" then
			return
		end
		Humanoid.Jump = false
	end)
end
function CheckIfAlive() --[[ CheckIfAlive | Line: 59 ]]
	return Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid.Health > 0 and (Player and Player.Parent))))) and true or false
end
function Equipped(p1) --[[ Equipped | Line: 63 ]]
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	ToolEquipped = true
	if not CheckIfAlive() then
		return
	end
	local PlayerGui = Player:FindFirstChild("PlayerGui")
	if not PlayerGui then
		PlayerMouse = Player:GetMouse()
		p1.Button1Down:connect(function() --[[ Line: 81 ]]
			InvokeServer("MouseClick", {
				Down = true
			})
		end)
		p1.Button1Up:connect(function() --[[ Line: 84 ]]
			InvokeServer("MouseClick", {
				Down = false
			})
		end)
		p1.KeyDown:connect(function(p1_2) --[[ Line: 87 ]]
			local v1 = string.byte(p1_2)
			InvokeServer("KeyPress", {
				Down = true,
				Key = p1_2
			})
			LightningModule.HandleLightning(NoteGuiInfo, p1_2, Player)
			if p1_2 ~= "2" and v1 ~= 50 or not InvokeServer("PlayingMode") then
				return
			end
			local v2 = LightningModule.HandleLightning(NoteGuiInfo, "Start", Player)
			if not v2 then
				return
			end
			InvokeServer("Strike", {
				Value = v2
			})
		end)
		p1.KeyUp:connect(function(p1_2) --[[ Line: 98 ]]
			InvokeServer("KeyPress", {
				Down = false,
				Key = p1_2
			})
		end)
		return
	end
	NoteGuiInfo = LightningModule.CreateGui()
	CurrentGui = NoteGuiInfo.NoteGui
	CurrentGui.Parent = PlayerGui
	Spawn(function() --[[ Line: 76 ]]
		LightningModule.SetupNoteString(NoteGuiInfo)
	end)
	PlayerMouse = Player:GetMouse()
	p1.Button1Down:connect(function() --[[ Line: 81 ]]
		InvokeServer("MouseClick", {
			Down = true
		})
	end)
	p1.Button1Up:connect(function() --[[ Line: 84 ]]
		InvokeServer("MouseClick", {
			Down = false
		})
	end)
	p1.KeyDown:connect(function(p1_2) --[[ Line: 87 ]]
		local v1 = string.byte(p1_2)
		InvokeServer("KeyPress", {
			Down = true,
			Key = p1_2
		})
		LightningModule.HandleLightning(NoteGuiInfo, p1_2, Player)
		if p1_2 ~= "2" and v1 ~= 50 or not InvokeServer("PlayingMode") then
			return
		end
		local v2 = LightningModule.HandleLightning(NoteGuiInfo, "Start", Player)
		if not v2 then
			return
		end
		InvokeServer("Strike", {
			Value = v2
		})
	end)
	p1.KeyUp:connect(function(p1_2) --[[ Line: 98 ]]
		InvokeServer("KeyPress", {
			Down = false,
			Key = p1_2
		})
	end)
end
function Unequipped() --[[ Unequipped | Line: 103 ]]
	ShiftDown = false
	LocalObjects = {}
	Debris:AddItem(CurrentGui, 0)
	for k, v in pairs({ PreventJump, ObjectLocalTransparencyModifier }) do
		if v then
			v:disconnect()
		end
	end
	for k, v in pairs(Animations) do
		if v and v.AnimationTrack then
			v.AnimationTrack:Stop()
		end
	end
	Animations = {}
	ToolEquipped = false
end
function InvokeServer(p1, p2) --[[ InvokeServer | Line: 121 ]]
	local v1 = nil
	pcall(function() --[[ Line: 123 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		v1 = ServerControl:InvokeServer(p1, p2)
	end)
	return v1
end
function OnClientInvoke(p1, p2) --[[ OnClientInvoke | Line: 129 ]]
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
	if p1 == "DisableJump" then
		DisableJump(p2)
		return
	end
	if p1 == "SetLocalTransparencyModifier" and (p2 and ToolEquipped) then
		pcall(function() --[[ Line: 143 | Upvalues: p2 (copy) ]]
			local v1 = false
			for k, v in pairs(LocalObjects) do
				if v == p2 then
					v1 = true
				end
			end
			if v1 then
				return
			end
			table.insert(LocalObjects, p2)
			if ObjectLocalTransparencyModifier then
				ObjectLocalTransparencyModifier:disconnect()
			end
			ObjectLocalTransparencyModifier = RunService.RenderStepped:connect(function() --[[ Line: 155 ]]
				for k, v in pairs(LocalObjects) do
					if v.Object and v.Object.Parent then
						local LocalTransparencyModifier = v.Object.LocalTransparencyModifier
						if not v.AutoUpdate and (LocalTransparencyModifier == 1 or LocalTransparencyModifier == 0) or v.AutoUpdate then
							v.Object.LocalTransparencyModifier = v.Transparency
						end
						continue
					end
					table.remove(LocalObjects, k)
				end
			end)
		end)
		return
	end
	if p1 ~= "ResetNoteGui" or not (CurrentGui and CurrentGui.Parent) then
		return
	end
	LightningModule.EndRiff()
end
ClientControl.OnClientInvoke = OnClientInvoke
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)