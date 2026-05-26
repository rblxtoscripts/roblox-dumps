-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local SocialService = game:GetService("SocialService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("EventUtils")
local v2 = Sonar("InstanceUtils")
local v3 = Sonar("DataStore", "Server")
local v4 = Sonar("Signal")
local v5 = RunService:IsServer()
local v6 = v2.Create("Configuration", {
	Name = "WebsiteEventsReplication",
	Parent = ReplicatedStorage
}, true)
local v7 = nil
t.EventAdded = v4.new()
t.EventRemoved = v4.new()
local function getEventsDatastore() --[[ getEventsDatastore | Line: 123 | Upvalues: v7 (ref), v3 (copy) ]]
	v7 = v7 or v3.new("live/website_events")
	return v7
end
local function decodeEvent(p1) --[[ decodeEvent | Line: 130 | Upvalues: v1 (copy), HttpService (copy) ]]
	return v1.safeCall(function() --[[ Line: 131 | Upvalues: HttpService (ref), p1 (copy) ]]
		local v1 = HttpService:JSONDecode(p1.Value)
		v1.Instance = p1
		return v1
	end)
end
function t.CanPromptEventRsvp(p1) --[[ CanPromptEventRsvp | Line: 140 | Upvalues: t (copy) ]]
	local v1 = t.HasEventStarted(p1)
	return not v1 and t.GetEventRsvpStatusAsync(p1) ~= Enum.RsvpStatus.Going
end
function t.IsGoingToEvent(p1) --[[ IsGoingToEvent | Line: 148 | Upvalues: t (copy) ]]
	local isGoing = t.GetEventRsvpStatusAsync(p1) == Enum.RsvpStatus.Going
	return isGoing
end
function t.GetEventRsvpStatusAsync(p1) --[[ GetEventRsvpStatusAsync | Line: 154 | Upvalues: v1 (copy), SocialService (copy) ]]
	return v1.safeCall(function() --[[ Line: 155 | Upvalues: SocialService (ref), p1 (copy) ]]
		return SocialService:GetEventRsvpStatusAsync(p1)
	end)
end
function t.PromptRsvpToEventAsync(p1) --[[ PromptRsvpToEventAsync | Line: 163 | Upvalues: v1 (copy), SocialService (copy) ]]
	return v1.safeCall(function() --[[ Line: 164 | Upvalues: SocialService (ref), p1 (copy) ]]
		return SocialService:PromptRsvpToEventAsync(p1)
	end)
end
function t.GetEventData(p1) --[[ GetEventData | Line: 172 | Upvalues: t (copy), decodeEvent (copy) ]]
	local v2 = t.GetEventInstance(typeof(p1) == "Instance" and p1.Name or p1)
	if v2 then
		return decodeEvent(v2)
	end
end
function t.GetEventInstance(p1) --[[ GetEventInstance | Line: 185 | Upvalues: v6 (copy) ]]
	return v6:FindFirstChild(p1)
end
function t.HasEventStarted(p1) --[[ HasEventStarted | Line: 190 | Upvalues: t (copy) ]]
	local v1 = t.GetEventData(p1)
	if not v1 then
		return
	end
	return v1.StartTime < workspace:GetServerTimeNow()
end
function t.GetAllEvents() --[[ GetAllEvents | Line: 201 | Upvalues: t (copy) ]]
	local t2 = {}
	for v1, v2 in t.GetAllEventInstances() do
		t2[v2.Name] = t.GetEventData(v2.Name)
	end
	return t2
end
function t.GetAllEventInstances() --[[ GetAllEventInstances | Line: 212 | Upvalues: v6 (copy) ]]
	return v6:GetChildren()
end
function t.GetEventAddedSignal(p1) --[[ GetEventAddedSignal | Line: 216 | Upvalues: t (copy) ]]
	return t.EventAdded
end
function t.GetEventRemovedSignal(p1) --[[ GetEventRemovedSignal | Line: 220 | Upvalues: t (copy) ]]
	return t.EventRemoved
end
function t.IsReady() --[[ IsReady | Line: 226 | Upvalues: v6 (copy) ]]
	return v6:GetAttribute("Initialised")
end
function t.GetEventsReadySignal() --[[ GetEventsReadySignal | Line: 232 | Upvalues: v6 (copy) ]]
	return v6:GetAttributeChangedSignal("Initialised")
end
function t.OnEventsReady(p1) --[[ OnEventsReady | Line: 238 | Upvalues: t (copy) ]]
	t.GetEventsReadySignal():Connect(p1)
	if not t.IsReady() then
		return
	end
	p1()
end
function t._subscribeToDatastore(p1) --[[ _subscribeToDatastore | Line: 245 | Upvalues: v1 (copy), v7 (ref), v3 (copy), HttpService (copy), v6 (copy), v2 (copy) ]]
	v1.spawnLoop(function() --[[ Line: 246 | Upvalues: v7 (ref), v3 (ref), v1 (ref), HttpService (ref), v6 (ref), v2 (ref), p1 (copy) ]]
		v7 = v7 or v3.new("live/website_events")
		local v22, v32 = v7:Get("1")
		if v22 then
			if typeof(v22) == "string" then
				v22 = v1.safeCall(function() --[[ Line: 251 | Upvalues: HttpService (ref), v22 (ref) ]]
					return HttpService:JSONDecode(v22)
				end)
			end
			if not v22 or typeof(v22) ~= "table" then
				return
			end
			local t = {}
			for v4, v5 in v22.data do
				if v5.eventVisibility == "public" then
					local UnixTimestamp = DateTime.fromIsoDate(v5.eventTime.startUtc).UnixTimestamp
					local UnixTimestamp_2 = DateTime.fromIsoDate(v5.eventTime.endUtc).UnixTimestamp
					t[v5.id] = {
						Title = v5.title,
						Subtitle = v5.subtitle,
						Id = v5.id,
						Description = v5.description,
						StartTime = UnixTimestamp,
						EndTime = UnixTimestamp_2,
						Status = v5.eventStatus,
						Thumbnails = {}
					}
					for v72, v8 in v5.thumbnails or {} do
						table.insert(t[v5.id].Thumbnails, v8.mediaId)
					end
				end
			end
			for v9, v10 in t do
				local v11 = v1.safeCall(function() --[[ Line: 290 | Upvalues: HttpService (ref), v10 (copy) ]]
					return HttpService:JSONEncode(v10)
				end)
				if v11 then
					t[v9] = v11
					continue
				end
				t[v9] = nil
			end
			for v122, v13 in v6:GetChildren() do
				if not t[v13.Name] then
					v13:Destroy()
				end
			end
			for v14, v15 in t do
				if not v6:FindFirstChild(v14) then
					v2.Create("StringValue", {
						Name = v14,
						Value = v15,
						Parent = v6
					})
				end
			end
		end
		if not v32 or p1._initialised then
			return
		end
		p1._initialised = true
		v6:SetAttribute("Initialised", true)
	end, 120, true)
end
function t.Init(p1) --[[ Init | Line: 332 | Upvalues: v5 (copy), v6 (copy), t (copy) ]]
	if not v5 then
		v6.ChildAdded:Connect(function(p1_2) --[[ Line: 337 | Upvalues: t (ref) ]]
			local v1 = t.GetEventData(p1_2.Name)
			if v1 then
				t.EventAdded:Fire(v1)
			end
		end)
		v6.ChildRemoved:Connect(function(p1_2) --[[ Line: 347 | Upvalues: t (ref) ]]
			t.EventRemoved:Fire(p1_2.Name)
		end)
		return
	end
	p1:_subscribeToDatastore()
	v6.ChildAdded:Connect(function(p1_2) --[[ Line: 337 | Upvalues: t (ref) ]]
		local v1 = t.GetEventData(p1_2.Name)
		if v1 then
			t.EventAdded:Fire(v1)
		end
	end)
	v6.ChildRemoved:Connect(function(p1_2) --[[ Line: 347 | Upvalues: t (ref) ]]
		t.EventRemoved:Fire(p1_2.Name)
	end)
end
t:Init()
return t