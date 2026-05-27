-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Octree")
local t2 = {}
t2.__index = t2
t.Animators = {}
local v3 = v2.new("Trees", 4, 512)
local CurrentCamera = workspace.CurrentCamera
function t2.new(p1) --[[ new | Line: 17 | Upvalues: t2 (copy), v3 (copy), t (copy) ]]
	local v1 = p1:HasTag("Trunk")
	local v32 = setmetatable({}, t2)
	v32.Leaves = p1
	v32.Position = p1.CFrame
	v32.T = -99999
	v32.Tall = p1.Size.Y / 2
	v32.Px5 = p1.CFrame.Position.x / 5
	v32.Pz6 = p1.CFrame.Position.z / 6
	v32.x_z_size = math.max((p1.Size * Vector3.new(1, 0, 1)).Magnitude / p1.Size.Y, 5)
	v32.IsTrunk = v1
	v32.X = nil
	v32.Z = nil
	v3:Add(v32, p1.Position * Vector3.new(1, 0, 1))
	table.insert(t.Animators, v32)
	return v32
end
function t2.SetXZ(p1, p2, p3) --[[ SetXZ | Line: 39 ]]
	p1.X = p2
	p1.Z = p3
end
function t2.Destroy(p1) --[[ Destroy | Line: 44 | Upvalues: v3 (copy), t (copy) ]]
	v3:Remove(p1)
	table.remove(t.Animators, table.find(t.Animators, p1))
	setmetatable(p1, nil)
	table.clear(p1)
end
local v4 = 0
local t3 = {}
local t4 = {}
function t.Init(p1) --[[ Init | Line: 57 | Upvalues: UserInputService (copy), v1 (copy), t2 (copy), RunService (copy), t4 (copy), v4 (ref), t3 (ref), v3 (copy), CurrentCamera (copy) ]]
	if not UserInputService.TouchEnabled then
		v1.new("Leaves", t2):Init()
		RunService.Heartbeat:Connect(function(p1) --[[ Line: 65 | Upvalues: t4 (ref), v4 (ref), t3 (ref), v3 (ref), CurrentCamera (ref) ]]
			table.insert(t4, p1)
			if #t4 > 60 then
				table.remove(t4, 1)
			end
			local sum = 0
			for i = 1, #t4 do
				sum = sum + t4[i]
			end
			if 1 / (sum / #t4) < 50 then
				return
			end
			local t = {}
			local t2 = {}
			if tick() - v4 > 2 then
				v4 = tick()
				t3 = v3:RadiusSearch(CurrentCamera.CFrame.Position * Vector3.new(1, 0, 1), 250)
			end
			local GlobalWind = workspace.GlobalWind
			local count = 0
			for v5, v6 in t3 do
				local v2, v32, v42
				if not (count >= 40) then
					local Position = v6.Position
					if Position then
						local _, v7 = CurrentCamera:WorldToScreenPoint(Position.p)
						if v7 then
							local T = v6.T
							local Tall = v6.Tall
							local Px5 = v6.Px5
							local Pz6 = v6.Pz6
							if v6.IsTrunk then
								local v8 = v6.X and v6.X * 0.75 or math.sin(T + Px5) * math.sin(T / 9) / 4.5
								v2 = v6.Z and v6.Z * 0.75 or math.sin(T + Pz6) * math.sin(T / 12) / 6
								v32 = v8
								v42 = v2
							else
								v32 = math.sin(T + Px5) * math.sin(T / 9) / v6.x_z_size
								v42 = math.sin(T + Pz6) * math.sin(T / 12) / v6.x_z_size
							end
							local v9 = Position:ToWorldSpace(CFrame.new(v32, 0, v42) * CFrame.Angles(v42 / Tall, 0, v32 / -Tall))
							local v13 = v9 * CFrame.Angles(math.rad(GlobalWind.Z / Tall), 0, (math.rad(GlobalWind.X / Tall)))
							table.insert(t, v6.Leaves)
							table.insert(t2, v13)
							v6.T = v6.T + 0.04
							count = count + 1
						end
					end
				end
			end
			if not (#t > 0) then
				return
			end
			workspace:BulkMoveTo(t, t2, Enum.BulkMoveMode.FireCFrameChanged)
		end)
	end
end
t:Init()
return t