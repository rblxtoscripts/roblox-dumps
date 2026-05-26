-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("spr")
local v4 = Sonar("FormatTime")
local v5 = Sonar("EventUtils")
local v6 = Sonar("GuiFrameworkService")
local t2 = {}
local function parseFormat(p1) --[[ parseFormat | Line: 157 ]]
	local sum = 1
	local t = {}
	while sum <= #p1 do
		local v1 = p1:sub(sum, sum)
		if v1:match("[HMS]") then
			local count = 1
			while sum + count <= #p1 and p1:sub(sum + count, sum + count) == v1 do
				count = count + 1
			end
			table.insert(t, {
				type = v1,
				count = count
			})
			sum = sum + count
		else
			if v1:match("[^HMS]") then
				table.insert(t, {
					type = "separator",
					char = v1
				})
				sum = sum + 1
				continue
			end
			sum = sum + 1
		end
	end
	return t
end
local function secondsToTime(p1) --[[ secondsToTime | Line: 194 ]]
	return {
		hours = math.floor(p1 / 3600),
		minutes = math.floor(p1 % 3600 / 60),
		seconds = math.floor(p1 % 60)
	}
end
local function padNumber(p1, p2) --[[ padNumber | Line: 210 ]]
	local v1 = tostring(p1)
	while #v1 < p2 do
		v1 = "0" .. v1
	end
	return v1
end
function t.new(p1) --[[ new | Line: 221 | Upvalues: t (copy), v1 (copy), parseFormat (copy), v5 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 SlidingTimerDisplay, Instance is required for timer display")
		return v2
	end
	v2.DampingRatio = p1.DampingRatio or 0.8
	v2.Frequency = p1.Frequency or 3
	v2.DigitSpacing = p1.DigitSpacing or 40
	v2.SeparatorChar = p1.SeparatorChar or ":"
	v2.Format = p1.Format or "HH:MM:SS"
	v2.ShowLeadingZeros = p1.ShowLeadingZeros ~= false
	v2.SlideDirection = p1.SlideDirection or "up"
	v2.FormatComponents = parseFormat(v2.Format)
	v2:_setupDigitLabels()
	v2.OnTimeChanged = {}
	if v2.Config.OnTimeChanged then
		v2.OnTimeChanged = type(v2.Config.OnTimeChanged) == "function" and { v2.Config.OnTimeChanged } or v2.Config.OnTimeChanged
	end
	if v2.Config.Get then
		if type(v2.Config.Get) == "function" then
			v2.Get = v2.Config.Get
		else
			warn("\226\154\160\239\184\143 SlidingTimerDisplay, Get must be a function", v2.Instance)
		end
	end
	if v2.Config.Value then
		local Config = v2.Config.Value
		if Config:IsA("IntValue") or Config:IsA("NumberValue") then
			v2.Value = Config
			v2.Maid:GiveTask(Config:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 272 | Upvalues: v2 (copy) ]]
				v2:Update()
			end))
		else
			warn("\226\154\160\239\184\143 SlidingTimerDisplay, Value must be an IntValue or NumberValue", v2.Instance)
		end
	end
	if v2.Config.Changed then
		v2.Changed = v5.getConnectionEvents(v2.Config.Changed)
		for v4, v52 in v2.Changed do
			v2.Maid:GiveTask(v52:Connect(function() --[[ Line: 282 | Upvalues: v2 (copy) ]]
				v2:Update()
			end))
		end
	end
	v2.Maid:GiveTask(task.defer(function() --[[ Line: 289 | Upvalues: v2 (copy) ]]
		v2:Update()
	end))
	t2[v2] = true
	return v2
