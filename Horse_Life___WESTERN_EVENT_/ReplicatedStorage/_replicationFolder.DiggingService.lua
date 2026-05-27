-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("AnalyticsService", "Server")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("WeightedProbability")
local v5 = Sonar("TimeUtils")
local v6 = Sonar("spr")
local v7 = Sonar("Constants")
local DirtRewards = v7.DirtRewards
local PlotRewards = v7.PlotRewards
local t = {}
t.__index = t
local DigDirt = game.ReplicatedStorage.Storage.Assets.Particles.DigDirt
function t.GetDailyReward(p1) --[[ GetDailyReward | Line: 26 | Upvalues: v5 (copy) ]]
	local LastLogin = p1.PlayerData.DiggingPlotsLogin.LastLogin
	if LastLogin.Value ~= 0 and not (LastLogin.Value <= v5.Get()) then
		return false
	end
	LastLogin.Value = v5.Get() + 72000
	local Streak = p1.PlayerData.DiggingPlotsLogin.Streak
	Streak.Value = Streak.Value + 1
	p1.PlayerData.DiggingPlotsLogin.StreakClaimed.Value = false
	return true
end
local t2 = {
	DigDirt = function(p1, p2, p3) --[[ DigDirt | Line: 42 | Upvalues: v3 (copy), HttpService (copy), v4 (copy), DirtRewards (copy), t (copy), v5 (copy), Sonar (copy), PlotRewards (copy), v1 (copy) ]]
		local v12 = v3.getWrapperFromPlayer(p1)
		if not v12 then
			warn("PlayerWrapper not found for " .. p1)
			return
		end
		local EquippedTool = v12.EquippedTool
		if not EquippedTool then
			return
		end
		local v2 = v12:GetItemValue(EquippedTool.ToolData.Name)
		if v2.Value <= 0 then
			v2.Value = 0
			return false, {
				Message = "This tool is worn out!"
			}
		end
		local v32 = v12.PlayerData.DiggingPlots[p2]
		if not v32 then
			warn("PlotData not found for " .. p2)
			return false
		end
		local v42 = if v32.Dug.Value == "" then {} else HttpService:JSONDecode(v32.Dug.Value)
		if v42[tostring(p3)] then
			warn("Already dug " .. p3)
			return false
		end
		v42[tostring(p3)] = true
		if if Random.new():NextNumber(1, 100) <= 50 then true else false then
			local v7 = DirtRewards[v4.getRandomWeightedItem(DirtRewards)]
			if type(v7.Name) == "table" then
				v7.Name = v7.Name[math.random(1, #v7.Name)]
			end
			local Theme = v7.Theme
			if v7.Theme and type(v7.Theme) == "table" then
				Theme = v7.Theme[math.random(1, #v7.Theme)]
			end
			v12:GiveItem({
				Source = "DiggingMinigame",
				IgnoreLimit = true,
				Name = v7.Reward,
				Amount = v7.Amount,
				Theme = Theme
			})
		end
		v12:IncrementMission({
			Type = "Dig",
			Amount = 1
		})
		v32.Dug.Value = HttpService:JSONEncode(v42)
		local t2 = {}
		if t.GetDailyReward(v12) then
			t2.Message = "Free Daily Dig Claimed"
		elseif v12.PlayerData.DiggingPlotsLogin.StreakClaimed.Value or not (v12.PlayerData.DiggingPlotsLogin.Streak.Value >= 3) then
			local v9 = v12:GetItemValue(EquippedTool.ToolData.Name)
			if v9.Value <= 1 then
				v9.Value = 0
			else
				v9.Value = v9.Value - 1
			end
		else
			v12.PlayerData.DiggingPlotsLogin.StreakClaimed.Value = true
			t2.Message = "Bonus Daily Dig Claimed"
		end
		local v10 = true
		for v11, v122 in workspace:WaitForChild("DiggingPlots"):WaitForChild(p2):GetChildren() do
			if v122:IsA("BasePart") and not v42[v122.Name] then
				v10 = false
				break
			end
		end
		if not v10 then
			return true, t2
		end
		if not v32.Completed.Value then
			v32.Completed.Value = true
			v32.CompletedTime.Value = v5.Get()
			v12:IncrementMission({
				Type = "CompleteDigPlot",
				Amount = 1
			})
			local v13 = Sonar("ItemSetService"):_giveHorse(v12, PlotRewards[v32.Name])
			t2.Slot = v13.Name
			v1.ReportResourceEvent(v12.Player, "Source", "HorseSlot", v13.Species.Value, "Digging", 1)
			return true, t2
		end
	end
}
function t.CheckDailyReward() --[[ CheckDailyReward | Line: 155 | Upvalues: v3 (copy), v5 (copy) ]]
	local v1 = v3.GetClient()
	if v1 then
		local LastLogin = v1.PlayerData.DiggingPlotsLogin.LastLogin
		return LastLogin.Value == 0 or LastLogin.Value <= v5.Get()
	else
		warn("PlayerWrapper not found")
		return false
	end
end
function t.CheckPlotCompletion(p1) --[[ CheckPlotCompletion | Line: 171 | Upvalues: HttpService (copy), v5 (copy) ]]
	for v1, v2 in p1.PlayerData.DiggingPlots:GetChildren() do
		local v3 = p1.PlayerData.DiggingPlots[v2.Name]
		local t = {}
		if v3.Completed.Value then
			if v3.Dug.Value ~= "" then
				t = HttpService:JSONDecode(v3.Dug.Value)
			end
			local v52 = true
			for v6, v7 in workspace:WaitForChild("DiggingPlots"):WaitForChild(v2.Name):GetChildren() do
				if v7:IsA("BasePart") and not t[v7.Name] then
					v52 = false
					break
				end
			end
			if v52 and (v2.CompletedTime.Value == 0 or v5.Get() - v2.CompletedTime.Value > 21600) then
				v2.Completed.Value = false
				v2.CompletedTime.Value = 0
				v2.Dug.Value = ""
			end
		end
	end
end
function t.InitPlot(p1) --[[ InitPlot | Line: 202 | Upvalues: v3 (copy), HttpService (copy), v5 (copy), RunService (copy), v6 (copy) ]]
	local v1 = v3.GetClient()
	if not v1 then
		warn("PlayerWrapper not found")
		return false
	end
	local v2 = v1.PlayerData.DiggingPlots[p1.Name]
	if not v2 then
		warn("PlotData not found for " .. p1.Name)
		return false
	end
	local v32 = if v2.Dug.Value == "" then {} else HttpService:JSONDecode(v2.Dug.Value)
	local TimerLabel = p1.DisplayGui.Frame.TimerLabel
	v5.AttachToTime(function() --[[ Line: 218 | Upvalues: v2 (copy), HttpService (ref), p1 (copy), TimerLabel (copy), v5 (ref) ]]
		if v2.Completed.Value then
			local v22 = math.max(0, 21600 - (v5.Get() - v2.CompletedTime.Value))
			if v22 <= 0 then
				TimerLabel.Text = "Dig Away!"
			else
				TimerLabel.Visible = true
				TimerLabel.Text = "Resets in: " .. v5.FormatString(v22)
			end
		else
			local count = 0
			for k in pairs(if v2.Dug.Value == "" then {} else HttpService:JSONDecode(v2.Dug.Value)) do
				count = count + 1
			end
			local count_2 = 0
			for v52, v6 in p1:GetChildren() do
				if v6:IsA("BasePart") then
					count_2 = count_2 + 1
				end
			end
			if count > 0 then
				TimerLabel.Text = string.format("%d/%d LEFT", count_2 - count, count_2)
			else
				TimerLabel.Text = "Dig Away!"
			end
		end
	end)
	for v52, v62 in p1:GetChildren() do
		if v62:IsA("BasePart") then
			if v32[tostring(v62.Name)] then
				v62.Size = Vector3.new(0, 0, 0)
				v62.CanCollide = false
				v62:SetAttribute("IsBeingDug", true)
				continue
			end
			v62.Size = Vector3.new(8, 4, 8)
			v62.CanCollide = true
			v62:SetAttribute("IsBeingDug", false)
		end
	end
	if RunService:IsServer() then
		return true
	end
	v2.Completed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 273 | Upvalues: v2 (copy), HttpService (ref), p1 (copy), v6 (ref) ]]
		if v2.Completed.Value then
			local v1 = if v2.Dug.Value == "" then {} else HttpService:JSONDecode(v2.Dug.Value)
			for v3, v4 in p1:GetChildren() do
				if v4:IsA("BasePart") and v1[tostring(v4.Name)] then
					v4.Size = Vector3.new(0, 0, 0)
					v4.CanCollide = false
				end
			end
		else
			for i = 1, #p1:GetChildren() do
				local v62 = p1:FindFirstChild((tostring(i)))
				if v62 then
					v6.target(v62, 0.5, 5, {
						Size = Vector3.new(8, 4, 8)
					})
					v62.CanCollide = true
					v62:SetAttribute("IsBeingDug", false)
					task.wait(0.1)
				end
			end
		end
	end)
	return true
end
local function forAllChildren(p1, p2) --[[ forAllChildren | Line: 309 ]]
	for v1, v2 in p1:GetChildren() do
		p2(v2)
	end
	return p1.ChildAdded:Connect(p2)
end
function t.Init() --[[ Init | Line: 317 | Upvalues: RunService (copy), v2 (copy), t2 (copy), v3 (copy), v5 (copy), t (copy), HttpService (copy), v6 (copy), DigDirt (copy) ]]
	if RunService:IsServer() then
		v2.GetRemoteFunction("DigRemote").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 320 | Upvalues: t2 (ref) ]]
			if t2[p2] then
				return t2[p2](p1, p3, p4)
			else
				warn("Action not found for " .. p2)
			end
		end
		v3.bindToPlayers(function(p1) --[[ Line: 328 | Upvalues: v3 (ref), RunService (ref), v5 (ref), t (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not RunService:IsServer() then
				return
			end
			v1.Maid:GiveTask(v5.AttachToTime(function() --[[ Line: 334 | Upvalues: v1 (copy), t (ref) ]]
				if not v1.PlayerData:FindFirstChild("DiggingPlots") then
					return
				end
				t.CheckPlotCompletion(v1)
			end))
			v1.Maid:GiveTask(v5.AttachToTime(function() --[[ Line: 340 | Upvalues: v1 (copy), v5 (ref) ]]
				if not v1.PlayerData:FindFirstChild("DiggingPlotsLogin") then
					return
				end
				local LastLogin = v1.PlayerData.DiggingPlotsLogin.LastLogin
				if LastLogin.Value == 0 or not (v5.Get() > LastLogin.Value + 14400) then
					return
				end
				v1.PlayerData.DiggingPlotsLogin.Streak.Value = 0
			end))
		end, function(p1) --[[ Line: 350 ]] end)
		return
	end
	local DiggingPlots = workspace:FindFirstChild("DiggingPlots")
	if not DiggingPlots then
		return
	end
	local function f1(p1) --[[ Line: 359 | Upvalues: t (ref) ]]
		t.InitPlot(p1)
	end
	for v22, v32 in DiggingPlots:GetChildren() do
		t.InitPlot(v32)
	end
	DiggingPlots.ChildAdded:Connect(f1)
	local function f4(p1) --[[ Line: 364 | Upvalues: v3 (ref), HttpService (ref), v6 (ref), DigDirt (ref) ]]
		local v1 = v3.GetClient().PlayerData.DiggingPlots[p1.Name]
		if v1 then
			v1.Dug:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 368 | Upvalues: v1 (copy), HttpService (ref), p1 (copy), v6 (ref), DigDirt (ref) ]]
				local v12 = if v1.Dug.Value == "" then {} else HttpService:JSONDecode(v1.Dug.Value)
				for v3, v4 in p1:GetChildren() do
					if v4:IsA("BasePart") and (v12[v4.Name] and not v4:GetAttribute("IsBeingDug")) then
						task.wait(0.1)
						v4:SetAttribute("IsBeingDug", true)
						v6.target(v4, 0.5, 5, {
							Size = Vector3.new(0, 0, 0)
						})
						if not v4:FindFirstChild("DigDirt") then
							local v5 = DigDirt:Clone()
							v5.Parent = v4
							for v62, v7 in v5:GetChildren() do
								v7:Emit(v7:GetAttribute("EmitCount"))
							end
							task.delay(2, function() --[[ Line: 392 | Upvalues: v5 (copy) ]]
								v5:Destroy()
							end)
						end
						v4.CanCollide = false
					end
				end
			end)
		end
	end
	for v52, v62 in DiggingPlots:GetChildren() do
		f4(v62)
	end
	DiggingPlots.ChildAdded:Connect(f4)
end
t.Init()
return t