-- https://lua.expert/
local t = {}
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("Signal").new()
local t2 = {}
local t3 = {}
function ResolveData(p1, p2) --[[ ResolveData | Line: 43 | Upvalues: t2 (copy), t3 (copy), v2 (copy) ]]
	t2[p1] = true
	t3[p1] = p2
	v2:Fire(p1, p2)
end
function t.OnResolved(p1, p2, p3) --[[ OnResolved | Line: 52 | Upvalues: t2 (copy), t3 (copy), v2 (copy) ]]
	if t2[p2] then
		task.spawn(function() --[[ Line: 54 | Upvalues: p3 (copy), t3 (ref), p2 (copy) ]]
			p3(t3[p2])
		end)
		return nil
	else
		local v1 = nil
		v1 = v2:Connect(function(p1, p22) --[[ Line: 61 | Upvalues: p2 (copy), v1 (ref), p3 (copy) ]]
			if p2 == p1 then
				v1:Disconnect()
				p3(p22)
			end
		end)
		return v1
	end
end
function t.Init(p1) --[[ Init | Line: 72 | Upvalues: v1 (copy), RunService (copy), HttpService (copy), Players (copy), t3 (copy), t2 (copy) ]]
	v1:OnPlayerAdded(function(p1) --[[ Line: 73 | Upvalues: RunService (ref), HttpService (ref), v1 (ref) ]]
		if RunService:IsStudio() then
			ResolveData(p1, nil)
			return
		end
		local LaunchData = p1:GetJoinData().LaunchData
		local count = 0
		while count < 10 and LaunchData == "" do
			task.wait(0.5)
			LaunchData = p1:GetJoinData().LaunchData
			count = count + 1
		end
		if LaunchData ~= "" then
			local v12, v2 = pcall(function() --[[ Line: 93 | Upvalues: HttpService (ref), LaunchData (ref) ]]
				return HttpService:JSONDecode(LaunchData)
			end)
			if v12 then
				ResolveData(p1, v2)
			else
				v1.GBLog("Failed to decode launch data JSON for player " .. p1.Name .. ": " .. tostring(v2))
			end
		end
		ResolveData(p1, nil)
	end)
	Players.PlayerRemoving:Connect(function(p1) --[[ Line: 108 | Upvalues: t3 (ref), t2 (ref) ]]
		task.defer(function() --[[ Line: 109 | Upvalues: t3 (ref), p1 (copy), t2 (ref) ]]
			t3[p1] = nil
			t2[p1] = nil
		end)
	end)
end
return t