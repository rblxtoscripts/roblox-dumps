-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Throttle")
local v3 = Library:Load("Network")
local v4 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Template = v4:WaitForChild("Template")
local List = v4:WaitForChild("ScrollingFrame"):WaitForChild("List")
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local Menu = PlayerGui:WaitForChild("MainGui"):WaitForChild("Menu"):WaitForChild("Menu")
game:GetService("MarketplaceService")
local v6 = v2.new(3, 10)
v6.ThrottlePenaltySeconds = 10
v4.Position = UDim2.new(0.5, 0, 0, Menu.AbsoluteSize.Y + Menu.AbsolutePosition.Y + 2)
Menu:GetPropertyChangedSignal("Size"):Connect(function() --[[ Line: 24 | Upvalues: v4 (copy), Menu (copy) ]]
	v4.Position = UDim2.new(0.5, 0, 0, Menu.AbsoluteSize.Y + Menu.AbsolutePosition.Y + 2)
end)
Menu:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 27 | Upvalues: v4 (copy), Menu (copy) ]]
	v4.Position = UDim2.new(0.5, 0, 0, Menu.AbsoluteSize.Y + Menu.AbsolutePosition.Y + 2)
end)
if _G.GamepadEnabled then
	v4.UIScale.Scale = 1.3
end
math.floor(MainGui.AbsoluteSize.X * 0.66 / Template.AbsoluteSize.X)
math.floor(MainGui.AbsoluteSize.Y / Template.AbsoluteSize.Y)
math.floor(MainGui.AbsoluteSize.X / Template.AbsoluteSize.X)
local v10 = GuiManager:RegisterWindow(v4)
local v11 = GuiManager:RegisterListView(v4, List)
local v12 = nil
while LocalPlayer.Character == nil or LocalPlayer.Character:FindFirstChild("Humanoid") == nil do
	wait()
end
wait(1)
local RigType = LocalPlayer.Character.Humanoid.RigType
local v13 = v1:SendData("GetPurchasedEmotes", "PlayerChannel", 10) or v1:SendData("GetPurchasedEmotes", "PlayerChannel", 10) or {}
local t = {}
local t2 = {
	{
		Name = "Hi",
		GroupColor = "Bright blue"
	},
	{
		Name = "Bye",
		GroupColor = "Bright blue",
		EnglishOnly = true
	},
	{
		Name = "Lick",
		GroupColor = "Bright red",
		CharacterType = "Dog"
	},
	{
		Name = "Bark",
		GroupColor = "Bright red",
		CharacterType = "Dog"
	},
	{
		Name = "Sit",
		GroupColor = "Bright blue",
		CharacterType = "Dog"
	},
	{
		Name = "Sleep",
		GroupColor = "Bright blue",
		CharacterType = "Dog"
	},
	{
		Name = "Dance",
		GroupColor = "Bright yellow",
		CharacterType = "Dog"
	},
	{
		Name = "Grab",
		GroupColor = "Bright yellow",
		CharacterType = "Rat"
	},
	{
		Name = "Poop",
		GroupColor = "Bright yellow",
		CharacterType = "Rat"
	},
	{
		Name = "Dead",
		GroupColor = "Bright blue",
		CharacterType = "Rat"
	},
	{
		Name = "Sleep",
		GroupColor = "Bright blue",
		CharacterType = "Rat"
	},
	{
		Name = "Dance",
		GroupColor = "Bright yellow",
		CharacterType = "Rat"
	},
	{
		Name = "Sit",
		GroupColor = "Bright blue",
		CharacterType = "Gubby"
	},
	{
		Name = "Speak",
		GroupColor = "Bright blue",
		CharacterType = "Gubby"
	},
	{
		Name = "Grow",
		GroupColor = "Bright blue",
		CharacterType = "Gubby"
	},
	{
		Name = "Shrink",
		GroupColor = "Bright blue",
		CharacterType = "Gubby"
	},
	{
		Name = "Glee",
		GroupColor = "Bright red"
	},
	{
		Name = "Sad",
		GroupColor = "Bright red"
	},
	{
		Name = "Laugh",
		GroupColor = "Bright red"
	},
	{
		Name = "Think",
		GroupColor = "Bright red"
	},
	{
		Name = "Scared",
		GroupColor = "Bright red"
	},
	{
		Name = "Amazed",
		GroupColor = "Bright red"
	},
	{
		Name = "Angry",
		GroupColor = "Bright red"
	},
	{
		Name = "Confused",
		GroupColor = "Bright red"
	},
	{
		Name = "Whistle",
		GroupColor = "Bright blue"
	},
	{
		Name = "Sleep",
		GroupColor = "Bright blue"
	},
	{
		Name = "Clap",
		GroupColor = "Bright blue"
	},
	{
		Name = "Disgust",
		GroupColor = "Bright green",
		PackGroup = "EmotePack"
	},
	{
		Name = "Evil",
		GroupColor = "Bright green",
		PackGroup = "EmotePack"
	},
	{
		Name = "Shocked",
		GroupColor = "Bright green",
		PackGroup = "EmotePack"
	},
	{
		Name = "Die",
		GroupColor = "Bright green",
		PackGroup = "EmotePack"
	},
	{
		Name = "Sit",
		GroupColor = "Bright blue"
	},
	{
		Name = "Trip",
		GroupColor = "Bright yellow"
	},
	{
		Name = "Dance",
		GroupColor = "Bright yellow"
	},
	{
		Name = "Dance2",
		GroupColor = "Bright yellow"
	},
	{
		Name = "Dance3",
		GroupColor = "Bright yellow"
	},
	{
		Name = "Shuffle",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "Swing",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "Easy",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "HipHop",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "HipHop2",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "Flair",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "Marashin",
		GroupColor = "Bright yellow",
		R15Only = true
	},
	{
		Name = "Dolphin",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Monkey",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Happy",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Floss",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Cutesy",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Samba",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Twirl",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Cha Cha",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Slide",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Around Town",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Shuffler",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Rock",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Feet",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Robot",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Jacks",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Sleepy",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Idol",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Cower",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Celebrate",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Fashion",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Jump Wave",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	},
	{
		Name = "Trantrum",
		GroupColor = "Bright yellow",
		R15Only = true,
		PremiumOnly = true
	}
}
local t3 = {}
local function FilterEmotes() --[[ FilterEmotes | Line: 173 | Upvalues: t (ref), t2 (copy), v5 (copy), LocalPlayer (copy) ]]
	local t3 = {}
	t = {}
	for i, v in ipairs(t2) do
		if (v.EnglishOnly == nil or v5.IsEnglish()) and (not LocalPlayer.Character or LocalPlayer.Character:GetAttribute("CharacterType") == v.CharacterType) then
			table.insert(t3, v)
		end
	end
	return t3
