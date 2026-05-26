-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
game:GetService("ReplicatedStorage")
if not script:FindFirstChild("Sent") then
	local Sent = Instance.new("RemoteEvent")
	Sent.Name = "Sent"
	Sent.Parent = script
end
if not script:FindFirstChild("Received") then
	local Received = Instance.new("RemoteEvent")
	Received.Name = "Received"
	Received.Parent = script
end
local Sent = script.Sent
local Received = script.Received
local v1 = RunService:IsServer()
local t = {}
local t2 = {}
local function spawnNow(p1, ...) --[[ spawnNow | Line: 97 ]]
	local v1 = Instance.new("BindableEvent")
	local v2 = table.pack(...)
	v1.Event:Connect(function() --[[ Line: 100 | Upvalues: p1 (copy), v2 (copy) ]]
		p1(table.unpack(v2, 1, v2.n))
	end)
	v1:Fire()
	v1:Destroy()
end
local t3 = {
	InvokeClient = function(p1, p2, p3, ...) --[[ InvokeClient | Line: 112 | Upvalues: v1 (copy), t2 (copy), HttpService (copy), spawnNow (copy), Sent (copy) ]]
		assert(v1, "Postie.InvokeClient can only be called from the server")
		assert(if typeof(p1) == "string" then true else false, "bad argument #1 to Postie.InvokeClient, expects string")
		assert(if typeof(p2) == "Instance" then p2:IsA("Player") else false, "bad argument #2 to Postie.InvokeClient, expects Instance<Player>")
		assert(if typeof(p3) == "number" then true else false, "bad argument #3 to Postie.InvokeClient, expects number")
		local v5 = Instance.new("BindableEvent")
		local v6 = false
		local v7 = #t2 + 1
		local v8 = HttpService:GenerateGUID(false)
		t2[v7] = function(p1, p22, ...) --[[ Line: 123 | Upvalues: p2 (copy), v8 (copy), v6 (ref), t2 (ref), v7 (copy), v5 (copy) ]]
			if p1 == p2 and p22 == v8 then
				v6 = true
				table.remove(t2, v7)
				v5:Fire(true, ...)
				return true
			else
				return false
			end
		end
		spawnNow(function() --[[ Line: 131 | Upvalues: p3 (copy), v6 (ref), t2 (ref), v7 (copy), v5 (copy) ]]
			wait(p3)
			if not v6 then
				table.remove(t2, v7)
				v5:Fire(false)
			end
		end)
		Sent:FireClient(p2, p1, v8, ...)
		return v5.Event:Wait()
	end,
	InvokeServer = function(p1, p2, ...) --[[ InvokeServer | Line: 143 | Upvalues: v1 (copy), t2 (copy), HttpService (copy), spawnNow (copy), Sent (copy) ]]
		assert(not v1, "Postie.InvokeServer can only be called from the client")
		assert(if typeof(p1) == "string" then true else false, "bad argument #1 to Postie.InvokeServer, expects string")
		assert(if typeof(p2) == "number" then true else false, "bad argument #2 to Postie.InvokeServer, expects number")
		local v4 = Instance.new("BindableEvent")
		local v5 = false
		local v6 = #t2 + 1
		local v7 = HttpService:GenerateGUID(false)
		t2[v6] = function(p1, ...) --[[ Line: 153 | Upvalues: v7 (copy), v5 (ref), t2 (ref), v6 (copy), v4 (copy) ]]
			if p1 == v7 then
				v5 = true
				table.remove(t2, v6)
				v4:Fire(true, ...)
				return true
			else
				return false
			end
		end
		spawnNow(function() --[[ Line: 161 | Upvalues: p2 (copy), v5 (ref), t2 (ref), v6 (copy), v4 (copy) ]]
			wait(p2)
			if not v5 then
				table.remove(t2, v6)
				v4:Fire(false)
			end
		end)
		Sent:FireServer(p1, v7, ...)
		return v4.Event:Wait()
	end,
	SetCallback = function(p1, p2) --[[ SetCallback | Line: 173 | Upvalues: t (copy) ]]
		assert(if typeof(p1) == "string" then true else false, "bad argument #1 to Postie.SetCallback, expects string")
		t[p1] = p2
	end,
	GetCallback = function(p1) --[[ GetCallback | Line: 179 | Upvalues: t (copy) ]]
		assert(typeof(p1) == "string", "bad argument #1 to Postie.GetCallback, expects string")
		return t[p1]
	end
}
if v1 then
	Received.OnServerEvent:Connect(function(...) --[[ Line: 189 | Upvalues: t2 (copy) ]]
		for i, v in ipairs(t2) do
			if v(...) then
				break
			end
		end
	end)
	Sent.OnServerEvent:Connect(function(p1, p2, p3, ...) --[[ Line: 195 | Upvalues: t (copy), Received (copy) ]]
		local v1 = t[p2]
		Received:FireClient(p1, p3, if v1 then v1(p1, ...) else v1)
	end)
else
	Received.OnClientEvent:Connect(function(...) --[[ Line: 201 | Upvalues: t2 (copy) ]]
		for i, v in ipairs(t2) do
			if v(...) then
				break
			end
		end
	end)
	Sent.OnClientEvent:Connect(function(p1, p2, ...) --[[ Line: 207 | Upvalues: t (copy), Received (copy) ]]
		local v1 = t[p1]
		Received:FireServer(p2, if v1 then v1(...) else v1)
	end)
end
return t3