end
function t._setupDigitLabels(p1) --[[ _setupDigitLabels | Line: 300 | Upvalues: v6 (copy) ]]
	p1.DigitContainers = {}
	p1.TemplateLabels = {}
	p1.ActiveLabels = {}
	p1.SeparatorLabels = {}
	local v1 = v6.FindElement(p1.Instance, "DefaultTemplate")
	local v2
	if v1 then
		local TextLabel = v1:FindFirstChildOfClass("TextLabel")
		v1.Visible = false
		v2 = TextLabel
	else
		v2 = nil
	end
	if not (v1 and v2) then
		warn("\226\154\160\239\184\143 SlidingTimerDisplay, No DefaultTemplate found in Instance")
		return
	end
	local sum = 0
	local t = {}
	for i, v in ipairs(p1.FormatComponents) do
		if v.type == "separator" then
			table.insert(t, {
				position = sum,
				char = v.char
			})
			continue
		end
		sum = sum + v.count
	end
	local count = 1
	local count_2 = 0
	local count_3 = 1
	for i, v in ipairs(p1.FormatComponents) do
		if v.type == "separator" then
			local v3 = v6.FindElement(p1.Instance, "Separator")
			if v3 then
				v3.Visible = false
			else
				v3 = v1
			end
			local v4 = v6.CloneTemplate(v3)
			v4.Name = tostring(count)
			v4.LayoutOrder = count_2
			v4.Visible = true
			v4.Parent = p1.Instance
			count = count + 1
			count_2 = count_2 + 1
			for i2, v5 in ipairs(v4:GetChildren()) do
				if v5:IsA("TextLabel") and (v5.Name == "ActiveDigit" or v5.Name == "OldDigit") then
					v5:Destroy()
				end
			end
			local TextLabel = v4:FindFirstChildOfClass("TextLabel")
			if TextLabel then
				TextLabel.Text = v.char
				TextLabel.Visible = true
				TextLabel.Name = "TextLabel"
			end
			table.insert(p1.SeparatorLabels, v4)
			continue
		end
		for i2 = 1, v.count do
			local v5 = v6.CloneTemplate(v1)
			v5.Name = tostring(count)
			v5.LayoutOrder = count_2
			v5.Visible = true
			v5.Parent = p1.Instance
			count = count + 1
			count_2 = count_2 + 1
			for i3, v3 in ipairs(v5:GetChildren()) do
				if v3:IsA("TextLabel") and (v3.Name == "ActiveDigit" or v3.Name == "OldDigit") then
					v3:Destroy()
				end
			end
			local TextLabel = v5:FindFirstChildOfClass("TextLabel")
			p1.DigitContainers[count_3] = v5
			p1.TemplateLabels[count_3] = TextLabel
			local ActiveDigit = TextLabel:Clone()
			ActiveDigit.Name = "ActiveDigit"
			ActiveDigit.Parent = v5
			if not ActiveDigit:FindFirstChildOfClass("UIStroke") then
				local UIStroke = TextLabel:FindFirstChildOfClass("UIStroke")
				if UIStroke then
					UIStroke:Clone().Parent = ActiveDigit
				end
			end
			p1.ActiveLabels[count_3] = ActiveDigit
			TextLabel.Visible = false
			count_3 = count_3 + 1
		end
	end
	if #p1.DigitContainers == 0 then
		warn("\226\154\160\239\184\143 SlidingTimerDisplay, No digit containers were created")
	end
	p1.CurrentDigitValues = {}
	for j = 1, #p1.ActiveLabels do
		p1.CurrentDigitValues[j] = 0
	end
end
function t._getEndTime(p1) --[[ _getEndTime | Line: 439 ]]
	p1.StartTime = p1:_getConfigValue("StartTime")
	local v1 = p1:_getConfigValue("EndTime")
	if v1 then
		return v1
	end
	if not p1.Config.Duration then
		warn("\226\154\160\239\184\143 SlidingTimerDisplay, EndTime was not found and no duration was provided", p1.Instance)
		return 0
	end
	if p1.StartTime then
		return p1.StartTime + p1.Config.Duration
	else
		warn("\226\154\160\239\184\143 SlidingTimerDisplay, EndTime was not found and no StartTime was provided for duration", p1.Instance)
		return os.time() + p1.Config.Duration
	end
end
function t._getConfigValue(p1, p2) --[[ _getConfigValue | Line: 463 ]]
	if not p1.Config[p2] then
		return nil
	end
	if type(p1.Config[p2]) == "function" then
		return p1.Config[p2]()
	else
		return p1.Config[p2]
	end
end
function t._setTime(p1) --[[ _setTime | Line: 476 | Upvalues: v4 (copy) ]]
	if p1.Get then
		p1.TimeLeft = math.max(p1.Get() or 0, 0)
		p1.UnixTime = v4.GetTime()
		return
	end
	if p1.Value then
		p1.TimeLeft = math.max(p1.Value.Value, 0)
		p1.UnixTime = v4.GetTime()
	else
		p1.UnixTime = v4.GetTime()
		p1.EndTime = p1:_getEndTime()
		p1.TimeLeft = math.max(p1.EndTime - p1.UnixTime, 0)
	end
end
function t._getDigitValues(p1) --[[ _getDigitValues | Line: 493 ]]
	local TimeLeft = p1.TimeLeft
	local t = {
		hours = math.floor(TimeLeft / 3600),
		minutes = math.floor(TimeLeft % 3600 / 60),
		seconds = math.floor(TimeLeft % 60)
	}
	local t2 = {}
	for i, v in ipairs(p1.FormatComponents) do
		if v.type == "H" then
			local v1 = tostring(t.hours)
			while #v1 < v.count do
				v1 = "0" .. v1
			end
			local v2 = v1
			for i2 = 1, #v1 do
				table.insert(t2, (tonumber(v2:sub(i2, i2))))
			end
			continue
		end
		if v.type == "M" then
			local v4 = tostring(t.minutes)
			while #v4 < v.count do
				v4 = "0" .. v4
			end
			local v5 = v4
			for j = 1, #v4 do
				table.insert(t2, (tonumber(v5:sub(j, j))))
			end
			continue
		end
		if v.type == "S" then
			local v7 = tostring(t.seconds)
			while #v7 < v.count do
				v7 = "0" .. v7
			end
			local v8 = v7
			for k = 1, #v7 do
				table.insert(t2, (tonumber(v8:sub(k, k))))
			end
		end
	end
	return t2
