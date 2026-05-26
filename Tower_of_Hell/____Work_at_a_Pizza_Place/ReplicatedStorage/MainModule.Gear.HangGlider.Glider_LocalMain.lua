-- https://lua.expert/
RbxUtility = require(game.ReplicatedStorage:WaitForChild("RBXUtility"))
local Create = RbxUtility.Create
local v1 = script.Parent
local v2 = false
local v3 = false
local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
local v8 = nil
local v9 = nil
local v10 = nil
local v11 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
local HangGliderHelp = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Notifications"):WaitForChild("HangGliderHelp")
local v12 = nil
local v13 = nil
local v14 = nil
local v15 = nil
local function BeginFlight() --[[ BeginFlight | Line: 31 | Upvalues: v7 (ref), v3 (ref), v1 (copy), v11 (copy), v6 (ref), v12 (ref), Create (copy), v13 (ref), v9 (ref), v14 (ref), v15 (ref) ]]
	v7.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
	wait(0.2)
	if v3 then
		return
	end
	v3 = true
	game.Workspace.CurrentCamera.CameraSubject = v1.Handle
	if not (v11 or _G.GamepadEnabled) then
		game.Workspace.CurrentCamera.CameraType = "Track"
	end
	v6.Sit = true
	v12 = Create("BodyGyro")({
		maxTorque = Vector3.new(0, 0, 0),
		Parent = v7,
		cframe = v7.CFrame
	})
	v13 = Create("BodyForce")({
		force = Vector3.new(0, 0, 0),
		Parent = v7
	})
	Spawn(function() --[[ Line: 50 | Upvalues: v12 (ref) ]]
		for i = 0, 1, 0.1 do
			v12.maxTorque = Vector3.new(i * 10000, i * 10000, i * 10000)
		end
	end)
	v9:Play(0.3)
	v14 = (v7.CFrame - v7.CFrame.p) * CFrame.Angles(0, 0, 0.01)
	if _G.GamepadEnabled then
		return
	end
	if v11 then
		v15.Frame.Visible = false
	else
		v15.Frame.Visible = true
		v15.Frame.Message.Text = "Click and Hold to direct yourself.\nJump to stop gliding."
	end
end
local function EndFlight() --[[ EndFlight | Line: 71 | Upvalues: v3 (ref), v4 (ref), v9 (ref), v6 (ref), v12 (ref), v13 (ref), v7 (ref), v15 (ref), v11 (copy) ]]
	v3 = false
	game.Workspace.CurrentCamera.CameraSubject = v4
	game.Workspace.CurrentCamera.CameraType = "Custom"
	v9:Stop(0.3)
	v6.Sit = false
	v12:Destroy()
	v13:Destroy()
	v7.RotVelocity = Vector3.new(0, 0, 0)
	v7.CFrame = CFrame.new(v7.Position)
	if _G.GamepadEnabled then
		return
	end
	v15.Frame.Visible = true
	if v11 then
		v15.Frame.Message.Text = "Tap to Glide."
	else
		v15.Frame.Message.Text = "Click to Glide."
	end
end
local function v16(p1) --[[ GetMassOf | Line: 92 | Upvalues: v16 (copy) ]]
	if p1:IsA("BasePart") then
		return p1:GetMass()
	end
	local sum = 0
	for k, v in pairs(p1:GetChildren()) do
		sum = sum + v16(v)
	end
	return sum
end
local v17 = tick()
local function DropBomb() --[[ DropBomb | Line: 107 | Upvalues: v3 (ref), v17 (ref), v10 (ref), Create (copy), v4 (ref), v1 (copy), v5 (ref) ]]
	if not v3 then
		return
	end
	if not (tick() - v17 > 0.8) then
		return
	end
	v17 = tick()
	v10:Play()
	local v12 = Create("Part")({
		Size = Vector3.new(1, 2, 1),
		TopSurface = "Smooth",
		BottomSurface = "Smooth",
		Archivable = false,
		Position = (v4["Left Arm"].CFrame * CFrame.new(0, -1, 0)).p - Vector3.new(0, 2, 0),
		Create("SpecialMesh")({
			MeshId = "http://www.roblox.com/asset/?id=90793198",
			TextureId = "http://www.roblox.com/asset/?id=90793278"
		}),
		Create("Sound")({
			Name = "ExplodeSound",
			SoundId = "rbxasset://sounds//Rocket shot.wav"
		})
	})
	local v2 = v1.MineScript:Clone()
	v2.Disabled = false
	v2.creator.Value = v5
	v2.Parent = v12
	v12.Parent = game.Workspace
end
local function Slerp(p1, p2, p3) --[[ Slerp | Line: 141 ]]
	local v2 = math.acos((math.min(1, p2:Dot(p3))))
	if v2 < 0.01 then
		return (1 - p1) * p2 + p1 * p3
	else
		return math.sin((1 - p1) * v2) / math.sin(v2) * p2 + math.sin(p1 * v2) / math.sin(v2) * p3
	end
end
while not v1:FindFirstChild("Handle") do
	wait()
