-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("SoundFX")
local v2 = script.Parent
v2:WaitForChild("Save")
local name = v2:WaitForChild("name")
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local LocalPlayer = game.Players.LocalPlayer
game:GetService("Chat")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v3 = GuiManager:RegisterWindow(v2)
v3.FirstSelectedObject = name
local name_2 = v2.name
local v4 = nil
function mouseEnter() --[[ mouseEnter | Line: 24 | Upvalues: name_2 (copy) ]]
	name_2.BackgroundColor3 = Color3.new(153/255, 153/255, 153/255)
end
name_2.MouseEnter:connect(mouseEnter)
function mouseLeave(p1) --[[ mouseLeave | Line: 29 | Upvalues: name_2 (copy) ]]
	name_2.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
end
name_2.MouseLeave:connect(mouseLeave)
local v5 = false
function submit() --[[ submit | Line: 36 | Upvalues: name_2 (copy), Dialog (copy), v5 (ref), v4 (ref), v3 (copy), v1 (copy) ]]
	if name_2.Text == "" then
		Dialog:ShowMessage("No Name Given", "You must enter name.")
		return
	end
	if v5 then
		return
	end
	v5 = true
	if pcall(function() --[[ Line: 45 | Upvalues: v4 (ref), name_2 (ref) ]]
		v4 = game.Players:GetUserIdFromNameAsync(name_2.Text)
	end) and v4 then
		v3:SetVisible(false)
		workspace.Main.ConfigEnded:Fire()
	else
		v1:PlaySound("Invalid")
		Dialog:ShowMessage("Player does not exist", "Make sure you spelled the player\'s name correctly.")
	end
	v5 = false
end
script.Parent.Save.MouseButton1Click:connect(submit)
local function OnClientInvoke() --[[ OnClientInvoke | Line: 70 | Upvalues: v4 (ref), v3 (copy) ]]
	v4 = nil
	wait(0.5)
	v3:SetVisible(true)
	while v4 == nil do
		wait(0.2)
	end
	return v4
end
game.Workspace.MessageService.GetName.OnClientInvoke = OnClientInvoke
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 82 | Upvalues: v2 (copy), v4 (ref) ]]
	if p1 ~= v2 or p2 then
		return
	end
	if v4 == nil then
		v4 = "Dued1"
	end
	workspace.Main.ConfigEnded:Fire()
end)