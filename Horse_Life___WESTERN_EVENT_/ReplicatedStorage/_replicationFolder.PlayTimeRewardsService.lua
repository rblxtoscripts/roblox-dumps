-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("PlaytimeRewards")
local v2 = Sonar("UnlockSequenceService")
local v3 = Sonar("Signal")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("InstanceUtils")
local v6 = Sonar("DataUpdateService", "Server")
local v7 = game:GetService("RunService"):IsServer()
local v8 = v4.Get("PlaytimeRewards")()
local t2 = {}
local v9 = v3.new()
local v10 = v3.new()
function t.AddPlaytimeRewards(p1, p2) --[[ AddPlaytimeRewards | Line: 25 | Upvalues: t (copy), v8 (copy), v1 (copy), t2 (copy), v10 (copy), v9 (copy) ]]
	if t.GetPlaytimeRewards(p1) then
		warn("\226\154\160\239\184\143 PlayTimeRewardsService, PlaytimeRewards already exists", p1)
		return
	end
	local v12
	if p2.Preset then
		v12 = v8[p2.Preset]
		if not v12 then
			warn("\226\154\160\239\184\143 PlayTimeRewardsService, Preset not found", p2.Preset)
			return
		end
	else
		v12 = nil
	end
	if v12 and v12.Create then
		p2 = v12.Create(table.unpack(p2.Args or {}))
	end
	p2.Data = p2.Data or "PlayTimeRewards"
	local v4 = v1.new(p1, p2)
	v4.Maid:GiveTask(function() --[[ Line: 47 | Upvalues: t2 (ref), p1 (copy), v10 (ref), v4 (copy) ]]
		t2[p1] = nil
		v10:Fire(v4)
	end)
	t2[p1] = v4
	v9:Fire(v4)
	return v4
end
function t.GetPlaytimeRewards(p1) --[[ GetPlaytimeRewards | Line: 58 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.GetAllPlaytimeRewards() --[[ GetAllPlaytimeRewards | Line: 62 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetPlaytimeRewardsAddedSignal(p1) --[[ GetPlaytimeRewardsAddedSignal | Line: 66 | Upvalues: v3 (copy), v9 (copy) ]]
	local v1 = v3.new()
	v1:GiveTask(v9:Connect(function(p12) --[[ Line: 69 | Upvalues: p1 (copy), v1 (copy) ]]
		if p12.Name ~= p1 then
			return
		end
		v1:Fire(p12)
	end))
	return v1
end
function t.GetPlaytimeRewardsRemovedSignal(p1) --[[ GetPlaytimeRewardsRemovedSignal | Line: 78 | Upvalues: v3 (copy), v10 (copy) ]]
	local v1 = v3.new()
	v1:GiveTask(v10:Connect(function(p12) --[[ Line: 80 | Upvalues: p1 (copy), v1 (copy) ]]
		if p12.Name ~= p1 then
			return
		end
		v1:Fire(p12)
	end))
	return v1
end
function t.OnPlaytimeRewardsAdded(p1, p2) --[[ OnPlaytimeRewardsAdded | Line: 88 | Upvalues: t (copy) ]]
	local v1 = t.GetPlaytimeRewardsAddedSignal(p1)
	v1:Connect(p2)
	local v2 = t.GetPlaytimeRewards(p1)
	if not v2 then
		return v1
	end
	p2(v2)
	return v1
end
function t.YieldForPlaytimeRewards(p1) --[[ YieldForPlaytimeRewards | Line: 98 | Upvalues: t (copy) ]]
	local v1 = task.delay(5, function() --[[ Line: 99 | Upvalues: p1 (copy) ]]
		warn((("\226\154\160\239\184\143 PlayTimeRewardsService, Infinite yield possible on \'PlayTimeRewardsService.YieldForPlaytimeRewards(\"%*\")\'"):format(p1)))
	end)
	local v2 = nil
	while not v2 do
		local v3 = t.GetPlaytimeRewards(p1)
		if v3 then
			v2 = v3
			continue
		end
		task.wait()
		v2 = v3
	end
	task.cancel(v1)
	return v2
end
function t.RequestToClaim(p1) --[[ RequestToClaim | Line: 116 | Upvalues: v2 (copy) ]]
	p1.Sequence = type(p1.Sequence) == "table" and p1.Sequence.Name or p1.Sequence
	local Tier = p1.Tier
	if Tier then
		Tier = type(p1.Tier) == "table" and p1.Tier.Index or p1.Tier
	end
	p1.Tier = Tier
	p1.Track = p1.Track or "Default"
	return v2.RequestToClaimTier(p1)
end
function t.Init(p1) --[[ Init | Line: 124 | Upvalues: v7 (copy), v6 (copy), v5 (copy), t (copy), v8 (copy) ]]
	if v7 then
		v6.AddRigDataCallback(function(p1) --[[ Line: 126 | Upvalues: v5 (ref) ]]
			if p1:FindFirstChild("PlayTimeRewards") then
				return
			end
			v5.Create("Folder", {
				Name = "PlayTimeRewards",
				Parent = p1
			})
		end)
	end
	local function tryAddPlaytimeRewards(p1, p2) --[[ tryAddPlaytimeRewards | Line: 136 | Upvalues: t (ref) ]]
		if p2.Init == false then
			return
		end
		if not p2.Create then
			t.AddPlaytimeRewards(p1, p2)
		end
	end
	for v1, v2 in v8 do
		if v2.Init ~= false and not v2.Create then
			t.AddPlaytimeRewards(v1, v2)
		end
	end
end
t:Init()
return t