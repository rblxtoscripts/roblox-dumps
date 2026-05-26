-- https://lua.expert/
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
return function(p1, p2) --[[ Line: 4 | Upvalues: TextService (copy), Players (copy) ]]
	local v1 = TextService:FilterStringAsync(p2, p1.Executor.UserId, Enum.TextFilterContext.PublicChat)
	for i, v in ipairs(Players:GetPlayers()) do
		p1:SendEvent(v, "Message", v1:GetChatForUserAsync(v.UserId), p1.Executor)
	end
	return "Created announcement."
end