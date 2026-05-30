-- https://lua.expert/
local t = {
	Jan = 1,
	Feb = 2,
	Mar = 3,
	Apr = 4,
	May = 5,
	Jun = 6,
	Jul = 7,
	Aug = 8,
	Sep = 9,
	Oct = 10,
	Nov = 11,
	Dec = 12
}
local HttpService = game:GetService("HttpService")
local function RFC2616DateStringToUnixTimestamp(p1) --[[ RFC2616DateStringToUnixTimestamp | Line: 16 | Upvalues: t (copy) ]]
	local v1, v2, v3, v4, v5, v6 = p1:match(".*, (.*) (.*) (.*) (.*):(.*):(.*) .*")
	return os.time({
		day = v1,
		month = t[v2],
		year = v3,
		hour = v4,
		min = v5,
		sec = v6
	})
end
local v1 = false
local v2 = nil
local v3 = nil
local v4 = nil
local function inited() --[[ inited | Line: 35 | Upvalues: v1 (ref) ]]
	return v1
end
local function init() --[[ init | Line: 39 | Upvalues: v1 (ref), HttpService (copy), v2 (ref), RFC2616DateStringToUnixTimestamp (copy), v3 (ref), v4 (ref) ]]
	if v1 then
		return
	end
	if not pcall(function() --[[ Line: 41 | Upvalues: HttpService (ref), v2 (ref), RFC2616DateStringToUnixTimestamp (ref), v3 (ref), v4 (ref) ]]
		local v1 = tick()
		v2 = RFC2616DateStringToUnixTimestamp(HttpService:RequestAsync({
			Url = "http://google.com"
		}).Headers.date)
		v3 = tick()
		v4 = (v3 - v1) / 2
	end) then
		warn("Cannot get time from google.com. Make sure that http requests are enabled!")
		v2 = os.time()
		v3 = tick()
		v4 = 0
	end
	v1 = true
end
return {
	inited = inited,
	init = init,
	time = function() --[[ time | Line: 60 | Upvalues: v1 (ref), init (copy), v2 (ref), v3 (ref), v4 (ref) ]]
		if v1 then
			return v2 + tick() - v3 - v4
		end
		init()
		return v2 + tick() - v3 - v4
	end
}