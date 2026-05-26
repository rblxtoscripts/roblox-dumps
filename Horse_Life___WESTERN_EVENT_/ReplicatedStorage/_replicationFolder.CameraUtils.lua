-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("CameraShaker")
local t = {}
local v2 = RunService:IsClient()
local CurrentCamera = workspace.CurrentCamera
local v3 = v1.new(Enum.RenderPriority.Camera.Value + 1, "CameraUtils", function(p1) --[[ Line: 12 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v3:Start()
function t.Shake(p1) --[[ Shake | Line: 16 | Upvalues: v2 (copy), v1 (copy), v3 (copy) ]]
	if not v2 then
		return
	end
	local v12 = v1.Presets[p1]
	if v12 then
		v3:Shake(v12)
	else
		warn("Preset " .. tostring(p1) .. " not found")
	end
end
return t