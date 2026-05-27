-- https://lua.expert/
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Lobby = Workspace:WaitForChild("Lobby")
local LocalPlayer = Players.LocalPlayer
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
function createBeam(p1, p2) --[[ createBeam | Line: 12 | Upvalues: LocalPlayer (copy), Workspace (copy) ]]
	repeat
		wait()
	until LocalPlayer.Character and LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	if Workspace:FindFirstChild("TutorialParts") then
		Workspace.TutorialParts:Destroy()
	end
	if p1 == "Destroy" then
		return
	end
	local v1
	if Workspace:FindFirstChild("TutorialParts") then
		v1 = Workspace.TutorialParts
	else
		local TutorialParts = Instance.new("Folder")
		TutorialParts.Name = "TutorialParts"
		TutorialParts.Parent = Workspace
		v1 = TutorialParts
	end
	local Beam = Instance.new("Beam", v1)
	Beam.Texture = "rbxassetid://18705278858"
	Beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 4))
	Beam.Transparency = NumberSequence.new(0)
	Beam.TextureSpeed = -1
	Beam.TextureLength = 10
	Beam.Width0 = 8
	Beam.Width1 = 8
	Beam.TextureMode = Enum.TextureMode.Static
	Beam.FaceCamera = true
	local Part = Instance.new("Part", v1)
	Part.Anchored = true
	Part.Transparency = 1
	Part.CanCollide = false
	Part.Position = p1
	local Attachment = Instance.new("Attachment", Part)
	local Part_2 = Instance.new("Part", v1)
	Part_2.Anchored = false
	Part_2.Transparency = 1
	Part_2.CanCollide = false
	Part_2.Position = LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position
	local WeldConstraint = Instance.new("WeldConstraint", Part_2)
	WeldConstraint.Part0 = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	WeldConstraint.Part1 = Part_2
	local Attachment_2 = Instance.new("Attachment", Part_2)
	Beam.Attachment0 = Attachment
	Beam.Attachment1 = Attachment_2
end
repeat
	task.wait()
until LocalPlayer:FindFirstChild("ProfileLoaded")
local v1 = ClientState.GetData()
ReplicatedStorage.Remotes.Main.Exit.OnClientEvent:Connect(function() --[[ Line: 72 ]]
	task.spawn(createBeam, "Destroy")
end)
if v1.Tutorial then
	return
end
local v2 = false
GuiService.MenuOpened:Connect(function() --[[ Line: 78 | Upvalues: v2 (ref), ReplicatedStorage (copy), LocalPlayer (copy), Workspace (copy), TweenService (copy) ]]
	if not v2 then
		v2 = true
		local v1 = ReplicatedStorage.Objects.TutorialPresent:Clone()
		local v22, v3 = LocalPlayer.Character:GetBoundingBox()
		local v5 = v22 - Vector3.new(0, v3.Y / 2, 0)
		local _, v6 = v1:GetBoundingBox()
		v1:PivotTo(v5 + Vector3.new(0, v6.Y / 2, 0))
		v1.Parent = Workspace
		v1.Humanoid.Animator:LoadAnimation(v1.Animation):Play()
		local v8 = Instance.new("NumberValue")
		v8.Value = 1
		v8.Changed:Connect(function() --[[ Line: 98 | Upvalues: v1 (copy), v8 (copy) ]]
			v1:ScaleTo(v8.Value)
		end)
		v1.Hitbox.ClickDetector.MouseHoverEnter:Connect(function() --[[ Line: 102 | Upvalues: TweenService (ref), v8 (copy) ]]
			TweenService:Create(v8, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Value = 1.25
			}):Play()
		end)
		v1.Hitbox.ClickDetector.MouseHoverLeave:Connect(function() --[[ Line: 106 | Upvalues: TweenService (ref), v8 (copy) ]]
			TweenService:Create(v8, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Value = 1
			}):Play()
		end)
		v1.Hitbox.ClickDetector.MouseClick:Connect(function() --[[ Line: 110 | Upvalues: ReplicatedStorage (ref), TweenService (ref), v8 (copy), v1 (copy) ]]
			ReplicatedStorage.Remotes.Misc.Tutorial:FireServer("Present")
			local v12 = TweenService:Create(v8, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Value = 0.75
			})
			v12:Play()
			v12.Completed:Wait()
			local v2 = TweenService:Create(v8, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Value = 1
			})
			v2:Play()
			v2.Completed:Wait()
			v1:Destroy()
		end)
	end
end)
Instance.new("StringValue", LocalPlayer).Name = "InTutorial"
createBeam(Lobby.Tutorial.Tutorial1.Position)
repeat
	task.wait()
until not LocalPlayer:FindFirstChild("InTutorial")
createBeam(Lobby.Tutorial.Tutorial2.Position)
repeat
	task.wait(0.1)
until (Lobby.Tutorial.Tutorial2.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15
createBeam(Lobby.Tutorial.Tutorial3.Position)
ReplicatedStorage.Remotes.Misc.Tutorial:FireServer()