-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GamepadService = game:GetService("GamepadService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("BondObjectClass")
local v3 = Sonar("Signal")
local v4 = Sonar("InputTypeDetector")
local t2 = {
	Soap = "Rub the soap onto your horse",
	Shower = "Rinse your horse off with water",
	Brush = "Drag the brush over your horse"
}
local ContainerFrame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AnimalBondingGui").ContainerFrame
local TimeLabel = ContainerFrame.TimeLabel
local Fill = TimeLabel:FindFirstChild("Fill", true)
local PromptLabel = ContainerFrame.PromptLabel
local CancelButton = ContainerFrame.CancelButton
local v5 = v1.new()
local v6 = tick()
local v7 = nil
local v8 = script
local function setPromptText(p1) --[[ setPromptText | Line: 69 | Upvalues: PromptLabel (copy) ]]
	PromptLabel.Text = p1 or ""
	PromptLabel.Visible = #PromptLabel.Text > 0
end
local function canContinue(p1) --[[ canContinue | Line: 75 ]]
	return p1._canContinue and p1:_canContinue() and true or false
end
local t3 = {
	Hose = function(p1, p2, p3, p4) --[[ Hose | Line: 84 | Upvalues: v8 (copy), v2 (copy), t2 (copy), PromptLabel (copy) ]]
		for k, v in pairs({ "Shower" }) do
			local v1 = v8:FindFirstChild(v)
			if v1 then
				for k2, v3 in pairs(v1:GetChildren()) do
					if v3:IsA("ParticleEmitter") then
						local v22 = v3:Clone()
						v22.Parent = p2.Root
						v22:Emit(5)
						p1.SequenceMaid:GiveTask(v22)
					end
				end
			end
			local t = {
				MouseIcon = true,
				ScreenRayDistance = 12,
				Type = v,
				CustomModel = p4
			}
			t.PlayEffectsOnMove = if v == "Shower" then false else true
			t.PlayEffects = if v == "Shower" then true else false
			t.Offset = CFrame.Angles(0, 0, 0)
			local v6 = v2.new(t)
			p1.SequenceMaid:GiveTask(v6)
			PromptLabel.Text = t2[v] or ""
			PromptLabel.Visible = if #PromptLabel.Text > 0 then true else false
			if not p1:_yieldForMovement(3, v6) then
				return
			end
			p1.SequenceMaid:DoCleaning()
		end
		p1:_animateFinish(p2)
		p1:End(p2)
	end,
	Soap = function(p1, p2, p3, p4) --[[ Soap | Line: 123 | Upvalues: v8 (copy), v2 (copy), t2 (copy), PromptLabel (copy) ]]
		function p1.OnDestroy() --[[ Line: 124 | Upvalues: v8 (ref) ]]
			v8.Soap.Flies:Stop()
		end
		for k, v in pairs({ "Soap" }) do
			local v1 = v8:FindFirstChild(v)
			if v1 then
				v8.Soap.Flies:Play()
				for k2, v3 in pairs(v1:GetChildren()) do
					if v3:IsA("ParticleEmitter") then
						local v22 = v3:Clone()
						v22.Parent = p2.Root
						v22:Emit(5)
						p1.SequenceMaid:GiveTask(v22)
					end
				end
			end
			local t = {
				MouseIcon = true,
				ScreenRayDistance = 12,
				Type = v,
				CustomModel = p4
			}
			t.PlayEffectsOnMove = if v == "Shower" then false else true
			t.PlayEffects = if v == "Shower" then true else false
			t.Offset = CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)
			local v6 = v2.new(t)
			p1.SequenceMaid:GiveTask(v6)
			PromptLabel.Text = t2[v] or ""
			PromptLabel.Visible = if #PromptLabel.Text > 0 then true else false
			if not p1:_yieldForMovement(3, v6) then
				return
			end
			v8.Soap.Flies:Stop()
			p1.SequenceMaid:DoCleaning()
		end
		p1:_animateFinish(p2)
		p1:End(p2)
	end,
	Brush = function(p1, p2, p3, p4) --[[ Brush | Line: 171 | Upvalues: v8 (copy), v2 (copy), t2 (copy), PromptLabel (copy) ]]
		for k, v in pairs({ "Brush" }) do
			local v1 = v8:FindFirstChild(v)
			if v1 then
				for k2, v3 in pairs(v1:GetChildren()) do
					if v3:IsA("ParticleEmitter") then
						local v22 = v3:Clone()
						v22.Parent = p2.Root
						v22:Emit(5)
						p1.SequenceMaid:GiveTask(v22)
					end
				end
			end
			local v3 = v2.new({
				PlayEffectsOnMove = true,
				MouseIcon = true,
				ScreenRayDistance = 15,
				Type = v,
				CustomModel = p4,
				Offset = CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0)
			})
			p1.SequenceMaid:GiveTask(v3)
			PromptLabel.Text = t2[v] or ""
			PromptLabel.Visible = if #PromptLabel.Text > 0 then true else false
			if not p1:_yieldForMovement(3, v3) then
				return
			end
			p1.SequenceMaid:DoCleaning()
		end
		p1:_animateFinish(p2)
		p1:End(p2)
	end
}
local function runSequence(p1, ...) --[[ runSequence | Line: 212 ]]
	for i, v in ipairs(p1) do
		local v1
		v1 = p1._canContinue and p1:_canContinue() and true or false
		if not v1 then
			break
		end
		if not v(p1, ...) then
			break
		end
	end
