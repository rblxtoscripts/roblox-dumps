-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("FormatTime")
local v5 = Sonar("EventUtils")
local t2 = {}
function t.new(p1) --[[ new | Line: 133 | Upvalues: t (copy), v1 (copy), v3 (copy), v5 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.LastAnimated = tick()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 TimerDisplay, Instance is required for timer display")
		return v2
	end
	v2.TimerLabel = v3.FindElement(v2.Instance, "TimerLabel") or v2.Instance
	if v2.TimerLabel and not v2.TimerLabel:IsA("TextLabel") then
		v2.TimerLabel = v2.TimerLabel:FindFirstChildOfClass("TextLabel")
	end
	if v2.TimerLabel and v2.TimerLabel:IsA("TextLabel") then
		v2.OnTimeChanged = {}
		if v2.Config.OnTimeChanged then
			v2.OnTimeChanged = type(v2.Config.OnTimeChanged) == "function" and { v2.Config.OnTimeChanged } or v2.Config.OnTimeChanged
		end
		if v2.Config.WiggleEffect then
			v2.WiggleEffect = type(v2.Config.WiggleEffect) == "table" and v2.Config.WiggleEffect or {}
			v2.WiggleEffect.Instance = v3.FindElement(v2.Instance, "IconLabel")
			local v6 = v3.PlayEffect("Wiggle", v2.WiggleEffect)
			if v6 then
				v2.Maid:GiveTask(v6)
			end
		end
		if v2.Config.Value then
			local Config = v2.Config.Value
			if Config:IsA("IntValue") or Config:IsA("NumberValue") then
				v2.Value = Config
				v2.Maid:GiveTask(Config:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 179 | Upvalues: v2 (copy) ]]
					v2:Update()
				end))
			else
				warn("\226\154\160\239\184\143 TimerDisplay, Value must be an IntValue or NumberValue", v2.Instance)
			end
		end
		if v2.Config.Changed then
			v2.Changed = v5.getConnectionEvents(v2.Config.Changed)
			for v7, v8 in v2.Changed do
				v2.Maid:GiveTask(v8:Connect(function() --[[ Line: 189 | Upvalues: v2 (copy) ]]
					v2:Update()
				end))
			end
		end
		v2.Maid:GiveTask(task.defer(function() --[[ Line: 194 | Upvalues: v2 (copy) ]]
			v2:Update()
		end))
		t2[v2] = true
	else
		warn("\226\154\160\239\184\143 TimerDisplay, TimerLabel is required for timer display")
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 204 | Upvalues: t2 (copy), v2 (copy) ]]
	t2[p1] = nil
	v2(p1)
end
function t._runCallbacks(p1, p2) --[[ _runCallbacks | Line: 211 ]]
	local v2 = if p2 then p2 else {}
	for v3, v4 in p1.OnTimeChanged do
		v4(p1, v2)
	end
end
function t._getConfigValue(p1, p2) --[[ _getConfigValue | Line: 222 ]]
	if not p1.Config[p2] then
		return nil
	end
	if type(p1.Config[p2]) == "function" then
		return p1.Config[p2]()
	else
		return p1.Config[p2]
	end
end
function t._getEndTime(p1) --[[ _getEndTime | Line: 236 ]]
	p1.StartTime = p1:_getConfigValue("StartTime")
	local v1 = p1:_getConfigValue("EndTime")
	if v1 then
		return v1
	end
	if not p1.Config.Duration then
		warn("\226\154\160\239\184\143 TimerDisplay, EndTime was not found and no duration was provided", p1.Instance, p1.Config)
		return p1.StartTime or 0
	end
	if p1.StartTime then
		return p1.StartTime + p1.Config.Duration
	end
	warn("\226\154\160\239\184\143 TimerDisplay, EndTime was not found and no StartTime was provided for duration", p1.Instance, p1.Config)
	return p1.StartTime or os.time() + p1.Config.Duration
end
function t._formatTime(p1, p2) --[[ _formatTime | Line: 266 | Upvalues: v4 (copy) ]]
	local v1 = nil
	local Format = p1.Config.Format
	if type(Format) == "function" then
		v1 = Format(p2)
	elseif type(Format) == "string" then
		v1 = string.format(Format, p2)
	end
	if not v1 then
		v1 = v4.FormatString(p2)
	end
	return v1
end
function t._setTime(p1) --[[ _setTime | Line: 283 | Upvalues: v4 (copy) ]]
	if p1.Config.Get then
		local v1 = p1.Config.Get()
		if typeof(v1) ~= "number" then
			v1 = 0
		end
		p1.TimeLeft = math.max(v1, 0)
		p1.TimeElapsed = nil
		p1.EndTime = nil
		p1.StartTime = nil
		p1.UnixTime = v4.GetTime()
	else
		if p1.Value then
			p1.TimeLeft = math.max(p1.Value.Value, 0)
			p1.TimeElapsed = nil
			p1.EndTime = nil
			p1.StartTime = nil
			p1.UnixTime = v4.GetTime()
			return
		end
		p1.UnixTime = v4.GetTime()
		p1.EndTime = p1:_getEndTime()
		p1.TimeElapsed = p1.StartTime and p1.UnixTime - p1.StartTime
		p1.TimeLeft = math.max(p1.EndTime - p1.UnixTime, 0)
	end
end
function t._canUpdate(p1) --[[ _canUpdate | Line: 311 ]]
	p1:_setTime()
	return p1.TimeLeft ~= p1.LastTimeLeft
end
function t.Update(p1) --[[ Update | Line: 325 ]]
	if not p1:_canUpdate() then
		return
	end
	p1.LastTimeLeft = p1.TimeLeft
	p1.TimerLabel.Text = p1:_formatTime(p1.Config.Elapsed and p1.TimeElapsed or p1.TimeLeft)
	p1:_runCallbacks({
		TimeLeft = p1.TimeLeft,
		TimeElapsed = p1.TimeElapsed,
		EndTime = p1.EndTime,
		StartTime = p1.StartTime
	})
end
function t.AddOnTimeChangedCallback(p1, p2) --[[ AddOnTimeChangedCallback | Line: 343 ]]
	table.insert(p1.OnTimeChanged, p2)
end
function t.Init(p1) --[[ Init | Line: 350 | Upvalues: v4 (copy), t2 (copy) ]]
	v4.OnTimeChanged(function(p1) --[[ Line: 351 | Upvalues: t2 (ref) ]]
		for v1, v2 in t2 do
			if not v1.Value then
				v1:Update()
			end
		end
	end)
end
t:Init()
return t