end
jumpDetection = nil
UIEvents.ListItemPressed.Event:connect(function(p1, p2, p3, p4) --[[ Line: 189 | Upvalues: v4 (copy), MainGui (copy), v10 (copy), Debug (copy), LocalPlayer (copy), v5 (copy), v13 (ref), v3 (copy), t3 (copy), v6 (copy) ]]
	if p1 ~= v4 then
		return
	end
	if MainGui.AbsoluteSize.Y / 3 < v4.AbsolutePosition.Y + v4.AbsoluteSize.Y then
		v10:SetVisible(false)
	end
	local v1 = Debug.Enabled and (Debug.OwnsPremium and Enum.MembershipType.Premium or Enum.MembershipType.None) or LocalPlayer.MembershipType
	if p4.PremiumOnly and (v1 ~= Enum.MembershipType.Premium and not (LocalPlayer:FindFirstChild("VIP") or v5.PlaceSettings.DisableAdvantageousFeatures)) then
		v10:SetVisible(false)
		workspace.Main.OpenCatalogTab.OpenCatalogTab:Fire("GamePasses")
		workspace.Main.ShowGamePassPrompt:Fire("VIP")
		return
	end
	if p4.PackGroup ~= nil and not (v13[p4.PackGroup] or v5.PlaceSettings.DisableAdvantageousFeatures) then
		v10:SetVisible(false)
		workspace.Main.OpenCatalogTab.OpenCatalogTab:Fire("GamePasses")
		workspace.Main.ShowGamePassPrompt:Fire(p4.PackGroup)
		return
	end
	if p4.Name == "Lick" then
		v3:FireServer("StartLicking")
	end
	if p4.Name == "Grow" then
		v3:FireServer("GubbyGrow")
	end
	if p4.Name == "Shrink" then
		v3:FireServer("GubbyShrink")
	end
	if p4.Name == "Grab" then
		v3:FireServer("GrabNearbyObject")
	end
	if p4.Name == "Poop" then
		v3:FireServer("Poop")
	end
	if v5.EmoteToEmoji[p4.Name] and (not t3[p4.Name] and v6:CallCheck(LocalPlayer)) then
		_G.Chat(v5.EmoteToEmoji[p4.Name], false, false)
	end
	if p4.Name == "Trip" then
		if jumpDetection then
			game.ReplicatedStorage.RagdollEnabled.RagdollEnabled:Fire(false)
			jumpDetection:Disconnect()
			jumpDetection = nil
			return
		end
		if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			game.ReplicatedStorage.RagdollEnabled.RagdollEnabled:Fire(true, LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector)
			jumpDetection = LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Jump"):Connect(function() --[[ Line: 249 ]]
				game.ReplicatedStorage.RagdollEnabled.RagdollEnabled:Fire(false)
				jumpDetection:Disconnect()
				jumpDetection = nil
			end)
		end
	else
		v3:FireServer("EmotePlayed", p4.Name)
		game.Workspace.Animation.PlayAnimation.PlayAnimation:Fire(p4.Name, 0.3)
	end
