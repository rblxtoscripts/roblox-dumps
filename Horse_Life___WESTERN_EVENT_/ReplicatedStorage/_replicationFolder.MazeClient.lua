-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("CameraGui")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("TimeUtils")
local v9 = Sonar("TeleportService")
local v10 = Sonar("MazeService")
local v11 = Sonar("GuiManager")
local t = {}
t.__index = t
local v12 = Sonar("Constants")
local CurrentEvent = v12.CurrentEvent
local SFX = game.ReplicatedStorage.Storage.SFX
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local v13 = Sonar("PlayerWrapper").GetClient()
local v14 = v4.GetRemoteFunction("ClientStartedMazeEvent")
local v15 = false
local v16 = nil
local v17 = v2.new()
local function StopCountdown() --[[ StopCountdown | Line: 33 | Upvalues: v15 (ref), PlayerGui (copy), v11 (copy), v16 (ref) ]]
	v15 = false
	PlayerGui.TimerGUI.Container.Timer.Text = "Open"
	v11.UpdateFrame(PlayerGui.TimerGUI.Container)
	local v1 = v16
	v16 = nil
	if not v1 or coroutine.running() == v1 then
		return
	end
	task.cancel(v1)
end
local function CreateMazeEndPropmt(p1) --[[ CreateMazeEndPropmt | Line: 45 | Upvalues: v17 (copy), v3 (copy), v15 (ref), PlayerGui (copy), v11 (copy), v16 (ref), SFX (copy) ]]
	p1.Maze.MazeModel.EndMarker.EndSound:Play()
	v17:GiveTask(v3.new(p1.Maze.MazeModel.EndMarker, {
		ShowHintLabel = true,
		Hint = "FINISH MAZE!",
		Run = function() --[[ Run | Line: 50 | Upvalues: p1 (copy), v17 (ref), v15 (ref), PlayerGui (ref), v11 (ref), v16 (ref), SFX (ref) ]]
			if p1.Maze:End() ~= true then
				return
			end
			v17:DoCleaning()
			v15 = false
			PlayerGui.TimerGUI.Container.Timer.Text = "Open"
			v11.UpdateFrame(PlayerGui.TimerGUI.Container)
			local v1 = v16
			v16 = nil
			if not v1 or coroutine.running() == v1 then
				SFX.SuperCompleted:Play()
				return
			end
			task.cancel(v1)
			SFX.SuperCompleted:Play()
		end,
		GetRange = function() --[[ GetRange | Line: 60 ]]
			return 15
		end,
		Visibility = function() --[[ Visibility | Line: 64 | Upvalues: v15 (ref) ]]
			return v15
		end
	}))
