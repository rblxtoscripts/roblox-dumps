-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Quests = require(ReplicatedStorage.Modules.Misc.Quests)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local InventoryFrame = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Inventory"):WaitForChild("InventoryFrame")
local HolderFrame = InventoryFrame:WaitForChild("HolderFrame")
local Quests_2 = HolderFrame:WaitForChild("Quests")
local Quests_3 = ReplicatedStorage.Remotes.Quests
function Format(p1) --[[ Format | Line: 19 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 23 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
function update() --[[ update | Line: 31 | Upvalues: ClientState (copy), InventoryFrame (copy), Quests_2 (copy), Quests (copy), Formatter (copy), Tween (copy), Quests_3 (copy), TweenService (copy) ]]
	local v1 = ClientState.GetData()
	if not v1 then
		return
	end
	if not v1.Quests.Normal then
		return
	end
	local _, v2 = pcall(function() --[[ Line: 36 | Upvalues: v1 (copy), InventoryFrame (ref) ]]
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
		InventoryFrame.ResetTimer.Text = "RESETS IN " .. convertToHMS((math.round(v2)))
	end)
	if v2 then
		warn("ERROR CODE: 187 - ", v2)
	end
	for k, v in pairs(v1.Quests.Normal) do
		if not Quests_2:FindFirstChild(k) then
			local v3 = Quests.Normal[k]
			if v3 then
				local v4 = Quests_2.Example:Clone()
				v4.Name = k
				v4.Message.Text = v3.Message
				v4.Tokens.Text = Formatter.FormatCompact(v3.Reward.Tokens)
				v4.XP.Text = Formatter.FormatCompact(v3.Reward.XP)
				v4.Visible = true
				v4.Parent = Quests_2
				Tween:AddButton(v4.Claim, nil, "ButtonClick")
				v4.Claim.MouseButton1Click:Connect(function() --[[ Line: 68 | Upvalues: Quests_3 (ref), k (copy) ]]
					Quests_3.Claim:FireServer(k, "Normal")
				end)
			end
		end
	end
	for k, v in pairs(Quests_2:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			local v5 = Quests.Normal[v.Name]
			if v5 then
				if v1.Quests.Normal[v.Name] then
					local Claimed = v1.Quests.Normal[v.Name].Claimed
					local v6 = if Claimed then (1 / 0) else v1.Quests.Normal[v.Name].Progress
					local v7 = if v5.Requirement then v5.Requirement else 1
					if v7 < v6 then
						v6 = v7
					end
					TweenService:Create(v.Bar.Move, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Size = UDim2.new(v6 / v7, 0, 1, 0)
					}):Play()
					v.Bar.Progress.Text = Formatter.FormatCompact(v6) .. "/" .. Formatter.FormatCompact(v7)
					if Claimed then
						v.Claim.Claim.Enabled = false
						v.Claim.NoReq.Enabled = true
						v.Claim.TextLabel.Claim.Enabled = false
						v.Claim.TextLabel.NoReq.Enabled = true
						v.Claim.TextLabel.Text = "CLAIMED"
						continue
					end
					if v7 <= v6 then
						v.Claim.Claim.Enabled = true
						v.Claim.NoReq.Enabled = false
						v.Claim.TextLabel.Claim.Enabled = true
						v.Claim.TextLabel.NoReq.Enabled = false
						continue
					end
					v.Claim.Claim.Enabled = false
					v.Claim.NoReq.Enabled = true
					v.Claim.TextLabel.Claim.Enabled = false
					v.Claim.TextLabel.NoReq.Enabled = true
					continue
				end
				v:Destroy()
			end
		end
	end
end
Quests_2:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 110 | Upvalues: Quests_2 (copy), InventoryFrame (copy) ]]
	if Quests_2.Visible then
		InventoryFrame.ResetTimer.Visible = true
	else
		InventoryFrame.ResetTimer.Visible = false
	end
end)
InventoryFrame.Quests.MouseButton1Click:Connect(function() --[[ Line: 118 | Upvalues: HolderFrame (copy), InventoryFrame (copy) ]]
	HolderFrame.Units.Visible = false
	HolderFrame.Items.Visible = false
	HolderFrame.Shop.Visible = false
	InventoryFrame.TowerStats.Visible = false
end)
task.spawn(update)
Tween:AddButton(InventoryFrame.Quests, nil, "ButtonClick")
Quests_3.Update.OnClientEvent:Connect(update)