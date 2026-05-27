-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MessagingService")
local v2 = Sonar("DataStore", "Server")
local v3 = Sonar("InstanceUtils")
local IS_SERVER = Sonar("Constants").IS_SERVER
local v4 = IS_SERVER and v2.new("__likesCountStore", {
	OrderedDataStore = true
})
local v5 = v3.Create("Configuration", {
	Name = "LikesReplication",
	Parent = ReplicatedStorage
}, true)
local v6 = nil
local function updateLikes(p1) --[[ updateLikes | Line: 61 | Upvalues: v6 (ref), v5 (copy) ]]
	v6 = tonumber(p1) or 0
	v5:SetAttribute("Likes", v6)
	v5:SetAttribute("Initialised", true)
end
function t._subscribeToMessagingService(p1) --[[ _subscribeToMessagingService | Line: 72 | Upvalues: v1 (copy), v6 (ref), v5 (copy) ]]
	v1.Subscribe("__likesUpdateTopic", function(p1) --[[ Line: 73 | Upvalues: v6 (ref), v5 (ref) ]]
		local v1 = tonumber(p1.Data)
		if v1 and v6 < v1 then
			v6 = tonumber(v1) or 0
			v5:SetAttribute("Likes", v6)
			v5:SetAttribute("Initialised", true)
		end
	end)
end
function t._setupLikesInitialState(p1) --[[ _setupLikesInitialState | Line: 85 | Upvalues: v6 (ref), v4 (copy), v5 (copy) ]]
	v6 = tonumber(v6) or 0
	local v2, v3 = v4:GetSorted(false, 1)
	local v42 = if v2 then v2[1] else v2
	local v62 = tonumber(if v42 then v42.value else nil)
	if not v3 then
		return
	end
	if v62 then
		if v6 < v62 then
			v6 = tonumber(v62) or 0
			v5:SetAttribute("Likes", v6)
			v5:SetAttribute("Initialised", true)
		end
	else
		v6 = tonumber(v6) or 0
		v5:SetAttribute("Likes", v6)
		v5:SetAttribute("Initialised", true)
	end
end
function t.IsReady() --[[ IsReady | Line: 111 | Upvalues: v5 (copy) ]]
	return v5:GetAttribute("Initialised")
end
function t.GetLikesReadySignal() --[[ GetLikesReadySignal | Line: 117 | Upvalues: v5 (copy) ]]
	return v5:GetAttributeChangedSignal("Initialised")
end
function t.OnLikesReady(p1) --[[ OnLikesReady | Line: 123 | Upvalues: t (copy) ]]
	t.GetLikesReadySignal():Connect(p1)
	if not t.IsReady() then
		return
	end
	p1()
end
function t.GetLikes() --[[ GetLikes | Line: 133 | Upvalues: v5 (copy) ]]
	return v5:GetAttribute("Likes") or 0
end
function t.GetLikesChangedSignal() --[[ GetLikesChangedSignal | Line: 139 | Upvalues: v5 (copy) ]]
	return v5:GetAttributeChangedSignal("Likes")
end
function t.Init(p1) --[[ Init | Line: 144 | Upvalues: IS_SERVER (copy), t (copy) ]]
	if not IS_SERVER then
		return
	end
	task.spawn(t._setupLikesInitialState, p1)
	p1:_subscribeToMessagingService()
end
t:Init()
return t