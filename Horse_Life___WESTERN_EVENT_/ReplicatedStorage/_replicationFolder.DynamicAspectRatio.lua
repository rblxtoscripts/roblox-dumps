-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("Signal")
local v4 = Sonar("TableUtils")
local CurrentCamera = workspace.CurrentCamera
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy), v1 (copy), v3 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if type(p1.Thresholds) == "function" then
		v2.Thresholds = p1.Thresholds(v2) or {}
	else
		v2.Thresholds = p1.Thresholds or {}
	end
	if p1.AspectRatioThresholds or p1.SizeThresholds then
		v2.Thresholds = v2:_mergeLegacyThresholds(p1.AspectRatioThresholds, p1.SizeThresholds)
	end
	v2.AspectRatioChangedSignal = v2.Maid:GiveTask(v3.new())
	v2.ViewportSizeChangedSignal = v2.Maid:GiveTask(v3.new())
	v2.InstanceSizeChangedSignal = v2.Maid:GiveTask(v3.new())
	v2.ProcessedThresholds = {}
	for v5, v6 in v2.Thresholds do
		local t2 = {}
		for k, v in pairs(v6) do
			t2[k] = v
		end
		local v7 = if v5 == "Default" then true else v6.Default
		if v6.AspectRatio then
			t2.AspectRatio = v6.AspectRatio
		elseif v7 then
			t2.AspectRatio = 9000000000
		end
		if v6.Width then
			t2.Width = v6.Width
		elseif v7 then
			t2.Width = 9000000000
		end
		if v6.Height then
			t2.Height = v6.Height
		elseif v7 then
			t2.Height = 9000000000
		end
		if v6.AspectRatio then
			t2.AspectRatio = v6.AspectRatio
		elseif v7 then
			t2.AspectRatio = 9000000000
		end
		if v6.WidthRatio then
			t2.WidthRatio = v6.WidthRatio
		elseif v7 then
			t2.WidthRatio = 0
		end
		if v6.HeightRatio then
			t2.HeightRatio = v6.HeightRatio
		elseif v7 then
			t2.HeightRatio = 0
		end
		v2.ProcessedThresholds[v5] = t2
	end
	v2.ThresholdsInOrder = v4.ToListByIndex(v2.ProcessedThresholds)
	table.sort(v2.ThresholdsInOrder, function(p1, p2) --[[ Line: 99 | Upvalues: v2 (copy) ]]
		local v1 = v2.ProcessedThresholds[p1]
		local v22 = v2.ProcessedThresholds[p2]
		local v3 = v1.AspectRatio or 0
		local v4 = v22.AspectRatio or 0
		if v3 == v4 then
			local v5 = v1.Width or (v1.WidthRatio and -v1.WidthRatio or 0)
			local v6 = v22.Width or (v22.WidthRatio and -v22.WidthRatio or 0)
			if v5 == v6 then
				return (v1.Height or (if v1.HeightRatio then -v1.HeightRatio or 0 else 0)) < (v22.Height or (if v22.HeightRatio then -v22.HeightRatio or 0 else 0))
			else
				return v5 < v6
			end
		else
			return v3 < v4
		end
	end)
	v2.OnAspectRatioChanged = {}
	if v2.Config.OnAspectRatioChanged then
		v2.OnAspectRatioChanged = type(v2.Config.OnAspectRatioChanged) == "table" and v2.Config.OnAspectRatioChanged or { v2.Config.OnAspectRatioChanged }
	end
	v2.OnViewportSizeChanged = {}
	if v2.Config.OnViewportSizeChanged then
		v2.OnViewportSizeChanged = type(v2.Config.OnViewportSizeChanged) == "table" and v2.Config.OnViewportSizeChanged or { v2.Config.OnViewportSizeChanged }
	end
	v2.OnInstanceSizeChanged = {}
	if v2.Config.OnInstanceSizeChanged then
		v2.OnInstanceSizeChanged = type(v2.Config.OnInstanceSizeChanged) == "table" and v2.Config.OnInstanceSizeChanged or { v2.Config.OnInstanceSizeChanged }
	end
	v2:_startMonitoring()
	v2:_updateThresholds(true)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 144 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._mergeLegacyThresholds(p1, p2, p3) --[[ _mergeLegacyThresholds | Line: 149 ]]
	local t = {}
	if p2 then
		for v1, v2 in p2 do
			t[v1] = t[v1] or {}
			t[v1].AspectRatio = v2.Ratio
			for k, v in pairs(v2) do
				if k ~= "Ratio" then
					t[v1][k] = v
				end
			end
		end
	end
	if p3 then
		for v4, v5 in p3 do
			t[v4] = t[v4] or {}
			t[v4].Width = v5.Width
			t[v4].Height = v5.Height
			for k, v in pairs(v5) do
				if k ~= "Width" and k ~= "Height" then
					t[v4][k] = v
				end
			end
		end
	end
	return t
end
function t._startMonitoring(p1) --[[ _startMonitoring | Line: 182 | Upvalues: CurrentCamera (copy) ]]
	p1.Maid:GiveTask(CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 184 | Upvalues: p1 (copy) ]]
		p1:_updateThresholds()
	end))
	if not p1.Instance then
		return
	end
	p1.Maid:GiveTask(p1.Instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 190 | Upvalues: p1 (copy) ]]
		p1:_updateThresholds()
	end))
