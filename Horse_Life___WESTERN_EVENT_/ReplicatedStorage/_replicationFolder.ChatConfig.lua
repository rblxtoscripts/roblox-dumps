-- https://lua.expert/
local TextChatService = game:GetService("TextChatService")
local t = {
	ChatWindowConfiguration = {
		TextSize = 16
	}
}
local function apply(p1, p2) --[[ apply | Line: 9 ]]
	for v1, v2 in p2 do
		p1[v1] = v2
	end
end
for v1, v2 in t do
	if typeof(v2) == "table" then
		local v3 = TextChatService[v1]
		for v4, v5 in v2 do
			v3[v4] = v5
		end
		continue
	end
	for v6, v7 in v2 do
		TextChatService[v6] = v7
	end
end
return t