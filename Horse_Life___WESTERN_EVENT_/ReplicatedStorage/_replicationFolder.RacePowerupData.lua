-- https://lua.expert/
game:GetService("RunService")
game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {
	Types = {
		Passive = "Passive",
		Shield = "Shield",
		ClickToUse = "ClickToUse",
		Projectile = "Projectile"
	}
}
t.Skills = {
	WindDash = {
		Name = "WindDash",
		DisplayName = "Wind Dash",
		Type = "Passive",
		Weight = 50,
		Duration = 10,
		OnClient = function(p1) --[[ OnClient | Line: 23 ]]
			local v1 = p1.GetHorse()
			if v1 then
				local v3 = math.round(workspace:GetServerTimeNow() + 10)
				v1.Model.Ailments:SetAttribute("SpeedBoostPad", v3)
				p1.Shake("RotationBump")
				p1.ColorCorrection()
				p1.Notify("[WIND DASH] Speed boost activated!", "Blue")
				task.delay(10, function() --[[ Line: 38 | Upvalues: v1 (copy), v3 (copy) ]]
					if v1.Model.Ailments:GetAttribute("SpeedBoostPad") == v3 then
						v1.Model.Ailments:SetAttribute("SpeedBoostPad", nil)
					end
				end)
				p1.RegisterCleanup(function() --[[ Line: 45 | Upvalues: v1 (copy), v3 (copy) ]]
					if not v1 or (not v1.Model or (not v1.Model:FindFirstChild("Ailments") or v1.Model.Ailments:GetAttribute("SpeedBoostPad") ~= v3)) then
						return
					end
					v1.Model.Ailments:SetAttribute("SpeedBoostPad", nil)
				end)
			end
		end
	},
	SecondDash = {
		Name = "SecondDash",
		DisplayName = "Second Dash",
		Type = "Passive",
		Weight = 50,
		Duration = 2,
		OnClient = function(p1) --[[ OnClient | Line: 61 ]]
			local v1 = p1.GetHorse()
			if v1 then
				local v3 = math.round(workspace:GetServerTimeNow() + 2)
				v1.Model.Ailments:SetAttribute("SpeedBoostPad", v3)
				p1.Shake("RotationBump")
				p1.ColorCorrection()
				p1.Notify("[SECOND DASH] Speed boost activated!", "Green")
				task.delay(2, function() --[[ Line: 76 | Upvalues: v1 (copy), v3 (copy) ]]
					if v1.Model.Ailments:GetAttribute("SpeedBoostPad") == v3 then
						v1.Model.Ailments:SetAttribute("SpeedBoostPad", nil)
					end
				end)
				p1.RegisterCleanup(function() --[[ Line: 83 | Upvalues: v1 (copy), v3 (copy) ]]
					if not v1 or (not v1.Model or (not v1.Model:FindFirstChild("Ailments") or v1.Model.Ailments:GetAttribute("SpeedBoostPad") ~= v3)) then
						return
					end
					v1.Model.Ailments:SetAttribute("SpeedBoostPad", nil)
				end)
			end
		end
	},
	SwiftShield = {
		Name = "SwiftShield",
		DisplayName = "Swift Shield",
		Type = "Shield",
		Duration = 8,
		Weight = 50,
		AilmentsToBlock = { "Slowed", "ImpactStun", "LazyHex" },
		ColorSequence = ColorSequence.new(Color3.fromRGB(0, 255, 0)),
		ClientConfig = {
			Duration = 8,
			NotifyMessage = "[SWIFT SHIELD] Shield activated!",
			NotifyPreset = "Green",
			BlockMessage = "[SWIFT SHIELD] Blocked a debuff!",
			ExpireMessage = "[SWIFT SHIELD] Shield expired!",
			AssetPath = { "Storage", "Assets", "Powerups", "Shield" },
			Orbit = {
				OrbitRadius = 5,
				OrbitSpeed = 3,
				BobSpeed = 2,
				BobHeight = 0.6,
				YOffset = 4
			}
		},
		OnClient = function(p1) --[[ OnClient | Line: 117 | Upvalues: t (copy) ]]
			p1.AddShield(t.Skills.SwiftShield.ClientConfig)
			p1.FireServer("SwiftShield")
		end,
		OnServer = function(p1) --[[ OnServer | Line: 121 ]]
			p1.AddShield()
		end
	},
	RockWall = {
		Name = "RockWall",
		DisplayName = "Rock Wall",
		Type = "ClickToUse",
		Weight = 50,
		WallDuration = 30,
		OnClient = function(p1) --[[ OnClient | Line: 132 ]]
			p1.AddClickToUse({
				DisplayName = "Rock Wall",
				BehindDistance = 10,
				ExpiryTime = 15,
				NotifyMessage = "[ROCK WALL] Click to place a wall behind you!",
				NotifyPreset = "Yellow",
				ExpiryMessage = "[ROCK WALL] Expired!",
				GradientColor = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(185, 155, 115)), ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 110, 80)) }),
				Indicator = {
					OrbitRadius = 4,
					OrbitSpeed = 4,
					BobSpeed = 2,
					BobHeight = 0.5,
					YOffset = 5,
					AssetPath = { "Storage", "Assets", "Powerups", "WallOrbit" }
				},
				OnUse = function(p12, p2) --[[ OnUse | Line: 152 | Upvalues: p1 (copy) ]]
					local Unit = Vector3.new(p2.X, 0, p2.Z).Unit
					p1.FireServer("RockWall", p12, Unit)
				end
			})
		end,
		OnServer = function(p1, p2, p3) --[[ OnServer | Line: 158 | Upvalues: ReplicatedStorage (copy), CollectionService (copy) ]]
			if typeof(p3) ~= "Vector3" then
				warn("invalid direction passed to rock wall use")
				return
			end
			if not p1.Validate(p2) then
				warn("invalid position passed to rock wall use")
				return
			end
			local v1 = p1.RaycastToGround(p2)
			local Wall = ReplicatedStorage.Storage.Assets.Powerups:FindFirstChild("Wall")
			if not Wall then
				warn("could not find rock wall template")
				return
			end
			local RockWall = Wall:Clone()
			RockWall.Name = "RockWall"
			if not RockWall.PrimaryPart then
				RockWall:FindFirstChildWhichIsA("BasePart")
			end
			local Y = RockWall:GetExtentsSize().Y
			RockWall:PivotTo(CFrame.lookAt(v1 + Vector3.new(0, Y / 2, 0), v1 + Vector3.new(0, Y / 2, 0) + p3))
			CollectionService:AddTag(RockWall, "RacePowerupRockWall")
			RockWall.Parent = workspace
			for v2, v3 in RockWall:GetDescendants() do
				if v3:IsA("BasePart") then
					v3.Touched:Connect(function(p1) --[[ Line: 192 | Upvalues: RockWall (copy) ]]
						if not RockWall.Parent then
							return
						end
						local v1 = p1:FindFirstAncestorWhichIsA("Model")
						if not v1 then
							return
						end
						local Ailments = v1:FindFirstChild("Ailments")
						if not (Ailments and Ailments:GetAttribute("SpeedBoostPad")) then
							return
						end
						RockWall:Destroy()
					end)
				end
			end
			p1.TrackWall(RockWall)
			task.delay(9, function() --[[ Line: 209 | Upvalues: RockWall (copy) ]]
				RockWall:Destroy()
			end)
		end
	},
	ImpactBurst = {
		Name = "ImpactBurst",
		DisplayName = "Impact Burst",
		Type = "Projectile",
		Weight = 50,
		StunDuration = 2,
		OnClientHit = function(p1, p2) --[[ OnClientHit | Line: 221 ]]
			p1.PlaySoundOnPart("Explosion", p2)
			p1.SpawnParticleAt("Explode", p2, 2)
			p1.Shake("Bump")
		end,
		OnClient = function(p1) --[[ OnClient | Line: 226 | Upvalues: ReplicatedStorage (copy) ]]
			p1.AddClickToUse({
				DisplayName = "Impact Burst",
				ExpiryTime = 12,
				NotifyMessage = "[IMPACT BURST] Click to fire a stun bolt!",
				NotifyPreset = "Red",
				ExpiryMessage = "[IMPACT BURST] Expired!",
				GradientColor = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 175, 60)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 120, 20)) }),
				Indicator = {
					OrbitRadius = 4,
					OrbitSpeed = 5,
					BobSpeed = 3,
					BobHeight = 0.5,
					YOffset = 5,
					AssetPath = { "Storage", "Assets", "Powerups", "ImpactBurst" }
				},
				OnUse = function(p12, p2) --[[ OnUse | Line: 245 | Upvalues: p1 (copy), ReplicatedStorage (ref) ]]
					local v1 = p1.FindNearestTarget()
					local v2 = p12 + p2 * 3 + Vector3.new(0, 4, 0)
					local SpawnProjectile = p1.SpawnProjectile
					local t = {
						Speed = 160,
						Lifetime = 6,
						HitRadius = 7,
						FollowTrack = true,
						TrackBlend = 0.1,
						MaxBounces = 2,
						HoverHeight = 3,
						StartPosition = v2
					}
					t.Target = v1 and v1.Part or v2 + p2 * 200
					t.VelocityPrediction = if v1 then 0.4 else 0
					t.Model = ReplicatedStorage.Storage.Assets.Powerups:FindFirstChild("ImpactBurst")
					t.OnHit = v1 and (function() --[[ Line: 261 | Upvalues: p1 (ref), v1 (copy) ]]
						p1.FireServer("ProjectileHit", v1.Player.UserId, "ImpactBurst")
						p1.OnProjectileHit("ImpactBurst", v1.Part)
					end) or nil
					SpawnProjectile(t)
					local FireServer = p1.FireServer
					local t2 = {
						Speed = 160,
						Lifetime = 6,
						HitRadius = 7,
						FollowTrack = true,
						TrackBlend = 0.1,
						MaxBounces = 2,
						HoverHeight = 3,
						Size = Vector3.new(2, 2, 2),
						StartPosition = v2
					}
					t2.TargetUserId = v1 and v1.Player.UserId or nil
					t2.LookVector = p2
					t2.Color = Color3.fromRGB(255, 120, 30)
					t2.Material = Enum.Material.Neon
					FireServer("ReplicateProjectile", t2)
				end
			})
		end,
		OnServerHit = function(p1, p2, p3) --[[ OnServerHit | Line: 285 ]]
			p1.ApplyAilment({
				Type = "ImpactStun",
				Duration = 2,
				Target = p3
			})
		end
	},
	LazyHex = {
		Name = "LazyHex",
		DisplayName = "Lazy Hex",
		Type = "Projectile",
		Weight = 50,
		SlowDuration = 2.5,
		OnClientHit = function(p1, p2) --[[ OnClientHit | Line: 300 ]]
			p1.PlaySoundOnPart("Lightning", p2)
			p1.SpawnParticleAbove("Lightning", p2, 10, 2)
			p1.AttachVFX("Electrified", p2, 2.5)
		end,
		OnClient = function(p1) --[[ OnClient | Line: 305 | Upvalues: ReplicatedStorage (copy) ]]
			p1.AddClickToUse({
				DisplayName = "Lazy Hex",
				ExpiryTime = 12,
				NotifyMessage = "[LAZY HEX] Click to curse another racer!",
				NotifyPreset = "Purple",
				ExpiryMessage = "[LAZY HEX] Expired!",
				GradientColor = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(195, 130, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 70, 220)) }),
				Indicator = {
					OrbitRadius = 4,
					OrbitSpeed = 4,
					BobSpeed = 2,
					BobHeight = 0.5,
					YOffset = 5,
					AssetPath = { "Storage", "Assets", "Powerups", "LazyHex" }
				},
				OnUse = function(p12, p2) --[[ OnUse | Line: 324 | Upvalues: p1 (copy), ReplicatedStorage (ref) ]]
					local v1 = p1.FindNearestTarget()
					local v2 = p12 + p2 * 3 + Vector3.new(0, 4, 0)
					local SpawnProjectile = p1.SpawnProjectile
					local t = {
						Speed = 130,
						Lifetime = 7,
						HitRadius = 8,
						FollowTrack = true,
						TrackBlend = 0.12,
						MaxBounces = 2,
						HoverHeight = 3.5,
						StartPosition = v2
					}
					t.Target = v1 and v1.Part or v2 + p2 * 200
					t.VelocityPrediction = if v1 then 0.6 else 0
					t.Model = ReplicatedStorage.Storage.Assets.Powerups:FindFirstChild("LazyHex")
					t.OnHit = v1 and (function() --[[ Line: 340 | Upvalues: p1 (ref), v1 (copy) ]]
						p1.FireServer("ProjectileHit", v1.Player.UserId, "LazyHex")
						p1.OnProjectileHit("LazyHex", v1.Part)
					end) or nil
					SpawnProjectile(t)
					local FireServer = p1.FireServer
					local t2 = {
						Speed = 130,
						Lifetime = 7,
						HitRadius = 8,
						FollowTrack = true,
						TrackBlend = 0.12,
						MaxBounces = 2,
						HoverHeight = 3.5,
						Size = Vector3.new(1.8, 1.8, 1.8),
						StartPosition = v2
					}
					t2.TargetUserId = v1 and v1.Player.UserId or nil
					t2.LookVector = p2
					t2.Color = Color3.fromRGB(150, 50, 200)
					t2.Material = Enum.Material.Neon
					FireServer("ReplicateProjectile", t2)
				end
			})
		end,
		OnServerHit = function(p1, p2, p3) --[[ OnServerHit | Line: 364 ]]
			p1.ApplyAilment({
				Type = "LazyHex",
				Duration = 2.5,
				Target = p3
			})
		end
	}
}
function t.GetSkill(p1) --[[ GetSkill | Line: 375 | Upvalues: t (copy) ]]
	return t.Skills[p1]
end
function t.GetRandomSkill() --[[ GetRandomSkill | Line: 379 | Upvalues: t (copy) ]]
	local sum = 0
	for v1, v2 in t.Skills do
		sum = sum + v2.Weight
	end
	local v3 = math.random() * sum
	local sum_2 = 0
	for v4, v5 in t.Skills do
		sum_2 = sum_2 + v5.Weight
		if v3 <= sum_2 then
			return v5
		end
	end
	return nil
end
return t