end
function t._getCurrentSizeInfo(p1) --[[ _getCurrentSizeInfo | Line: 196 | Upvalues: CurrentCamera (copy) ]]
	local ViewportSize = CurrentCamera.ViewportSize
	local t = {
		ViewportSize = ViewportSize,
		AspectRatio = ViewportSize.X / ViewportSize.Y
	}
	if p1.Instance then
		local AbsoluteSize = p1.Instance.AbsoluteSize
		t.InstanceSize = AbsoluteSize
		t.InstancePosition = p1.Instance.AbsolutePosition
		t.InstanceAspectRatio = AbsoluteSize.X / AbsoluteSize.Y
		t.WidthRatio = AbsoluteSize.X / ViewportSize.X
		t.HeightRatio = AbsoluteSize.Y / ViewportSize.Y
	end
	return t
end
function t._getThresholdForCurrentSize(p1, p2) --[[ _getThresholdForCurrentSize | Line: 222 ]]
	for v2, v3 in p1.ThresholdsInOrder do
		local v4 = p1.ProcessedThresholds[v3]
		local v5 = if v4.AspectRatio and p2.AspectRatio < v4.AspectRatio then true else false
		if v4.Width and p2.ViewportSize.X < v4.Width then
			v5 = true
		end
		if v4.Height and p2.ViewportSize.Y < v4.Height then
			v5 = true
		end
		if v4.WidthRatio and (p2.WidthRatio and p2.WidthRatio >= v4.WidthRatio) then
			v5 = true
		end
		if v4.HeightRatio and (p2.HeightRatio and p2.HeightRatio >= v4.HeightRatio) then
			v5 = true
		end
		if v5 then
			return v4
		end
	end
	return p1.ProcessedThresholds.Default or p1.ProcessedThresholds[p1.ThresholdsInOrder[#p1.ThresholdsInOrder]]
end
function t._updateThresholds(p1, p2) --[[ _updateThresholds | Line: 264 ]]
	local v1 = p1:_getCurrentSizeInfo()
	if p1.Instance and p1.Config.Debug then
		print(string.format("\240\159\147\157 AspectRatioListener [%s] - Width Ratio: %.3f, Height Ratio: %.3f", p1.Instance.Name, v1.WidthRatio or 0, v1.HeightRatio or 0))
	end
	local v2
	if p2 then
		v2 = p2
	else
		v2 = not p1.CurrentSizeInfo
		if not v2 and (p1.CurrentSizeInfo.AspectRatio == v1.AspectRatio and p1.CurrentSizeInfo.ViewportSize == v1.ViewportSize) then
			v2 = p1.Instance
			if v2 then
				v2 = not p1.CurrentSizeInfo.WidthRatio
				if not v2 then
					v2 = if p1.CurrentSizeInfo.WidthRatio == v1.WidthRatio and p1.CurrentSizeInfo.HeightRatio == v1.HeightRatio then if math.abs((p1.CurrentSizeInfo.InstanceAspectRatio or 0) - (v1.InstanceAspectRatio or 0)) > 0.01 then true else false else true
				end
			end
		elseif not v2 then
			v2 = true
		end
	end
	if not v2 then
		return
	end
	local CurrentSizeInfo = p1.CurrentSizeInfo
	if p2 and not CurrentSizeInfo then
		CurrentSizeInfo = v1
	end
	p1.CurrentSizeInfo = v1
	local v4 = p1:_getThresholdForCurrentSize(v1)
	local CurrentThreshold = p1.CurrentThreshold
	if p2 and not CurrentThreshold then
		CurrentThreshold = v4
	end
	p1.CurrentThreshold = v4
	local t = {
		SizeInfo = v1,
		OldSizeInfo = CurrentSizeInfo,
		Threshold = v4,
		OldThreshold = CurrentThreshold,
		FromInit = p2,
		AspectRatio = v1.AspectRatio
	}
	t.OldAspectRatio = if CurrentSizeInfo then CurrentSizeInfo.AspectRatio else CurrentSizeInfo
	t.ViewportSize = v1.ViewportSize
	t.OldViewportSize = if CurrentSizeInfo then CurrentSizeInfo.ViewportSize else CurrentSizeInfo
	t.AspectRatioThreshold = v4
	p1.ViewportSizeChangedSignal:Fire(t)
	if p1.Instance then
		p1.InstanceSizeChangedSignal:Fire(t)
	end
	if p2 or CurrentThreshold ~= v4 then
		p1:_runCallbacks("OnViewportSizeChanged", t)
		if p1.Instance then
			p1:_runCallbacks("OnInstanceSizeChanged", t)
		end
	end
	if not p2 and (CurrentSizeInfo and not (math.abs((CurrentSizeInfo.AspectRatio or 0) - v1.AspectRatio) > 0.01)) then
		return
	end
	p1.AspectRatioChangedSignal:Fire(t)
	p1:_runCallbacks("OnAspectRatioChanged", t)
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 345 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t.Init(p1) --[[ Init | Line: 357 ]] end
function t.GetViewportSize(p1) --[[ GetViewportSize | Line: 362 ]]
	return workspace.CurrentCamera.ViewportSize
end
function t.GetInstanceSize(p1) --[[ GetInstanceSize | Line: 367 ]]
	if p1.Instance then
		return p1.Instance.AbsoluteSize
	else
		return Vector2.new(0, 0)
	end
end
return t