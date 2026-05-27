-- https://lua.expert/
local ServerScriptService = game:GetService("ServerScriptService")
local isGameId = game.GameId == 5749134964
return function() --[[ Line: 8 | Upvalues: isGameId (copy), ServerScriptService (copy) ]]
	if not isGameId then
		return "This command can only be used in the Test Build"
	end
	local CmdrShutdown = ServerScriptService:FindFirstChild("CmdrShutdown")
	if CmdrShutdown and CmdrShutdown:IsA("BindableEvent") then
		CmdrShutdown:Fire()
		return "Attempted soft shutdown"
	end
	if CmdrShutdown then
		return "Got bad shutdown bindable"
	else
		return "Failed to find shutdown bindable"
	end
end