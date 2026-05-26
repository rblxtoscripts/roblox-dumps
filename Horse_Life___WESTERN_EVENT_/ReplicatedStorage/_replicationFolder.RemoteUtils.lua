-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteStorageName = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants").RemoteStorageName
local v1 = game:GetService("RunService"):IsServer()
local t2 = {
	RemoteFunction = {},
	RemoteEvent = {},
	UnreliableRemoteEvent = {}
}
local function getStorageFolder() --[[ getStorageFolder | Line: 21 | Upvalues: ReplicatedStorage (copy), RemoteStorageName (copy) ]]
	local v1 = ReplicatedStorage:FindFirstChild(RemoteStorageName)
	if not v1 then
		local v2 = Instance.new("Folder")
		v2.Name = RemoteStorageName
		v2.Parent = ReplicatedStorage
		v1 = v2
	end
	return v1
end
local function getRemoteFromFolder(p1, p2, p3) --[[ getRemoteFromFolder | Line: 33 ]]
	local v1 = p1:FindFirstChild(p2)
	if v1 then
		return v1
	else
		local v2 = Instance.new(p3)
		v2.Name = p2
		v2.Parent = p1
		return v2
	end
end
local t3 = {}
t3.__index = t3
function t3.new(p1) --[[ new | Line: 49 | Upvalues: t2 (copy) ]]
	local t = {
		__index = function(p12, p2) --[[ __index | Line: 51 | Upvalues: p1 (copy), t2 (ref) ]]
			if p2 == "FireServer" or (p2 == "FireClient" or (p2 == "FireAllClients" or (p2 == "InvokeServer" or p2 == "InvokeClient"))) then
				return function(p12, ...) --[[ Line: 53 | Upvalues: p1 (ref), p2 (copy) ]]
					return p1[p2](p1, ...)
				end
			else
				if p2 == "Destroy" then
					return p1:Destroy()
				end
				if p2 ~= "OnServerEvent" and p2 ~= "OnClientEvent" then
					return p1[p2]
				end
				local t = {}
				for v1, v2 in { "Connect", "Once" } do
					t[v2] = function(p12, p22) --[[ Line: 66 | Upvalues: p1 (ref), p2 (copy), v2 (copy), t2 (ref) ]]
						return p1[p2][v2](p1[p2], function(...) --[[ Line: 67 | Upvalues: p1 (ref), t2 (ref), p22 (copy) ]]
							local t = { ... }
							task.spawn(function() --[[ Line: 71 | Upvalues: p1 (ref), t2 (ref), t (copy) ]]
								if p1.ClassName == "RemoteEvent" then
									for v1, v2 in t2.RemoteEvent do
										v2(p1.Name, table.unpack(t))
									end
								else
									if p1.ClassName ~= "UnreliableRemoteEvent" then
										return
									end
									for v4, v5 in t2.UnreliableRemoteEvent do
										v5(p1.Name, table.unpack(t))
									end
								end
							end)
							p22(...)
						end)
					end
				end
				return t
			end
		end,
		__newindex = function(p12, p2, p3) --[[ __newindex | Line: 95 | Upvalues: p1 (copy), t2 (ref) ]]
			if p2 ~= "OnServerInvoke" and p2 ~= "OnClientInvoke" then
				rawset(p12, p2, p3)
				return
			end
			p1[p2] = function(...) --[[ Line: 97 | Upvalues: t2 (ref), p1 (ref), p3 (copy) ]]
				local t = { ... }
				task.spawn(function() --[[ Line: 101 | Upvalues: t2 (ref), p1 (ref), t (copy) ]]
					for v1, v2 in t2.RemoteFunction do
						v2(p1.Name, table.unpack(t))
					end
				end)
				return p3(...)
			end
		end
	}
	local v1 = setmetatable({}, t)
	rawset(v1, "Destroy", function(p12) --[[ Line: 118 | Upvalues: p1 (copy) ]]
		return p1:Destroy()
	end)
	return v1
