-- https://lua.expert/
local t = {}
t.__index = t
local function tableFinalizer(p1) --[[ tableFinalizer | Line: 16 ]]
	return p1.Destroy or (p1.destroy or (p1.Disconnect or (p1.DisconnectAll or p1.DoCleaning)))
end
local function safeCancel(p1) --[[ safeCancel | Line: 21 ]]
	if pcall(task.cancel, p1) then
		return
	end
	task.defer(pcall, task.cancel, p1)
end
local t2 = {
	["function"] = task.spawn,
	thread = safeCancel,
	Instance = game.Destroy,
	RBXScriptConnection = Instance.new("BindableEvent").Event:Connect(function() --[[ Line: 31 ]] end).Disconnect
}
function t.new() --[[ new | Line: 34 | Upvalues: t (copy) ]]
	return setmetatable({}, t)
end
function t.add(p1, p2) --[[ add | Line: 38 | Upvalues: t2 (copy) ]]
	local v1 = typeof(p2)
	local v2 = t2[v1]
	if not v2 and v1 == "table" then
		v2 = p2.Destroy or (p2.destroy or (p2.Disconnect or (p2.DisconnectAll or p2.DoCleaning)))
	end
	if v2 then
		p1[p2] = v2
		return p2
	end
	error(("cannot destruct item of type %* (no finalizer is defined)"):format(v1), 2)
end
function t.remove(p1, p2) --[[ remove | Line: 51 ]]
	p1[p2] = nil
	return p2
end
function t.destroy(p1) --[[ destroy | Line: 56 ]]
	for v1, v2 in p1 do
		v2(v1)
	end
	table.clear(p1)
end
return t