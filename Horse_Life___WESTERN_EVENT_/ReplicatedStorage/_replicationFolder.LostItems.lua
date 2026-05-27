-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("RemoteUtils")
Sonar("Constants")
local v3 = Sonar("PlaceTypeService")
local t = {}
t.__index = t
local v4 = false
function t.New(p1, p2, p3) --[[ New | Line: 16 | Upvalues: v3 (copy), v4 (ref), t (copy), v1 (copy), ReplicatedStorage (copy), Sonar (copy), v2 (copy) ]]
	if not v3.IsMainWorld() then
		return
	end
	if v4 then
		return
	end
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	v22.NPC = p1
	v22.ItemType = p2
	v22.SpawnAmount = p3
	v4 = true
	v22.Maid:GiveTask(function() --[[ Line: 32 | Upvalues: v22 (copy), v4 (ref) ]]
		setmetatable(v22, nil)
		v4 = false
	end)
	v22.Items = {}
	v22.Spawns = workspace.NPCQUESTNODES[p1]
	if not v22.Spawns then
		v22.Maid:DoCleaning()
		return
	end
	v22.Spawns = v22.Spawns:GetChildren()
	for i = 1, p3 do
		if #v22.Spawns == 0 then
			warn("No more spawn points available")
			return v22
		end
		local v32 = math.random(1, #v22.Spawns)
		local v5 = v1.new()
		local v6 = ReplicatedStorage.Storage.Assets.NPCItems:FindFirstChild(p2):Clone()
		v6:PivotTo(v22.Spawns[v32]:GetPivot())
		v6.Parent = workspace
		v5:GiveTask(v6)
		v6:AddTag("MinimapBlip")
		if v6:FindFirstChild("LostItem") then
			v6:FindFirstChild("LostItem"):AddTag("MinimapBlip")
		end
		v5:GiveTask(Sonar("InteractMenu").new(v6, {
			Scale = 0.75,
			ShowHintLabel = true,
			Hint = "Collect Object",
			Run = function() --[[ Run | Line: 71 | Upvalues: v2 (ref), v5 (copy), v22 (copy) ]]
				v2.GetRemoteFunction("FindNpcItem"):InvokeServer()
				v5:DoCleaning()
				if not (#v22.Items <= 0) then
					return
				end
				v22.Maid:DoCleaning()
			end,
			GetRange = function() --[[ GetRange | Line: 80 ]]
				return 20
			end
		}))
		v22.Maid:GiveTask(v5)
		table.insert(v22.Items, v6)
		table.remove(v22.Spawns, v32)
		v5:GiveTask(function() --[[ Line: 91 | Upvalues: v22 (copy), v6 (copy) ]]
			table.remove(v22.Items, table.find(v22.Items, v6))
		end)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 99 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 104 | Upvalues: v3 (copy) ]]
	if not v3.IsMainWorld() then
		return
	end
	for v1, v2 in workspace.NPCQUESTNODES:GetDescendants() do
		if v2:IsA("BasePart") then
			v2.Transparency = 1
		end
	end
end
t:Init()
return t