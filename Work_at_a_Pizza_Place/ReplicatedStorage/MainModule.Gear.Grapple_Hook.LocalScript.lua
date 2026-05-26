-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
Debris = game:GetService("Debris")
RunService = game:GetService("RunService")
ContentProvider = game:GetService("ContentProvider")
UserInputService = game:GetService("UserInputService")
InputCheck = Instance.new("ScreenGui")
InputCheck.Name = "InputCheck"
InputFrame = Instance.new("Frame")
InputFrame.BackgroundTransparency = 1
InputFrame.Size = UDim2.new(1, 0, 1, 0)
InputFrame.Parent = InputCheck
RbxUtility = require(game.ReplicatedStorage:WaitForChild("RBXUtility"))
Create = RbxUtility.Create
local v1 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
Animations = {}
ServerControl = Tool:WaitForChild("ServerControl")
ClientControl = Tool:WaitForChild("ClientControl")
Rate = 1 / 60
ToolEquipped = false
function SetAnimation(p1, p2) --[[ SetAnimation | Line: 32 ]]
	if not (ToolEquipped and CheckIfAlive()) then
		return
	end
	local function StopAnimation(p1) --[[ StopAnimation | Line: 36 | Upvalues: p2 (copy) ]]
		for k, v in pairs(Animations) do
			if v.Animation == p1 then
				v.AnimationTrack:Stop(p2.EndFadeTime)
				if v.TrackStopped then
					v.TrackStopped:disconnect()
				end
				table.remove(Animations, k)
			end
		end
	end
	if p1 == "PlayAnimation" then
		for k, v in pairs(Animations) do
			if v.Animation == p2.Animation then
				if p2.Speed then
					v.AnimationTrack:AdjustSpeed(p2.Speed)
					return
				end
				if p2.Weight or p2.FadeTime then
					v.AnimationTrack:AdjustWeight(p2.Weight, p2.FadeTime)
					return
				end
				StopAnimation(p2.Animation, false)
			end
		end
		local v1 = Create("Model")({})
		local v2 = Create("StringValue")({
			Name = "Ended"
		})
		local v3 = Humanoid:LoadAnimation(p2.Animation)
		local v4 = nil
		if not p2.Manual then
			v4 = v3.Stopped:connect(function() --[[ Line: 66 | Upvalues: v4 (ref), StopAnimation (copy), p2 (copy), v2 (copy), v1 (copy) ]]
				if not v4 then
					StopAnimation(p2.Animation, true)
					v2.Parent = v1
					return
				end
				v4:disconnect()
				StopAnimation(p2.Animation, true)
				v2.Parent = v1
			end)
		end
		local v5 = Animations
		local t = {
			Animation = p2.Animation,
			AnimationTrack = v3,
			TrackStopped = v4
		}
		table.insert(v5, t)
		v3:Play(p2.FadeTime, p2.Weight, p2.Speed)
		if v4 then
			v1:WaitForChild(v2.Name)
		end
		return v2.Name
	else
		if p1 ~= "StopAnimation" or not p2 then
			return
		end
		StopAnimation(p2.Animation)
	end
end
function CheckIfAlive() --[[ CheckIfAlive | Line: 85 ]]
	return Character and (Character.Parent and (Humanoid and (Humanoid.Parent and (Humanoid.Health > 0 and (Player and Player.Parent))))) and true or false
end
function Equipped(p1) --[[ Equipped | Line: 89 | Upvalues: v1 (copy) ]]
	Character = Tool.Parent
	Player = Players:GetPlayerFromCharacter(Character)
	Humanoid = Character:FindFirstChild("Humanoid")
	ToolEquipped = true
	if CheckIfAlive() then
		Spawn(function() --[[ Line: 97 | Upvalues: p1 (copy), v1 (ref) ]]
			PlayerMouse = Player:GetMouse()
			p1.Button1Down:connect(function() --[[ Line: 99 ]]
				InvokeServer("Button1Click", {
					Down = true
				})
			end)
			p1.Button1Up:connect(function() --[[ Line: 102 ]]
				InvokeServer("Button1Click", {
					Down = false
				})
			end)
			p1.KeyDown:connect(function(p1) --[[ Line: 105 ]]
				InvokeServer("KeyPress", {
					Down = true,
					Key = p1
				})
			end)
			p1.KeyUp:connect(function(p1) --[[ Line: 108 ]]
				InvokeServer("KeyPress", {
					Down = false,
					Key = p1
				})
			end)
			local PlayerGui = Player:FindFirstChild("PlayerGui")
			if PlayerGui then
				InputCheckClone = InputCheck:Clone()
				if v1 then
					InputCheckClone = InputCheck:Clone()
					InputCheckClone.InputButton.InputBegan:connect(function() --[[ Line: 116 ]]
						InvokeServer("Button1Click", {
							Down = true
						})
					end)
					InputCheckClone.InputButton.InputEnded:connect(function() --[[ Line: 119 ]]
						InvokeServer("Button1Click", {
							Down = false
						})
					end)
					InputCheckClone.Parent = PlayerGui
				end
			end
			for k, v in pairs(Tool:GetChildren()) do
				if v:IsA("Animation") then
					ContentProvider:Preload(v.AnimationId)
				end
			end
		end)
	end
end
function Unequipped() --[[ Unequipped | Line: 133 ]]
	if InputCheckClone then
		Debris:AddItem(InputCheckClone, 0)
	end
	for k, v in pairs(Animations) do
		if v and v.AnimationTrack then
			v.AnimationTrack:Stop()
		end
	end
	Animations = {}
	ToolEquipped = false
end
function InvokeServer(p1, p2) --[[ InvokeServer | Line: 146 ]]
	local v1 = nil
	pcall(function() --[[ Line: 148 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		v1 = ServerControl:InvokeServer(p1, p2)
	end)
	return v1
end
function OnClientInvoke(p1, p2) --[[ OnClientInvoke | Line: 154 ]]
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
	if p1 ~= "MousePosition" then
		return
	end
	return if PlayerMouse then {
	Position = PlayerMouse.Hit.p,
	Target = PlayerMouse.Target
} or nil else nil
end
ClientControl.OnClientInvoke = OnClientInvoke
Tool.Equipped:connect(Equipped)
Tool.Unequipped:connect(Unequipped)