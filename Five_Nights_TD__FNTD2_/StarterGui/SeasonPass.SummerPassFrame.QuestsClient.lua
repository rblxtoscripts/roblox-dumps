-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Quests = require(ReplicatedStorage.Modules.Misc.Quests)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local LocalPlayer = Players.LocalPlayer
local v1 = script.Parent
local QuestsFrame = v1.QuestsFrame
local Quests_2 = ReplicatedStorage.Remotes.Quests
function Format(p1) --[[ Format | Line: 16 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 20 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
function update() --[[ update | Line: 28 | Upvalues: ClientState (copy), QuestsFrame (copy), Quests (copy), Formatter (copy), Tween (copy), Quests_2 (copy), TweenService (copy) ]]
	local v1 = ClientState.GetData()
	if not v1 then
		return
	end
	if not v1.Quests.Event then
		return
	end
	local _, v2 = pcall(function() --[[ Line: 33 | Upvalues: v1 (copy), QuestsFrame (ref) ]]
		local v12 = nil
		for k, v in pairs(v1.Quests.Event) do
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
		QuestsFrame.ResetTimer.Text = "RESETS IN " .. convertToHMS((math.round(v2)))
	end)
	if v2 then
		warn("ERROR CODE: 187 - ", v2)
	end
	for k, v in pairs(v1.Quests.Event) do
		if not QuestsFrame.Quests:FindFirstChild(k) then
			local v3 = Quests.Event[k]
			if v3 then
				local v4 = QuestsFrame.Quests.Example:Clone()
				v4.Name = k
				v4.Message.Text = v3.Message
				v4.Tokens.Text = Formatter.FormatCompact(v3.Reward.Tokens)
				v4.XP.Text = Formatter.FormatCompact(v3.Reward.XP)
				v4.Visible = true
				v4.Parent = QuestsFrame.Quests
				Tween:AddButton(v4.Claim)
				v4.Claim.MouseButton1Click:Connect(function() --[[ Line: 65 | Upvalues: Quests_2 (ref), k (copy) ]]
					Quests_2.Claim:FireServer(k, "Event")
				end)
			end
		end
	end
	for k, v in pairs(QuestsFrame.Quests:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			local v5 = Quests.Event[v.Name]
			if v5 then
				if v1.Quests.Event[v.Name] then
					local Claimed = v1.Quests.Event[v.Name].Claimed
					local v6 = if Claimed then (1 / 0) else v1.Quests.Event[v.Name].Progress
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
v1.Quests.MouseButton1Click:Connect(function() --[[ Line: 107 | Upvalues: QuestsFrame (copy) ]]
	QuestsFrame.Visible = not QuestsFrame.Visible
end)
QuestsFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 111 | Upvalues: QuestsFrame (copy) ]]
	QuestsFrame.Visible = false
end)
task.spawn(update)
Tween:AddButton(QuestsFrame.Exit)
Tween:AddButton(v1.Quests)
Quests_2.Update.OnClientEvent:Connect(update)