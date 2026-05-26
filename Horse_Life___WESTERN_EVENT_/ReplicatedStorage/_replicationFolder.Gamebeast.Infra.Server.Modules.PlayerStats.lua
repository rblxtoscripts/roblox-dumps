-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("Signal")
local v2 = shared.GBMod("Schema")
local v3 = v1.new()
local v4 = v2.new({
	join_time = {
		type = "number",
		default = function() --[[ default | Line: 33 ]]
			return os.time()
		end
	},
	teleporting_to = {
		default = function() --[[ default | Line: 36 ]]
			return nil
		end,
		type = { "number", "nil" }
	}
})
local t2 = {}
function t.SetStat(p1, p2, p3, p4) --[[ SetStat | Line: 51 | Upvalues: t2 (copy), v4 (copy) ]]
	if not t2[p2] and p2.Parent then
		p1:Reset(p2)
	end
	if not v4:HasKey(p3) then
		error("Cannot set stat: " .. p3)
	end
	t2[p2][p3] = p4
end
function t.GetStats(p1, p2) --[[ GetStats | Line: 63 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.GetStat(p1, p2, p3) --[[ GetStat | Line: 67 | Upvalues: t2 (copy) ]]
	if t2[p2] then
		return t2[p2][p3]
	else
		return nil
	end
end
function t.Clear(p1, p2) --[[ Clear | Line: 74 | Upvalues: t2 (copy) ]]
	t2[p2] = nil
end
function t.Reset(p1, p2) --[[ Reset | Line: 78 | Upvalues: t2 (copy), v4 (copy), v3 (copy) ]]
	t2[p2] = v4:GetDefault()
	v3:Fire(p2, t2[p2])
end
function t.OnDefaultStatsResolved(p1, p2, p3) --[[ OnDefaultStatsResolved | Line: 84 | Upvalues: v3 (copy), t2 (copy), Players (copy) ]]
	local v1 = nil
	v1 = v3:Connect(function(p1, p22) --[[ Line: 85 | Upvalues: p2 (copy), p3 (copy), v1 (ref) ]]
		if p1 ~= p2 then
			return
		end
		p3(p22)
		v1:Disconnect()
	end)
	if t2[p2] then
		v1:Disconnect()
		task.spawn(function() --[[ Line: 94 | Upvalues: p3 (copy), t2 (ref), Players (ref) ]]
			p3(t2[Players.LocalPlayer])
		end)
	end
	return v1
end
function t.Init(p1) --[[ Init | Line: 102 | Upvalues: Players (copy) ]]
	for v1, v2 in Players:GetPlayers() do
		p1:Reset(v2)
	end
	Players.PlayerAdded:Connect(function(p12) --[[ Line: 109 | Upvalues: p1 (copy) ]]
		p1:Reset(p12)
	end)
	Players.PlayerRemoving:Connect(function(p12) --[[ Line: 116 | Upvalues: p1 (copy) ]]
		task.defer(function() --[[ Line: 117 | Upvalues: p1 (ref), p12 (copy) ]]
			p1:Clear(p12)
		end)
	end)
end
return t