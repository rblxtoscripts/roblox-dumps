-- https://lua.expert/
local t = {
	[126847247] = {
		band = Color3.fromRGB(202.2, 76, 168.6),
		box = Color3.fromRGB(235.6, 229.5, 200.3),
		lid = Color3.fromRGB(211.3, 188.6, 85.6)
	},
	[432880162] = {
		band = Color3.fromRGB(224, 160, 0),
		box = Color3.fromRGB(249, 243, 255),
		lid = Color3.fromRGB(136, 59, 153)
	}
}
function get_colors(p1) --[[ get_colors | Line: 14 | Upvalues: t (copy) ]]
	local v1 = t[p1]
	if not v1 then
		math.randomseed(p1 % 1073741824 + 6)
		local v2 = math.random()
		local v3 = math.random()
		local v4 = math.random()
		v1 = {
			band = Color3.fromHSV(v2, 0.8, 1),
			box = Color3.fromHSV(v2 + 0.3333333333333333, v3 * v4, v4),
			lid = Color3.fromHSV(v2 + 0.6666666666666666, v3 * (2 - v4) / 2, (2 - v4) / 2)
		}
	end
	return v1
end
return get_colors