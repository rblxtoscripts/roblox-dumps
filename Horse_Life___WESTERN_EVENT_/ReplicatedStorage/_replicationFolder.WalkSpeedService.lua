-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper").GetClient()
Sonar("Constants")
local v4 = Sonar("StorageUtils").GetConfig("WalkSpeed")()
local MaxWalkSpeed = v4.MaxWalkSpeed
local MinWalkSpeed = v4.MinWalkSpeed
local WalkSpeedSettings = v4.WalkSpeedSettings
if not WalkSpeedSettings then
	warn("\226\154\160\239\184\143 WalkSpeedService: WalkSpeedSettings not found in Constants. Using empty table.")
	WalkSpeedSettings = {}
end
local v5 = table.clone(WalkSpeedSettings)
local t2 = {}
local t3 = {}
local v6 = v2.new()
local WalkSpeedTweens = v4.WalkSpeedTweens
local t4 = {
	In = v4.WalkSpeedDefaultSpringDampingIn or 0.8,
	Out = v4.WalkSpeedDefaultSpringDampingOut or 0.8
}
local t5 = {
	In = v4.WalkSpeedDefaultSpringFrequencyIn or 4,
	Out = v4.WalkSpeedDefaultSpringFrequencyOut or 3
}
function t.setModifierValue(p1, p2) --[[ setModifierValue | Line: 68 | Upvalues: WalkSpeedSettings (ref), v5 (ref) ]]
	if p2 == "Reset" then
		p2 = WalkSpeedSettings[p1]
		if p2 == nil then
			warn("WalkSpeedService.setModifierValue: No base value for modifier \'" .. tostring(p1) .. "\' during Reset.")
		end
	end
	v5[p1] = tonumber(p2)
end
function t.setModifier(p1, p2) --[[ setModifier | Line: 86 | Upvalues: t2 (ref), t3 (ref), WalkSpeedTweens (copy), t4 (copy), t5 (copy), v1 (copy) ]]
	t2[p1] = p2
	local v12 = t3[p1]
	if not v12 then
		warn("WalkSpeedService.setModifier: No AlphaValue instance for modifier: " .. p1 .. ". Was it defined in WalkSpeedSettings?")
		return
	end
	local v3 = if p2 then "In" else "Out"
	local v4 = WalkSpeedTweens[p1] or {}
	local v5 = v4[v3] or v4
	v1.target(v12, (v4[v3] or v4) and v5.Damping or t4[v3], v5 and v5.Frequency or t5[v3], {
		Value = if p2 then 1 else 0
	})
end
function t.getModifierEnabled(p1) --[[ getModifierEnabled | Line: 117 | Upvalues: t2 (ref) ]]
	return t2[p1] or false
end
function t.getModifierValue(p1) --[[ getModifierValue | Line: 128 | Upvalues: v5 (ref) ]]
	return v5[p1]
end
function t.getModifierAlpha(p1) --[[ getModifierAlpha | Line: 139 | Upvalues: t3 (ref) ]]
	local v1 = t3[p1]
	if v1 then
		return v1.Value
	else
		return nil
	end
end
function t.ResetStates() --[[ ResetStates | Line: 147 | Upvalues: t2 (ref), t (copy) ]]
	for k in pairs(t2) do
		t.setModifier(k, false)
	end
end
function t.getTotalModifierValues() --[[ getTotalModifierValues | Line: 158 | Upvalues: t3 (ref), v5 (ref) ]]
	local sum = 0
	for k, v in pairs(t3) do
		local v1 = v5[k]
		if typeof(v1) == "number" then
			sum = sum + v1 * v.Value
		end
	end
	return sum
end
function t.Update(p1) --[[ Update | Line: 178 | Upvalues: v3 (copy), t (copy), MinWalkSpeed (copy), MaxWalkSpeed (copy) ]]
	local v1 = v3.Player.Character and v3.Player.Character:FindFirstChildWhichIsA("Humanoid")
	if v1 then
		v1.WalkSpeed = math.clamp((16 + t.getTotalModifierValues()) * v3:GetWithModifiers("WalkSpeedMultiplier"), MinWalkSpeed, MaxWalkSpeed)
	end
end
function t.Init(p1) --[[ Init | Line: 201 | Upvalues: t (copy), WalkSpeedSettings (ref), Players (copy), v5 (ref), v6 (ref), t3 (ref), t2 (ref), RunService (copy) ]]
	t.BaseValues = WalkSpeedSettings
	local LocalPlayer = Players.LocalPlayer
	if not LocalPlayer then
		warn("WalkSpeedService:Init() - LocalPlayer not found! Alpha NumberValues will not be created.")
		return
	end
	for k, v in pairs(WalkSpeedSettings) do
		local v1 = true
		if typeof(v5[k]) ~= "number" then
			if typeof(v) == "number" then
				v5[k] = v
			else
				warn("WalkSpeedService:Init() - Modifier \'" .. k .. "\' in WalkSpeedSettings does not have a valid numeric speed value. Skipping AlphaValue creation.")
				v1 = false
			end
		end
		if v1 then
			local v3 = Instance.new("NumberValue")
			v3.Name = k .. "Alpha"
			v3.Value = 0
			local v4 = LocalPlayer:FindFirstChild(v3.Name)
			if v4 then
				v6:GiveTask(v4:Destroy())
			end
			t3[k] = v3
			v6:GiveTask(v3)
			if t2[k] == nil then
				t2[k] = false
			end
		end
	end
	t.modifierEnabledCache = t2
	v6:GiveTask(RunService.Heartbeat:Connect(t.Update))
end
function t.Destroy(p1) --[[ Destroy | Line: 262 | Upvalues: v6 (ref), v5 (ref), t2 (ref), t3 (ref) ]]
	if not v6 then
		v5 = {}
		t2 = {}
		t3 = {}
		return
	end
	v6:Destroy()
	v6 = nil
	v5 = {}
	t2 = {}
	t3 = {}
end
t:Init()
return t