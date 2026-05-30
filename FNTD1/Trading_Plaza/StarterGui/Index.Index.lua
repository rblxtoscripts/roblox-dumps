-- https://lua.expert/
game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
game:GetService("TweenService")
game:GetService("RunService")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Towers = require(ReplicatedStorage.Configs.Towers).Towers
require(ReplicatedStorage.Libs.Formatter)
local GameIndexes = Misc.GameIndexes
local Index = require(ReplicatedStorage.Modules.Misc.Index)
local Misc_2 = require(ReplicatedStorage.Configs.Misc)
local Gradients = ReplicatedStorage:WaitForChild("Gradients")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local UpdateIndex = Remotes:WaitForChild("Misc"):WaitForChild("UpdateIndex")
local Index_2 = script.Parent:WaitForChild("Index", 9000000000)
local Choose = Index_2:WaitForChild("Choose")
local Game = Index_2:WaitForChild("Game")
local Units = Index_2:WaitForChild("Units")
local Rarities = Misc_2.Rarities
local t = { "Easy", "Medium", "Hard", "Impossible", "Nightmare" }
local v1 = false
local v2 = nil
local t2 = {}
local function rarityIndex(p1) --[[ rarityIndex | Line: 48 | Upvalues: Rarities (copy) ]]
	return if table.find(Rarities, p1) then table.find(Rarities, p1) or 0 else 0
end
local function clearConnections(p1) --[[ clearConnections | Line: 52 | Upvalues: t2 (copy) ]]
	if not p1 then
		return
	end
	if not t2[p1] then
		t2[p1] = {}
	end
	for v1, v2 in t2[p1] do
		if v2 then
			v2:Disconnect()
		end
	end
	table.clear(t2[p1])
end
local function insertConnection(p1, p2) --[[ insertConnection | Line: 65 | Upvalues: t2 (copy) ]]
	if not p1 then
		return
	end
	if not t2[p1] then
		t2[p1] = {}
	end
	table.insert(t2[p1], p2)
end
local function clearFrame(p1, ...) --[[ clearFrame | Line: 73 ]]
	if not p1 then
		return
	end
	local t = { ... }
	for v1, v2 in p1:GetChildren() do
		if not (t and table.find(t, v2.Name)) then
			v2:Destroy()
		end
	end
