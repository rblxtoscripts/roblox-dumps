-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("EventUtils")
local v3 = Sonar("Binder")
local v4 = Sonar("MathUtils")
local v5 = Sonar("Constants")
local v6 = RunService:IsServer()
local v7 = RunService:IsStudio() and true
local LocalPlayer = game:GetService("Players").LocalPlayer
local list = {
	{
		DataModel = "Shared",
		Modules = {
			"PlayerCohortsWrapper",
			"LoyaltyHandler",
			"DailyLoginWrapper",
			"PlayerItemsHandler",
			"PlayerStatsHandler",
			"ModifiersHandler",
			"MissionsHandler",
			"MissionsWrapper",
			"DiscoveryHandler",
			"SpeciesUpgradeService"
		}
	},
	{
		DataModel = "Server",
		Modules = { "TitlesWrapper" }
	}
}
local t = {}
local Modules = list[1].Modules
local function initWrappers(p1) --[[ initWrappers | Line: 59 | Upvalues: v1 (copy), v6 (copy), Workspace (copy), v7 (copy), t (copy), Modules (copy), CollectionService (copy), v5 (copy) ]]
	local v12 = v1.getWrapperWithYield(p1)
	if not v12 then
		return
	end
	if v12.InitWrappers then
		return
	end
	v12.InitWrappers = true
	if v6 then
		task.spawn(function() --[[ Line: 67 | Upvalues: v12 (copy), Workspace (ref), v7 (ref) ]]
			v12.PlayerData:WaitForChild("Metadata")
			local LastLeave = v12.PlayerData.Metadata.LastLeave
			local function f1() --[[ Line: 72 | Upvalues: Workspace (ref), v7 (ref), LastLeave (copy) ]]
				local v1 = Workspace:GetServerTimeNow()
				if v7 then
					local v2 = Workspace:GetAttribute("lastLeave")
					if v2 then
						v1 = v2
					end
				end
				LastLeave.Value = v1
			end
			table.insert(v12.OnRemoved, f1)
		end)
	end
	local t2 = {}
	for i, v in ipairs(t) do
		local v3 = os.clock()
		local v4 = v[1].new(v12)
		t2[v[2]] = string.format("%.3fs", os.clock() - v3)
		if not v6 and #Modules <= i then
			p1:SetAttribute("InitialWrappers", true)
		end
		if v4.Destroy then
			v12.Maid:GiveTask(v4)
		end
	end
	print(p1, "-", "Loaded all Wrappers", t2)
	if #Modules <= 0 and not v6 then
		p1:SetAttribute("InitialWrappers", true)
	end
	if v6 then
		v12.PlayerData.Metadata.LastLogin.Value = DateTime.now().UnixTimestamp
		CollectionService:AddTag(p1, v5.LoadedPlayerTag)
	else
		p1:SetAttribute("LoadedWrappers", true)
	end
	v1.Loaded = true
	v12.WrappersLoaded = true
	v1.PlayerAdded:Fire(p1)
end
local t2 = {}
for i, v in ipairs(list) do
	if v.DataModel ~= "Server" or v6 then
		for k, v8 in pairs(v.Modules) do
			t[#t + 1] = { Sonar(v8), v8 }
		end
	end
end
v2.bindToTag(v5.PlayerInitTag, initWrappers)
if v6 then
	return t2
end
v3.new(v5.PlayerInitTag, v1):Init()
local v8 = os.clock()
v1.GetClient()
print("Yielding for local player wrapper:", "took", v4.round(os.clock() - v8, 0.01), "seconds")
local v9 = os.clock()
v2.yieldForAttribute(LocalPlayer, "InitialWrappers")
print("Yielding for wrappers to initialise:", "took", v4.round(os.clock() - v9, 0.01), "seconds")
return t2