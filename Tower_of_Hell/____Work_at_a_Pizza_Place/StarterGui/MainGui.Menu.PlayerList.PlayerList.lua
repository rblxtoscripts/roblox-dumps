-- https://lua.expert/
local v1 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v2 = Library:Load("Network")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local Menu = MainGui.Menu:WaitForChild("Menu")
local v3 = false
local PlayerNameTemplate = v1:WaitForChild("PlayerNameTemplate")
local TeamNameTemplate = v1:WaitForChild("TeamNameTemplate")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v5 = GuiManager:RegisterWindow(v1)
v5.IsCoreGuiWindow = true
if _G.GamepadEnabled then
	PlayerNameTemplate.UIScale.Scale = 1.35
	TeamNameTemplate.UIScale.Scale = 1.35
	v1.Size = UDim2.new(0, 210, 1, 0)
	v1.Position = UDim2.new(1, -210, 0, 70)
	v1.Selectable = false
end
local v6 = v4.IsPartyServer and {} or (v4.PlaceSettings.CustomSpawnLocation and {} or { "Manager", "Cashier", "Cook", "Pizza Boxer", "Delivery", "Supplier", "On Break" })
local v7 = if #v6 == 0 then true else false
local tbl = {}
local t = {}
for i, v in ipairs(game.Teams:GetChildren()) do
	local v8 = v.TeamColor.Name
	tbl[v.Name] = v8
	t[v8] = v.Name
end
local t2 = {}
for k, v in pairs(tbl) do
	t2[k] = script.Parent:WaitForChild("TeamNameTemplate"):clone()
	t2[k].TeamName.Text = k
	t2[k].BackgroundColor3 = BrickColor.new(v).Color
	t2[k].Parent = script.Parent
	t2[k].Visible = not v7
end
local t3 = {}
function MoneyzUpdate(p1) --[[ MoneyzUpdate | Line: 77 | Upvalues: t3 (copy), v4 (copy) ]]
	if not t3[p1] then
		return
	end
	local TotalMoneyz = p1.TotalMoneyz.Value
	local v1 = t3[p1]
	v1.Moneyz.Text = v4.ShortFormNumber(TotalMoneyz)
	if TotalMoneyz >= 1000000 then
		v1.Moneyz.Font = "SourceSansBold"
		v1.PlayerName.Font = "SourceSansBold"
		v1.Moneyz.TextColor3 = Color3.new(0/255, 0/255, 0/255)
		v1.BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
		v1.Moneyz.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
		v1.PlayerName.TextStrokeColor3 = Color3.new(255/255, 255/255, 255/255)
		v1.PlayerName.TextColor3 = Color3.new(0/255, 0/255, 0/255)
		v1.BCIcon.ImageColor3 = Color3.new(0/255, 0/255, 0/255)
		v1.Friends.ImageColor3 = Color3.new(0/255, 0/255, 0/255)
		v1.VIP.ImageColor3 = Color3.new(0/255, 0/255, 0/255)
	elseif TotalMoneyz >= 800000 then
		v1.Moneyz.TextColor3 = Color3.fromRGB(234, 28, 252)
		v1.Moneyz.Font = "SourceSansBold"
		v1.Moneyz.TextStrokeTransparency = 0
		v1.Moneyz.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	elseif TotalMoneyz >= 500000 then
		v1.Moneyz.Font = "SourceSansBold"
		v1.Moneyz.TextColor3 = Color3.fromRGB(72, 255, 52)
	elseif TotalMoneyz >= 200000 then
		v1.Moneyz.Font = "SourceSansBold"
		v1.Moneyz.TextColor3 = Color3.fromRGB(255, 230, 87)
	elseif TotalMoneyz >= 100000 then
		v1.Moneyz.Font = "SourceSansBold"
		v1.Moneyz.TextColor3 = Color3.fromRGB(255, 255, 255)
	elseif TotalMoneyz >= 1000 then
		v1.Moneyz.Font = "SourceSans"
		v1.Moneyz.TextColor3 = Color3.fromRGB(255, 255, 255)
	elseif TotalMoneyz < 1000 then
		v1.Moneyz.TextColor3 = Color3.fromRGB(208, 208, 208)
		v1.Moneyz.Font = "SourceSansLight"
	end
	local v2 = game:GetService("TextService"):GetTextSize(v1.Moneyz.Text, v1.Moneyz.AbsoluteSize.Y, v1.Moneyz.Font, Vector2.new(100, v1.Moneyz.AbsoluteSize.Y)).X + 3
	v1.Moneyz.Size = UDim2.new(0, v2, v1.Moneyz.Size.Y.Scale, v1.Moneyz.Size.Y.Offset)
	local v3 = 0
	local Offset = v1.UIListLayout.Padding.Offset
	if v1.BCIcon.Visible then
		v3 = v3 + 16 + Offset
	end
	if v1.Friends.Visible then
		v3 = v3 + 16 + Offset
	end
	if v1.Padding.Visible then
		v3 = v3 + 16 + Offset
	end
	if v1.VIP.Visible then
		v3 = v3 + 18 + Offset
	end
	v1.PlayerName.Size = UDim2.new(1, -(v2 + v3 + Offset), v1.PlayerName.Size.Y.Scale, v1.PlayerName.Size.Y.Offset)
