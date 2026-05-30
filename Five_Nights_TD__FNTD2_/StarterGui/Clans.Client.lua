-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Clans = ReplicatedStorage.Remotes.Clans
local Tween = require(ReplicatedStorage.Libs.Tween)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local Misc = require(ReplicatedStorage.Configs.Misc)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Robux = require(ReplicatedStorage.Configs.Robux)
local Quests = require(ReplicatedStorage.Modules.Misc.Quests)
local ClansButton = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("ClansButton")
local ClansFrame = script.Parent.ClansFrame
local Request = script.Parent.Request
local t = {
	ClansFrame.MyClan,
	ClansFrame.TopClans,
	ClansFrame.Rewards,
	ClansFrame.Missions
}
function initButtons() --[[ initButtons | Line: 21 | Upvalues: t (copy), Tween (copy), ClansFrame (copy) ]]
	for k, v in pairs(t) do
		Tween:AddButton(v)
		v.MouseButton1Click:Connect(function() --[[ Line: 24 | Upvalues: ClansFrame (ref), v (copy) ]]
			if not ClansFrame:FindFirstChild(v.Name .. "Frame") then
				return
			end
			changeFrame(v.Name .. "Frame")
		end)
	end
	changeFrame("MyClanFrame")
end
local t2 = {
	ClansFrame.MyClanFrame,
	ClansFrame.TopClansFrame,
	ClansFrame.RewardsFrame,
	ClansFrame.MissionsFrame
}
function changeFrame(p1) --[[ changeFrame | Line: 35 | Upvalues: ClansFrame (copy), t2 (copy) ]]
	if not ClansFrame:FindFirstChild(p1) then
		return
	end
	for k, v in pairs(t2) do
		if v.Name == p1 then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
