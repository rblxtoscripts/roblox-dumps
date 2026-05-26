-- https://lua.expert/
local function _deepCleanup(p1) --[[ _deepCleanup | Line: 9 ]]
	if type(p1) ~= "table" then
		return
	end
	for k, v in pairs(p1) do
		if type(v) == "table" and v.Disconnect then
			local v1, v2 = pcall(v.Disconnect, v)
			if not v1 then
				warn("\226\157\140 Failed to disconnect connection:", v2)
			end
		end
	end
	for k, v in pairs(p1) do
		p1[k] = nil
	end
end
function safeDestroy(p1) --[[ safeDestroy | Line: 36 | Upvalues: _deepCleanup (copy) ]]
	if not p1 then
		return
	end
	if type(p1) ~= "table" then
		p1:Destroy()
		return
	end
	if p1.Maid then
		p1.Maid:Destroy()
		p1.Maid = nil
	end
	_deepCleanup(p1)
	table.clear(p1)
	setmetatable(p1, nil)
end
return safeDestroy