-- https://lua.expert/
local v1 = script.Parent.Parent
local v2 = nil
local v3 = nil
local v4 = nil
local Controller = script.Parent:WaitForChild("Controller");
({}).Debris = game:GetService("Debris")
local ClientAgent = require(script.Parent:WaitForChild("ClientAgent"))
local t = { v1:WaitForChild("Throw") }
local t2 = {}
function Controller.OnClientInvoke(...) --[[ Line: 20 | Upvalues: ClientAgent (copy), v4 (ref), t2 (copy) ]]
	local t = { ... }
	if t[1] == ClientAgent.REQUEST_TARGETPOINT then
		return if v4 then v4.TargetPoint or nil else nil
	else
		if t[1] == ClientAgent.REQUEST_ANIMATIONS then
			repeat
				wait()
			until t2[t[2]] ~= nil
			t2[t[2]]:Play()
		else
			if t[1] ~= ClientAgent.REQUEST_ANIMATIONS_END then
				return
			end
			for k, v in pairs(t2) do
				t2[k]:Stop()
			end
		end
		return true
	end
end
v1.Equipped:connect(function() --[[ Line: 34 | Upvalues: v3 (ref), v1 (copy), v2 (ref), v4 (ref), t2 (copy), t (copy), Controller (copy), ClientAgent (copy) ]]
	v3 = v1.Parent
	v2 = game.Players.LocalPlayer
	v3 = v2.Character
	v4 = v3:findFirstChild("Humanoid")
	if not v3 or (not v4 or v4.Health == 0) then
		return
	end
	if #t2 ~= 0 then
		return
	end
	for i = 1, #t do
		t2[t[i].Name] = v4:LoadAnimation(t[i])
	end
	t2.Throw.KeyframeReached:connect(function(p1) --[[ Line: 44 | Upvalues: Controller (ref), ClientAgent (ref) ]]
		if p1 ~= "throw" then
			return
		end
		Controller:InvokeServer(ClientAgent.FIRE)
	end)
end)