-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("PromptClient")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("TimeUtils")
local v9 = Sonar("ColorCorrectionUtils")
local v10 = Sonar("GuiManager")
local v11 = Sonar("Animal")
local v12 = Sonar("ContextualUtils")
local t = {}
t.__index = t
local v13 = Sonar("Constants")
local Royal2025 = v13.Royal2025
local SFX = game.ReplicatedStorage.Storage.SFX
local LocalPlayer = game.Players.LocalPlayer
local v14 = Sonar("PlayerWrapper").GetClient()
local v15 = v4.GetRemoteEvent("StartPresentMinigame")
local v16 = false
local v17 = false
local t2 = {
	Orange = Color3.fromRGB(255, 145, 48),
	Red = Color3.fromRGB(255, 0, 4),
	Pink = Color3.fromRGB(255, 83, 195),
	White = Color3.fromRGB(255, 255, 255)
}
function t.End(p1) --[[ End | Line: 38 | Upvalues: v6 (copy), Royal2025 (copy), v10 (copy), v17 (ref) ]]
	p1.DeliveryMaid:DoCleaning()
	v6.Prompt({
		Type = "MinigameComplete",
		Setup = function(p1) --[[ Setup | Line: 43 | Upvalues: Royal2025 (ref) ]]
			p1.Content.Earned.TextLabel.Text = 100
			p1.Content.CompleteAmount.TextLabel.Text = "All " .. Royal2025.MinigameData.DeliveryType .. " delivered!"
		end,
		Run = function() --[[ Run | Line: 47 | Upvalues: v10 (ref), v17 (ref) ]]
			v10.OpenHUD()
			v17 = false
			return true
		end
	})
	for v1, v2 in workspace.Events.DeliveryMinigame.DeliveryNodes:GetChildren() do
		v2.TutorialBeam.Enabled = false
	end
	p1.Maid:DoCleaning()
end
function t.IsRunning() --[[ IsRunning | Line: 61 | Upvalues: v16 (ref) ]]
	return v16
end
function t.Start(p1, p2, p3) --[[ Start | Line: 65 | Upvalues: v2 (copy), Royal2025 (copy), t2 (copy), v3 (copy), v4 (copy), v7 (copy), v9 (copy), SFX (copy), v16 (ref) ]]
	for v1, v22 in p2 do
		local v32 = nil
		for v42, v5 in p3 do
			if v5.Color == v1 then
				v32 = v5
				break
			end
		end
		local t = {
			Rope = Instance.new("RopeConstraint"),
			Maid = v2.new(),
			PresentModel = Royal2025.MinigameData.DeliveryModels:FindFirstChild(v1):Clone(),
			Spot = v32,
			GhostPresent = Royal2025.MinigameData.GhostDeliveryModel:Clone(),
			Beam = Instance.new("Beam")
		}
		t.Rope.Attachment0 = t.PresentModel.Attachment
		t.Rope.Attachment1 = p1.Horse.Model:FindFirstChild("Hind", true)
		t.Rope.Length = 25
		t.Rope.Restitution = 1
		t.Rope.Parent = t.PresentModel
		t.PresentModel:PivotTo(p1.Horse.Model:GetPivot())
		t.PresentModel.Parent = workspace
		t.Beam.Attachment0 = t.PresentModel.Attachment
		t.Beam.Attachment1 = p1.Horse.Model:FindFirstChild("Hind", true)
		t.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 61, 61))
		t.Beam.Texture = "rbxassetid://9076814128"
		t.Beam.TextureMode = Enum.TextureMode.Static
		t.Beam.FaceCamera = true
		t.Beam.Parent = t.PresentModel
		t.Maid:GiveTask(t.PresentModel)
		t.Maid:GiveTask(t.Rope)
		t.Maid:GiveTask(t.Beam)
		p1.Maid:GiveTask(t.Maid)
		p1.Maid:GiveTask(function() --[[ Line: 108 | Upvalues: p1 (copy), v1 (copy) ]]
			p1.Presents[v1] = nil
		end)
		t.GhostPresent.CFrame = t.Spot.Location.CFrame
		t.GhostPresent.Color = t2[t.PresentModel.Name]
		t.GhostPresent.Parent = workspace
		t.Maid:GiveTask(t.GhostPresent)
		p1.Presents[v1] = t
	end
	for v6, v72 in workspace.Events.DeliveryMinigame.DeliveryNodes:GetChildren() do
		v72.TutorialBeam.Enabled = true
		local v8 = false
		p1.DeliveryMaid:GiveTask(v3.new(v72, {
			ShowHintLabel = true,
			Run = function() --[[ Run | Line: 128 | Upvalues: v4 (ref), v72 (copy), v8 (ref), v7 (ref), v9 (ref), SFX (ref), Royal2025 (ref), p1 (copy), v16 (ref) ]]
				local v1, v2 = v4.GetRemoteFunction("DeliverPresent"):InvokeServer(v72)
				v8 = true
				if v1 ~= true and v1 ~= "Completed" then
					v7.Notify({
						Message = "Wrong House! Try again!",
						Preset = "Red"
					})
					return
				end
				v9:Tween()
				SFX.MergeSuccess:Play()
				v7.Notify({
					Preset = "Green",
					Message = Royal2025.MinigameData.DeliveryType .. " Delivered!"
				})
				if p1.Presents[v2] then
					p1.Presents[v2].Maid:DoCleaning()
				end
				if v1 ~= "Completed" then
					return
				end
				for v3, v42 in p1.Presents do
					v42.Maid:DoCleaning()
				end
				v9:Tween()
				SFX.MergeSuccess:Play()
				v16 = false
				p1:End()
			end,
			GetRange = function() --[[ GetRange | Line: 166 ]]
				return 30
			end,
			Hint = "Deliver" .. Royal2025.MinigameData.DeliveryType,
			Visibility = function() --[[ Visibility | Line: 170 | Upvalues: v16 (ref), v8 (ref) ]]
				return v16 and not v8 and true or false
			end
		}))
	end
