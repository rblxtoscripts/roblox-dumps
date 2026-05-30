-- https://lua.expert/
local v1 = 1760896800
local TextLabel = script.Parent.BillboardGui.TextLabel
local function formatTime(p1) --[[ formatTime | Line: 6 ]]
	local v1 = math.floor(p1 / 86400)
	local v2 = p1 % 86400
	local v3 = math.floor(v2 / 3600)
	local v4 = v2 % 3600
	return string.format("%dD %02dH %02dM %02dS", v1, v3, math.floor(v4 / 60), v4 % 60)
end
(function() --[[ startCountdown | Line: 17 | Upvalues: v1 (ref), TextLabel (copy) ]]
	while true do
		local v12 = os.time()
		local v2 = v1 - v12
		if v2 <= 0 then
			v1 = os.time() + 600
			v2 = v1 - v12
		end
		local v4 = math.floor(v2 / 86400)
		local v5 = v2 % 86400
		local v6 = math.floor(v5 / 3600)
		local v7 = v5 % 3600
		TextLabel.Text = string.format("%dD %02dH %02dM %02dS", v4, v6, math.floor(v7 / 60), v7 % 60)
		wait(1)
	end
end)()