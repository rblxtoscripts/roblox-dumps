-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local Done = v1:WaitForChild("Done")
local Message = v1:WaitForChild("Message")
local Title = v1:WaitForChild("Title")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local v2 = GuiManager:RegisterWindow(v1)
v2.FirstSelectedObject = Message
local v3 = nil
local function filterText(p1) --[[ filterText | Line: 22 ]]
	local v1 = ""
	for v2 in string.gmatch(p1, "%w+") do
		v1 = v1 .. " " .. v2
	end
	return v1
end
local v4 = nil
local v5 = 50
local v6 = nil
Done.MouseButton1Click:connect(function() --[[ Line: 33 | Upvalues: Message (copy), v5 (ref), v4 (ref), v6 (ref), Dialog (copy), v3 (ref), v2 (copy) ]]
	if not (string.len(Message.Text) < v5) then
		Dialog:ShowMessage("Name too long", "The name you entered has too many characters.")
		return
	end
	if v4 ~= "None" and v6 ~= Message.Text then
		Message.Text = workspace.Main.FilterString:InvokeServer(nil, Message.Text, v4)
	end
	if string.find(Message.Text, "##") then
		Dialog:ShowMessage("Text was Filtered", "Some words were filtered. Please try another name.")
	else
		v3 = Message.Text
		v2:SetVisible(false)
	end
end)
function waitForMessage() --[[ waitForMessage | Line: 52 | Upvalues: Message (copy), v6 (ref), v3 (ref), v2 (copy) ]]
	wait(0.5)
	Message.Text = v6 or ""
	v3 = nil
	v2:SetVisible(true)
	while v3 == nil do
		wait(0.2)
	end
end
local function OnClientInvoke(p1, p2, p3, p4) --[[ OnClientInvoke | Line: 63 | Upvalues: v5 (ref), v4 (ref), Title (copy), v6 (ref), v3 (ref) ]]
	if _G.StartedPlaying then
		v5 = p3 or 50
		v4 = p2
		Title.Text = p1
		v6 = p4
		waitForMessage()
		workspace.Main.ConfigEnded:Fire()
		return v3
	end
end
game.Workspace.MessageService.GetShortString.OnClientInvoke = OnClientInvoke
local function OnInvoke(p1, p2, p3, p4) --[[ OnInvoke | Line: 79 | Upvalues: v4 (ref), v5 (ref), Title (copy), v6 (ref), v3 (ref) ]]
	if _G.StartedPlaying then
		v4 = p2
		v5 = p3 or 50
		Title.Text = p1
		v6 = p4
		waitForMessage()
		workspace.Main.ConfigEnded:Fire()
		return v3
	end
end
game.Workspace.MessageService.GetShortString.GetShortString.OnInvoke = OnInvoke
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 97 | Upvalues: v1 (copy), v3 (ref) ]]
	if p1 ~= v1 or p2 then
		return
	end
	if v3 == nil then
		v3 = ""
	end
	workspace.Main.ConfigEnded:Fire()
end)