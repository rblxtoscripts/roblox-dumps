-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("Global")
local v4 = v1.GetConfig("JoinSequence")()
local function runSequence(p1) --[[ runSequence | Line: 15 | Upvalues: v4 (copy) ]]
	for k, v in pairs(p1) do
		local v2, v3 = pcall(v)
		if not v2 then
			warn("\226\154\160\239\184\143 JoinSequenceService, Error running sequence function:", k, v3, debug.traceback())
		end
		if v4.IgnoreSequenceEndedAndStopIfReturned ~= nil and v3 == v4.IgnoreSequenceEndedAndStopIfReturned then
			return false
		end
		if v4.SequenceStopIfReturned ~= nil and v3 == v4.SequenceStopIfReturned then
			break
		end
	end
	return true
end
function t.StartDuringLoadingSequence() --[[ StartDuringLoadingSequence | Line: 44 | Upvalues: runSequence (copy), v4 (copy) ]]
	runSequence(v4.SequenceDuringLoadingScreen)
end
function t.StartAfterLoadingSequence() --[[ StartAfterLoadingSequence | Line: 48 | Upvalues: v2 (copy), v4 (copy), runSequence (copy) ]]
	v2.SetCoreGui(v4.CoreGuisAfterLoadingScreen)
	if not (v4.RunOnSequenceEnded and runSequence(v4.SequenceAfterLoadingScreen)) then
		return
	end
	v4.RunOnSequenceEnded()
end
function t.Init(p1) --[[ Init | Line: 62 | Upvalues: v4 (copy), v3 (copy) ]]
	local v1, v2 = pcall(function(...) --[[ Line: 63 | Upvalues: v4 (ref) ]]
		task.wait()
		return v4.RunAfterClientFinishedInitialising()
	end)
	if v1 then
		v3.CoreGuis = v4.CoreGuisAfterLoadingScreen
		return
	end
	warn("\226\154\160\239\184\143 JoinSequenceService, Error running after client finished initialising function:", v2, debug.traceback())
	v3.CoreGuis = v4.CoreGuisAfterLoadingScreen
end
return t