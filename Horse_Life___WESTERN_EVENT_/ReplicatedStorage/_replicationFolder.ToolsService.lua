-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDataService")
local v2 = Sonar("PlayerWrapper")
local v3 = game:GetService("RunService"):IsServer()
function t.Init(p1) --[[ Init | Line: 14 | Upvalues: v1 (copy), v3 (copy), v2 (copy) ]]
	for k, v in pairs(v1.GetType("Tools")) do
		if not v.Uses then
			warn("No uses left found for tool", k)
		end
	end
	if not v3 then
		return
	end
	v2.bindToPlayers(function(p1) --[[ Line: 22 | Upvalues: v2 (ref), v1 (ref) ]]
		local v12 = v2.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		for k, v in pairs(v12:GetItemFolder("Tools"):GetChildren()) do
			local v22 = v1.GetByType(v.Name, "Tools")
			if v22 then
				local function usesChanged(p1) --[[ usesChanged | Line: 30 | Upvalues: v (copy), v22 (copy) ]]
					if not (v.UsesLeft.Value <= 0) then
						return
					end
					v.UsesLeft.Value = p1 and v22.Uses or (if if v.Value <= 1 then true else false then 0 else v22.Uses)
					if p1 then
						return
					end
					v.Value = math.max(v.Value - 1, 0)
				end
				v12.Maid:GiveTask(v.UsesLeft:GetPropertyChangedSignal("Value"):Connect(usesChanged))
				if v.UsesLeft.Value <= 0 then
					v.UsesLeft.Value = v22.Uses or (if v.Value <= 1 then 0 else v22.Uses)
				end
			end
		end
	end)
end
t:Init()
return t