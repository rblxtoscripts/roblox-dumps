-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("spr")
local t = {
	ScaleDampingOut = 0.75,
	ScaleFrequencyOut = 0.5,
	ScaleDampingIn = 1,
	ScaleFrequencyIn = 3,
	WaitTime = 1,
	StarAmount = nil
}
return function(p1, p2) --[[ Line: 15 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = p2.FindElement(p1.Instance, "ShimmerStarLabel")
	if not v12 then
		return function() --[[ Line: 18 ]] end
	end
	v12.Visible = false
	local v2 = p1.ScaleDampingOut or t.ScaleDampingOut
	local v3 = p1.ScaleFrequencyOut or t.ScaleFrequencyOut
	local v4 = p1.ScaleDampingIn or t.ScaleDampingIn
	local v5 = p1.ScaleFrequencyIn or t.ScaleFrequencyIn
	local v6 = p1.WaitTime or t.WaitTime
	local v7 = p1.StarAmount or t.StarAmount
	local function CreateStar() --[[ CreateStar | Line: 30 | Upvalues: v12 (copy), v1 (ref), v4 (copy), v5 (copy), v2 (copy), v3 (copy) ]]
		local v13 = v12.Parent
		if not v13 then
			return
		end
		local v22 = v12:Clone()
		v22.Parent = v13
		v22.Visible = true
		local v32 = v22:FindFirstChildWhichIsA("UIScale")
		if not v32 then
			v22:Destroy()
			return
		end
		v32.Scale = 0
		local AbsoluteSize = v13.AbsoluteSize
		local AbsoluteSize_2 = v12.AbsoluteSize
		if AbsoluteSize.X > 0 and (AbsoluteSize.Y > 0 and (AbsoluteSize_2.X > 0 and AbsoluteSize_2.Y > 0)) then
			local AnchorPoint = v12.AnchorPoint
			local v42 = AbsoluteSize_2.X * AnchorPoint.X
			local v52 = AbsoluteSize.X - AbsoluteSize_2.X * (1 - AnchorPoint.X)
			local v6 = AbsoluteSize_2.Y * AnchorPoint.Y
			local v7 = AbsoluteSize.Y - AbsoluteSize_2.Y * (1 - AnchorPoint.Y)
			if v42 < v52 and v6 < v7 then
				local v8 = math.random(math.floor(v42), (math.floor(v52)))
				v22.Position = UDim2.new(0, v8, 0, (math.random(math.floor(v6), (math.floor(v7)))))
			else
				v22.Position = v12.Position
			end
		else
			v22.Position = v12.Position
		end
		v1.target(v32, v4, v5, {
			Scale = 1
		})
		v1.completed(v32, function() --[[ Line: 72 | Upvalues: v1 (ref), v32 (copy), v2 (ref), v3 (ref), v22 (copy) ]]
			v1.target(v32, v2, v3, {
				Scale = 0
			})
			v1.completed(v32, function() --[[ Line: 74 | Upvalues: v22 (ref) ]]
				v22:Destroy()
			end)
		end)
	end
	return task.spawn(function() --[[ Line: 80 | Upvalues: v7 (copy), CreateStar (copy), v6 (copy) ]]
		if v7 then
			for i = 1, v7 do
				CreateStar()
				if i < v7 then
					task.wait(v6)
				end
			end
		else
			while task.wait(v6) do
				CreateStar()
			end
		end
	end)
end