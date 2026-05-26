-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("AnalyticsService")
local v5 = Sonar("DataUpdateService", {
	Context = "Server"
})
local v6 = Sonar("InstanceUtils")
local v7 = Sonar("Constants")
local IS_SERVER = v7.IS_SERVER
local IS_STUDIO = v7.IS_STUDIO
local v8 = v2.GetConfig("Onboarding")()
local TutorialStages = v8.TutorialStages
local ContextualStages = v8.ContextualStages
local TutorialAnalyticsFunnel = v8.TutorialAnalyticsFunnel
function t.GetTutorialStage(p1) --[[ GetTutorialStage | Line: 28 | Upvalues: TutorialStages (copy) ]]
	return TutorialStages[p1]
end
function t.GetConfigValue(p1) --[[ GetConfigValue | Line: 32 | Upvalues: v8 (copy) ]]
	return v8[p1]
end
function t.HasCompletedTutorial(p1) --[[ HasCompletedTutorial | Line: 36 ]]
	return p1.PlayerData.Onboarding.TutorialStage.Value == "Completed"
end
function t.CanSkipTutorial(p1) --[[ CanSkipTutorial | Line: 40 | Upvalues: v8 (copy) ]]
	if v8.SkipPlayers and v8.SkipPlayers[p1.Player.Name] then
		return true
	end
	if v8.CanSkipTutorial then
		return v8.CanSkipTutorial(p1)
	else
		return false
	end
end
function t.GetTutorialStageForPlayer(p1) --[[ GetTutorialStageForPlayer | Line: 54 | Upvalues: t (copy) ]]
	if t.HasCompletedTutorial(p1) then
		return "Completed"
	end
	if #p1.PlayerData.Onboarding.TutorialStage.Value <= 0 then
		return "Start"
	else
		return p1.PlayerData.Onboarding.TutorialStage.Value
	end
end
function t.GetCurrentTutorialStage(p1) --[[ GetCurrentTutorialStage | Line: 65 | Upvalues: t (copy) ]]
	local v1 = t.GetTutorialStageForPlayer(p1)
	if not v1 then
		return nil
	end
	local v2 = t.GetTutorialStage(v1)
	if v2 then
		return v2
	else
		return nil
	end
end
function t.RunTutorialStage(p1, p2, ...) --[[ RunTutorialStage | Line: 79 | Upvalues: t (copy) ]]
	local v1 = t.GetTutorialStage(p2)
	if not v1 then
		return nil
	end
	if v1[p1] then
		return v1[p1](...)
	else
		return nil
	end
end
function t.SetTutorialStage(p1, p2) --[[ SetTutorialStage | Line: 92 ]]
	p1.PlayerData.Onboarding.TutorialStage.Value = p2
