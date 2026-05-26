-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Done = v1:WaitForChild("Done")
local InputText = v1:WaitForChild("InputText")
local Clear = v1:WaitForChild("Clear")
local v2 = GuiManager:RegisterWindow(v1)
v2.FirstSelectedObject = InputText
v2:SetConsoleSize(UDim2.new(1, 0, 0, 280))
if _G.GamepadEnabled then
	InputText.TextSize = 28
end
message = nil
local v3 = nil
local v4 = nil
function submit() --[[ submit | Line: 35 | Upvalues: InputText (copy), v4 (ref), v3 (ref), Dialog (copy), v2 (copy) ]]
	if v4 < string.len(InputText.Text) then
		InputText.Text = string.sub(InputText.Text, 1, v4)
	end
	if v3 ~= "None" then
		InputText.Text = workspace.Main.FilterString:InvokeServer(nil, InputText.Text, v3)
	end
	if not (string.find(InputText.Text, "##") and Dialog:GetChoice("Filtered Text", "Some of the words were filtered.", "Retry", "Done")) then
		v2:SetVisible(false)
		message = InputText.Text
	end
end
Done.MouseButton1Click:connect(submit)
Clear.MouseButton1Click:connect(function() --[[ Line: 58 | Upvalues: InputText (copy) ]]
	InputText.Text = ""
end)
function GetString(p1, p2) --[[ GetString | Line: 64 | Upvalues: v4 (ref), InputText (copy), v3 (ref), v2 (copy) ]]
	if not _G.StartedPlaying then
		return
	end
	v4 = p2 or 120
	InputText.Text = ""
	v3 = p1
	wait(0.5)
	v2:SetVisible(true)
	message = nil
	while message == nil do
		wait(0.2)
	end
	workspace.Main.ConfigEnded:Fire()
	return message
end
game.Workspace.MessageService.GetString.OnClientInvoke = GetString
game.Workspace.MessageService.GetString.GetString.OnInvoke = GetString
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 92 | Upvalues: v1 (copy) ]]
	if p1 ~= v1 or p2 then
		return
	end
	if message == nil then
		message = "..."
	end
	workspace.Main.ConfigEnded:Fire()
end)