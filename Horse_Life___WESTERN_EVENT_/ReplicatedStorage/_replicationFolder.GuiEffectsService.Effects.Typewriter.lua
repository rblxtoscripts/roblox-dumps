-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Maid")
local t = {
	CharDelay = 0.03,
	DelayAfterPunctuation = 0.15
}
local t2 = {
	["."] = true,
	["!"] = true,
	["?"] = true,
	[","] = true,
	[";"] = true,
	[":"] = true
}
return function(p1, p2) --[[ Line: 20 | Upvalues: t (copy), v1 (copy), t2 (copy) ]]
	local v12 = p1.Instance
	if not v12 then
		return
	end
	local v2 = p1.Text or (v12.Text or "")
	local v3 = p1.CharDelay or t.CharDelay
	local v4 = p1.DelayAfterPunctuation or t.DelayAfterPunctuation
	local OnCharAdded = p1.OnCharAdded
	local OnComplete = p1.OnComplete
	local v5 = v1.new()
	v12.Text = ""
	v12.MaxVisibleGraphemes = -1
	v5:GiveTask(task.spawn(function() --[[ Line: 37 | Upvalues: v12 (copy), v2 (copy), v5 (ref), OnCharAdded (copy), t2 (ref), v4 (copy), v3 (copy), OnComplete (copy) ]]
		v12.Text = v2
		v12.MaxVisibleGraphemes = 0
		for i = 1, utf8.len(v2) do
			if not v5 then
				return
			end
			v12.MaxVisibleGraphemes = i
			if OnCharAdded then
				OnCharAdded(i, v2)
			end
			task.wait(t2[utf8.char(utf8.codepoint(v2, utf8.offset(v2, i)))] and v4 or v3)
		end
		v12.MaxVisibleGraphemes = -1
		if not OnComplete then
			return
		end
		OnComplete()
	end))
	return function() --[[ Line: 64 | Upvalues: v5 (ref), v12 (copy) ]]
		if v5 then
			v5:Destroy()
			v5 = nil
		end
		v12.MaxVisibleGraphemes = -1
	end
end