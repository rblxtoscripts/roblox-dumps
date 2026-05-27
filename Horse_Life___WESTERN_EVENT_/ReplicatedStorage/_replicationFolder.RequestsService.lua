-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage.Sonar)
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("SettingsService")
local v5 = Sonar("TableUtils")
local v6 = Sonar("NotificationsService")
local v7 = v2.GetRemoteFunction("RequestRemote")
local v8 = v2.GetRemoteEvent("RequestStateRemote")
local t2 = {}
local t3 = {}
if v1 then
	function t.Send(p1, p2) --[[ Send | Line: 107 | Upvalues: v3 (copy), t (copy), v8 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			warn("\226\154\160\239\184\143 RequestsService, Sender wrapper not found for player:", p1)
			return "InvalidSender"
		end
		local v2 = v3.getWrapperFromPlayer(p2.Target)
		if not v2 then
			warn("\226\154\160\239\184\143 RequestsService, Target wrapper not found for player:", p2.Target)
			return "InvalidTarget"
		end
		local v32 = t.GetRequestType(p2.Type)
		if not v32 then
			warn("\226\154\160\239\184\143 RequestsService, Invalid request type:", p2.Type)
			return "InvalidType"
		end
		local v4 = t.CanSend(p2, v1, v2)
		if v4 ~= true then
			return v4
		end
		local v5 = workspace:GetServerTimeNow() + v32.TimeOut
		if not v1.RequestsByType[p2.Type] then
			v1.RequestsByType[p2.Type] = {}
		end
		v1.RequestsByType[p2.Type][p2.Target] = v5
		if v32.TimeOut then
			task.delay(v32.TimeOut, function() --[[ Line: 138 | Upvalues: v1 (copy), v5 (copy), p2 (copy), t (ref), p1 (copy) ]]
				if not v1.RequestsByType then
					return
				end
				if v5 == v1.RequestsByType[p2.Type][p2.Target] then
					t.Decline(p2.Target, {
						Type = p2.Type,
						Target = p1
					})
				end
			end)
		end
		v8:FireClient(p2.Target, {
			Action = "Received",
			Type = p2.Type,
			TimeOut = v32.TimeOut and v5,
			Target = p1
		})
		return true
	end
	function t.Accept(p1, p2) --[[ Accept | Line: 160 | Upvalues: v3 (copy), t (copy), v8 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			warn("\226\154\160\239\184\143 RequestsService, Accepter wrapper not found for player:", p1)
			return "InvalidAccepter"
		end
		local v2 = v3.getWrapperFromPlayer(p2.Target)
		if not v2 then
			warn("\226\154\160\239\184\143 RequestsService, Sender wrapper not found for player:", p2.Target)
			return "InvalidSender"
		end
		local v32 = t.GetRequestType(p2.Type)
		if not v32 then
			warn("\226\154\160\239\184\143 RequestsService, Invalid request type:", p2.Type)
			return "InvalidType"
		end
		local v4 = (if t.IsRequested(v2, {
	Type = p2.Type,
	Target = p1
}) then nil else "NotRequested") or true
		local v5 = if v4 == true then v32.Accept(v2, v1) else false
		if v4 == true and v5 == true then
			t.RemoveRequestsWithPlayers({ v2, v1 }, p2.Type)
			v8:FireClient(p2.Target, {
				Action = "Accepted",
				Type = p2.Type,
				Target = p1
			})
			return true
		end
		t.Remove(p1, p2)
		return v5
	end
	function t.Decline(p1, p2) --[[ Decline | Line: 206 | Upvalues: v3 (copy), t (copy), v8 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p2.Target)
		if not v1 then
			warn("\226\154\160\239\184\143 RequestsService, Sender wrapper not found for player:", p2.Target)
			return "InvalidSender"
		end
		local v2 = (if t.IsRequested(v1, {
	Type = p2.Type,
	Target = p1
}) then nil else "NotRequested") or true
		if v2 == true then
			t.Remove(p1, p2)
			v8:FireClient(p2.Target, {
				Action = "Declined",
				Type = p2.Type,
				Target = p1
			})
			return true
		else
			return v2
		end
	end
	function t.Remove(p1, p2) --[[ Remove | Line: 235 | Upvalues: v3 (copy), v8 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p2.Target)
		if not v1 then
			warn("\226\154\160\239\184\143 RequestsService, Target wrapper not found for player:", p2.Target)
			return
		end
		local v2 = v1.RequestsByType[p2.Type]
		if not v2 then
			return
		end
		local v32 = v2[p1]
		v2[p1] = nil
		if not (v32 and p2.Replicate) then
			return
		end
		v8:FireClient(p2.Target, {
			Action = "Remove",
			Type = p2.Type,
			Target = p1
		})
	end
	function t.RemoveRequestsWithPlayers(p1, p2) --[[ RemoveRequestsWithPlayers | Line: 257 | Upvalues: t (copy), v3 (copy) ]]
		for k, v in pairs(p1) do
			local v1 = v.RequestsByType[p2]
			if v1 then
				for k2, v2 in pairs(v1) do
					t.Remove(v.Player, {
						Replicate = true,
						Type = p2,
						Target = v2
					})
				end
				v.RequestsByType[p2] = {}
			end
			for k2, v2 in pairs(v3.GetPlayers()) do
				t.Remove(v.Player, {
					Replicate = true,
					Type = p2,
					Target = v2.Player
				})
			end
		end
	end
	function t.IsRequested(p1, p2) --[[ IsRequested | Line: 285 ]]
		if not p1 then
			warn("\226\154\160\239\184\143 RequestsService, Player wrapper is required")
			return false
		end
		local v1 = p1.RequestsByType[p2.Type]
		if v1 then
			return v1[p2.Target]
		else
			return false
		end
	end
else
	function t.Respond(p1) --[[ Respond | Line: 296 | Upvalues: t (copy), v7 (copy) ]]
		local v1 = t.GetRequestType(p1.Type)
		if not v1 then
			warn("\226\154\160\239\184\143 RequestsService, Invalid request type:", p1.Type)
			return
		end
		local v2 = v7:InvokeServer(p1)
		if v2 == true then
			return
		end
		t.HandleResponse(v1, v2, p1)
	end
	function t.Send(p1, p2) --[[ Send | Line: 311 | Upvalues: t (copy), v3 (copy), v7 (copy) ]]
		local v1 = t.GetRequestType(p1.Type)
		if not v1 then
			warn("\226\154\160\239\184\143 RequestsService, Invalid request type:", p1.Type)
			return
		end
		local v2 = v3.getWrapperFromPlayer(p1.Target)
		if not v2 then
			warn("\226\154\160\239\184\143 RequestsService, Target wrapper not found for player:", p1.Target)
			return
		end
		local v32 = t.CanSend(p1, v3.GetClient(), v2)
		if v32 ~= true then
			t.HandleResponse(v1, v32, p1)
			return
		end
		local v4 = v7:InvokeServer(p1)
		if v4 == true then
			t.HandleResponse(v1, "Send", p1)
		else
			t.HandleResponse(v1, v4, p1)
		end
	end
	function t.HandleResponse(p1, p2, p3) --[[ HandleResponse | Line: 340 | Upvalues: t3 (copy), v5 (copy), v6 (copy) ]]
		local v1 = t3[p2]
		if v1 then
			v1(p3)
			return
		end
		local v2 = if type(p2) == "table" and p2 then p2 else { p2 }
		table.remove(v2, 1)
		local v4 = v5.MergeLists(v2, { p3.Target })
		local v52 = p1.Responses[v2[1]]
		if not v52 then
			return
		end
		v6.Notify(p3.Target, v52(table.unpack(v4)))
	end
	function t.AddResponseCallback(p1, p2) --[[ AddResponseCallback | Line: 357 | Upvalues: t3 (copy) ]]
		t3[p1] = p2
	end
end
function t.CanSend(p1, p2, p3) --[[ CanSend | Line: 362 | Upvalues: t (copy), v1 (copy), v4 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 RequestsService, Request is required")
		return "InvalidRequest"
	end
	if not p2 then
		warn("\226\154\160\239\184\143 RequestsService, Sender wrapper is required")
		return "InvalidSender"
	end
	if not p3 then
		warn("\226\154\160\239\184\143 RequestsService, Target wrapper is required")
		return "InvalidTarget"
	end
	local v12 = t.GetRequestType(p1.Type)
	if not v12 then
		warn("\226\154\160\239\184\143 RequestsService, Invalid request type:", p1.Type)
		return "InvalidType"
	end
	if v1 and t.IsRequested(p2, {
		Type = p1.Type,
		Target = p3.Player
	}) then
		return "AlreadyRequested"
	end
	if v12.Setting then
		local v2 = v4.GetRequestPermission(p2, p3, v12.Setting)
		if v2 ~= true then
			return { "InvalidStatus", v2 }
		end
	end
	if v12.Check then
		return v12.Check(p2, p3)
	else
		return true
	end
end
function t.AddType(p1, p2) --[[ AddType | Line: 404 | Upvalues: t2 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 RequestsService, Request type is required")
		return
	end
	if p2 then
		t2[p1] = p2
	else
		warn("\226\154\160\239\184\143 RequestsService, Request info is required")
	end
end
function t.GetRequestType(p1) --[[ GetRequestType | Line: 418 | Upvalues: t2 (copy) ]]
	if p1 then
		return t2[p1]
	else
		warn("\226\154\160\239\184\143 RequestsService, Request type is required")
		return nil
	end
end
function t.Init(p1) --[[ Init | Line: 427 | Upvalues: v1 (copy), v3 (copy), t (copy), v7 (copy), v8 (copy) ]]
	if v1 then
		v3.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 431 ]]
				p2.RequestsByType = {}
			end,
			OnRemoved = function(p1, p2) --[[ OnRemoved | Line: 434 | Upvalues: t (ref) ]]
				for k, v in pairs(p2.RequestsByType) do
					for k2, v2 in pairs(v) do
						t.Remove(p1, {
							Replicate = true,
							Type = k,
							Target = k2
						})
					end
				end
			end
		})
		function v7.OnServerInvoke(p1, p2) --[[ Line: 448 | Upvalues: v3 (ref), t (ref) ]]
			for k, v in pairs({ p1, p2.Target }) do
				if not v3.getWrapperFromPlayer(v) then
					return
				end
			end
			if not t.GetRequestType(p2.Type) then
				return
			end
			if p2.Action == "Accept" then
				return t.Accept(p1, p2)
			end
			if p2.Action == "Decline" then
				return t.Decline(p1, p2)
			end
			if p2.Action == "Send" then
				return t.Send(p1, p2)
			else
				return nil
			end
		end
	else
		v8.OnClientEvent:Connect(function(p1) --[[ Line: 467 | Upvalues: t (ref) ]]
			local v1 = t.GetRequestType(p1.Type)
			if v1 then
				t.HandleResponse(v1, p1.Action, p1)
			end
		end)
	end
end
t:Init()
return t