-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Ranked = game.ReplicatedStorage.Remotes.Ranked
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local v1 = script.Parent
local Main = v1.DuoFrame.BG.Main
local Size = v1.Parent.RankRequest.Size
local v2 = nil
function Format(p1) --[[ Format | Line: 14 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 18 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
function updatePlayerList() --[[ updatePlayerList | Line: 26 | Upvalues: v1 (copy), LocalPlayer (copy), Tween (copy), Ranked (copy) ]]
	for k, v in pairs(v1.InviteFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and (v.Name ~= "Example" and not game.Players:FindFirstChild(v.Name)) then
			v:Destroy()
		end
	end
	for i, v in ipairs(game.Players:GetPlayers()) do
		if v.Name ~= LocalPlayer.Name and not v1.InviteFrame.ScrollingFrame:FindFirstChild(v.Name) then
			local v12 = v1.InviteFrame.ScrollingFrame.Example:Clone()
			v12.Name = v.Name
			v12.PlayerName.Text = ("%* (@%*)"):format(v.DisplayName, v.Name)
			v12.Visible = true
			v12.Parent = v1.InviteFrame.ScrollingFrame
			Tween:AddButton(v12.Send)
			v12.Send.MouseButton1Click:Connect(function() --[[ Line: 44 | Upvalues: Ranked (ref), v (copy), v12 (copy) ]]
				Ranked.Party:FireServer("Send", v.Name)
				v12.Send.Label.Text = "SENT!"
				task.wait(0.8)
				v12.Send.Label.Text = "INVITE"
			end)
		end
	end
end
function updateParty() --[[ updateParty | Line: 53 | Upvalues: Ranked (copy), v1 (copy), LocalPlayer (copy), Main (copy) ]]
	local v12 = Ranked.GetParty:InvokeServer()
	v1.InviteFrame.Visible = false
	local v2, _ = game.Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	Main.You.BorderImage.TowerImage.Image = v2
	Main.You.Price.Info.Text = LocalPlayer.Name
	local count = 0
	for k, v in pairs(Main:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "You" then
			count = count + 1
			v.Name = tostring(count)
			v.BorderImage.TowerImage.Image = ""
			v.Price.Info.Text = "INVITE"
		end
	end
	local count_2 = 0
	for k, v in pairs(v12) do
		if v ~= LocalPlayer.Name then
			local v3 = game.Players:FindFirstChild(v)
			if v3 then
				count_2 = count_2 + 1
				local v4 = Main:FindFirstChild((tostring(count_2)))
				if v4 then
					local v5, _2 = game.Players:GetUserThumbnailAsync(v3.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					v4.Name = v
					v4.BorderImage.TowerImage.Image = v5
					v4.Price.Info.Text = v
				end
			end
		end
	end
end
function sent(p1) --[[ sent | Line: 89 | Upvalues: v1 (copy), TweenService (copy), Size (copy), v2 (ref) ]]
	v1.Parent.RankRequest.Size = UDim2.new(0, 0, 0, 0)
	v1.Parent.RankRequest.Visible = true
	TweenService:Create(v1.Parent.RankRequest, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size
	}):Play()
	v2 = p1
	v1.Parent.RankRequest.Message.Text = p1 .. " sent you a ranked party invite."
end
v1.Parent.RankRequest.Yes.MouseButton1Click:Connect(function() --[[ Line: 100 | Upvalues: v1 (copy), Ranked (copy), v2 (ref) ]]
	v1.Parent.RankRequest.Visible = false
	Ranked.Party:FireServer("Accept", v2)
	v2 = nil
end)
v1.Parent.RankRequest.No.MouseButton1Click:Connect(function() --[[ Line: 105 | Upvalues: v1 (copy), Ranked (copy), v2 (ref) ]]
	v1.Parent.RankRequest.Visible = false
	Ranked.Party:FireServer("Decline", v2)
	v2 = nil
end)
v1.InviteFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 111 | Upvalues: v1 (copy) ]]
	local Text = v1.InviteFrame.Search.TextBox.Text
	for k, v in pairs(v1.InviteFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			local v12 = nil
			pcall(function() --[[ Line: 118 | Upvalues: v12 (ref), v (copy), Text (copy) ]]
				v12 = string.find(string.lower(v.PlayerName.Text), string.lower(Text))
			end)
			if v12 then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end)
Ranked.FoundGame.OnClientEvent:Connect(function() --[[ Line: 130 | Upvalues: v1 (copy) ]]
	v1.Header.Text = "TELEPORTING"
	v1.QueueTime.Visible = false
	v1.Leave.Visible = false
end)
v1.Leave.MouseButton1Click:Connect(function() --[[ Line: 136 ]]
	game.ReplicatedStorage.Remotes.Ranked.LeaveQueue:FireServer()
end)
local v3 = nil
Ranked.Added.OnClientEvent:Connect(function(p1, p2) --[[ Line: 141 | Upvalues: v3 (ref), v1 (copy) ]]
	local v12 = tick()
	v3 = v12
	v1.Single.Visible = false
	v1.Duo.Visible = false
	v1.Close.Visible = false
	v1.Header.Visible = true
	v1.Leave.Visible = true
	v1.Visible = not p1
	v1.QueueTime.Visible = if p1 then false else true
	if p1 then
		return
	end
	local count = 0
	v1.QueueTime.Text = ("Looking For A Match: %*"):format((convertToHMS(count)))
	while v12 == v12 do
		task.wait(1)
		count = count + 1
		v1.QueueTime.Text = ("Looking For A Match: %*"):format((convertToHMS(count)))
	end
end)
Ranked.JoinQueue.OnClientEvent:Connect(function() --[[ Line: 168 | Upvalues: v1 (copy) ]]
	v1.Visible = true
	v1.DuoFrame.Visible = false
	v1.Header.Visible = false
	v1.QueueTime.Visible = false
	v1.Leave.Visible = false
	v1.Duo.Visible = true
	v1.Single.Visible = true
	v1.Close.Visible = true
end)
v1.Single.MouseButton1Click:Connect(function() --[[ Line: 181 | Upvalues: Ranked (copy), v1 (copy) ]]
	Ranked.JoinQueue:FireServer("Solo")
	v1.Single.Visible = false
	v1.Duo.Visible = false
	v1.Close.Visible = false
end)
v1.Duo.MouseButton1Click:Connect(function() --[[ Line: 187 | Upvalues: v1 (copy) ]]
	v1.DuoFrame.Visible = true
	v1.Single.Visible = false
	v1.Duo.Visible = false
	v1.Close.Visible = false
	updateParty()
end)
v1.DuoFrame.Join.MouseButton1Click:Connect(function() --[[ Line: 195 | Upvalues: v1 (copy), Ranked (copy) ]]
	if not v1.InviteFrame.Visible then
		Ranked.JoinQueue:FireServer("Duo")
		v1.DuoFrame.Visible = false
	end
end)
v1.Close.MouseButton1Click:Connect(function() --[[ Line: 201 | Upvalues: v1 (copy) ]]
	v1.Visible = false
end)
v1.InviteFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 205 | Upvalues: v1 (copy) ]]
	v1.InviteFrame.Visible = false