end
function t._animateDigit(p1, p2, p3) --[[ _animateDigit | Line: 526 | Upvalues: v3 (copy) ]]
	local v1 = p1.DigitContainers[p2]
	local v2 = p1.ActiveLabels[p2]
	if not (v1 and v2) then
		return
	end
	local v32 = p1.CurrentDigitValues[p2] or 0
	if p3 == v32 then
		return
	end
	local OldDigit = v2:Clone()
	OldDigit.Text = tostring(v32)
	OldDigit.Name = "OldDigit"
	OldDigit.Position = UDim2.new(0.5, 0, 0.5, 0)
	OldDigit.AnchorPoint = Vector2.new(0.5, 0.5)
	OldDigit.Parent = v1
	v2.Text = tostring(p3)
	v2.TextTransparency = 0
	local UIStroke = v2:FindFirstChildOfClass("UIStroke")
	if UIStroke then
		UIStroke.Transparency = 0
	end
	local v4 = if p1.SlideDirection == "down" then -1 else 1
	v2.Position = UDim2.new(0.5, 0, 0.5, p1.DigitSpacing * v4)
	v2.AnchorPoint = Vector2.new(0.5, 0.5)
	v3.target(v2, p1.DampingRatio, p1.Frequency, {
		Position = UDim2.new(0.5, 0, 0.5, 0)
	})
	local UIStroke_2 = OldDigit:FindFirstChildOfClass("UIStroke")
	v3.target(OldDigit, p1.DampingRatio, p1.Frequency, {
		TextTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, -p1.DigitSpacing * v4)
	})
	if UIStroke_2 then
		v3.target(UIStroke_2, 1, p1.Frequency, {
			Transparency = 1
		})
	end
	v3.completed(OldDigit, function() --[[ Line: 588 | Upvalues: OldDigit (copy) ]]
		OldDigit:Destroy()
	end)
	p1.CurrentDigitValues[p2] = p3
end
function t.Update(p1) --[[ Update | Line: 596 ]]
	p1:_setTime()
	for i, v in ipairs((p1:_getDigitValues())) do
		if v ~= p1.CurrentDigitValues[i] then
			p1:_animateDigit(i, v)
		end
	end
	p1:_runCallbacks({
		TimeLeft = p1.TimeLeft,
		FormattedTime = p1:_formatTime()
	})
end
function t._formatTime(p1) --[[ _formatTime | Line: 618 ]]
	local TimeLeft = p1.TimeLeft
	local t = {
		hours = math.floor(TimeLeft / 3600),
		minutes = math.floor(TimeLeft % 3600 / 60),
		seconds = math.floor(TimeLeft % 60)
	}
	local v1 = ""
	for i, v in ipairs(p1.FormatComponents) do
		if v.type == "H" then
			local v2 = tostring(t.hours)
			while #v2 < v.count do
				v2 = "0" .. v2
			end
			v1 = v1 .. v2
			continue
		end
		if v.type == "M" then
			local v4 = tostring(t.minutes)
			while #v4 < v.count do
				v4 = "0" .. v4
			end
			v1 = v1 .. v4
			continue
		end
		if v.type == "S" then
			local v6 = tostring(t.seconds)
			while #v6 < v.count do
				v6 = "0" .. v6
			end
			v1 = v1 .. v6
			continue
		end
		if v.type == "separator" then
			v1 = v1 .. v.char
		end
	end
	return v1
end
function t._runCallbacks(p1, p2) --[[ _runCallbacks | Line: 639 ]]
	local v2 = if p2 then p2 else {}
	for v3, v4 in p1.OnTimeChanged do
		v4(p1, v2)
	end
end
function t.AddOnTimeChangedCallback(p1, p2) --[[ AddOnTimeChangedCallback | Line: 649 ]]
	table.insert(p1.OnTimeChanged, p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 654 | Upvalues: v3 (copy), t2 (copy), v2 (copy) ]]
	if p1.ActiveLabels then
		for i, v in ipairs(p1.ActiveLabels) do
			if v and v.Parent then
				v3.stop(v)
			end
		end
	end
	if p1.DigitContainers then
		for i, v in ipairs(p1.DigitContainers) do
			if v then
				for i2, v4 in ipairs(v:GetChildren()) do
					if v4:IsA("TextLabel") and v4.Name == "OldDigit" then
						v3.stop(v4)
						v4:Destroy()
					end
				end
				v:Destroy()
			end
		end
	end
	if p1.SeparatorLabels then
		for i, v in ipairs(p1.SeparatorLabels) do
			if v then
				v:Destroy()
			end
		end
	end
	p1.ActiveLabels = nil
	p1.DigitContainers = nil
	p1.TemplateLabels = nil
	p1.SeparatorLabels = nil
	t2[p1] = nil
	v2(p1)
end
function t.Init(p1) --[[ Init | Line: 701 | Upvalues: v4 (copy), t2 (copy) ]]
	v4.OnTimeChanged(function(p1) --[[ Line: 702 | Upvalues: t2 (ref) ]]
		for v1, v2 in t2 do
			if not (v1.Value or v1.Get) then
				v1:Update()
			end
		end
	end)
end
t:Init()
return t