end
function t.new(p1) --[[ new | Line: 70 | Upvalues: t (copy), v2 (copy), v3 (copy), v13 (copy), v7 (copy), LocalPlayer (copy), v14 (copy), v5 (copy), v8 (copy), CurrentEvent (copy), v6 (copy), v15 (ref), v10 (copy), Sonar (copy), v9 (copy), CreateMazeEndPropmt (copy), v11 (copy), PlayerGui (copy), v16 (ref), v17 (copy), v4 (copy), v12 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	v22.Time = nil
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Enter Maze",
		Run = function() --[[ Run | Line: 81 | Upvalues: v13 (ref), v7 (ref), LocalPlayer (ref), v14 (ref), v5 (ref), v8 (ref), CurrentEvent (ref), v6 (ref), v22 (copy), v15 (ref), v10 (ref), Sonar (ref), v9 (ref), CreateMazeEndPropmt (ref), v11 (ref), PlayerGui (ref), v16 (ref), v17 (ref), v4 (ref) ]]
			local CurrentHorse = v13.CurrentHorse
			if CurrentHorse then
				if CurrentHorse.Model.RiderSeat:FindFirstChild("SeatWeld") then
					v7.Notify({
						Message = "You can\'t enter the maze while co-riding!",
						Preset = "Red"
					})
					return
				end
			elseif LocalPlayer.Character.Humanoid.SeatPart then
				v7.Notify({
					Message = "You can\'t enter the maze while co-riding!",
					Preset = "Red"
				})
				return
			end
			if v13:IsInAction("Trail") then
				v7.Notify({
					Message = "You can\'t enter the maze while on a trail!",
					Preset = "Red"
				})
				return
			end
			local v1, v2 = v14:InvokeServer()
			if v1 then
				if CurrentHorse and CurrentHorse.Flying then
					CurrentHorse:Fly(false)
				end
				v6:ExitMode()
				v7.Notify({
					Message = "Get through the maze before the time runs out!!",
					Preset = "Yellow"
				})
				v22.Time = v2
				v15 = true
				v22.Maze = v10.New()
				if v22.Maze then
					v13:SetActionState("Maze", true)
					Sonar("BuildClient"):ExitMode()
					v22.Maze.BaseModel.Roof.CanCollide = false
					v9.TeleportToPosition(v22.Maze.MazeModel.StartMarker.Position, {
						StopMovement = true,
						PivotTo = true
					})
					task.delay(3, function() --[[ Line: 148 | Upvalues: v22 (ref) ]]
						if not (v22.Maze and (v22.Maze.BaseModel and v22.Maze.BaseModel:FindFirstChild("Roof"))) then
							return
						end
						v22.Maze.BaseModel.Roof.CanCollide = true
					end)
					LocalPlayer.CameraMaxZoomDistance = 50
					CreateMazeEndPropmt(v22)
					v11.UpdateFrame(PlayerGui.TimerGUI.Container)
					v16 = task.spawn(function() --[[ Line: 159 | Upvalues: v15 (ref), v22 (ref), PlayerGui (ref), v8 (ref), v17 (ref), v4 (ref), v11 (ref), v16 (ref) ]]
						for i = 240, 0, -1 do
							if not (v15 and (v22 and (v22.Maze and v22.Maze.MazeModel))) then
								break
							end
							PlayerGui.TimerGUI.Container.Timer.Text = v8.FormatString(i)
							task.wait(1)
						end
						if v15 and (v22 and (v22.Maze and v22.Maze.MazeModel)) then
							if not v22.Maze:EndEarly() then
								return
							end
							v17:DoCleaning()
							v4.GetRemoteEvent("EndMaze"):FireServer()
						end
						v15 = false
						PlayerGui.TimerGUI.Container.Timer.Text = "Open"
						v11.UpdateFrame(PlayerGui.TimerGUI.Container)
						local v1 = v16
						v16 = nil
						if not v1 or coroutine.running() == v1 then
							v11.OpenHUD()
							return
						end
						task.cancel(v1)
						v11.OpenHUD()
					end)
				end
			elseif v2 then
				local t = {
					Preset = "Red"
				}
				t.Message = "Minigame on cooldown for " .. v8.FormatString((math.ceil(CurrentEvent.MazeCooldown * 60 - (workspace:GetServerTimeNow() - v2))))
				v7.Notify(t)
			else
				v5.NotifyIssue("CantStartMinigame")
			end
		end,
		GetRange = function() --[[ GetRange | Line: 188 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 192 | Upvalues: v15 (ref) ]]
			return not v15
		end
	}))
	v22.LastTick = tick()
	v22.Maid:GiveTask(game["Run Service"].Heartbeat:Connect(function() --[[ Line: 199 | Upvalues: v22 (copy), CurrentEvent (ref), p1 (copy), v8 (ref) ]]
		if tick() - v22.LastTick < 1 then
			return
		end
		v22.LastTick = tick()
		if not v22.Time then
			return
		end
		local v1 = v22.Time + CurrentEvent.MazeCooldown * 60 - workspace:GetServerTimeNow()
		if v1 <= 0 then
			p1.Attachment.BillboardGui.Frame.Timer.Text = "Open"
		else
			p1.Attachment.BillboardGui.Frame.Timer.Text = v8.FormatString(v1)
		end
	end))
	v22.Maid:GiveTask(v12.ResetBindable.Event:Connect(function(p1) --[[ Line: 217 | Upvalues: v17 (ref), v15 (ref), PlayerGui (ref), v11 (ref), v16 (ref), v22 (copy), v4 (ref) ]]
		v17:DoCleaning()
		v15 = false
		PlayerGui.TimerGUI.Container.Timer.Text = "Open"
		v11.UpdateFrame(PlayerGui.TimerGUI.Container)
		local v1 = v16
		v16 = nil
		if v1 and coroutine.running() ~= v1 then
			task.cancel(v1)
		end
		if v22.Maze then
			v22.Maze:EndEarly()
		end
		v4.GetRemoteEvent("EndMaze"):FireServer()
	end))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 231 | Upvalues: t (copy) ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, t)
end
function t.Init() --[[ Init | Line: 237 | Upvalues: v1 (copy), t (copy), v11 (copy), PlayerGui (copy), v15 (ref) ]]
	local v12 = v1.new("MazeStart", t)
	v11.AddFrame(PlayerGui:WaitForChild("TimerGUI").Container, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = PlayerGui.TimerGUI.Container.Position,
		ClosePosition = PlayerGui.TimerGUI.Container.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.1, Enum.EasingStyle.Circular, Enum.EasingDirection.In),
		CheckVisibility = function() --[[ CheckVisibility | Line: 246 | Upvalues: v15 (ref) ]]
			return v15
		end
	})
	v12:Init()
end
t.Init()
return t