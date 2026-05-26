-- https://lua.expert/
local t = {}
t.__index = t
local CollectionService = game:GetService("CollectionService")
function t.new(p1, p2) --[[ new | Line: 7 | Upvalues: t (copy), CollectionService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.SoundGroup = p1
	p1.DescendantAdded:Connect(function(p1) --[[ Line: 11 | Upvalues: v2 (copy) ]]
		v2:_addSound(p1)
	end)
	for k, v in pairs(p1:GetDescendants()) do
		v2:_addSound(v)
	end
	CollectionService:GetInstanceAddedSignal(p2):Connect(function(p1) --[[ Line: 16 | Upvalues: v2 (copy) ]]
		v2:_addSound(p1)
	end)
	for k, v in pairs(CollectionService:GetTagged(p2)) do
		v2:_addSound(v)
	end
	return v2
end
function t._addSound(p1, p2) --[[ _addSound | Line: 24 ]]
	if not p2:IsA("Sound") then
		return
	end
	p2.SoundGroup = p1.SoundGroup
	if not p2:GetAttribute("PlayOnLoad") then
		return
	end
	p2:Play()
end
return t