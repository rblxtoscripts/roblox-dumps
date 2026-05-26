-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local GlobalData = game.ReplicatedStorage:WaitForChild("GlobalData")
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Tween")
if GlobalData.Season.Value ~= "Winter" or v1.IsPartyServer then
	print("NOT WINTER")
	return
end
local v2 = game.ReplicatedStorage:FindFirstChild("SnowEmitters") or workspace.Winter:WaitForChild("SnowEmitters")
local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera = game.Workspace.CurrentCamera
NumberSequence.new(0.3)
NumberSequence.new(0)
local v3 = if game.ReplicatedStorage:WaitForChild("GlobalData").TimeOfDay.Value == "Midday" then true else false
local function SnowFlakes(p1, p2) --[[ SnowFlakes | Line: 16 | Upvalues: v2 (copy) ]]
	for i, v in ipairs(v2:GetChildren()) do
		if p2 ~= nil then
			v.ParticleEmitter.Enabled = p2
		end
		if p1 ~= nil then
			if p1 then
				v.CFrame = CFrame.new((Vector3.new(v.Position.X, 53, v.Position.Z)))
				continue
			end
			v.CFrame = CFrame.new((Vector3.new(v.Position.X, -27, v.Position.Z)))
		end
	end
end
for i, v in ipairs(v2:GetChildren()) do
	v.ParticleEmitter.Enabled = true
end
local t = {}
local t2 = {}
local t3 = {}
local v4 = true
for i, v in ipairs(game.ReplicatedStorage.IndoorBounds:GetChildren()) do
	t[i] = v.Position
	t2[i] = v.Size
	t3[i] = v.Name
end
local v5 = workspace.Houses:GetChildren()
local function RefreshSnowState() --[[ RefreshSnowState | Line: 57 | Upvalues: v3 (ref), CurrentCamera (copy), t (copy), t2 (copy), v5 (copy), v4 (ref), v2 (copy) ]]
	if v3 then
		local v1 = CurrentCamera.CFrame
		local v22 = false
		for i = 1, #t do
			if v1.x > t[i].x - t2[i].x / 2 and (v1.x < t[i].x + t2[i].x / 2 and (v1.z > t[i].z - t2[i].z / 2 and v1.z < t[i].z + t2[i].z / 2)) then
				v22 = true
			end
		end
		if not v22 then
			for i, v in ipairs(v5) do
				if v.CurrentUpgrade.Value and v.CurrentUpgrade.Value:FindFirstChild("HouseBoundsBlock") then
					local Position = v.CurrentUpgrade.Value.HouseBoundsBlock.Position
					local Size = v.CurrentUpgrade.Value.HouseBoundsBlock.Size
					if v1.x > Position.x - Size.x / 2 and (v1.x < Position.x + Size.x / 2 and (v1.z > Position.z - Size.z / 2 and v1.z < Position.z + Size.z / 2)) then
						v22 = true
					end
				end
			end
		end
		if v22 and v4 then
			v4 = false
			for i, v in ipairs(v2:GetChildren()) do
				v.CFrame = CFrame.new((Vector3.new(v.Position.X, -27, v.Position.Z)))
			end
		else
			if v22 or v4 then
				return
			end
			for i, v in ipairs(v2:GetChildren()) do
				v.CFrame = CFrame.new((Vector3.new(v.Position.X, 53, v.Position.Z)))
			end
			v4 = true
		end
		return
	end
	if not v4 then
		return
	end
	v4 = false
	for i, v in ipairs(v2:GetChildren()) do
		v.CFrame = CFrame.new((Vector3.new(v.Position.X, -27, v.Position.Z)))
	end
end
game.ReplicatedStorage.GlobalData.TimeOfDay.Changed:connect(function(p1) --[[ Line: 110 | Upvalues: v3 (ref), RefreshSnowState (copy), v2 (copy) ]]
	wait()
	if p1 == "Midday" and game.ReplicatedStorage.GlobalData.Rain.Value == false then
		v3 = true
		RefreshSnowState()
		for i, v in ipairs(v2:GetChildren()) do
			v.ParticleEmitter.Enabled = true
		end
	else
		if p1 ~= "Night" then
			return
		end
		v3 = false
		RefreshSnowState()
		for i, v in ipairs(v2:GetChildren()) do
			v.ParticleEmitter.Enabled = false
		end
	end
end)
while true do
	RefreshSnowState()
	wait(3)
end