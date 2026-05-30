-- https://lua.expert/
local v1 = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PrehistoricModules = ReplicatedStorage.Objects.PrehistoricModules
local TweenService = game:GetService("TweenService")
local PrehistoricAssets = ReplicatedStorage.Objects:WaitForChild("PrehistoricAssets")
local v2 = false
function doTask() --[[ doTask | Line: 8 | Upvalues: v2 (ref), PrehistoricModules (copy), v1 (copy), PrehistoricAssets (copy), TweenService (copy) ]]
	if v2 then
		return
	end
	v2 = true
	repeat
		task.wait(1)
	until workspace:FindFirstChild("Map")
	local v12 = RaycastParams.new()
	v12.FilterDescendantsInstances = { workspace.Map }
	v12.FilterType = Enum.RaycastFilterType.Include
	local CameraShaker = require(PrehistoricModules.CameraShaker)
	local v22 = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(p1) --[[ Line: 19 ]]
		workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p1
	end)
	v22:Start()
	task.spawn(function() --[[ Line: 24 | Upvalues: v1 (ref), PrehistoricAssets (ref), TweenService (ref) ]]
		while true do
			local v2 = v1.HumanoidRootPart.Position + Vector3.new(math.random(-250, 250), 500, math.random(-250, 250))
			local v3 = PrehistoricAssets.Meteorite:Clone()
			v3.Parent = workspace.Effect
			v3.CFrame = CFrame.new(v2) * CFrame.Angles(1.5707963267948966, 0, 0)
			for k, v in pairs(v3:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = true
				end
				if v:IsA("Beam") then
					local t = { v.Width0, v.Width1 }
					v.Width0 = 0
					v.Width1 = 0
					TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
						Width0 = t[1],
						Width1 = t[2]
					}):Play()
				end
			end
			task.delay(1, function() --[[ Line: 50 | Upvalues: TweenService (ref), v3 (copy) ]]
				TweenService:Create(v3, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
					Size = Vector3.new(0, 0, 0)
				}):Play()
				for k, v in pairs(v3:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v.Enabled = false
					end
					if v:IsA("Beam") then
						TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0.2), {
							Width0 = 0,
							Width1 = 0
						}):Play()
					end
				end
			end)
			TweenService:Create(v3, TweenInfo.new(1.4, Enum.EasingStyle.Linear), {
				CFrame = v3.CFrame + v3.CFrame.UpVector * -450
			}):Play()
			task.wait(1)
		end
	end)
	repeat
		local v4 = v1.HumanoidRootPart.Position + Vector3.new(math.random(-500, 500), 500, math.random(-500, 500))
		local v5 = workspace:Raycast(v4, v4 + Vector3.new(0, -50000, 0), v12)
		if v5 then
			local v7 = v5.Position + Vector3.new(math.random(-250, 250), 0, math.random(-250, 250))
			local v8 = PrehistoricAssets.Meteorite:Clone()
			v8.Parent = workspace.Effect
			v8.CFrame = CFrame.lookAt(v4, v7) * CFrame.Angles(1.5707963267948966, 0, 0)
			task.delay(0.9, function() --[[ Line: 95 | Upvalues: v22 (copy), CameraShaker (copy), PrehistoricAssets (ref), v7 (copy), v8 (copy), TweenService (ref) ]]
				v22:Shake(CameraShaker.Presets.Bump2)
				local v1 = PrehistoricAssets.Exp:Clone()
				v1.Parent = workspace.Effect
				v1.CFrame = CFrame.new(v7)
				game.Debris:AddItem(v1, 7)
				game.Debris:AddItem(v8, 2)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v:Emit(v:GetAttribute("EmitCount"))
					end
				end
				v8.Transparency = 1
				for k, v in pairs(v8:GetDescendants()) do
					if v:IsA("Texture") then
						v.Transparency = 1
					end
				end
				task.spawn(function() --[[ Line: 117 | Upvalues: PrehistoricAssets (ref), v7 (ref), TweenService (ref) ]]
					for i = 1, 3 do
						local v1 = PrehistoricAssets.Rock:Clone()
						local v2 = v1["Rock" .. math.random(1, 5)]:Clone()
						v2.CFrame = CFrame.new(v7)
						v2.Anchored = false
						v2.Parent = workspace.Effect
						v1:Destroy()
						local v3 = math.random(-75, 75)
						local v4 = math.random(99, 125)
						v2.Velocity = Vector3.new(v3, v4, math.random(-75, 75))
						local v5 = math.random(-5, 5)
						local v6 = math.random(-5, 5)
						v2.RotVelocity = Vector3.new(v5, v6, math.random(-5, 5))
						task.delay(math.random(3, 6) / 10, function() --[[ Line: 130 | Upvalues: v2 (copy), TweenService (ref) ]]
							game.Debris:AddItem(v2, 0.5)
							TweenService:Create(v2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false, 0), {
								Size = Vector3.new(0, 0, 0)
							}):Play()
						end)
					end
				end)
			end)
			task.delay(1, function() --[[ Line: 143 | Upvalues: v8 (copy), TweenService (ref) ]]
				for k, v in pairs(v8:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v.Enabled = false
					end
					if v:IsA("Beam") then
						TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
							Width0 = 0,
							Width1 = 0
						}):Play()
					end
				end
			end)
			TweenService:Create(v8, TweenInfo.new(1, Enum.EasingStyle.Linear), {
				CFrame = v8.CFrame + v8.CFrame.UpVector * -(v4 - v7).Magnitude
			}):Play()
		end
		task.wait(0.75)
	until not v5
end
if not game.ReplicatedStorage.Values.SpecialEndless.Value then
	game.ReplicatedStorage.Values.SpecialEndless.Changed:Connect(function() --[[ Line: 175 ]]
		task.spawn(doTask)
	end)
	return
end
task.spawn(doTask)
game.ReplicatedStorage.Values.SpecialEndless.Changed:Connect(function() --[[ Line: 175 ]]
	task.spawn(doTask)
end)