-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("PlaceTeleportService", {
	Deferred = true
})
local v3 = Sonar("StorageUtils")
local v4 = Sonar("safeDestroy")
local v5 = v3.GetConfig("PlaceTeleport")()
local function getSequenceData(p1) --[[ getSequenceData | Line: 121 | Upvalues: v5 (copy) ]]
	local v1 = v5.TeleportSequences[p1]
	if v1 then
		return v1
	end
	error(string.format("\226\154\160\239\184\143 TeleportSequence, Sequence data not found for name: %s", p1))
end
function t.new(p1) --[[ new | Line: 134 | Upvalues: t (copy), v1 (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Name = p1.Name
	v2.TeleportInfo = p1.TeleportInfo
	v2.TeleportSequenceData = v2.TeleportInfo.TeleportSequenceData
	v2.Gui = p1.Gui
	v2.JoinData = p1.JoinData
	local SequenceData = v2.SequenceData
	if not SequenceData then
		local v3 = v2.Name
		local v4 = v5.TeleportSequences[v3]
		if not v4 then
			error(string.format("\226\154\160\239\184\143 TeleportSequence, Sequence data not found for name: %s", v3))
		end
		SequenceData = v4(v2)
	end
	v2.SequenceData = SequenceData
	return v2
end
function t._runFunction(p1, p2, ...) --[[ _runFunction | Line: 154 ]]
	if p1.SequenceData[p2] then
		return p1.SequenceData[p2](p1, ...)
	else
		return nil
	end
end
function t.Start(p1) --[[ Start | Line: 165 | Upvalues: v2 (copy) ]]
	local v1 = p1:_runFunction("OnStarted", p1.TeleportInfo)
	if v1 and typeof(v1) == "Instance" then
		p1.Gui = v1
		v2.SetTeleportGui(v1)
	end
	p1:Teleport()
end
function t.Teleport(p1) --[[ Teleport | Line: 178 | Upvalues: v2 (copy) ]]
	task.spawn(v2.ReadyToTeleport, p1.Name)
	p1:_runFunction("OnTeleporting", p1.TeleportInfo)
end
function t.Fail(p1, p2) --[[ Fail | Line: 186 | Upvalues: v2 (copy) ]]
	p1:_runFunction("OnFailed", p2)
	v2.RemoveFailedTeleport()
	p1:Destroy()
end
function t.Setup(p1, p2) --[[ Setup | Line: 198 ]]
	for k, v in pairs(p2) do
		p1[k] = v
	end
	p1:_runFunction("OnSetup", p1.JoinData)
end
function t.GetGui(p1) --[[ GetGui | Line: 208 ]]
	return p1.Gui
end
function t.Destroy(p1) --[[ Destroy | Line: 213 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t.Create(p1) --[[ Create | Line: 220 | Upvalues: v5 (copy), t (copy) ]]
	local v1 = p1.Name
	local v2 = v5.TeleportSequences[v1]
	if not v2 then
		error(string.format("\226\154\160\239\184\143 TeleportSequence, Sequence data not found for name: %s", v1))
	end
	if v2 then
		return t.new(p1)
	else
		return nil
	end
end
return t