end
ClansFrame.MyClanFrame.Create.Create.MouseButton1Click:Connect(function() --[[ Line: 46 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Create.PaymentOptions.Visible = true
end)
ClansFrame.MyClanFrame.Create.PaymentOptions.Exit.MouseButton1Click:Connect(function() --[[ Line: 49 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Create.PaymentOptions.Visible = false
end)
ClansFrame.MyClanFrame.Create.PaymentOptions.Robux.MouseButton1Click:Connect(function() --[[ Line: 53 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.Create:FireServer(ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.Text, true)
end)
ClansFrame.MyClanFrame.Create.PaymentOptions.Tokens.MouseButton1Click:Connect(function() --[[ Line: 56 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.Create:FireServer(ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.Text)
end)
local v1 = nil
Clans.Create.OnClientEvent:Connect(function(p1) --[[ Line: 61 | Upvalues: ClansFrame (copy), v1 (ref) ]]
	if p1 == "Confirm" then
		ClansFrame.MyClanFrame.Create.PaymentOptions.Robux.TextLabel.Text = "CONFIRM"
		ClansFrame.MyClanFrame.Create.PaymentOptions.Tokens.TextLabel.Text = "CONFIRM"
		return
	end
	if p1 == "NoConfirm" then
		ClansFrame.MyClanFrame.Create.PaymentOptions.Robux.TextLabel.Text = "R$799"
		ClansFrame.MyClanFrame.Create.PaymentOptions.Tokens.TextLabel.Text = "$10000"
		return
	end
	local v12 = tick()
	v1 = v12
	ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.Text = ""
	ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.PlaceholderText = p1
	ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.PlaceholderColor3 = Color3.fromRGB(255, 73, 76)
	task.wait(1)
	if v12 ~= v12 then
		return
	end
	ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.PlaceholderText = "Clan Name"
	ClansFrame.MyClanFrame.Create.PaymentOptions.ClanName.TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
end)
function updateQuests() --[[ updateQuests | Line: 85 | Upvalues: ClientState (copy), ClansFrame (copy), Quests (copy), Formatter (copy), Tween (copy), ReplicatedStorage (copy), TweenService (copy) ]]
	local v1 = ClientState.GetData()
	if not v1 then
		return
	end
	if not v1.Quests.Clans then
		return
	end
	for k, v in pairs(v1.Quests.Clans) do
		if not ClansFrame.MissionsFrame.ScrollingFrame:FindFirstChild(k) then
			local v2 = Quests.Clans[k]
			if v2 then
				local v3 = ClansFrame.MissionsFrame:WaitForChild("ScrollingFrame"):WaitForChild("Example"):Clone()
				v3.Name = k
				v3.Message.Text = v2.Message
				v3.ClanPoints.Text = Formatter.FormatCompact(v2.Reward.ClanPoints)
				v3.Visible = true
				v3.Parent = ClansFrame.MissionsFrame.ScrollingFrame
				Tween:AddButton(v3.Claim)
				v3.Claim.MouseButton1Click:Connect(function() --[[ Line: 104 | Upvalues: ReplicatedStorage (ref), k (copy) ]]
					ReplicatedStorage.Remotes.Quests.Claim:FireServer(k, "Clans")
				end)
			end
		end
	end
	for k, v in pairs(ClansFrame.MissionsFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			if not v1.Quests.Clans[v.Name] then
				v:Destroy()
			end
			local v4 = Quests.Clans[v.Name]
			if v4 then
				local Progress = v1.Quests.Clans[v.Name].Progress
				local v5 = if v4.Requirement then v4.Requirement else 1
				if v5 < Progress then
					Progress = v5
				end
				TweenService:Create(v.Bar.Move, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Size = UDim2.new(Progress / v5, 0, 1, 0)
				}):Play()
				v.Bar.Progress.Text = Formatter.FormatCompact(Progress) .. "/" .. Formatter.FormatCompact(v5)
				if v5 <= Progress then
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
			end
		end
	end
end
function update(p1) --[[ update | Line: 138 | Upvalues: ClansFrame (copy), LocalPlayer (copy), Clans (copy), Formatter (copy), Tween (copy) ]]
	if not p1 then
		return
	end
	if p1 == "None" then
		ClansFrame.MyClanFrame.Create.Visible = true
		ClansFrame.MyClanFrame.Normal.Visible = false
		ClansFrame.Leave.Visible = false
		return
	end
	ClansFrame.MyClanFrame.Create.Visible = false
	ClansFrame.MyClanFrame.Normal.Visible = true
	ClansFrame.Leave.Visible = true
	if p1.Owner == LocalPlayer.UserId then
		ClansFrame.MyClanFrame.Normal.ChangeBio.Visible = true
		ClansFrame.MyClanFrame.Normal.ChangeIcon.Visible = true
		ClansFrame.MyClanFrame.Normal.Delete.Visible = true
	else
		ClansFrame.MyClanFrame.Normal.ChangeBio.Visible = false
		ClansFrame.MyClanFrame.Normal.ChangeIcon.Visible = false
		ClansFrame.MyClanFrame.Normal.Delete.Visible = false
	end
	ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Visible = false
	ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Visible = false
	ClansFrame.MyClanFrame.Normal.EditMember.Visible = false
	ClansFrame.MyClanFrame.Normal.ClanName.TextLabel.Text = p1.Name
	ClansFrame.MyClanFrame.Normal.ClanIcon.Image = p1.Icon
	ClansFrame.MyClanFrame.Normal.Bio.TextLabel.Text = p1.Bio
	local tbl = {}
	for k, v in pairs(p1.Players) do
		local v1 = nil
		local _, _2 = pcall(function() --[[ Line: 173 | Upvalues: v1 (ref), p1 (copy), v (copy) ]]
			v1 = p1.Points["Player_" .. v.UserId]
		end)
		local v2 = Clans.GetPointsName:InvokeServer()
		if v1 and v1[v2] then
			v1 = v1[v2]
		else
			v1 = 0
		end
		local t = {
			UserId = v.UserId,
			Points = v1
		}
		t.Rank = if v.Rank then v.Rank else "Member"
		table.insert(tbl, t)
	end
	table.sort(tbl, function(p1, p2) --[[ Line: 187 ]]
		return p1.Points > p2.Points
	end)
	for k, v in pairs(ClansFrame.MyClanFrame.Normal.MemberList.ScrollingFrame:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(tbl) do
		if not ClansFrame.MyClanFrame.Normal.MemberList.ScrollingFrame:FindFirstChild("Player_" .. v.UserId) then
			local v4 = ClansFrame.MyClanFrame.Normal.MemberList.ScrollingFrame.Example:Clone()
			v4.Name = "Player_" .. v.UserId
			v4.LayoutOrder = k
			v4.Parent = ClansFrame.MyClanFrame.Normal.MemberList.ScrollingFrame
			local v5 = "[Loading]"
			local _, _2 = pcall(function() --[[ Line: 205 | Upvalues: v5 (ref), v (copy) ]]
				v5 = game.Players:GetNameFromUserIdAsync(v.UserId)
			end)
			Clans.GetPointsName:InvokeServer()
			if p1.Owner == v.UserId then
				v4.Owner.Visible = true
				v4.Officer.Visible = false
			elseif v.Rank == "Officer" then
				v4.Owner.Visible = false
				v4.Officer.Visible = true
			else
				v4.Owner.Visible = false
				v4.Officer.Visible = false
			end
			v4.Place.Text = "#" .. k
			v4.Player.Text = v5
			if v.Points then
				v4.Points.Text = Formatter.FormatCompact(v.Points)
			else
				v4.Points.Text = "0"
			end
			if k == 1 then
				script.First:Clone().Parent = v4.Place
			elseif k == 2 then
				script.Second:Clone().Parent = v4.Place
			elseif k == 3 then
				script.Third:Clone().Parent = v4.Place
			end
			v4.Visible = true
			Tween:AddButton(v4, nil, nil, nil, 1.01)
			v4.MouseButton1Click:Connect(function() --[[ Line: 241 | Upvalues: ClansFrame (ref), v (copy), v4 (copy), v5 (ref) ]]
				ClansFrame.MyClanFrame.Normal.MemberList.Selected.Value = v.UserId
				ClansFrame.MyClanFrame.Normal.EditMember.ClanPoints.Text = v4.Points.Text
				ClansFrame.MyClanFrame.Normal.EditMember.PlayerName.Text = v5
				ClansFrame.MyClanFrame.Normal.EditMember.Visible = true
			end)
		end
	end
end
ClansFrame.MyClanFrame.Normal.ChangeRank.Officer.MouseButton1Click:Connect(function() --[[ Line: 250 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.EditMember:FireServer(ClansFrame.MyClanFrame.Normal.MemberList.Selected.Value, "Officer")
end)
ClansFrame.MyClanFrame.Normal.ChangeRank.Member.MouseButton1Click:Connect(function() --[[ Line: 253 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.EditMember:FireServer(ClansFrame.MyClanFrame.Normal.MemberList.Selected.Value, "Member")
end)
ClansFrame.MyClanFrame.Normal.ChangeRank.MakeOwner.MouseButton1Click:Connect(function() --[[ Line: 256 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ConfirmOwner.Visible = true
end)
ClansFrame.MyClanFrame.Normal.ChangeRank.Exit.MouseButton1Click:Connect(function() --[[ Line: 259 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ChangeRank.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ConfirmOwner.Yes.MouseButton1Click:Connect(function() --[[ Line: 263 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.EditMember:FireServer(ClansFrame.MyClanFrame.Normal.MemberList.Selected.Value, "Owner")
	ClansFrame.MyClanFrame.Normal.ConfirmOwner.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ConfirmOwner.No.MouseButton1Click:Connect(function() --[[ Line: 267 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ConfirmOwner.Visible = false
end)
ClansFrame.MyClanFrame.Normal.EditMember.ChangeRank.MouseButton1Click:Connect(function() --[[ Line: 271 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ChangeRank.Visible = true
	ClansFrame.MyClanFrame.Normal.EditMember.Visible = false
end)
ClansFrame.MyClanFrame.Normal.EditMember.Kick.MouseButton1Click:Connect(function() --[[ Line: 275 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ConfirmKick.Visible = true
end)
ClansFrame.MyClanFrame.Normal.EditMember.Exit.MouseButton1Click:Connect(function() --[[ Line: 278 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.EditMember.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ConfirmKick.Yes.MouseButton1Click:Connect(function() --[[ Line: 282 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.EditMember:FireServer(ClansFrame.MyClanFrame.Normal.MemberList.Selected.Value, "Kick")
	ClansFrame.MyClanFrame.Normal.ConfirmKick.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ConfirmKick.No.MouseButton1Click:Connect(function() --[[ Line: 286 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ConfirmKick.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ChangeBio.MouseButton1Click:Connect(function() --[[ Line: 290 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Visible = true
end)
ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 293 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Change.MouseButton1Click:Connect(function() --[[ Line: 296 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.Change:FireServer("Bio", ClansFrame.MyClanFrame.Normal.ChangeBioFrame.TextBox.Text)
end)
ClansFrame.MyClanFrame.Normal.ChangeIcon.MouseButton1Click:Connect(function() --[[ Line: 300 | Upvalues: Misc (copy), ClansFrame (copy) ]]
	local ClanImages = Misc.ClanImages
	ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image = ClansFrame.MyClanFrame.Normal.ClanIcon.Image
	ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Visible = true
	ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.ImageColor3 = Color3.fromRGB(100, 100, 100)
	ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.TextLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
end)
ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Next.MouseButton1Click:Connect(function() --[[ Line: 307 | Upvalues: Misc (copy), ClansFrame (copy) ]]
	local ClanImages = Misc.ClanImages
	local v1 = table.find(ClanImages, ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image) or 1
	if ClanImages[v1 + 1] then
		ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image = ClanImages[v1 + 1]
	else
		ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image = ClanImages[1]
	end
	if ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image == ClansFrame.MyClanFrame.Normal.ClanIcon.Image then
		ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.ImageColor3 = Color3.fromRGB(100, 100, 100)
		ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.TextLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
	else
		ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.ImageColor3 = Color3.fromRGB(255, 255, 255)
		ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	end
end)
ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change.MouseButton1Click:Connect(function() --[[ Line: 328 | Upvalues: ClansFrame (copy), Clans (copy) ]]
	ClansFrame.MyClanFrame.Normal.ClanIcon.Image = ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image
	Clans.Change:FireServer("Icon", ClansFrame.MyClanFrame.Normal.ChangeIconFrame.ClanIcon.Image)
end)
ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 332 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Visible = false
end)
function updateTopClans(p1) --[[ updateTopClans | Line: 336 | Upvalues: ClansFrame (copy), Clans (copy), Formatter (copy) ]]
	if p1 == "Reset" then
		for k, v in pairs(ClansFrame.TopClansFrame.ScrollingFrame:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "Example" then
				v:Destroy()
			end
		end
	else
		task.wait(math.random(0, 10) / 10)
		for k, v in pairs(p1) do
			if not ClansFrame.TopClansFrame.ScrollingFrame:FindFirstChild(k) then
				local v1 = ClansFrame.TopClansFrame.ScrollingFrame.Example:Clone()
				v1.Name = k
				v1.LayoutOrder = v.Place
				v1.ClanName.Text = v.Name
				v1.Bio.Text = v.Bio
				v1.Icon.Image = v.Icon
				v1.Parent = ClansFrame.TopClansFrame.ScrollingFrame
				local v2 = Clans.GetPointsName:InvokeServer()
				if v2 and v[v2] then
					v1.Points.Text = Formatter.FormatCompact(v[v2])
				else
					v1.Points.Text = "0"
				end
				v1.Place.Text = "#" .. v.Place
				if v.Place == 1 then
					script.First:Clone().Parent = v1.Place
				elseif v.Place == 2 then
					script.Second:Clone().Parent = v1.Place
				elseif v.Place == 3 then
					script.Third:Clone().Parent = v1.Place
				end
				local count = 0
				for k2, v3 in pairs(v.Players) do
					count = count + 1
				end
				v1.Players.Text = tostring(count) .. "/20"
				v1.Visible = true
			end
		end
	end
end
function updateInvite() --[[ updateInvite | Line: 385 | Upvalues: Players (copy), LocalPlayer (copy), ClansFrame (copy), Tween (copy), Clans (copy) ]]
	for i, v in ipairs(Players:GetPlayers()) do
		if v.Name ~= LocalPlayer.Name and not ClansFrame.InviteFrame.ScrollingFrame:FindFirstChild(v.Name) then
			local v1 = ClansFrame.InviteFrame.ScrollingFrame.Example:Clone()
			v1.Name = v.Name
			v1.PlayerName.Text = v.Name
			v1.Visible = true
			v1.Parent = ClansFrame.InviteFrame.ScrollingFrame
			Tween:AddButton(v1.Send)
			v1.Send.MouseButton1Click:Connect(function() --[[ Line: 397 | Upvalues: Clans (ref), v (copy) ]]
				Clans.Invite:FireServer(v.Name)
			end)
		end
	end
	for k, v in pairs(ClansFrame.InviteFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and (v.Name ~= "Example" and not Players:FindFirstChild(v.Name)) then
			v:Destroy()
		end
	end
end
function updateRewards() --[[ updateRewards | Line: 409 | Upvalues: ClientState (copy), Clans (copy), LocalPlayer (copy), ClansFrame (copy), Formatter (copy), TweenService (copy) ]]
	local v1 = ClientState.GetData()
	local v2 = Clans.UpdateRewards.GetStats:InvokeServer(LocalPlayer)
	if not v2 then
		return
	end
	if v2 == "No Clan" then
		ClansFrame.RewardsFrame.NoClan.Visible = true
		ClansFrame.RewardsFrame.ScrollingFrame.Visible = false
		ClansFrame.RewardsFrame.Exp.Visible = false
		ClansFrame.RewardsFrame.Restart.Visible = false
		return
	end
	ClansFrame.RewardsFrame.NoClan.Visible = false
	ClansFrame.RewardsFrame.ScrollingFrame.Visible = true
	ClansFrame.RewardsFrame.Exp.Visible = true
	local Bar = ClansFrame.RewardsFrame.Exp.Bar
	local v3 = if v2.RequiredXP <= 0 then 1 else v2.CurrentLevelXP / v2.RequiredXP
	Bar.Progress.Text = if v2.RequiredXP <= 0 then "MAX" else Formatter.FormatCompact(v2.CurrentLevelXP) .. "/" .. Formatter.FormatCompact(v2.RequiredXP) .. " Clan Points"
	TweenService:Create(Bar.Move, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v3, 0, 1, 0)
	}):Play()
	local v5 = Clans.GetPointsName:InvokeServer()
	local count = 0
	for k, v in pairs(ClansFrame.RewardsFrame.ScrollingFrame.Rewards:GetChildren()) do
		if v:IsA("Frame") then
			if tonumber((string.gsub(v.Name, "Reward", ""))) <= v2.Level then
				v.Claim.Visible = true
				v.Claimed.Visible = false
				v.Locked.Visible = false
			else
				v.Claim.Visible = false
				v.Claimed.Visible = false
				v.Locked.Visible = true
			end
			if v1.ClanRewards[v5] and v1.ClanRewards[v5][v.Name] then
				v.Claim.Visible = false
				v.Claimed.Visible = true
				v.Locked.Visible = false
				count = count + 1
			end
		end
	end
	if count >= 20 then
		ClansFrame.RewardsFrame.Restart.Visible = true
	else
		ClansFrame.RewardsFrame.Restart.Visible = false
	end
end
function initRewards() --[[ initRewards | Line: 466 | Upvalues: ClansFrame (copy), Tween (copy), Clans (copy) ]]
	for k, v in pairs(ClansFrame.RewardsFrame.ScrollingFrame.Rewards:GetChildren()) do
		if v:IsA("Frame") then
			Tween:AddButton(v.Claim)
			v.Claim.MouseButton1Click:Connect(function() --[[ Line: 471 | Upvalues: Clans (ref), v (copy) ]]
				Clans.ClaimReward:FireServer(v.Name)
			end)
		end
	end
	task.spawn(updateRewards)
end
Clans.Invite.OnClientEvent:Connect(function(p1, p2) --[[ Line: 479 | Upvalues: Request (copy), ClansFrame (copy) ]]
	if p1 == "Close" then
		Request.Visible = false
		return
	end
	if p2 ~= "Sent" then
		Request.Message.Text = p1 .. " has invited you to their clan."
		Request.ClanID.Value = p2
		Request.Visible = true
		return
	end
	if not ClansFrame.InviteFrame.ScrollingFrame:FindFirstChild(p1) then
		return
	end
	ClansFrame.InviteFrame.ScrollingFrame[p1].Send.Label.Text = "Sent!"
	task.wait(0.5)
	ClansFrame.InviteFrame.ScrollingFrame[p1].Send.Label.Text = "Send"
end)
Request.Yes.MouseButton1Click:Connect(function() --[[ Line: 498 | Upvalues: Clans (copy), Request (copy) ]]
	Clans.Invite:FireServer("Clan", Request.ClanID.Value)
end)
Request.No.MouseButton1Click:Connect(function() --[[ Line: 501 | Upvalues: Request (copy) ]]
	Request.Visible = false
end)
ClansFrame.InviteFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 505 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.InviteFrame.Visible = false
end)
ClansFrame.Invite.MouseButton1Click:Connect(function() --[[ Line: 508 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.InviteFrame.Visible = not ClansFrame.InviteFrame.Visible
end)
ClansFrame.MyClanFrame.Normal.Delete.MouseButton1Click:Connect(function() --[[ Line: 512 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ConfirmDelete.Visible = true
end)
ClansFrame.MyClanFrame.Normal.ConfirmDelete.Yes.MouseButton1Click:Connect(function() --[[ Line: 515 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.Delete:FireServer()
	ClansFrame.MyClanFrame.Normal.ConfirmDelete.Visible = false
end)
ClansFrame.MyClanFrame.Normal.ConfirmDelete.No.MouseButton1Click:Connect(function() --[[ Line: 519 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.MyClanFrame.Normal.ConfirmDelete.Visible = false
end)
ClansFrame.Leave.MouseButton1Click:Connect(function() --[[ Line: 523 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.ConfirmLeave.Visible = true
end)
ClansFrame.ConfirmLeave.Yes.MouseButton1Click:Connect(function() --[[ Line: 526 | Upvalues: Clans (copy), ClansFrame (copy) ]]
	Clans.Leave:FireServer()
	ClansFrame.ConfirmLeave.Visible = false
end)
ClansFrame.ConfirmLeave.No.MouseButton1Click:Connect(function() --[[ Line: 530 | Upvalues: ClansFrame (copy) ]]
	ClansFrame.ConfirmLeave.Visible = false
end)
ClansFrame.RewardsFrame.Restart.MouseButton1Click:Connect(function() --[[ Line: 534 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ResetClanPass)
end)
initButtons()
updateInvite()
initRewards()
updateQuests()
task.spawn(function() --[[ Line: 543 ]]
	while true do
		task.wait(60)
		updateRewards()
	end
end)
Tween:AddButton(ClansButton, ClansFrame)
Tween:AddButton(ClansFrame.Exit, ClansFrame)
Tween:AddButton(ClansFrame.MyClanFrame.Create.Create)
Tween:AddButton(ClansFrame.MyClanFrame.Create.PaymentOptions.Exit)
Tween:AddButton(ClansFrame.MyClanFrame.Create.PaymentOptions.Robux)
Tween:AddButton(ClansFrame.MyClanFrame.Create.PaymentOptions.Tokens)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.EditMember.ChangeRank)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.EditMember.Kick)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.EditMember.Exit)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeRank.Member)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeRank.Officer)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeRank.MakeOwner)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeRank.Exit)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeBio)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Exit)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeBioFrame.Change)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeIcon)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Exit)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ChangeIconFrame.Change)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ConfirmKick.Yes)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ConfirmKick.No)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ConfirmOwner.Yes)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ConfirmOwner.No)
Tween:AddButton(Request.Yes)
Tween:AddButton(Request.No)
Tween:AddButton(ClansFrame.InviteFrame.Exit)
Tween:AddButton(ClansFrame.Invite)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.Delete)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ConfirmDelete.Yes)
Tween:AddButton(ClansFrame.MyClanFrame.Normal.ConfirmDelete.No)
Tween:AddButton(ClansFrame.ConfirmLeave.Yes)
Tween:AddButton(ClansFrame.ConfirmLeave.No)
Tween:AddButton(ClansFrame.Leave)
Tween:AddButton(ClansFrame.RewardsFrame.Restart)
Clans.Update.OnClientEvent:Connect(update)
Clans.TopClans.OnClientEvent:Connect(updateTopClans)
Clans.UpdateRewards.OnClientEvent:Connect(updateRewards)
ReplicatedStorage.Remotes.Quests.Update.OnClientEvent:Connect(updateQuests)
Players.PlayerAdded:Connect(updateInvite)
Players.PlayerRemoving:Connect(updateInvite)