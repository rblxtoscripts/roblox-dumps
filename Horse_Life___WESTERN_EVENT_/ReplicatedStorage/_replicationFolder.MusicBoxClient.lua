-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("PromptClient")
local v6 = Sonar("DialogueGui")
local v7 = Sonar("TimeUtils")
local v8 = Sonar("NotificationsClient")
local v9 = Sonar("ColorCorrectionUtils")
local v10 = Sonar("Confetti")
local v11 = Sonar("Marker")
local v12 = Sonar("ContextualUtils")
local v13 = Sonar("IssueResponseClient")
local v14 = Sonar("PlayerWrapper")
local v15 = Sonar("StorageUtils")
local v16 = v14.GetClient()
local Drinks = ReplicatedStorage.Storage.Assets.Events.Drinks
local MusicBox = workspace.Events:WaitForChild("MusicBox")
local v17 = v1.GetRemoteFunction("StartMusicMinigame")
local v18 = v1.GetRemoteFunction("EndMusicMinigame")
local v19 = Sonar(v15.Get("MusicBoxPresets"))
local t2 = {}
local v20 = false
local v21 = false
local v22 = nil
local function v23() --[[ GetRandomNode | Line: 39 | Upvalues: t2 (ref), v23 (copy) ]]
	local MusicBoxNodes = workspace.Events.MusicBoxNodes
	local v1 = MusicBoxNodes:GetChildren()[math.random(1, #MusicBoxNodes:GetChildren())]
	if t2[v1] then
		return v23()
	else
		return v1
	end
end
local function SpawnNotes() --[[ SpawnNotes | Line: 50 | Upvalues: v8 (copy), v9 (copy), v19 (copy), t2 (ref), v23 (copy), Drinks (copy), v3 (copy), v11 (copy), v16 (copy), v22 (ref), MusicBox (copy), v10 (copy), v12 (copy), v21 (ref), ReplicatedStorage (copy), RunService (copy) ]]
	v8.Notify({
		Message = "Collect all the Ingredients to complete the drink!",
		Preset = "Green"
	})
	v9:Tween()
	local t = {}
	for v1 in v19 do
		table.insert(t, v1)
	end
	local v2 = t[math.random(1, #t)]
	for i = 1, #v19[v2].Ingredients do
		local MusicBoxNodes = workspace.Events.MusicBoxNodes
		local v32 = MusicBoxNodes:GetChildren()[math.random(1, #MusicBoxNodes:GetChildren())]
		local v4 = if t2[v32] then v23() else v32
		if not v4 then
			warn("No random node found")
			return
		end
		local v5 = Drinks[v2][tostring(i)]:Clone()
		v5.Parent = v4
		v5:PivotTo(v4:GetPivot() + Vector3.new(0, 3, 0))
		t2[v4] = {
			Note = v5,
			Maid = v3.new()
		}
		t2[v4].Maid:GiveTask(v5)
		t2[v4].Maid:GiveTask(function() --[[ Line: 85 | Upvalues: t2 (ref), v4 (copy) ]]
			t2[v4] = nil
		end)
		t2[v4].Maid:GiveTask(v11.new({
			Image = "rbxassetid://120971759024827",
			Duration = 999,
			IgnoreAutoDestroy = true,
			Root = v5.Part
		}))
		local v6 = false
		t2[v4].Maid:GiveTask(v5.Part.Touched:Connect(function(p1) --[[ Line: 97 | Upvalues: v6 (ref), v16 (ref), t2 (ref), v4 (copy), v8 (ref), v22 (ref), v11 (ref), MusicBox (ref), v10 (ref), v12 (ref), v21 (ref), v9 (ref), ReplicatedStorage (ref) ]]
			if v6 then
				return
			end
			local v1 = v16:GetCurrentAnimal()
			if not (v1 and v1.Root) then
				return
			end
			if not p1:IsDescendantOf(v1.Model) then
				return
			end
			v6 = true
			t2[v4].Maid:DoCleaning()
			local count = 0
			for v2, v3 in t2 do
				if v3 then
					count = count + 1
				end
			end
			if count == 0 then
				v8.Notify({
					Message = "You have collected all the ingredients! Head over to the drink maker to make the drink!!!",
					Preset = "Green"
				})
				v22 = v11.new({
					Image = "rbxassetid://120971759024827",
					Duration = 999,
					IgnoreAutoDestroy = true,
					Root = MusicBox.Part
				})
				v10.Emit(100)
				v12.SetGuiWorldspacePointTo(MusicBox:GetPivot().Position, nil, "Head back to the Dream Caf\195\169!!")
				v21 = true
			else
				v8.Notify({
					Preset = "Green",
					Message = "Ingredient Collected! " .. count .. " ingredients left"
				})
			end
			v9:Tween()
			ReplicatedStorage.Storage.SFX.LevelUp2:Play()
		end))
		t2[v4].Maid:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 148 | Upvalues: v4 (copy), v5 (copy) ]]
			local v1 = os.clock()
			local v2 = math.sin(v1 * 2) * 0.5
			v5:PivotTo((v4:GetPivot() + Vector3.new(0, v2 + 3, 0)) * CFrame.Angles(0, math.rad(v1 * 50), 0))
		end))
	end
end
function t.new(p1) --[[ new | Line: 159 | Upvalues: t (copy), v3 (copy), v4 (copy), v20 (ref), v6 (copy), v17 (copy), v13 (copy), v8 (copy), v7 (copy), SpawnNotes (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Maid = v3.new()
	v2.Maid:GiveTask(v4.new(p1, {
		ShowHintLabel = true,
		Hint = "Talk",
		Run = function() --[[ Run | Line: 167 | Upvalues: v20 (ref), v6 (ref), p1 (copy), v17 (ref), v13 (ref), v8 (ref), v7 (ref), SpawnNotes (ref) ]]
			if not v20 then
				v6.RunDialog({
					CameraMode = "LookVector",
					Object = p1,
					Dialog = {
						Name = "Dream Caf\195\169",
						Text = { "Welcome to the Dream Caf\195\169! Here, you can prepare all kinds of delicious treats. Collect the ingredients and start cooking!" },
						Choice = {
							{
								Text = "I\'ll help!",
								OnRun = function() --[[ OnRun | Line: 181 | Upvalues: v17 (ref), v6 (ref), v13 (ref), v8 (ref), v7 (ref), v20 (ref), SpawnNotes (ref) ]]
									local v1, v2 = v17:InvokeServer()
									v6.Stop()
									if v1 then
										v20 = true
										SpawnNotes()
										return
									end
									if v2 then
										local t = {
											Preset = "Red"
										}
										t.Message = "Minigame on cooldown for " .. v7.FormatString((math.ceil(60 - (workspace:GetServerTimeNow() - v2))))
										v8.Notify(t)
									else
										v13.NotifyIssue("CantStartMinigame")
									end
								end
							},
							{
								Text = "No, thanks.",
								OnRun = function() --[[ OnRun | Line: 206 | Upvalues: v6 (ref) ]]
									v6.Stop()
								end
							}
						}
					}
				})
			end
		end,
		Visibility = function() --[[ Visibility | Line: 216 | Upvalues: p1 (copy), v20 (ref) ]]
			return p1:IsDescendantOf(workspace) and not v20
		end,
		GetRange = function() --[[ GetRange | Line: 220 ]]
			return 25
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 230 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 235 | Upvalues: v2 (copy), t (copy), v4 (copy), MusicBox (copy), v12 (copy), v18 (copy), v5 (copy), ReplicatedStorage (copy), v20 (ref), v21 (ref), t2 (ref), v22 (ref) ]]
	v2.new("MusicBox", t):Init()
	v4.new(MusicBox, {
		ShowHintLabel = true,
		Hint = "Make Drink",
		Run = function() --[[ Run | Line: 241 | Upvalues: v12 (ref), v18 (ref), v5 (ref), ReplicatedStorage (ref), v20 (ref), v21 (ref), t2 (ref), v22 (ref) ]]
			v12.SetGuiWorldspacePointTo()
			local v1, v2 = v18:InvokeServer()
			if v1 then
				v5.Prompt({
					Type = "MinigameComplete",
					Setup = function(p1) --[[ Setup | Line: 249 | Upvalues: v2 (copy) ]]
						p1.Content.Earned.TextLabel.Text = math.round(v2)
					end,
					Run = function() --[[ Run | Line: 252 ]]
						return true
					end
				})
			end
			ReplicatedStorage.Storage.SFX.LevelUp2:Play()
			v20 = false
			v21 = false
			t2 = {}
			v22:Destroy()
			v22 = nil
		end,
		Visibility = function() --[[ Visibility | Line: 269 | Upvalues: MusicBox (ref), v20 (ref), v21 (ref) ]]
			return MusicBox:IsDescendantOf(workspace) and (v20 and v21)
		end,
		GetRange = function() --[[ GetRange | Line: 273 ]]
			return 25
		end
	})
end
t.Init()
return t