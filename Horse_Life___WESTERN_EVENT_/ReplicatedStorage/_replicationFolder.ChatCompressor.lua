-- https://lua.expert/
local tbl = {
	ExtraData = "e",
	FromSpeaker = "f",
	ID = "I",
	IsFiltered = "if",
	IsFilterResult = "ifr",
	Message = "m",
	MessageLength = "ml",
	MessageLengthUtf8 = "ml8",
	MessageType = "mt",
	OriginalChannel = "o",
	SpeakerDisplayName = "sn",
	SpeakerUserId = "su",
	Time = "t",
	All = "a",
	System = "sy",
	Tags = "ta",
	TagText = "tt",
	TagColor = "tc",
	NameColor = "nc",
	Developer = "dt",
	Tester = "ttt",
	Staff = "stt",
	["Content Creator"] = "cct",
	Artist = "art"
}
local t = {
	number = {
		compress = function(p1) --[[ compress | Line: 32 ]]
			if p1 >= 4294967295 then
				return p1
			end
			if p1 < 0 then
				return p1
			else
				return string.pack("I", p1)
			end
		end,
		decompress = function(p1) --[[ decompress | Line: 41 ]]
			if tonumber(p1) then
				return p1
			else
				return string.unpack("I", p1)
			end
		end
	},
	Color3 = {
		compress = function(p1) --[[ compress | Line: 49 ]]
			local v2 = math.floor(p1.r * 255 + 0.5)
			local v4 = math.floor(p1.g * 255 + 0.5)
			return string.pack("I", v2 * 65536 + v4 * 256 + math.floor(p1.b * 255 + 0.5))
		end,
		decompress = function(p1) --[[ decompress | Line: 57 ]]
			if typeof(p1) == "Color3" then
				return p1
			else
				local v1 = string.unpack("I", p1)
				local v2 = math.floor(v1 / 65536) % 256
				return Color3.new(v2 / 255, math.floor(v1 / 256) % 256 / 255, v1 % 256 / 255)
			end
		end
	}
}
local t2 = {
	NameColor = t.Color3,
	ChatColor = t.Color3,
	SpeakerUserId = t.number,
	ID = t.number,
	MessageLength = t.number,
	MessageLengthUtf8 = t.number,
	Time = t.number,
	TagColor = t.Color3
}
local t3 = {}
local t4 = {}
for k, v in pairs(tbl) do
	if t3[v] then
		warn(k, "has compression for", v, "and is not unique")
	end
	t3[v] = true
end
local t5 = {}
for k, v in pairs(tbl) do
	t5[v] = k
end
function t4._decompress(p1, p2, p3) --[[ _decompress | Line: 96 | Upvalues: t5 (copy) ]]
	if p3 then
		return p3.decompress(p2)
	else
		return t5[p2] or p2
	end
end
function t4._compress(p1, p2) --[[ _compress | Line: 103 | Upvalues: t (copy), tbl (copy) ]]
	local v1 = typeof(p2)
	if t[v1] then
		return t[v1].compress(p2)
	else
		return tbl[p2] or p2
	end
end
function t4.Compress(p1, p2) --[[ Compress | Line: 111 | Upvalues: t4 (copy) ]]
	local t = {}
	for k, v in pairs(p2) do
		local v1, v2
		local v3 = t4:_compress(k)
		if typeof(v) == "table" then
			v1, v2 = v3, p1:Compress(v)
		elseif v3 == "Message" then
			v1 = v3
			v2 = v
		else
			v1, v2 = v3, t4:_compress(v)
		end
		t[v1] = v2
	end
	return t
end
function t4.Decompress(p1, p2) --[[ Decompress | Line: 127 | Upvalues: t4 (copy), t2 (copy) ]]
	local t = {}
	for k, v in pairs(p2) do
		local v1, v2
		local v3 = t4:_decompress(k)
		if typeof(v) == "table" then
			v1, v2 = v3, p1:Decompress(v)
		elseif v3 == "Message" then
			v1 = v3
			v2 = v
		else
			v1, v2 = v3, t4:_decompress(v, t2[v3] or nil)
		end
		t[v1] = v2
	end
	return t
end
return t4