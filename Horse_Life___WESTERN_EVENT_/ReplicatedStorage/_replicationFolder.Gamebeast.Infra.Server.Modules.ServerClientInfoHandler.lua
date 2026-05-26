-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("GetRemote")
local v2 = shared.GBMod("Signal")
shared.GBMod("GBRequests")
shared.GBMod("SignalTimeout")
local v3 = shared.GBMod("Schema")
local v4 = v1("Event", "ClientInfoChanged")
local v5 = v1("Function", "GetProductPrice")
local v6 = v2.new()
local v7 = v2.new()
local v8 = v3.new({
	inputType = {
		default = "unknown",
		type = "string"
	},
	device = {
		default = "unknown",
		type = "string"
	},
	deviceSubType = {
		default = "unknown",
		type = "string"
	},
	sessionId = {
		default = nil,
		type = "string"
	},
	joinTime = {
		default = nil,
		type = "number"
	},
	totalFriendPlaytime = {
		default = 0,
		type = "number"
	},
	hasFriendsOnline = {
		default = false,
		type = "boolean"
	}
})
local t2 = {}
local function UpdateClientInfoCache(p1, p2) --[[ UpdateClientInfoCache | Line: 78 | Upvalues: t2 (copy), v8 (copy), v7 (copy), v6 (copy) ]]
	local v1
	if t2[p1] then
		v1 = false
	else
		t2[p1] = v8:GetDefault()
		v1 = true
	end
	for k, v in pairs(p2) do
		if not v8:HasKey(k) then
			return
		end
		if t2[p1][k] ~= v then
			t2[p1][k] = v
			v7:Fire(p1, k, v)
		end
	end
	if not v1 then
		return
	end
	v6:Fire(p1, t2[p1])
end
function t.GetClientInfo(p1, p2, p3) --[[ GetClientInfo | Line: 106 | Upvalues: Players (copy), t2 (copy), v8 (copy) ]]
	if typeof(p2) == "number" then
		p2 = Players:GetPlayerByUserId(p2)
	end
	if p2 and (t2[p2] and t2[p2][p3] ~= nil) then
		return t2[p2][p3]
	end
	return v8:GetDefaultForKey(p3)
end
function t.OnClientInfoResolved(p1, p2, p3) --[[ OnClientInfoResolved | Line: 118 | Upvalues: t2 (copy), v6 (copy) ]]
	if p1:IsClientInfoResolved(p2) then
		p3(table.clone(t2[p2]))
	else
		local v1 = nil
		v1 = v6:Connect(function(p1, p22) --[[ Line: 125 | Upvalues: p2 (copy), v1 (ref), p3 (copy) ]]
			if p1 ~= p2 then
				return
			end
			v1:Disconnect()
			if not p22 then
				return
			end
			p3(table.clone(p22))
		end)
		return v1
	end
end
function t.OnClientInfoChanged(p1, p2, p3) --[[ OnClientInfoChanged | Line: 138 | Upvalues: v7 (copy) ]]
	return v7:Connect(function(p1, p22, p32) --[[ Line: 139 | Upvalues: p2 (copy), p3 (copy) ]]
		if p1 ~= p2 then
			return
		end
		p3(p22, p32)
	end)
end
function t.IsClientInfoResolved(p1, p2) --[[ IsClientInfoResolved | Line: 147 | Upvalues: Players (copy), t2 (copy) ]]
	assert(p2, "Player must be provided to check client info resolution.")
	if typeof(p2) == "number" then
		p2 = Players:GetPlayerByUserId(p2)
	end
	return t2[p2] ~= nil
end
function t.WaitUntilClientInfoResolved(p1, p2, p3) --[[ WaitUntilClientInfoResolved | Line: 163 | Upvalues: t (copy) ]]
	if t:IsClientInfoResolved(p2) then
		return
	end
	local v1 = coroutine.running()
	local v2 = nil
	local v3 = false
	local v4 = p1:OnClientInfoResolved(p2, function() --[[ Line: 173 | Upvalues: v3 (ref), v1 (copy) ]]
		if v3 then
			return
		end
		v3 = true
		coroutine.resume(v1)
	end)
	if p3 then
		v2 = task.delay(p3, function() --[[ Line: 182 | Upvalues: v3 (ref), v2 (ref), v1 (copy) ]]
			if v3 then
				return
			end
			v2 = nil
			v3 = true
			coroutine.resume(v1)
		end)
	end
	coroutine.yield()
	v4:Disconnect()
	if not v2 then
		return
	end
	task.cancel(v2)
end
function t.GetProductPriceForPlayer(p1, p2, p3, p4) --[[ GetProductPriceForPlayer | Line: 201 | Upvalues: Players (copy), v5 (copy) ]]
	if typeof(p2) == "number" then
		p2 = Players:GetPlayerByUserId(p2)
	end
	if not p1:IsClientInfoResolved(p2) then
		return nil
	end
	local v1, v2 = pcall(function() --[[ Line: 210 | Upvalues: v5 (ref), p2 (ref), p3 (copy), p4 (copy) ]]
		local v1 = v5:InvokeClient(p2, p3, p4)
		assert(if typeof(v1) == "number" then if v1 >= 0 then true else false else false, "Invalid price from client")
		return v1
	end)
	if v1 then
		return v2
	else
		return nil
	end
end
function t.UpdateClientData(p1, p2, p3, p4) --[[ UpdateClientData | Line: 223 | Upvalues: Players (copy), v4 (copy) ]]
	if typeof(p2) == "number" then
		p2 = Players:GetPlayerByUserId(p2)
	end
	p1:OnClientInfoResolved(p2, function() --[[ Line: 228 | Upvalues: p2 (ref), v4 (ref), p3 (copy), p4 (copy) ]]
		if p2.Parent then
			v4:FireClient(p2, p3, p4)
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 239 | Upvalues: Players (copy), v6 (copy), t2 (copy), v4 (copy), UpdateClientInfoCache (copy) ]]
	Players.PlayerRemoving:Connect(function(p1) --[[ Line: 240 | Upvalues: v6 (ref), t2 (ref) ]]
		v6:Fire(p1, nil)
		task.defer(function() --[[ Line: 242 | Upvalues: t2 (ref), p1 (copy) ]]
			t2[p1] = nil
		end)
	end)
	v4.OnServerEvent:Connect(UpdateClientInfoCache)
end
return t