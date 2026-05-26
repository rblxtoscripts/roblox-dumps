-- https://lua.expert/
require(game.ServerScriptService.Modules.admins)
return function(p1, p2) --[[ Line: 2 ]]
	local v1 = game.ReplicatedStorage.data:FindFirstChild(p1.UserId)
	v1.subscription.Changed:Connect(function() --[[ Line: 4 | Upvalues: v1 (copy) ]]
		if not (v1.subscription.Value > os.time()) or require(game.ReplicatedStorage.stringListContains)(v1.effects.Value, script.Parent.Name) then
			return
		end
		v1.effects.Value = v1.effects.Value .. script.Parent.Name .. ";"
	end)
	return v1.subscription.Value > os.time()
end