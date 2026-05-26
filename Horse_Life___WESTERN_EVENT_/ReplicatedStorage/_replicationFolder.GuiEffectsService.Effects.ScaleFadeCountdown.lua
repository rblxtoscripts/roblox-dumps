-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("spr")
local t = {
	ScaleInDamping = 0.5,
	ScaleInFrequency = 4,
	BackgroundInDamping = 1,
	BackgroundInFrequency = 3,
	ScaleOutDamping = 1,
	BackgroundOutDamping = 1,
	BackgroundOutFrequency = 4,
	DestroyDelay = 0.2
}
return function(p1, p2) --[[ Line: 17 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = p1.Instance
	local Time = p1.Time
	if v12 and Time then
		local v2 = false
		local v3 = nil
		local v4 = task.delay(0.25, function() --[[ Line: 26 | Upvalues: p2 (copy), v12 (copy), Time (copy), p1 (copy), t (ref), v3 (ref), v1 (ref), v2 (ref) ]]
			local v13 = p2.FindElement(v12, "DefaultTemplate")
			local v22 = p2.CloneTemplate(v13)
			local v32 = p2.FindElement(v22, "Frame")
			local v4 = p2.FindElement(v32, "BackgroundLabel")
			local v5 = p2.FindElement(v32, "Title")
			local v6 = v32:FindFirstChildWhichIsA("UIScale")
			if not v6 then
				v6 = Instance.new("UIScale")
				v6.Parent = v32
			end
			local Scale = v6.Scale
			local ImageTransparency = v4.ImageTransparency
			v5.Upper.Title.Text = Time
			v5.Lower.Title.Text = Time
			v4.ImageTransparency = 1
			v6.Scale = 1.2
			v22.Visible = true
			v22.Parent = v13.Parent
			local v7 = p1.ScaleInDamping or t.ScaleInDamping
			local v8 = p1.ScaleInFrequency or t.ScaleInFrequency
			local v9 = p1.BackgroundInDamping or t.BackgroundInDamping
			local v10 = p1.BackgroundInFrequency or t.BackgroundInFrequency
			local v11 = p1.ScaleOutDamping or t.ScaleOutDamping
			local v122 = p1.BackgroundOutDamping or t.BackgroundOutDamping
			local v132 = p1.BackgroundOutFrequency or t.BackgroundOutFrequency
			local v14 = v132 - 0.2
			v3 = function() --[[ Line: 63 | Upvalues: v1 (ref), v6 (ref), v11 (copy), v14 (copy), v4 (copy), v122 (copy), v132 (copy), v22 (copy) ]]
				v1.target(v6, v11, v14, {
					Scale = 0
				})
				v1.target(v4, v122, v132, {
					ImageTransparency = 1
				})
				v1.completed(v6, function() --[[ Line: 72 | Upvalues: v22 (ref) ]]
					v22:Destroy()
				end)
				task.wait(0.2)
				v22:Destroy()
			end
			if not v2 then
				v1.target(v6, v7, v8, {
					Scale = Scale
				})
				v1.target(v4, v9, v10, {
					ImageTransparency = ImageTransparency
				})
			end
		end)
		return function() --[[ Line: 91 | Upvalues: v4 (copy), v2 (ref), v3 (ref) ]]
			task.cancel(v4)
			if v2 then
				return
			end
			v2 = true
			if not v3 then
				return
			end
			v3()
		end
	end
end