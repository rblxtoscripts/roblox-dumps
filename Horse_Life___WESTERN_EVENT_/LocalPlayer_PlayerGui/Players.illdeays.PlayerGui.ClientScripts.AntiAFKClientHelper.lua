-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer
local v1 = TeleportService:GetLocalPlayerTeleportData()
if v1 and v1.antiAFK then
	TeleportService:Teleport(game.PlaceId, LocalPlayer)
	return
end
local AFKEvent = game.ReplicatedStorage:WaitForChild("AFKEvent")
local v2 = tick()
local function update() --[[ update | Line: 22 | Upvalues: v2 (ref) ]]
	v2 = tick()
end
UserInputService.InputBegan:Connect(update)
UserInputService.InputChanged:Connect(update)
while task.wait(1) do
	if tick() - v2 > 1080 then
		AFKEvent:FireServer()
		task.wait(10)
	end
end