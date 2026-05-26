-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Maid")
function t.new(p1) --[[ new | Line: 70 | Upvalues: v1 (copy), t (ref) ]]
	task.wait(0.5)
	local v12 = p1.FixedItemHeight and (if p1.FixedItemHeight > 0 then true else false)
	local GetItemHeight = p1.GetItemHeight
	if GetItemHeight then
		GetItemHeight = if type(p1.GetItemHeight) == "function" then true else false
	end
	if not (v12 or GetItemHeight) then
		error("VirtualizedList: Must provide either FixedItemHeight or GetItemHeight function")
	end
	if v12 and GetItemHeight then
		warn("VirtualizedList: Both FixedItemHeight and GetItemHeight provided, using FixedItemHeight")
		p1.GetItemHeight = nil
	end
	local t2 = {
		Maid = v1.new(),
		ScrollingFrame = p1.ScrollingFrame,
		TemplateFrame = p1.TemplateFrame,
		UpdateContent = p1.UpdateContent,
		FixedItemHeight = p1.FixedItemHeight,
		GetItemHeight = p1.GetItemHeight,
		ItemsPerRow = p1.ItemsPerRow or 1
	}
	t2.ItemWidth = p1.ItemWidth or p1.ScrollingFrame.AbsoluteSize.X / (p1.ItemsPerRow or 1)
	t2.GetItemWidth = p1.GetItemWidth
	t2.ItemSpacing = p1.ItemSpacing or 0
	t2.GetItemSpacing = p1.GetItemSpacing
	t2.BufferItems = p1.BufferItems or 2
	t2.UpdateThrottle = p1.UpdateThrottle or 1 / 60
	t2.InitialPoolSize = p1.InitialPoolSize or 8
	t2.OnItemVisible = p1.OnItemVisible
	t2.OnItemHidden = p1.OnItemHidden
	t2.OnScrollChanged = p1.OnScrollChanged
	t2.Data = {}
	t2.FramePool = {}
	t2.ActiveFrames = {}
	t2.LastUpdateTime = 0
	t2.UpdateScheduled = false
	t2.LastScrollY = nil
	t2.LastDataCount = nil
	t2.LastViewportSize = Vector2.new(0, 0)
	t2.HeightCache = {}
	t2.CachedTotalHeight = nil
	t2.HeightCacheDirty = false
	local v4 = setmetatable(t2, t)
	v4:_initializeFramePool()
	v4.Maid:GiveTask(v4.ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 131 | Upvalues: v4 (copy) ]]
		v4.Maid._canvasPosition = task.defer(function() --[[ Line: 132 | Upvalues: v4 (ref) ]]
			v4:_scheduleVirtualizationUpdate()
			if not v4.OnScrollChanged then
				return
			end
			v4.OnScrollChanged(v4.ScrollingFrame.CanvasPosition)
		end)
	end))
	local v5 = true
	v4.Maid:GiveTask(v4.ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ Line: 142 | Upvalues: v5 (ref), v4 (copy) ]]
		if v5 then
			v5 = false
			return
		end
		v4.Maid._absoluteWindowSize = task.defer(function() --[[ Line: 144 | Upvalues: v4 (ref) ]]
			v4:_onViewportChanged()
		end)
		v5 = false
	end))
	return v4
end
function t.SetData(p1, p2) --[[ SetData | Line: 167 ]]
	local Data = p1.Data
	p1.Data = p2
	p1.HeightCache = {}
	p1.CachedTotalHeight = nil
	p1.HeightCacheDirty = true
	for v1, v2 in p1.ActiveFrames do
		local v3 = tonumber(v1)
		if p1.OnItemHidden and (v3 and Data[v3]) then
			pcall(p1.OnItemHidden, v2, Data[v3], v3)
		end
		p1:_returnFrameToPool(v2)
		p1.ActiveFrames[v1] = nil
	end
	p1:_updateCanvasSize()
	p1.LastScrollY = nil
	p1.LastDataCount = nil
	p1:_updateVisibleFrames()
end
function t.GetData(p1) --[[ GetData | Line: 201 ]]
	return p1.Data
end
function t.Refresh(p1) --[[ Refresh | Line: 211 ]]
	p1.HeightCache = {}
	p1.CachedTotalHeight = nil
	p1.HeightCacheDirty = true
	for v1, v2 in p1.ActiveFrames do
		local v3 = tonumber(v1)
		if p1.OnItemHidden and (v3 and p1.Data[v3]) then
			pcall(p1.OnItemHidden, v2, p1.Data[v3], v3)
		end
		p1:_returnFrameToPool(v2)
		p1.ActiveFrames[v1] = nil
	end
	p1.LastScrollY = nil
	p1.LastDataCount = nil
	p1:_updateVisibleFrames()