end)
function ListDisplayFunction(p1, p2, p3, p4) --[[ Line: 267 | Upvalues: v5 (copy), RigType (copy), Debug (copy), LocalPlayer (copy), v13 (ref) ]]
	p2.TextLabel.Text = v5.EmoteToEmoji[p3.Name] or p3.Name
	if p3.R15Only and RigType == Enum.HumanoidRigType.R6 then
		p2.Visible = false
	end
	if v5.EmoteToEmoji[p3.Name] then
		p2.TextLabel.Size = UDim2.new(p2.TextLabel.Size.X.Scale, p2.TextLabel.Size.X.Offset, 0.8, 0)
	end
	local v2 = Debug.Enabled and (Debug.OwnsPremium and Enum.MembershipType.Premium or Enum.MembershipType.None) or LocalPlayer.MembershipType
	if p3.PackGroup == nil or (v13[p3.PackGroup] or v5.PlaceSettings.DisableAdvantageousFeatures) then
		if p3.PremiumOnly and (v2 ~= Enum.MembershipType.Premium and not (LocalPlayer:FindFirstChild("VIP") or v5.PlaceSettings.DisableAdvantageousFeatures)) then
			p2.TextLabel.TextTransparency = 0.7
			p2.VIPCrown.Visible = true
		else
			p2.TextLabel.TextTransparency = 0
		end
	else
		p2.TextLabel.TextTransparency = 0.7
	end
	if p3.Name == "Bye" then
		p2.TextLabel.Rotation = 180
	else
		p2.TextLabel.Rotation = 0
	end
end
local function Refresh() --[[ Refresh | Line: 313 | Upvalues: FilterEmotes (copy), v11 (copy), Template (copy) ]]
	v11:UpdateData(FilterEmotes(), Template, ListDisplayFunction)
end
workspace.Main.PlayerHasVIP.OnClientEvent:connect(function(p1) --[[ Line: 370 | Upvalues: LocalPlayer (copy), FilterEmotes (copy), v11 (copy), Template (copy) ]]
	if p1 ~= LocalPlayer then
		return
	end
	v11:UpdateData(FilterEmotes(), Template, ListDisplayFunction)
end)
workspace.Main.EmotePackPurchased.OnClientEvent:connect(function(p1) --[[ Line: 376 | Upvalues: v12 (ref), v13 (ref), v1 (copy), FilterEmotes (copy), v11 (copy), Template (copy), v10 (copy) ]]
	v12 = p1
	v13 = v1:SendData("GetPurchasedEmotes", "PlayerChannel", 10)
	v11:UpdateData(FilterEmotes(), Template, ListDisplayFunction)
	v10.FirstSelectedObject = v11.ListItems[1].Object
	v10:SetVisible(true)
end)
game.Players.PlayerMembershipChanged:Connect(function(p1) --[[ Line: 385 ]]
	local isPremium = p1.MembershipType == Enum.MembershipType.Premium
end)
v11:UpdateData(FilterEmotes(), Template, ListDisplayFunction)
v3:BindEvents({
	PlayerMorphed = function() --[[ PlayerMorphed | Line: 395 | Upvalues: FilterEmotes (copy), v11 (copy), Template (copy) ]]
		v11:UpdateData(FilterEmotes(), Template, ListDisplayFunction)
	end,
	PlayerRespawned = function(p1) --[[ PlayerRespawned | Line: 398 | Upvalues: LocalPlayer (copy), FilterEmotes (copy), v11 (copy), Template (copy) ]]
		if p1 ~= LocalPlayer then
			return
		end
		v11:UpdateData(FilterEmotes(), Template, ListDisplayFunction)
	end
})
v10.FirstSelectedObject = v11.ListItems[1].Object