end
function t.new() --[[ new | Line: 177 | Upvalues: t (copy), v14 (copy), v11 (copy), v7 (copy), LocalPlayer (copy), v15 (copy), v5 (copy), v8 (copy), Royal2025 (copy), v2 (copy), v1 (copy), v12 (copy), v17 (ref), v16 (ref), v13 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	if not v14.CurrentHorse then
		local v3 = nil
		for v42, v52 in v11.GetAllAnimals() do
			v3 = v52
			break
		end
		if not v3 then
			v7.Notify({
				Message = "You must be on a horse to start this minigame! ",
				Preset = "Red"
			})
			return
		end
		v3:_sit(LocalPlayer.Character.Humanoid)
	end
	local v6, v72 = v15:InvokeServer()
	if v6 then
		v22.DeliveryMaid = v2.new()
		v22.Maid = v2.new()
		v22.EndedSignal = v1.new()
		v12.SetGuiWorldspacePointTo(workspace.Events.DeliveryMinigame.SpawnInteract, "Deliver the " .. Royal2025.MinigameData.DeliveryType)
		workspace.Events.DeliveryMinigame.SpawnInteract.Touched:Once(function() --[[ Line: 222 | Upvalues: v12 (ref) ]]
			v12.SetGuiWorldspacePointTo()
		end)
		v22.Presents = {}
		if v17 then
		else
			v22.Horse = v14.CurrentHorse
			v22.Maid:GiveTask(v22.Horse.Model:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 231 | Upvalues: v16 (ref), v22 (copy), v12 (ref), v7 (ref) ]]
				v16 = false
				for v1, v2 in v22.Presents do
					v2.Maid:DoCleaning()
				end
				v12.SetGuiWorldspacePointTo()
				for v3, v4 in workspace.Events.DeliveryMinigame.DeliveryNodes:GetChildren() do
					v4.TutorialBeam.Enabled = false
				end
				v7.Notify({
					Message = "Minigame ended.",
					Preset = "Red"
				})
				v22.DeliveryMaid:DoCleaning()
			end))
			v22.DeliveryMaid:GiveTask(v13.ResetBindable.Event:Connect(function(p1) --[[ Line: 253 | Upvalues: v16 (ref), v22 (copy), v12 (ref), v7 (ref), v4 (ref) ]]
				v16 = false
				for v1, v2 in v22.Presents do
					v2.Maid:DoCleaning()
				end
				for v3, v42 in workspace.Events.DeliveryMinigame.DeliveryNodes:GetChildren() do
					v42.TutorialBeam.Enabled = false
				end
				v12.SetGuiWorldspacePointTo()
				v7.Notify({
					Message = "Minigame ended.",
					Preset = "Red"
				})
				v22.DeliveryMaid:DoCleaning()
				v4.GetRemoteEvent("EndPresentMinigameEarly"):FireServer()
			end))
			v7.Notify({
				Preset = "Green",
				Message = string.format("Deliver all %s %s to the houses!", Royal2025.PresentAmount, Royal2025.MinigameData.DeliveryType)
			})
			v22:Start(v72.Presents, v72.Spots)
			v16 = true
			return v22
		end
	else
		setmetatable(v22, nil)
		if v72 then
			local t2 = {
				Preset = "Red"
			}
			t2.Message = "Minigame on cooldown for " .. v8.FormatString((math.ceil(Royal2025.PresentCooldown * 60 - (workspace:GetServerTimeNow() - v72))))
			v7.Notify(t2)
		else
			v5.NotifyIssue("CantStartMinigame")
		end
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 289 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
return t