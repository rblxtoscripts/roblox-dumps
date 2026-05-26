-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MathUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Constants")
local PlayerOctree = v2.PlayerOctree
local function taskLoop(p1, p2) --[[ taskLoop | Line: 18 | Upvalues: RunService (copy) ]]
	local v1 = p2 or 0
	local v2 = tick()
	return RunService.Heartbeat:Connect(function() --[[ Line: 33 | Upvalues: v2 (ref), v1 (ref), p1 (copy) ]]
		local v12 = tick()
		if not (v2 < v12) then
			return
		end
		v2 = v12 + v1
		p1()
	end)
end
local function sanitizeNearbyList(p1, p2) --[[ sanitizeNearbyList | Line: 46 ]]
	if p1.UserWhitelist then
		for i = #p2, 1, -1 do
			local v2 = game.Players:FindFirstChild(p2[i])
			if v2 and not p1.UserWhitelist[v2] then
				table.remove(p2, i)
			end
		end
	end
	return p2
end
function t.idle(p1, p2) --[[ idle | Line: 75 | Upvalues: v3 (copy), PlayerOctree (copy), sanitizeNearbyList (copy), v2 (copy), v1 (copy), RunService (copy) ]]
	p2:GiveTask(task.spawn(function() --[[ Line: 76 | Upvalues: p1 (copy), v3 (ref) ]]
		local v32 = p1.adornee.Position + Vector3.new(math.random(-20, 20), if p1.CanFly then math.random(-10, 10) or 0 else 0, math.random(-20, 20))
		local v4 = v32 - p1.initPos
		local Magnitude = v4.Magnitude
		local v5 = p1.MobData.MaxDistanceFromSpawn or 200
		if p1.IsBoss then
			v5 = v3.MaxBossDistance
		end
		if v5 < Magnitude then
			v32 = p1.initPos + v4.Unit * (v5 - (Magnitude - v5))
		end
		p1:walkToPosition(v32, 15, 3)
		task.wait(math.random(1, 5))
		p1:enterState("idle")
	end))
	local v12 = nil
	local function f2() --[[ Line: 102 | Upvalues: v12 (ref), p1 (copy), p2 (copy), PlayerOctree (ref), sanitizeNearbyList (ref), v2 (ref), v1 (ref) ]]
		if v12 then
			return
		end
		if p1.Maid.stateMaid ~= p2 then
			warn("Late call; this shouldnt happen")
		end
		if p1._destroyed then
			return
		end
		local Position = p1.adornee.Position
		local v13 = p1.IsBoss and p1.MobData.AggroDistance * 12 or p1.MobData.AggroDistance
		local v3 = sanitizeNearbyList(p1, p1.IsBoss and PlayerOctree:GetNearestWithMax(Position, 3, v13) or PlayerOctree:RadiusSearch(Position, v13))
		if not next(v3) then
			return
		end
		for v4, v5 in v3 do
			local v6 = game.Players:FindFirstChild(v5)
			if v6 then
				local v7 = v2.getWrapperFromPlayer(v6)
				if not v7:IsInAction("Race") then
					local PrimaryPart = v7.PrimaryPart
					if PrimaryPart then
						local Character = v7.Character
						if p1.IsBoss and not p1:get("Charging") then
							p1:enterState("charge", Character)
							return
						end
						if (if p1.IsBoss then 10 else 20) < PrimaryPart.Velocity.Magnitude then
							if p1.MobData.Charges and (Character and Character.PrimaryPart) and v1.map(Character.PrimaryPart.Velocity.Magnitude, 0, 16, 0.125, 0.825) >= math.random() then
								p1:enterState("charge", Character)
							end
							if p1:get("Charging") or p1.IsBoss then
								return
							end
							p1:enterState("flee", Character)
							return
						end
					end
				end
			end
		end
		if not p1.IsBoss then
			p1:enterState("curious")
			return
		end
		p1:enterState("idle")
	end
	local v32 = 0.5 or 0
	local v4 = tick()
	p2:GiveTask((RunService.Heartbeat:Connect(function() --[[ Line: 33 | Upvalues: v4 (ref), v32 (ref), f2 (copy) ]]
		local v12 = tick()
		if not (v4 < v12) then
			return
		end
		v4 = v12 + v32
		f2()
	end)))
	p2:GiveTask(function() --[[ Line: 154 | Upvalues: v12 (ref) ]]
		v12 = true
	end)
