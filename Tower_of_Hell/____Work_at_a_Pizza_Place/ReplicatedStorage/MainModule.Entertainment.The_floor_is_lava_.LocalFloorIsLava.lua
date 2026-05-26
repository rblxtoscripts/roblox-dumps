-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local v2 = true
while true do
	local v4 = game:GetService("TweenService"):Create(v1.Lava.Texture, TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		OffsetStudsV = if v2 then 5 else 0
	})
	v4:Play()
	v4.Completed:Wait()
	v2 = not v2
end