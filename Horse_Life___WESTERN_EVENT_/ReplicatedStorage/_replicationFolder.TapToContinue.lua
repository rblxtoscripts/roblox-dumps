-- https://lua.expert/
local t = {}
local UserInputService = game:GetService("UserInputService")
function t.IsAdvanceInput(p1) --[[ IsAdvanceInput | Line: 5 ]]
	return if p1.UserInputType == Enum.UserInputType.MouseButton1 then true else p1.KeyCode == Enum.KeyCode.ButtonR2
end
function t.Connect(p1) --[[ Connect | Line: 10 | Upvalues: UserInputService (copy), t (copy) ]]
	local t2 = {}
	local v1 = false
	local function disconnect() --[[ disconnect | Line: 14 | Upvalues: v1 (ref), t2 (copy) ]]
		if v1 then
			return
		end
		v1 = true
		for v12, v2 in t2 do
			v2:Disconnect()
		end
	end
	t2[#t2 + 1] = UserInputService.InputBegan:Connect(function(p12) --[[ Line: 26 | Upvalues: t (ref), p1 (copy) ]]
		if t.IsAdvanceInput(p12) then
			p1()
		end
	end)
	t2[#t2 + 1] = UserInputService.TouchTap:Connect(function() --[[ Line: 34 | Upvalues: p1 (copy) ]]
		p1()
	end)
	return disconnect
end
function t.Once(p1) --[[ Once | Line: 41 | Upvalues: t (copy) ]]
	local v1 = nil
	v1 = t.Connect(function() --[[ Line: 44 | Upvalues: v1 (ref), p1 (copy) ]]
		if v1 then
			local v12 = v1
			v1 = nil
			v12()
			p1()
		end
	end)
	return function() --[[ Line: 56 | Upvalues: v1 (ref) ]]
		if v1 then
			v1()
			v1 = nil
		end
	end
end
function t.Wait() --[[ Wait | Line: 66 | Upvalues: t (copy) ]]
	local v1 = coroutine.running()
	t.Once(function() --[[ Line: 69 | Upvalues: v1 (copy) ]]
		task.spawn(v1)
	end)
	coroutine.yield()
end
return t