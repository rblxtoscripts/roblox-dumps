-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("StorageUtils")
local CollectionService = game:GetService("CollectionService")
return {
	Convert = function(p1, p2, p3) --[[ Convert | Line: 8 | Upvalues: v1 (copy) ]]
		if not p2:IsA("ParticleEmitter") then
			return nil
		end
		local v2 = v1.GetAsset("Emitter2DTemplate", "Misc")():Clone()
		v2:SetAttribute("Enabled", p2.Enabled)
		v2:SetAttribute("Texture", p2.Texture)
		v2:SetAttribute("Acceleration", Vector2.new(math.max(p2.Acceleration.X, p2.Acceleration.Z), -p2.Acceleration.Y) * 30)
		v2:SetAttribute("FlipbookStartRandom", p2.FlipbookStartRandom)
		v2:SetAttribute("TimeScale", p2.TimeScale)
		v2:SetAttribute("Drag", p2.Drag)
		v2:SetAttribute("VelocityInheritance", p2.VelocityInheritance * 10)
		v2:SetAttribute("SpreadAngle", (math.max(p2.SpreadAngle.X, p2.SpreadAngle.Y)))
		v2:SetAttribute("FlipbookFramerate", p2.FlipbookFramerate)
		v2:SetAttribute("Color", p2.Color)
		v2:SetAttribute("Transparency", p2.Transparency)
		v2:SetAttribute("MasterScale", (if p3 then p3 else {}).MasterScale or 1)
		v2:SetAttribute("ZIndex", math.ceil(p2.ZOffset) or nil)
		local t = {}
		for i, v in ipairs(p2.Squash.Keypoints) do
			table.insert(t, NumberSequenceKeypoint.new(v.Time, 0.5 + v.Value / 6, v.Envelope / 6))
		end
		v2:SetAttribute("Squash", NumberSequence.new(t))
		local t2 = {}
		for i, v in ipairs(p2.Size.Keypoints) do
			table.insert(t2, NumberSequenceKeypoint.new(v.Time, v.Value / 10, v.Envelope / 10))
		end
		v2:SetAttribute("Scale", NumberSequence.new(t2))
		v2:SetAttribute("EmissionRate", NumberRange.new((math.min(p2.Rate, 500))))
		v2:SetAttribute("LifeTime", p2.Lifetime)
		v2:SetAttribute("RotationSpeed", p2.RotSpeed)
		v2:SetAttribute("Rotation", p2.Rotation)
		v2:SetAttribute("LockedToGui", true)
		v2:SetAttribute("Size", NumberRange.new(50 * (p2:GetAttribute("Particle2DScale") or 1)))
		v2:SetAttribute("Speed", NumberRange.new(p2.Speed.Min * 20, p2.Speed.Max * 20))
		if p2.Orientation == Enum.ParticleOrientation.VelocityParallel then
			v2:SetAttribute("Orientation", "VelocityParallel")
		elseif p2.Orientation == Enum.ParticleOrientation.VelocityPerpendicular then
			v2:SetAttribute("Orientation", "VelocityPerpendicular")
		else
			v2:SetAttribute("Orientation", "Normal")
		end
		if p2.Parent:IsA("Attachment") then
			v2:SetAttribute("EmissionShape", "Point")
		elseif p2.Shape == Enum.ParticleEmitterShape.Disc or p2.Shape == Enum.ParticleEmitterShape.Sphere then
			v2:SetAttribute("EmissionShape", "Oval")
		else
			v2:SetAttribute("EmissionShape", "Rectangle")
		end
		if p2.FlipbookLayout == Enum.ParticleFlipbookLayout.Grid2x2 then
			v2:SetAttribute("FlipbookLayout", "Grid2x2")
		elseif p2.FlipbookLayout == Enum.ParticleFlipbookLayout.Grid4x4 then
			v2:SetAttribute("FlipbookLayout", "Grid4x4")
		elseif p2.FlipbookLayout == Enum.ParticleFlipbookLayout.Grid8x8 then
			v2:SetAttribute("FlipbookLayout", "Grid8x8")
		end
		if p2.FlipbookMode == Enum.ParticleFlipbookMode.Loop then
			v2:SetAttribute("FlipbookMode", "Loop")
		elseif p2.FlipbookMode == Enum.ParticleFlipbookMode.Random then
			v2:SetAttribute("FlipbookMode", "Random")
		elseif p2.FlipbookMode == Enum.ParticleFlipbookMode.PingPong then
			v2:SetAttribute("FlipbookMode", "PingPong")
		else
			v2:SetAttribute("FlipbookMode", "OneShot")
		end
		v2:SetAttribute("SizeConstraint", "RelativeYY")
		v2.Name = p2.Name
		v2.Parent = p2
		return v2
	end,
	AddTag = function(p1, p2) --[[ AddTag | Line: 93 | Upvalues: CollectionService (copy) ]]
		CollectionService:AddTag(p2, "Emitter2D")
	end
}