end
function t.RequestTutorialStage(p1, ...) --[[ RequestTutorialStage | Line: 96 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("SetTutorialStageRemote"):InvokeServer(p1, ...)
end
function t.PostTutorialAnalytics(p1, p2, ...) --[[ PostTutorialAnalytics | Line: 100 | Upvalues: TutorialAnalyticsFunnel (copy), v4 (copy), IS_STUDIO (copy) ]]
	local v1 = table.find(TutorialAnalyticsFunnel, p2)
	if not v1 then
		error("\226\157\140 OnboardingService, Tutorial funnel step " .. p2 .. " does not exist")
	end
	if not p1._postedAnalyticsFunnelSteps.Tutorial then
		p1._postedAnalyticsFunnelSteps.Tutorial = {}
	end
	if p1._postedAnalyticsFunnelSteps.Tutorial[p2] then
		return
	end
	p1._postedAnalyticsFunnelSteps.Tutorial[p2] = true
	local v2 = tick()
	local _lastTutorialFunnelStepTime = p1._lastTutorialFunnelStepTime
	if not _lastTutorialFunnelStepTime then
		_lastTutorialFunnelStepTime = math.floor((tick()))
	end
	local t = {
		Player = p1.Player,
		Value = v2 - _lastTutorialFunnelStepTime,
		Step = v1
	}
	local t2 = {
		{
			Key = "FunnelName",
			Value = "Tutorial"
		},
		{
			Key = "StageName",
			Value = p2
		}
	}
	local t3 = {
		Key = "StageId"
	}
	t3.Value = next({ ... }) and tostring(table.unpack(...)) or "NotApplicable"
	t2[3] = t3
	t.Data = t2
	local v8 = v4.ReportEvent("ProgressionEvent", t)
	if v8 and IS_STUDIO then
		print("\240\159\148\167 OnboardingService, Posted tutorial analytics payload:", p1.Player.Name, v8)
	end
	p1._lastTutorialFunnelStepTime = math.floor((tick()))
end
function t.Init(p1) --[[ Init | Line: 134 | Upvalues: TutorialStages (copy), ContextualStages (copy), IS_SERVER (copy), v5 (copy), v6 (copy), v3 (copy), v1 (copy), t (copy) ]]
	assert(TutorialStages.Completed ~= nil, "\226\157\140 OnboardingService, Tutorial stage \'Completed\' is required, add to OnboardingConfig.TutorialStages")
	assert(TutorialStages.Start ~= nil, "\226\157\140 OnboardingService, Tutorial stage \'Start\' is required, add to OnboardingConfig.TutorialStages")
	for v12, v2 in TutorialStages do
		v2.Name = v12
	end
	for v32, v4 in ContextualStages do
		v4.Name = v32
	end
	if IS_SERVER then
		v5.AddRigDataCallback(function(p1) --[[ Line: 149 | Upvalues: v6 (ref) ]]
			local Onboarding = p1:FindFirstChild("Onboarding")
			if not Onboarding then
				Onboarding = v6.Create("Folder", {
					Name = "Onboarding",
					Parent = p1
				})
			end
			if Onboarding:FindFirstChild("TutorialStage") then
				return
			end
			v6.Create("StringValue", {
				Name = "TutorialStage",
				Value = "Start",
				Parent = Onboarding
			})
		end)
	end
	if not IS_SERVER then
		v1.bindToPlayers({
			OnInit = function(p1_2, p2_2) --[[ OnInit | Line: 201 | Upvalues: IS_SERVER (ref), t (ref) ]]
				p2_2._postedAnalyticsFunnelSteps = {}
				if not IS_SERVER then
					return
				end
				local v1 = if t.CanSkipTutorial(p2_2) then t.GetTutorialStage("Completed") else t.GetCurrentTutorialStage(p2_2)
				if not v1 then
					return
				end
				t.SetTutorialStage(p2_2, v1.Name)
				t.RunTutorialStage("Init", v1.Name, p2_2)
			end,
			AfterInit = function(p1_2, p2_2) --[[ AfterInit | Line: 222 | Upvalues: IS_SERVER (ref), t (ref) ]]
				if not IS_SERVER then
					return
				end
				local v1 = t.GetCurrentTutorialStage(p2_2)
				if not v1 then
					return
				end
				t.RunTutorialStage("InitWithWrapper", v1.Name, p2_2)
			end
		})
		return
	end
	v3.GetRemoteFunction("SetTutorialStageRemote").OnServerInvoke = function(p1, p2, ...) --[[ Line: 169 | Upvalues: v1 (ref), t (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		if not t.GetTutorialStage(p2) then
			return
		end
		local v2, v3 = t.RunTutorialStage("Start", p2, v12, ...)
		if v2 then
			t.SetTutorialStage(v12, p2)
			return true
		else
			return v3
		end
	end
	v3.GetRemoteEvent("PostTutorialAnalyticsRemote").OnServerEvent:Connect(function(p1, p2, ...) --[[ Line: 189 | Upvalues: v1 (ref), t (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if v12 then
			t.PostTutorialAnalytics(v12, p2, ...)
		end
	end)
	v1.bindToPlayers({
		OnInit = function(p1_2, p2_2) --[[ OnInit | Line: 201 | Upvalues: IS_SERVER (ref), t (ref) ]]
			p2_2._postedAnalyticsFunnelSteps = {}
			if not IS_SERVER then
				return
			end
			local v1 = if t.CanSkipTutorial(p2_2) then t.GetTutorialStage("Completed") else t.GetCurrentTutorialStage(p2_2)
			if not v1 then
				return
			end
			t.SetTutorialStage(p2_2, v1.Name)
			t.RunTutorialStage("Init", v1.Name, p2_2)
		end,
		AfterInit = function(p1_2, p2_2) --[[ AfterInit | Line: 222 | Upvalues: IS_SERVER (ref), t (ref) ]]
			if not IS_SERVER then
				return
			end
			local v1 = t.GetCurrentTutorialStage(p2_2)
			if not v1 then
				return
			end
			t.RunTutorialStage("InitWithWrapper", v1.Name, p2_2)
		end
	})
end
t:Init()
return t