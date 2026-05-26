-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = nil
local v2 = false
local v3 = false
local v4 = false
local function deactivate() --[[ deactivate | Line: 13 | Upvalues: v3 (ref), TweenService (copy), v2 (ref), v4 (ref) ]]
	v3 = true
	TweenService:Create(script.Parent.RopeConstraint, TweenInfo.new(1, Enum.EasingStyle.Quad), {
		WinchTarget = 0.275
	}):Play()
	wait(0.75)
	TweenService:Create(script.Parent.AlignPosition, TweenInfo.new(0.25), {
		MaxForce = 10000
	}):Play()
	TweenService:Create(script.Parent.AlignOrientation, TweenInfo.new(0.25), {
		MaxTorque = 5000
	}):Play()
	wait(0.25)
	v2 = false
	v3 = false
	v4 = false
end
script.Parent.Equipped:Connect(function(p1) --[[ Line: 25 | Upvalues: v1 (ref) ]]
	v1 = p1
end)
script.Parent.Unequipped:Connect(function() --[[ Line: 28 | Upvalues: deactivate (copy) ]]
	deactivate()
end)
script.Parent.Activated:Connect(function() --[[ Line: 32 | Upvalues: v3 (ref), v1 (ref), v2 (ref), deactivate (copy), TweenService (copy), v4 (ref) ]]
	if v3 then
		return
	end
	local Hit = v1.Hit
	v2 = not v2
	script.Parent.ActivateRod:InvokeServer(v2, v1.Origin, Hit)
	if v2 then
		v3 = true
		script.Parent.RopeConstraint.Enabled = true
		local v12 = (Hit.p - script.Parent.Handle.AlignmentAttachment.Position).unit * 100
		script.Parent.AlignPosition.MaxForce = 0
		script.Parent.AlignOrientation.MaxTorque = 0
		script.Parent.Bobber.Velocity = v12
		script.Parent.RopeConstraint.Length = 25
		local v22 = TweenService:Create(script.Parent.RopeConstraint, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			WinchTarget = 50
		})
		v22.Completed:Connect(function(p1) --[[ Line: 56 | Upvalues: v4 (ref) ]]
			if p1 ~= Enum.PlaybackState.Completed then
				return
			end
			v4 = true
		end)
		v22:Play()
		v3 = false
	else
		deactivate()
	end
end)
while true do
	local v5 = wait()
	if v2 then
		local WorldPosition = script.Parent.BobberTarget.BobberTargetCenter.WorldPosition
		local WorldPosition_2 = script.Parent.Bobber.BobberCenter.WorldPosition
		local WorldPosition_3 = script.Parent.Bobber.BobberHoverHigh.WorldPosition
		local WorldPosition_4 = script.Parent.Bobber.BobberHoverLow.WorldPosition
		local v6 = RaycastParams.new()
		v6.FilterType = Enum.RaycastFilterType.Exclude
		v6.FilterDescendantsInstances = { script.Parent.Parent }
		ray = workspace:Raycast(WorldPosition, WorldPosition_2 - WorldPosition, v6)
		if ray then
			print("much too long")
			script.Parent.RopeConstraint.WinchTarget = ray.Distance + 1
			v4 = true
		else
			if v4 then
				ray_high = workspace:Raycast(WorldPosition, WorldPosition_3 - WorldPosition, v6)
				if ray_high then
					script.Parent.RopeConstraint.WinchTarget = script.Parent.RopeConstraint.CurrentDistance - v5 * 20
				end
				ray_low = workspace:Raycast(WorldPosition, WorldPosition_4 - WorldPosition, v6)
				if not ray_low then
					local RopeConstraint = script.Parent.RopeConstraint
					RopeConstraint.WinchTarget = math.min(script.Parent.RopeConstraint.CurrentDistance + v5 * 20, 100)
				end
			end
			continue
		end
	end
end