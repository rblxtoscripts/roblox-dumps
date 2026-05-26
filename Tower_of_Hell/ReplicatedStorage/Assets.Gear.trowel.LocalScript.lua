-- https://lua.expert/
local v1 = game.Players.LocalPlayer:GetMouse()
local v2 = false
script.Parent.Activated:connect(function() --[[ Line: 3 | Upvalues: v2 (ref), v1 (copy) ]]
	while v2 == true do
		wait()
	end
	v2 = true
	script.Parent.placeClient:Fire(v1.Origin, v1.Hit)
	wait(0.05)
	v2 = false
end)