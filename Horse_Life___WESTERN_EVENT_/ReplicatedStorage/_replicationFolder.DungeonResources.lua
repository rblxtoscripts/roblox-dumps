-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
local v3 = Sonar("Resource")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("NotificationsClient")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 13 | Upvalues: t (copy), v1 (copy), ReplicatedStorage (copy), v3 (copy), v4 (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.SpawnMaid = v1.new()
	v2.Maid:GiveTask(v2.SpawnMaid)
	v2.SpawnPoint = p1
	v2.SpawnPoint.Transparency = 1
	local function v32() --[[ SpawnResource | Line: 22 | Upvalues: v2 (copy), ReplicatedStorage (ref), p1 (copy), v3 (ref), v4 (ref), v5 (ref), v32 (copy) ]]
		v2.SpawnMaid:DoCleaning()
		v2.ResourceModel = ReplicatedStorage.Storage.Assets.DungeonResources:FindFirstChild(p1.Name):Clone()
		v2.ResourceModel:PivotTo(p1.CFrame)
		v2.ResourceModel.Parent = workspace.LocalResources
		local v1 = v3.new(v2.ResourceModel, {
			IsLocal = true,
			DisplayName = v2.ResourceModel.Name,
			OnHarvested = function() --[[ OnHarvested | Line: 33 | Upvalues: v4 (ref), v2 (ref), v5 (ref), v32 (ref) ]]
				local v1, v22 = v4.GetRemoteFunction("DestroyKirinResource"):InvokeServer(v2.ResourceModel.Name)
				if not v1 then
					v5.Notify({
						Type = "Red",
						Message = v22
					})
				end
				v2.SpawnMaid:GiveTask(task.delay(math.random(30, 120), function() --[[ Line: 43 | Upvalues: v32 (ref) ]]
					v32()
				end))
			end
		})
		v2.SpawnMaid:GiveTask(v1)
		v2.SpawnMaid:GiveTask(v2.ResourceModel)
	end
	v32()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 58 ]]
	p1.Maid:DoCleaning()
end
function t.Init() --[[ Init | Line: 62 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("KirinResource", t):Init()
end
t.Init()
return t