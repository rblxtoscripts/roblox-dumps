-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("IssueResponseClient")
local v2 = Sonar("NotificationsClient")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("TimeUtils")
local v6 = Sonar("Binder")
local v7 = Sonar("PromptClient")
local v8 = Sonar("Maid")
local t = {}
t.__index = t
local v9 = Sonar("Constants")
local v10 = v9[v9.EventName]
local Board = workspace.Events.Halloween.GhoulBoard.Board
local SFX = game.ReplicatedStorage.Storage.SFX
local v11 = v4.GetRemoteFunction("StartGhoulMinigame")
local v12 = v4.GetRemoteFunction("EndGhoulMinigame")
local v13 = false
local v14 = Instance.new("NumberValue")
local Ghoul = game.ReplicatedStorage.Storage.Assets.Events.Halloween2024.Ghoul
local GhoulNodes = workspace.Events.Halloween.GhoulNodes
function countEntries(p1) --[[ countEntries | Line: 29 ]]
	local count = 0
	for k in pairs(p1) do
		count = count + 1
	end
	return count
end
function t.SpawnObjects(p1) --[[ SpawnObjects | Line: 37 | Upvalues: GhoulNodes (copy), v10 (copy), Ghoul (copy), v8 (copy), v3 (copy), v14 (copy), SFX (copy) ]]
	local v1 = GhoulNodes:GetChildren()
	local list = {}
	for i = #v1, 2, -1 do
		local v2 = math.random(i)
		local v4 = v1[i]
		v1[i] = v1[v2]
		v1[v2] = v4
	end
	local MaxGhoulSpawn = v10.MaxGhoulSpawn
	for j = 1, math.min(MaxGhoulSpawn, #v1) do
		table.insert(list, v1[j])
	end
	for i, v in ipairs(list) do
		local t = {
			Node = v,
			GhoulObject = Ghoul:Clone(),
			Maid = v8.new()
		}
		t.Maid:GiveTask(t.GhoulObject)
		t.GhoulObject:PivotTo(v.CFrame * CFrame.new(0, 1.5, 0))
		t.GhoulObject.Parent = workspace
		t.Maid:GiveTask(function() --[[ Line: 62 | Upvalues: p1 (copy), t (copy) ]]
			p1.Ghouls[t.GhoulObject] = nil
			t.GhoulObject:Destroy()
		end)
		t.Maid:GiveTask(v3.new(t.GhoulObject, {
			ShowHintLabel = true,
			Hint = "Collect Ghoul",
			Run = function() --[[ Run | Line: 70 | Upvalues: v14 (ref), v10 (ref), SFX (ref), t (copy) ]]
				v14.Value = v14.Value + v10.GhoulWorth
				SFX.LevelUp2:Play()
				t.Maid:DoCleaning()
			end,
			GetRange = function() --[[ GetRange | Line: 78 ]]
				return 20
			end,
			Visibility = function() --[[ Visibility | Line: 82 ]]
				return true
			end
		}))
		p1.Ghouls[t.GhoulObject] = t
	end
end
function t.new(p1) --[[ new | Line: 91 | Upvalues: t (copy), v8 (copy), v3 (copy), v11 (copy), v1 (copy), v2 (copy), v5 (copy), v10 (copy), v13 (ref), Board (copy), v14 (copy), SFX (copy), v12 (copy), v7 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.ParentName = p1.Parent.Name
	v22.Ghouls = {}
	v22.Maid = v8.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Start Minigame",
		Run = function() --[[ Run | Line: 104 | Upvalues: v11 (ref), v1 (ref), v2 (ref), v5 (ref), v10 (ref), v13 (ref), v22 (copy), Board (ref), v14 (ref), SFX (ref), v12 (ref), v7 (ref) ]]
			local v15, v23 = v11:InvokeServer()
			if v15 then
				v2.Notify({
					Message = "Find the Ghouls!!",
					Preset = "Yellow"
				})
				v13 = true
				v22:SpawnObjects()
				Board.Board.Container.Points.Text = v14.Value .. " Points"
				for i = v10.GhoulMinigameTime, 0, -1 do
					if not v13 then
						break
					end
					if i <= 5 then
						SFX.HarvestTarget:Play()
						v2.Notify({
							Preset = "Red",
							ChatMessage = false,
							Message = i .. " Seconds Left"
						})
					end
					if countEntries(v22.Ghouls) == 0 then
						v2.Notify({
							Message = "You found them all!",
							Preset = "Green",
							ChatMessage = false
						})
						break
					end
					Board.Board.Container.Timer.Text = i .. " Seconds Remaining!!!"
					task.wait(1)
				end
				Board.Board.Container.Timer.Text = "TIMES UP!"
				task.delay(3, function() --[[ Line: 162 | Upvalues: Board (ref) ]]
					Board.Board.Container.Points.Text = "Start Minigame"
					Board.Board.Container.Timer.Text = "-"
				end)
				v13 = false
				for v3, v4 in v22.Ghouls do
					v4.Maid:DoCleaning()
				end
				v22.Ghouls = {}
				local v52, v6 = v12:InvokeServer(v14.Value)
				if v52 then
					v7.Prompt({
						Type = "MinigameComplete",
						Setup = function(p1) --[[ Setup | Line: 180 | Upvalues: v6 (copy), v14 (ref) ]]
							p1.Content.Earned.TextLabel.Text = math.round(v6)
							p1.Content.CompleteAmount.TextLabel.Text = v14.Value .. " Points"
						end,
						Run = function() --[[ Run | Line: 184 | Upvalues: v14 (ref) ]]
							v14.Value = 0
							return true
						end
					})
				else
					v14.Value = 0
				end
			elseif v23 then
				local t = {
					Preset = "Red"
				}
				t.Message = "Minigame on cooldown for " .. v5.FormatString((math.ceil(v10.CoolDown * 60 - (workspace:GetServerTimeNow() - v23))))
				v2.Notify(t)
			else
				v1.NotifyIssue("CantStartMinigame")
			end
		end,
		GetRange = function() --[[ GetRange | Line: 194 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 200 | Upvalues: v13 (ref) ]]
			return not v13
		end
	}))
	v22.Maid:GiveTask(v14:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 205 | Upvalues: v14 (ref), Board (ref) ]]
		local v1 = v14.Value
		if v1 == 0 then
			Board.Board.Container.Points.Text = "Start Minigame"
		else
			Board.Board.Container.Points.Text = v1 .. " Points"
		end
	end))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 218 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 223 | Upvalues: v6 (copy), t (copy) ]]
	v6.new("GhoulMinigame", t):Init()
end
t:Init()
return t