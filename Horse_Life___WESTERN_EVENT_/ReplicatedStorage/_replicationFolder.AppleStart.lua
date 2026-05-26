-- https://lua.expert/
game:GetService("CollectionService")
game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("IssueResponseClient")
local v6 = Sonar("PromptClient")
Sonar("MathUtils")
local v7 = Sonar("FishClient")
local v8 = Sonar("GuiManager")
local v9 = Sonar("CameraGui")
local v10 = Sonar("NotificationsClient")
local v11 = Sonar("TimeUtils")
local t = {}
t.__index = t
local CurrentEvent = Sonar("Constants").CurrentEvent
local Board = workspace.Events.Western.AppleBoard.Board
local SFX = game.ReplicatedStorage.Storage.SFX
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
Sonar("PlayerWrapper").GetClient()
local v12 = v4.GetRemoteFunction("ClientEndedAppleEvent")
local v13 = v4.GetRemoteFunction("ClientStartedAppleEvent")
local v14 = false
local v15 = 0
local PointsMap = CurrentEvent.PointsMap
function t.IsRunning() --[[ IsRunning | Line: 42 | Upvalues: v14 (ref) ]]
	return v14
end
function t.AddPoint(p1) --[[ AddPoint | Line: 46 | Upvalues: v15 (ref), Board (copy) ]]
	v15 = v15 + p1
	if not (v15 <= 0) then
		Board.Board.Container.Points.Text = v15 .. " Points"
		return
	end
	v15 = 0
	Board.Board.Container.Points.Text = v15 .. " Points"
end
function t.new(p1) --[[ new | Line: 56 | Upvalues: t (copy), v2 (copy), v3 (copy), v13 (copy), v5 (copy), v10 (copy), v11 (copy), CurrentEvent (copy), LocalPlayer (copy), v14 (ref), v9 (copy), v7 (copy), v8 (copy), PlayerGui (copy), v15 (ref), Board (copy), SFX (copy), v12 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Start Minigame",
		Run = function() --[[ Run | Line: 66 | Upvalues: v13 (ref), v5 (ref), v10 (ref), v11 (ref), CurrentEvent (ref), v2 (ref), LocalPlayer (ref), v14 (ref), v9 (ref), v7 (ref), v8 (ref), PlayerGui (ref), v15 (ref), Board (ref), SFX (ref), v12 (ref), v6 (ref) ]]
			local v1, v22 = v13:InvokeServer()
			if v1 then
				local v3 = v2.new()
				task.spawn(function() --[[ Line: 85 | Upvalues: LocalPlayer (ref), v3 (copy), v14 (ref) ]]
					local Character = LocalPlayer.Character
					local v1 = Character and Character:FindFirstChildOfClass("Humanoid")
					local Backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
					local v2 = Backpack and Backpack:WaitForChild("AppleOnAStick", 5)
					if not (v1 and v2) then
						return
					end
					v1:EquipTool(v2)
					v3:GiveTask(v2.Unequipped:Connect(function() --[[ Line: 95 | Upvalues: v14 (ref), v2 (copy), v1 (copy) ]]
						if not (v14 and v2.Parent) then
							return
						end
						task.defer(function() --[[ Line: 97 | Upvalues: v14 (ref), v1 (ref), v2 (ref) ]]
							if not (v14 and (v1.Parent and v2.Parent)) then
								return
							end
							v1:EquipTool(v2)
						end)
					end))
				end)
				v9:ExitMode()
				v7.MinigameToggle(true, true)
				v8.CloseFrame(PlayerGui.FishingGUI.FishingProgress)
				v10.Notify({
					Message = "Catch as many ores as you can before time\'s up!!",
					Preset = "Green"
				})
				v15 = 0
				v14 = true
				Board.Board.Container.Points.Text = v15 .. " Points"
				for i = CurrentEvent.MinigameTime, 0, -1 do
					if v14 then
						if i <= 5 then
							SFX.HarvestTarget:Play()
						end
						Board.Board.Container.Timer.Text = i .. " Seconds Remaining!!!"
						task.wait(1)
					end
				end
				Board.Board.Container.Timer.Text = "TIMES UP!"
				task.delay(3, function() --[[ Line: 135 | Upvalues: Board (ref) ]]
					Board.Board.Container.Points.Text = "Start Minigame"
					Board.Board.Container.Timer.Text = "-"
				end)
				v14 = false
				v3:DoCleaning()
				local v4, v52 = v12:InvokeServer(v15)
				if not v4 then
					v7.MinigameToggle(false, false)
					return
				end
				v6.Prompt({
					Type = "MinigameComplete",
					Setup = function(p1) --[[ Setup | Line: 147 | Upvalues: v52 (copy), v15 (ref) ]]
						p1.Content.Earned.TextLabel.Text = math.round(v52)
						p1.Content.CompleteAmount.TextLabel.Text = v15 .. " Points"
					end,
					Run = function() --[[ Run | Line: 151 ]]
						return true
					end
				})
				v7.MinigameToggle(false, false)
			elseif v22 then
				local t = {
					Preset = "Red"
				}
				t.Message = "Minigame on cooldown for " .. v11.FormatString((math.ceil(CurrentEvent.CoolDown * 60 - (workspace:GetServerTimeNow() - v22))))
				v10.Notify(t)
			else
				v5.NotifyIssue("CantStartMinigame")
			end
		end,
		GetRange = function() --[[ GetRange | Line: 159 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 163 | Upvalues: v14 (ref) ]]
			return not v14
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 171 | Upvalues: t (copy) ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, t)
end
function t.Init() --[[ Init | Line: 177 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("AppleStart", t):Init()
end
t.Init()
return t