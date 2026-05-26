-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("GBRequests")
local v2 = shared.GBMod("MetricCollector")
local v3 = shared.GBMod("GetRemote")
local v4 = shared.GBMod("Utilities")
local v5 = v3("Event", "ExportClientMetrics")
local function AggregateMetric(p1) --[[ AggregateMetric | Line: 44 ]]
	if not p1 or #p1 == 0 then
		return nil
	end
	table.sort(p1)
	local v1 = p1[1]
	local v2, v3, v4 = v1, v1, 0
	for v5, v6 in p1 do
		local v7 = math.min(v2, v6)
		v2, v3, v4 = v7, math.max(v3, v6), v4 + v6
	end
	local t = {
		min = v2,
		max = v3,
		sum = v4,
		average = v4 / #p1
	}
	t.median = p1[math.max(math.floor(#p1 / 2), 1)]
	t.p25 = p1[math.max(math.floor(#p1 * 0.25), 1)]
	t.p75 = p1[math.max(math.floor(#p1 * 0.75), 1)]
	t.p90 = p1[math.max(math.floor(#p1 * 0.9), 1)]
	t.p99 = p1[math.max(math.floor(#p1 * 0.99), 1)]
	return t
end
function t.SendServerStateReport(p1) --[[ SendServerStateReport | Line: 78 | Upvalues: v4 (copy), v1 (copy) ]]
	local v12 = p1:PrepareServerStateReport()
	v1:GBRequest(("v1/servers/roblox/%*"):format((v4.getServerId())), v12)
end
function t.PrepareServerStateReport(p1) --[[ PrepareServerStateReport | Line: 86 | Upvalues: Players (copy), v2 (copy), AggregateMetric (copy) ]]
	local t = {}
	for v1, v22 in Players:GetPlayers() do
		table.insert(t, v22.UserId)
	end
	local v3 = v2:ReadAndResetAllMetrics()
	return {
		timestamp = DateTime.now():ToIsoDate(),
		rootPlaceId = game.PlaceId,
		universeId = game.GameId,
		placeVersion = game.PlaceVersion,
		players = t,
		metadata = {
			clientPing = AggregateMetric(v3.ClientPing),
			clientFps = AggregateMetric(v3.ClientPhysicsFps),
			serverFps = AggregateMetric(v3.PhysicsFps),
			serverAgeSeconds = workspace.DistributedGameTime,
			matchmakingType = game.MatchmakingType.Name,
			privateServerId = game.PrivateServerId,
			privateServerOwnerId = game.PrivateServerOwnerId
		}
	}
end
function t.Init(p1) --[[ Init | Line: 119 | Upvalues: v2 (copy), v5 (copy), v1 (copy) ]]
	task.spawn(function() --[[ Line: 121 | Upvalues: v2 (ref) ]]
		while task.wait(1) do
			v2:ReportMetric("PhysicsFps", workspace:GetRealPhysicsFPS())
		end
	end)
	task.spawn(function() --[[ Line: 129 | Upvalues: p1 (copy) ]]
		while task.wait(10) do
			p1:SendServerStateReport()
		end
	end)
	v5.OnServerEvent:Connect(function(p1, p2) --[[ Line: 135 | Upvalues: v2 (ref) ]]
		for i = 1, 10 do
			local v1 = p2.PhysicsFps[i]
			local v22 = p2.Ping[i]
			if type(v1) == "number" and (v1 >= 0 and v1 <= 360) then
				v2:ReportMetric("ClientPhysicsFps", v1)
			end
			if type(v22) == "number" and (v22 >= 0 and v22 <= 100000) then
				v2:ReportMetric("ClientPing", v22)
			end
		end
	end)
	v1:OnFinalRequestCall(function() --[[ Line: 163 | Upvalues: p1 (copy) ]]
		p1:SendServerStateReport()
	end)
end
return t