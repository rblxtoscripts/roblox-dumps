-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper").GetClient()
local v2 = Sonar("Resource")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("SpinMinigame")
local v5 = Sonar("Maid")
local v6 = Sonar("TimeUtils")
local v7 = Sonar("ClueService")
local v8 = Sonar("MessagesClient")
local v9 = Sonar("Marker")
local v10 = Sonar("TutorialService")
local v11 = RunService:IsStudio() and false
local CluesClient = ReplicatedStorage:WaitForChild("Storage").Assets.CluesClient
local v12 = v3.GetRemoteFunction("ClaimClue")
local t2 = {}
local function _shouldRespawnClues() --[[ _shouldRespawnClues | Line: 37 | Upvalues: v7 (copy), v1 (copy), t2 (copy), v11 (copy) ]]
	local remainingcluesneeded = v7.GetRemainingClues(v1.Player)
	local currentspawnedclues = #t2
	if v11 then
		print("Remaining clues needed:", remainingcluesneeded)
		print("Current spawned clues:", currentspawnedclues)
	end
	return if remainingcluesneeded == currentspawnedclues then false else v7.HasAvailableChests(v1.Player)
end
function t.ResetChests(p1) --[[ ResetChests | Line: 50 | Upvalues: v11 (copy), t2 (copy), v10 (copy), v1 (copy), v7 (copy), CluesClient (copy), v5 (copy), v2 (copy), v12 (copy), v8 (copy), v9 (copy), v4 (copy) ]]
	if v11 then
		print("ResetChests called, fromInit:", p1)
	end
	for v13, v22 in t2 do
		v22.Maid:DoCleaning()
		t2[v13] = nil
	end
	if v10.IsInTutorial(v1) then
		return
	end
	if v7.HasAvailableChests(v1.Player) then
		if not p1 then
			local remainingcluesneeded = v7.GetRemainingClues(v1.Player)
			local currentspawnedclues = #t2
			if v11 then
				print("Remaining clues needed:", remainingcluesneeded)
				print("Current spawned clues:", currentspawnedclues)
			end
			if not (if remainingcluesneeded == currentspawnedclues then false else v7.HasAvailableChests(v1.Player)) then
				if not v11 then
					return
				end
				print("No respawn needed, returning early")
				return
			end
		end
		if v11 then
			print("Respawn needed, proceeding...")
		end
		local t = {}
		if not v7.CanFindClue(v1.Player) then
			return
		end
		for v52, v6 in workspace.Interactions.Clues:GetChildren() do
			table.insert(t, v6)
		end
		local v72 = Random.new(v1.PlayerData.TreasureChests.Digging.Value):NextInteger(1, #t)
		table.remove(t, v72)
		local v92 = CluesClient.Clue:Clone()
		v92:PivotTo(t[v72]:GetPivot())
		v92.Parent = workspace
		local v102 = nil
		v102 = {
			Model = v92,
			Maid = v5.new(),
			Maid2 = v5.new(),
			Resource = v2.new(v92, {
				IsLocal = true,
				DisplayName = "Clue",
				OnHarvested = function() --[[ OnHarvested | Line: 113 | Upvalues: v12 (ref), v7 (ref), v1 (ref), v8 (ref), v9 (ref), v102 (ref) ]]
					if not v12:InvokeServer() then
						return
					end
					if v7.HasAvailableChests(v1.Player) then
						v8:AddNotification({
							Type = "ClueFound",
							Duration = 2.5
						})
						local t = {}
						for v13, v2 in workspace.LocalResources:GetChildren() do
							table.insert(t, v2)
						end
						local v3 = t[Random.new():NextInteger(1, #t)]
						local t2 = {
							DiggingNodes = "rbxassetid://97631076261155",
							DailyChest = "rbxassetid://88686317331511",
							QuestionMark = "rbxassetid://16468593643"
						}
						local t3 = {
							Duration = 90
						}
						t3.Image = t2[v3.Name] or t2.QuestionMark
						t3.Root = v3.Base
						v9.new(t3)
					end
					task.delay(0.5, function() --[[ Line: 148 | Upvalues: v102 (ref) ]]
						v102.Maid:DoCleaning()
					end)
				end,
				OnUnTarget = function() --[[ OnUnTarget | Line: 153 | Upvalues: v102 (ref) ]]
					v102.Maid2:DoCleaning()
				end,
				OnTarget = function(p1) --[[ OnTarget | Line: 156 | Upvalues: v92 (copy), v102 (ref), v4 (ref) ]]
					local v1 = game.ReplicatedStorage.Storage.Assets.SpinMinigameUI:Clone()
					v1.Adornee = v92.Base
					v102.Maid2:GiveTask(v1)
					v102.Maid2:GiveTask(v4.new(v1, function() --[[ Line: 160 ]] end, function(p1) --[[ Line: 168 ]]
						p1.CurrentWins = math.max(p1.CurrentWins - 1, 0)
					end, function() --[[ Line: 172 ]]
						return true
					end, 3, function(p12) --[[ Line: 164 | Upvalues: p1 (copy) ]]
						p1:Damage(7, false, true)
					end))
					v102.Maid:GiveTask(v102.Maid2)
				end
			})
		}
		v102.Maid:GiveTask(v92)
		v102.Maid:GiveTask(v102.Resource)
		v102.Maid:GiveTask(function() --[[ Line: 188 | Upvalues: t2 (ref), v102 (ref) ]]
			table.remove(t2, table.find(t2, v102))
		end)
		local v112 = t2
		local v122 = v102
		table.insert(v112, v122)
	else
		if not v11 then
			return
		end
		print("All chests and digging nodes claimed, no clues will be spawned")
	end
end
function t.Init(p1) --[[ Init | Line: 195 | Upvalues: t (ref), v1 (copy), v6 (copy) ]]
	task.delay(2, function() --[[ Line: 196 ]]
		for v1, v2 in workspace:WaitForChild("Interactions"):WaitForChild("Clues"):GetChildren() do
			v2.Clue.Transparency = 1
		end
	end)
	t.ResetChests(true)
	local v12 = false
	v1.Maid:GiveTask(v6.AttachToTime(function() --[[ Line: 206 | Upvalues: v6 (ref), v1 (ref), v12 (ref), t (ref) ]]
		local v2 = math.max(0, 180 - (v6.Get() - (v1.PlayerData.LastClue.Value or 0)))
		if v2 <= 0 and not v12 then
			v12 = true
			t.ResetChests()
			return
		end
		if not (v2 > 0) then
			return
		end
		v12 = false
	end))
	for v2, v3 in v1.PlayerData.TreasureChests.Digging:GetChildren() do
		v3:GetPropertyChangedSignal("Value"):Connect(t.ResetChests)
	end
	for v4, v5 in v1.PlayerData.TreasureChests.ExplorationChests:GetChildren() do
		v5:GetPropertyChangedSignal("Value"):Connect(t.ResetChests)
	end
	for v62, v7 in v1.PlayerData.Clues:GetChildren() do
		v7:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 227 | Upvalues: t (ref) ]]
			task.delay(20, function() --[[ Line: 228 | Upvalues: t (ref) ]]
				t.ResetChests()
			end)
		end)
	end
end
t:Init()
return t