-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper").GetClient()
local v2 = Sonar("Resource")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("Binder")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 10 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.Resource = v2.new(p1, {
		IsLocal = true,
		DoNotSanitiseModel = true,
		OnHarvested = function() --[[ OnHarvested | Line: 18 | Upvalues: v22 (copy) ]]
			v22:Destroy()
		end
	})
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 26 ]]
	p1.Object:Destroy()
	p1.Resource:Destroy()
	setmetatable(p1, nil)
end
function t.ResetChests(p1) --[[ ResetChests | Line: 33 | Upvalues: v1 (copy), v2 (copy), v3 (copy) ]]
	local t = {}
	for v12, v22 in workspace.Interactions.TreasureChests:GetChildren() do
		v22.Main.Transparency = 1
		table.insert(t, v22)
	end
	for v32, v4 in v1.PlayerData.TreasureChests.ExplorationChests:GetChildren() do
		local v5 = Random.new(v1.PlayerData.TreasureChests.ExplorationChests.Value):NextInteger(1, #t)
		local v6 = t[v5]
		table.remove(t, v5)
		if not (p1 and v4.Value) then
			local v7 = script.DailyChest:Clone()
			v7:PivotTo(v6.Main.CFrame)
			v7.Parent = workspace.LocalResources
			v2.new(v7, {
				IsLocal = true,
				DisplayName = "DailyChest",
				OnHarvested = function() --[[ OnHarvested | Line: 56 | Upvalues: v3 (ref), v4 (copy), v5 (copy) ]]
					v3.GetRemoteFunction("OpenTreasureChestRemote"):InvokeServer(v4.Name, v5)
				end
			})
		end
	end
end
local function Start() --[[ Start | Line: 64 | Upvalues: v1 (copy), t (copy) ]]
	if v1.PlayerData.ActivityUpgrades.DailyChests.Started.Value then
		t.ResetChests(true)
		v1.PlayerData.TreasureChests.ExplorationChests:GetPropertyChangedSignal("Value"):Connect(t.ResetChests)
	end
end
function t.Init(p1) --[[ Init | Line: 72 | Upvalues: v1 (copy), Start (copy), t (copy), v4 (copy) ]]
	for v12, v2 in workspace.Interactions.TreasureChests:GetChildren() do
		v2.Main.Transparency = 1
	end
	v1.PlayerData.ActivityUpgrades.DailyChests.Started:GetPropertyChangedSignal("Value"):Connect(Start)
	if not v1.PlayerData.ActivityUpgrades.DailyChests.Started.Value then
		v4.new("CaveWall", t):Init()
		return
	end
	t.ResetChests(true)
	v1.PlayerData.TreasureChests.ExplorationChests:GetPropertyChangedSignal("Value"):Connect(t.ResetChests)
	v4.new("CaveWall", t):Init()
end
t:Init()
return t