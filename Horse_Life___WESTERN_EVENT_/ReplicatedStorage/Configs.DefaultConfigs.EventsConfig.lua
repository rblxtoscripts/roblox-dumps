-- https://lua.expert/
local v2 = if script.Parent.Name == "DefaultConfigs" then "" else "Easter"
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v4 = (game:GetService("RunService"):IsStudio() and true or game.GameId == 5749134964) and true
local v5 = v4 and true
local EventsConfig = ReplicatedStorage:FindFirstChild("Configs"):FindFirstChild("DefaultConfigs"):FindFirstChild("EventsConfig")
local EventConfig = EventsConfig:FindFirstChild("EventConfig")
function t.Init(p1) --[[ Init | Line: 40 | Upvalues: t (copy), v2 (ref), EventConfig (copy), EventsConfig (copy), v4 (copy), v5 (copy) ]]
	t.Event = v2
	t.EventsData = {}
	for v22, v3 in script:GetChildren() do
		local v1
		if v3:IsA("ModuleScript") then
			local v42 = require(v3)
			local v52 = nil
			local v6 = (if v52 then v52 else v42.Name) or v3.Name
			v42.Name = v6
			if EventConfig and script ~= EventsConfig then
				v1 = v6
				for v7, v8 in EventConfig:GetChildren() do
					if v8:IsA("Folder") or v8:IsA("ModuleScript") then
						local v9 = v8.Name
						local v10 = nil
						v42[v9] = (if v10 then v10 else v42[v9]) or {}
					end
				end
			else
				v1 = v6
			end
			t.EventsData[v1] = v42
		end
	end
	if not v4 or script == EventsConfig then
		return
	end
	local UnixTimestamp = DateTime.fromIsoDate((string.match(DateTime.now():ToIsoDate(), "(.*)T"))).UnixTimestamp
	local v14 = DateTime.fromUnixTimestamp(UnixTimestamp)
	local v15 = DateTime.fromUnixTimestamp(UnixTimestamp + 86400)
	local v16 = t.EventsData[v2]
	v16.StartTime = v14
	v16.EndTime = v15
	for v17, v18 in v16.Products do
		v18.StartTime = v14
		v18.EndTime = v15
	end
	if not v16.Missions then
		return
	end
	local count = 0
	for v19, v20 in v16.Missions do
		if v20.UnlockTime then
			if v5 then
				v20.UnlockTime = DateTime.fromUnixTimestamp(UnixTimestamp + count * 60)
				count = count + 1
				continue
			end
			v20.UnlockTime = v14
		end
	end
end
t:Init()
t.Init = nil
return t