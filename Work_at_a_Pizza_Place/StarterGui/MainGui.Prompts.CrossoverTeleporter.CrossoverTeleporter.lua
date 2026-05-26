-- https://lua.expert/
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local PrizeImage = v1:WaitForChild("PrizeImage")
local Teleport = v1:WaitForChild("Teleport")
local PlaceImage = v1:WaitForChild("PlaceImage")
local v3 = GuiManager:RegisterWindow(v1, "Top", "Top")
v3.FirstSelectedObject = Teleport
v3.IsCoreGuiWindow = true
if not (v2.CrossoverEventInfo.StartTick > os.time() or v2.CrossoverEventInfo.EndTick < os.time()) then
	PrizeImage.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=150&Height=150&AssetID=" .. v2.CrossoverEventInfo.PrizeAssetId
	spawn(function() --[[ Line: 26 | Upvalues: PlaceImage (copy), PrizeImage (copy) ]]
		if not _G.IsNewPlayer then
			game:GetService("ContentProvider"):PreloadAsync({ PlaceImage, PrizeImage })
		end
	end)
	local function Tele() --[[ Tele | Line: 33 | Upvalues: v3 (copy) ]]
		workspace.Main.TeleportToEventPlace:FireServer()
		v3:SetVisible(false)
	end
	UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 40 | Upvalues: v1 (copy) ]]
		if p1 ~= v1 or p2 then
			return
		end
		workspace.Main.CrossoverPopupClosed:FireServer()
	end)
	Teleport.MouseButton1Click:connect(Tele)
	PlaceImage.MouseButton1Click:connect(Tele)
end