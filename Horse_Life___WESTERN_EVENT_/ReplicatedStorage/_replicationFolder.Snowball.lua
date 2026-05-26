-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PromptClient")
local v4 = Sonar("NotificationsClient")
local v5 = Sonar("ColorCorrectionUtils")
local v6 = Sonar("GuiManager")
local v7 = Sonar("spr")
local v8 = Sonar("PlayerWrapper").GetClient()
local v9 = Sonar("Animal")
local v10 = Sonar("Constants")
local Snowball = ReplicatedStorage:WaitForChild("Storage").Assets.Snowball
local v11 = v2.GetRemoteFunction("EndSnowmanMinigame")
local v12 = false
local SFX = game.ReplicatedStorage.Storage.SFX
local t2 = { 35, 25, 15 }
function t.NewBall(p1) --[[ NewBall | Line: 43 | Upvalues: v1 (copy), Snowball (copy), t2 (copy), v7 (copy), v11 (copy), v3 (copy), v6 (copy), v12 (ref) ]]
	p1.BallMaid = v1.new()
	p1.Ball = Instance.new("Part")
	p1.Ball.Shape = Enum.PartType.Ball
	p1.Ball.Name = p1.Stage
	p1.Ball.Size = Vector3.new(5, 5, 5)
	p1.Ball.CFrame = workspace.Events.Christmas.SnowmanDesign.SpawnPart.CFrame
	p1.Particle = Snowball.Snowfall:Clone()
	p1.Particle.Parent = p1.Ball
	p1.Highlight = Instance.new("Highlight")
	p1.Highlight.FillTransparency = 1
	p1.Highlight.OutlineColor = Color3.fromRGB(120, 226, 255)
	p1.Highlight.Parent = p1.Ball
	p1.Attachment = Instance.new("Attachment")
	p1.Attachment.Parent = p1.Ball
	p1.Ball.Massless = true
	p1.Ball.Material = Enum.Material.Snow
	p1.Ball.Color = Color3.fromRGB(255, 255, 255)
	p1.Ball.Parent = workspace
	p1.Rope = Instance.new("RopeConstraint")
	p1.Rope.Attachment0 = workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment
	p1.Rope.Attachment1 = p1.Attachment
	p1.Rope.Length = 150
	p1.Rope.Restitution = 1
	p1.Rope.Parent = workspace.Events.Christmas.SnowmanDesign.Snowman
	p1.Rope2 = Instance.new("RopeConstraint")
	p1.Rope2.Attachment0 = p1.Attachment
	p1.Rope2.Attachment1 = p1.Horse.Model:FindFirstChild("Hind", true)
	p1.Rope2.Length = 50
	p1.Rope2.Restitution = 1
	p1.Rope2.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	p1.Ball:AddTag("Snowball")
	p1.Maid:GiveTask(p1.BallMaid)
	p1.BallMaid:GiveTask(p1.Ball)
	p1.BallMaid:GiveTask(p1.Rope)
	p1.BallMaid:GiveTask(p1.Attachment)
	p1.BallMaid:GiveTask(p1.Particle)
	p1.BallMaid:GiveTask(p1.Rope2)
	p1.LastRewardTick = 0
	p1.Score = 5
	p1.Maid:GiveTask(task.spawn(function() --[[ Line: 95 | Upvalues: p1 (copy), t2 (ref), v7 (ref) ]]
		while true do
			repeat
				task.wait(1)
			until (p1.LastRewardTick == 0 or tick() - p1.LastRewardTick > 1) and p1.Ball.AssemblyLinearVelocity.Magnitude >= 2
			local v1 = p1
			v1.Score = v1.Score + 0.5
			local v3 = math.clamp(p1.Score, 0, t2[p1.Stage])
			p1.Particle:Emit(5)
			if p1.Score >= t2[p1.Stage] then
				p1.Highlight.OutlineColor = Color3.fromRGB(68, 255, 0)
			end
			v7.target(p1.Ball, 1, 0.3, {
				Size = Vector3.new(v3, v3, v3)
			})
		end
	end))
	p1.BallMaid:GiveTask(function() --[[ Line: 119 | Upvalues: p1 (copy), v11 (ref), v3 (ref), v6 (ref), v12 (ref) ]]
		if p1.Stage == 3 then
			if v11:InvokeServer() ~= true then
				return
			end
			v3.Prompt({
				Type = "MinigameComplete",
				Setup = function(p1) --[[ Setup | Line: 126 ]]
					p1.Content.Earned.TextLabel.Text = 100
					p1.Content.CompleteAmount.TextLabel.Text = "Good job building the snowman!"
				end,
				Run = function() --[[ Run | Line: 130 | Upvalues: v6 (ref), v12 (ref), p1 (ref) ]]
					v6.OpenHUD()
					task.delay(5, function() --[[ Line: 133 ]]
						workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Enabled = false
						workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Frame.TextLabel.Text = "Completion:" .. 0 .. "%"
					end)
					workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Frame.TextLabel.Text = "Completion:" .. 100 .. "%"
					v12 = false
					p1.Maid:DoCleaning()
					return true
				end
			})
		else
			if p1.Stage == "Finish" then
				return
			end
			local v1 = p1
			v1.Stage = v1.Stage + 1
			p1.Score = 0
			p1:NewBall()
		end
	end)
