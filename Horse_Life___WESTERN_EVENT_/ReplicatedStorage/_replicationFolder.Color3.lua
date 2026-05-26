-- https://lua.expert/
local function round(p1) --[[ round | Line: 1 ]]
	return math.floor(p1 + 0.5)
end
local v1 = setmetatable({
	fromHex = function(p1) --[[ fromHex | Line: 6 ]]
		local v1 = p1:gsub("#", "")
		return Color3.fromRGB(tonumber("0x" .. v1:sub(1, 2)), tonumber("0x" .. v1:sub(3, 4)), (tonumber("0x" .. v1:sub(5, 6))))
	end,
	toHex = function(p1) --[[ toHex | Line: 11 ]]
		local v2 = math.floor(p1.r * 255 + 0.5)
		local v4 = math.floor(p1.g * 255 + 0.5)
		local t = {}
		for v6 in (v2 .. "," .. v4 .. "," .. math.floor(p1.b * 255 + 0.5)):gmatch("%d+") do
			table.insert(t, ("%02X"):format((tonumber(v6))))
		end
		return table.concat(t)
	end
}, {
	__index = Color3
})
local function labDistance(p1, p2) --[[ labDistance | Line: 23 ]]
	local v1 = p1.L - p2.L
	local v2 = p1.a - p2.a
	local v3 = p1.b - p2.b
	return math.sqrt(v1 * v1 + v2 * v2 + v3 * v3)
end
function v1.calculate_score(p1, p2) --[[ Line: 31 ]]
	local v1 = p1.L - p2.L
	local v2 = p1.a - p2.a
	local v3 = p1.b - p2.b
	return math.sqrt(v1 * v1 + v2 * v2 + v3 * v3)
end
local function cbrt(p1) --[[ cbrt | Line: 37 ]]
	return math.pow(p1, 0.3333333333333333)
end
function v1.linear_srgb_to_oklab(p1) --[[ Line: 43 ]]
	local v4 = math.pow(0.4122214708 * p1.r + 0.5363325363 * p1.g + 0.0514459929 * p1.b, 0.3333333333333333)
	local v5 = math.pow(0.2119034982 * p1.r + 0.6806995451 * p1.g + 0.1073969566 * p1.b, 0.3333333333333333)
	local v6 = math.pow(0.0883024619 * p1.r + 0.2817188376 * p1.g + 0.6299787005 * p1.b, 0.3333333333333333)
	return {
		L = 0.2104542553 * v4 + 0.793617785 * v5 - 0.0040720468 * v6,
		a = 1.9779984951 * v4 - 2.428592205 * v5 + 0.4505937099 * v6,
		b = 0.0259040371 * v4 + 0.7827717662 * v5 - 0.808675766 * v6
	}
end
function v1.oklab_to_linear_srgb(p1) --[[ Line: 60 ]]
	local v1 = p1.L + 0.3963377774 * p1.a + 0.2158037573 * p1.b
	local v2 = p1.L - 0.1055613458 * p1.a - 0.0638541728 * p1.b
	local v3 = p1.L - 0.0894841775 * p1.a - 1.291485548 * p1.b
	local v4 = v1 * v1 * v1
	local v5 = v2 * v2 * v2
	local v6 = v3 * v3 * v3
	return {
		r = 4.0767416621 * v4 - 3.3077115913 * v5 + 0.2309699292 * v6,
		g = -1.2684380046 * v4 + 2.6097574011 * v5 - 0.3413193965 * v6,
		b = -0.0041960863 * v4 - 0.7034186147 * v5 + 1.707614701 * v6
	}
end
function v1.robloxRGB_to_sRGB(p1) --[[ Line: 77 ]]
	return {
		r = math.floor(p1.r * 255 + 0.5),
		g = math.floor(p1.g * 255 + 0.5),
		b = math.floor(p1.b * 255 + 0.5)
	}
end
return v1