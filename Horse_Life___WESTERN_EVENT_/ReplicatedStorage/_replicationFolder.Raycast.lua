-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local t = {
	Continue = 1,
	Finished = 2,
	Fail = 3
}
local t2 = {
	FindPartOnRay = function(p1, p2, p3, p4) --[[ FindPartOnRay | Line: 84 | Upvalues: Workspace (copy) ]]
		return Workspace:FindPartOnRay(p1, p2, p3, p4)
	end,
	FindPartOnRayWithIgnoreList = function(p1, p2, p3, p4) --[[ FindPartOnRayWithIgnoreList | Line: 88 | Upvalues: Workspace (copy) ]]
		return Workspace:FindPartOnRayWithIgnoreList(p1, p2, p3, p4)
	end,
	FindPartOnRayWithWhiteList = function(p1, p2, p3) --[[ FindPartOnRayWithWhiteList | Line: 92 | Upvalues: Workspace (copy) ]]
		return Workspace:FindPartOnRayWithWhitelist(p1, p2, p3)
	end,
	CallbackResult = t,
	FindPartOnRayWithCallBack = function(p1, p2, p3, p4, p5) --[[ FindPartOnRayWithCallBack | Line: 100 | Upvalues: Workspace (copy), t (copy) ]]
		local magnitude = p1.Direction.magnitude
		local unit = p1.Direction.unit
		while true do
			local v1, v2, v3, v4 = Workspace:FindPartOnRay(p1, p2, p3, p4)
			local v5 = p5(v1, v2, v3, v4)
			if v5 == t.Continue then
				magnitude = magnitude - (v2 - p1.Origin).magnitude
				if magnitude < 0.0001 then
					return
				end
				p1 = Ray.new(v2 + unit * 0.0001, unit * magnitude)
			else
				if v5 == t.Finished then
					return v1, v2, v3, v4
				end
				if v5 == t.Fail or v5 == nil then
					return
				end
			end
		end
	end,
	FindPartOnRayWithCallBackBlackList = function(p1, p2, p3, p4, p5) --[[ FindPartOnRayWithCallBackBlackList | Line: 122 | Upvalues: Workspace (copy), t (copy) ]]
		local magnitude = p1.Direction.magnitude
		local unit = p1.Direction.unit
		while true do
			local v1, v2, v3, v4 = Workspace:FindPartOnRayWithIgnoreList(p1, p2, p3, p4)
			local v5 = p5(v1, v2, v3, v4)
			if v5 == t.Continue then
				magnitude = magnitude - (v2 - p1.Origin).magnitude
				if magnitude < 0.0001 then
					return
				end
				p1 = Ray.new(v2 + unit * 0.0001, unit * magnitude)
			else
				if v5 == t.Finished then
					return v1, v2, v3, v4
				end
				if v5 == t.Fail or v5 == nil then
					return
				end
			end
		end
	end,
	FindPartOnRayWithCallBackWhiteList = function(p1, p2, p3, p4) --[[ FindPartOnRayWithCallBackWhiteList | Line: 144 | Upvalues: Workspace (copy), t (copy) ]]
		local magnitude = p1.Direction.magnitude
		local unit = p1.Direction.unit
		while true do
			local v1, v2, v3, v4 = Workspace:FindPartOnRayWithWhitelist(p1, p2, p3)
			local v5 = p4(v1, v2, v3, v4)
			if v5 == t.Continue then
				magnitude = magnitude - (v2 - p1.Origin).magnitude
				if magnitude < 0.0001 then
					return
				end
				p1 = Ray.new(v2 + unit * 0.0001, unit * magnitude)
			else
				if v5 == t.Finished then
					return v1, v2, v3, v4
				end
				if v5 == t.Fail or v5 == nil then
					return
				end
			end
		end
	end
}
function t2.FindPartOnRayWithBlackAndWhiteList(p1, p2, p3, p4, p5) --[[ FindPartOnRayWithBlackAndWhiteList | Line: 165 | Upvalues: t2 (copy), t (copy) ]]
	return t2.FindPartOnRayWithCallBackWhiteList(p1, p3, p4, function(p1, p22, p3, p4) --[[ Line: 166 | Upvalues: t (ref), p2 (copy), p5 (copy) ]]
		if not p1 then
			return t.Finished
		end
		for i = 1, #p2 do
			if p1 == p2[i] or not p5 and p1:IsDescendantOf(p2[i]) then
				return t.Continue
			end
		end
		return t.Finished
	end)
end
return t2