end
function t._animateFinish(p1, p2) --[[ _animateFinish | Line: 221 | Upvalues: v8 (copy) ]]
	for k, v in pairs(v8.Finish:GetChildren()) do
		if v:IsA("ParticleEmitter") then
			local v1 = v:Clone()
			v1.Enabled = true
			v1.Parent = p2.Root
			v1:Emit(20)
			task.delay(2, function() --[[ Line: 230 | Upvalues: v1 (ref) ]]
				v1.Enabled = false
				task.wait(1)
				v1:Destroy()
			end)
		end
	end
	v8.Finish.SqueakyClean:Play()
end
function t.new(p1, ...) --[[ new | Line: 240 | Upvalues: t (copy), v1 (copy), v6 (ref), v3 (copy) ]]
	local v2 = setmetatable({
		Actions = p1
	}, t)
	v2.args = { ... }
	v2.Maid = v1.new()
	v2.SequenceMaid = v1.new()
	v2.Tick = tick()
	v6 = v2.Tick
	v2.CompletedSignal = v3.new()
	v2.Maid:GiveTask(v2.CompletedSignal)
	v2:Start()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 272 | Upvalues: v7 (ref), v6 (ref), PromptLabel (copy) ]]
	p1.Destroyed = true
	p1:_enableGamepadCursorIfNeeded()
	if p1 == v7 then
		v7 = nil
		v6 = tick()
	end
	if p1.OnDestroy then
		pcall(p1.OnDestroy)
	end
	PromptLabel.Text = ""
	PromptLabel.Visible = if #PromptLabel.Text > 0 then true else false
	p1.Maid:Destroy()
	p1.SequenceMaid:Destroy()
	setmetatable(p1, nil)
end
function t.Start(p1) --[[ Start | Line: 293 | Upvalues: runSequence (copy) ]]
	if type(p1.Actions) == "table" then
		task.spawn(runSequence, p1, table.unpack(p1.args))
	else
		task.spawn(p1.Actions, p1, table.unpack(p1.args))
	end
end
function t._enableGamepadCursorIfNeeded(p1) --[[ _enableGamepadCursorIfNeeded | Line: 303 | Upvalues: v4 (copy), GamepadService (copy) ]]
	if v4.IsGamepadInputType() and not p1.Destroyed then
		if not GamepadService.GamepadCursorEnabled then
			GamepadService:EnableGamepadCursor(nil)
		end
	else
		if not GamepadService.GamepadCursorEnabled then
			return
		end
		GamepadService:DisableGamepadCursor(nil)
	end
end
function t.OnCompleted(p1, p2) --[[ OnCompleted | Line: 316 ]]
	p1.Maid:GiveTask(p1.CompletedSignal:Connect(function(...) --[[ Line: 317 | Upvalues: p2 (copy), p1 (copy) ]]
		p2(p1, ...)
	end))
end
function t.End(p1, p2, ...) --[[ End | Line: 323 | Upvalues: PromptLabel (copy), TimeLabel (copy), CancelButton (copy) ]]
	PromptLabel.Text = ""
	PromptLabel.Visible = if #PromptLabel.Text > 0 then true else false
	TimeLabel.Visible = false
	CancelButton.Visible = false
	if not p1.CompletedSignal then
		return
	end
	p1.CompletedSignal:Fire(...)
end
function t._yieldForMovement(p1, p2, p3) --[[ _yieldForMovement | Line: 336 | Upvalues: Fill (copy), TimeLabel (copy), RunService (copy) ]]
	local v1 = 0
	Fill.Size = UDim2.new(0, 0, 1, 0)
	TimeLabel.Visible = true
	local v2 = Vector2.new()
	p1.SequenceMaid:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 344 | Upvalues: p1 (copy), p3 (copy), v2 (ref), v1 (ref), Fill (ref), p2 (copy) ]]
		p1:_enableGamepadCursorIfNeeded()
		if not p3.IsMoving then
			return
		end
		local v12 = p3:_hasMoved(v2)
		v2 = p3.MousePosition or v2
		if v12 then
			v1 = v1 + p12
			Fill.Size = UDim2.new(math.min(v1 / p2, 1), 0, 1, 0)
		end
	end))
	while true do
		local v3
		RunService.Heartbeat:Wait()
		v3 = p1._canContinue and p1:_canContinue() and true or false
		if not v3 then
			return false
		end
		if p2 <= v1 then
			return p1._canContinue and p1:_canContinue() and true or false
		end
	end
end
function t._yieldForPosition(p1, p2, p3, p4) --[[ _yieldForPosition | Line: 369 | Upvalues: RunService (copy) ]]
	repeat
		local v1
		for k, v in pairs(type(p4) == "function" and p4() or p4) do
			if p2:IsNearPosition(p2:_getScreenPointFromWorldPoint(v), p3) then
				return p1._canContinue and p1:_canContinue() and true or false
			end
		end
		p1:_enableGamepadCursorIfNeeded()
		RunService.RenderStepped:Wait()
		v1 = p1._canContinue and p1:_canContinue() and true or false
	until not v1
	return p1._canContinue and p1:_canContinue() and true or false
end
function t._canContinue(p1) --[[ _canContinue | Line: 387 | Upvalues: v6 (ref) ]]
	return p1.Tick == v6
end
return {
	CreateSequence = function(p1, ...) --[[ CreateSequence | Line: 392 | Upvalues: t3 (copy), v7 (ref), t (copy), v5 (copy) ]]
		local v1 = t3[p1]
		if v1 then
			v7 = t.new(v1, ...)
			v5:GiveTask(v7)
			return v7
		end
	end,
	StopSequence = function() --[[ StopSequence | Line: 404 | Upvalues: v5 (copy), v6 (ref) ]]
		v5:DoCleaning()
		v6 = nil
	end
}