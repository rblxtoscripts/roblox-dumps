-- https://lua.expert/
local v1 = false
script.Parent.ClickDetector.MouseClick:Connect(function() --[[ Line: 3 | Upvalues: v1 (ref) ]]
	if v1 ~= false then
		return
	end
	v1 = true
	script.Sound:Play()
	wait(1)
	v1 = false
end)