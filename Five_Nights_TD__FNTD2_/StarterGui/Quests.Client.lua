-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Quests = game.ReplicatedStorage.Remotes.Quests
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Quests_2 = require(game.ReplicatedStorage.Modules.Misc.Quests)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local Items = require(game.ReplicatedStorage.Configs.Items)
local Presents = require(game.ReplicatedStorage.Configs.Presents)
local MainFrame = script.Parent.MainFrame
local InfiniteFrame = script.Parent.InfiniteFrame
local v1 = nil
local t = {
	["Death Tokens"] = {
		Image = "rbxassetid://71213441101551",
		Rarity = "Nightmare"
	},
	Tokens = {
		Image = "rbxassetid://16777953884",
		Rarity = "Common"
	},
	SeasonPassXP = {
		Image = "rbxassetid://17780752665",
		Rarity = "Common"
	},
	["Greek Tokens"] = {
		Image = "rbxassetid://116553408357682",
		Rarity = "Common"
	},
	["Space Tokens"] = {
		Image = "",
		Rarity = "Common"
	},
	["Prehistoric Tokens"] = {
		Image = "rbxassetid://86656708142908",
		Rarity = "Common"
	},
	["NewSummer Tokens"] = {
		Image = "rbxassetid://85934354030411",
		Rarity = "Common"
	}
}
function Format(p1) --[[ Format | Line: 19 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 23 ]]
	if p1 < 0 then
		p1 = 0
	end
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
local v2 = nil
function timer(p1) --[[ timer | Line: 33 | Upvalues: v2 (ref), MainFrame (copy) ]]
	local v1 = tick()
	v2 = v1
	local count = 0
	repeat
		task.wait(1)
		if v1 ~= v1 then
			break
		end
		count = count + 1
		MainFrame.ResetTimer.Text = "RESETS IN " .. convertToHMS(p1 - count)
	until v1 ~= v1
end
function RewardsToImages(p1) --[[ RewardsToImages | Line: 46 | Upvalues: v1 (ref), t (copy), Items (copy), Presents (copy) ]]
	local t2 = {}
	for k, v in pairs(p1) do
		local v12 = string.split(v, "_")
		local v2 = v12[1]
		local v3 = v12[2]
		local v4 = v12[3]
		if v1[v2] then
			local t3 = {
				Name = v2,
				Amount = "+" .. v3
			}
			t3.Image = t[v2] and t[v2].Image or ""
			t3.Rarity = t[v2] and t[v2].Rarity or nil
			table.insert(t2, t3)
			continue
		end
		if v2 == "Item" then
			table.insert(t2, {
				Name = v3,
				Amount = "x" .. v4 or "x1",
				Image = Items[v3].Image,
				Rarity = Items[v3].Rarity
			})
			continue
		end
		if v2 == "Present" then
			table.insert(t2, {
				Name = v3,
				Amount = "x" .. v4 or "x1",
				Image = Presents.Presents[v3].Image,
				Rarity = Presents.Presents[v3].Rarity
			})
			continue
		end
		table.insert(t2, {
			Amount = "+1",
			Image = "",
			Rarity = "Common",
			Name = v12
		})
	end
	return t2
end
function update() --[[ update | Line: 67 | Upvalues: v1 (ref), ClientState (copy), InfiniteFrame (copy), MainFrame (copy), Quests_2 (copy), Tween (copy), Quests (copy), TweenService (copy), Formatter (copy) ]]
	v1 = ClientState.GetData()
	for k, v in pairs({
		Normal = v1.Quests.Normal,
		Weekly = v1.Quests.Weekly,
		Special = v1.Quests.Special,
		Infinite = v1.Quests.Infinite
	}) do
		local v12 = if k == "Infinite" then InfiniteFrame.HolderFrame.Infinite else MainFrame.HolderFrame[k]
		for k2, v2 in pairs(v) do
			if not v12:FindFirstChild(k2) then
				local v22 = Quests_2[k][k2]
				if v22 then
					local v3 = v12.Example:Clone()
					v3.Name = k2
					local Message = v22.Message
					if string.find(Message, "[-x-]") and v2.Special then
						v3.Message.Text = Message:gsub("%-x%-", v2.Special)
					else
						v3.Message.Text = Message
					end
					v3.Title.Text = v22.Title
					for k3, v5 in pairs((RewardsToImages(v22.Reward))) do
						local v52 = v3.Rewards.Example:Clone()
						v52.Name = v5.Name
						v52.Info.Text = v5.Amount
						v52.BorderImage.TowerImage.Image = v5.Image
						v52.BorderImage.UIGradient.Color = game.ReplicatedStorage.Gradients[v5.Rarity].Color
						v52.Visible = true
						v52.Parent = v3.Rewards
					end
					v3.Visible = true
					v3.Parent = v12
					Tween:AddButton(v3.Claim)
					v3.Claim.MouseButton1Click:Connect(function() --[[ Line: 116 | Upvalues: Quests (ref), k2 (copy), k (copy) ]]
						Quests.Claim:FireServer(k2, k)
					end)
				end
			end
		end
		for k2, v2 in pairs(v12:GetChildren()) do
			if v2:IsA("Frame") and v2.Name ~= "Example" then
				local v6 = Quests_2[k][v2.Name]
				if v6 then
					local v7 = v1.Quests[k][v2.Name]
					if v7 then
						local v8 = if v7.Claimed then (1 / 0) else v7.Progress
						local v9 = if v6.Requirement then v6.Requirement else 1
						if v9 < v8 then
							v8 = v9
						end
						TweenService:Create(v2.Bar.Move, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Size = UDim2.new(v8 / v9, 0, 1, 0)
						}):Play()
						local v10 = if v8 < 1000 then math.round(v8 * 1000) / 1000 else Formatter.FormatCompact(v8)
						v2.Bar.Progress.Text = v10 .. "/" .. Formatter.FormatCompact(v9)
						if v7.Claimed then
							v2.Claim.Claim.Enabled = false
							v2.Claim.NoReq.Enabled = true
							v2.Claim.TextLabel.Claim.Enabled = false
							v2.Claim.TextLabel.NoReq.Enabled = true
							v2.Claim.TextLabel.Text = "CLAIMED"
							continue
						end
						if v9 <= v8 then
							v2.Claim.Claim.Enabled = true
							v2.Claim.NoReq.Enabled = false
							v2.Claim.TextLabel.Claim.Enabled = true
							v2.Claim.TextLabel.NoReq.Enabled = false
							continue
						end
						v2.Claim.Claim.Enabled = false
						v2.Claim.NoReq.Enabled = true
						v2.Claim.TextLabel.Claim.Enabled = false
						v2.Claim.TextLabel.NoReq.Enabled = true
						continue
					end
					v2:Destroy()
				end
			end
		end
	end
