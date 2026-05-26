-- https://lua.expert/
local t = {}
local HttpService = game:GetService("HttpService")
local t2 = {}
local v1 = Random.new()
local function find(p1, p2) --[[ find | Line: 9 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		if v.cacheMin == p1 and v.cacheMin == p2 then
			return v
		end
		if v.min == p1 and v.max == p2 then
			return v
		end
	end
	return false
end
local function replenish(p1) --[[ replenish | Line: 27 | Upvalues: HttpService (copy) ]]
	p1.isReplenishing = true
	local t = {
		jsonrpc = "2.0",
		method = "generateIntegers",
		id = 42,
		params = {
			apiKey = "76bf3a7e-2bc5-431a-bdb5-a26634e03c63",
			n = 200,
			min = 1,
			max = 1000
		}
	}
	local t2 = {
		jsonrpc = "2.0",
		method = "getUsage",
		id = 42,
		params = {
			apiKey = "76bf3a7e-2bc5-431a-bdb5-a26634e03c63"
		}
	}
	print("FETCHING RANDOM NUBMER")
	local v1 = nil
	local v2 = nil
	task.spawn(function() --[[ Line: 56 | Upvalues: t2 (ref), HttpService (ref), t (ref), v1 (ref), v2 (ref), p1 (copy) ]]
		local v12, v22 = pcall(function() --[[ Line: 59 | Upvalues: t2 (ref), HttpService (ref), t (ref), v1 (ref) ]]
			t2 = HttpService:JSONEncode(t)
			v1 = HttpService:RequestAsync({
				Url = "https://api.random.org/json-rpc/4/invoke",
				Method = "POST",
				Headers = {
					["content-type"] = "application/json"
				},
				Body = t2
			})
			if v1 then
				v1 = HttpService:JSONDecode(v1.Body)
				print("LIMIT REQUEST RESPONSE", v1)
				print(v1, "RESPONSE")
			else
				error("NO RESPONSE")
			end
		end)
		if not v12 then
			task.spawn(function() --[[ Line: 83 | Upvalues: v22 (copy) ]]
				error(v22)
			end)
		end
		local v3, v4 = pcall(function() --[[ Line: 88 | Upvalues: t (ref), HttpService (ref), v2 (ref), p1 (ref) ]]
			t = HttpService:JSONEncode(t)
			v2 = HttpService:RequestAsync({
				Url = "https://api.random.org/json-rpc/4/invoke",
				Method = "POST",
				Headers = {
					["content-type"] = "application/json"
				},
				Body = t
			})
			if not v2 then
				error("NO RESPONSE")
			end
			if v2.StatusCode ~= 200 then
				error("Response code was not 200")
			end
			v2 = HttpService:JSONDecode(v2.Body)
			if not v2.error then
				print(v2, "RESPONSE")
				p1.numbers = v2.result.random.data
				p1.current = 1
				return
			end
			error(v2.error.message)
		end)
		p1.isReplenishing = false
		if v3 then
			return
		end
		task.spawn(function() --[[ Line: 121 | Upvalues: v4 (copy) ]]
			error(v4)
		end)
	end)
end
local function nextInt(p1) --[[ nextInt | Line: 128 | Upvalues: v1 (copy) ]]
	if #p1.numbers > 0 then
		local v12 = p1.numbers[p1.current]
		if v12 then
			print("GOT TRUE RANDOM")
			p1.current = p1.current + 1
			return v12
		end
		if not p1.isReplenishing then
			p1:replenish()
			return v1:NextInteger(p1.min, p1.max)
		end
	end
	return v1:NextInteger(p1.min, p1.max)
end
function t.new(p1, p2, p3) --[[ Line: 149 | Upvalues: find (copy), nextInt (copy), replenish (copy), t2 (copy) ]]
	local v1 = find(p2, p3)
	if v1 then
		return v1
	else
		local t = {
			current = 1,
			replenishAmount = 200,
			isReplenishing = false,
			numbers = {},
			min = p2,
			max = p3,
			getNum = nextInt,
			replenish = replenish
		}
		table.insert(t2, t)
		t:replenish()
		return t
	end
end
return t