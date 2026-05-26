-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("GamePermissionsService")
local v4 = game:GetService("RunService"):IsServer()
local v5 = game:GetService("RunService"):IsStudio()
local LocalPlayer = game:GetService("Players").LocalPlayer
local v6 = v1.GetRemoteEvent("CriticalWarnRemote")
local t = {}
local v7 = false
local function createNotification(p1) --[[ createNotification | Line: 25 | Upvalues: StarterGui (copy) ]]
	StarterGui:SetCore("SendNotification", {
		Title = "CRITICAL",
		Text = p1
	})
end
local function addCriticalWarn(p1) --[[ addCriticalWarn | Line: 32 | Upvalues: t (copy), StarterGui (copy), v7 (ref) ]]
	table.insert(t, p1)
	if #t < 3 then
		StarterGui:SetCore("SendNotification", {
			Title = "CRITICAL",
			Text = p1
		})
	end
	if v7 then
		return
	end
	v7 = true
	task.wait(2)
	while true do
		for v2, v3 in t do
			StarterGui:SetCore("SendNotification", {
				Title = "CRITICAL",
				Text = v3
			})
			task.wait(2)
		end
	end
end
if not v4 then
	v6.OnClientEvent:Connect(function(p1) --[[ Line: 54 | Upvalues: v5 (copy), v3 (copy), LocalPlayer (copy), addCriticalWarn (copy) ]]
		if v5 and v3.HasPermission(LocalPlayer, "Developer") then
			warn("\240\159\154\168 CRITICAL: ", p1)
			addCriticalWarn(p1)
		end
	end)
end
return function(p1, ...) --[[ Line: 64 | Upvalues: v4 (copy), v2 (copy), v6 (copy), addCriticalWarn (copy) ]]
	local v1 = p1
	for v22, v3 in { ... } do
		if type(v3) == "string" then
			v1 = v1 .. " " .. v3
		end
	end
	local v42 = "\240\159\154\168 CRITICAL: " .. v1
	warn(v42)
	if v4 then
		v2.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 77 | Upvalues: v6 (ref), v42 (ref) ]]
				v6:FireClient(p1, v42)
			end
		})
	else
		addCriticalWarn(v42)
	end
end