end
function t.ScrollToIndex(p1, p2, p3) --[[ ScrollToIndex | Line: 243 | Upvalues: TweenService (copy) ]]
	if p2 < 1 or #p1.Data < p2 then
		warn("VirtualizedList: ScrollToIndex index out of range")
		return
	end
	local v2 = Vector2.new(0, (p1:_calculateItemPosition(p2)))
	if p3 then
		local v3 = TweenService:Create(p1.ScrollingFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			CanvasPosition = v2
		})
		v3:Play()
		p1.Maid:GiveTask(v3)
	else
		p1.ScrollingFrame.CanvasPosition = v2
	end
end
function t.ScrollToTop(p1, p2) --[[ ScrollToTop | Line: 266 ]]
	p1:ScrollToIndex(1, p2)
end
function t.ScrollToBottom(p1, p2) --[[ ScrollToBottom | Line: 271 ]]
	if not (#p1.Data > 0) then
		return
	end
	p1:ScrollToIndex(#p1.Data, p2)
end
function t.IsVisible(p1, p2) --[[ IsVisible | Line: 278 ]]
	return p1.ActiveFrames[tostring(p2)] ~= nil
end
function t.GetVisibleRange(p1) --[[ GetVisibleRange | Line: 284 ]]
	return p1:_calculateVisibleRange(p1.ScrollingFrame.CanvasPosition.Y, p1.ScrollingFrame.AbsoluteWindowSize.Y)
end
function t.Destroy(p1) --[[ Destroy | Line: 303 ]]
	for v1, v2 in p1.ActiveFrames do
		local v3 = tonumber(v1)
		if p1.OnItemHidden and (v3 and p1.Data[v3]) then
			pcall(p1.OnItemHidden, v2, p1.Data[v3], v3)
		end
		p1:_returnFrameToPool(v2)
	end
	for v4, v5 in p1.FramePool do
		v5:Destroy()
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._initializeFramePool(p1) --[[ _initializeFramePool | Line: 325 ]]
	for i = 1, p1.InitialPoolSize do
		local v1 = p1.TemplateFrame:Clone()
		v1.Visible = false
		v1:SetAttribute("VirtualizedListIndex", nil)
		table.insert(p1.FramePool, v1)
	end
end
function t._getFrameFromPool(p1) --[[ _getFrameFromPool | Line: 337 ]]
	if #p1.FramePool > 0 then
		return table.remove(p1.FramePool)
	else
		local v1 = p1.TemplateFrame:Clone()
		v1.Visible = false
		v1:SetAttribute("VirtualizedListIndex", nil)
		return v1
	end
end
function t._returnFrameToPool(p1, p2) --[[ _returnFrameToPool | Line: 351 ]]
	if p2 == nil then
		return
	end
	p2.Visible = false
	p2.Parent = nil
	p2:SetAttribute("VirtualizedListIndex", nil)
	for v1, v2 in p1.FramePool do
		if v2 == p2 then
			return
		end
	end
	table.insert(p1.FramePool, p2)
end
function t._updateCanvasSize(p1) --[[ _updateCanvasSize | Line: 372 ]]
	if #p1.Data == 0 then
		p1.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	else
		p1.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, (p1:_calculateTotalHeight()))
	end
end
function t._calculateFramePosition(p1, p2) --[[ _calculateFramePosition | Line: 386 ]]
	if p1.ItemsPerRow == 1 then
		return UDim2.new(0.5, 0, 0, (p1:_calculateItemPosition(p2)))
	end
	local v3 = math.floor((p2 - 1) / p1.ItemsPerRow)
	local v5 = p1.FixedItemHeight or p1:_getItemHeight(p2)
	local v6 = p1:_getItemWidth(p2)
	local v7 = p1:_getItemSpacing(p2)
	return UDim2.new(0, (p2 - 1) % p1.ItemsPerRow * (v6 + v7), 0, v3 * (v5 + v7))
end
function t._calculateVisibleRange(p1, p2, p3) --[[ _calculateVisibleRange | Line: 407 ]]
	if p3 <= 0 then
		return 1, 0
	end
	if not p1.FixedItemHeight then
		return p1:_calculateVariableVisibleRange(p2, p3)
	end
	if p1.ItemsPerRow == 1 then
		local v1 = p1.FixedItemHeight + p1.ItemSpacing
		local v2 = math.floor(p2 / v1) + 1
		local v3 = math.ceil((p2 + p3) / v1)
		return math.max(1, v2 - p1.BufferItems), math.min(#p1.Data, v3 + p1.BufferItems)
	else
		local v8 = p1.FixedItemHeight + p1.ItemSpacing
		local v9 = math.floor(p2 / v8)
		local v10 = math.ceil((p2 + p3) / v8)
		return math.max(0, v9 - p1.BufferItems) * p1.ItemsPerRow + 1, math.min(#p1.Data, (v10 + p1.BufferItems + 1) * p1.ItemsPerRow)
	end
end
function t._updateVisibleFrames(p1) --[[ _updateVisibleFrames | Line: 446 ]]
	if #p1.Data == 0 then
		for v1, v2 in p1.ActiveFrames do
			p1:_returnFrameToPool(v2)
			p1.ActiveFrames[v1] = nil
		end
	else
		local Y = p1.ScrollingFrame.CanvasPosition.Y
		local Y_2 = p1.ScrollingFrame.AbsoluteWindowSize.Y
		if p1.FixedItemHeight and p1.LastScrollY and (math.abs(Y - p1.LastScrollY) < (p1.FixedItemHeight + p1.ItemSpacing) / 4 and (next(p1.ActiveFrames) and #p1.Data == p1.LastDataCount)) then
			return
		end
		p1.LastScrollY = Y
		p1.LastDataCount = #p1.Data
		if Y_2 <= 0 then
			return
		end
		local v4, v5 = p1:_calculateVisibleRange(Y, Y_2)
		if v5 < v4 then
			return
		end
		for v6, v7 in p1.ActiveFrames do
			local v8 = tonumber(v6)
			if not v8 or (v8 < v4 or v5 < v8) then
				if p1.OnItemHidden and (v8 and (p1.Data[v8] and not pcall(p1.OnItemHidden, v7, p1.Data[v8], v8))) then
					warn("VirtualizedList: Error in OnItemHidden callback")
				end
				p1:_returnFrameToPool(v7)
				p1.ActiveFrames[v6] = nil
			end
		end
		for i = v4, v5 do
			local v9 = tostring(i)
			if not p1.ActiveFrames[v9] and p1.Data[i] then
				local v10 = p1:_getFrameFromPool()
				if v10 then
					local v11, v12 = pcall(function() --[[ Line: 517 | Upvalues: p1 (copy), v10 (copy), i (copy) ]]
						return p1.UpdateContent(v10, p1.Data[i], i)
					end)
					local v13, v14, v15, v16
					if v11 and (typeof(v12) == "table" and getmetatable(v12) == "Maid") then
						p1.Maid[p1] = v12
						v10.Position = p1:_calculateFramePosition(i)
						v13 = p1.FixedItemHeight or p1:_getItemHeight(i)
						if p1.ItemsPerRow == 1 then
							v10.AnchorPoint = Vector2.new(0.5, 0)
							v10.Size = UDim2.new(1, 0, 0, v13)
						else
							v14 = p1:_getItemWidth(i)
							v10.AnchorPoint = Vector2.new(0, 0)
							v10.Size = UDim2.new(0, v14, 0, v13)
						end
						v10.Visible = true
						v10.Parent = p1.ScrollingFrame
						v10:SetAttribute("VirtualizedListIndex", i)
						p1.ActiveFrames[v9] = v10
						if p1.OnItemVisible then
							v15, v16 = pcall(function() --[[ Line: 558 | Upvalues: p1 (copy), v10 (copy), i (copy) ]]
								p1.OnItemVisible(v10, p1.Data[i], i)
							end)
							if not v15 then
								warn("VirtualizedList: Error in OnItemVisible callback:", v16)
							end
						end
					else
						if v11 then
							v10.Position = p1:_calculateFramePosition(i)
							v13 = p1.FixedItemHeight or p1:_getItemHeight(i)
							if p1.ItemsPerRow == 1 then
								v10.AnchorPoint = Vector2.new(0.5, 0)
								v10.Size = UDim2.new(1, 0, 0, v13)
							else
								v14 = p1:_getItemWidth(i)
								v10.AnchorPoint = Vector2.new(0, 0)
								v10.Size = UDim2.new(0, v14, 0, v13)
							end
							v10.Visible = true
							v10.Parent = p1.ScrollingFrame
							v10:SetAttribute("VirtualizedListIndex", i)
							p1.ActiveFrames[v9] = v10
							if p1.OnItemVisible then
								v15, v16 = pcall(function() --[[ Line: 558 | Upvalues: p1 (copy), v10 (copy), i (copy) ]]
									p1.OnItemVisible(v10, p1.Data[i], i)
								end)
								if not v15 then
									warn("VirtualizedList: Error in OnItemVisible callback:", v16)
								end
							end
							continue
						end
						warn("VirtualizedList: Error updating frame content:", v12)
						p1:_returnFrameToPool(v10)
					end
					continue
				end
				warn("VirtualizedList: Failed to get frame from pool for index", i)
			end
		end
	end
end
function t._scheduleVirtualizationUpdate(p1) --[[ _scheduleVirtualizationUpdate | Line: 572 ]]
	if p1.UpdateScheduled then
		return
	end
	local v1 = tick()
	local v2 = v1 - p1.LastUpdateTime
	if not (p1.UpdateThrottle <= v2) then
		p1.UpdateScheduled = true
		p1.Maid:GiveTask(task.delay(p1.UpdateThrottle - v2, function() --[[ Line: 598 | Upvalues: p1 (copy) ]]
			if not p1.UpdateScheduled then
				return
			end
			local v1, v2 = pcall(function() --[[ Line: 600 | Upvalues: p1 (ref) ]]
				p1:_updateVisibleFrames()
			end)
			if not v1 then
				warn("VirtualizedList: Error during scheduled virtualization update:", v2)
			end
			p1.LastUpdateTime = tick()
			p1.UpdateScheduled = false
		end))
		return
	end
	local v4, v5 = pcall(function() --[[ Line: 582 | Upvalues: p1 (copy) ]]
		p1:_updateVisibleFrames()
	end)
	if not v4 then
		warn("VirtualizedList: Error during virtualization update:", v5)
	end
	p1.LastUpdateTime = v1
end
function t._onViewportChanged(p1) --[[ _onViewportChanged | Line: 618 ]]
	local AbsoluteWindowSize = p1.ScrollingFrame.AbsoluteWindowSize
	if AbsoluteWindowSize == p1.LastViewportSize then
		return
	end
	p1.LastViewportSize = AbsoluteWindowSize
	if p1.GetItemHeight then
		p1.HeightCache = {}
		p1.CachedTotalHeight = nil
		p1.HeightCacheDirty = true
		p1:_updateCanvasSize()
	end
	p1:_scheduleVirtualizationUpdate()
end
function t._calculateItemPosition(p1, p2) --[[ _calculateItemPosition | Line: 643 ]]
	if p1.FixedItemHeight then
		return (p2 - 1) * (p1.FixedItemHeight + p1.ItemSpacing)
	else
		return p1:_calculateVariablePosition(p2)
	end
end
function t._calculateVariablePosition(p1, p2) --[[ _calculateVariablePosition | Line: 654 ]]
	local v1 = 0
	for i = 1, p2 - 1 do
		v1 = v1 + p1:_getItemHeight(i) + p1.ItemSpacing
	end
	return v1
end
function t._getItemHeight(p1, p2) --[[ _getItemHeight | Line: 665 ]]
	if not p1.HeightCache[p2] then
		local v1 = p1.Data[p2]
		if v1 and p1.GetItemHeight then
			p1.HeightCache[p2] = p1.GetItemHeight(v1, p2)
		else
			warn("VirtualizedList: No item or GetItemHeight function for index", p2)
			p1.HeightCache[p2] = 50
		end
	end
	return p1.HeightCache[p2]
end
function t._getItemWidth(p1, p2) --[[ _getItemWidth | Line: 681 ]]
	if p1.GetItemWidth then
		local v1 = p1.Data[p2]
		if v1 then
			return p1.GetItemWidth(v1, p2)
		end
	end
	return p1.ItemWidth
end
function t._getItemSpacing(p1, p2) --[[ _getItemSpacing | Line: 695 ]]
	if p1.GetItemSpacing then
		local v1 = p1.Data[p2]
		if v1 then
			return p1.GetItemSpacing(v1, p2)
		end
	end
	return p1.ItemSpacing
end
function t._findIndexAtPosition(p1, p2) --[[ _findIndexAtPosition | Line: 709 ]]
	if p1.FixedItemHeight then
		return math.floor(p2 / (p1.FixedItemHeight + p1.ItemSpacing)) + 1
	end
	local v2 = #p1.Data
	local v3 = 1
	while v3 < v2 do
		local v4 = math.floor((v3 + v2) / 2)
		if p1:_calculateItemPosition(v4) < p2 then
			v3 = v4 + 1
		else
			v2 = v4
		end
	end
	return v3
end
function t._calculateVariableVisibleRange(p1, p2, p3) --[[ _calculateVariableVisibleRange | Line: 733 ]]
	if p1.ItemsPerRow == 1 then
		local v1 = p1:_findIndexAtPosition(p2)
		local v2 = p1:_calculateItemPosition(v1)
		count = v1
		v3 = p2 + p3
		while count <= #p1.Data and v2 < v3 do
			v2 = v2 + p1:_getItemHeight(count) + p1.ItemSpacing
			count = count + 1
		end
		return math.max(1, v1 - p1.BufferItems), math.min(#p1.Data, count + p1.BufferItems)
	else
		local v9 = math.ceil(#p1.Data / p1.ItemsPerRow)
		if v9 == 0 then
			return 1, 0
		end
		local v10 = 0
		local v11 = 0
		for i = 0, v9 - 1 do
			local v12 = i * p1.ItemsPerRow + 1
			local v13 = 0
			for j = 0, p1.ItemsPerRow - 1 do
				local v14 = v12 + j
				if v14 <= #p1.Data then
					v13 = math.max(v13, p1:_getItemHeight(v14))
				end
			end
			local v16 = p1:_getItemSpacing(v12)
			if p2 < v10 + v13 then
				v11 = i
				break
			end
			v10 = v10 + v13 + v16
		end
		v17 = 0
		v18 = v11
		v19 = p2 + p3
		for k = 0, v11 - 1 do
			local v20 = k * p1.ItemsPerRow + 1
			local v21 = 0
			for n = 0, p1.ItemsPerRow - 1 do
				local v22 = v20 + n
				if v22 <= #p1.Data then
					v21 = math.max(v21, p1:_getItemHeight(v22))
				end
			end
			v17 = v17 + v21 + p1:_getItemSpacing(v20)
		end
		for m = v11, v9 - 1 do
			local v24 = m * p1.ItemsPerRow + 1
			local v25 = 0
			for i = 0, p1.ItemsPerRow - 1 do
				local v26 = v24 + i
				if v26 <= #p1.Data then
					v25 = math.max(v25, p1:_getItemHeight(v26))
				end
			end
			if v19 <= v17 then
				break
			end
			v17 = v17 + v25 + p1:_getItemSpacing(v24)
			v18 = m
		end
		return math.max(0, v11 - p1.BufferItems) * p1.ItemsPerRow + 1, math.min(#p1.Data, (math.min(v9 - 1, v18 + p1.BufferItems) + 1) * p1.ItemsPerRow)
	end
end
function t._calculateTotalHeight(p1) --[[ _calculateTotalHeight | Line: 849 ]]
	local v1 = #p1.Data
	if v1 == 0 then
		return 0
	end
	if p1.FixedItemHeight then
		if p1.ItemsPerRow == 1 then
			return (v1 - 1) * (p1.FixedItemHeight + p1.ItemSpacing) + p1.FixedItemHeight
		end
		local v3 = math.ceil(v1 / p1.ItemsPerRow)
		if v3 == 0 then
			return 0
		else
			return (v3 - 1) * (p1.FixedItemHeight + p1.ItemSpacing) + p1.FixedItemHeight
		end
	else
		if p1.CachedTotalHeight and not p1.HeightCacheDirty then
			return p1.CachedTotalHeight
		end
		local sum = 0
		if p1.ItemsPerRow == 1 then
			for i = 1, v1 do
				sum = sum + p1:_getItemHeight(i)
				if i < v1 then
					sum = sum + p1:_getItemSpacing(i)
				end
			end
		else
			local v5 = math.ceil(v1 / p1.ItemsPerRow)
			for j = 0, v5 - 1 do
				local v6 = j * p1.ItemsPerRow + 1
				local v7 = 0
				for k = 0, p1.ItemsPerRow - 1 do
					local v8 = v6 + k
					if v8 <= v1 then
						v7 = math.max(v7, p1:_getItemHeight(v8))
					end
				end
				sum = sum + v7
				if j < v5 - 1 then
					sum = sum + p1:_getItemSpacing(v6)
				end
			end
		end
		p1.CachedTotalHeight = sum
		p1.HeightCacheDirty = false
		return sum
	end
end
return t