end
function RefreshList() --[[ RefreshList | Line: 158 | Upvalues: TeamNameTemplate (copy), PlayerNameTemplate (copy), t3 (copy), v6 (copy), tbl (copy), t2 (copy), v1 (copy) ]]
	local count = 0
	local Y = TeamNameTemplate.AbsoluteSize.Y
	local Y_2 = PlayerNameTemplate.AbsoluteSize.Y
	local v12 = game.Players:GetPlayers()
	table.sort(v12, function(p1, p2) --[[ Line: 166 ]]
		if p1:FindFirstChild("TotalMoneyz") == nil or p2:FindFirstChild("TotalMoneyz") == nil then
			return false
		end
		return p1.TotalMoneyz.Value > p2.TotalMoneyz.Value
	end)
	local function AddPlayerByTeamColor(p1) --[[ AddPlayerByTeamColor | Line: 173 | Upvalues: v12 (copy), t3 (ref), count (ref), Y_2 (copy) ]]
		for i, v in ipairs(v12) do
			if t3[v] and (p1 == nil or v.TeamColor == BrickColor.new(p1)) then
				t3[v].Position = UDim2.new(0, 0, 0, count * (Y_2 + 3))
				count = count + 1
			end
		end
	end
	for i, v in ipairs(v6) do
		t2[v].Position = UDim2.new(0, 0, 0, count * (Y + 3))
		count = count + 1
		AddPlayerByTeamColor(tbl[v])
	end
	if #v6 ~= 0 then
		v1.CanvasSize = UDim2.new(0, 0, 0, count * (Y_2 + 3))
		return
	end
	AddPlayerByTeamColor(nil)
	v1.CanvasSize = UDim2.new(0, 0, 0, count * (Y_2 + 3))
end
local t4 = {}
local function ShowVIPIcon(p1, p2) --[[ ShowVIPIcon | Line: 209 | Upvalues: t4 (copy) ]]
	local v1 = t4[p1]
	if not (v1 and v1:FindFirstChild("VIP")) then
		return
	end
	v1.VIP.Visible = p2
	if not (v1.BCIcon.Visible or v1.Friends.Visible) then
		v1.Padding.Visible = not p2
	end
	v1.UIListLayout:ApplyLayout()
	MoneyzUpdate(p1)
end
workspace.Main.PlayerHasVIP.OnClientEvent:connect(function(p1) --[[ Line: 224 | Upvalues: ShowVIPIcon (copy) ]]
	ShowVIPIcon(p1, true)
end)
function isClipped(p1) --[[ isClipped | Line: 281 ]]
	local v1 = p1.Parent
	local AbsolutePosition = v1.AbsolutePosition
	local v2 = AbsolutePosition + v1.AbsoluteSize
	local AbsolutePosition_2 = p1.AbsolutePosition
	local v3 = AbsolutePosition_2 + p1.AbsoluteSize
	local function cmpVectors(p1, p2) --[[ cmpVectors | Line: 289 ]]
		return if p1.X < p2.X then true else p1.Y < p2.Y
	end
	return (if AbsolutePosition_2.X < AbsolutePosition.X then true else AbsolutePosition_2.Y < AbsolutePosition.Y) or (if v2.X < v3.X then true else v2.Y < v3.Y)