end
local v3 = nil
local function openGameFrame(p1) --[[ openGameFrame | Line: 84 | Upvalues: v1 (ref), v2 (ref), v3 (ref), clearConnections (copy), clearFrame (copy), Game (copy), GameIndexes (copy), Misc_2 (copy), t (copy), t2 (copy), Tween (copy), Remotes (copy) ]]
	if v1 or not (v2 and (v2.Index and p1)) then
		return
	end
	v1 = true
	v3 = p1
	clearConnections("ContentSelection")
	clearConnections("Button")
	clearFrame(Game.Items, "UIListLayout")
	for i = 1, GameIndexes[p1] do
		local v12 = script.GameSample:Clone()
		v12.LayoutOrder = i
		v12.Name = i
		v12.Night.TextLabel.Text = i
		v12.Night.TextLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
		v12.Night.ImageColor3 = Color3.fromRGB(50, 50, 50)
		v12.Tokens.Visible = true
		v12.ImageLabel.Visible = true
		v12.Claim.Visible = false
		v12.Parent = Game.Items
		v12.Tokens.Text = if Misc_2.IndexRewards.GameRewards[tonumber(p1)] then Misc_2.IndexRewards.GameRewards[tonumber(p1)] else Misc_2.IndexRewards.GameRewards[#Misc_2.IndexRewards.GameRewards]
		local count = 0
		for v32, v4 in v12:GetChildren() do
			if v4:IsA("ImageButton") and table.find(t, v4.Name) then
				local v5 = v4.Activated:Connect(function() --[[ Line: 113 ]] end)
				if not t2.ContentSelection then
					t2.ContentSelection = {}
				end
				table.insert(t2.ContentSelection, v5)
				Tween:AddButton(v4, nil, nil, true)
				if v2.Index.Games[("%*_%*_%*"):format(p1, i, v4.Name)] then
					v4.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v4.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					count = count + 1
					continue
				end
				v4.ImageColor3 = Color3.fromRGB(50, 50, 50)
				v4.TextLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
			end
		end
		if count >= 2 then
			v12.Night.ImageColor3 = Color3.fromRGB(255, 255, 255)
			v12.Night.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			local v6 = v2.ClaimedGameIndex[("%*_%*"):format(p1, i)]
			v12.Claim.Visible = true
			if v6 then
				v12.Claim.TextLabel.Text = "Claimed"
			else
				v12.Claim.TextLabel.Text = "Claim"
			end
			local v7 = v12.Claim.Activated:Connect(function() --[[ Line: 142 | Upvalues: v1 (ref), p1 (copy), v6 (copy), Remotes (ref), i (copy) ]]
				if v1 or not p1 then
					return
				end
				if v6 then
					Remotes.Misc.Alert.Bindable:Fire("You already claimed this!")
				else
					Remotes.Index.Claim:FireServer(p1, i)
				end
			end)
			if not t2.Button then
				t2.Button = {}
			end
			table.insert(t2.Button, v7)
			Tween:AddButton(v12.Claim)
		end
	end
	v1 = false
end
local function updateGames() --[[ updateGames | Line: 160 | Upvalues: Game (copy), Tween (copy), v1 (ref), GameIndexes (copy), Remotes (copy), openGameFrame (copy), t2 (copy) ]]
	for v12, v2 in Game:GetChildren() do
		if v2:IsA("ImageButton") then
			Tween:AddButton(v2, nil, nil, true)
			local v3 = v2.Activated:Connect(function() --[[ Line: 164 | Upvalues: v1 (ref), GameIndexes (ref), v2 (copy), Remotes (ref), openGameFrame (ref) ]]
				if v1 then
					return
				end
				if GameIndexes[tonumber(v2.Name)] then
					task.spawn(openGameFrame, (tonumber(v2.Name)))
				else
					Remotes.Misc.Alert.Bindable:Fire("Oops, This map isn\'t available.")
				end
			end)
			if not t2.HeaderSelection then
				t2.HeaderSelection = {}
			end
			table.insert(t2.HeaderSelection, v3)
		end
	end
end
local function updateUnits() --[[ updateUnits | Line: 175 | Upvalues: clearConnections (copy), clearFrame (copy), Units (copy), Towers (copy), Rarities (copy), Gradients (copy), v2 (ref), Index (copy) ]]
	clearConnections("ContentSelection")
	clearConnections("Button")
	clearFrame(Units.Items, "UIPadding", "UIGridLayout")
	task.wait(0.5)
	local count = 0
	local count_2 = 0
	for v3, v4 in Towers do
		local v1, v22
		if table.find(Rarities, v4.Rarity) and v4.Rarity ~= "Forgotten" then
			count = count + 1
			if not Units.Items:FindFirstChild(v3) then
				local v5 = script.UnitSample:Clone()
				v5.Name = v3
				local Rarity = v4.Rarity
				if table.find(Rarities, Rarity) then
					local v6 = table.find(Rarities, Rarity)
					v1 = if v6 then v6 else 0
				else
					v1 = 0
				end
				v5.LayoutOrder = v1
				v5.BorderImage.TowerImage.Image = v4.Image
				v5.BorderImage.TowerImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
				v5.Shiny.Visible = false
				local v7 = Gradients:FindFirstChild(v4.Rarity)
				if v7 then
					v5.BorderImage.UIGradient.Color = v7.Color
					v5.Frame.UIGradient.Color = v7.Color
				end
				v5.Parent = Units.Items
				v5.Visible = true
				if v2.Index.Units[v3] then
					v5.BorderImage.TowerImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
					count_2 = count_2 + 1
				end
			end
			if not Units.Items:FindFirstChild("Shiny" .. v3) then
				local v8 = script.UnitSample:Clone()
				v8.Name = "Shiny" .. v3
				local Rarity = v4.Rarity
				v22 = table.find(Rarities, Rarity) and table.find(Rarities, Rarity) or 0
				v8.LayoutOrder = v22 + 100
				v8.BorderImage.TowerImage.Image = v4.Image
				v8.BorderImage.TowerImage.ImageColor3 = Color3.fromRGB(0, 0, 0)
				v8.Shiny.Visible = true
				local v10 = Gradients:FindFirstChild(v4.Rarity)
				if v10 then
					v8.BorderImage.UIGradient.Color = v10.Color
					v8.Frame.UIGradient.Color = v10.Color
				end
				v8.Parent = Units.Items
				v8.Visible = true
				if v2.Index.Units["Shiny" .. v3] then
					v8.BorderImage.TowerImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
					count_2 = count_2 + 1
				end
			end
		end
	end
	local v12 = Index(count_2, 10)
	Units.Bar.Progress.Text = ("%*/%*"):format(count_2, v12)
	Units.Bar.Move:TweenSize(UDim2.new(v12 and count_2 / v12 or 0, 0, 1, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 1)
	Units.Multi.Text = ("x%*"):format(math.round((Index(count_2, 10, true, 0.05) or 1) * 100) / 100)
	Units.Total.Text = ("%*/%*"):format(count_2, count * 2)
end
local function update() --[[ update | Line: 241 | Upvalues: ClientState (copy), v2 (ref), clearConnections (copy), updateGames (copy), updateUnits (copy), v3 (ref), openGameFrame (copy) ]]
	local v1 = ClientState.GetData()
	if not (v1 and v1.Index) then
		return
	end
	v2 = v1
	clearConnections("HeaderSelection")
	clearConnections("Button")
	updateGames()
	updateUnits()
	if v3 then
		task.spawn(openGameFrame, v3)
	else
		task.defer(openGameFrame, 1)
	end
end
Index_2:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 259 | Upvalues: Index_2 (copy), ClientState (copy) ]]
	if not Index_2.Visible then
		return
	end
	local v1 = ClientState.GetData()
	for k, v in pairs({ "5_1_", "5_2_", "5_3_", "5_4_", "5_5_", "5_6_" }) do
		if not v1.Index.Games[v .. "Nightmare"] then
			_ = false
		end
	end
