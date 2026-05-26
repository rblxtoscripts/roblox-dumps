-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Tween")
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("Gui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v3 = Library:Load("Utility")
Library:Load("Events")
Library:Load("SoundFX")
Library:Load("CameraUtil")
Library:Load("Signal")
local v4 = Library:Load("Network")
Library:Load("Table")
local v5 = Library:Load("Maid")
local ScrollingFrame = v1:WaitForChild("List"):WaitForChild("ScrollingFrame")
local AssetLibraryManager = require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local Template = ScrollingFrame:WaitForChild("Template")
Template.Parent = game.ReplicatedStorage
local v6 = GuiManager:RegisterWindow(v1, "Left", "Right", 0.3, nil, true)
v6.UseCursor = true
local v7 = v5.new()
local v8 = nil
local t = {}
local v9 = AssetLibraryManager:GetItemsInCategories("Mailboxes")
function FetchOwnedMailboxes() --[[ FetchOwnedMailboxes | Line: 42 | Upvalues: v8 (ref), v3 (copy), t (ref) ]]
	v8 = v3:SendData("GetInventory", "PlayerChannel", 2, "Mailboxes") or v3:SendData("GetInventory", "PlayerChannel", 2, "Mailboxes")
	t = {}
	for i, v in ipairs(v8) do
		t[v.AssetId] = true
	end
end
function Refresh() --[[ Refresh | Line: 50 | Upvalues: ScrollingFrame (copy), v7 (copy), v9 (copy), Template (copy), t (ref), v2 (copy), v4 (copy), v6 (copy) ]]
	ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	v7:DoCleaning()
	for i, v in ipairs(v9) do
		local GamepassId = v.GamepassId
		local v1 = Template:Clone()
		v1.Visible = true
		v1.MailboxName.Text = v.Name
		v1.Price.Visible = not t[v.AssetId] and (if v.Price == 0 then false else true)
		v1.Price.PriceText.Text = v.Price ~= 0 and v2.FormatNumber("Number", v.Price, v1.Price.PriceText) or ""
		v1.Icon.Image = "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. v.ModelId
		v1.Buy.Visible = not t[v.AssetId]
		v1.Use.Visible = t[v.AssetId]
		v7:GiveTask(v1)
		if v1.Buy.Visible then
			v1.Buy.MouseButton1Click:Connect(function() --[[ Line: 71 | Upvalues: GamepassId (copy), v (copy), v4 (ref) ]]
				if GamepassId then
					workspace.Main.ShowGamePassPrompt:Fire(v.GamepassId)
				else
					v4:InvokeServer("BuyCatalogItem", v.AssetId, 1)
				end
			end)
		elseif v1.Use.Visible then
			v1.Use.MouseButton1Click:Connect(function() --[[ Line: 79 | Upvalues: v6 (ref), v4 (ref), v (copy) ]]
				v6:SetVisible(false)
				v4:FireServer("EquipMailbox", v.AssetId)
			end)
		end
		v1.Parent = ScrollingFrame
		if i == 1 then
			v6.FirstSelectedObject = v1
		end
	end
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 92 | Upvalues: v1 (copy) ]]
	if p1 ~= v1 or not p2 then
		return
	end
	FetchOwnedMailboxes()
	Refresh()
end)
v4:BindEvents({
	AssetPurchasedWithCoins = function() --[[ AssetPurchasedWithCoins | Line: 104 ]]
		FetchOwnedMailboxes()
		Refresh()
	end,
	GamepassPurchased = function() --[[ GamepassPurchased | Line: 108 ]]
		FetchOwnedMailboxes()
		Refresh()
	end
})