-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Tween")
local v2 = script:WaitForChild("ObjectPointer").Value
local Mesh = v2.Energy1.Mesh
local PointLight = v2.Energy1.PointLight
local Sound = v2.Energy1.Sound
Sound:Play()
for i, v in ipairs({ Mesh, v2.Energy2.Mesh, v2.Energy3.Mesh }) do
	wait(0.1)
	math.randomseed(tick())
	spawn(function() --[[ Line: 19 | Upvalues: v (copy) ]]
		while true do
			wait(1)
			game:GetService("TweenService"):Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Scale = Vector3.new(1.5, 1.5, 1.5)
			}):Play()
			wait(1)
			game:GetService("TweenService"):Create(v, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Scale = Vector3.new(1, 1, 1)
			}):Play()
		end
	end)
	if v == Mesh then
		spawn(function() --[[ Line: 34 | Upvalues: PointLight (copy), v1 (copy), Mesh (copy), Sound (copy) ]]
			while true do
				wait()
				PointLight.Range = v1:Map(Mesh.Scale.Y, 1, 1.5, 7, 10) + (Sound.Pitch - 1) * 10
			end
		end)
	end
end