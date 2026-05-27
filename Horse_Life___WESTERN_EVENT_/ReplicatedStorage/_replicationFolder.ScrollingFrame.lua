-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("safeDestroy")
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Frame = p1.Instance
	v2.UIListLayout = v2.Frame:FindFirstChildOfClass("UIListLayout")
	v2.UIGridLayout = v2.Frame:FindFirstChildOfClass("UIGridLayout")
	local function ensureLayoutScaleTag(p1) --[[ ensureLayoutScaleTag | Line: 22 ]]
		if not p1 then
			return
		end
		if p1:HasTag("ScrollLayoutScale") then
			return
		end
		for v1, v2 in p1:GetChildren() do
			if p1:HasTag("ScrollLayoutScale") then
				return
			end
		end
		p1:AddTag("ScrollLayoutScale")
	end
	ensureLayoutScaleTag(v2.UIListLayout)
	ensureLayoutScaleTag(v2.UIGridLayout)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 39 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t.ScrollToElement(p1, p2, p3) --[[ ScrollToElement | Line: 47 | Upvalues: v1 (copy) ]]
	local Frame = p1.Frame
	if not (Frame and p2) then
		return
	end
	local UIListLayout = p1.UIListLayout
	local UIGridLayout = p1.UIGridLayout
	if not (UIListLayout or UIGridLayout) then
		warn("No UIListLayout or UIGridLayout found in the ScrollingFrame!")
		return
	end
	local list = {}
	for v12, v2 in Frame:GetChildren() do
		if v2:IsA("GuiObject") and (v2.Visible and (v2 ~= UIListLayout and v2 ~= UIGridLayout)) then
			table.insert(list, v2)
		end
	end
	if UIListLayout then
		table.sort(list, function(p1, p2) --[[ Line: 66 ]]
			return p1.LayoutOrder < p2.LayoutOrder
		end)
	end
	local v3 = nil
	for i, v in ipairs(list) do
		if v == p2 then
			v3 = i
			break
		end
	end
	if not v3 then
		return
	end
	local v4 = Vector2.new(0, 0)
	if UIListLayout then
		local v5 = 0
		for i = 1, v3 - 1 do
			local v6 = v5 + list[i].AbsoluteSize.Y
			v5 = if UIListLayout.FillDirection == Enum.FillDirection.Horizontal then v6 + UIListLayout.Padding.Scale * Frame.AbsoluteSize.X else v6 + UIListLayout.Padding.Scale * Frame.AbsoluteSize.Y
		end
		local v9 = math.max(0, Frame.CanvasSize.Y.Offset - Frame.AbsoluteSize.Y)
		v4 = Vector2.new(0, (math.clamp(v5 + p2.AbsoluteSize.Y / 2 - Frame.AbsoluteSize.Y / 2, math.min(0, v9), v9)))
	elseif UIGridLayout then
		local CellSize = UIGridLayout.CellSize
		local CellPadding = UIGridLayout.CellPadding
		local v16 = math.floor((v3 - 1) / math.max(1, (math.floor((Frame.AbsoluteSize.X + CellPadding.X.Offset) / (CellSize.X.Offset + CellPadding.X.Offset))))) * (CellSize.Y.Offset + CellPadding.Y.Offset) + CellSize.Y.Offset / 2 - Frame.AbsoluteSize.Y / 2
		local v18 = math.max(0, Frame.CanvasSize.Y.Offset - Frame.AbsoluteSize.Y)
		v4 = Vector2.new(0, (math.clamp(v16, math.min(0, v18), v18)))
	end
	local v22 = nil
	v22 = Frame.InputChanged:Once(function() --[[ Line: 114 | Upvalues: v1 (ref), Frame (copy), v22 (ref) ]]
		v1.stop(Frame)
		v22:Disconnect()
	end)
	if p3 then
		Frame.CanvasPosition = v4
	else
		v1.target(Frame, 0.8, 3, {
			CanvasPosition = v4
		})
		v1.completed(Frame, function() --[[ Line: 122 | Upvalues: v1 (ref), Frame (copy), v22 (ref) ]]
			v1.stop(Frame)
			v22:Disconnect()
		end)
	end
end
return t