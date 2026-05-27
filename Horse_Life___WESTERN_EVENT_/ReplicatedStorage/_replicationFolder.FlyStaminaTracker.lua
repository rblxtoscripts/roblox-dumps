-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local v3 = Sonar("MutationStatUtils")
local v4 = Sonar("State")
local t = {}
t.__index = t
local v5 = nil
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v2 (copy), v4 (copy), v1 (copy), v5 (ref) ]]
	local v22 = setmetatable({}, t)
	v22.CharacterClass = p1
	v22.Data = p1.AnimalData
	v22.WingData = p1.WingData or {
		MaxLevel = 0,
		Stats = {
			FlyStamina = 0
		}
	}
	v22.WingValue = p1.WingValue
	if v22.WingValue then
		v22.Maid = v1.new()
		v22.Stamina = v22.WingData.Stats.FlyStamina * v22.Data:GetWithModifiers("FlyStaminaMultiplier")
		v22:Enable()
		v22.StaminaChangedSignal = v2.new()
		v22.Maid:GiveTask(v22.StaminaChangedSignal)
		v22._lastDecrement = 0
		v22.StaminaRegenMultiplier = v22.WingData.Stats.StaminaRegenMultiplier or 10
		task.spawn(function() --[[ Line: 74 | Upvalues: v22 (copy) ]]
			while task.wait(1) and not v22.Destroyed do
				if not v22.Enabled then
					continue
				end
				v22:Update()
			end
		end)
		v22.StaminaState = v22.Maid:GiveTask(v4.new(v22.Stamina))
		v22.Maid:GiveTask(v22.StaminaChangedSignal:Connect(function() --[[ Line: 87 | Upvalues: v22 (copy) ]]
			v22.StaminaState:set(v22.Stamina)
		end))
		v5 = v22
		return v22
	else
		v22:Disable()
		local v42 = 100
		local v52 = v2.new()
		local v6 = v4.new(v42)
		local v7 = 0
		local t2 = {
			Destroy = function() --[[ Destroy | Line: 30 | Upvalues: v52 (copy) ]]
				v52:Destroy()
			end,
			Increment = function(p1, p2) --[[ Increment | Line: 31 | Upvalues: v7 (ref), v42 (ref), v52 (copy), v6 (copy) ]]
				local v1
				if not (p2 <= 0) then
					v1 = v42 + p2
					v42 = math.clamp(v1, 0, 100)
					v52:Fire(v42)
					v6:set(v42)
					return
				end
				v7 = tick()
				v1 = v42 + p2
				v42 = math.clamp(v1, 0, 100)
				v52:Fire(v42)
				v6:set(v42)
			end,
			GetStamina = function() --[[ GetStamina | Line: 39 | Upvalues: v42 (ref) ]]
				return v42
			end,
			GetMaxStamina = function() --[[ GetMaxStamina | Line: 40 ]]
				return 100
			end,
			StaminaChangedSignal = v52,
			StaminaState = v6
		}
		task.spawn(function() --[[ Line: 44 | Upvalues: v7 (ref), v42 (ref), v52 (copy), v6 (copy) ]]
			while task.wait(1) do
				if not (tick() - v7 > 1 and v42 < 100) then
					continue
				end
				v42 = math.min(v42 + 10, 100)
				v52:Fire(v42)
				v6:set(v42)
			end
		end)
		return t2
	end
end
function t._clamp(p1, p2) --[[ _clamp | Line: 95 | Upvalues: v3 (copy) ]]
	local v1 = v3.GetValue(p1.WingData.Stats.FlyStamina, p1.WingValue)
	return math.clamp(math.ceil(p2), 0, v1)
end
function t.GetNextStamina(p1) --[[ GetNextStamina | Line: 100 ]]
	local Stamina = p1.Stamina
	return p1:_clamp(p1.Stamina + (if p1.RegenOverride then p1.RegenOverride else p1.Data:GetWithModifiers("StaminaRegen") * (p1.StaminaRegenMultiplier or 1)))
end
function t.GetMaxStamina(p1) --[[ GetMaxStamina | Line: 118 | Upvalues: v3 (copy) ]]
	return v3.GetValue(p1.WingData.Stats.FlyStamina, p1.WingValue)
end
function t.GetRegen(p1) --[[ GetRegen | Line: 122 ]]
	return p1.Data:GetWithModifiers("StaminaRegen")
end
function t.GetStamina(p1) --[[ GetStamina | Line: 125 ]]
	return p1.Stamina
end
function t.SetStaminaRegenOverride(p1, p2) --[[ SetStaminaRegenOverride | Line: 129 ]]
	p1.RegenOverride = p2
end
function t.SetRegenMultiplier(p1, p2) --[[ SetRegenMultiplier | Line: 133 ]]
	p1.StaminaRegenMultiplier = p2
end
function t.Increment(p1, p2) --[[ Increment | Line: 137 ]]
	if p2 <= 0 then
		p1._lastDecrement = tick()
	end
	p1.Stamina = p1:_clamp(p1.Stamina + p2)
	p1.StaminaChangedSignal:Fire(p1.Stamina)
end
function t.Update(p1) --[[ Update | Line: 145 ]]
	if tick() - p1._lastDecrement <= 1 then
		return
	end
	local v1 = p1:GetNextStamina()
	local isNotStamina = v1 ~= p1.Stamina
	p1.Stamina = v1
	if not isNotStamina then
		return
	end
	p1.StaminaChangedSignal:Fire(v1)
end
function t.Enable(p1) --[[ Enable | Line: 161 ]]
	p1.Enabled = true
end
function t.Disable(p1) --[[ Disable | Line: 165 ]]
	p1.Enabled = false
end
function t.GetStaminaChangedSignal(p1) --[[ GetStaminaChangedSignal | Line: 169 ]]
	return p1.StaminaChangedSignal
end
function t.GetTracker(p1) --[[ GetTracker | Line: 173 | Upvalues: v5 (ref) ]]
	return v5
end
function t.Destroy(p1) --[[ Destroy | Line: 177 | Upvalues: v5 (ref) ]]
	v5 = nil
	p1.Destroyed = true
	p1.Maid:Destroy()
end
return t