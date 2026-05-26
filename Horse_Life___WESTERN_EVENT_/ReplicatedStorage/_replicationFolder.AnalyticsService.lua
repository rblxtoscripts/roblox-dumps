-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AnalyticsService = game:GetService("AnalyticsService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PackageImportUtils")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("PlaceTypeService")
local v4 = Sonar("RemoteUtils")
local v5 = game:GetService("RunService"):IsStudio()
local v6 = game:GetService("RunService"):IsServer()
local v7 = v3.IsTestGame()
local v8 = v2.GetConfig("Analytics")()
local v9 = v1.Import("GameAnalytics")
local v10 = v1.Import("Gamebeast")
local function sanitiseString(p1) --[[ sanitiseString | Line: 90 ]]
	local v1 = tostring(p1):gsub("%s+", ""):gsub("%(", ""):gsub("%)", ""):gsub("&", ""):gsub("\'", "")
	return tonumber(v1) or v1
end
local function getPlayerPosition(p1) --[[ getPlayerPosition | Line: 105 ]]
	local Character = p1.Character
	if Character then
		return Character:GetPivot().Position
	else
		return nil
	end
end
local function postGameBeastEvent(p1, p2, p3, p4) --[[ postGameBeastEvent | Line: 119 | Upvalues: v10 (ref) ]]
	local t = {}
	for v1, v2 in p3 do
		t[v2.Key] = v2.Value
	end
	t.Amount = p4
	local Markers = v10:GetService("Markers")
	local Character = p1.Character
	Markers:SendPlayerMarker(p1, p2, t, if Character then Character:GetPivot().Position else nil)
end
local function getValueFromKey(p1, p2) --[[ getValueFromKey | Line: 134 ]]
	for v1, v2 in p2.Data do
		if v2.Key == p1 then
			return v2.Value
		end
	end
	return nil
