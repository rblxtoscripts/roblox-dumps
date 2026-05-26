-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local colorFromId = require(game.ReplicatedStorage.Library.Utility.colorFromId)
local v1 = 0
local v2 = 1
local v3 = 1
local function updateCheckpointsState(p1, p2) --[[ updateCheckpointsState | Line: 9 | Upvalues: v1 (ref), v3 (ref) ]]
	if p1 ~= "checkpoints" then
		return
	end
	if p2 then
		for k, v in pairs(workspace.tower.sections:GetChildren()) do
			if v.i.Value > 2 and (v.i.Value % 2 == 0 and v.Name ~= "finish") then
				local v12 = UDim2.new(0, 0, 1 - (v.center.Position.Y - v.center.Size.X / 2 - v1) / v3)
				local v2 = script.checkpoint:Clone()
				v2.Position = v12
				v2.i.Value = v.i.Value
				v2.Parent = script.Parent.HeightMeter
			end
		end
	else
		for k, v in pairs(script.Parent.HeightMeter:GetChildren()) do
			if v.Name == "checkpoint" then
				v:Destroy()
			end
		end
	end
end
local function update(p1) --[[ update | Line: 29 | Upvalues: v1 (ref), v2 (ref), v3 (ref), updateCheckpointsState (copy) ]]
	script.Parent.HeightMeter:ClearAllChildren()
	p1:WaitForChild("sectionCount")
	p1:WaitForChild("sectionData")
	while p1.sectionCount.Value > #p1.sectionData:GetChildren() do
		wait()
	end
	v1 = p1:WaitForChild("bottom").Value
	v2 = p1:WaitForChild("top").Value
	v3 = v2 - v1
	for k, v in pairs(p1.sectionData:GetChildren()) do
		local v12 = script.section:Clone()
		v12.Size = UDim2.new(1, 0, v:WaitForChild("center").Size.X / v3, 1)
		v12.Position = UDim2.new(0, 0, 1 - (v.center.Position.Y + v.center.Size.X / 2 - v1) / v3)
		v12.BackgroundColor3 = v.center.Color
		v12.Parent = script.Parent.HeightMeter
	end
	for k, v in pairs(game.ReplicatedStorage.Remotes.Game.fetchMutators:InvokeServer()) do
		updateCheckpointsState(v, true)
	end
end
if workspace:FindFirstChild("tower") then
	local tower = workspace:FindFirstChild("tower")
	tower:WaitForChild("sections").ChildAdded:Connect(function() --[[ Line: 52 | Upvalues: update (copy), tower (copy) ]]
		update(tower)
	end)
	update(tower)
end
workspace.ChildAdded:connect(function(p1) --[[ Line: 57 | Upvalues: update (copy) ]]
	if p1.Name ~= "tower" then
		return
	end
	update(p1)
	p1.sections.ChildAdded:Connect(function() --[[ Line: 60 | Upvalues: update (ref), p1 (copy) ]]
		update(p1)
	end)
end)
game.ReplicatedStorage.Remotes.Game.mutatorChanged.OnClientEvent:Connect(updateCheckpointsState)
for k, v in pairs(game.ReplicatedStorage.Remotes.Game.fetchMutators:InvokeServer()) do
	updateCheckpointsState(v, true)
