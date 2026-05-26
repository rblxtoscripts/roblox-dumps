-- https://lua.expert/
local v1 = false
script.Parent:WaitForChild("Button"):WaitForChild("ClickDetector").MouseClick:Connect(function() --[[ Line: 2 | Upvalues: v1 (ref) ]]
	if not v1 then
		v1 = true
		script.Parent.place_segment:Invoke()
		v1 = false
	end
end)