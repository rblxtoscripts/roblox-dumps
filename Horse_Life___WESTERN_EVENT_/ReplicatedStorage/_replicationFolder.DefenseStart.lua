-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("PromptClient")
local v7 = Sonar("CameraGui")
local v8 = Sonar("NotificationsClient")
local v9 = Sonar("TimeUtils")
local v10 = Sonar("Corn")
local v11 = Sonar("ColorCorrectionUtils")
local v12 = Sonar("CameraShaker")
local v13 = Sonar("GuiManager")
local t = {}
t.__index = t
local v14 = Sonar("Constants")
local v15 = v14[v14.EventName]
local Board = workspace.Events.Halloween:WaitForChild("CornBoard").Board
local SFX = game.ReplicatedStorage.Storage.SFX
local LocalPlayer = game.Players.LocalPlayer
local DefenseCrow = v15.MinigameData.DefenseCrow
local CurrentCamera = workspace.CurrentCamera
local v16 = v4.GetRemoteFunction("StartCrowMinigame")
local v17 = v4.GetRemoteFunction("EndCrowMinigame")
local v18 = v4.GetRemoteFunction("KillCorn")
local v19 = false
local v20 = 0
local t2 = {}
local v21 = v12.new(Enum.RenderPriority.Camera.Value + 1, "CrowMinigameShaker", function(p1) --[[ Line: 43 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v21:Start()
function t.IsRunning() --[[ IsRunning | Line: 49 | Upvalues: v19 (ref) ]]
	return v19
end
local function getRandomPosition(p1, p2, p3, p4, p5) --[[ getRandomPosition | Line: 53 ]]
	local v2 = math.rad((math.random(0, 360)))
	local v3 = math.random(p2, p3)
	local v4 = math.random(p4, p5)
	local v5 = math.cos(v2) * v3
	return p1 + Vector3.new(v5, v4, math.sin(v2) * v3)
end
function t.SpawnCrow(p1) --[[ SpawnCrow | Line: 66 | Upvalues: v10 (copy), v19 (ref), LocalPlayer (copy), TweenService (copy), DefenseCrow (copy), getRandomPosition (copy), t2 (ref) ]]
	local v1 = v10.GetAllCorn()
	local count = 0
	local v2 = nil
	repeat
		if not v19 then
			break
		end
		v2 = v1[math.random(1, #v1)]
		count = count + 1
		if v2.IsAlive == true and (v2.IsTargeted == false and v2.Owner == LocalPlayer) then
			break
		end
	until v2.IsTargeted == false or count >= 50
	if not v19 then
		return
	end
	if not v2 then
		return
	end
	v2.IsTargeted = true
	local v3 = game.ReplicatedStorage.Storage.Assets.LassoDisplay.LassoRangePart:Clone()
	v3.Position = v2.Object.Position
	v3.Size = Vector3.new(0.2, 30, 30)
	v3.Parent = v2.Object
	TweenService:Create(v3.LassoSurfaceGui.Frame.UIStroke, TweenInfo.new(12), {
		Color = Color3.fromRGB(255, 48, 51)
	}):Play()
	local v4 = DefenseCrow:Clone()
	if math.random(1, 100) >= 75 then
		v4.IsSpecial.Value = true
		v4.Ghost.Enabled = true
		v4.TextureID = ""
		v4.Size = Vector3.new(v4.Size.X * 1.5, v4.Size.Y * 1.5, v4.Size.Z * 1.5)
	end
	v4.Position = getRandomPosition(v2.Object.Position, 80, 150, 40, 100)
	v4.Parent = workspace
	t2[v4] = {
		CrowModel = v4,
		Corn = v2,
		Indicator = v3
	}
	p1.Maid:GiveTask(v4)
	p1.Maid:GiveTask(v3)
end
function t.new(p1) --[[ new | Line: 125 | Upvalues: t (copy), v2 (copy), v3 (copy), v16 (copy), v5 (copy), v8 (copy), v9 (copy), v15 (copy), v7 (copy), v19 (ref), v20 (ref), Board (copy), SFX (copy), v17 (copy), t2 (ref), v13 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Start Minigame",
		Run = function() --[[ Run | Line: 138 | Upvalues: v16 (ref), v5 (ref), v8 (ref), v9 (ref), v15 (ref), v7 (ref), v19 (ref), v20 (ref), Board (ref), v22 (copy), SFX (ref), v17 (ref), t2 (ref), v13 (ref), v6 (ref) ]]
			local v1, v2 = v16:InvokeServer()
			if v1 then
				v7:ExitMode()
				v8.Notify({
					Preset = "Yellow",
					Message = "Protect the " .. v15.MinigameData.DefenseType .. "!!"
				})
				v19 = true
				local SpawnTime = v15.SpawnTime
				v20 = v15.MaxPoints
				Board.Board.Container.Points.Text = v20 .. " Points"
				task.spawn(function() --[[ Line: 169 | Upvalues: v19 (ref), SpawnTime (ref), v15 (ref), v22 (ref) ]]
					while v19 do
						task.wait(SpawnTime)
						if Random.new():NextInteger(1, 100) >= 80 then
							for i = 1, v15.SpawnCount do
								v22:SpawnCrow()
							end
							continue
						end
						v22:SpawnCrow()
					end
				end)
				for i = v15.MinigameTime, 0, -1 do
					if v19 then
						if i <= 5 then
							SFX.HarvestTarget:Play()
							v8.Notify({
								Preset = "Red",
								ChatMessage = false,
								Message = i .. " Seconds Left"
							})
						end
						if i <= 25 then
							SpawnTime = v15.SpawnTime2
						end
						Board.Board.Container.Timer.Text = i .. " Seconds Remaining!!!"
						task.wait(1)
					end
				end
				Board.Board.Container.Timer.Text = "TIMES UP!"
				task.delay(3, function() --[[ Line: 210 | Upvalues: Board (ref) ]]
					Board.Board.Container.Points.Text = "Start Minigame"
					Board.Board.Container.Timer.Text = "-"
				end)
				v19 = false
				local v3, v4 = v17:InvokeServer()
				if not v3 then
					return
				end
				for v52, v62 in t2 do
					v62.CrowModel:Destroy()
					v62.Indicator:Destroy()
				end
				t2 = {}
				v13.OpenHUD()
				v6.Prompt({
					Type = "MinigameComplete",
					Setup = function(p1) --[[ Setup | Line: 231 | Upvalues: v4 (copy), v20 (ref) ]]
						p1.Content.Earned.TextLabel.Text = math.round(v4)
						p1.Content.CompleteAmount.TextLabel.Text = v20 .. " Points"
					end,
					Run = function() --[[ Run | Line: 235 | Upvalues: v20 (ref), v13 (ref) ]]
						v20 = 0
						v13.OpenHUD()
						return true
					end
				})
			elseif v2 then
				local t = {
					Preset = "Red"
				}
				t.Message = "Minigame on cooldown for " .. v9.FormatString((math.ceil(v15.CoolDown * 60 - (workspace:GetServerTimeNow() - v2))))
				v8.Notify(t)
			else
				v5.NotifyIssue("CantStartMinigame")
			end
		end,
		GetRange = function() --[[ GetRange | Line: 246 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 252 | Upvalues: v19 (ref) ]]
			return not v19
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 260 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
local function MoveCrowToCorn(p1, p2, p3) --[[ MoveCrowToCorn | Line: 266 | Upvalues: v15 (copy) ]]
	local v1 = p2.Object.Position + Vector3.new(0, 7, 0)
	local v2 = p1.IsSpecial.Value and v15.SpecialMoveSpeed or v15.MoveSpeed
	if (v1 - p1.Position).Magnitude > 5 then
		p1.Position = p1.Position + (v1 - p1.Position).unit * v2 * p3
		p1.CFrame = CFrame.new(p1.Position, p2.Object.Position) * CFrame.Angles(0, 1.5707963267948966, 0)
		return true
	else
		return false
	end
end
local function CheckPlayerProximity(p1) --[[ CheckPlayerProximity | Line: 291 | Upvalues: LocalPlayer (copy), v15 (copy) ]]
	local Character = LocalPlayer.Character
	if Character and (Character:FindFirstChild("HumanoidRootPart") and (p1.Corn.Object.Position - Character.HumanoidRootPart.Position).magnitude <= v15.ScareDistance) then
		p1.CrowModel:Destroy()
		return true
	else
		return false
	end
end
function t.Init() --[[ Init | Line: 307 | Upvalues: v1 (copy), t (copy), RunService (copy), v19 (ref), t2 (ref), MoveCrowToCorn (copy), v18 (copy), v20 (ref), v15 (copy), Board (copy), LocalPlayer (copy), v11 (copy), v21 (copy), v12 (copy) ]]
	v1.new("CornStart", t):Init()
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 312 | Upvalues: v19 (ref), t2 (ref), MoveCrowToCorn (ref), v18 (ref), v20 (ref), v15 (ref), Board (ref), LocalPlayer (ref), v11 (ref), v21 (ref), v12 (ref) ]]
		if not v19 then
			return
		end
		for v2, v3 in t2 do
			local v1
			local CrowModel = v3.CrowModel
			local Corn = v3.Corn
			local Indicator = v3.Indicator
			if CrowModel and (Corn and CrowModel:IsDescendantOf(workspace)) then
				if not (MoveCrowToCorn(CrowModel, Corn, p1) or v3.Processing) then
					v3.Processing = true
					if not v18:InvokeServer(v3.Corn.Object) then
						break
					end
					v20 = v20 - v15.PointsPerDead
					if v20 <= 0 then
						v20 = 0
					end
					Board.Board.Container.Points.Text = v20 .. " Points"
					game.ReplicatedStorage.Storage.SFX.Error:Play()
					CrowModel:Destroy()
					Indicator:Destroy()
					t2[v2] = nil
				end
				local Character = LocalPlayer.Character
				if Character and (Character:FindFirstChild("HumanoidRootPart") and (v3.Corn.Object.Position - Character.HumanoidRootPart.Position).magnitude <= v15.ScareDistance) then
					v3.CrowModel:Destroy()
					v1 = true
				else
					v1 = false
				end
				if v1 then
					CrowModel:Destroy()
					Indicator:Destroy()
					v11:Tween()
					v21:Shake(v12.Presets.SmallRotationBump)
					game.ReplicatedStorage.Storage.SFX.Poof:Play()
					game.ReplicatedStorage.Storage.SFX.QuestIncrement:Play()
					if Random.new():NextInteger(1, 100) > 95 then
						game.ReplicatedStorage.Storage.SFX.Yipee:Play()
					end
					t2[v2] = nil
				end
			end
		end
	end)
end
t.Init()
return t