end
local v4 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local meterUsernamesEnabled = game.ReplicatedStorage.Configuration.meterUsernamesEnabled
local showMeterHighest = game.ReplicatedStorage.Configuration.showMeterHighest
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 79 | Upvalues: v4 (copy), showMeterHighest (copy), v1 (ref), v3 (ref), TweenService (copy), colorFromId (copy), meterUsernamesEnabled (copy) ]]
	local _ = workspace:WaitForChild("tower"):WaitForChild("maxCoins").Value
	local _2 = workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value
	local v2 = math.floor(require(game.ReplicatedStorage.Configuration.getRewardFactor)(game.Players.LocalPlayer) * workspace.tower.maxCoins.Value)
	if v4:FindFirstChild("highestSection") and (v4.highestSection.Value > 2 and v2 > 0) then
		local reward = script.Parent.HeightMeter:FindFirstChild("reward")
		if not reward then
			reward = script.reward:Clone()
			reward.Parent = script.Parent.HeightMeter
		end
		reward.Visible = not showMeterHighest.Value
		workspace:WaitForChild("tower")
		reward.coins.amount.Text = v2 * (v4.coinMultiplier.Value + workspace.tower.coinMultiplier.Value)
		local v32 = (v4.highestPoint.Value - v1) / v3
		local Character = game.Players.LocalPlayer.Character
		local v5 = ((if Character and Character:FindFirstChild("HumanoidRootPart") then Character.HumanoidRootPart.Position.Y or 0 else 0) - v1) / v3
		if reward.BackgroundTransparency == 1 then
			if math.abs(v32 - v5) > 0.055 then
				TweenService:Create(reward, TweenInfo.new(0.2), {
					BackgroundTransparency = 0
				}):Play()
				TweenService:Create(reward.coins, TweenInfo.new(0.2), {
					AnchorPoint = Vector2.new(0, 1)
				}):Play()
			end
		elseif math.abs(v32 - v5) < 0.025 then
			TweenService:Create(reward, TweenInfo.new(0.2), {
				BackgroundTransparency = 1
			}):Play()
			TweenService:Create(reward.coins, TweenInfo.new(0.2), {
				AnchorPoint = Vector2.new(1, 1)
			}):Play()
		end
		local BackgroundTransparency = reward.BackgroundTransparency
		reward.Position = UDim2.new(1, 0, 1 - (v5 * BackgroundTransparency + v32 * (1 - BackgroundTransparency)))
	elseif script.Parent.HeightMeter:FindFirstChild("reward") then
		script.Parent.HeightMeter.reward:Destroy()
	end
	if showMeterHighest.Value then
		local v14 = (-1 / 0)
		local v15 = nil
		for k, v in pairs(game.ReplicatedStorage.data:GetChildren()) do
			if v14 < v.highestPoint.Value then
				v15 = game.Players:GetPlayerByUserId(v.Name)
				v14 = v.highestPoint.Value
			end
		end
		local Character = v15.Character
		if (if Character and Character:FindFirstChild("HumanoidRootPart") then Character.HumanoidRootPart.Position.Y or 0 else 0) + 4 < v14 then
			local winner = script.Parent.HeightMeter:FindFirstChild("winner")
			if not winner then
				winner = script.player:Clone()
				winner.Name = "winner"
				winner.Parent = script.Parent.HeightMeter
				winner.player.ImageTransparency = 0.4
				winner.BackgroundTransparency = 0.4
				winner.username.Text = v15.Name
				winner.username.Visible = true
			end
			if winner:GetAttribute("user") ~= v15.UserId then
				winner:SetAttribute("user", v15.UserId)
				spawn(function() --[[ Line: 143 | Upvalues: winner (ref), v15 (ref) ]]
					winner.player.Image = require(game.ReplicatedStorage.Library.Utility.getAvatarThumbnail)(v15.UserId, Enum.ThumbnailType.HeadShot)
				end)
			end
			winner.Position = UDim2.new(1, 0, 1 - (v14 - v1) / v3)
		else
			local winner = script.Parent.HeightMeter:FindFirstChild("winner")
			if winner then
				winner:Destroy()
			end
		end
	end
	if v4:FindFirstChild("highestSection") then
		local v6
		for k, v in pairs(script.Parent.HeightMeter:GetChildren()) do
			if v.Name == "checkpoint" then
				if v4.unlockedCheckpoint.Value >= v.i.Value then
					for k2, v5 in pairs(workspace.tower.sections:GetChildren()) do
						if v.i.Value == v5.i.Value then
							v6 = v5.center.Color
							v.ImageColor3 = Color3.new(1 - v6.r, 1 - v6.g, 1 - v6.b)
						end
					end
					continue
				end
				v.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
			end
		end
	end
	for k, v in pairs(script.Parent.HeightMeter:GetChildren()) do
		local v7, v8, v9
		if v.Name ~= "section" and (v.Name ~= "reward" and (v.Name ~= "checkpoint" and v.Name ~= "winner")) then
			v7 = game.Players
			v8 = v.Name
			v9 = v7:GetPlayerByUserId((tonumber(v8)))
			if not v9 or (not v9.Character or v9.Character.invisible.Value) then
				v:Destroy()
			end
		end
	end
	for k, v in pairs(game.Players:GetChildren()) do
		local v10, v11, v122, v13
		if v.Character and not v.Character.invisible.Value then
			v10 = script.Parent.HeightMeter:FindFirstChild(v.UserId)
			if v10 then
				v10.username.Visible = meterUsernamesEnabled.Value
				if script.Parent.HeightMeter:FindFirstChild("reward") then
					v11 = script.Parent.HeightMeter.reward
					v122 = not meterUsernamesEnabled.Value and not showMeterHighest.Value
					v11.Visible = v122
				end
				if script.Parent.HeightMeter:FindFirstChild("winner") then
					script.Parent.HeightMeter.winner.Visible = showMeterHighest.Value
				end
			else
				v10 = script.player:Clone()
				v13 = v10:WaitForChild("player")
				v10.Name = v.UserId
				spawn(function() --[[ Line: 189 | Upvalues: v13 (copy), v (copy) ]]
					v13.Image = require(game.ReplicatedStorage.Library.Utility.getAvatarThumbnail)(v.UserId, Enum.ThumbnailType.HeadShot)
				end)
				v10.BackgroundColor3 = colorFromId(v.UserId)
				v10.username.Text = v.Name
				v10.username.Visible = meterUsernamesEnabled.Value
				v10.Parent = script.Parent.HeightMeter
				v13.Activated:Connect(function() --[[ Line: 198 | Upvalues: v (copy) ]]
					script.Parent.Parent.admin.popup.open:Fire(v.Name)
				end)
			end
			if v.Character:FindFirstChild("HumanoidRootPart") then
				v10.Position = UDim2.new(1, 0, 1 - (v.Character:WaitForChild("HumanoidRootPart").Position.Y - v1) / v3)
			end
		end
	end
end)