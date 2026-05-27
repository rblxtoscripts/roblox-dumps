-- https://lua.expert/
local t = {}
local SoundService = game:GetService("SoundService")
function t.PlayLocalSound(p1, p2) --[[ PlayLocalSound | Line: 9 | Upvalues: SoundService (copy) ]]
	local v1 = p2:Clone()
	v1.SoundGroup = p2.SoundGroup
	v1.Parent = SoundService
	v1:Play()
	v1.Ended:Connect(function() --[[ Line: 15 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
return t