-- https://lua.expert/
local v1 = nil
local t = {
	PlaySound = function(p1, p2) --[[ PlaySound | Line: 5 | Upvalues: v1 (ref) ]]
		if not p2 then
			p2 = 0
		end
		if not v1 then
			v1 = Instance.new("Folder", workspace)
			v1.Name = "Sounds"
		end
		local v12
		if typeof(p1) == "string" then
			v12 = Instance.new("Sound", v1)
			v12.SoundId = p1
		else
			v12 = p1:Clone()
			v12.Parent = v1
		end
		task.delay(p2, function() --[[ Line: 22 | Upvalues: v12 (ref) ]]
			v12:Play()
		end)
		task.delay(p2 + v12.TimeLength / v12.PlaybackSpeed, function() --[[ Line: 26 | Upvalues: v12 (ref) ]]
			v12:Destroy()
		end)
		return v12
	end
}
local t2 = {}
local v2 = nil
function t.SoundSetting(p1) --[[ SoundSetting | Line: 35 | Upvalues: v2 (ref), v1 (ref), t2 (ref) ]]
	if v2 then
		v2:Disconnect()
	end
	if not v1 then
		v1 = Instance.new("Folder", workspace)
		v1.Name = "Sounds"
	end
	if p1 then
		for k, v in pairs(t2) do
			if k then
				k.Volume = v
			end
		end
		t2 = {}
	else
		v2 = v1.ChildAdded:Connect(function(p1) --[[ Line: 50 | Upvalues: t2 (ref) ]]
			if not t2[p1] then
				t2[p1] = p1.Volume
			end
			p1.Volume = 0
		end)
		for k, v in pairs(v1:GetChildren()) do
			if not t2[v] then
				t2[v] = v.Volume
			end
			v.Volume = 0
		end
	end
end
return t