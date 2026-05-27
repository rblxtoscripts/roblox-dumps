-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("TimeSeedClass")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("NotificationsService")
local v7 = Sonar("Constants")
local CurrentEvent = v7.CurrentEvent
local v8 = if CurrentEvent then v2.new({
	Start = v7.TimeSyncStart + CurrentEvent.TouchNodeSpawnOffsetTime,
	Duration = CurrentEvent.TouchNodeSpawnTime
}) else nil
local v9 = RunService:IsStudio()
local v10 = if CurrentEvent then ReplicatedStorage.WorldStorage:WaitForChild("TouchNodeEvent") else nil
local t2 = {}
local t3 = {}
local t4 = {}
function t.Start(p1) --[[ Start | Line: 33 | Upvalues: t3 (copy), t2 (ref), v10 (copy), CurrentEvent (copy), v3 (copy), t (copy) ]]
	for i = 1, #t3 do
		local v1 = t3[i]
		if v1 then
			local Part = Instance.new("Part")
			Part.Anchored = true
			Part.CanQuery = false
			Part.CanCollide = false
			Part.CanTouch = false
			Part.Transparency = 1
			Part.Name = i
			Part.Size = Vector3.new(6, 6, 6)
			Part.Color = Color3.fromRGB(255, 0, 0)
			Part.CFrame = v1
			Part:AddTag("TouchNode")
			Part.Parent = workspace.Events.TouchNodes
			t2[i] = Part
		end
	end
	v10.TotalRemaining.Value = #t3
	v10.EndTime.Value = math.floor(workspace:GetServerTimeNow() + CurrentEvent.TouchNodeDuration)
	v10.Active.Value = true
	while not (v10.TotalRemaining.Value <= 0 or v3.Get() >= v10.EndTime.Value) do
		v3.OnTimeChanged:Wait()
	end
	if v10.TotalRemaining.Value <= 0 then
		t:GiveRewards()
	end
	t:End()
end
function t.End(p1) --[[ End | Line: 79 | Upvalues: t4 (ref), v10 (copy), t2 (ref) ]]
	t4 = {}
	v10.Active.Value = false
	for v1, v2 in t2 do
		v2:Destroy()
	end
	t2 = {}
end
function t.GiveRewards(p1) --[[ GiveRewards | Line: 89 | Upvalues: t4 (ref), v4 (copy), v7 (copy), CurrentEvent (copy), v6 (copy) ]]
	for v1, v2 in t4 do
		local v3, v42 = pcall(function() --[[ Line: 91 | Upvalues: v4 (ref), v1 (copy), v7 (ref), v2 (copy), CurrentEvent (ref), v6 (ref) ]]
			local v12 = v4.getWrapperFromPlayer(v1)
			if v12 then
				v12:GiveItem({
					Source = "TouchNodeEvent",
					IgnoreLimit = true,
					Name = v7.EventCurrencyName,
					Amount = v2 * CurrentEvent.CurrencyPerTouchNodeCleared
				})
				v12:IncrementMission({
					Type = "EventTouchNodeEvent",
					Amount = 1,
					Data = {}
				})
				v6.NotifyPlayer(v12.Player, "TouchNodeComplete", v2)
				v12:SetReplicatedData("TouchNodes", 0)
			end
		end)
		if not v3 then
			warn(v42)
		end
	end
end
function t.Init(p1) --[[ Init | Line: 118 | Upvalues: CurrentEvent (copy), v1 (copy), t3 (copy), v4 (copy), t4 (ref), v5 (copy), v10 (copy), t2 (ref), v9 (copy), v8 (copy), t (copy) ]]
	if not CurrentEvent then
		return
	end
	if not v1 then
		return
	end
	local count = 0
	for v12, v2 in workspace.Events.TouchNodes:GetChildren() do
		if v2:IsA("BasePart") then
			count = count + 1
			v2.Name = count
			t3[count] = v2.CFrame
			v2:Destroy()
		end
	end
	v4.bindToPlayers(function(p1) --[[ Line: 133 | Upvalues: v4 (ref) ]]
		local _ = v4.getWrapperFromPlayer(p1)
	end, function(p1) --[[ Line: 137 | Upvalues: t4 (ref) ]]
		t4[p1] = nil
	end)
	v5.GetRemoteFunction("HitTouchNodeRemote").OnServerInvoke = function(p1, p2) --[[ Line: 141 | Upvalues: v10 (ref), v4 (ref), t2 (ref), t4 (ref) ]]
		if not v10.Active.Value then
			return
		end
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = t2[p2]
		if not v2 then
			return
		end
		t2[p2] = nil
		if not t4[p1] then
			t4[p1] = 0
		end
		local v3 = t4
		v3[p1] = v3[p1] + 1
		v1:SetReplicatedData("TouchNodes", t4[p1])
		v10.TotalRemaining.Value = math.max(v10.TotalRemaining.Value - 1, 0)
		v2:SetAttribute("D", true)
		task.delay(1, function() --[[ Line: 160 | Upvalues: v2 (copy) ]]
			v2:Destroy()
		end)
		return true
	end
	if v9 then
		return
	end
	v8.SeedChanged:Connect(function() --[[ Line: 172 | Upvalues: t (ref) ]]
		t:Start()
	end)
end
t:Init()
return t