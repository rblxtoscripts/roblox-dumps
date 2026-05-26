-- https://lua.expert/
local Part = Instance.new("Part")
Part.Shape = Enum.PartType.Cylinder
Part.Parent = script.Parent
Part.BrickColor = BrickColor.new("Really black")
Part.CanCollide = false
Part.Anchored = true
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 8 | Upvalues: Part (copy) ]]
	local WorldPosition = script.Parent.Handle.RodAttachment.WorldPosition
	local WorldPosition_2 = script.Parent.RopeConstraint.Attachment1.WorldPosition
	Part.CFrame = CFrame.lookAt((WorldPosition + WorldPosition_2) / 2, WorldPosition_2) * CFrame.Angles(0, 1.5707963267948966, 0)
	Part.Size = Vector3.new((WorldPosition_2 - WorldPosition).Magnitude, 0.2, 0.2)
end)