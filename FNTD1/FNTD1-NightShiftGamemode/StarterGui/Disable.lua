-- https://lua.expert/
repeat
	local v1 = pcall(function() --[[ Line: 2 ]]
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", false)
	end)
	task.wait(1)
until v1