end)
v1.DuoFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 209 | Upvalues: v1 (copy) ]]
	v1.DuoFrame.Visible = false
end)
for k, v in pairs(Main:GetChildren()) do
	if v:IsA("ImageButton") and v.Name ~= "You" then
		Tween:AddButton(v)
		Tween:AddButton(v.Price)
		v.MouseButton1Click:Connect(function() --[[ Line: 217 | Upvalues: v (copy), Ranked (copy), v1 (copy) ]]
			if v.Name == "1" then
				v1.InviteFrame.Visible = true
			else
				Ranked.Party:FireServer("Kick", v.Name)
			end
		end)
		v.Price.MouseButton1Click:Connect(function() --[[ Line: 224 | Upvalues: v (copy), Ranked (copy), v1 (copy) ]]
			if v.Name == "1" then
				v1.InviteFrame.Visible = true
			else
				Ranked.Party:FireServer("Kick", v.Name)
			end
		end)
	end
end
updatePlayerList()
Tween:AddButton(v1.Leave)
Tween:AddButton(v1.Single)
Tween:AddButton(v1.Duo)
Tween:AddButton(v1.DuoFrame.Join)
Tween:AddButton(v1.DuoFrame.Exit)
Tween:AddButton(v1.InviteFrame.Exit)
Tween:AddButton(v1.Parent.RankRequest.Yes)
Tween:AddButton(v1.Parent.RankRequest.No)
Tween:AddButton(v1.Close)
Ranked.Party.OnClientEvent:Connect(function(p1, p2) --[[ Line: 245 ]]
	if not p1 then
		updateParty()
		return
	end
	if p1 ~= "Sent" then
		return
	end
	sent(p2)
end)
game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)