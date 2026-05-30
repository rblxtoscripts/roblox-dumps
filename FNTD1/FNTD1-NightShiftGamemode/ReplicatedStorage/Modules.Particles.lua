-- https://lua.expert/
local TweenService = game:GetService("TweenService")
game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local LocalPlayer = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Particles = Remotes.Main.Particles
local v1 = if LocalPlayer then require(ReplicatedStorage.PlayerData.ClientState) else require(game.ServerScriptService.PlayerData.Manager)
local Sound = require(ReplicatedStorage.Libs.Sound)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Particles_2 = ReplicatedStorage.Particles
local Sounds = ReplicatedStorage.Objects.Sounds
local t = {}
local t2 = {
	Foxy = function(p1, p2, p3) --[[ Line: 21 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local v1 = Particles_2.FoxySlash:Clone()
		v1.Position = p3.Position
		v1.Parent = workspace.Visuals
		Sound.PlaySound(Sounds.Swing)
		task.wait(0.25)
		for k, v in pairs(v1.Hit:GetChildren()) do
			v:Emit(v:GetAttribute("EmitCount"))
		end
		task.delay(1, function() --[[ Line: 37 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Abyssal Foxy Idle"] = function(p1, p2, p3) --[[ Line: 42 | Upvalues: Misc (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if p2 and Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
			p1.DoingSound.Value:Destroy()
		end
		if p1:FindFirstChild("DoingSound") then
			p1.DoingSound:Destroy()
		end
		local ChargePos1 = p1:FindFirstChild("ChargePos1", true)
		local ParticlePos1 = p1:FindFirstChild("ParticlePos1", true)
		if not (ChargePos1 and ParticlePos1) then
			return
		end
		for v1, v2 in ParticlePos1:GetChildren() do
			v2:Destroy()
		end
		for v3, v4 in ChargePos1:GetChildren() do
			v4:Destroy()
		end
	end,
	["Abyssal Foxy Charge"] = function(p1, p2, p3, p4) --[[ Line: 66 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if p2 and Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
			p1.DoingSound.Value:Destroy()
		end
		if p1:FindFirstChild("DoingSound") then
			p1.DoingSound:Destroy()
		end
		local ChargePos1 = p1:FindFirstChild("ChargePos1", true)
		local ParticlePos1 = p1:FindFirstChild("ParticlePos1", true)
		if not (ChargePos1 and ParticlePos1) then
			return
		end
		for v1, v2 in ParticlePos1:GetChildren() do
			v2:Destroy()
		end
		if ChargePos1:FindFirstChildWhichIsA("ParticleEmitter") then
			return
		end
		for k, v in pairs(Particles_2["Abyssal Foxy"].Charge:GetChildren()) do
			v:Clone().Parent = ChargePos1
		end
		for k, v in pairs(ChargePos1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = true
			end
		end
	end,
	["Abyssal Foxy"] = function(p1, p2, p3) --[[ Line: 99 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Remotes (copy), Particles_2 (copy), Debris (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local ChargePos1 = p1:FindFirstChild("ChargePos1", true)
		local ParticlePos1 = p1:FindFirstChild("ParticlePos1", true)
		if not (ChargePos1 and (ParticlePos1 and (p2 and p2.Parent))) then
			return
		end
		if p1:FindFirstChild("DoingLaser") then
			return
		end
		local DoingLaser = Instance.new("StringValue")
		DoingLaser.Name = "DoingLaser"
		DoingLaser.Parent = p1
		local v1
		if p1:FindFirstChild("DoingSound") then
			v1 = p1.DoingSound.Value
		else
			v1 = Sound.PlaySound(Sounds.Laser)
			local DoingSound = Instance.new("ObjectValue")
			DoingSound.Name = "DoingSound"
			DoingSound.Value = v1
			DoingSound.Parent = p1
		end
		Remotes.Misc.Animations:Fire(p1, nil, true)
		if ChargePos1:FindFirstChildWhichIsA("ParticleEmitter") then
			for v2, v3 in ChargePos1:GetChildren() do
				v3:Destroy()
			end
		end
		if not p2.PrimaryPart:FindFirstChild("AbyssalFoxyPos") then
			Instance.new("Attachment", p2.PrimaryPart).Name = "AbyssalFoxyPos"
		end
		local AbyssalFoxyPos = p2.PrimaryPart:FindFirstChild("AbyssalFoxyPos")
		for v4, v5 in p1:GetChildren() do
			if v5.Name == "BlastFX" then
				v5:Destroy()
			end
		end
		if not ParticlePos1:FindFirstChildWhichIsA("Beam") then
			for k, v in pairs(Particles_2["Abyssal Foxy"].From:GetChildren()) do
				if not (p2 and p2.Parent) then
					return
				end
				if v:IsA("Beam") then
					if AbyssalFoxyPos then
						local v6 = v:Clone()
						v6.Attachment0 = ParticlePos1
						v6.Attachment1 = AbyssalFoxyPos
						v6.Parent = ParticlePos1
					end
					continue
				end
				v:Clone().Parent = ParticlePos1
			end
			if AbyssalFoxyPos then
				for k, v in pairs(Particles_2["Abyssal Foxy"].To:GetChildren()) do
					if not (p2 and p2.Parent) then
						return
					end
					local v7 = v:Clone()
					v7.Parent = AbyssalFoxyPos
					Debris:AddItem(v7, 1)
				end
			end
			for k, v in pairs(ParticlePos1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = true
				end
			end
			if AbyssalFoxyPos then
				for k, v in pairs(AbyssalFoxyPos:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v.Enabled = true
					end
				end
			end
			repeat
				task.wait(0.5)
			until not p2 or (not p2.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))
			task.delay(1, function() --[[ Line: 196 | Upvalues: p2 (copy), p1 (copy), Remotes (ref), ParticlePos1 (copy), DoingLaser (copy), v1 (ref) ]]
				if p2 and (p2.PrimaryPart and p2.PrimaryPart:FindFirstChild("AbyssalFoxyPos")) then
					p2.PrimaryPart:FindFirstChild("AbyssalFoxyPos"):Destroy()
				end
				if p1 then
					Remotes.Misc.ClearAnimations:Fire(p1, 0.5)
				end
				if ParticlePos1 then
					for k, v in pairs(ParticlePos1:GetChildren()) do
						v:Destroy()
					end
				end
				if DoingLaser then
					DoingLaser:Destroy()
				end
				if v1 then
					v1:Destroy()
				end
				if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
					p1.DoingSound.Value:Destroy()
				end
				if not p1:FindFirstChild("DoingSound") then
					return
				end
				p1.DoingSound:Destroy()
			end)
		end
	end,
	Rocket = function(p1, p2, p3) --[[ Line: 219 | Upvalues: Misc (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p3 then
			local tbl = {}
			if p1.Name == "Rocketeer Mangle" then
				table.insert(tbl, p1.Rocket)
				table.insert(tbl, p1.Rocket2)
			elseif p1.Name == "Artillery Puppet" then
				table.insert(tbl, p1["Mortar Canon"]["Mortar Projectile"])
			end
			for k, v in pairs(tbl) do
				if v and v.PrimaryPart then
					task.spawn(function() --[[ Line: 238 | Upvalues: v (copy), p1 (copy), p2 (copy), p3 (ref), TweenService (ref) ]]
						for k, v2 in pairs(v:GetDescendants()) do
							if v2:IsA("BasePart") then
								v2.Transparency = 1
							end
						end
						local v1 = v:Clone()
						for k, v2 in pairs(v1:GetDescendants()) do
							if v2:IsA("BasePart") then
								v2.Transparency = 0
								if v2 == v1.PrimaryPart then
									v2.Anchored = true
									continue
								end
								local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
								WeldConstraint.Part0 = v1.PrimaryPart
								WeldConstraint.Part1 = v2
								v2.Anchored = false
							end
						end
						v1.Parent = workspace.Visuals
						if p1.Name == "Artillery Puppet" then
							v1.PrimaryPart.Anchored = true
							local v2 = p2.PrimaryPart.Position - v.PrimaryPart.Position
							local v4 = math.log(1.001 + v2.Magnitude * 0.05)
							local v6 = v2 / v4 + Vector3.new(0, workspace.Gravity * v4 * 0.5, 0)
							for v7, v8 in v1:GetChildren() do
								v8.Anchored = false
							end
							local v9 = nil
							v9 = v1.PrimaryPart.Touched:Connect(function(p1) --[[ Line: 272 | Upvalues: v9 (ref), p3 (ref), v1 (copy), TweenService (ref) ]]
								if not (p1 and (p1.Parent and p1.Parent:IsDescendantOf(workspace.Enemies))) then
									return
								end
								v9:Disconnect()
								local Part = Instance.new("Part")
								Part.Size = Vector3.new(0.5, 0.5, 0.5)
								Part.Color = Color3.fromRGB(255, 170, 0)
								Part.Transparency = 0
								Part.Anchored = true
								Part.CanCollide = false
								Part.Shape = Enum.PartType.Ball
								Part.Material = Enum.Material.Neon
								Part.Position = p3 and p3.Position or v1.PrimaryPart.Position
								Part.Parent = workspace.Visuals
								TweenService:Create(Part, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									Transparency = 1,
									Size = Vector3.new(12, 12, 12)
								}):Play()
								v1:Destroy()
								task.wait(0.4)
								Part:Destroy()
							end)
							v1.PrimaryPart:ApplyImpulse(v6 * v1.PrimaryPart.AssemblyMass)
							task.delay(v4, function() --[[ Line: 294 | Upvalues: v1 (copy), v9 (ref), p3 (ref), TweenService (ref) ]]
								if not (v1 and v1.Parent) then
									return
								end
								if v9 then
									v9:Disconnect()
								end
								local Part = Instance.new("Part")
								Part.Size = Vector3.new(0.5, 0.5, 0.5)
								Part.Color = Color3.fromRGB(255, 170, 0)
								Part.Transparency = 0
								Part.Anchored = true
								Part.CanCollide = false
								Part.Shape = Enum.PartType.Ball
								Part.Material = Enum.Material.Neon
								Part.Position = p3 and p3.Position or v1.PrimaryPart.Position
								Part.Parent = workspace.Visuals
								TweenService:Create(Part, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									Transparency = 1,
									Size = Vector3.new(12, 12, 12)
								}):Play()
								v1:Destroy()
								task.wait(0.4)
								Part:Destroy()
							end)
						else
							v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position) * CFrame.Angles(-3.141592653589793, 1.5707963267948966, 0)
							local v10 = nil
							v10 = v1.PrimaryPart.Touched:Connect(function(p1) --[[ Line: 321 | Upvalues: v10 (ref), p3 (ref), v1 (copy), TweenService (ref) ]]
								if not (p1 and (p1.Parent and p1.Parent:IsDescendantOf(workspace.Enemies))) then
									return
								end
								v10:Disconnect()
								local Part = Instance.new("Part")
								Part.Size = Vector3.new(0.5, 0.5, 0.5)
								Part.Color = Color3.fromRGB(255, 170, 0)
								Part.Transparency = 0
								Part.Anchored = true
								Part.CanCollide = false
								Part.Shape = Enum.PartType.Ball
								Part.Material = Enum.Material.Neon
								Part.Position = p3 and p3.Position or v1.PrimaryPart.Position
								Part.Parent = workspace.Visuals
								TweenService:Create(Part, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									Transparency = 1,
									Size = Vector3.new(12, 12, 12)
								}):Play()
								v1:Destroy()
								task.wait(0.4)
								Part:Destroy()
							end)
							TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								CFrame = p3 * CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)
							}):Play()
							task.delay(0.4, function() --[[ Line: 343 | Upvalues: v1 (copy), v10 (ref), p3 (ref), TweenService (ref) ]]
								if not (v1 and v1.Parent) then
									return
								end
								if v10 then
									v10:Disconnect()
								end
								local Part = Instance.new("Part")
								Part.Size = Vector3.new(0.5, 0.5, 0.5)
								Part.Color = Color3.fromRGB(255, 170, 0)
								Part.Transparency = 0
								Part.Anchored = true
								Part.CanCollide = false
								Part.Shape = Enum.PartType.Ball
								Part.Material = Enum.Material.Neon
								Part.Position = p3 and p3.Position or v1.PrimaryPart.Position
								Part.Parent = workspace.Visuals
								TweenService:Create(Part, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									Transparency = 1,
									Size = Vector3.new(12, 12, 12)
								}):Play()
								v1:Destroy()
								task.wait(0.4)
								Part:Destroy()
							end)
						end
						task.wait(2)
						for k, v2 in pairs(v:GetDescendants()) do
							if v2:IsA("BasePart") then
								v2.Transparency = 0
							end
						end
					end)
				end
			end
		end
	end,
	Minigun = function(p1, p2, p3) --[[ Line: 378 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local ParticlePos1 = p1:FindFirstChild("ParticlePos1", true)
		local ParticlePos2 = p1:FindFirstChild("ParticlePos2", true)
		if ParticlePos1 then
			if ParticlePos1:FindFirstChild("ParticleCreated") then
				return
			end
			for k, v in pairs(Particles_2.Minigun:GetChildren()) do
				v:Clone().Parent = ParticlePos1
			end
			local ParticleCreated = ParticlePos1.ParticleCreated
			for k, v in pairs(ParticlePos1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = true
				end
			end
			repeat
				task.wait()
			until not p2 or (not p2.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))
			task.delay(0.2, function() --[[ Line: 408 | Upvalues: ParticlePos1 (copy) ]]
				for k, v in pairs(ParticlePos1:GetChildren()) do
					v:Destroy()
				end
			end)
		end
		if not ParticlePos2 then
			return
		end
		if ParticlePos2:FindFirstChild("ParticleCreated") then
			return
		end
		for k, v in pairs(Particles_2.Minigun:GetChildren()) do
			v:Clone().Parent = ParticlePos2
		end
		local ParticleCreated = ParticlePos2.ParticleCreated
		for k, v in pairs(ParticlePos2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = true
			end
		end
		repeat
			task.wait()
		until not p2 or (not p2.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))
		task.delay(0.2, function() --[[ Line: 435 | Upvalues: ParticlePos2 (copy) ]]
			for k, v in pairs(ParticlePos2:GetChildren()) do
				v:Destroy()
			end
		end)
	end,
	Chica = function(p1, p2, p3) --[[ Line: 443 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.23)
		local _, v1 = p2:GetBoundingBox()
		local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
		local IsACupcake = p1:FindFirstChild("IsACupcake", true)
		if IsACupcake then
			local v4 = IsACupcake.Parent
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			task.delay(1, function() --[[ Line: 464 | Upvalues: v4 (ref) ]]
				for k, v in pairs(v4:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Transparency = 0
					end
				end
			end)
			local v5 = v4:Clone()
			v5.Parent = workspace.Visuals
			for k, v in pairs(v5:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
					if v == v5.PrimaryPart then
						v.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v5.PrimaryPart)
					WeldConstraint.Part0 = v5.PrimaryPart
					WeldConstraint.Part1 = v
					v.Anchored = false
				end
			end
			v5.PrimaryPart.CFrame = v4.PrimaryPart.CFrame
			local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 489 ]]
				return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
			end
			local v6 = v5.PrimaryPart.CFrame
			local v7 = CFrame.new(v3)
			local v9 = CFrame.lookAt(v6.Position, v7.Position) * CFrame.new(0, 0, -((v6.Position - v7.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
			local v10 = TweenService:Create(v5.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
				CFrame = v9
			})
			v10:Play()
			v10.Completed:Wait()
			local v11 = TweenService:Create(v5.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				CFrame = CFrame.new(v3)
			})
			v11:Play()
			v11.Completed:Wait()
			v5:Destroy()
		end
		local v12 = Particles_2.ChicaExplosion:Clone()
		v12.Position = v3
		v12.Parent = workspace.Visuals
		Sound.PlaySound(Sounds.Explosion)
		for k, v in pairs(v12:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 515 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 520 | Upvalues: v12 (copy) ]]
			v12:Destroy()
		end)
	end,
	GunShot = function(p1, p2, p3, p4) --[[ Line: 525 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if p2 and Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local ShotParticlePoint = p1:FindFirstChild("ShotParticlePoint", true)
		local ShotParticlePoint2 = p1:FindFirstChild("ShotParticlePoint2", true)
		local ShotParticlePoint3 = p1:FindFirstChild("ShotParticlePoint3", true)
		local ShotParticlePoint4 = p1:FindFirstChild("ShotParticlePoint4", true)
		if p4 == "Shotgun" then
			Sound.PlaySound(Sounds.Shotgun)
		else
			Sound.PlaySound(Sounds.Gunshot)
		end
		if p1 and (p1.Name == "Valkyrie Chica" or (p1.Name == "Valkyrie Prime" or (p1.Name == "Turret1" or (p1.Name == "Turret2" or p1.Name == "Montgomery Gator")))) then
			local LeftFX = p1:FindFirstChild("LeftFX", true)
			local RightFX = p1:FindFirstChild("RightFX", true)
			if LeftFX and not LeftFX:FindFirstChildWhichIsA("ParticleEmitter") then
				for v1, v2 in Particles_2["Valkyrie Chica"]:GetChildren() do
					local v3 = v2:Clone()
					v3.Parent = LeftFX
					task.delay(0.75, function() --[[ Line: 553 | Upvalues: v3 (copy) ]]
						if v3 and v3.Parent then
							v3:Destroy()
						end
					end)
				end
			end
			if RightFX and not RightFX:FindFirstChildWhichIsA("ParticleEmitter") then
				for v4, v5 in Particles_2["Valkyrie Chica"]:GetChildren() do
					local v6 = v5:Clone()
					v6.Parent = RightFX
					task.delay(0.75, function() --[[ Line: 565 | Upvalues: v6 (copy) ]]
						if v6 and v6.Parent then
							v6:Destroy()
						end
					end)
				end
			end
		end
		if ShotParticlePoint then
			local v7 = Particles_2.GunShot.SparksStill:Clone()
			v7.Parent = ShotParticlePoint
			local v8 = Particles_2.GunShot.a2:Clone()
			v8.Parent = ShotParticlePoint
			for k, v in pairs(ShotParticlePoint:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 581 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(1, function() --[[ Line: 585 | Upvalues: v7 (copy), v8 (copy) ]]
				v7:Destroy()
				v8:Destroy()
			end)
		end
		if ShotParticlePoint2 then
			local v9 = Particles_2.GunShot.SparksStill:Clone()
			v9.Parent = ShotParticlePoint2
			local v10 = Particles_2.GunShot.a2:Clone()
			v10.Parent = ShotParticlePoint2
			for k, v in pairs(ShotParticlePoint2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 598 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(1, function() --[[ Line: 602 | Upvalues: v9 (copy), v10 (copy) ]]
				v9:Destroy()
				v10:Destroy()
			end)
		end
		if ShotParticlePoint3 then
			local v11 = Particles_2.GunShot.SparksStill:Clone()
			v11.Parent = ShotParticlePoint3
			local v12 = Particles_2.GunShot.a2:Clone()
			v12.Parent = ShotParticlePoint3
			for k, v in pairs(ShotParticlePoint3:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 615 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(1, function() --[[ Line: 619 | Upvalues: v11 (copy), v12 (copy) ]]
				v11:Destroy()
				v12:Destroy()
			end)
		end
		if not ShotParticlePoint4 then
			return
		end
		local v13 = Particles_2.GunShot.SparksStill:Clone()
		v13.Parent = ShotParticlePoint4
		local v14 = Particles_2.GunShot.a2:Clone()
		v14.Parent = ShotParticlePoint4
		for k, v in pairs(ShotParticlePoint4:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 632 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(1, function() --[[ Line: 636 | Upvalues: v13 (copy), v14 (copy) ]]
			v13:Destroy()
			v14:Destroy()
		end)
	end,
	["Balloon Boy"] = function(p1, p2, p3) --[[ Line: 644 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({
			p1.RightLauncher.RightMissile1,
			p1.RightLauncher.RightMissile2,
			p1.LeftLauncher.LeftMissile1,
			p1.LeftLauncher.LeftMissile2
		}) do
			task.spawn(function() --[[ Line: 653 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				v.Transparency = 1
				local v1 = v:Clone()
				v1.Transparency = 0
				v1.Anchored = true
				v1.CFrame = CFrame.lookAt(v.Position, p3.Position)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Position = p3.Position
				}):Play()
				task.delay(0.2, function() --[[ Line: 665 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.BalloonBoyExplosion:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 674 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 679 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 684 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
					Sound.PlaySound(Sounds.Explosion)
					v1:Destroy()
				end)
				task.wait(1)
				v.Transparency = 0
			end)
		end
	end,
	["Shadow Bonnie"] = function(p1, p2, p3) --[[ Line: 696 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingParticle") then
			return
		end
		local DoingParticle = Instance.new("StringValue")
		DoingParticle.Name = "DoingParticle"
		DoingParticle.Parent = p1
		local _, _2 = p1:GetBoundingBox()
		local v1 = Particles_2.ShadowBonnieAttack:Clone()
		v1.Position = p1.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
		v1.Parent = workspace.Visuals
		repeat
			task.wait(0.1)
		until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))))
		if p1:FindFirstChild("DoingParticle") then
			p1.DoingParticle:Destroy()
		end
		if not v1 then
			return
		end
		v1:Destroy()
	end,
	Mangle = function(p1, p2, p3) --[[ Line: 727 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ p1.RightCupCake, p1.LeftCupCake }) do
			task.spawn(function() --[[ Line: 736 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				local v1 = v:Clone()
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = p3
				}):Play()
				task.delay(0.1, function() --[[ Line: 762 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.ChicaExplosion:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 771 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 776 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 781 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
				task.wait(1)
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
					end
				end
			end)
		end
	end,
	["Toy Chica"] = function(p1, p2, p3) --[[ Line: 796 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ if p1.Name == "Rockstar Chica" then p1.RPG.Missile elseif p1.Name == "Demolition Toy Chica" then p1["CupCake Launcher"].CupCake else p1["CupCake Launcher"].CupCake.CupcakeModel }) do
			task.spawn(function() --[[ Line: 806 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				local v1 = v:Clone()
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = p3
				}):Play()
				task.delay(0.1, function() --[[ Line: 832 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.ChicaExplosion:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 841 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 846 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 851 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
				task.wait(1)
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
					end
				end
			end)
		end
	end,
	["Toy Bonnie"] = function(p1, p2, p3) --[[ Line: 865 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds.ToyBonnieLaser)
		Sound.PlaySound(Sounds.ToyBonnieLaser)
		local Position = p1["Right Gun"]:WaitForChild("GunPoint").Position
		local Position_2 = p1["Left Gun"]:WaitForChild("GunPoint").Position
		local v1 = Particles_2.ToyBonnieBullet:Clone()
		v1.CFrame = CFrame.lookAt(Position, p3.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
		v1.Parent = workspace.Visuals
		local v2 = Particles_2.ToyBonnieBullet:Clone()
		v2.CFrame = CFrame.lookAt(Position_2, p3.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
		v2.Parent = workspace.Visuals
		local v3 = TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = p3.Position
		})
		local v4 = TweenService:Create(v2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = p3.Position
		})
		v3:Play()
		v4:Play()
		task.delay(0.1, function() --[[ Line: 890 | Upvalues: v1 (copy), v2 (copy) ]]
			v1:Destroy()
			v2:Destroy()
		end)
	end,
	Puppet = function(p1, p2, p3, p4) --[[ Line: 896 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds.Sniper)
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		if not p1:FindFirstChild("Attacking") then
			Instance.new("StringValue", p1).Name = "Attacking"
		end
		for k, v in pairs(p1:GetDescendants()) do
			if v:IsA("BasePart") and (v.Parent.Name ~= "Present Model" and v.Parent.Name ~= p1.Name) then
				v.Transparency = 0
			end
		end
		task.wait(0.5)
		if ShotPosition then
			local v1 = Particles_2["Puppet VFX"].Shot:Clone()
			v1.CFrame = ShotPosition.WorldCFrame
			v1.Parent = workspace.Visuals
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			local v2 = Particles_2["Puppet VFX"].Trail:Clone()
			v2.Anchored = true
			v2.CFrame = ShotPosition.WorldCFrame
			v2.Parent = workspace.Visuals
			TweenService:Create(v2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				Position = p3.Position
			}):Play()
			task.delay(0.1, function() --[[ Line: 937 | Upvalues: Particles_2 (ref), p3 (ref) ]]
				local v1 = Particles_2["Puppet VFX"].Hit:Clone()
				v1.CFrame = p3
				v1.Parent = workspace.Visuals
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v:Emit(v:GetAttribute("EmitCount"))
					end
				end
				task.wait(1)
				v1:Destroy()
			end)
			task.delay(0.5, function() --[[ Line: 951 | Upvalues: v1 (copy), v2 (copy), p1 (copy) ]]
				v1:Destroy()
				v2:Destroy()
				if not p1:FindFirstChild("Attacking") then
					return
				end
				p1.Attacking:Destroy()
			end)
		end
		for k, v in pairs(p1:GetDescendants()) do
			if v:IsA("BasePart") and (v.Parent.Name ~= "Present Model" and v.Parent.Name ~= "Puppet") then
				v.Transparency = 1
			end
		end
	end,
	Bonnie = function(p1, p2, p3, p4) --[[ Line: 968 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingLaser") then
			return
		end
		local DoingLaser = Instance.new("StringValue")
		DoingLaser.Name = "DoingLaser"
		DoingLaser.Parent = p1
		local v1
		if p1:FindFirstChild("DoingSound") then
			v1 = p1.DoingSound.Value
		else
			v1 = Sound.PlaySound(Sounds.Laser)
			local DoingSound = Instance.new("ObjectValue")
			DoingSound.Name = "DoingSound"
			DoingSound.Value = v1
			DoingSound.Parent = p1
		end
		local v2 = if p4 and p4 == "Withered" then Particles_2.WitheredBonnieLaser:Clone() elseif p1.Name == "Reindeer Withered Bonnie" then Particles_2.ReindeerBonnieLaser:Clone() else Particles_2.BonnieLaser:Clone()
		v2.Parent = workspace.Visuals
		task.spawn(function() --[[ Line: 995 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("Beam") then
					local Transparency = v.Transparency
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
					task.spawn(function() --[[ Line: 1006 | Upvalues: v1 (copy), v22 (copy), v (copy), Transparency (copy) ]]
						for i = 1, 10 do
							local v12 = v1 - i * v22
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
						v.Transparency = Transparency
					end)
				end
			end
		end)
		repeat
			local _, v3 = pcall(function() --[[ Line: 1023 | Upvalues: v2 (copy), p1 (copy), p2 (copy), Misc (ref) ]]
				v2.Position = p1.Lazer.LazerHole.Position
				local Position = p2.PrimaryPart.Position
				if Misc.EnemyCFrameOffset[p2.Name] then
					Position = Position + Misc.EnemyCFrameOffset[p2.Name]
				end
				v2.a1.WorldPosition = Position
			end)
			task.wait(0.05)
		until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v3)))))
		task.delay(0.1, function() --[[ Line: 1034 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = false
					continue
				end
				if v:IsA("Beam") then
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					task.spawn(function() --[[ Line: 1041 | Upvalues: v1 (copy), v22 (copy), v (copy) ]]
						for i = 1, 10 do
							local v12 = 1 - (v1 - i * v22)
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
					end)
				end
			end
		end)
		task.delay(0.5, function() --[[ Line: 1055 | Upvalues: v1 (ref), p1 (copy), v2 (copy), DoingLaser (copy) ]]
			if v1 then
				v1:Destroy()
			end
			if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
				p1.DoingSound.Value:Destroy()
			end
			if p1:FindFirstChild("DoingSound") then
				p1.DoingSound:Destroy()
			end
			if v2 then
				v2:Destroy()
			end
			if not DoingLaser then
				return
			end
			DoingLaser:Destroy()
		end)
	end,
	["AOE Puppet Slash"] = function(p1, p2, p3, p4) --[[ Line: 1064 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds["Marionette\'s Puppet Slash"])
		local v1 = Particles_2.PuppetSlash:Clone()
		v1.CFrame = p1.HumanoidRootPart.CFrame
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1["Main slash"]:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		task.delay(2, function() --[[ Line: 1081 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Blighted Endo Freddy"] = function(p1, p2, p3, p4) --[[ Line: 1086 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingParticle") then
			return
		end
		local DoingParticle = Instance.new("StringValue")
		DoingParticle.Name = "DoingParticle"
		DoingParticle.Parent = p1
		local _, _2 = p1:GetBoundingBox()
		if p1.Name == "Great Escape Freddy" then
			local _3 = p3.Position - Vector3.new(0, 1, 0)
		else
			local _3 = p1.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
		end
		local v1 = Particles_2.FreddyScream:Clone()
		v1.Position = p1.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
		v1.Parent = workspace.Visuals
		repeat
			task.wait(0.1)
		until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))))
		if p1:FindFirstChild("DoingParticle") then
			p1.DoingParticle:Destroy()
		end
		if not v1 then
			return
		end
		v1:Destroy()
	end,
	["Baker Toy Chica"] = function(p1, p2, p3, p4) --[[ Line: 1119 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds["Watergun Shot"])
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		if ShotPosition then
			local v1 = Particles_2.ChicaTrail:Clone()
			v1.CFrame = ShotPosition.WorldCFrame
			v1.Parent = workspace.Visuals
			TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				Position = p3.Position
			}):Play()
			task.delay(0.1, function() --[[ Line: 1138 | Upvalues: Particles_2 (ref), p3 (ref) ]]
				local v1 = Particles_2.ChicaSplash:Clone()
				v1.CFrame = p3
				v1.Parent = workspace.Visuals
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v:Emit(v:GetAttribute("EmitCount"))
					end
				end
				task.wait(1)
				v1:Destroy()
			end)
			task.delay(0.5, function() --[[ Line: 1152 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
		end
	end,
	["Seven Seas Foxy"] = function(p1, p2, p3) --[[ Line: 1159 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds.Trident)
		local Trident = p1.Trident
		local v1 = Trident:Clone()
		v1.CFrame = Trident.CFrame
		v1.Parent = workspace.Visuals
		Trident.Transparency = 1
		local v2 = Particles_2.TridentTrail:Clone()
		v2.CFrame = v1.CFrame
		v2.Parent = v1
		local WeldConstraint = Instance.new("WeldConstraint", v1)
		WeldConstraint.Part0 = v1
		WeldConstraint.Part1 = v2
		v2.Anchored = false
		v2.Massless = true
		TweenService:Create(v1, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			CFrame = CFrame.lookAt(v1.Position, p3.Position) * CFrame.new(0, 0, -100) * CFrame.Angles(-1.5707963267948966, 0, 0)
		}):Play()
		task.delay(1, function() --[[ Line: 1188 | Upvalues: Trident (copy), v1 (copy) ]]
			Trident.Transparency = 0
			v1:Destroy()
		end)
	end,
	["Summer Toy Bonnie"] = function(p1, p2, p3, p4) --[[ Line: 1194 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds["Watergun Shot"])
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		if not ShotPosition then
			return
		end
		local v1 = Particles_2.ChicaTrail:Clone()
		v1.CFrame = ShotPosition.WorldCFrame
		v1.Parent = workspace.Visuals
		TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = p3.Position
		}):Play()
		task.delay(0.1, function() --[[ Line: 1213 | Upvalues: Particles_2 (ref), p3 (ref) ]]
			local v1 = Particles_2.ChicaSplash:Clone()
			v1.CFrame = p3
			v1.Parent = workspace.Visuals
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			task.wait(1)
			v1:Destroy()
		end)
		task.delay(0.5, function() --[[ Line: 1227 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Coco Boy"] = function(p1, p2, p3) --[[ Line: 1234 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.2)
		for k, v in pairs({ p1.CoconutL, p1.CoconutR }) do
			task.spawn(function() --[[ Line: 1245 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				local v1 = v:Clone()
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = p3
				}):Play()
				task.delay(0.1, function() --[[ Line: 1271 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.BalloonBoyExplosion:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 1280 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 1285 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 1290 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
				task.wait(1)
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
					end
				end
			end)
		end
	end,
	["Vendor Toy Chica"] = function(p1, p2, p3) --[[ Line: 1304 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ p1.MiniLauncher.Rocket.MainRocket }) do
			task.spawn(function() --[[ Line: 1313 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				v.Transparency = 1
				local v1 = v:Clone()
				v1.Transparency = 0
				v1.Anchored = true
				v1.CFrame = CFrame.lookAt(v.Position, p3.Position)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Position = p3.Position
				}):Play()
				task.delay(0.2, function() --[[ Line: 1325 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.BalloonBoyExplosion:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 1334 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 1339 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 1344 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
					Sound.PlaySound(Sounds.Explosion)
					v1:Destroy()
				end)
				task.wait(1)
				v.Transparency = 0
			end)
		end
	end,
	["Leviathan Mangle"] = function(p1, p2, p3) --[[ Line: 1356 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.4)
		Sound.PlaySound(Sounds["Leviathan Mangle"])
		local v1 = CFrame.lookAt(p1.HumanoidRootPart.Position - Vector3.new(0, 3, 0), p3.Position) * CFrame.Angles(math.rad(120), 0, 0)
		local v2 = Particles_2.WaterSmash:Clone()
		v2.CFrame = v1
		v2.Parent = workspace.Visuals
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		task.delay(3, function() --[[ Line: 1377 | Upvalues: v2 (copy) ]]
			v2:Destroy()
		end)
	end,
	["Algae FredBear"] = function(p1, p2, p3, p4) --[[ Line: 1383 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds["Algae Shot"])
		local tbl = {}
		for k, v in pairs(p1:GetDescendants()) do
			if v:IsA("Attachment") and string.find(v.Name, "ShotPosition") then
				table.insert(tbl, v)
			end
		end
		for k, v in pairs(tbl) do
			local v1 = Particles_2.ChicaTrail:Clone()
			v1.CFrame = v.WorldCFrame
			v1.Parent = workspace.Visuals
			TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				Position = p3.Position
			}):Play()
			task.delay(0.1, function() --[[ Line: 1406 | Upvalues: Particles_2 (ref), p3 (ref) ]]
				local v1 = Particles_2.ChicaSplash:Clone()
				v1.CFrame = p3
				v1.Parent = workspace.Visuals
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v:Emit(v:GetAttribute("EmitCount"))
					end
				end
				task.wait(1)
				v1:Destroy()
			end)
			task.delay(0.5, function() --[[ Line: 1420 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
		end
	end,
	["Rad Freddy"] = function(p1, p2, p3, p4) --[[ Line: 1427 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds.Sniper)
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		local v1 = if p1.Name == "Duelist Puppet" then Particles_2["Duelist Puppet VFX"] else Particles_2["Puppet VFX"]
		if not ShotPosition then
			return
		end
		local v2 = v1.Shot:Clone()
		v2.CFrame = ShotPosition.WorldCFrame
		v2.Parent = workspace.Visuals
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		local v3 = v1.Trail:Clone()
		v3.Anchored = true
		v3.CFrame = ShotPosition.WorldCFrame
		v3.Parent = workspace.Visuals
		TweenService:Create(v3, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = p3.Position
		}):Play()
		task.delay(0.1, function() --[[ Line: 1457 | Upvalues: v1 (copy), p3 (ref) ]]
			local v12 = v1.Hit:Clone()
			v12.CFrame = p3
			v12.Parent = workspace.Visuals
			for k, v in pairs(v12:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			task.wait(1)
			v12:Destroy()
		end)
		task.delay(0.5, function() --[[ Line: 1471 | Upvalues: v2 (copy), v3 (copy) ]]
			v2:Destroy()
			v3:Destroy()
		end)
	end,
	["Patriot Freddy"] = function(p1, p2, p3) --[[ Line: 1479 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ p1.Firework }) do
			task.spawn(function() --[[ Line: 1488 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				local v1 = v:Clone()
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position) * CFrame.Angles(-1.5707963267948966, 0, 0)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = p3 * CFrame.Angles(1.5707963267948966, 0, 0)
				}):Play()
				task.delay(0.1, function() --[[ Line: 1514 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.Firework:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 1523 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 1528 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 1533 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
				task.wait(3)
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
					end
				end
			end)
		end
	end,
	FazCade = function(p1, p2, p3, p4) --[[ Line: 1547 | Upvalues: Particles_2 (copy), TweenService (copy) ]]
		local v1 = Particles_2.GainMoney:Clone()
		v1.TextLabel.Text = "+" .. math.round(p4)
		v1.Parent = p1
		TweenService:Create(v1.TextLabel, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Position = UDim2.new(0, 0, 0.2, 0)
		}):Play()
		task.wait(0.8)
		local v2 = TweenService:Create(v1.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Transparency = 1
		})
		local v3 = TweenService:Create(v1.TextLabel.UIStroke, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Transparency = 1
		})
		v2:Play()
		v3:Play()
		task.wait(0.2)
		v1:Destroy()
	end,
	["Phantom Mangle"] = function(p1, p2, p3, p4) --[[ Line: 1564 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local ShotPosition1 = p1:FindFirstChild("ShotPosition1", true)
		for k, v in pairs({ ShotPosition1, (p1:FindFirstChild("ShotPosition2", true)) }) do
			local v1 = Particles_2["Phantom Mangle"].Shot:Clone()
			v1.CFrame = ShotPosition1.WorldCFrame
			v1.Parent = workspace.Visuals
			for k2, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("ParticleEmitter") then
					v2:Emit(v2:GetAttribute("EmitCount"))
				end
			end
			local v2 = Particles_2["Phantom Mangle"].Trail:Clone()
			v2.Anchored = true
			v2.CFrame = v.WorldCFrame
			v2.Parent = workspace.Visuals
			TweenService:Create(v2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				Position = p3.Position
			}):Play()
			task.delay(0.2, function() --[[ Line: 1591 | Upvalues: v1 (copy), v2 (copy) ]]
				v1:Destroy()
				v2:Destroy()
			end)
		end
	end,
	["Witch Toy Chica"] = function(p1, p2, p3) --[[ Line: 1598 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local _, v1 = p2:GetBoundingBox()
		local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
		local Beaker = p1.LeftArmParts:FindFirstChild("Beaker")
		if Beaker then
			for k, v in pairs(Beaker:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			task.delay(1, function() --[[ Line: 1616 | Upvalues: Beaker (copy) ]]
				for k, v in pairs(Beaker:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Transparency = 0
					end
				end
			end)
			local v4 = Beaker:Clone()
			v4.Parent = workspace.Visuals
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
					if v == v4.PrimaryPart then
						v.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v4.PrimaryPart)
					WeldConstraint.Part0 = v4.PrimaryPart
					WeldConstraint.Part1 = v
					v.Anchored = false
				end
			end
			v4.PrimaryPart.CFrame = Beaker.PrimaryPart.CFrame
			local v5 = (function(p1, p2) --[[ getmidcframe | Line: 1641 ]]
				return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
			end)(v4.PrimaryPart.CFrame, CFrame.new(v3)) + Vector3.new(0, 4, 0)
			local v6 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
				CFrame = v5
			})
			v6:Play()
			v6.Completed:Wait()
			local v7 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				CFrame = CFrame.new(v3)
			})
			v7:Play()
			v7.Completed:Wait()
			v4:Destroy()
		end
		local v8 = Particles_2.PoisonSplash:Clone()
		v8.Position = v3
		v8.Parent = workspace.Visuals
		for k, v in pairs(v8:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 1666 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 1671 | Upvalues: v8 (copy) ]]
			v8:Destroy()
		end)
	end,
	["Sentinel Bonnie"] = function(p1, p2, p3) --[[ Line: 1676 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ p1:FindFirstChild("ParticlePos1", true), (p1:FindFirstChild("ParticlePos2", true)) }) do
			task.spawn(function() --[[ Line: 1686 | Upvalues: v (copy), Particles_2 (ref), p2 (copy), p1 (copy) ]]
				if v:FindFirstChild("ParticleCreated") then
					return
				end
				for k, v2 in pairs(Particles_2.SentinelBonnie:GetChildren()) do
					v2:Clone().Parent = v
				end
				local ParticleCreated = v.ParticleCreated
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("ParticleEmitter") then
						v2.Enabled = true
					end
				end
				repeat
					task.wait()
				until not p2 or (not p2.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))
				task.delay(0.2, function() --[[ Line: 1707 | Upvalues: v (ref) ]]
					for k, v2 in pairs(v:GetChildren()) do
						v2:Destroy()
					end
				end)
			end)
		end
	end,
	["War Machine Foxy"] = function(p1, p2, p3) --[[ Line: 1716 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ p1:FindFirstChild("ParticlePos1", true), (p1:FindFirstChild("ParticlePos2", true)) }) do
			task.spawn(function() --[[ Line: 1726 | Upvalues: v (copy), Particles_2 (ref), p2 (copy), p1 (copy) ]]
				if v:FindFirstChild("ParticleCreated") then
					return
				end
				for k, v2 in pairs(Particles_2.WarMachineFoxy:GetChildren()) do
					v2:Clone().Parent = v
				end
				local ParticleCreated = v.ParticleCreated
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("ParticleEmitter") then
						v2.Enabled = true
					end
				end
				repeat
					task.wait()
				until not p2 or (not p2.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))
				task.delay(0.2, function() --[[ Line: 1747 | Upvalues: v (ref) ]]
					for k, v2 in pairs(v:GetChildren()) do
						v2:Destroy()
					end
				end)
			end)
		end
	end,
	SpringTrap = function(p1, p2, p3, p4) --[[ Line: 1756 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p4 == "EnemyHit" then
			local v1 = if p2 and p2:FindFirstChild("HumanoidRootPart") then p2.HumanoidRootPart.CFrame else nil
			if not v1 then
				return
			end
			local v2 = Particles_2.Blood:Clone()
			v2.CFrame = v1
			v2.Parent = workspace.Visuals
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			delay(1, function() --[[ Line: 1775 | Upvalues: v2 (copy) ]]
				v2:Destroy()
			end)
		else
			if p1.Name == "The King" then
				task.wait(0.8 * (if p1:FindFirstChild("CDMulti") then p1.CDMulti.Value else 1))
			end
			if p1.Name == "Frostbite Freddy" then
				task.wait(0.5 * (if p1:FindFirstChild("CDMulti") then p1.CDMulti.Value else 1))
			end
			if p1.Name == "Overlord Scott" then
				task.wait(0.8 * (if p1:FindFirstChild("CDMulti") then p1.CDMulti.Value else 1))
			end
			local WorldCFrame = p1:FindFirstChild("ShotPosition", true).WorldCFrame
			local v6 = if p1.Name == "The King" then Particles_2.KingKnife elseif p1.Name == "Frostbite Freddy" then Particles_2.Icicle else Particles_2.Knife
			v6:Clone().Parent = workspace.Visuals
			local t = {
				CFrame.Angles(0, 0, 0),
				CFrame.Angles(0, 0.4363323129985824, 0),
				CFrame.Angles(0, -0.4363323129985824, 0),
				CFrame.Angles(0, 0.8726646259971648, 0),
				CFrame.Angles(0, -0.8726646259971648, 0)
			}
			for i = 1, 5 do
				local v7 = v6:Clone()
				v7.Parent = workspace.Visuals
				local v8 = if v7:IsA("BasePart") then v7 else v7.PrimaryPart
				v8.CFrame = WorldCFrame * t[i]
				TweenService:Create(v8, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = v8.CFrame + v8.CFrame.LookVector * p4
				}):Play()
				delay(0.15, function() --[[ Line: 1817 | Upvalues: v7 (copy) ]]
					v7:Destroy()
				end)
			end
		end
	end,
	["Phantom Puppet"] = function(p1, p2, p3) --[[ Line: 1823 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local v1 = Particles_2.PhantomPuppetSlash:Clone()
		v1.PrimaryPart.CFrame = CFrame.lookAt(p1.PrimaryPart.Position, p3.Position) * CFrame.new(0, 0, -5)
		v1.Parent = workspace.Visuals
		TweenService:Create(v1.PrimaryPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			CFrame = CFrame.lookAt(v1.PrimaryPart.Position, p3.Position) * CFrame.new(0, 0, -100)
		}):Play()
		task.delay(1, function() --[[ Line: 1836 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Phantom Gold Freddy"] = function(p1, p2, p3, p4) --[[ Line: 1841 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds.Sniper)
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		if not ShotPosition then
			return
		end
		local v1 = Particles_2["Sniper 2"].Shot:Clone()
		v1.CFrame = ShotPosition.WorldCFrame
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		local v2 = Particles_2["Sniper 2"].Trail:Clone()
		v2.Anchored = true
		v2.CFrame = ShotPosition.WorldCFrame
		v2.Parent = workspace.Visuals
		TweenService:Create(v2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = p3.Position
		}):Play()
		task.delay(0.1, function() --[[ Line: 1869 | Upvalues: Particles_2 (ref), p3 (ref) ]]
			local v1 = Particles_2["Sniper 2"].Hit:Clone()
			v1.CFrame = p3
			v1.Parent = workspace.Visuals
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			task.wait(1)
			v1:Destroy()
		end)
		task.delay(0.5, function() --[[ Line: 1883 | Upvalues: v1 (copy), v2 (copy) ]]
			v1:Destroy()
			v2:Destroy()
		end)
	end,
	["Sniper Cupcake"] = function(p1, p2, p3, p4) --[[ Line: 1890 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		Sound.PlaySound(Sounds.Sniper)
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		if not ShotPosition then
			return
		end
		local v1 = Particles_2["Puppet VFX"].Shot:Clone()
		v1.CFrame = ShotPosition.WorldCFrame
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		local v2 = Particles_2["Puppet VFX"].Trail:Clone()
		v2.Anchored = true
		v2.CFrame = ShotPosition.WorldCFrame
		v2.Parent = workspace.Visuals
		TweenService:Create(v2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = p3.Position
		}):Play()
		task.delay(0.1, function() --[[ Line: 1918 | Upvalues: Particles_2 (ref), p3 (ref) ]]
			local v1 = Particles_2["Puppet VFX"].Hit:Clone()
			v1.CFrame = p3
			v1.Parent = workspace.Visuals
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v:Emit(v:GetAttribute("EmitCount"))
				end
			end
			task.wait(1)
			v1:Destroy()
		end)
		task.delay(0.5, function() --[[ Line: 1932 | Upvalues: v1 (copy), v2 (copy) ]]
			v1:Destroy()
			v2:Destroy()
		end)
	end,
	["Phantom Balloon Boy"] = function(p1, p2, p3) --[[ Line: 1939 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local Bomb = p1.Bomb
		local v1 = Bomb:Clone()
		v1.Parent = workspace.Visuals
		v1.PrimaryPart.CFrame = CFrame.lookAt(Bomb.PrimaryPart.Position, p3.Position)
		for k, v in pairs(Bomb:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
				if v == v1.PrimaryPart then
					v.Anchored = true
					continue
				end
				local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
				WeldConstraint.Part0 = v1.PrimaryPart
				WeldConstraint.Part1 = v
				v.Anchored = false
			end
		end
		TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			CFrame = CFrame.lookAt(p3.Position, p3.Position * (p3.LookVector * 5))
		}):Play()
		task.delay(0.2, function() --[[ Line: 1973 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
			local v1 = Particles_2.PhantomBalloonBoy:Clone()
			v1.Position = p3.Position
			v1.Parent = workspace.Visuals
			Sound.PlaySound(Sounds.Explosion)
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 1982 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(2, function() --[[ Line: 1987 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
		end)
		task.delay(0.2, function() --[[ Line: 1992 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
			Sound.PlaySound(Sounds.Explosion)
			v1:Destroy()
		end)
		task.wait(1)
		for k, v in pairs(Bomb:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
			end
		end
	end,
	["Phantom Chica"] = function(p1, p2, p3) --[[ Line: 2005 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local _, v1 = p2:GetBoundingBox()
		local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
		for k, v in pairs({ p1["L Cupcake"], p1["R Cupcake"] }) do
			task.spawn(function() --[[ Line: 2017 | Upvalues: v (copy), v3 (copy), TweenService (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				task.delay(1, function() --[[ Line: 2023 | Upvalues: v (ref) ]]
					for k, v2 in pairs(v:GetDescendants()) do
						if v2:IsA("BasePart") then
							v2.Transparency = 0
						end
					end
				end)
				local v1 = v:Clone()
				v1.Parent = workspace.Visuals
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = v.PrimaryPart.CFrame
				local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 2048 ]]
					return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
				end
				local v2 = v1.PrimaryPart.CFrame
				local v32 = CFrame.new(v3)
				local v5 = CFrame.lookAt(v2.Position, v32.Position) * CFrame.new(0, 0, -((v2.Position - v32.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
				local v6 = TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					CFrame = v5
				})
				v6:Play()
				v6.Completed:Wait()
				local v7 = TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					CFrame = CFrame.new(v3)
				})
				v7:Play()
				v7.Completed:Wait()
				v1:Destroy()
			end)
		end
		local v4 = nil
		task.delay(0.3, function() --[[ Line: 2068 | Upvalues: v4 (ref), Particles_2 (ref), v3 (copy), Sound (ref), Sounds (ref) ]]
			v4 = Particles_2.PhantomChicaSplash:Clone()
			v4.Position = v3
			v4.Parent = workspace.Visuals
			Sound.PlaySound(Sounds.Explosion)
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2077 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
		end)
		task.delay(1, function() --[[ Line: 2083 | Upvalues: v4 (ref) ]]
			if not v4 then
				return
			end
			v4:Destroy()
		end)
	end,
	["Phantom Freddy"] = function(p1, p2, p3, p4) --[[ Line: 2090 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingLaser") then
			return
		end
		local DoingLaser = Instance.new("StringValue")
		DoingLaser.Name = "DoingLaser"
		DoingLaser.Parent = p1
		local v1
		if p1:FindFirstChild("DoingSound") then
			v1 = p1.DoingSound.Value
		else
			v1 = Sound.PlaySound(Sounds.Laser)
			local DoingSound = Instance.new("ObjectValue")
			DoingSound.Name = "DoingSound"
			DoingSound.Value = v1
			DoingSound.Parent = p1
		end
		local v2 = Particles_2.PhantomFreddy:Clone()
		v2.Parent = workspace.Visuals
		task.delay(0, function() --[[ Line: 2117 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("Beam") then
					local Transparency = v.Transparency
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
					task.spawn(function() --[[ Line: 2128 | Upvalues: v1 (copy), v22 (copy), v (copy), Transparency (copy) ]]
						for i = 1, 10 do
							local v12 = v1 - i * v22
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
						v.Transparency = Transparency
					end)
				end
			end
		end)
		local PhantomVFXAttach = p1:FindFirstChild("PhantomVFXAttach", true)
		repeat
			local _, v3 = pcall(function() --[[ Line: 2148 | Upvalues: v2 (copy), PhantomVFXAttach (copy), p1 (copy), p2 (copy), Misc (ref) ]]
				v2.Position = if PhantomVFXAttach then PhantomVFXAttach.WorldPosition else p1.EndoMuzzle.HeadParts.HeadDebri.Position
				local Position = p2.PrimaryPart.Position
				if Misc.EnemyCFrameOffset[p2.Name] then
					Position = Position + Misc.EnemyCFrameOffset[p2.Name]
				end
				v2.hit.WorldPosition = Position
			end)
			task.wait(0.05)
		until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v3)))))
		task.delay(0.1, function() --[[ Line: 2159 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = false
					continue
				end
				if v:IsA("Beam") then
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					task.spawn(function() --[[ Line: 2166 | Upvalues: v1 (copy), v22 (copy), v (copy) ]]
						for i = 1, 10 do
							local v12 = 1 - (v1 - i * v22)
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
					end)
				end
			end
		end)
		task.delay(0.5, function() --[[ Line: 2180 | Upvalues: v1 (ref), p1 (copy), v2 (copy), DoingLaser (copy) ]]
			if v1 then
				v1:Destroy()
			end
			if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
				p1.DoingSound.Value:Destroy()
			end
			if p1:FindFirstChild("DoingSound") then
				p1.DoingSound:Destroy()
			end
			if v2 then
				v2:Destroy()
			end
			if not DoingLaser then
				return
			end
			DoingLaser:Destroy()
		end)
	end,
	["Astral Bonnie"] = function(p1, p2, p3, p4) --[[ Line: 2192 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingLaser") then
			return
		end
		local DoingLaser = Instance.new("StringValue")
		DoingLaser.Name = "DoingLaser"
		DoingLaser.Parent = p1
		local v1
		if p1:FindFirstChild("DoingSound") then
			v1 = p1.DoingSound.Value
		else
			v1 = Sound.PlaySound(Sounds.Laser)
			local DoingSound = Instance.new("ObjectValue")
			DoingSound.Name = "DoingSound"
			DoingSound.Value = v1
			DoingSound.Parent = p1
		end
		local v2 = if p1.Name == "Sorcerer Ennard" then Particles_2.SorcererEnnard:Clone() else Particles_2.Astral:Clone()
		v2.Parent = workspace.Visuals
		task.delay(0, function() --[[ Line: 2219 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("Beam") then
					local Transparency = v.Transparency
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
					task.spawn(function() --[[ Line: 2230 | Upvalues: v1 (copy), v22 (copy), v (copy), Transparency (copy) ]]
						for i = 1, 10 do
							local v12 = v1 - i * v22
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
						v.Transparency = Transparency
					end)
				end
			end
		end)
		local AstralAttach = p1:FindFirstChild("AstralAttach", true)
		repeat
			local _, v3 = pcall(function() --[[ Line: 2250 | Upvalues: v2 (copy), AstralAttach (copy), p1 (copy), p2 (copy), Misc (ref) ]]
				v2.Position = if AstralAttach then AstralAttach.WorldPosition else p1.EndoMuzzle.HeadParts.HeadDebri.Position
				local Position = p2.PrimaryPart.Position
				if Misc.EnemyCFrameOffset[p2.Name] then
					Position = Position + Misc.EnemyCFrameOffset[p2.Name]
				end
				v2.hit.WorldPosition = Position
			end)
			task.wait(0.05)
		until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v3)))))
		task.delay(0.1, function() --[[ Line: 2261 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = false
					continue
				end
				if v:IsA("Beam") then
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					task.spawn(function() --[[ Line: 2268 | Upvalues: v1 (copy), v22 (copy), v (copy) ]]
						for i = 1, 10 do
							local v12 = 1 - (v1 - i * v22)
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
					end)
				end
			end
		end)
		task.delay(0.5, function() --[[ Line: 2282 | Upvalues: v1 (ref), p1 (copy), v2 (copy), DoingLaser (copy) ]]
			if v1 then
				v1:Destroy()
			end
			if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
				p1.DoingSound.Value:Destroy()
			end
			if p1:FindFirstChild("DoingSound") then
				p1.DoingSound:Destroy()
			end
			if v2 then
				v2:Destroy()
			end
			if not DoingLaser then
				return
			end
			DoingLaser:Destroy()
		end)
	end,
	Scott = function(p1, p2, p3, p4) --[[ Line: 2291 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.2)
		Sound.PlaySound(Sounds.ScottSmash)
		local v1 = if p2 == "Small" then Particles_2.AnimdudeSmashSmall:Clone() else Particles_2.AnimdudeSmash:Clone()
		v1.Parent = workspace.Visuals
		v1.PrimaryPart.CFrame = (if p2 == "Small" then p4 else p3) + Vector3.new(0, 2, 0)
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2312 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	Overlord = function(p1, p2, p3, p4) --[[ Line: 2319 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.2)
		Sound.PlaySound(Sounds.ScottSmash)
		local v1 = if p2 == "Small" then Particles_2.AnimdudeSmashSmall:Clone() else Particles_2.Overlord:Clone()
		v1.Parent = workspace.Visuals
		v1.PrimaryPart.CFrame = (if p2 == "Small" then p4 else p3) + Vector3.new(0, 2, 0)
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2340 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Flame Empress Chica"] = function(p1, p2, p3, p4) --[[ Line: 2347 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.2)
		Sound.PlaySound(Sounds.FlameBurst)
		local v1 = Particles_2.FlameEmpressExplosion:Clone()
		v1.Parent = workspace.Visuals
		v1.PrimaryPart.CFrame = p3 + Vector3.new(0, -1.5, 0)
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2368 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	Gravelord = function(p1, p2, p3, p4) --[[ Line: 2374 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.2)
		Sound.PlaySound(Sounds.FlameBurst)
		local v1 = Particles_2.Gravelord:Clone()
		v1.Parent = workspace.Visuals
		v1.PrimaryPart.CFrame = p3 + Vector3.new(0, -1.5, 0)
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2395 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Nightmare Foxy"] = function(p1, p2, p3, p4) --[[ Line: 2401 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.2)
		Sound.PlaySound(Sounds.FlameBurst)
		local v1 = Particles_2.FoxyCannon:Clone()
		v1.Parent = workspace.Visuals
		v1.CFrame = p3 + Vector3.new(0, -2, 0)
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2422 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Circuit Breaker Freddy"] = function(p1, p2, p3, p4) --[[ Line: 2428 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local Shot1 = p1:FindFirstChild("Shot1", true)
		local Shot2 = p1:FindFirstChild("Shot2", true)
		local Shot3 = p1:FindFirstChild("Shot3", true)
		local Shot4 = p1:FindFirstChild("Shot4", true)
		if Shot1 then
			local v1 = Particles_2.GlitchedFreddy:Clone()
			v1.Parent = Shot1
			v1.Position = Shot1.WorldPosition
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2446 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(1, function() --[[ Line: 2450 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
		end
		if Shot2 then
			local v2 = Particles_2.GlitchedFreddy:Clone()
			v2.Parent = Shot2
			v2.Position = Shot2.WorldPosition
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2461 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(1, function() --[[ Line: 2465 | Upvalues: v2 (copy) ]]
				v2:Destroy()
			end)
		end
		if Shot3 then
			local v3 = Particles_2.GlitchedFreddy:Clone()
			v3.Parent = Shot3
			v3.Position = Shot3.WorldPosition
			for k, v in pairs(v3:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2476 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
			task.delay(1, function() --[[ Line: 2480 | Upvalues: v3 (copy) ]]
				v3:Destroy()
			end)
		end
		if not Shot4 then
			return
		end
		local v4 = Particles_2.GlitchedFreddy:Clone()
		v4.Parent = Shot4
		v4.Position = Shot4.WorldPosition
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2491 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(1, function() --[[ Line: 2495 | Upvalues: v4 (copy) ]]
			v4:Destroy()
		end)
	end,
	["Glitched Puppeteer"] = function(p1, p2, p3, p4) --[[ Line: 2502 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local v1 = Particles_2.GlitchedPuppeteer:Clone()
		v1.CFrame = p3
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(1, function() --[[ Line: 2518 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["The Crying Child"] = function(p1, p2, p3, p4) --[[ Line: 2523 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local ParticleAdded = Instance.new("StringValue", p1)
		ParticleAdded.Name = "ParticleAdded"
		local FlashlightBeam = p1:FindFirstChild("FlashlightBeam")
		local v1
		if FlashlightBeam then
			v1 = FlashlightBeam.Value
		else
			v1 = Particles_2.FlashlightBeam:Clone()
			v1.Parent = workspace.Visuals
			local FlashlightBeam_2 = Instance.new("ObjectValue", p1)
			FlashlightBeam_2.Name = "FlashlightBeam"
			FlashlightBeam_2.Value = v1
		end
		if v1:FindFirstChild("WeldConstraint") then
			v1.WeldConstraint:Destroy()
		end
		local v2 = p1:FindFirstChild("ShotPosition", true).WorldCFrame * CFrame.Angles(0, 0, 1.5707963267948966)
		v1.Beam.CFrame = v2
		v1.Length.CFrame = v2 + v1.Beam.CFrame.LookVector * p4
		v1.Beam.light.TextureLength = p4
		delay(0.3, function() --[[ Line: 2557 | Upvalues: ParticleAdded (copy) ]]
			ParticleAdded:Destroy()
		end)
		delay(0.5, function() --[[ Line: 2561 | Upvalues: p1 (copy), v1 (ref) ]]
			if p1 and p1:FindFirstChild("ParticleAdded") then
				return
			end
			v1:Destroy()
			if not p1:FindFirstChild("FlashlightBeam") then
				return
			end
			p1.FlashlightBeam:Destroy()
		end)
	end,
	["Endo 04"] = function(p1, p2, p3, p4) --[[ Line: 2577 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local ShotPosition = p1:FindFirstChild("ShotPosition", true)
		local ParticleAdded = p1:FindFirstChild("ParticleAdded")
		local v1
		if ParticleAdded then
			v1 = ParticleAdded.Value
		else
			local ParticleAdded_2 = Instance.new("ObjectValue", p1)
			ParticleAdded_2.Name = "ParticleAdded"
			v1 = Particles_2.Flamethrower:Clone()
			v1.Attachment.Fire.Enabled = false
			v1.Parent = workspace.Visuals
			v1.Anchored = false
			v1.CFrame = ShotPosition.WorldCFrame
			local Part = Instance.new("Part", p1)
			Part.Massless = true
			Part.Transparency = 1
			Part.CanCollide = false
			Part.Anchored = false
			Part.CFrame = ShotPosition.WorldCFrame
			local WeldConstraint = Instance.new("WeldConstraint", p1)
			WeldConstraint.Part0 = ShotPosition.Parent
			WeldConstraint.Part1 = Part
			local WeldConstraint_2 = Instance.new("WeldConstraint", Part)
			WeldConstraint_2.Part0 = Part
			WeldConstraint_2.Part1 = v1
			ParticleAdded_2.Value = v1
		end
		local DontDeleteParticle = Instance.new("StringValue", p1)
		DontDeleteParticle.Name = "DontDeleteParticle"
		v1.Attachment.Fire.Enabled = true
		delay(1, function() --[[ Line: 2621 | Upvalues: DontDeleteParticle (copy), p1 (copy), v1 (ref) ]]
			DontDeleteParticle:Destroy()
			task.wait()
			if p1:FindFirstChild("DontDeleteParticle") then
				return
			end
			v1.Attachment.Fire.Enabled = false
		end)
	end,
	["Nightmare Mangle"] = function(p1, p2, p3, p4) --[[ Line: 2630 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local v1 = if p2 and p2:FindFirstChild("HumanoidRootPart") then p2.HumanoidRootPart.CFrame else nil
		if not v1 then
			return
		end
		local v2 = Particles_2.Blood2:Clone()
		v2.CFrame = v1
		v2.Parent = workspace.Visuals
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(1, function() --[[ Line: 2648 | Upvalues: v2 (copy) ]]
			v2:Destroy()
		end)
	end,
	["Nightmare Chica"] = function(p1, p2, p3) --[[ Line: 2653 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		for k, v in pairs({ p1.Rocket.Model.Bazooka.Nightmare_Cupcake["Nightmare Cupcake"] }) do
			task.spawn(function() --[[ Line: 2662 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				local v1 = v:Clone()
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
				v1.Parent = workspace.Visuals
				TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = p3
				}):Play()
				task.delay(0.1, function() --[[ Line: 2688 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
					local v1 = Particles_2.NightmareChicaSplash:Clone()
					v1.Position = p3.Position
					v1.Parent = workspace.Visuals
					Sound.PlaySound(Sounds.Explosion)
					for k, v in pairs(v1:GetDescendants()) do
						if v:IsA("ParticleEmitter") then
							task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2697 | Upvalues: v (copy) ]]
								v:Emit(v:GetAttribute("EmitCount"))
							end)
						end
					end
					task.delay(2, function() --[[ Line: 2702 | Upvalues: v1 (copy) ]]
						v1:Destroy()
					end)
				end)
				task.delay(0.2, function() --[[ Line: 2707 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
				task.wait(1)
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
					end
				end
			end)
		end
	end,
	["Nightmare Balloon Boy"] = function(p1, p2, p3, p4) --[[ Line: 2722 | Upvalues: Misc (copy), TweenService (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local Dart = p1.Dart
		local v1 = Dart:Clone()
		v1.Parent = workspace.Visuals
		v1:PivotTo(Dart:GetPivot())
		v1.PrimaryPart.Anchored = true
		for k, v in pairs(v1:GetDescendants()) do
			if v ~= v1.PrimaryPart and v:IsA("BasePart") then
				local WeldConstraint = Instance.new("WeldConstraint", v1)
				WeldConstraint.Part0 = v1.PrimaryPart
				WeldConstraint.Part1 = v
				v.Anchored = false
			end
		end
		for k, v in pairs(Dart:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		local lookAt = CFrame.lookAt
		v1.PrimaryPart.CFrame = lookAt(v1.PrimaryPart.Position, (Vector3.new(p3.Position.X, v1.PrimaryPart.Position.Y, p3.Position.Z))) * CFrame.Angles(1.5707963267948966, 0, 0)
		local v3 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		local t = {}
		local lookAt_2 = CFrame.lookAt
		t.CFrame = lookAt_2(v1.PrimaryPart.Position, (Vector3.new(p3.Position.X, v1.PrimaryPart.Position.Y, p3.Position.Z))) * CFrame.new(0, 0, -p4) * CFrame.Angles(1.5707963267948966, 0, 0)
		TweenService:Create(v1.PrimaryPart, v3, t):Play()
		task.delay(0.2, function() --[[ Line: 2757 | Upvalues: Dart (copy), v1 (copy) ]]
			for k, v in pairs(Dart:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
				end
			end
			v1:Destroy()
		end)
	end,
	["Goliath Endo Freddy"] = function(p1, p2, p3, p4) --[[ Line: 2768 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		task.wait(0.8)
		local v1 = Particles_2.YellowSlash:Clone()
		v1.CFrame = p1.PrimaryPart.CFrame
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2786 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	["Party Chica"] = function(p1, p2, p3) --[[ Line: 2791 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local _, v1 = p2:GetBoundingBox()
		local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
		local Cake = p1.Cake
		if Cake then
			for k, v in pairs(Cake:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			task.delay(1, function() --[[ Line: 2809 | Upvalues: Cake (copy) ]]
				for k, v in pairs(Cake:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Transparency = 0
					end
				end
			end)
			local v4 = Cake:Clone()
			v4.Parent = workspace.Visuals
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
					if v == v4.PrimaryPart then
						v.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v4.PrimaryPart)
					WeldConstraint.Part0 = v4.PrimaryPart
					WeldConstraint.Part1 = v
					v.Anchored = false
				end
			end
			v4.PrimaryPart.CFrame = Cake.PrimaryPart.CFrame
			local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 2834 ]]
				return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
			end
			local v5 = v4.PrimaryPart.CFrame
			local v6 = CFrame.new(v3)
			local v8 = CFrame.lookAt(v5.Position, v6.Position) * CFrame.new(0, 0, -((v5.Position - v6.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
			local v9 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
				CFrame = v8
			})
			v9:Play()
			v9.Completed:Wait()
			local v10 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				CFrame = CFrame.new(v3)
			})
			v10:Play()
			v10.Completed:Wait()
			v4:Destroy()
		end
		local v11 = Particles_2.ChicaExplosion:Clone()
		v11.Position = v3
		v11.Parent = workspace.Visuals
		Sound.PlaySound(Sounds.Explosion)
		for k, v in pairs(v11:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 2860 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 2865 | Upvalues: v11 (copy) ]]
			v11:Destroy()
		end)
	end,
	["Galleon Foxy"] = function(p1, p2, p3) --[[ Line: 2870 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("ShotCFrame1", true) then
			local t = { p1:FindFirstChild("ShotCFrame1", true).WorldCFrame, p1:FindFirstChild("ShotCFrame2", true).WorldCFrame, p1:FindFirstChild("ShotCFrame3", true).WorldCFrame }
			for i = 1, 3 do
				local v1 = Particles_2.CannonShot:Clone()
				v1.CFrame = t[i]
				v1.Parent = workspace.Visuals
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						v:Emit(v:GetAttribute("EmitCount"))
					end
				end
				delay(2, function() --[[ Line: 2893 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end
		end
		local v2 = Particles_2.FoxyCannon:Clone()
		v2.CFrame = p3
		v2.Parent = workspace.Visuals
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 2909 | Upvalues: v2 (copy) ]]
			v2:Destroy()
		end)
	end,
	["Hydra Mangle"] = function(p1, p2, p3, p4) --[[ Line: 2914 | Upvalues: Misc (copy), Particles_2 (copy) ]]
		if p2 then
			if p2 and p2.PrimaryPart then
				p3 = p2.PrimaryPart.CFrame
			end
			if Misc.EnemyCFrameOffset[p2.Name] then
				local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
			end
		end
		if p4 == "Start" and not p1:FindFirstChild("ParticleAdded") then
			local ParticleAdded = Instance.new("ObjectValue", p1)
			ParticleAdded.Name = "ParticleAdded"
			local ShotPosition = p1:FindFirstChild("ShotPosition", true)
			local v1 = Particles_2.HydraMangle:Clone()
			v1.CFrame = ShotPosition.WorldCFrame
			v1.Parent = workspace.Visuals
			local WeldConstraint = Instance.new("WeldConstraint", v1)
			WeldConstraint.Part0 = ShotPosition.Parent
			WeldConstraint.Part1 = v1
			v1.Anchored = false
			ParticleAdded.Value = v1
			return
		end
		if p4 ~= "Destroy" or not p1:FindFirstChild("ParticleAdded") then
			return
		end
		if p1.ParticleAdded.Value then
			p1.ParticleAdded.Value:Destroy()
		end
		p1.ParticleAdded:Destroy()
	end,
	["Rave Demon Bonnie"] = function(p1, p2, p3, p4) --[[ Line: 2950 | Upvalues: Sounds (copy) ]]
		if p1 == "Destroy" and (workspace:FindFirstChild("Music") and workspace.Music:FindFirstChild("Rave Demon Bonnie Sound")) then
			workspace.Music["Rave Demon Bonnie Sound"]:Destroy()
			return
		end
		if workspace:FindFirstChild("Music") and workspace.Music:FindFirstChild("Rave Demon Bonnie Sound") then
			return
		end
		local Music = workspace:FindFirstChild("Music")
		if not Music then
			local Music_2 = Instance.new("Folder", workspace)
			Music_2.Name = "Music"
			Music = Music_2
		end
		local v1 = Sounds.RaveDemon:Clone()
		v1.Name = "Rave Demon Bonnie Sound"
		v1.Parent = Music
		v1:Play()
	end,
	["Spectral Chica"] = function(p1, p2, p3) --[[ Line: 2969 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local _, v1 = p2:GetBoundingBox()
		local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
		for k, v in pairs({ p1["L Cupcake"], p1["R Cupcake"] }) do
			task.spawn(function() --[[ Line: 2981 | Upvalues: v (copy), v3 (copy), TweenService (ref) ]]
				for k, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 1
					end
				end
				task.delay(1, function() --[[ Line: 2987 | Upvalues: v (ref) ]]
					for k, v2 in pairs(v:GetDescendants()) do
						if v2:IsA("BasePart") then
							v2.Transparency = 0
						end
					end
				end)
				local v1 = v:Clone()
				v1.Parent = workspace.Visuals
				for k, v2 in pairs(v1:GetDescendants()) do
					if v2:IsA("BasePart") then
						v2.Transparency = 0
						if v2 == v1.PrimaryPart then
							v2.Anchored = true
							continue
						end
						local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
						WeldConstraint.Part0 = v1.PrimaryPart
						WeldConstraint.Part1 = v2
						v2.Anchored = false
					end
				end
				v1.PrimaryPart.CFrame = v.PrimaryPart.CFrame
				local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 3012 ]]
					return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
				end
				local v2 = v1.PrimaryPart.CFrame
				local v32 = CFrame.new(v3)
				local v5 = CFrame.lookAt(v2.Position, v32.Position) * CFrame.new(0, 0, -((v2.Position - v32.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
				local v6 = TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
					CFrame = v5
				})
				v6:Play()
				v6.Completed:Wait()
				local v7 = TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					CFrame = CFrame.new(v3)
				})
				v7:Play()
				v7.Completed:Wait()
				v1:Destroy()
			end)
		end
		local v4 = nil
		task.delay(0.3, function() --[[ Line: 3032 | Upvalues: v4 (ref), Particles_2 (ref), v3 (copy), Sound (ref), Sounds (ref) ]]
			v4 = Particles_2.PhantomChicaSplash:Clone()
			v4.Position = v3
			v4.Parent = workspace.Visuals
			Sound.PlaySound(Sounds.Explosion)
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3041 | Upvalues: v (copy) ]]
						v:Emit(v:GetAttribute("EmitCount"))
					end)
				end
			end
		end)
		task.delay(1, function() --[[ Line: 3047 | Upvalues: v4 (ref) ]]
			if not v4 then
				return
			end
			v4:Destroy()
		end)
	end,
	["Fractured Bonnie"] = function(p1, p2, p3, p4) --[[ Line: 3054 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		if p1:FindFirstChild("DoingLaser") then
			return
		end
		local DoingLaser = Instance.new("StringValue")
		DoingLaser.Name = "DoingLaser"
		DoingLaser.Parent = p1
		local v1
		if p1:FindFirstChild("DoingSound") then
			v1 = p1.DoingSound.Value
		else
			v1 = Sound.PlaySound(Sounds.Laser)
			local DoingSound = Instance.new("ObjectValue")
			DoingSound.Name = "DoingSound"
			DoingSound.Value = v1
			DoingSound.Parent = p1
		end
		local v2 = Particles_2.WBonnie:Clone()
		v2.Parent = workspace.Visuals
		task.delay(0, function() --[[ Line: 3081 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("Beam") then
					local Transparency = v.Transparency
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
					task.spawn(function() --[[ Line: 3092 | Upvalues: v1 (copy), v22 (copy), v (copy), Transparency (copy) ]]
						for i = 1, 10 do
							local v12 = v1 - i * v22
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
						v.Transparency = Transparency
					end)
				end
			end
		end)
		repeat
			local _, v3 = pcall(function() --[[ Line: 3109 | Upvalues: v2 (copy), p1 (copy), p2 (copy), Misc (ref) ]]
				v2.Position = p1.Lazer.LazerHole.Position
				local Position = p2.PrimaryPart.Position
				if Misc.EnemyCFrameOffset[p2.Name] then
					Position = Position + Misc.EnemyCFrameOffset[p2.Name]
				end
				v2.hit.WorldPosition = Position
			end)
			task.wait(0.05)
		until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v3)))))
		task.delay(0.1, function() --[[ Line: 3120 | Upvalues: v2 (copy) ]]
			for k, v in pairs(v2:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = false
					continue
				end
				if v:IsA("Beam") then
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v22 = v1 / 10
					task.spawn(function() --[[ Line: 3127 | Upvalues: v1 (copy), v22 (copy), v (copy) ]]
						for i = 1, 10 do
							local v12 = 1 - (v1 - i * v22)
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
					end)
				end
			end
		end)
		task.delay(0.5, function() --[[ Line: 3141 | Upvalues: v1 (ref), p1 (copy), v2 (copy), DoingLaser (copy) ]]
			if v1 then
				v1:Destroy()
			end
			if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
				p1.DoingSound.Value:Destroy()
			end
			if p1:FindFirstChild("DoingSound") then
				p1.DoingSound:Destroy()
			end
			if v2 then
				v2:Destroy()
			end
			if not DoingLaser then
				return
			end
			DoingLaser:Destroy()
		end)
	end,
	["Tavern Chica"] = function(p1, p2, p3) --[[ Line: 3150 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local _, v1 = p2:GetBoundingBox()
		local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
		local TNT = p1.TNT
		if TNT then
			for k, v in pairs(TNT:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 1
				end
			end
			task.delay(1, function() --[[ Line: 3168 | Upvalues: TNT (copy) ]]
				for k, v in pairs(TNT:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Transparency = 0
					end
				end
			end)
			local v4 = TNT:Clone()
			v4.Parent = workspace.Visuals
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
					if v == v4.PrimaryPart then
						v.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v4.PrimaryPart)
					WeldConstraint.Part0 = v4.PrimaryPart
					WeldConstraint.Part1 = v
					v.Anchored = false
				end
			end
			v4.PrimaryPart.CFrame = TNT.PrimaryPart.CFrame
			local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 3193 ]]
				return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
			end
			local v5 = v4.PrimaryPart.CFrame
			local v6 = CFrame.new(v3)
			local v8 = CFrame.lookAt(v5.Position, v6.Position) * CFrame.new(0, 0, -((v5.Position - v6.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
			local v9 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
				CFrame = v8
			})
			v9:Play()
			v9.Completed:Wait()
			local v10 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				CFrame = CFrame.new(v3)
			})
			v10:Play()
			v10.Completed:Wait()
			v4:Destroy()
		end
		local v11 = Particles_2.TavernChicaExplosion:Clone()
		v11.Position = v3
		v11.Parent = workspace.Visuals
		Sound.PlaySound(Sounds.Explosion)
		for k, v in pairs(v11:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3219 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 3224 | Upvalues: v11 (copy) ]]
			v11:Destroy()
		end)
	end,
	["Deadeye Freddy"] = function(p1, p2, p3) --[[ Line: 3229 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
		if p2 and p2.PrimaryPart then
			p3 = p2.PrimaryPart.CFrame
		end
		if Misc.EnemyCFrameOffset[p2.Name] then
			p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
		end
		local v1 = Particles_2.PhantomChicaSplash:Clone()
		v1.Position = p3.Position
		v1.Parent = workspace.Visuals
		Sound.PlaySound(Sounds.Explosion)
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3243 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(1, function() --[[ Line: 3248 | Upvalues: v1 (copy) ]]
			if not v1 then
				return
			end
			v1:Destroy()
		end)
	end
}
local t3 = {}
t2["Spike Factory"] = function(p1, p2, p3, p4, p5, p6) --[[ Line: 3258 | Upvalues: t3 (copy), Particles_2 (copy), TweenService (copy) ]]
	if not t3[p1] then
		t3[p1] = {}
	end
	if p4 == "Update" then
		local v1 = math.ceil(p2 / p3)
		local count = 0
		for k, v in pairs(if p1.Name == "Gaia Chicax" then t3[p1][p6] else t3[p1]) do
			count = count + 1
			if v1 < count then
				v:Destroy()
			end
		end
	elseif p4 == "Add" then
		local v3
		if p1:GetAttribute("SpikeCFrame") then
			v3 = p1:GetAttribute("SpikeCFrame")
		else
			local v4 = math.random(0, 100) / 100
			v3 = p5 + Vector3.new(v4, 0, math.random(0, 100) / 100)
		end
		if p1.Name == "Gaia Chica" then
			local Spike = Particles_2.GaiaTrap:Clone()
			Spike.Name = "Spike"
			Spike.Parent = workspace.Visuals
			for k, v in pairs(Spike:GetDescendants()) do
				if v:IsA("BasePart") then
					if v == Spike.PrimaryPart then
						v.Anchored = true
					else
						local WeldConstraint = Instance.new("WeldConstraint", Spike.PrimaryPart)
						WeldConstraint.Part0 = Spike.PrimaryPart
						WeldConstraint.Part1 = v
						v.Anchored = false
					end
					v.CanCollide = false
				end
			end
			task.wait()
			Spike.PrimaryPart.CFrame = v3 - Vector3.new(0, 2, 0)
			table.insert(t3[p1], Spike)
			local v8 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			local t = {}
			t.CFrame = v3 * CFrame.Angles(0, math.rad((math.random(360))), 0) - Vector3.new(0, 1.25, 0)
			TweenService:Create(Spike.PrimaryPart, v8, t):Play()
		else
			if p1.Name ~= "Michael Afton" then
				local Spike = Particles_2.MendoTrap:Clone()
				Spike.Name = "Spike"
				Spike.PrimaryPart.CFrame = p1.PrimaryPart.CFrame
				Spike.Parent = workspace.Visuals
				table.insert(t3[p1], Spike)
				local v12 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
				local t = {}
				t.CFrame = v3 * CFrame.Angles(0, math.rad((math.random(360))), 0) - Vector3.new(0, 1, 0)
				TweenService:Create(Spike.PrimaryPart, v12, t):Play()
				return
			end
			local Spike = Particles_2.MichaelTrap:Clone()
			Spike.Name = "Spike"
			Spike.PrimaryPart.CFrame = p1.PrimaryPart.CFrame
			Spike.Parent = workspace.Visuals
			for k, v in pairs(Spike:GetDescendants()) do
				if v:IsA("BasePart") then
					if v == Spike.PrimaryPart then
						v.Anchored = true
					else
						local WeldConstraint = Instance.new("WeldConstraint", Spike.PrimaryPart)
						WeldConstraint.Part0 = Spike.PrimaryPart
						WeldConstraint.Part1 = v
						v.Anchored = false
					end
					v.CanCollide = false
				end
			end
			task.wait()
			table.insert(t3[p1], Spike)
			local v16 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			local t = {}
			t.CFrame = v3 * CFrame.Angles(0, math.rad((math.random(360))), 0) - Vector3.new(0, 1, 0)
			TweenService:Create(Spike.PrimaryPart, v16, t):Play()
		end
	else
		if p4 ~= "Remove" then
			return
		end
		local v18 = if p1.Name == "Gaia Chica" then t3[p1][p6] else t3[p1]
		if not v18 then
			return
		end
		for k, v in pairs(v18) do
			v:Destroy()
		end
	end
end
t2["Bomber Boy"] = function(p1, p2, p3) --[[ Line: 3358 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({
		p1["Big Boy Plane"].Bomb1.Bomb,
		p1["Big Boy Plane"].Bomb2.Bomb,
		p1["Big Boy Plane"].Bomb3.Bomb,
		p1["Big Boy Plane"].Bomb4.Bomb
	}) do
		task.spawn(function() --[[ Line: 3367 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3393 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3402 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3407 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3412 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
t2["Confetti Explosion"] = function(p1, p2, p3) --[[ Line: 3428 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.ConfettiExplosion:Clone()
	v1.Position = p3.Position
	v1.Parent = workspace.Visuals
	Sound.PlaySound(Sounds.Explosion)
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3442 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 3447 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Funtime Freddy"] = function(p1, p2, p3) --[[ Line: 3452 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1.BonBonCannonParts.BonBon }) do
		task.spawn(function() --[[ Line: 3461 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3487 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.ConfettiExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3496 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3501 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3506 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
function t2.NightMarionne(p1, p2, p3, p4) --[[ Line: 3522 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({
		p1["Marionne BackLazer"].BackBarLeft.UpperLazer2.LeftLazerHole,
		p1["Marionne BackLazer"].BackBarRight.UpperLaser1.RightLazerHole,
		p1["NightMarionne Lazers"].LeftLazer.LazerHole,
		p1["NightMarionne Lazers"].RightLazer.LazerHole
	}) do
		task.spawn(function() --[[ Line: 3531 | Upvalues: Particles_2 (ref), v (copy), p4 (copy) ]]
			local v1 = Particles_2.Marionne:Clone()
			v1.Parent = workspace.Visuals
			v1.CFrame = v.CFrame
			v1.hit.Position = Vector3.new(0, 0, p4 / 2)
			local v3 = false
			delay(0.5, function() --[[ Line: 3540 | Upvalues: v3 (ref) ]]
				v3 = true
			end)
			while not v3 do
				task.wait(0.01)
				v1.CFrame = v.CFrame
			end
			v1:Destroy()
		end)
	end
end
function t2.Tangle(p1, p2, p3) --[[ Line: 3554 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1["Meringue Launcher"].Meringue }) do
		task.spawn(function() --[[ Line: 3563 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3589 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3598 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3603 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3608 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
function t2.Elizabeth(p1, p2, p3) --[[ Line: 3624 | Upvalues: Misc (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local _, v1 = p2:GetBoundingBox()
	local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
	local IsItem = p1:FindFirstChild("IsItem", true)
	if not IsItem then
		return
	end
	local v4 = IsItem.Parent
	for k, v in pairs(v4:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	task.delay(1, function() --[[ Line: 3643 | Upvalues: v4 (ref) ]]
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
			end
		end
	end)
	local v5 = v4:Clone()
	v5.Parent = workspace.Visuals
	for k, v in pairs(v5:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = 0
			if v == v5.PrimaryPart then
				v.Anchored = true
				continue
			end
			local WeldConstraint = Instance.new("WeldConstraint", v5.PrimaryPart)
			WeldConstraint.Part0 = v5.PrimaryPart
			WeldConstraint.Part1 = v
			v.Anchored = false
		end
	end
	v5.PrimaryPart.CFrame = v4.PrimaryPart.CFrame
	local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 3668 ]]
		return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
	end
	local v6 = v5.PrimaryPart.CFrame
	local v7 = CFrame.new(v3)
	local v9 = CFrame.lookAt(v6.Position, v7.Position) * CFrame.new(0, 0, -((v6.Position - v7.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
	local v10 = TweenService:Create(v5.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
		CFrame = v9
	})
	v10:Play()
	v10.Completed:Wait()
	local v11 = TweenService:Create(v5.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		CFrame = CFrame.new(v3)
	})
	v11:Play()
	v11.Completed:Wait()
	v5:Destroy()
end
function t2.Bonnet(p1, p2, p3) --[[ Line: 3687 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1["Bon Bonnet Bullet"] }) do
		task.spawn(function() --[[ Line: 3696 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3722 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3731 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3736 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3741 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
t2["Jack O Cannon"] = function(p1, p2, p3) --[[ Line: 3757 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1.HeadParts["Jack-o-Cupcake"] }) do
		task.spawn(function() --[[ Line: 3766 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3792 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3801 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3806 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3811 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
t2["Jack O Chica"] = function(p1, p2, p3) --[[ Line: 3827 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1.Catapult["Jack-o-Cupcake"] }) do
		task.spawn(function() --[[ Line: 3836 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3862 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3871 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3876 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3881 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
t2["Old Man Consequences"] = function(p1, p2, p3) --[[ Line: 3897 | Upvalues: Misc (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	TweenService:Create(p2.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		CFrame = p1.PrimaryPart.CFrame
	}):Play()
end
t2["Fazbear Mafia"] = function(p1, p2, p3) --[[ Line: 3907 | Upvalues: Particles_2 (copy) ]]
	local v1 = Particles_2.BalloonBoyExplosion:Clone()
	v1.Position = p1
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3914 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 3919 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Pumpkin Balloon Boy"] = function(p1, p2, p3) --[[ Line: 3924 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1.LeftArmParts.Model["Jack-o-Cupcake"], p1.RightArmParts.Model["Jack-o-Cupcake"] }) do
		task.spawn(function() --[[ Line: 3933 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 3959 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 3968 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 3973 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 3978 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
function t2.Clowntrap(p1, p2, p3) --[[ Line: 3994 | Upvalues: Particles_2 (copy) ]]
	task.wait(0.8)
	local ParticlePosition = p1:FindFirstChild("ParticlePosition", true)
	local v1 = Particles_2.ChicaExplosion:Clone()
	v1.Position = ParticlePosition.WorldPosition
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4005 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 4010 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Super Freddy"] = function(p1, p2, p3, p4) --[[ Line: 4015 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = "DoingLaser" .. p4
	if p1:FindFirstChild(v1) then
		return
	end
	local v2 = Instance.new("StringValue")
	v2.Name = v1
	v2.Parent = p1
	local v3
	if p1:FindFirstChild("DoingSound") then
		v3 = p1.DoingSound.Value
	else
		v3 = Sound.PlaySound(Sounds.Laser)
		local DoingSound = Instance.new("ObjectValue")
		DoingSound.Name = "DoingSound"
		DoingSound.Value = v3
		DoingSound.Parent = p1
	end
	local v4 = Particles_2.LazerEye:Clone()
	v4.Parent = workspace.Visuals
	task.delay(0, function() --[[ Line: 4042 | Upvalues: v4 (copy) ]]
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("Beam") then
				local Transparency = v.Transparency
				local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v2 = v1 / 10
				v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
				task.spawn(function() --[[ Line: 4053 | Upvalues: v1 (copy), v2 (copy), v (copy), Transparency (copy) ]]
					for i = 1, 10 do
						local v12 = v1 - i * v2
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
						task.wait(0.01)
					end
					v.Transparency = Transparency
				end)
			end
		end
	end)
	local v5 = p1:FindFirstChild("LazerEyeVFX" .. p4, true)
	repeat
		local _, v6 = pcall(function() --[[ Line: 4073 | Upvalues: v4 (copy), v5 (copy), p2 (copy), Misc (ref) ]]
			v4.Position = v5.WorldPosition
			local Position = p2.PrimaryPart.Position
			if Misc.EnemyCFrameOffset[p2.Name] then
				Position = Position + Misc.EnemyCFrameOffset[p2.Name]
			end
			v4.hit.WorldPosition = Position
		end)
		task.wait(0.05)
	until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v6)))))
	task.delay(0.1, function() --[[ Line: 4084 | Upvalues: v4 (copy) ]]
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = false
				continue
			end
			if v:IsA("Beam") then
				local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v2 = v1 / 10
				task.spawn(function() --[[ Line: 4091 | Upvalues: v1 (copy), v2 (copy), v (copy) ]]
					for i = 1, 10 do
						local v12 = 1 - (v1 - i * v2)
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
						task.wait(0.01)
					end
				end)
			end
		end
	end)
	task.delay(0.5, function() --[[ Line: 4105 | Upvalues: v3 (ref), p1 (copy), v4 (copy), v2 (copy) ]]
		if v3 then
			v3:Destroy()
		end
		if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
			p1.DoingSound.Value:Destroy()
		end
		if p1:FindFirstChild("DoingSound") then
			p1.DoingSound:Destroy()
		end
		if v4 then
			v4:Destroy()
		end
		if not v2 then
			return
		end
		v2:Destroy()
	end)
end
t2["Juggernaut Bonnie"] = function(p1, p2, p3, p4) --[[ Line: 4114 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p4 == "Railgun Enemy" then
		local v1 = Particles_2.JuggernautRailgun:Clone()
		v1.CFrame = p3
		v1.Anchored = true
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(2, function() --[[ Line: 4132 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	else
		if p4 == "Minigun" then
			local ParticlePos1 = p1:FindFirstChild("ParticlePos1", true)
			if not ParticlePos1 then
				return
			end
			if ParticlePos1:FindFirstChild("ParticleCreated") then
				return
			end
			for k, v in pairs(Particles_2.JuggernautMinigun:GetChildren()) do
				v:Clone().Parent = ParticlePos1
			end
			local ParticleCreated = ParticlePos1.ParticleCreated
			for k, v in pairs(ParticlePos1:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = true
				end
			end
			repeat
				task.wait()
			until not p2 or (not p2.Parent or (not p1.ChosenTarget.Value or p1.ChosenTarget.Value ~= p2))
			task.delay(0.2, function() --[[ Line: 4158 | Upvalues: ParticlePos1 (copy) ]]
				for k, v in pairs(ParticlePos1:GetChildren()) do
					v:Destroy()
				end
			end)
			return
		end
		if p4 ~= "Railgun" then
			return
		end
		if p1:FindFirstChild("DoingLaser") then
			return
		end
		local DoingLaser = Instance.new("StringValue")
		DoingLaser.Name = "DoingLaser"
		DoingLaser.Parent = p1
		local v2
		if p1:FindFirstChild("DoingSound") then
			v2 = p1.DoingSound.Value
		else
			v2 = Sound.PlaySound(Sounds.Laser)
			local DoingSound = Instance.new("ObjectValue")
			DoingSound.Name = "DoingSound"
			DoingSound.Value = v2
			DoingSound.Parent = p1
		end
		local v3 = Particles_2.JuggernautRailgunBeam:Clone()
		v3.Parent = workspace.Visuals
		task.delay(0, function() --[[ Line: 4186 | Upvalues: v3 (copy) ]]
			for k, v in pairs(v3:GetDescendants()) do
				if v:IsA("Beam") then
					local Transparency = v.Transparency
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v2 = v1 / 10
					v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
					task.spawn(function() --[[ Line: 4197 | Upvalues: v1 (copy), v2 (copy), v (copy), Transparency (copy) ]]
						for i = 1, 10 do
							local v12 = v1 - i * v2
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
						v.Transparency = Transparency
					end)
				end
			end
		end)
		local RailgunPosition = p1:FindFirstChild("RailgunPosition", true)
		local sum = 0
		repeat
			local _, v4 = pcall(function() --[[ Line: 4218 | Upvalues: v3 (copy), RailgunPosition (copy), p2 (copy), Misc (ref) ]]
				v3.Position = RailgunPosition.WorldPosition
				local Position = p2.PrimaryPart.Position
				if Misc.EnemyCFrameOffset[p2.Name] then
					Position = Position + Misc.EnemyCFrameOffset[p2.Name]
				end
				v3.hit.WorldPosition = Position
			end)
			task.wait(0.05)
			sum = sum + 0.05
		until sum >= 0.5 or (not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v4))))))
		task.delay(0.1, function() --[[ Line: 4233 | Upvalues: v3 (copy) ]]
			for k, v in pairs(v3:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Enabled = false
					continue
				end
				if v:IsA("Beam") then
					local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
					local v2 = v1 / 10
					task.spawn(function() --[[ Line: 4240 | Upvalues: v1 (copy), v2 (copy), v (copy) ]]
						for i = 1, 10 do
							local v12 = 1 - (v1 - i * v2)
							v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
							task.wait(0.01)
						end
					end)
				end
			end
		end)
		task.delay(0.5, function() --[[ Line: 4254 | Upvalues: v2 (ref), p1 (copy), v3 (copy), DoingLaser (copy) ]]
			if v2 then
				v2:Destroy()
			end
			if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
				p1.DoingSound.Value:Destroy()
			end
			if p1:FindFirstChild("DoingSound") then
				p1.DoingSound:Destroy()
			end
			if v3 then
				v3:Destroy()
			end
			if not DoingLaser then
				return
			end
			DoingLaser:Destroy()
		end)
	end
end
t2["Nightguard Afton"] = function(p1, p2, p3, p4) --[[ Line: 4264 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.AftonHit:Clone()
	v1.CFrame = p2.PrimaryPart.CFrame
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(2, function() --[[ Line: 4280 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Rockstar Freddy"] = function(p1, p2, p3, p4) --[[ Line: 4285 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = p1.Missile:Clone()
	v1.Parent = workspace.Visuals
	v1.PrimaryPart.MainWeld:Destroy()
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Transparency = 0
			if v == v1.PrimaryPart then
				v.Anchored = true
				continue
			end
			local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
			WeldConstraint.Part0 = v1.PrimaryPart
			WeldConstraint.Part1 = v
			v.Anchored = false
		end
	end
	TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		CFrame = v1.PrimaryPart.CFrame - v1.PrimaryPart.Position + p3.Position
	}):Play()
	task.delay(0.2, function() --[[ Line: 4313 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref), v1 (copy) ]]
		local v12 = Particles_2.BalloonBoyExplosion:Clone()
		v12.Position = p3.Position
		v12.Parent = workspace.Visuals
		Sound.PlaySound(Sounds.Explosion)
		for k, v in pairs(v12:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4322 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 4327 | Upvalues: v12 (copy) ]]
			v12:Destroy()
		end)
		v1:Destroy()
	end)
end
t2["Security Puppet"] = function(p1, p2, p3) --[[ Line: 4335 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local tbl = {}
	for k, v in pairs(p1.Knives:GetChildren()) do
		table.insert(tbl, v)
	end
	for k, v in pairs(tbl) do
		task.spawn(function() --[[ Line: 4347 | Upvalues: v (copy), Particles_2 (ref), p3 (ref), TweenService (ref) ]]
			v.Transparency = 1
			local v1 = Particles_2.Knife:Clone()
			v1.CFrame = CFrame.lookAt(v.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 4358 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
			task.wait(0.4)
			v.Transparency = 0
		end)
	end
end
function t2.Chain(p1, p2, p3) --[[ Line: 4369 | Upvalues: Particles_2 (copy) ]]
	local v2 = (if p1.Name == "Molten Freddy" then Particles_2.MoltenFreddyBeam else Particles_2.EnnardChain):Clone()
	v2.Parent = workspace.Visuals
	local v3 = if p2 == p3 then p1.PrimaryPart.Position else p2.PrimaryPart.Position
	if not p3 then
		return
	end
	v2.Position = v3
	v2.hit.WorldPosition = p3.PrimaryPart.Position
	if p1.Name == "Ennard" then
		local v4 = Particles_2.EnnardLightning:Clone()
		v4.CFrame = p3.PrimaryPart.CFrame
		v4.Parent = workspace.Visuals
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v:Emit(v:GetAttribute("EmitCount"))
			end
		end
		delay(0.5, function() --[[ Line: 4392 | Upvalues: v4 (copy) ]]
			v4:Destroy()
		end)
	end
	delay(0.1, function() --[[ Line: 4397 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
end
t2["Molten Freddy"] = function(p1, p2, p3, p4) --[[ Line: 4402 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.MoltenFreddyExplosion:Clone()
	v1.CFrame = p2.PrimaryPart.CFrame
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(2, function() --[[ Line: 4418 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
local v2 = nil
t2["Kronos Endo Freddy"] = function(p1, p2, p3, p4) --[[ Line: 4424 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), v2 (ref) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p4 == "Timestop" then
		Sound.PlaySound(Sounds.KronosTimestop)
		local v1 = tick()
		v2 = v1
		game.Lighting.TimestopColorCorrection.Enabled = true
		delay(10, function() --[[ Line: 4436 | Upvalues: v2 (ref), v1 (copy) ]]
			if v2 ~= v1 then
				return
			end
			game.Lighting.TimestopColorCorrection.Enabled = false
		end)
	else
		Sound.PlaySound(Sounds.KronosSpear)
	end
end
t2["Popstar Chica"] = function(p1, p2, p3, p4) --[[ Line: 4446 | Upvalues: Sounds (copy) ]]
	if p1 == "Destroy" and (workspace:FindFirstChild("Music") and workspace.Music:FindFirstChild("Popstar Chicae Sound")) then
		workspace.Music["Popstar Chica Sound"]:Destroy()
		return
	end
	if workspace:FindFirstChild("Music") and workspace.Music:FindFirstChild("Popstar Chica Sound") then
		return
	end
	local Music = workspace:FindFirstChild("Music")
	if not Music then
		local Music_2 = Instance.new("Folder", workspace)
		Music_2.Name = "Music"
		Music = Music_2
	end
	local v1 = Sounds.PopstarChica:Clone()
	v1.Name = "Popstar Chica Sound"
	v1.Parent = Music
	v1:Play()
	p1.Destroying:Once(function() --[[ Line: 4464 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Dark Knight Puppet"] = function(p1, p2, p3, p4) --[[ Line: 4469 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	task.wait((if p1.Name == "Gilded Knight" then 0.4 else 0.7) * (if p1:FindFirstChild("CDMulti") then p1.CDMulti.Value else 1))
	local v3 = if p4 then Particles_2.SpecialDarkNightSmash else Particles_2.DarkKnightSmash
	local _, v4 = p1:GetBoundingBox()
	local v5 = if p1.Name == "Gilded Knight" then 2 else 2.5
	local v6 = v3:Clone()
	v6.Position = p1.PrimaryPart.Position - Vector3.new(0, v4.Y / v5, 0)
	v6.Parent = workspace.Visuals
	for k, v in pairs(v6:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(1, function() --[[ Line: 4495 | Upvalues: v6 (copy) ]]
		v6:Destroy()
	end)
end
t2["Present Boy"] = function(p1, p2, p3) --[[ Line: 4500 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1["Present Model"], p1["Present Model2"] }) do
		task.spawn(function() --[[ Line: 4509 | Upvalues: v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 1
				end
			end
			local v1 = v:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
			v1.PrimaryPart.Anchored = true
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.PrimaryPart.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.2, function() --[[ Line: 4527 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.BalloonBoyExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4536 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 4541 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 4546 | Upvalues: Sound (ref), Sounds (ref), v1 (copy) ]]
				Sound.PlaySound(Sounds.Explosion)
				v1:Destroy()
			end)
			task.wait(1)
			for k, v2 in pairs(v:GetDescendants()) do
				if v2:IsA("BasePart") then
					v2.Transparency = 0
				end
			end
		end)
	end
end
function t2.Icetrap(p1, p2, p3) --[[ Line: 4561 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.NightmareChicaSplash:Clone()
	v1.Position = p3.Position
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4573 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 4578 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Frost Plushtrap"] = function(p1, p2, p3) --[[ Line: 4583 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if not p1.BigSnowball then
		return
	end
	local v1 = p1.BigSnowball:Clone()
	v1.CFrame = p1.BigSnowball.CFrame
	v1.Parent = workspace.Visuals
	p1.BigSnowball.Transparency = 1
	TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		CFrame = p3
	}):Play()
	task.wait(0.2)
	v1:Destroy()
	p1.BigSnowball.Transparency = 0
	local v2 = Particles_2.FrostPlushtrapExplosion:Clone()
	v2.Position = p3.Position
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4611 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(1, function() --[[ Line: 4616 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
end
t2["Old Man Krampus"] = function(p1, p2, p3) --[[ Line: 4621 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local _, v1 = p2:GetBoundingBox()
	local v2 = Particles_2.DarkKnightSmash:Clone()
	v2.Position = p2.PrimaryPart.Position - Vector3.new(0, v1.Y / 2.5, 0)
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(1, function() --[[ Line: 4638 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
end
function t2.Moondrop(p1, p2, p3) --[[ Line: 4643 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.EnnardChain:Clone()
	v1.Parent = workspace.Visuals
	v1.Position = p1.PrimaryPart.Position
	v1.hit.WorldPosition = p2.PrimaryPart.Position
	local v2 = Particles_2.EnnardLightning:Clone()
	v2.CFrame = p2.PrimaryPart.CFrame
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(0.5, function() --[[ Line: 4668 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
	delay(0.1, function() --[[ Line: 4672 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
function t2.Sunshine(p1, p2, p3, p4) --[[ Line: 4677 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	task.wait(0.2)
	Sound.PlaySound(Sounds.FlameBurst)
	local v1 = Particles_2.FlameEmpressExplosion:Clone()
	v1.Parent = workspace.Visuals
	v1.PrimaryPart.CFrame = p1.PrimaryPart.CFrame - Vector3.new(0, 1.5, 0)
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(2, function() --[[ Line: 4698 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Glamrock Chica"] = function(p1, p2, p3) --[[ Line: 4703 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local Cupcake = Particles_2.Cupcake
	for k, v in pairs({ p1.GlamrockChicaParts["GChica RightWaterguncupcakevariant"].Parts.LazerHole, p1.GlamrockChicaParts["GChica LeftWaterguncupcakevariant"].Parts.LazerHole }) do
		task.spawn(function() --[[ Line: 4713 | Upvalues: Cupcake (copy), v (copy), p3 (ref), TweenService (ref), Particles_2 (ref), Sound (ref), Sounds (ref) ]]
			local v1 = Cupcake:Clone()
			for k, v2 in pairs(v1:GetDescendants()) do
				if v2:IsA("BasePart") then
					if v2 == v1.PrimaryPart then
						v2.Anchored = true
						continue
					end
					local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
					WeldConstraint.Part0 = v1.PrimaryPart
					WeldConstraint.Part1 = v2
					v2.Anchored = false
				end
			end
			v1.PrimaryPart.CFrame = CFrame.lookAt(v.Position, p3.Position)
			v1.Parent = workspace.Visuals
			TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = p3
			}):Play()
			task.delay(0.1, function() --[[ Line: 4733 | Upvalues: Particles_2 (ref), p3 (ref), Sound (ref), Sounds (ref) ]]
				local v1 = Particles_2.ChicaExplosion:Clone()
				v1.Position = p3.Position
				v1.Parent = workspace.Visuals
				Sound.PlaySound(Sounds.Explosion)
				for k, v in pairs(v1:GetDescendants()) do
					if v:IsA("ParticleEmitter") then
						task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4742 | Upvalues: v (copy) ]]
							v:Emit(v:GetAttribute("EmitCount"))
						end)
					end
				end
				task.delay(2, function() --[[ Line: 4747 | Upvalues: v1 (copy) ]]
					v1:Destroy()
				end)
			end)
			task.delay(0.2, function() --[[ Line: 4752 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
		end)
	end
end
t2["Apollo\'s Sun"] = function(p1, p2, p3) --[[ Line: 4759 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for k, v in pairs({ p1.SunParts.EnergySpear1, p1.SunParts.EnergySpear2, p1.SunParts.EnergySpear3 }) do
		task.spawn(function() --[[ Line: 4768 | Upvalues: v (copy), p1 (copy), Particles_2 (ref), TweenService (ref), p3 (ref) ]]
			v.Transparency = 1
			local v1 = if p1.Name == "Apollo\'s Moon" then Particles_2.EnergySpearMoon:Clone() else Particles_2.EnergySpear:Clone()
			v1.CFrame = v.CFrame
			v1.Parent = workspace.Visuals
			TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = CFrame.lookAt(p3.Position, p3.Position * Vector3.new(1, 1, 2))
			}):Play()
			task.delay(0.2, function() --[[ Line: 4781 | Upvalues: v1 (copy) ]]
				v1:Destroy()
			end)
			task.wait(0.4)
			v.Transparency = 0
		end)
	end
	Sound.PlaySound(Sounds.FlameBurst)
	local v1 = if p1.Name == "Apollo\'s Moon" then Particles_2.ApolloMoonExplosion:Clone() else Particles_2.ApolloSunExplosion:Clone()
	v1.Parent = workspace.Visuals
	v1.PrimaryPart.CFrame = p3 + Vector3.new(0, -1.5, 0)
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(2, function() --[[ Line: 4806 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Soulmate Puppet"] = function(p1, p2, p3) --[[ Line: 4811 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.ChicaExplosion:Clone()
	v1.Position = p3.Position
	v1.Parent = workspace.Visuals
	Sound.PlaySound(Sounds.Explosion)
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4825 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 4830 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
function t2.Eclipse(p1, p2, p3) --[[ Line: 4835 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	Sound.PlaySound(Sounds.ToyBonnieLaser)
	Sound.PlaySound(Sounds.ToyBonnieLaser)
	local Position = p1:WaitForChild("GunPoint1", true).Position
	local Position_2 = p1:WaitForChild("GunPoint2", true).Position
	local v1 = Particles_2.EclipseBullet:Clone()
	v1.CFrame = CFrame.lookAt(Position, p3.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
	v1.Parent = workspace.Visuals
	local v2 = Particles_2.EclipseBullet:Clone()
	v2.CFrame = CFrame.lookAt(Position_2, p3.Position) * CFrame.Angles(1.5707963267948966, 0, 0)
	v2.Parent = workspace.Visuals
	local v3 = TweenService:Create(v1, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Position = p3.Position
	})
	local v4 = TweenService:Create(v2, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Position = p3.Position
	})
	v3:Play()
	v4:Play()
	task.delay(0.1, function() --[[ Line: 4860 | Upvalues: v1 (copy), v2 (copy) ]]
		v1:Destroy()
		v2:Destroy()
	end)
end
function t2.Burntrap(p1, p2, p3) --[[ Line: 4866 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.BurntrapBall:Clone()
	v1.Position = p1.PrimaryPart.Position
	v1.Parent = workspace.Visuals
	local v3 = 1 * (if p1:FindFirstChild("CDMulti") then p1.CDMulti.Value else 1)
	TweenService:Create(v1, TweenInfo.new(v3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		CFrame = p3
	}):Play()
	task.wait(v3)
	v1:Destroy()
	local v4 = Particles_2.BurntrapImpact:Clone()
	v4.CFrame = p3
	v4.Parent = workspace.Visuals
	for k, v in pairs(v4:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	task.wait(1)
	v4:Destroy()
end
t2["Flaming Springtrap"] = function(p1, p2, p3) --[[ Line: 4900 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.FlamingSpringtrap:Clone()
	v1:PivotTo(p3)
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	task.wait(1)
	v1:Destroy()
end
t2["Dread Pirate Foxy"] = function(p1, p2, p3, p4) --[[ Line: 4920 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.DreadPirateFoxy:Clone()
	v1.CFrame = p3
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			v:Emit(v:GetAttribute("EmitCount"))
		end
	end
	delay(2, function() --[[ Line: 4936 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Android Mangle"] = function(p1, p2, p3) --[[ Line: 4941 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local WorldPosition = p1:FindFirstChild("ShotPosition", true).WorldPosition
	local WorldPosition_2 = p1:FindFirstChild("ShotPosition2", true).WorldPosition
	local v1 = Particles_2.BonnieLaser:Clone()
	v1.Position = WorldPosition
	local Position = p2.PrimaryPart.Position
	if Misc.EnemyCFrameOffset[p2.Name] then
		Position = Position + Misc.EnemyCFrameOffset[p2.Name]
	end
	v1.a1.WorldPosition = Position
	local v2 = Particles_2.BonnieLaser:Clone()
	v2.Position = WorldPosition
	v2.a1.WorldPosition = Position
	delay(1, function() --[[ Line: 4962 | Upvalues: v1 (copy), v2 (copy) ]]
		v1:Destroy()
		v2:Destroy()
	end)
end
t2["Alien Helpy"] = function(p1, p2, p3) --[[ Line: 4968 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.PhantomChicaSplash:Clone()
	v1.Position = p3.Position
	v1.Parent = workspace.Visuals
	Sound.PlaySound(Sounds.Explosion)
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 4982 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(1, function() --[[ Line: 4987 | Upvalues: v1 (copy) ]]
		if not v1 then
			return
		end
		v1:Destroy()
	end)
end
function t2.MXES(p1, p2, p3, p4) --[[ Line: 4994 | Upvalues: Misc (copy), t (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = os.time()
	t[p1] = v1
	for i = 1, 3 do
		for k, v in pairs(p1["Layer" .. i .. "VFX"]:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
			end
		end
	end
	task.wait(1)
	if t[p1] ~= v1 then
		return
	end
	for j = 1, 3 do
		for k, v in pairs(p1["Layer" .. j .. "VFX"]:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
	end
end
function t2.Chicazilla(p1, p2, p3, p4) --[[ Line: 5025 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p1:FindFirstChild("DoingLaser") then
		return
	end
	local DoingLaser = Instance.new("StringValue")
	DoingLaser.Name = "DoingLaser"
	DoingLaser.Parent = p1
	local v1
	if p1:FindFirstChild("DoingSound") then
		v1 = p1.DoingSound.Value
	else
		v1 = Sound.PlaySound(Sounds.GodzillaBeam)
		local DoingSound = Instance.new("ObjectValue")
		DoingSound.Name = "DoingSound"
		DoingSound.Value = v1
		DoingSound.Parent = p1
	end
	local v2 = Particles_2.Godzilla:Clone()
	v2.Parent = workspace.Visuals
	task.delay(0, function() --[[ Line: 5052 | Upvalues: v2 (copy) ]]
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("Beam") then
				local Transparency = v.Transparency
				local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v22 = v1 / 10
				v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
				task.spawn(function() --[[ Line: 5063 | Upvalues: v1 (copy), v22 (copy), v (copy), Transparency (copy) ]]
					for i = 1, 10 do
						local v12 = v1 - i * v22
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
						task.wait(0.01)
					end
					v.Transparency = Transparency
				end)
			end
		end
	end)
	local ParticlePosition = p1:FindFirstChild("ParticlePosition", true)
	repeat
		local _, v3 = pcall(function() --[[ Line: 5083 | Upvalues: v2 (copy), ParticlePosition (copy), p2 (copy), Misc (ref) ]]
			v2.Start:PivotTo(CFrame.new(ParticlePosition.WorldPosition))
			local Position = p2.PrimaryPart.Position
			if Misc.EnemyCFrameOffset[p2.Name] then
				Position = Position + Misc.EnemyCFrameOffset[p2.Name]
			end
			v2.Finish.Position = Position
		end)
		task.wait(0.05)
	until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v3)))))
	task.delay(0.1, function() --[[ Line: 5094 | Upvalues: v2 (copy) ]]
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = false
				continue
			end
			if v:IsA("Beam") then
				local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v22 = v1 / 10
				task.spawn(function() --[[ Line: 5101 | Upvalues: v1 (copy), v22 (copy), v (copy) ]]
					for i = 1, 10 do
						local v12 = 1 - (v1 - i * v22)
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
						task.wait(0.01)
					end
				end)
			end
		end
	end)
	task.delay(0.5, function() --[[ Line: 5115 | Upvalues: v1 (ref), p1 (copy), v2 (copy), DoingLaser (copy) ]]
		if v1 then
			v1:Destroy()
		end
		if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
			p1.DoingSound.Value:Destroy()
		end
		if p1:FindFirstChild("DoingSound") then
			p1.DoingSound:Destroy()
		end
		if v2 then
			v2:Destroy()
		end
		if not DoingLaser then
			return
		end
		DoingLaser:Destroy()
	end)
end
t2["Molten Foxy"] = function(p1, p2, p3) --[[ Line: 5124 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local _, v1 = p2:GetBoundingBox()
	local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
	local MortarProjectile = p1.VolcanicFoxyMortar:FindFirstChild("MortarProjectile")
	if MortarProjectile then
		for k, v in pairs(MortarProjectile:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		task.delay(1, function() --[[ Line: 5141 | Upvalues: MortarProjectile (copy) ]]
			for k, v in pairs(MortarProjectile:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
				end
			end
		end)
		local v4 = MortarProjectile:Clone()
		v4.Parent = workspace.Visuals
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
				if v == v4.PrimaryPart then
					v.Anchored = true
					continue
				end
				local WeldConstraint = Instance.new("WeldConstraint", v4.PrimaryPart)
				WeldConstraint.Part0 = v4.PrimaryPart
				WeldConstraint.Part1 = v
				v.Anchored = false
			end
		end
		v4.PrimaryPart.CFrame = MortarProjectile.PrimaryPart.CFrame
		local v5 = Particles_2["Molten Foxy"]["Lava Send VFX"]:Clone()
		v5.CFrame = p1.VolcanicFoxyMortar.MortarProjectile.ProjectileInner.CFrame
		v5.Parent = workspace.Visuals
		for k, v in pairs(v5:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5172 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 5177 | Upvalues: v5 (copy) ]]
			v5:Destroy()
		end)
		local v6 = (function(p1, p2) --[[ getmidcframe | Line: 5181 ]]
			return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
		end)(v4.PrimaryPart.CFrame, CFrame.new(v3)) + Vector3.new(0, 4, 0)
		local v7 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
			CFrame = v6
		})
		v7:Play()
		v7.Completed:Wait()
		local v8 = TweenService:Create(v4.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			CFrame = CFrame.new(v3)
		})
		v8:Play()
		v8.Completed:Wait()
		v4:Destroy()
	end
	local v9 = Particles_2["Molten Foxy"]["Lava Explosion"]:Clone()
	v9.Position = v3
	v9.Parent = workspace.Visuals
	for k, v in pairs(v9:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5206 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5211 | Upvalues: v9 (copy) ]]
		v9:Destroy()
	end)
end
function t2.LeBronnie(p1, p2, p3) --[[ Line: 5216 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.LeBronnie["Ball Send VFX"]:Clone()
	v1.Position = p1.Ball.Position
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5228 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v2 = Particles_2.LeBronnie["Ball Send VFX"]:Clone()
	v2.CFrame = p1.Ball.CFrame
	v2.Parent = workspace.Visuals
	v2.Anchored = false
	local WeldConstraint = Instance.new("WeldConstraint", v2)
	WeldConstraint.Part0 = p1.Ball
	WeldConstraint.Part1 = v2
	task.wait(1 * (if p1:FindFirstChild("CDMulti") then p1.CDMulti.Value else 1))
	local v4 = Particles_2.LeBronnie.Explosion:Clone()
	v4.Position = p2 and p2.PrimaryPart and p2.PrimaryPart.Position or p3.Position
	v4.Parent = workspace.Visuals
	for k, v in pairs(v4:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5251 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	v2:Destroy()
	task.delay(2, function() --[[ Line: 5258 | Upvalues: v1 (copy), v4 (copy) ]]
		v1:Destroy()
		v4:Destroy()
	end)
end
function t2.Gregory(p1, p2, p3, p4) --[[ Line: 5264 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p1:FindFirstChild("DoingLaser") then
		return
	end
	local DoingLaser = Instance.new("StringValue")
	DoingLaser.Name = "DoingLaser"
	DoingLaser.Parent = p1
	local v1 = Particles_2.Gregory:Clone()
	v1.Parent = workspace.Visuals
	task.delay(0, function() --[[ Line: 5293 | Upvalues: v1 (copy) ]]
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("Beam") then
				local Transparency = v.Transparency
				local v12 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v2 = v12 / 10
				v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
				task.spawn(function() --[[ Line: 5304 | Upvalues: v12 (copy), v2 (copy), v (copy), Transparency (copy) ]]
					for i = 1, 10 do
						local v1 = v12 - i * v2
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v1), NumberSequenceKeypoint.new(1, v1) })
						task.wait(0.01)
					end
					v.Transparency = Transparency
				end)
			end
		end
	end)
	local ParticlePosition = p1:FindFirstChild("ParticlePosition", true)
	repeat
		local _, v2 = pcall(function() --[[ Line: 5324 | Upvalues: v1 (copy), ParticlePosition (copy), p2 (copy), Misc (ref) ]]
			v1.Start:PivotTo(CFrame.new(ParticlePosition.WorldPosition))
			local Position = p2.PrimaryPart.Position
			if Misc.EnemyCFrameOffset[p2.Name] then
				Position = Position + Misc.EnemyCFrameOffset[p2.Name]
			end
			v1.Finish.Position = Position
		end)
		task.wait(0.05)
	until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v2)))))
	task.delay(0.1, function() --[[ Line: 5335 | Upvalues: v1 (copy) ]]
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = false
				continue
			end
			if v:IsA("Beam") then
				local v12 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v2 = v12 / 10
				task.spawn(function() --[[ Line: 5342 | Upvalues: v12 (copy), v2 (copy), v (copy) ]]
					for i = 1, 10 do
						local v1 = 1 - (v12 - i * v2)
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v1), NumberSequenceKeypoint.new(1, v1) })
						task.wait(0.01)
					end
				end)
			end
		end
	end)
	task.delay(0.5, function() --[[ Line: 5356 | Upvalues: p1 (copy), v1 (copy), DoingLaser (copy) ]]
		if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
			p1.DoingSound.Value:Destroy()
		end
		if p1:FindFirstChild("DoingSound") then
			p1.DoingSound:Destroy()
		end
		if v1 then
			v1:Destroy()
		end
		if not DoingLaser then
			return
		end
		DoingLaser:Destroy()
	end)
end
t2["Tiger Rock"] = function(p1, p2, p3, p4) --[[ Line: 5365 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	for i = 1, 3 do
		local v1 = Particles_2["Tiger Rock"]["InFront" .. i]:Clone()
		v1:PivotTo(p1.PrimaryPart.CFrame + p1.PrimaryPart.CFrame.LookVector * 5)
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay") or 0, function() --[[ Line: 5378 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		task.delay(2, function() --[[ Line: 5383 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end
	local v2 = Particles_2["Tiger Rock"]["Area Wisps"]:Clone()
	v2.Position = p3.Position - Vector3.new(0, 3, 0)
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay") or 0, function() --[[ Line: 5394 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5399 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
end
t2["Jester Puppet"] = function(p1, p2, p3, p4) --[[ Line: 5404 | Upvalues: Misc (copy), Particles_2 (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2["Jester Puppet"].Shard:Clone()
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("BasePart") then
			if v == v1.PrimaryPart then
				v.Anchored = true
				continue
			end
			v.Anchored = false
			local WeldConstraint = Instance.new("WeldConstraint", v1.PrimaryPart)
			WeldConstraint.Part0 = v1.PrimaryPart
			WeldConstraint.Part1 = v
		end
	end
	v1.PrimaryPart.CFrame = CFrame.lookAt(v1.PrimaryPart.Position, p3.Position)
	local v2 = TweenService:Create(v1.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		CFrame = v1.PrimaryPart.CFrame - v1.PrimaryPart.Position + p3.Position
	})
	v2:Play()
	v2.Completed:Wait()
	v1:Destroy()
	local v3 = Particles_2["Jester Puppet"].Hit:Clone()
	v3.Position = p3.Position
	v3.Parent = workspace.Visuals
	for k, v in pairs(v3:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay") or 0, function() --[[ Line: 5439 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5444 | Upvalues: v3 (copy) ]]
		v3:Destroy()
	end)
end
t2["ITP Springbonnie"] = function(p1, p2, p3, p4) --[[ Line: 5449 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p1:FindFirstChild("DoingLaser") then
		return
	end
	local DoingLaser = Instance.new("StringValue")
	DoingLaser.Name = "DoingLaser"
	DoingLaser.Parent = p1
	local v1
	if p1:FindFirstChild("DoingSound") then
		v1 = p1.DoingSound.Value
	else
		v1 = Sound.PlaySound(Sounds["ITP Beam"])
		local DoingSound = Instance.new("ObjectValue")
		DoingSound.Name = "DoingSound"
		DoingSound.Value = v1
		DoingSound.Parent = p1
	end
	local v2 = Particles_2["TP Springbonnie"]:Clone()
	v2.Parent = workspace.Visuals
	task.delay(0, function() --[[ Line: 5476 | Upvalues: v2 (copy) ]]
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("Beam") then
				local Transparency = v.Transparency
				local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v22 = v1 / 10
				v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 1) })
				task.spawn(function() --[[ Line: 5487 | Upvalues: v1 (copy), v22 (copy), v (copy), Transparency (copy) ]]
					for i = 1, 10 do
						local v12 = v1 - i * v22
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
						task.wait(0.01)
					end
					v.Transparency = Transparency
				end)
			end
		end
	end)
	local ParticlePosition = p1:FindFirstChild("ParticlePosition", true)
	repeat
		local _, v3 = pcall(function() --[[ Line: 5507 | Upvalues: v2 (copy), ParticlePosition (copy), p2 (copy), Misc (ref) ]]
			v2.Start:PivotTo(CFrame.new(ParticlePosition.WorldPosition))
			local Position = p2.PrimaryPart.Position
			if Misc.EnemyCFrameOffset[p2.Name] then
				Position = Position + Misc.EnemyCFrameOffset[p2.Name]
			end
			v2.End:PivotTo(CFrame.new(Position))
		end)
		task.wait(0.05)
	until not p2 or (not p2.Parent or (not p1 or (not p1.Parent or (not p1.ChosenTarget.Value or (p1.ChosenTarget.Value ~= p2 or v3)))))
	task.delay(0.1, function() --[[ Line: 5518 | Upvalues: v2 (copy) ]]
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				v.Enabled = false
				continue
			end
			if v:IsA("Beam") then
				local v1 = v.Transparency.Keypoints[#v.Transparency.Keypoints].Value
				local v22 = v1 / 10
				task.spawn(function() --[[ Line: 5525 | Upvalues: v1 (copy), v22 (copy), v (copy) ]]
					for i = 1, 10 do
						local v12 = 1 - (v1 - i * v22)
						v.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v12), NumberSequenceKeypoint.new(1, v12) })
						task.wait(0.01)
					end
				end)
			end
		end
	end)
	task.delay(0.5, function() --[[ Line: 5539 | Upvalues: v1 (ref), p1 (copy), v2 (copy), DoingLaser (copy) ]]
		if v1 then
			v1:Destroy()
		end
		if p1:FindFirstChild("DoingSound") and p1.DoingSound.Value then
			p1.DoingSound.Value:Destroy()
		end
		if p1:FindFirstChild("DoingSound") then
			p1.DoingSound:Destroy()
		end
		if v2 then
			v2:Destroy()
		end
		if not DoingLaser then
			return
		end
		DoingLaser:Destroy()
	end)
end
function t2.JJ(p1, p2, p3, p4) --[[ Line: 5548 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2["JJ Explosion"]:Clone()
	v1.Position = p3.Position
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay") or 0, function() --[[ Line: 5560 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(3, function() --[[ Line: 5565 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Chica\'s Magic Rainbow"] = function(p1, p2, p3, p4) --[[ Line: 5570 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2["Chica Rainbow"]:Clone()
	v1.Position = p1.PrimaryPart.Position
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay") or 0, function() --[[ Line: 5582 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5587 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Cyber Police Roxy"] = function(p1, p2, p3) --[[ Line: 5592 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	Sound.PlaySound(Sounds["Cyber Police Roxy"])
	local v1 = Particles_2["Cyber Police Roxy"]:Clone()
	v1.Hit.CFrame = CFrame.lookAt(p3.Position, p3.Position + p3.LookVector * 3)
	local WorldPosition = p1:FindFirstChild("AttackPosition", true).WorldPosition
	v1.Send.CFrame = CFrame.lookAt(WorldPosition, p3.Position)
	v1.Parent = workspace.Visuals
	delay(0.2, function() --[[ Line: 5608 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Flipside Freddy"] = function(p1, p2, p3) --[[ Line: 5613 | Upvalues: Particles_2 (copy), Misc (copy), Sound (copy), Sounds (copy) ]]
	if p1 == "Portal" then
		local v1 = Particles_2["Flipside Freddy"]:Clone()
		v1.CFrame = p2.CFrame
		v1.Parent = workspace.Visuals
		delay(2, function() --[[ Line: 5621 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
		return
	end
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if not Misc.EnemyCFrameOffset[p2.Name] then
		Sound.PlaySound(Sounds["Flipside Freddy"])
		return
	end
	local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	Sound.PlaySound(Sounds["Flipside Freddy"])
end
t2["Engineer Chica"] = function(p1, p2, p3) --[[ Line: 5636 | Upvalues: t2 (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 == "Turret" then
		local _, v1 = pcall(function() --[[ Line: 5638 | Upvalues: p1 (copy), t2 (ref) ]]
			print(p1.TurretObject.Value)
			task.spawn(t2.GunShot, p1.TurretObject.Value)
		end)
		if not v1 then
			return
		end
		warn(v1)
	else
		local v2 = Particles_2["Engineer Chica"]:Clone()
		v2.Explosion.CFrame = p3
		v2.Send.CFrame = p1:FindFirstChild("AttackPosition", true).WorldCFrame
		v2.Parent = workspace.Visuals
		for k, v in pairs(v2:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5658 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		delay(1, function() --[[ Line: 5663 | Upvalues: v2 (copy) ]]
			v2:Destroy()
		end)
		Sound.PlaySound(Sounds["Engineer Chica"])
	end
end
t2["Into the Pool"] = function(p1, p2, p3) --[[ Line: 5670 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	Sound.PlaySound(Sounds["ITP Beam"])
	TweenService:Create(p2.PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		CFrame = p2.PrimaryPart.CFrame - Vector3.new(0, 10, 0)
	}):Play()
end
function t2.Strawbaby(p1, p2, p3) --[[ Line: 5682 | Upvalues: Misc (copy), TweenService (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	task.wait(0.23)
	local _, v1 = p2:GetBoundingBox()
	local v3 = p3.Position - Vector3.new(0, v1.Y / 2, 0)
	local IsCone = p1:FindFirstChild("IsCone", true)
	if IsCone then
		local v4 = IsCone.Parent
		for k, v in pairs(v4:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 1
			end
		end
		task.delay(1, function() --[[ Line: 5703 | Upvalues: v4 (ref) ]]
			for k, v in pairs(v4:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0
				end
			end
		end)
		local v5 = v4:Clone()
		v5.Parent = workspace.Visuals
		for k, v in pairs(v5:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
				if v == v5.PrimaryPart then
					v.Anchored = true
					continue
				end
				local WeldConstraint = Instance.new("WeldConstraint", v5.PrimaryPart)
				WeldConstraint.Part0 = v5.PrimaryPart
				WeldConstraint.Part1 = v
				v.Anchored = false
			end
		end
		v5.PrimaryPart.CFrame = v4.PrimaryPart.CFrame
		local function getmidcframe(p1, p2) --[[ getmidcframe | Line: 5728 ]]
			return CFrame.lookAt(p1.Position, p2.Position) * CFrame.new(0, 0, -((p1.Position - p2.Position).Magnitude / 2))
		end
		local v6 = v5.PrimaryPart.CFrame
		local v7 = CFrame.new(v3)
		local v9 = CFrame.lookAt(v6.Position, v7.Position) * CFrame.new(0, 0, -((v6.Position - v7.Position).Magnitude / 2)) + Vector3.new(0, 4, 0)
		local v10 = TweenService:Create(v5.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
			CFrame = v9
		})
		v10:Play()
		v10.Completed:Wait()
		local v11 = TweenService:Create(v5.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			CFrame = CFrame.new(v3)
		})
		v11:Play()
		v11.Completed:Wait()
		v5:Destroy()
	end
	local v12 = Particles_2.Strawbaby:Clone()
	v12.Position = v3
	v12.Parent = workspace.Visuals
	Sound.PlaySound(Sounds["Strawbaby Impact"])
	for k, v in pairs(v12:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5754 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5759 | Upvalues: v12 (copy) ]]
		v12:Destroy()
	end)
end
t2["Drained Coffee"] = function(p1, p2, p3) --[[ Line: 5764 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy), TweenService (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	Sound.PlaySound(Sounds["Drained Coffee Throw"])
	local v1 = Particles_2["Drained Coffee"].Send:Clone()
	v1.CFrame = p1.PrimaryPart.CFrame
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5778 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v2 = Particles_2["Drained Coffee"].Cup:Clone()
	v2.PrimaryPart.CFrame = p1.Prim.CFrame
	v2.Parent = workspace.Visuals
	local v3 = TweenService:Create(v2.PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		CFrame = p3
	})
	v3:Play()
	v3.Completed:Wait()
	v2:Destroy()
	local v4 = Particles_2["Drained Coffee"].Explosion:Clone()
	v4.CFrame = p3
	v4.Parent = workspace.Visuals
	for k, v in pairs(v4:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5798 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5803 | Upvalues: v1 (copy), v4 (copy) ]]
		v1:Destroy()
		v4:Destroy()
	end)
end
t2["Sun Guardian Freddy"] = function(p1, p2, p3) --[[ Line: 5809 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	Sound.PlaySound(Sounds["Sun Guardian Throw"])
	local v1 = Particles_2["Sun Guardian"].Start:Clone()
	v1:PivotTo(p1.PrimaryPart.CFrame)
	v1.Parent = workspace.Visuals
	task.wait(1)
	v1:Destroy()
	local v2 = Particles_2["Drained Coffee"].Explosion:Clone()
	v2.CFrame = p3
	v2.Parent = workspace.Visuals
	Sound.PlaySound(Sounds["Sun Guardian Explosion"])
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5832 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5837 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
end
t2["Tropic Terror Duo"] = function(p1, p2, p3) --[[ Line: 5842 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local WorldCFrame = p1:FindFirstChild("Attack1", true).WorldCFrame
	local WorldCFrame_2 = p1:FindFirstChild("Attack2", true).WorldCFrame
	for i = 1, 2 do
		local v1 = Particles_2["Tropic Terror Duo"].Send:Clone()
		v1.CFrame = i == 1 and WorldCFrame or WorldCFrame_2
		v1.Parent = workspace.Visuals
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5857 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		local v3 = Particles_2["Tropic Terror Duo"].Send2:Clone()
		v3.CFrame = i == 1 and WorldCFrame or WorldCFrame_2
		v3.Parent = workspace.Visuals
		for k, v in pairs(v3:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5868 | Upvalues: v (copy) ]]
					v:Emit(v:GetAttribute("EmitCount"))
				end)
			end
		end
		delay(2, function() --[[ Line: 5873 | Upvalues: v1 (copy), v3 (copy) ]]
			v1:Destroy()
			v3:Destroy()
		end)
	end
	local v5 = Particles_2["Tropic Terror Duo"].Explosion:Clone()
	v5.CFrame = p3
	v5.Parent = workspace.Visuals
	for k, v in pairs(v5:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5885 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5890 | Upvalues: v5 (copy) ]]
		v5:Destroy()
	end)
end
t2["Sandy Helpy"] = function(p1, p2, p3) --[[ Line: 5895 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2["Sandy Helpy"].Send:Clone()
	v1.CFrame = p1.PrimaryPart.CFrame
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5907 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v2 = Particles_2["Sandy Helpy"].Send2:Clone()
	v2.CFrame = p1.PrimaryPart.CFrame
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5918 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v3 = Particles_2["Sandy Helpy"].Explosion:Clone()
	v3.CFrame = p3
	v3.Parent = workspace.Visuals
	for k, v in pairs(v3:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5929 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5934 | Upvalues: v3 (copy), v1 (copy), v2 (copy) ]]
		v3:Destroy()
		v1:Destroy()
		v2:Destroy()
	end)
end
t2["Waterworks Foxy"] = function(p1, p2, p3) --[[ Line: 5941 | Upvalues: Misc (copy), Sound (copy), Sounds (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	Sound.PlaySound(Sounds["Waterworks Spray"])
	local v1 = Particles_2["Waterworks Foxy"].Explosion1:Clone()
	v1.CFrame = p3
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5955 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v2 = Particles_2["Waterworks Foxy"].Explosion2:Clone()
	v2.CFrame = p3
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5966 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v3 = Particles_2["Waterworks Foxy"].Explosion3:Clone()
	v3.CFrame = p3
	v3.Parent = workspace.Visuals
	for k, v in pairs(v3:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 5977 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 5982 | Upvalues: v1 (copy), v2 (copy), v3 (copy) ]]
		v1:Destroy()
		v2:Destroy()
		v3:Destroy()
	end)
end
t2["Heatwave Sun"] = function(p1, p2, p3) --[[ Line: 5989 | Upvalues: Misc (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if not Misc.EnemyCFrameOffset[p2.Name] then
		Sound.PlaySound(Sounds["Heatwave Sun Impact"])
		return
	end
	local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	Sound.PlaySound(Sounds["Heatwave Sun Impact"])
end
t2["El Jellychip"] = function(p1, p2, p3) --[[ Line: 5998 | Upvalues: Misc (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if not Misc.EnemyCFrameOffset[p2.Name] then
		Sound.PlaySound(Sounds["Jellychip Buzz"])
		return
	end
	local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	Sound.PlaySound(Sounds["Jellychip Buzz"])
end
t2["Aquatic Ballora"] = function(p1, p2, p3) --[[ Line: 6007 | Upvalues: Misc (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if not Misc.EnemyCFrameOffset[p2.Name] then
		Sound.PlaySound(Sounds["Aquatic Ballora Hit"])
		return
	end
	local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	Sound.PlaySound(Sounds["Aquatic Ballora Hit"])
end
t2["Oceanic Ballora"] = function(p1, p2, p3) --[[ Line: 6016 | Upvalues: Misc (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p1 == "Dragon" then
		Sound.PlaySound(Sounds["Ocean Ballora Dragon"])
	else
		Sound.PlaySound(Sounds["Ocean Ballora Lightning"])
	end
end
t2["Birthday Bash Bonnie"] = function(p1, p2, p3) --[[ Line: 6029 | Upvalues: Misc (copy), Particles_2 (copy), Sound (copy), Sounds (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	if p1 == "Spike" then
		local v1 = Particles_2["Birthday Bash"].Linger:Clone()
		v1:PivotTo(p3 - Vector3.new(0, 3, 0))
		v1.Parent = workspace.Visuals
		task.delay(3, function() --[[ Line: 6040 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
		return
	end
	Sound.PlaySound(Sounds.BdayBash)
	local v2 = Particles_2["Birthday Bash"].Shoot:Clone()
	v2:PivotTo(p1:FindFirstChild("AttackCFrame", true).WorldCFrame)
	v2.Parent = workspace.Visuals
	for k, v in pairs(v2:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 6051 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	local v3 = Particles_2["Birthday Bash"].Hit:Clone()
	v3.CFrame = p3
	v3.Parent = workspace.Visuals
	for k, v in pairs(v3:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 6062 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 6067 | Upvalues: v2 (copy), v3 (copy) ]]
		v2:Destroy()
		v3:Destroy()
	end)
end
t2["Painter Puppet"] = function(p1, p2, p3) --[[ Line: 6074 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		local _ = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2["Paint Slash"]:Clone()
	v1:PivotTo(p1.PrimaryPart.CFrame + p1.PrimaryPart.CFrame.LookVector * 5)
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 6086 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(2, function() --[[ Line: 6091 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
t2["Warpseer Mangle"] = function(p1, p2, p3) --[[ Line: 6096 | Upvalues: Misc (copy), Particles_2 (copy) ]]
	if p2 and p2.PrimaryPart then
		p3 = p2.PrimaryPart.CFrame
	end
	if Misc.EnemyCFrameOffset[p2.Name] then
		p3 = p3 + Misc.EnemyCFrameOffset[p2.Name]
	end
	local v1 = Particles_2.WarpseerMangle:Clone()
	v1:PivotTo(p3)
	v1.Parent = workspace.Visuals
	for k, v in pairs(v1:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			task.delay(v:GetAttribute("EmitDelay"), function() --[[ Line: 6108 | Upvalues: v (copy) ]]
				v:Emit(v:GetAttribute("EmitCount"))
			end)
		end
	end
	task.delay(3, function() --[[ Line: 6113 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
if LocalPlayer then
	Particles.OnClientEvent:Connect(function(p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ Line: 6119 | Upvalues: v1 (copy), Misc (copy), t2 (copy) ]]
		if v1.GetData().Settings.Effects then
			return
		end
		if p3 and (p4 and (typeof(p3) ~= "number" and Misc.EnemyCFrameOffset[p3.Name])) then
			p4 = p4 + Misc.EnemyCFrameOffset[p3.Name]
		end
		local _, v12 = pcall(function() --[[ Line: 6127 | Upvalues: t2 (ref), p1 (copy), p2 (copy), p3 (copy), p4 (ref), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy) ]]
			t2[p1](p2, p3, p4, p5, p6, p7, p8, p9)
		end)
		if not v12 then
			return
		end
		warn(v12)
	end)
end
return t2