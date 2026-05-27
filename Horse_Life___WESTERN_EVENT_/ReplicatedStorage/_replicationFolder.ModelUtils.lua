-- https://lua.expert/
local t = {}
local TweenService = game:GetService("TweenService")
function t.HasProperty(p1, p2) --[[ HasProperty | Line: 7 ]]
	return pcall(function() --[[ Line: 8 | Upvalues: p1 (copy), p2 (copy) ]]
		return p1[p2] ~= nil
	end)
end
function t.SafeSetProperty(p1, p2, p3, p4) --[[ SafeSetProperty | Line: 12 | Upvalues: TweenService (copy) ]]
	pcall(function() --[[ Line: 13 | Upvalues: p4 (copy), TweenService (ref), p1 (copy), p2 (copy), p3 (copy) ]]
		if p4 then
			TweenService:Create(p1, p4, {
				[p2] = p3
			}):Play()
		else
			p1[p2] = p3
		end
	end)
end
function t.SetModelProp(p1, p2, p3, p4) --[[ SetModelProp | Line: 25 | Upvalues: t (copy) ]]
	if t.HasProperty(p1, p2) then
		local v1, v2, v3
		if type(p3) == "function" then
			v1 = p3(p1)
			if v1 then
				v2 = p1
				v3 = p2
			else
				v2 = p1
				v3 = p2
				v1 = p3
			end
		else
			v2 = p1
			v3 = p2
			v1 = p3
		end
		t.SafeSetProperty(v2, v3, v1, p4)
	end
	for v7, v8 in p1:GetDescendants() do
		local v4, v5, v6
		if t.HasProperty(v8, p2) then
			if type(p3) == "function" then
				v4 = p3(v8)
				if v4 then
					v5 = v8
					v6 = p2
				else
					v5 = v8
					v6 = p2
					v4 = p3
				end
			else
				v5 = v8
				v6 = p2
				v4 = p3
			end
			t.SafeSetProperty(v5, v6, v4, p4)
		end
	end
end
function t.CacheProperty(p1, p2) --[[ CacheProperty | Line: 38 | Upvalues: t (copy) ]]
	if t.HasProperty(p1, p2) then
		p1:SetAttribute("Cached" .. p2, p1[p2])
	end
	for v1, v2 in p1:GetDescendants() do
		if t.HasProperty(v2, p2) then
			v2:SetAttribute("Cached" .. p2, v2[p2])
		end
	end
end
function t.GetCachedProperty(p1, p2) --[[ GetCachedProperty | Line: 51 ]]
	return p1:GetAttribute("Cached" .. p2)
end
function t.RestoreProperty(p1, p2, p3) --[[ RestoreProperty | Line: 56 | Upvalues: t (copy) ]]
	if p1:GetAttribute("Cached" .. p2) then
		t.SafeSetProperty(p1, p2, p1:GetAttribute("Cached" .. p2), p3)
	end
	for v1, v2 in p1:GetDescendants() do
		if v2:GetAttribute("Cached" .. p2) then
			t.SafeSetProperty(v2, p2, v2:GetAttribute("Cached" .. p2), p3)
		end
	end
end
function t.GetMostProminentColor(p1) --[[ GetMostProminentColor | Line: 69 ]]
	local v1 = Color3.fromRGB(0, 0, 0)
	local t = {}
	for v2, v3 in p1:GetDescendants() do
		if v3:IsA("BasePart") then
			local Color = v3.Color
			local v4 = tostring(Color)
			t[v4] = (t[v4] or 0) + 1
			if t[v4] > (t[tostring(v1)] or 0) then
				v1 = Color
			end
		end
	end
	return v1
end
function t.RemoveTags(p1, p2) --[[ RemoveTags | Line: 89 ]]
	for v1, v2 in p1:GetTags() do
		if not p2 or p2(p1, v2) then
			p1:RemoveTag(v2)
		end
	end
	for v3, v4 in p1:GetDescendants() do
		for v5, v6 in v4:GetTags() do
			if not p2 or p2(v4, v6) then
				v4:RemoveTag(v6)
			end
		end
	end
end
function t.RemoveAllOfClass(p1, p2) --[[ RemoveAllOfClass | Line: 108 ]]
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA(p2) then
			v2:Destroy()
		end
	end
end
function t.WaitForPrimaryPart(p1, p2, p3) --[[ WaitForPrimaryPart | Line: 120 ]]
	if p2 then
		local v1 = os.clock()
		while not p1.PrimaryPart and os.clock() - v1 < p2 do
			task.wait()
		end
	else
		local v2 = task.delay(5, function() --[[ Line: 127 | Upvalues: p1 (copy) ]]
			warn((("Infinite yield possible on \'ModelUtils.WaitForPrimaryPart(%*)\'"):format((p1:GetFullName()))))
		end)
		while not p1.PrimaryPart do
			p1:GetPropertyChangedSignal("PrimaryPart"):Wait()
		end
		task.cancel(v2)
	end
	if not p1.PrimaryPart and p3 then
		error((("PrimaryPart does not exist: %*"):format((p1:GetFullName()))))
	end
	return p1.PrimaryPart
end
return t