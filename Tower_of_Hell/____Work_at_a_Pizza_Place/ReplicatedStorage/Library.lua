-- https://lua.expert/
local t = {}
local v1 = game:GetService("RunService"):IsServer()
if v1 then
	local Library = game.ServerScriptService:FindFirstChild("Library")
	if Library then
		for i, v in ipairs(Library:GetChildren()) do
			if v:IsA("Folder") then
				v.Parent = game[v.Name]
				v.Name = "LibraryFolder"
			end
		end
		Library:Destroy()
	end
end
function t.Load(p1, p2) --[[ Load | Line: 20 | Upvalues: v1 (copy) ]]
	local v12 = v1 and (game.ServerScriptService.LibraryFolder:FindFirstChild(p2, true) or game.ReplicatedStorage.LibraryFolder:FindFirstChild(p2, true))
	local v3 = v12 or (game.ReplicatedStorage.LibraryFolder:FindFirstChild(p2 .. "Local", true) or game.ReplicatedStorage.LibraryFolder:FindFirstChild(p2, true))
	if v3 then
		if v3.ClassName ~= "ModuleScript" then
			error(p2 .. " is className: " .. v3.ClassName .. ", should be a ModuleScript. Maybe another object has the same name?")
		end
	else
		error(p2 .. " is not a valid library")
	end
	return require(v3)
end
function t.BaseClass(p1, p2, p3) --[[ BaseClass | Line: 39 | Upvalues: v1 (copy) ]]
	local t = {}
	if p2 then
		local t2 = {}
		local v2 = string.sub(p2.Name, -5) == "Local" and string.sub(p2.Name, 1, -6) or p2.Name
		local v4 = game.ReplicatedStorage.LibraryFolder:FindFirstChild(v2) or Instance.new("RemoteEvent")
		v4.Name = v2
		v4.Parent = game.ReplicatedStorage.LibraryFolder
		local v5 = false
		t.Initialized = Instance.new("BindableEvent")
		t.Initialized.Event:Connect(function() --[[ Line: 56 | Upvalues: v5 (ref) ]]
			v5 = true
		end)
		local t3 = {
			__index = function(p1, p2) --[[ __index | Line: 61 | Upvalues: t2 (copy), v5 (ref), t (copy), v1 (ref), v2 (copy), v4 (copy) ]]
				if type(p2) ~= "string" then
					return
				end
				t2[p2] = t2[p2] or {
					SendToClient = function(p1, p22, ...) --[[ SendToClient | Line: 65 | Upvalues: v5 (ref), t (ref), v1 (ref), v2 (ref), p2 (copy), v4 (ref) ]]
						if not v5 then
							t.Initialized.Event:Wait()
						end
						if not v1 then
							error("cannot call \'SendToClient\' from the client (class : " .. v2 .. ")(function : " .. p2 .. ")")
						end
						if p22 then
							v4:FireClient(p22, v2, p2, ...)
						else
							error(p2 .. " function could not fire client. Player is null")
						end
					end,
					SendToAllClients = function(p1, ...) --[[ SendToAllClients | Line: 77 | Upvalues: v5 (ref), t (ref), v1 (ref), v2 (ref), p2 (copy), v4 (ref) ]]
						if not v5 then
							print("SENDING")
							t.Initialized.Event:Wait()
							print("DONE WAITING")
						end
						if v1 then
							v4:FireAllClients(v2, p2, ...)
							return
						end
						error("cannot call \'SendToAllClients\' from the client (class : " .. v2 .. ")(function : " .. p2 .. ")")
					end,
					SendToServer = function(p1, ...) --[[ SendToServer | Line: 85 | Upvalues: v5 (ref), t (ref), v1 (ref), v2 (ref), p2 (copy), v4 (ref) ]]
						if not v5 then
							t.Initialized.Event:Wait()
						end
						if v1 then
							error("cannot call \'FireServer\' from the server (class : " .. v2 .. ")(function : " .. p2 .. ")")
						end
						v4:FireServer(v2, p2, ...)
					end
				}
				return t2[p2]
			end
		}
		setmetatable(t, t3)
		if v1 then
			v4.OnServerEvent:Connect(function(p1, p2, p32, ...) --[[ Line: 100 | Upvalues: v2 (copy), p3 (copy), t (copy) ]]
				if p2 ~= v2 then
					return
				end
				if p3 ~= nil and (p3[p32] and t[p32]) then
					t[p32](t, p1, ...)
					return
				end
				if not t[p32] then
					error(p32 .. " server function does not exist")
				end
				error("The client does not have permission to run server function: " .. p32)
			end)
		else
			v4.OnClientEvent:Connect(function(p1, p2, ...) --[[ Line: 114 | Upvalues: v2 (copy), t (copy) ]]
				if p1 ~= v2 then
					return
				end
				if not t[p2] then
					error(p2 .. " does not have a corisponding client function")
				end
				t[p2](t, ...)
			end)
		end
	end
	return t
end
return t