end
local t2 = {
	GameAnalytics = {
		Init = function(p1, p2) --[[ Init | Line: 146 | Upvalues: v9 (ref), v6 (copy), v5 (copy), v7 (copy) ]]
			v9 = p1.Get()
			if not v6 then
				v9:initClient()
				return
			end
			v9:setEnabledInfoLog(false)
			v9:setEnabledVerboseLog(false)
			v9:configureBuild(if v5 or v7 then "STUDIO" else tostring(game.PlaceVersion))
			v9:initServer({
				gameKey = p2.GameKey,
				secretKey = p2.SecretKey,
				availableCustomDimensions01 = p2.AvailableCustomDimensions01
			})
		end,
		Get = function() --[[ Get | Line: 163 | Upvalues: v9 (ref) ]]
			return v9()
		end,
		DesignEvent = function(p1, p2) --[[ DesignEvent | Line: 167 | Upvalues: v9 (ref) ]]
			local EventId = p2.EventId
			for v1, v2 in p2.Data do
				EventId = EventId .. ":" .. v2.Value
			end
			v9:addDesignEvent(p1.UserId, {
				eventId = EventId,
				value = p2.Value
			})
		end,
		ProgressionEvent = function(p1, p2) --[[ ProgressionEvent | Line: 177 | Upvalues: v9 (ref) ]]
			local t = {
				progressionStatus = "Complete"
			}
			local v2
			do
				local __inline_returned = false
				for v3, v4 in p2.Data do
					if v4.Key == "FunnelName" then
						v2 = v4.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v2 = nil
				end
			end
			t.progression01 = v2
			local v5
			do
				local __inline_returned = false
				for v6, v7 in p2.Data do
					if v7.Key == "StageId" then
						v5 = v7.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v5 = nil
				end
			end
			t.progression02 = v5
			local v8
			do
				local __inline_returned = false
				for v92, v10 in p2.Data do
					if v10.Key == "StageName" then
						v8 = v10.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v8 = nil
				end
			end
			t.progression03 = v8
			t.score = p2.Value
			v9:addProgressionEvent(p1.UserId, t)
		end,
		ResourceEvent = function(p1, p2) --[[ ResourceEvent | Line: 186 | Upvalues: v9 (ref) ]]
			local v1
			do
				local __inline_returned = false
				for v2, v3 in p2.Data do
					if v3.Key == "SourceLocation" then
						v1 = v3.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v1 = nil
				end
			end
			local v4
			do
				local __inline_returned = false
				for v5, v6 in p2.Data do
					if v6.Key == "ItemPurchased" then
						v4 = v6.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v4 = nil
				end
			end
			if v4 then
				v1 = v1 .. "_" .. v4
			end
			local t = {}
			local v8
			do
				local __inline_returned = false
				for v92, v10 in p2.Data do
					if v10.Key == "FlowType" then
						v8 = v10.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v8 = nil
				end
			end
			t.flowType = v8
			local v11
			do
				local __inline_returned = false
				for v12, v13 in p2.Data do
					if v13.Key == "ItemName" then
						v11 = v13.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v11 = nil
				end
			end
			if not v11 then
				do
					local __inline_returned = false
					for v14, v15 in p2.Data do
						if v15.Key == "Currency" then
							v11 = v15.Value
							__inline_returned = true
							break
						end
					end
					if not __inline_returned then
						v11 = nil
					end
				end
			end
			local v17
			do
				local __inline_returned = false
				for v18, v19 in p2.Data do
					if v19.Key == "Variation" then
						v17 = v19.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v17 = nil
				end
			end
			t.currency = v11 .. "_" .. (v17 or "")
			local v20
			do
				local __inline_returned = false
				for v21, v22 in p2.Data do
					if v22.Key == "ItemType" then
						v20 = v22.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v20 = nil
				end
			end
			t.itemType = v20
			t.itemId = v1
			t.amount = p2.Value
			v9:addResourceEvent(p1.UserId, t)
		end,
		BusinessEvent = function(p1, p2) --[[ BusinessEvent | Line: 202 | Upvalues: v9 (ref) ]]
			local t = {
				amount = p2.Value
			}
			local v2
			do
				local __inline_returned = false
				for v3, v4 in p2.Data do
					if v4.Key == "ItemType" then
						v2 = v4.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v2 = nil
				end
			end
			t.itemType = v2
			local v5
			do
				local __inline_returned = false
				for v6, v7 in p2.Data do
					if v7.Key == "ItemId" then
						v5 = v7.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v5 = nil
				end
			end
			t.itemId = v5
			local v8
			do
				local __inline_returned = false
				for v92, v10 in p2.Data do
					if v10.Key == "CartType" then
						v8 = v10.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v8 = nil
				end
			end
			t.cartType = v8
			v9:addBusinessEvent(p1.UserId, t)
		end
	},
	Gamebeast = {
		Init = function(p1, p2) --[[ Init | Line: 212 | Upvalues: v10 (ref), v6 (copy), v7 (copy) ]]
			v10 = p1.Get()
			if not v6 then
				v10:Setup()
				return
			end
			local t = {
				key = p2.GameKey
			}
			local t2 = {}
			t2.environment = if v7 then "studio" else nil
			t.sdkSettings = t2
			v10:Setup(t)
		end,
		Get = function() --[[ Get | Line: 224 | Upvalues: v10 (ref) ]]
			return v10()
		end,
		DesignEvent = function(p1, p2) --[[ DesignEvent | Line: 228 | Upvalues: postGameBeastEvent (copy) ]]
			postGameBeastEvent(p1, p2.EventId, p2.Data, p2.Value)
		end,
		ProgressionEvent = function(p1, p2) --[[ ProgressionEvent | Line: 231 | Upvalues: postGameBeastEvent (copy) ]]
			postGameBeastEvent(p1, "Progression", p2.Data, p2.Value)
		end,
		ResourceEvent = function(p1, p2) --[[ ResourceEvent | Line: 234 | Upvalues: postGameBeastEvent (copy) ]]
			postGameBeastEvent(p1, "Resource", p2.Data, p2.Value)
		end,
		BusinessEvent = function(p1, p2) --[[ BusinessEvent | Line: 237 | Upvalues: postGameBeastEvent (copy) ]]
			postGameBeastEvent(p1, "Business", p2.Data, p2.Value)
		end
	},
	Roblox = {
		Get = function() --[[ Get | Line: 243 | Upvalues: AnalyticsService (copy) ]]
			return AnalyticsService
		end,
		ProgressionEvent = function(p1, p2) --[[ ProgressionEvent | Line: 247 | Upvalues: AnalyticsService (copy) ]]
			local t = {}
			local v2
			do
				local __inline_returned = false
				for v3, v4 in p2.Data do
					if v4.Key == "StageId" then
						v2 = v4.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v2 = nil
				end
			end
			t[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = v2
			local v8
			do
				local __inline_returned = false
				for v9, v10 in p2.Data do
					if v10.Key == "StageName" then
						v8 = v10.Value
						__inline_returned = true
						break
					end
				end
				if not __inline_returned then
					v8 = nil
				end
			end
			AnalyticsService:LogOnboardingFunnelStepEvent(p1, p2.Step or 100, v8, t)
		end
	}
}
function t.GetService(p1, p2) --[[ GetService | Line: 260 | Upvalues: t2 (copy), t (copy) ]]
	local v1 = t2[p2]
	if not v1 then
		return nil
	end
	if not t.IsServiceEnabled(p2) then
		return nil
	end
	local v2 = v1.Get()
	if v2 then
		return v2
	else
		return nil
	end
end
function t.IsEnabled(p1) --[[ IsEnabled | Line: 283 | Upvalues: t (copy), v8 (copy) ]]
	if p1 then
		return t.IsServiceEnabled(p1)
	else
		return v8.Enabled
	end
end
function t.IsServiceEnabled(p1) --[[ IsServiceEnabled | Line: 295 | Upvalues: v8 (copy) ]]
	local v1 = v8[p1]
	if v1 then
		return v1.Initialised
	else
		return false
	end
end
function t.ReportEvent(p1, p2) --[[ ReportEvent | Line: 313 | Upvalues: v6 (copy), t (copy), sanitiseString (copy), t2 (copy), v7 (copy) ]]
	if not v6 then
		return
	end
	if not t.IsEnabled() then
		return
	end
	if p2.EventId then
		p2.EventId = sanitiseString(p2.EventId)
	end
	for v1, v2 in p2 do
		if type(v2) == "string" or type(v2) == "number" then
			p2[v1] = sanitiseString(v2)
		end
	end
	for v3, v4 in p2.Data do
		v4.Key = sanitiseString(v4.Key)
		v4.Value = sanitiseString(v4.Value)
	end
	local t3 = {}
	local v5 = p2.Services or {}
	if #v5 > 0 then
		for v62, v72 in v5 do
			t3[v72] = t2[v72]
		end
	else
		t3 = t2
	end
	for v8, v9 in t3 do
		if v9.Initialised or v5[v8] and t:_initService(v8, true) then
			if v8 == "GameAnalytics" and v7 then
				print("\240\159\148\167 AnalyticsService", v8 .. ":", "Not sending analytics to " .. v8 .. " for " .. p1 .. " event because this is a test game.", p2)
				continue
			end
			local v10 = v9[p1]
			if v10 then
				local v11, v12 = pcall(function() --[[ Line: 365 | Upvalues: v10 (copy), p2 (copy) ]]
					return v10(p2.Player, p2)
				end)
				if not v11 then
					warn("\226\154\160\239\184\143 AnalyticsService", v8 .. ":", "Failed to send analytics:", v12)
				end
			end
		end
	end
	return p2
end
function t.ReportLoadingFunnelEvent(p1, p2) --[[ ReportLoadingFunnelEvent | Line: 378 | Upvalues: v6 (copy), t (copy), v5 (copy) ]]
	if not v6 then
		return
	end
	if not t.IsEnabled() then
		return
	end
	if type(p2) ~= "table" then
		p2 = {
			FunnelType = "Client",
			Step = p2
		}
	end
	local v1, v2 = t:_getLoadingFunnelStep(p2.Step, p2.FunnelType)
	if not v1 then
		error("\226\157\140 AnalyticsService, Loading funnel step " .. p2.Step .. " does not exist")
	end
	local v3 = t.ReportEvent("ProgressionEvent", {
		Player = p1,
		Step = v1,
		Data = {
			{
				Key = "FunnelName",
				Value = p2.FunnelType .. "Loading"
			},
			{
				Key = "StageName",
				Value = v2
			},
			{
				Key = "StageId",
				Value = v1
			}
		},
		Services = { "Gamebeast", "Roblox" }
	})
	if not (v3 and v5) then
		return
	end
	print("\240\159\148\167 AnalyticsService, Posted loading funnel analytics:", p1.Name, v3)
end
function t._initService(p1, p2, p3) --[[ _initService | Line: 418 | Upvalues: v8 (copy), t2 (copy) ]]
	local v1 = v8[p2]
	if not v1 then
		warn("\226\154\160\239\184\143 AnalyticsService, AnalyticsConfig for " .. p2 .. " not found. Try adding it to Constants.AnalyticsConfig.")
		return
	end
	if not (v1.Enabled or p3) then
		return
	end
	local v2 = t2[p2]
	if not v2 then
		warn("\226\154\160\239\184\143 AnalyticsService, Service " .. p2 .. " not found. Try adding it to AnalyticsService.Services.")
		return
	end
	if v2.Init then
		v2.Init(v2, v1)
		v2.Initialised = true
	end
end
function t._getLoadingFunnelStep(p1, p2, p3) --[[ _getLoadingFunnelStep | Line: 443 | Upvalues: v8 (copy) ]]
	local v1 = p3 == "Client" and v8.LoadingAnalyticsFunnel or (if p3 == "Server" then v8.ServerLoadingAnalyticsFunnel else false)
	if type(p2) == "number" then
		return p2, v1[p2]
	end
	if type(p2) ~= "string" then
		return nil, nil
	end
	local v2 = table.find(v1, p2)
	if v2 then
		return v2, v1[v2]
	else
		return nil
	end
end
function t.Init(p1) --[[ Init | Line: 461 | Upvalues: t (copy), t2 (copy), v6 (copy), Players (copy), v4 (copy) ]]
	if p1.Initialised then
		return
	end
	p1.Initialised = true
	if t.IsEnabled() then
		for v1, v2 in t2 do
			p1:_initService(v1)
		end
		if v6 then
			Players.PlayerAdded:Connect(function(p12) --[[ Line: 475 | Upvalues: p1 (copy) ]]
				p1.ReportLoadingFunnelEvent(p12, 1)
			end)
			v4.GetRemoteEvent("PostLoadingFunnelAnalyticsRemote").OnServerEvent:Connect(function(p12, ...) --[[ Line: 480 | Upvalues: p1 (copy) ]]
				p1.ReportLoadingFunnelEvent(p12, ...)
			end)
		end
	else
		if not v6 then
			return
		end
		warn("\226\154\160\239\184\143 AnalyticsService, Analytics is disabled. Analytics will not be sent.")
	end
end
return t