-- https://lua.expert/
local t = {}
t.__index = t
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(game.ReplicatedStorage.Sonar)
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
Sonar("PlayerUtils")
if not v1 then
	Sonar("NotificationsClient")
end
Sonar("ItemDataService")
Sonar("DataUtils")
Sonar("EquipmentService")
Sonar("NotificationsService")
if not v1 then
	Sonar("IssueResponseClient")
end
if not v1 then
	Sonar("GuiManager")
end
if not v1 then
	Sonar("TabManager")
end
Sonar("FormatNumber")
Sonar("FormatString")
if not v1 then
	Sonar("GridSort")
end
local v4 = Sonar("EventUtils")
local v5 = not v1 and Sonar("FarmingClient")
if not v1 then
	v3.GetClient()
end
local LocalPlayer = game.Players.LocalPlayer
local v6
if not LocalPlayer then
	v6 = {}
	function t.new(p1_2) --[[ new | Line: 35 | Upvalues: t (copy), v2 (copy), v1 (copy), v6 (copy) ]]
		local v22 = setmetatable({}, t)
		v22.Building = p1_2
		v22.Model = p1_2.Model
		v22.IsOwner = v22.Building.Player == game.Players.LocalPlayer
		v22.Maid = v2.new()
		v22.TimeElapsed = 0
		if v1 then
			v22:_initServer()
		else
			v22:_initClient()
		end
		v6[v22.Model] = v22
		return v22
	end
	function t.Destroy(p1_2) --[[ Destroy | Line: 57 ]]
		p1_2.Maid:Destroy()
		setmetatable(p1_2, nil)
	end
	function t._initServer(p1_2) --[[ _initServer | Line: 62 | Upvalues: v4 (copy) ]]
		p1_2.InteractionData = p1_2.Building:GetOrCreateInteractionData()
		p1_2.TimeRemainingValue = p1_2.InteractionData.TimeRemaining
		p1_2.Maid:GiveTask(v4.spawnLoop(function() --[[ Line: 66 | Upvalues: p1_2 (copy) ]]
			if p1_2.InteractionData.Seed.Value == "" then
				return
			end
			p1_2.TimeElapsed = p1_2.TimeElapsed + 1
		end, 1))
		p1_2.Maid:GiveTask(function() --[[ Line: 73 | Upvalues: p1_2 (copy) ]]
			local TimeRemainingValue = p1_2.TimeRemainingValue
			TimeRemainingValue.Value = TimeRemainingValue.Value - p1_2.TimeElapsed
		end)
	end
	function t._initClient(p1_2) --[[ _initClient | Line: 78 | Upvalues: v5 (copy) ]]
		if p1_2.IsOwner then
			p1_2.InteractionData = p1_2.Building:GetOrCreateInteractionData()
			p1_2.Plot = v5.new(p1_2.Model, p1_2.InteractionData, true)
			p1_2.Maid:GiveTask(function() --[[ Line: 83 | Upvalues: p1_2 (copy) ]]
				p1_2.Plot:Destroy()
			end)
		end
	end
	function t.GetByData(p1_2, p2_2) --[[ GetByData | Line: 88 | Upvalues: v3 (copy), v6 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1_2)
		if not v1 then
			return "NoWrapper"
		end
		local v2 = v1.PlayerData.PlotSaves.Utility.FarmingPlot:FindFirstChild(p2_2)
		local v32 = nil
		for v4, v5 in v6 do
			if v5.InteractionData == v2 then
				v32 = v5
				break
			end
		end
		if v32 then
			return v32
		else
			return nil
		end
	end
	function t.Init(p1_2) --[[ Init | Line: 109 | Upvalues: v1 (copy) ]] end
	t:Init()
	return t
end
LocalPlayer:WaitForChild("PlayerGui")
v6 = {}
function t.new(p1_2) --[[ new | Line: 35 | Upvalues: t (copy), v2 (copy), v1 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Building = p1_2
	v22.Model = p1_2.Model
	v22.IsOwner = v22.Building.Player == game.Players.LocalPlayer
	v22.Maid = v2.new()
	v22.TimeElapsed = 0
	if v1 then
		v22:_initServer()
	else
		v22:_initClient()
	end
	v6[v22.Model] = v22
	return v22
end
function t.Destroy(p1_2) --[[ Destroy | Line: 57 ]]
	p1_2.Maid:Destroy()
	setmetatable(p1_2, nil)
end
function t._initServer(p1_2) --[[ _initServer | Line: 62 | Upvalues: v4 (copy) ]]
	p1_2.InteractionData = p1_2.Building:GetOrCreateInteractionData()
	p1_2.TimeRemainingValue = p1_2.InteractionData.TimeRemaining
	p1_2.Maid:GiveTask(v4.spawnLoop(function() --[[ Line: 66 | Upvalues: p1_2 (copy) ]]
		if p1_2.InteractionData.Seed.Value == "" then
			return
		end
		p1_2.TimeElapsed = p1_2.TimeElapsed + 1
	end, 1))
	p1_2.Maid:GiveTask(function() --[[ Line: 73 | Upvalues: p1_2 (copy) ]]
		local TimeRemainingValue = p1_2.TimeRemainingValue
		TimeRemainingValue.Value = TimeRemainingValue.Value - p1_2.TimeElapsed
	end)
end
function t._initClient(p1_2) --[[ _initClient | Line: 78 | Upvalues: v5 (copy) ]]
	if p1_2.IsOwner then
		p1_2.InteractionData = p1_2.Building:GetOrCreateInteractionData()
		p1_2.Plot = v5.new(p1_2.Model, p1_2.InteractionData, true)
		p1_2.Maid:GiveTask(function() --[[ Line: 83 | Upvalues: p1_2 (copy) ]]
			p1_2.Plot:Destroy()
		end)
	end
end
function t.GetByData(p1_2, p2_2) --[[ GetByData | Line: 88 | Upvalues: v3 (copy), v6 (copy) ]]
	local v1 = v3.getWrapperFromPlayer(p1_2)
	if not v1 then
		return "NoWrapper"
	end
	local v2 = v1.PlayerData.PlotSaves.Utility.FarmingPlot:FindFirstChild(p2_2)
	local v32 = nil
	for v4, v5 in v6 do
		if v5.InteractionData == v2 then
			v32 = v5
			break
		end
	end
	if v32 then
		return v32
	else
		return nil
	end
end
function t.Init(p1_2) --[[ Init | Line: 109 | Upvalues: v1 (copy) ]] end
t:Init()
return t