end
function t.curious(p1, p2) --[[ curious | Line: 159 | Upvalues: RunService (copy), PlayerOctree (copy), v2 (copy) ]]
	p1:standStill()
	local CalmTimer = p1.MobData.CalmTimer
	p2:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 162 | Upvalues: p1 (copy), PlayerOctree (ref), v2 (ref), CalmTimer (ref) ]]
		local Position = p1.adornee.Position
		local v1 = (1 / 0)
		local v22 = nil
		local v3 = true
		for v4, v5 in PlayerOctree:RadiusSearch(Position, p1.MobData.AggroDistance) do
			local v6 = game.Players:FindFirstChild(v5)
			if v6 then
				local v7 = v2.getWrapperFromPlayer(v6)
				local PrimaryPart = v7.PrimaryPart
				if PrimaryPart then
					local Magnitude = (PrimaryPart.Position - Position).Magnitude
					if Magnitude < v1 then
						v22 = v7.Character
						v1 = Magnitude
					end
					v3 = false
					local Magnitude_2 = PrimaryPart.Velocity.Magnitude
					CalmTimer = if Magnitude_2 > 20 then CalmTimer - 10 * p12 elseif Magnitude_2 > 15 then CalmTimer - 6 * p12 elseif Magnitude_2 > 5 then CalmTimer - 1 * p12 else CalmTimer - 0.28 * p12
				end
			end
		end
		if CalmTimer <= 0 and not (p1:get("Charging") or p1.IsBoss) then
			p1:enterState("flee", v22)
		end
		if not v3 then
			return
		end
		p1:enterState("idle")
	end))
end
local function ragdoll(p1, p2, p3) --[[ ragdoll | Line: 209 ]]
	if not (p2 and (p2.PrimaryPart and (p2:FindFirstChild("Humanoid") and p1.MobData.Ragdolls))) then
		return
	end
	if p2.Humanoid:HasTag("Ragdoll") or not ((p3 or 27.5) >= (p1.adornee.Position - p2.PrimaryPart.Position).Magnitude) then
	else
		p1:set("Bucking", true)
		task.wait(0.5)
		p1:set("Bucking", nil)
		return true
	end
end
function t.charge(p1, p2, p3) --[[ charge | Line: 224 | Upvalues: v3 (copy), ragdoll (copy) ]]
	p1:set("Charging", true)
	p2:GiveTask(task.spawn(function() --[[ Line: 226 | Upvalues: p3 (copy), p1 (copy), v3 (ref), ragdoll (ref) ]]
		local PrimaryPart = p3.PrimaryPart
		if not PrimaryPart then
			p1:enterState("idle")
			print("idle return")
			return
		end
		local _nextAttack = p1._nextAttack
		local v1 = 45
		if _nextAttack then
			local v2 = p1.MobAnimationInfo.AttackSequences[_nextAttack]
			if v2.Range then
				v1 = v2.Range
			end
		end
		local v32 = if p1.IsBoss and v1 then v1 else 10
		local v4 = if p1.IsBoss then 7.5 else 12
		local v6 = if p1.IsBoss then nil else ragdoll(p1, p3, v32)
		local v8, v9 = p1:walkToObject(PrimaryPart, v32, p1.IsBoss and v3.MaxBossDistance or 40, 35, v4)
		if p1.IsBoss and (not v8 or v9) then
			local v10 = tick()
			if v10 - (p1._timeSinceAttack or tick()) > 45 and p3 then
				p1:_teleport()
			end
			p1._nextAttack = p1:_getNextAttack()
		end
		if v8 and not v6 then
			if not (p3 and p3.PrimaryPart) then
				p1:enterState("idle")
				return
			end
			if p1.IsBoss and (v8 and not v9) then
				p1._timeSinceAttack = tick()
				p1:enterState("attack", p3)
			else
				p1:enterState("idle")
			end
		elseif p1.IsBoss then
			p1:enterState("charge", p3)
		else
			p1:enterState("idle")
		end
	end))
	p2:GiveTask(function() --[[ Line: 291 | Upvalues: p1 (copy) ]]
		p1:set("Charging", nil)
	end)
end
function t.attack(p1, p2, p3) --[[ attack | Line: 296 | Upvalues: v2 (copy) ]]
	local v1 = 0
	p2:GiveTask(task.spawn(function() --[[ Line: 300 | Upvalues: p1 (copy), v1 (ref), v2 (ref) ]]
		if not (p1.nearby and next(p1.nearby)) then
			p1:enterState("idle")
			return
		end
		if not next(p1.nearby) then
			p1:enterState("idle")
			return
		end
		local v12 = p1._nextAttack or p1:_getNextAttack()
		local v22 = p1.MobAnimationInfo.AttackSequences[v12]
		p1._nextAttack = p1:_getNextAttack()
		p1:set("Warning", v12)
		v1 = 1.2
		task.wait(v1)
		p1:set("Warning", nil)
		p1:set("Attacking", v12)
		local Hitbox = v22.Hitbox
		if not Hitbox then
			task.wait(1)
			p1:set("Attacking", nil)
			p1:enterState("idle")
			return
		end
		p1._attackHitboxCache = p1._attackHitboxCache or {}
		local v5 = p1._attackHitboxCache[Hitbox] or p1:_makeCachedHitbox(v22)
		p1:_prepareHitbox(v5)
		for v6, v7 in p1:_checkHitbox(v5) do
			local v8 = v2.getWrapperFromPlayer(game.Players:FindFirstChild(v7.Name))
			if v8 and not v8:IsInAction("GlobalBossFight") then
				p1:_decrementTool(v8, p1.IsBoss and v8:IsInAction("BossFight"))
			end
		end
		task.wait(1)
		p1:set("Attacking", nil)
		p1:enterState("idle")
	end))
