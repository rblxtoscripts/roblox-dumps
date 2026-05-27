-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("CameraShaker")
local v7 = Sonar("Constants")
local LocalPlayer = game.Players.LocalPlayer
local SFX = game.ReplicatedStorage.Storage.SFX
local Candycane = ReplicatedStorage.Storage.Assets.Events.Christmas2024.Candycane
local Whitecandycane = ReplicatedStorage.Storage.Assets.Events.Christmas2024.Whitecandycane
local Greencandycane = ReplicatedStorage.Storage.Assets.Events.Christmas2024.Greencandycane
local v8 = v4.GetRemoteFunction("PickupPumpkin")
local CurrentCamera = workspace.CurrentCamera
local v9 = v6.new(Enum.RenderPriority.Camera.Value + 1, "PumpkinMinigameShaker", function(p1) --[[ Line: 25 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v9:Start()
local t = {}
t.__index = t
function t.Init() --[[ Init | Line: 34 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("Pumpkin", t):Init()
end
function t.new(p1) --[[ new | Line: 39 | Upvalues: t (copy), v2 (copy), LocalPlayer (copy), Greencandycane (copy), Whitecandycane (copy), Candycane (copy), v3 (copy), v8 (copy), v9 (copy), v6 (copy), SFX (copy), TweenService (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	if p1:WaitForChild("Data").Owner.Value == LocalPlayer.Name then
		v22.Object.Point.Flare:Emit(1)
		v22.Size = p1:WaitForChild("Data").Size.Value * 2
		v22.Type = p1:WaitForChild("Data").Type.Value
		if v22.Type == "Haunted" then
			v22.Model = Greencandycane:Clone()
		elseif v22.Type == "White" then
			v22.Model = Whitecandycane:Clone()
		else
			v22.Model = Candycane:Clone()
		end
		v22.Model.Size = Vector3.new(v22.Size, v22.Size, v22.Size)
		local v52 = p1.CFrame + Vector3.new(0, v22.Model.Size.Z / 2, 0)
		v22.Model:PivotTo(v52 * CFrame.Angles(0, math.rad((math.random(0, 360))), 0))
		v22.Model.Parent = workspace
		v22.Maid:GiveTask(v22.Model)
		v22.Weld = Instance.new("WeldConstraint")
		v22.Weld.Part0 = p1
		v22.Weld.Part1 = v22.Model
		v22.Weld.Parent = p1
		v22.Holding = false
		v22.Maid:GiveTask(v22.Object.Data.Holding:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
			v22.Holding = v22.Object.Data.Holding.Value
		end))
		if v22.Type == "Special" then
			for v7, v82 in v22.Model.Attachment:GetChildren() do
				v82.Enabled = true
			end
		end
		v22.Maid:GiveTask(v3.new(v22.Model, {
			ShowHintLabel = true,
			Hint = "Pickup",
			Run = function() --[[ Run | Line: 83 | Upvalues: v8 (ref), p1 (copy), v9 (ref), v6 (ref), SFX (ref), v22 (copy), LocalPlayer (ref), TweenService (ref), v5 (ref) ]]
				if v8:InvokeServer(p1) then
					v9:Shake(v6.Presets.SmallRotationBump)
					SFX.Pop:Play()
					v22.Object.Particle:Emit(15)
					v22.Object.CanCollide = true
					v22.Beam = Instance.new("Beam")
					v22.Beam.Parent = v22.Object
					v22.Beam.FaceCamera = true
					v22.Beam.Color = ColorSequence.new(Color3.fromRGB(56, 91, 156))
					v22.Beam.Width0 = 0.5
					v22.Beam.Width1 = 0.5
					v22.Beam.Attachment0 = v22.Object.Point
					v22.Beam.Attachment1 = LocalPlayer.Character.HumanoidRootPart.RootAttachment
					v22.Maid:GiveTask(v22.Beam)
					local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Elastic)
					local t = {}
					t.Size = Vector3.new(v22.Size + 1, v22.Size + 4, v22.Size + 1)
					TweenService:Create(v22.Model, v2, t):Play()
					task.wait(0.2)
					local v7 = TweenInfo.new(0.1, Enum.EasingStyle.Bounce)
					local t2 = {}
					t2.Size = Vector3.new(v22.Size, v22.Size, v22.Size)
					TweenService:Create(v22.Model, v7, t2):Play()
				else
					v5.NotifyIssue("CantPickup")
				end
			end,
			GetRange = function() --[[ GetRange | Line: 117 ]]
				return 15
			end,
			Visibility = function() --[[ Visibility | Line: 121 | Upvalues: v22 (copy) ]]
				return not v22.Holding
			end
		}))
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 130 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
v7.ResetBindable.Event:Connect(function(p1) --[[ Line: 136 | Upvalues: v4 (copy) ]]
	v4.GetRemoteEvent("RemovePumpkin"):FireServer()
end)
t.Init()
return t