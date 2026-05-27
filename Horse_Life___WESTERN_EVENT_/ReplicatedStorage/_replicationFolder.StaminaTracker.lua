-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local v3 = Sonar("Constants")
local v4 = Sonar("State")
local t = {}
t.__index = t
local v5 = nil
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v1 (copy), v2 (copy), v4 (copy), v5 (ref) ]]
	local v22 = setmetatable({}, t)
	v22.CharacterClass = p1
	v22.Data = p1.AnimalData
	v22.Maid = v1.new()
	v22.Stamina = v22.Data:GetWithModifiers("Stamina")
	v22:Enable()
	v22.StaminaChangedSignal = v2.new()
	v22.Maid:GiveTask(v22.StaminaChangedSignal)
	v22._lastDecrement = 0
	task.spawn(function() --[[ Line: 30 | Upvalues: v22 (copy) ]]
		while task.wait(1) and not v22.Destroyed do
			if not v22.Enabled then
				continue
			end
			v22:Update()
		end
	end)
	v22.StaminaState = v22.Maid:GiveTask(v4.new(v22.Stamina))
	v22.Maid:GiveTask(v22.StaminaChangedSignal:Connect(function() --[[ Line: 43 | Upvalues: v22 (copy) ]]
		v22.StaminaState:set(v22.Stamina)
	end))
	v5 = v22
	return v22
end
function t._clamp(p1, p2) --[[ _clamp | Line: 51 ]]
	local v1 = p1.Data:GetWithModifiers("Stamina")
	return math.clamp(math.ceil(p2), 0, v1)
end
function t.GetNextStamina(p1) --[[ GetNextStamina | Line: 56 | Upvalues: v3 (copy) ]]
	local Stamina = p1.Stamina
	local v32 = math.max(v3.StaminaRegenStates[p1.CharacterClass.MoveState] or 1, if _G.RacingMovement then 4 else 0)
	local v4 = if p1.RegenOverride then p1.RegenOverride else p1.Data:GetWithModifiers("StaminaRegen") * (p1.StaminaRegenMultiplier or 1)
	if p1.StaminaRegenMultiplier then
		p1.StaminaRegenMultiplier = nil
	end
	return p1:_clamp(p1.Stamina + v4 * v32)
end
function t.GetMaxStamina(p1) --[[ GetMaxStamina | Line: 80 ]]
	return p1.Data:GetWithModifiers("Stamina")
end
function t.GetRegen(p1) --[[ GetRegen | Line: 84 ]]
	return p1.Data:GetWithModifiers("StaminaRegen")
end
function t.GetStamina(p1) --[[ GetStamina | Line: 87 ]]
	return p1.Stamina
end
function t.SetStaminaRegenOverride(p1, p2) --[[ SetStaminaRegenOverride | Line: 91 ]]
	p1.RegenOverride = p2
end
function t.SetRegenMultiplier(p1, p2) --[[ SetRegenMultiplier | Line: 95 ]]
	p1.StaminaRegenMultiplier = p2
end
function t.Increment(p1, p2) --[[ Increment | Line: 99 ]]
	if p2 == 0 then
		return
	end
	if p2 <= 0 then
		if _G.UnlimitedStamina then
			return
		end
		p1._lastDecrement = tick()
	end
	p1.Stamina = p1:_clamp(p1.Stamina + p2)
	p1.StaminaChangedSignal:Fire(p1.Stamina)
end
function t.Update(p1) --[[ Update | Line: 114 ]]
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
function t.Enable(p1) --[[ Enable | Line: 130 ]]
	p1.Enabled = true
end
function t.Disable(p1) --[[ Disable | Line: 134 ]]
	p1.Enabled = false
end
function t.GetStaminaChangedSignal(p1) --[[ GetStaminaChangedSignal | Line: 138 ]]
	return p1.StaminaChangedSignal
end
function t.GetTracker(p1) --[[ GetTracker | Line: 142 | Upvalues: v5 (ref) ]]
	return v5
end
function t.Destroy(p1) --[[ Destroy | Line: 146 | Upvalues: v5 (ref) ]]
	v5 = nil
	p1.Destroyed = true
	p1.Maid:Destroy()
end
return t