-- https://lua.expert/
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
if require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserAllowAbilityControls") then
	local Players = game:GetService("Players")
	local t = {}
	local v1 = nil
	local v2 = nil
	local v3 = Instance.new("BindableEvent")
	local v4 = nil
	local v5 = false
	local function characterAdded(p1) --[[ characterAdded | Line: 16 | Upvalues: v1 (ref), v2 (ref), v4 (ref), v3 (copy) ]]
		v1 = nil
		v2 = nil
		if v4 then
			v4:Disconnect()
			v4 = nil
		end
		if not p1 then
			return
		end
		v1 = p1:FindFirstChild("AbilityManagerActor")
		v2 = p1:FindFirstChildOfClass("Humanoid")
		while not v2 do
			p1.ChildAdded:wait()
			v2 = p1:FindFirstChildOfClass("Humanoid")
		end
		v3:Fire()
		v4 = v2:GetPropertyChangedSignal("EvaluateStateMachine"):Connect(function() --[[ Line: 33 | Upvalues: v3 (ref) ]]
			v3:Fire()
		end)
	end
	local function lazyInit() --[[ lazyInit | Line: 39 | Upvalues: v5 (ref), Players (copy), characterAdded (copy) ]]
		if v5 then
			return
		end
		v5 = true
		local LocalPlayer = Players.LocalPlayer
		if not LocalPlayer then
			return
		end
		LocalPlayer.characterAdded:Connect(characterAdded)
		if not LocalPlayer.Character then
			return
		end
		characterAdded(LocalPlayer.Character)
	end
	function t.isEnabled() --[[ isEnabled | Line: 54 | Upvalues: v5 (ref), Players (copy), characterAdded (copy), v1 (ref), v2 (ref) ]]
		if not v5 then
			v5 = true
			local LocalPlayer = Players.LocalPlayer
			if LocalPlayer then
				LocalPlayer.characterAdded:Connect(characterAdded)
				if LocalPlayer.Character then
					characterAdded(LocalPlayer.Character)
				end
			end
		end
		return if v1 == nil then false else v2 and not v2.EvaluateStateMachine
	end
	function t.GetEnabledChangedSignal() --[[ GetEnabledChangedSignal | Line: 59 | Upvalues: v5 (ref), Players (copy), characterAdded (copy), v3 (copy) ]]
		if v5 then
			return v3.Event
		end
		v5 = true
		local LocalPlayer = Players.LocalPlayer
		if not LocalPlayer then
			return v3.Event
		end
		LocalPlayer.characterAdded:Connect(characterAdded)
		if not LocalPlayer.Character then
			return v3.Event
		end
		characterAdded(LocalPlayer.Character)
		return v3.Event
	end
	return t
end