end
function changeFrame() --[[ changeFrame | Line: 159 | Upvalues: v1 (ref), ClientState (copy), MainFrame (copy) ]]
	if not v1 then
		v1 = ClientState.GetData()
	end
	if MainFrame.HolderFrame.Normal.Visible then
		local v12 = nil
		for k, v in pairs(v1.Quests.Normal) do
			if v.Began then
				v12 = v.Began
			end
		end
		if not v12 then
			return
		end
		local v2 = 86400 - (os.time() - v12)
		if v2 < 0 then
			v2 = 0
		end
		MainFrame.ResetTimer.Visible = true
		MainFrame.ResetTimer.Text = "RESETS IN " .. convertToHMS((math.round(v2)))
		task.spawn(timer, (math.round(v2)))
	elseif MainFrame.HolderFrame.Weekly.Visible then
		local v3 = nil
		for k, v in pairs(v1.Quests.Weekly) do
			if v.Began then
				v3 = v.Began
			end
		end
		if not v3 then
			return
		end
		local v4 = 604800 - (os.time() - v3)
		if v4 < 0 then
			v4 = 0
		end
		MainFrame.ResetTimer.Visible = true
		MainFrame.ResetTimer.Text = "RESETS IN " .. convertToHMS((math.round(v4)))
		task.spawn(timer, (math.round(v4)))
	else
		if not MainFrame.HolderFrame.Special.Visible then
			return
		end
		MainFrame.ResetTimer.Visible = false
	end
end
Quests.Client.OnClientEvent:Connect(function() --[[ Line: 196 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
game.ReplicatedStorage.Remotes.Misc.InfiniteQuests.OnClientEvent:Connect(function() --[[ Line: 202 | Upvalues: InfiniteFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not InfiniteFrame.Visible then
		Tween:AddButton("Open", InfiniteFrame)
	end
end)
MainFrame.Normal.MouseButton1Click:Connect(function() --[[ Line: 208 | Upvalues: MainFrame (copy) ]]
	MainFrame.HolderFrame.Normal.Visible = true
	MainFrame.HolderFrame.Weekly.Visible = false
	MainFrame.HolderFrame.Special.Visible = false
	changeFrame()
end)
MainFrame.Weekly.MouseButton1Click:Connect(function() --[[ Line: 214 | Upvalues: MainFrame (copy) ]]
	MainFrame.HolderFrame.Normal.Visible = false
	MainFrame.HolderFrame.Weekly.Visible = true
	MainFrame.HolderFrame.Special.Visible = false
	changeFrame()
end)
MainFrame.Special.MouseButton1Click:Connect(function() --[[ Line: 220 | Upvalues: MainFrame (copy) ]]
	MainFrame.HolderFrame.Normal.Visible = false
	MainFrame.HolderFrame.Weekly.Visible = false
	MainFrame.HolderFrame.Special.Visible = true
	changeFrame()
end)
MainFrame.HolderFrame.Normal.Visible = true
MainFrame.HolderFrame.Weekly.Visible = false
MainFrame.HolderFrame.Special.Visible = false
changeFrame()
task.spawn(update)
Tween:AddButton(MainFrame.Normal)
Tween:AddButton(MainFrame.Weekly)
Tween:AddButton(MainFrame.Special)
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(InfiniteFrame.Exit, InfiniteFrame)
Quests.Update.OnClientEvent:Connect(update)