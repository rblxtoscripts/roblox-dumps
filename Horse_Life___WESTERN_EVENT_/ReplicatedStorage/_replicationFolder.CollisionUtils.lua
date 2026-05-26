-- https://lua.expert/
local t = {}
local PhysicsService = game:GetService("PhysicsService")
local function setPartCollisionGroup(p1, p2) --[[ setPartCollisionGroup | Line: 7 ]]
	if p1:IsA("BasePart") then
		p1.CollisionGroup = p2
	end
end
function t.SetCollisionGroupOfModel(p1, p2) --[[ SetCollisionGroupOfModel | Line: 13 | Upvalues: setPartCollisionGroup (copy) ]]
	local v1 = p1.DescendantAdded:Connect(function(p1) --[[ Line: 14 | Upvalues: p2 (copy) ]]
		local v1 = p2
		if p1:IsA("BasePart") then
			p1.CollisionGroup = v1
		end
	end)
	local v2 = p1:GetDescendants()
	table.insert(v2, p1)
	for k, v in pairs(v2) do
		task.spawn(setPartCollisionGroup, v, p2)
	end
	return v1
end
PhysicsService:RegisterCollisionGroup("Characters")
PhysicsService:CollisionGroupSetCollidable("Characters", "Characters", false)
PhysicsService:RegisterCollisionGroup("Animals")
PhysicsService:CollisionGroupSetCollidable("Animals", "Animals", false)
PhysicsService:CollisionGroupSetCollidable("Characters", "Animals", false)
PhysicsService:CollisionGroupSetCollidable("Animals", "Mobs", false)
PhysicsService:CollisionGroupSetCollidable("Animals", "Resource", false)
PhysicsService:CollisionGroupSetCollidable("Animals", "BoundingBox", false)
return t