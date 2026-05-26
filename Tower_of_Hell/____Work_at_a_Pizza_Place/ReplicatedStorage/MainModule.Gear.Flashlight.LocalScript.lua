-- https://lua.expert/
sp = script.Parent
cooldown = 0.35
lightontexture = 115984370
lightofftexture = 115955343
local Motor = sp:WaitForChild("Motor")
local LightPart = sp:WaitForChild("LightPart")
local Handle = sp:WaitForChild("Handle")
local SpotLight = LightPart:WaitForChild("SpotLight")
local SpotLight2 = LightPart:WaitForChild("SpotLight2")
local Mesh = Handle:WaitForChild("Mesh")
local Sound = Handle:WaitForChild("Sound")
lastclick = 0
sp.Equipped:connect(function(p1) --[[ Line: 24 | Upvalues: SpotLight (copy), SpotLight2 (copy), Mesh (copy), Sound (copy), Motor (copy), Handle (copy) ]]
	equipped = true
	if p1 ~= nil then
		themouse = p1
		p1.Button1Down:connect(function() --[[ Line: 28 | Upvalues: SpotLight (ref), SpotLight2 (ref), Mesh (ref), Sound (ref) ]]
			if not (lastclick + cooldown < tick()) then
				return
			end
			SpotLight.Enabled = not SpotLight.Enabled
			SpotLight2.Enabled = SpotLight.Enabled
			Mesh.TextureId = "http://www.roblox.com/asset?id=" .. tostring(SpotLight.Enabled and lightontexture or lightofftexture)
			Sound:Play()
			lastclick = tick()
		end)
	end
	if Motor ~= nil then
		Motor.Parent = sp
	end
	while equipped and sp.Parent ~= nil do
		local Head = sp.Parent:FindFirstChild("Head")
		if SpotLight.Enabled and (themouse and (Handle and (Motor and Head))) then
			local v1 = themouse.Hit.p - Head.Position
			local p = (Handle.CFrame * CFrame.new(0, 0, -1)).p
			Motor.C0 = Handle.CFrame:toObjectSpace((CFrame.new(p, p + v1)))
		end
		wait()
	end
end)
sp.Unequipped:connect(function() --[[ Line: 54 | Upvalues: Motor (copy) ]]
	if Motor ~= nil then
		Motor.Parent = sp
	end
	equipped = false
end)