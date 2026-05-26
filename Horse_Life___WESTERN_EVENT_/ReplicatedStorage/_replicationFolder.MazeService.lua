-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("TeleportService")
local v3 = Sonar("MazeGenerator")
local v4 = Sonar("TimeSeedClass")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("Maid")
local v7 = Sonar("PlayerWrapper")
local CornMaze = ReplicatedStorage.Storage.Assets.Events[Sonar("Constants").EventName].CornMaze
local LocalPlayer = game.Players.LocalPlayer
local v9 = RunService:IsClient()
local v10 = Sonar("Constants")
local CurrentEvent = v10.CurrentEvent
local v11 = v9 and v7.GetClient()
local t = {}
t.__index = t
local v12 = v5.GetRemoteFunction("ClientEndedMazeEvent")
local v13 = v5.GetRemoteFunction("ClientStartedMazeEvent")
local v14 = v5.GetRemoteEvent("EndMaze")
local t2 = {}
local v15 = nil
t.GachaRefreshTimer = v4.new({
	Duration = 300
})
function t.New() --[[ New | Line: 44 | Upvalues: t (copy), v3 (copy), CornMaze (copy), v6 (copy), v10 (copy), v15 (ref) ]]
	local v2 = setmetatable({}, t)
	v2.MazeModel = v3.Generate({
		Width = 15,
		Height = 15,
		HallwayWidth = 40,
		WallHeight = 60,
		WallThickness = 2,
		OffsetY = 0,
		Seed = t.GachaRefreshTimer.CurrentSeed
	})
	v2.BaseModel = CornMaze:Clone()
	v2.MazeModel:PivotTo(v2.BaseModel:GetPivot())
	v2.BaseModel.Parent = workspace.Terrain
	v2.MazeModel.Parent = v2.BaseModel
	v2.Maid = v6.new()
	v2.Maid:GiveTask(v2.BaseModel)
	v2.Maid:GiveTask(v2.MazeModel)
	v2.Maid:GiveTask(v10.ResetBindable.Event:Connect(function() --[[ Line: 67 | Upvalues: v15 (ref), v2 (copy) ]]
		if v15 ~= v2 then
			return
		end
		v2:EndEarly()
	end))
	v15 = v2
	return v2
end
function t.End(p1) --[[ End | Line: 78 | Upvalues: v12 (copy), v2 (copy), LocalPlayer (copy), v11 (copy), v15 (ref) ]]
	if v12:InvokeServer() then
		v2.TeleportToPosition(workspace.Events.CornMaze:GetPivot().Position)
		p1.Maid:DoCleaning()
		LocalPlayer.CameraMaxZoomDistance = 100
		v11:SetActionState("Maze", false)
		v15 = nil
		setmetatable(p1, nil)
		return true
	else
		return "CannotEnd"
	end
end
function t.EndEarly(p1) --[[ EndEarly | Line: 95 | Upvalues: v14 (copy), v2 (copy), LocalPlayer (copy), v11 (copy), v15 (ref) ]]
	v14:FireServer()
	v2.TeleportToPosition(workspace.Events.CornMaze:GetPivot().Position)
	p1.Maid:DoCleaning()
	LocalPlayer.CameraMaxZoomDistance = 100
	v11:SetActionState("Maze", false)
	v15 = nil
	setmetatable(p1, nil)
	return true
end
function t.GetMaze(p1) --[[ GetMaze | Line: 111 | Upvalues: v15 (ref) ]]
	return v15
end
if v1 then
	function t.Init() --[[ Init | Line: 116 | Upvalues: v13 (copy), v7 (copy), CurrentEvent (copy), t2 (copy), Sonar (copy), v12 (copy), v10 (copy) ]]
		function v13.OnServerInvoke(p1) --[[ Line: 117 | Upvalues: v7 (ref), CurrentEvent (ref), t2 (ref), Sonar (ref) ]]
			local v1 = v7.getWrapperFromPlayer(p1)
			if v1.MinigameActive then
				return false
			end
			local v2 = workspace:GetServerTimeNow()
			local v3 = v1._lastMazeMinigame or 0
			if v2 - v3 < CurrentEvent.MazeCooldown * 60 then
				return false, v3
			else
				v1._lastMazeMinigame = v2
				t2[p1] = v2
				v1.MinigameActive = true
				Sonar("AnalyticsService").ReportDesignEvent(p1, "MinigameStarted", {
					{
						Key = "MinigameName",
						Value = "Maze"
					}
				}, 1)
				return true, v1._lastMazeMinigame
			end
		end
		function v12.OnServerInvoke(p1) --[[ Line: 142 | Upvalues: v7 (ref), t2 (ref), v10 (ref), CurrentEvent (ref), Sonar (ref) ]]
			local v1 = v7.getWrapperFromPlayer(p1)
			if not v1.MinigameActive then
				return false
			end
			if not t2[p1] then
				return false
			end
			local v2 = workspace:GetServerTimeNow()
			if v2 - t2[p1] < 30 then
				warn("Not enough time has passed", v2 - t2[p1])
				return false
			end
			t2[p1] = nil
			v1.MinigameActive = false
			local v3 = v1:GiveItem({
				Source = "MazeMinigame",
				ApplyModifiers = true,
				IgnoreLimit = true,
				Name = v10.EventCurrencyName,
				Amount = CurrentEvent.MazeReward
			})
			v1:IncrementMission({
				Type = "CompleteEventMinigame",
				Amount = 1,
				Data = { "Maze" }
			})
			local NewMissionsWrapper = v1.NewMissionsWrapper
			if not NewMissionsWrapper then
				Sonar("AnalyticsService").ReportDesignEvent(p1, "MinigameCompleted", {
					{
						Key = "MinigameName",
						Value = "Maze"
					}
				}, 1)
				Sonar("EventPassManager").GiveEventPoints(v1.Player, "Minigame")
				return true, v3
			end
			NewMissionsWrapper:IncrementMission("CompleteAnyMinigame", {
				Data = {}
			})
			NewMissionsWrapper:IncrementMission("CompleteSpecificMinigame", {
				Data = { "Maze" }
			})
			NewMissionsWrapper:IncrementMission("CompleteAnyEventMinigame", {
				Data = {}
			})
			Sonar("AnalyticsService").ReportDesignEvent(p1, "MinigameCompleted", {
				{
					Key = "MinigameName",
					Value = "Maze"
				}
			}, 1)
			Sonar("EventPassManager").GiveEventPoints(v1.Player, "Minigame")
			return true, v3
		end
	end
	v14.OnServerEvent:Connect(function(p1) --[[ Line: 196 | Upvalues: v7 (copy), t2 (copy) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if t2[p1] then
			t2[p1] = nil
			v1.MinigameActive = false
		else
			return false
		end
	end)
	t.Init()
end
return t