-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local UITeleport = game.ReplicatedStorage.Remotes.Misc.UITeleport
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local MainFrame = script.Parent.MainFrame
local Teleport = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("Teleport")
function init() --[[ init | Line: 9 | Upvalues: MainFrame (copy), Tween (copy), UITeleport (copy) ]]
	for k, v in pairs(MainFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("ImageButton") then
			Tween:AddButton(v, nil, nil, nil, true)
			v.MouseButton1Click:Connect(function() --[[ Line: 13 | Upvalues: Tween (ref), MainFrame (ref), UITeleport (ref), v (copy) ]]
				Tween:AddButton("Close", MainFrame)
				UITeleport:FireServer(v.Name)
			end)
		end
	end
end
init()
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(Teleport, MainFrame)