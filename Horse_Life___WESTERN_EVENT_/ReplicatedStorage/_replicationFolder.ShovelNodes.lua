-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper").GetClient()
local v2 = Sonar("Resource")
local v3 = Sonar("RemoteUtils")
local ShovelNodes = ReplicatedStorage:WaitForChild("Storage").Assets.ShovelNodes
local v4 = Sonar("Maid").new()
function t.ResetChests(p1) --[[ ResetChests | Line: 23 | Upvalues: v4 (copy), v1 (copy), ShovelNodes (copy), v2 (copy), v3 (copy) ]]
	v4:DoCleaning()
	local t = {}
	for v12, v22 in workspace.Interactions.ShovelSpawnNodes:GetChildren() do
		v22.Main.Transparency = 1
		table.insert(t, v22)
	end
	for v32, v42 in v1.PlayerData.TreasureChests.Digging:GetChildren() do
		local v5 = Random.new(v1.PlayerData.TreasureChests.Digging.Value):NextInteger(1, #t)
		local v6 = t[v5]
		table.remove(t, v5)
		if not (p1 and v42.Value) then
			local v7 = ShovelNodes.DiggingNodes:Clone()
			v7:PivotTo(v6.Main.CFrame)
			v7.Parent = workspace.LocalResources
			v4:GiveTask(v7)
			v4:GiveTask(v2.new(v7, {
				DisplayName = "Shovel",
				IsLocal = true,
				OnHarvested = function() --[[ OnHarvested | Line: 49 | Upvalues: v3 (ref), v42 (copy), v5 (copy) ]]
					v3.GetRemoteFunction("OpenDiggingRemote"):InvokeServer(v42.Name, v5)
				end
			}))
		end
	end
end
function t.Init(p1) --[[ Init | Line: 56 | Upvalues: t (ref), v1 (copy) ]]
	t.ResetChests(true)
	v1.PlayerData.TreasureChests.Digging:GetPropertyChangedSignal("Value"):Connect(t.ResetChests)
end
t:Init()
return t