end
function t.flee(p1, p2, p3) --[[ flee | Line: 353 | Upvalues: ragdoll (copy) ]]
	p1:set("Fleeing", true)
	p2:GiveTask(task.spawn(function() --[[ Line: 359 | Upvalues: p3 (copy), p1 (copy), ragdoll (ref) ]]
		local PrimaryPart = p3.PrimaryPart
		if not PrimaryPart then
			p1:enterState("idle")
			return
		end
		if not p1.MobData.Charges then
			ragdoll(p1, p3)
		end
		if p1:walkAwayFromObject(PrimaryPart, 50, 25, 12) then
			p1:enterState("idle")
			return
		end
		if p3 and p3.PrimaryPart then
			p1:enterState("flee", p3)
		else
			p1:enterState("idle")
		end
	end))
	p2:GiveTask(function() --[[ Line: 391 | Upvalues: p1 (copy) ]]
		p1:set("Fleeing", nil)
	end)
end
function t.taming(p1, p2, p3) --[[ taming | Line: 396 ]]
	local v1 = workspace:GetServerTimeNow()
	local v2 = p1:get("TamingTimerEnd") or v1 + p1.MobData.TamingTimer
	if not (v2 < v1) then
		p1:standStill()
		p2:GiveTask(task.delay(v2 - v1, function() --[[ Line: 410 | Upvalues: p1 (copy), p3 (copy) ]]
			print("Timer ran out during taming")
			p1:_resetTamingState()
			if p3 and p3.Character then
				p1:enterState("flee", p3.Character)
			else
				p1:enterState("idle")
			end
		end))
		return
	end
	if p1.IsBoss then
		return
	end
	p1:_resetTamingState()
	p1:enterState("idle")
end
function t.tamingFleeing(p1, p2) --[[ tamingFleeing | Line: 421 ]]
	local v1 = workspace:GetServerTimeNow()
	local v2 = p1:get("TamingTimerEnd") or v1 + p1.MobData.TamingTimer
	local v3 = table.clone(p1.Contributors)
	v3[p1.currentTamer] = true
	if not v3 or next(v3) == nil then
		p1:_resetTamingState()
		p1:enterState("idle")
		return
	end
	if v2 < v1 then
		p1:_resetTamingState()
		p1:enterState("idle")
		return
	end
	p1:set("Fleeing", true)
	p2:GiveTask(task.spawn(function() --[[ Line: 442 | Upvalues: v3 (copy), p1 (copy) ]]
		while true do
			local v1 = math.random(1, 3)
			for v2, v32 in v3 do
				local Character = v2.Character
				if not (Character and Character.PrimaryPart) then
					break
				end
				p1:walkAwayFromObject(Character.PrimaryPart, 150, math.max(math.clamp(Character.PrimaryPart.Velocity.Magnitude, p1.MobData.MoveSpeed - 10, p1.MobData.MoveSpeed + 10) + math.random(-5, 5), 20) * (p1.SpeedMultiplier or 1), v1, 1.3962634015954636 * (p1.MobData.NoiseMultiplier or 1))
			end
			task.wait()
		end
	end))
	for v4, v5 in v3 do
		local Character = v4.Character
		if Character and Character.PrimaryPart then
			p2:GiveTask(Character.PrimaryPart.AncestryChanged:Connect(function() --[[ Line: 468 | Upvalues: v3 (copy), p1 (copy) ]]
				for k, v in pairs(v3) do
					local Character = k.Character
					if Character and (Character.PrimaryPart and Character.PrimaryPart.Parent) then
						return
					end
				end
				p1:enterState("idle")
			end))
		end
	end
	p2:GiveTask(task.delay(v2 - v1, function() --[[ Line: 480 | Upvalues: p1 (copy) ]]
		p1:_resetTamingState()
		p1:enterState("idle")
	end))
	p2:GiveTask(function() --[[ Line: 485 | Upvalues: p1 (copy) ]]
		p1:set("Fleeing", nil)
	end)
end
return t