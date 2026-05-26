-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EventsConfig = ReplicatedStorage:FindFirstChild("Configs"):FindFirstChild("DefaultConfigs"):FindFirstChild("EventsConfig")
local EventConfig = EventsConfig:FindFirstChild("EventConfig")
RunService:IsStudio()
local v2 = (if game.GameId == 5749134964 then true else false) and false
function t.Init(p1) --[[ Init | Line: 23 | Upvalues: t (copy), EventConfig (copy), EventsConfig (copy), v2 (copy) ]]
	t.Event = "Western"
	t.EventsData = {}
	for v22, v3 in script:GetChildren() do
		local v1
		if v3:IsA("ModuleScript") then
			local v4 = require(v3)
			local v5 = nil
			local v6 = (if v5 then v5 else v4.Name) or v3.Name
			v4.Name = v6
			if EventConfig and script ~= EventsConfig then
				v1 = v6
				for v7, v8 in EventConfig:GetChildren() do
					if v8:IsA("Folder") or v8:IsA("ModuleScript") then
						local v9 = v8.Name
						local v10 = nil
						v4[v9] = (if v10 then v10 else v4[v9]) or {}
					end
				end
			else
				v1 = v6
			end
			t.EventsData[v1] = v4
		end
	end
	for v12, v13 in t.EventsData do
		local StartTime = v13.Data.StartTime
		local EndTime = v13.Data.EndTime
		if v2 then
			local v14 = DateTime.now()
			for v15, v16 in v13.Missions do
				v16.UnlockTime = v14
			end
			for v17, v18 in v13.ShopItems do
				v18.StartTime = v14
				v18.EndTime = nil
			end
			for v19, v20 in v13.Products do
				v20.StartTime = v14
				v20.EndTime = nil
			end
		end
		for v21, v22 in v13.ShopItems do
			v22.StartTime = v22.StartTime or StartTime
			v22.EndTime = v22.EndTime or EndTime
		end
		for v23, v24 in v13.Products do
			v24.EndTime = v24.EndTime or EndTime
		end
		for v25, v26 in { v13.Missions, v13.Products, v13.ShopItems } do
			for v27, v28 in { "EndTime", "StartTime", "UnlockTime" } do
				for v29, v30 in v26 do
					local v31 = v30[v28]
					if typeof(v31) == "DateTime" then
						v30[v28] = DateTime.fromUnixTimestamp(v31.UnixTimestamp - 28800)
					end
				end
			end
		end
	end
end
t:Init()
t.Init = nil
return t