end
function t.IsRunning() --[[ IsRunning | Line: 160 | Upvalues: v12 (ref) ]]
	return v12
end
function t.Start() --[[ Start | Line: 164 | Upvalues: t (ref), v12 (ref), v1 (copy), v8 (copy), v9 (copy), v4 (copy), t2 (copy), v5 (copy), SFX (copy), v6 (copy), v2 (copy), v10 (copy) ]]
	local v22 = setmetatable({}, t)
	if v12 then
		return
	end
	v12 = true
	v22.Maid = v1.new()
	if not v8.CurrentHorse then
		local v3 = nil
		for v42, v52 in v9.GetAllAnimals() do
			v3 = v52
			break
		end
		if not v3 then
			v4.Notify({
				Message = "You must be on a horse to start this minigame! ",
				Preset = "Red"
			})
			return
		end
		v3:_sit(game.Players.LocalPlayer.Character.Humanoid)
	end
	v22.Horse = v8.CurrentHorse
	v22.Stage = 1
	for v62, v7 in workspace.Events.Christmas.SnowmanDesign.Snowman:GetChildren() do
		if v7.Name ~= "Hitbox" then
			v7.Material = Enum.Material.ForceField
			v7.Color = Color3.fromRGB(255, 17, 17)
			for v82, v92 in v7:GetChildren() do
				v92.Transparency = 1
			end
		end
	end
	v22.Maid:GiveTask(workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Touched:Connect(function(p1) --[[ Line: 209 | Upvalues: v22 (copy), t2 (ref), v5 (ref), v4 (ref), SFX (ref) ]]
		if not (p1:HasTag("Snowball") and v22.Score >= t2[v22.Stage]) then
			return
		end
		local v1 = workspace.Events.Christmas.SnowmanDesign.Snowman:FindFirstChild(v22.Stage)
		if not v1 then
			return
		end
		v1.Material = Enum.Material.Snow
		v1.Color = Color3.fromRGB(255, 255, 255)
		for v2, v3 in v1:GetChildren() do
			v3.Transparency = 0
		end
		v5:Tween()
		v4.Notify({
			Message = "Snowball turned in!",
			Preset = "Green"
		})
		v22.BallMaid:DoCleaning()
		SFX.NodeCompleted:Play()
		workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Enabled = true
		local TextLabel = workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Frame.TextLabel
		TextLabel.Text = "Completion:" .. math.floor((v22.Stage - 1) / 3 * 100) .. "%"
		workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Confetti:Emit(20)
	end))
	v22.Maid:GiveTask(function() --[[ Line: 241 | Upvalues: v22 (copy) ]]
		setmetatable(v22, nil)
	end)
	v22.Maid:GiveTask(v22.Horse.Model:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 245 | Upvalues: v12 (ref), v22 (copy), v6 (ref), v4 (ref), v2 (ref) ]]
		v12 = false
		v22.Stage = "Finish"
		v22.Maid:DoCleaning()
		v6.OpenHUD()
		workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Enabled = false
		workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Frame.TextLabel.Text = "Completion:" .. 0 .. "%"
		v4.Notify({
			Message = "Minigame ended.",
			Preset = "Red"
		})
		v2.GetRemoteFunction("EndSnowmanEarly"):InvokeServer()
	end))
	v22.Maid:GiveTask(v10.ResetBindable.Event:Connect(function(p1) --[[ Line: 262 | Upvalues: v12 (ref), v22 (copy), v6 (ref), v4 (ref), v2 (ref) ]]
		v12 = false
		v22.Stage = "Finish"
		v22.Maid:DoCleaning()
		v6.OpenHUD()
		workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Enabled = false
		workspace.Events.Christmas.SnowmanDesign.Snowman.Hitbox.Attachment.CompletionPrecent.Frame.TextLabel.Text = "Completion:" .. 0 .. "%"
		v4.Notify({
			Message = "Minigame ended.",
			Preset = "Red"
		})
		v2.GetRemoteFunction("EndSnowmanEarly"):InvokeServer()
	end))
	v4.Notify({
		Message = "Roll the snowball till its big enough to turn in at the snowman!",
		Preset = "Green"
	})
	v22:NewBall()
	return v22
end
return t