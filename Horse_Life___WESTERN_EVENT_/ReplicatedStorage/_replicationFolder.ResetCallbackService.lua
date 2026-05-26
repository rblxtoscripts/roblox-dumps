-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils").GetConfig("ResetCallback")()
local v2 = Instance.new("BindableEvent")
t.ResetBindable = v2
local v3 = nil
local v4 = nil
local v5 = Sonar("PlayerWrapper").GetClient()
function t.GetResetBindable() --[[ GetResetBindable | Line: 23 | Upvalues: v2 (copy) ]]
	return v2
end
function t.SetCallback(p1) --[[ SetCallback | Line: 27 | Upvalues: v4 (ref) ]]
	v4 = p1
end
function t.SetDefaultCallback(p1) --[[ SetDefaultCallback | Line: 31 | Upvalues: v3 (ref) ]]
	v3 = p1
end
function t.ClearCallback() --[[ ClearCallback | Line: 35 | Upvalues: v4 (ref) ]]
	v4 = nil
end
function t.Reset(p1) --[[ Reset | Line: 39 | Upvalues: v4 (ref), v3 (ref), v1 (copy), v5 (copy) ]]
	if v4 then
		return v4()
	end
	if v3 then
		return v3()
	end
	if not v1.KillPlayerOnReset then
		return true
	end
	local v12 = v5:GetCurrentCharacter()
	if v12 and v12.Reset then
		v12:Reset()
	end
	local v2 = v5:GetCharacter()
	if v2 then
		return v2:BreakJoints()
	else
		return true
	end
end
function t.Init(p1) --[[ Init | Line: 65 | Upvalues: v2 (copy) ]]
	v2.Event:Connect(function() --[[ Line: 66 | Upvalues: p1 (copy) ]]
		p1:Reset()
	end)
end
t:Init()
return t