end
function t.SetRemoteCallback(p1, p2, p3) --[[ SetRemoteCallback | Line: 130 | Upvalues: t2 (copy) ]]
	t2[p1][p2] = p3
end
function t.ClearRemoteCallbacks(p1) --[[ ClearRemoteCallbacks | Line: 137 | Upvalues: t2 (copy) ]]
	t2[p1] = {}
end
function t.GetRemoteFunction(p1) --[[ GetRemoteFunction | Line: 144 | Upvalues: v1 (copy), t3 (copy), ReplicatedStorage (copy), RemoteStorageName (copy) ]]
	if not v1 then
		return t3.new(ReplicatedStorage:WaitForChild(RemoteStorageName):WaitForChild(p1))
	end
	local v2 = ReplicatedStorage:FindFirstChild(RemoteStorageName)
	if not v2 then
		local v3 = Instance.new("Folder")
		v3.Name = RemoteStorageName
		v3.Parent = ReplicatedStorage
		v2 = v3
	end
	local v4 = v2:FindFirstChild(p1)
	local v5
	if v4 then
		v5 = v4
	else
		local v6 = Instance.new("RemoteFunction")
		v6.Name = p1
		v6.Parent = v2
		v5 = v6
	end
	return t3.new(v5)
end
function t.GetRemoteEvent(p1) --[[ GetRemoteEvent | Line: 155 | Upvalues: v1 (copy), t3 (copy), ReplicatedStorage (copy), RemoteStorageName (copy) ]]
	if not v1 then
		return t3.new(ReplicatedStorage:WaitForChild(RemoteStorageName):WaitForChild(p1))
	end
	local v2 = ReplicatedStorage:FindFirstChild(RemoteStorageName)
	if not v2 then
		local v3 = Instance.new("Folder")
		v3.Name = RemoteStorageName
		v3.Parent = ReplicatedStorage
		v2 = v3
	end
	local v4 = v2:FindFirstChild(p1)
	local v5
	if v4 then
		v5 = v4
	else
		local v6 = Instance.new("RemoteEvent")
		v6.Name = p1
		v6.Parent = v2
		v5 = v6
	end
	return t3.new(v5)
end
function t.GetUnreliableRemoteEvent(p1) --[[ GetUnreliableRemoteEvent | Line: 166 | Upvalues: v1 (copy), t3 (copy), ReplicatedStorage (copy), RemoteStorageName (copy) ]]
	if not v1 then
		return t3.new(ReplicatedStorage:WaitForChild(RemoteStorageName):WaitForChild(p1))
	end
	local v2 = ReplicatedStorage:FindFirstChild(RemoteStorageName)
	if not v2 then
		local v3 = Instance.new("Folder")
		v3.Name = RemoteStorageName
		v3.Parent = ReplicatedStorage
		v2 = v3
	end
	local v4 = v2:FindFirstChild(p1)
	local v5
	if v4 then
		v5 = v4
	else
		local UnreliableRemoteEvent = Instance.new("UnreliableRemoteEvent")
		UnreliableRemoteEvent.Name = p1
		UnreliableRemoteEvent.Parent = v2
		v5 = UnreliableRemoteEvent
	end
	return t3.new(v5)
end
function t.GetBindableEvent(p1) --[[ GetBindableEvent | Line: 176 | Upvalues: v1 (copy), ReplicatedStorage (copy), RemoteStorageName (copy) ]]
	if not v1 then
		return ReplicatedStorage:WaitForChild(RemoteStorageName):WaitForChild(p1)
	end
	local v12 = ReplicatedStorage:FindFirstChild(RemoteStorageName)
	if not v12 then
		local v2 = Instance.new("Folder")
		v2.Name = RemoteStorageName
		v2.Parent = ReplicatedStorage
		v12 = v2
	end
	local v3 = v12:FindFirstChild(p1)
	if v3 then
		return v3
	else
		local v4 = Instance.new("BindableEvent")
		v4.Name = p1
		v4.Parent = v12
		return v4
	end
end
return t