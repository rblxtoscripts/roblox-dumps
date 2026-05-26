-- https://lua.expert/
local SFX = game:GetService("ReplicatedStorage").Storage.SFX
return {
	PlaySound = function(p1) --[[ PlaySound | Line: 7 | Upvalues: SFX (copy) ]]
		local v1 = SFX[p1]:Clone()
		v1.Parent = workspace
		v1.SoundGroup = SFX[p1].SoundGroup
		v1:Play()
		v1.Ended:Once(function() --[[ Line: 13 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end,
	PlaySoundAtPosition = function(p1, p2) --[[ PlaySoundAtPosition | Line: 18 | Upvalues: SFX (copy) ]]
		local Part = Instance.new("Part")
		Part.Position = p2
		Part.Size = Vector3.new(1, 1, 1)
		Part.Transparency = 1
		Part.Anchored = true
		Part.CanCollide = false
		local v1 = SFX[p1]:Clone()
		v1.Parent = Part
		v1.SoundGroup = SFX[p1].SoundGroup
		Part.Parent = workspace
		v1:Play()
		v1.Ended:Once(function() --[[ Line: 33 | Upvalues: Part (copy), v1 (copy) ]]
			Part:Destroy()
			v1:Destroy()
		end)
	end
}