end
function AddPlayer(p1) --[[ AddPlayer | Line: 296 | Upvalues: PlayerNameTemplate (copy), t3 (copy), v3 (ref), LocalPlayer (copy), v4 (copy), ShowVIPIcon (copy), t4 (copy) ]]
	local v1 = PlayerNameTemplate:clone()
	v1.PlayerName.Text = p1.DisplayName
	v1.Parent = script.Parent
	v1.Visible = true
	t3[p1] = v1
	if not v3 then
		spawn(function() --[[ Line: 314 | Upvalues: p1 (copy), LocalPlayer (ref), t3 (ref), v1 (copy), v4 (ref), ShowVIPIcon (ref), t4 (ref) ]]
			local v12 = false
			if p1 and (p1.Parent and p1 ~= LocalPlayer) then
				local v2, v3 = pcall(function() --[[ Line: 318 | Upvalues: LocalPlayer (ref), p1 (ref) ]]
					return LocalPlayer:IsFriendsWith(p1.userId)
				end)
				if v2 and v3 then
					v12 = true
					if not t3[p1] then
						return
					end
					v1.Friends.Visible = true
				end
			end
			if v1.Parent == nil then
				return
			end
			local v42 = nil
			if _G.GamepadEnabled then
				return
			end
			p1:WaitForChild("_rankLoaded", 60)
			if v4.ContributorsIcons[p1.UserId] then
				v42 = v4.ContributorsIcons[p1.UserId]
			elseif p1:FindFirstChild("IsDev") and not p1:FindFirstChild("Incognito") then
				v42 = "rbxasset://textures/ui/icon_placeowner.png"
			elseif p1:FindFirstChild("IsCM") and not p1:FindFirstChild("Incognito") then
				v42 = "rbxassetid://82204383580968"
			elseif p1:FindFirstChild("IsMod") and not p1:FindFirstChild("Incognito") then
				v42 = "rbxassetid://11328036600"
			elseif p1:FindFirstChild("IsQATester") then
				v42 = "rbxassetid://15624463981"
			elseif p1.MembershipType == Enum.MembershipType.Premium then
				v42 = "rbxasset://textures/ui/PlayerList/PremiumIcon.png"
			end
			if v42 then
				v1.Padding.Visible = false
				v1.BCIcon.Visible = true
				v1.BCIcon.Image = v42
			else
				if not v12 then
					spawn(function() --[[ Line: 371 | Upvalues: p1 (ref), ShowVIPIcon (ref) ]]
						if not p1:WaitForChild("VIP", 10) then
							return
						end
						ShowVIPIcon(p1)
					end)
					t4[p1] = v1
					return
				end
				v1.Padding.Visible = false
			end
			v1.UIListLayout:ApplyLayout()
			spawn(function() --[[ Line: 371 | Upvalues: p1 (ref), ShowVIPIcon (ref) ]]
				if not p1:WaitForChild("VIP", 10) then
					return
				end
				ShowVIPIcon(p1)
			end)
			t4[p1] = v1
		end)
	end
	if p1:WaitForChild("TotalMoneyz", 10) then
		p1.TotalMoneyz.Changed:connect(function(p12) --[[ Line: 384 | Upvalues: p1 (copy) ]]
			MoneyzUpdate(p1)
		end)
		MoneyzUpdate(p1)
	end
	p1.Changed:connect(function(p1) --[[ Line: 395 ]]
		if p1 ~= "TeamColor" then
			return
		end
		RefreshList()
	end)
	RefreshList()
end
local v9 = if _G.GamepadEnabled then 70 else 0
v1.Position = UDim2.new(v1.Position.X.Scale, v1.Position.X.Offset, 0, v9)
local Position = v1.Position
local function RealighMenu() --[[ RealighMenu | Line: 420 | Upvalues: v1 (copy), Position (copy), v5 (copy), Menu (copy), v9 (copy), MainGui (copy), v3 (ref), t3 (copy) ]]
	v1.Position = Position
	if v5:IsOverlapping(Menu) then
		v1.Position = UDim2.new(0, Menu.AbsolutePosition.X + Menu.AbsoluteSize.X, 0, v9)
		if v1.AbsolutePosition.X + v1.AbsoluteSize.X / 2 > MainGui.AbsoluteSize.X then
			v1.Position = UDim2.new(1, -(v1.AbsoluteSize.X / 2), 0, 0)
		end
	end
	if not v3 and MainGui.AbsoluteSize.X - (Menu.AbsolutePosition.X + Menu.AbsoluteSize.X) < v1.AbsoluteSize.X / 2 then
		v3 = true
		for i, v in ipairs(game.Players:GetPlayers()) do
			local v12 = t3[v]
			if v12 then
				v12.PlayerName.Position = UDim2.new(0, 3, 0, 0)
				v12.BCIcon.Visible = false
				v12.Friends.Visible = false
			end
		end
	end
	v5:UpdateTweenEndPoints()
end
Menu.Changed:connect(function(p1) --[[ Line: 453 | Upvalues: RealighMenu (copy) ]]
	if p1 ~= "AbsolutePosition" and p1 ~= "AbsoluteSize" then
		return
	end
	RealighMenu()
end)
MainGui.Changed:connect(function(p1) --[[ Line: 459 | Upvalues: RealighMenu (copy) ]]
	if p1 ~= "AbsoluteSize" then
		return
	end
	wait()
	RealighMenu()
end)
RealighMenu()
for i, v in ipairs(game.Players:GetPlayers()) do
	if not v:FindFirstChild("Incognito") then
		AddPlayer(v)
	end
end
game.Players.PlayerAdded:connect(function(p1) --[[ Line: 475 ]]
	AddPlayer(p1)
end)
function RemovePlayerFromList(p1) --[[ RemovePlayerFromList | Line: 479 | Upvalues: t3 (copy) ]]
	if not t3[p1] then
		return
	end
	t3[p1]:Destroy()
	t3[p1] = nil
	RefreshList()
end
game.Players.PlayerRemoving:connect(function(p1) --[[ Line: 487 ]]
	RemovePlayerFromList(p1)
end)
v5:SetVisible(true)
v2:BindEvents({
	IncognitoEnabled = function(p1, p2) --[[ IncognitoEnabled | Line: 498 ]]
		if p2 then
			RemovePlayerFromList(p1)
		else
			AddPlayer(p1)
		end
	end,
	RefreshPlayer = function(p1) --[[ RefreshPlayer | Line: 505 | Upvalues: t3 (copy) ]]
		if not t3[p1] then
			return
		end
		RemovePlayerFromList(p1)
		AddPlayer(p1)
	end
})