end)
Index_2.Choose.Games.Activated:Connect(function() --[[ Line: 276 | Upvalues: v1 (ref), Choose (copy), Units (copy), Game (copy) ]]
	if not v1 then
		Choose.Visible = false
		Units.Visible = false
		Game.Visible = true
	end
end)
Index_2.Choose.Units.Activated:Connect(function() --[[ Line: 283 | Upvalues: v1 (ref), Choose (copy), Game (copy), Units (copy) ]]
	if not v1 then
		Choose.Visible = false
		Game.Visible = false
		Units.Visible = true
	end
end)
Index_2.Exit.Activated:Connect(function() --[[ Line: 290 | Upvalues: v1 (ref), Choose (copy), Game (copy), Units (copy), Index_2 (copy) ]]
	if v1 then
		return
	end
	if Choose.Visible then
		Index_2.Visible = false
	else
		Choose.Visible = true
		Game.Visible = false
		Units.Visible = false
	end
end)
Choose.Visible = true
Game.Visible = false
Units.Visible = false
Tween:AddButton(Index_2.Exit, nil, nil, false)
Tween:AddButton(Choose.Units, nil, nil, true)
Tween:AddButton(Choose.Games, nil, nil, true)
UpdateIndex.OnClientEvent:Connect(update)
Remotes.Index.Open.OnClientEvent:Connect(function() --[[ Line: 310 | Upvalues: Index_2 (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not Index_2.Visible then
		Index_2.Visible = true
	end
end)
task.delay(1, update)