end
v1.Handle.Touched:connect(function(p1) --[[ Line: 154 | Upvalues: v2 (ref), v4 (ref), v3 (ref), EndFlight (copy) ]]
	if not v2 or (p1:IsDescendantOf(v4) or not (v3 and p1.Transparency < 1)) then
		return
	end
	EndFlight()
end)
v1.Equipped:connect(function(p1) --[[ Line: 162 | Upvalues: HangGliderHelp (copy), v4 (ref), v1 (copy), v5 (ref), v6 (ref), v7 (ref), v2 (ref), v8 (ref), v9 (ref), v10 (ref), v3 (ref), BeginFlight (copy), EndFlight (copy), v15 (ref), Create (copy), v11 (copy), v14 (ref), Slerp (copy), v12 (ref), v16 (copy), v13 (ref) ]]
	if _G.GamepadEnabled then
		HangGliderHelp.Visible = true
	end
	v4 = v1.Parent
	v5 = game.Players:GetPlayerFromCharacter(v4)
	v6 = v4.Humanoid
	v7 = v4.HumanoidRootPart
	local v17 = if v6.RigType == Enum.HumanoidRigType.R15 then "R15" else "R6"
	v2 = true
	v8 = v6:LoadAnimation(v1.ANIM_Hold)
	v9 = v17 == "R6" and v6:LoadAnimation(v1.ANIM_Fly) or v6:LoadAnimation(v1.ANIM_FlyR15)
	v10 = v6:LoadAnimation(v1.ANIM_Bomb)
	v8:Play()
	local v32 = false
	p1.Button1Down:connect(function() --[[ Line: 183 | Upvalues: v32 (ref), v3 (ref), BeginFlight (ref) ]]
		v32 = true
		if v3 then
			return
		end
		BeginFlight()
	end)
	p1.Button1Up:connect(function() --[[ Line: 189 | Upvalues: v32 (ref) ]]
		v32 = false
	end)
	p1.KeyDown:connect(function(p1) --[[ Line: 192 | Upvalues: v3 (ref), EndFlight (ref) ]]
		if p1 == " " then
			if v3 then
				EndFlight()
			end
		else
			if p1:byte() == 48 or (p1:byte() == 45 or (p1:byte() == 50 or (p1:byte() == 52 or (p1:byte() == 13 or p1:lower() == "q")))) then
				return
			end
			local _ = p1:lower() == "e"
		end
	end)
	if not _G.GamepadEnabled then
		v15 = Create("ScreenGui")({
			Name = "GliderGui",
			Parent = v5.PlayerGui,
			Create("Frame")({
				Name = "Frame",
				Style = "RobloxRound",
				Position = UDim2.new(0.5, -125, 1, -170),
				Size = UDim2.new(0, 250, 0, 80),
				Create("TextLabel")({
					Name = "Message",
					TextWrapped = true,
					BackgroundTransparency = 1,
					Font = "Arial",
					FontSize = "Size14",
					Text = "Click to Glide",
					TextColor3 = Color3.new(0.9, 0.9, 0.9),
					Size = UDim2.new(1, 0, 1, 0)
				})
			})
		})
		if v11 then
			v15.Frame.Message.Text = "Tap to glide"
		end
	end
	local v42 = tick()
	while true do
		local v52 = tick()
		local v62 = v52 - v42
		v42 = v52
		if v3 then
			local v72 = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(0.6, 0, 0)
			if v32 or v11 then
				v14 = CFrame.new(Vector3.new(0, 0, 0), (Slerp(math.min(1, 1.5 * v62 / math.acos((v14.lookVector:Dot(v72.lookVector)))), v14.lookVector, v72.lookVector)))
			end
			local Velocity = v7.Velocity
			local v112 = Velocity - Vector3.new(0, Velocity.y, 0)
			local lookVector = v14.lookVector
			local unit = (lookVector - Vector3.new(0, lookVector.y, 0)).unit
			local Angles = CFrame.Angles
			v12.cframe = v14 * Angles(0, 0, v7.RotVelocity.y / 3 * (1 - math.abs(lookVector.y) ^ 2)) * CFrame.Angles(-1.5707963267948966, 0, 0)
			math.max(0, Velocity.magnitude)
			local v162 = v16(v4) * 20 * 9.81
			local _ = (Velocity.magnitude / 10) ^ 2 * v162
			local v19 = if lookVector.y < 0 then (-lookVector.y) ^ 2 else 0
			local v20 = Vector3.new(0, v162 * (1 - v19 + 0.3 * lookVector.y), 0) + unit * (v162 * 1 * math.max(0, 0.5 * -lookVector.y + 0.6)) - v112.unit * ((v112.magnitude / 35) ^ 2 * v162)
			local v21 = v20 - Vector3.new(0, Velocity.y, 0).unit * ((Velocity.y / 15) ^ 2 * v162)
			if v21.Y < 10000 then
				v13.force = v21
			end
		end
		wait()
	end
end)
v1.Unequipped:connect(function() --[[ Line: 290 | Upvalues: HangGliderHelp (copy), v3 (ref), EndFlight (copy), v2 (ref), v15 (ref), v8 (ref), v9 (ref), v10 (ref) ]]
	HangGliderHelp.Visible = false
	if v3 then
		EndFlight()
	end
	v2 = false
	if v15 then
		v15:Destroy()
	end
	v8:Stop()
	v9:Stop()
	v10:Stop()
end)