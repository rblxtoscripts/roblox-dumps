-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local LocalPlayer = game.Players.LocalPlayer
local Rocks = v1.Rocks
local t = {}
local v2 = false
local list = {}
for i, v in ipairs(v1:GetChildren()) do
	if v.Name == "Shark" then
		t[v] = {
			OriginalPosition = v.Position,
			TargetPosition = v.Position - Vector3.new(0, -2, 0)
		}
	end
end
local function Animate() --[[ Animate | Line: 19 | Upvalues: v2 (ref), t (copy), list (copy) ]]
	v2 = true
	for k, v in pairs(t) do
		local v1 = game:GetService("TweenService"):Create(k, TweenInfo.new(math.random(4, 7), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
			Position = v.TargetPosition
		})
		v1:Play()
		table.insert(list, v1)
	end
end
v1.Shark:GetPropertyChangedSignal("Anchored"):connect(function() --[[ Line: 28 | Upvalues: v1 (copy), list (copy), v2 (ref), Animate (copy) ]]
	if v1.Shark.Anchored then
		Animate()
		return
	end
	for i, v in ipairs(list) do
		v:Cancel()
	end
	v2 = false
end)
while true do
	if LocalPlayer:DistanceFromCharacter(Rocks.Position) < 20 and not v2 then
		Animate()
		wait(10)
	elseif LocalPlayer:DistanceFromCharacter(Rocks.Position) > 20 and v2 then
		for i, v in ipairs(list) do
			v:Cancel()
		end
		v2 = false
	end
	wait(2)
end