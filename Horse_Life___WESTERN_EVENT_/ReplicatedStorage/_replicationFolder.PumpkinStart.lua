-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("PromptClient")
local v7 = Sonar("CameraShaker")
local v8 = Sonar("CameraGui")
local v9 = Sonar("NotificationsClient")
local v10 = Sonar("TimeUtils")
local v11 = Sonar("CharacterEffects")
local v12 = Sonar("GuiManager")
local t = {}
t.__index = t
local v13 = Sonar("Constants")
local v14 = v13[v13.EventName]
local Board = workspace.Events:WaitForChild("Halloween"):WaitForChild("PumpkinBoard"):WaitForChild("Board")
local SFX = game.ReplicatedStorage.Storage.SFX
local CurrentCamera = workspace.CurrentCamera
local v15 = v4.GetRemoteFunction("StartPumpkinMinigame")
local v16 = v4.GetRemoteFunction("DropoffPumpkin")
local v17 = v4.GetRemoteEvent("PumpkinEnded")
local LocalPlayer = game.Players.LocalPlayer
local v18 = false
local v19 = false
local v20 = 0
local v21 = v7.new(Enum.RenderPriority.Camera.Value + 1, "PumpkinMinigameShaker", function(p1) --[[ Line: 39 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v21:Start()
function t.new(p1) --[[ new | Line: 44 | Upvalues: t (copy), v2 (copy), v3 (copy), v19 (ref), v15 (copy), v5 (copy), v9 (copy), v10 (copy), v14 (copy), LocalPlayer (copy), v8 (copy), v11 (copy), v20 (ref), v18 (ref), Board (copy), SFX (copy), v16 (copy), v21 (copy), v7 (copy), TweenService (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Start Minigame",
		Run = function() --[[ Run | Line: 54 | Upvalues: v19 (ref), v15 (ref), v5 (ref), v9 (ref), v10 (ref), v14 (ref), LocalPlayer (ref), v8 (ref), v11 (ref), v20 (ref), v18 (ref), p1 (copy), Board (ref), SFX (ref) ]]
			if v19 then
				return
			end
			local v1, v2 = v15:InvokeServer()
			if v1 then
				LocalPlayer.Character.Humanoid:UnequipTools()
				v8:ExitMode()
				v11.UpdateVisibility({
					ExcludeLocalPlayer = true,
					ExcludeLocalAnimals = true
				})
				v20 = 0
				v18 = true
				v19 = true
				p1.BillboardGui.TextLabel.Text = "Dropoff Pumpkins"
				Board.Board.Container.Points.Text = v20 .. " Points"
				for i = v14.MinigameTime, 0, -1 do
					if v18 then
						if i <= 5 then
							SFX.HarvestTarget:Play()
						end
						Board.Board.Container.Timer.Text = i .. " Seconds Remaining!!!"
						task.wait(1)
					end
				end
				p1.BillboardGui.TextLabel.Text = "Start Minigame"
			elseif v2 then
				local t = {
					Preset = "Red"
				}
				t.Message = "Minigame on cooldown for " .. v10.FormatString((math.ceil(v14.CoolDown * 60 - (workspace:GetServerTimeNow() - v2))))
				v9.Notify(t)
			else
				v5.NotifyIssue("CantStartMinigame")
			end
		end,
		GetRange = function() --[[ GetRange | Line: 102 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 106 | Upvalues: v18 (ref) ]]
			return not v18
		end
	}))
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Dropoff Pumpkins",
		Run = function() --[[ Run | Line: 113 | Upvalues: v16 (ref), v5 (ref), v20 (ref), v21 (ref), v7 (ref), p1 (copy), SFX (ref), Board (ref), TweenService (ref) ]]
			local v1, v2 = v16:InvokeServer()
			if v1 then
				local v3 = v2 - v20
				v20 = v2
				v21:Shake(v7.Presets.SmallRotationBump)
				p1.Confetti:Emit(15)
				SFX.LevelUp2:Play()
				p1.Point.Enabled = true
				p1.Point.TextLabel.Text = "+" .. v3 .. " Points"
				task.delay(1.5, function() --[[ Line: 133 | Upvalues: p1 (ref) ]]
					p1.Point.Enabled = false
				end)
				Board.Board.Container.Points.Text = v2 .. " Points"
				TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.235, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
					Brightness = 0.355
				}):Play()
				TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
					Brightness = 0.2
				}):Play()
			else
				v5.NotifyIssue("NotHoldingAnything")
			end
		end,
		GetRange = function() --[[ GetRange | Line: 150 ]]
			return 20
		end,
		Visibility = function() --[[ Visibility | Line: 154 | Upvalues: v18 (ref) ]]
			return v18
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 162 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 168 | Upvalues: v1 (copy), t (copy), v17 (copy), v18 (ref), Board (copy), SFX (copy), v21 (copy), v7 (copy), TweenService (copy), v12 (copy), v6 (copy), v20 (ref), v19 (ref), v11 (copy) ]]
	v1.new("PumpkinStart", t):Init()
	v17.OnClientEvent:Connect(function(p1) --[[ Line: 172 | Upvalues: v18 (ref), Board (ref), SFX (ref), v21 (ref), v7 (ref), TweenService (ref), v12 (ref), v6 (ref), v20 (ref), v19 (ref), v11 (ref) ]]
		v18 = false
		Board.Board.Container.Timer.Text = "TIMES UP!"
		SFX.SuperCompleted:Play()
		v21:Shake(v7.Presets.SmallRotationBump)
		TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.235, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
			Brightness = 0.355
		}):Play()
		TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
			Brightness = 0.2
		}):Play()
		v12.OpenHUD()
		v6.Prompt({
			Type = "MinigameComplete",
			Setup = function(p12) --[[ Setup | Line: 196 | Upvalues: p1 (copy), v20 (ref) ]]
				p12.Content.Earned.TextLabel.Text = math.round(p1)
				p12.Content.CompleteAmount.TextLabel.Text = v20 .. " Points"
			end,
			Run = function() --[[ Run | Line: 200 | Upvalues: v12 (ref), v19 (ref) ]]
				v12.OpenHUD()
				v19 = false
				return true
			end
		})
		v11.UpdateVisibility(false)
		task.delay(5, function() --[[ Line: 209 | Upvalues: v18 (ref), Board (ref) ]]
			if v18 then
				return
			end
			Board.Board.Container.Timer.Text = "-"
			Board.Board.Container.Points.Text = "Start Minigame"
		end)
	end)
end
t.Init()
return t