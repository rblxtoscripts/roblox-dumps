-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Enums"))
local VehicleProperties = require(game.ReplicatedStorage:WaitForChild("VehicleProperties"))
local t = {}
local LocalPlayer = game.Players.LocalPlayer
local t2 = {}
function Added(p1) --[[ Added | Line: 15 | Upvalues: t2 (copy), VehicleProperties (copy), LocalPlayer (copy), t (copy) ]]
	wait()
	local Driver = p1:WaitForChild("Driver", 1)
	if Driver == nil or Driver.Parent == nil then
		print("ERROR: No seat in car")
		return
	end
	if t2[Driver] then
		return
	end
	t2[Driver] = true
	local v1 = nil
	local function StopEngine() --[[ StopEngine | Line: 28 | Upvalues: v1 (ref) ]]
		if not v1 then
			return
		end
		v1:Stop()
	end
	local function PlayEngine() --[[ PlayEngine | Line: 35 | Upvalues: v1 (ref), Driver (copy), VehicleProperties (ref), p1 (copy), LocalPlayer (ref) ]]
		v1 = Driver:FindFirstChild("Engine")
		local v12 = VehicleProperties[p1.Name]
		if not v1 then
			v1 = Instance.new("Sound")
			v1.SoundId = v12.EngineSound
			v1.Name = "Engine"
			v1.Looped = true
			v1.RollOffMinDistance = 15
			v1.MaxDistance = 300
			v1.Parent = Driver
		end
		v1:Play()
		local VolumeDampener = v12.VolumeDampener
		local PitchDampener = v12.PitchDampener
		local VolumeMin = v12.VolumeMin
		local PitchMin = v12.PitchMin
		while Driver and (Driver.Parent and (Driver.Occupant and LocalPlayer:DistanceFromCharacter(Driver.Position) < 300)) do
			local Magnitude = Driver.Velocity.Magnitude
			v1.Volume = Magnitude / VolumeDampener + VolumeMin
			v1.PlaybackSpeed = Magnitude / PitchDampener + PitchMin
			wait(0.05)
		end
	end
	t[p1] = Driver:GetPropertyChangedSignal("Occupant"):connect(function() --[[ Line: 85 | Upvalues: Driver (copy), PlayEngine (copy), v1 (ref) ]]
		if Driver.Occupant then
			PlayEngine()
			return
		end
		if not v1 then
			return
		end
		v1:Stop()
	end)
	if not Driver.Occupant then
		return
	end
	PlayEngine()
end
function Removed(p1) --[[ Removed | Line: 111 | Upvalues: t (copy) ]]
	if not t[p1] then
		return
	end
	t[p1]:disconnect()
	t[p1] = nil
end
workspace.Cars.ChildAdded:connect(Added)
workspace.Trucks.ChildAdded:connect(Added)
workspace.Boats.ChildAdded:connect(Added)
workspace.Cars.ChildRemoved:connect(Removed)
workspace.Trucks.ChildRemoved:connect(Removed)
workspace.Boats.ChildAdded:connect(Removed)
for i, v in ipairs(workspace.Cars:GetChildren()) do
	Added(v)
end
for i, v in ipairs(workspace.Trucks:GetChildren()) do
	Added(v)
end
for i, v in ipairs(workspace.Boats:GetChildren()) do
	Added(v)
end