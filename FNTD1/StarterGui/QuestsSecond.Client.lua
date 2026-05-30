-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Quests = game.ReplicatedStorage.Remotes.Quests
local CommitData = game.ReplicatedStorage.Remotes.CommitData
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Quests_2 = require(game.ReplicatedStorage.Modules.Misc.Quests)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local Items = require(game.ReplicatedStorage.Configs.Items)
local Presents = require(game.ReplicatedStorage.Configs.Presents)
local MainFrame = script.Parent.MainFrame
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
		MainFrame.ResetTimer.Text = "ENDS IN " .. convertToHMS(p1 - count)
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
function updateGlobal() --[[ updateGlobal | Line: 67 | Upvalues: MainFrame (copy), Quests_2 (copy), Quests (copy), TweenService (copy), Formatter (copy) ]]
	for k, v in pairs(MainFrame.HolderFrame.Global:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			local v1 = v.Name
			local v3, v4 = Quests.GetGlobal:InvokeServer(v1)
			if not v3 then
				v3 = 0
			end
			local Requirement = Quests_2.Global[v1].Requirement
			if v3 then
				if Requirement < v3 then
					v3 = Requirement
				end
				TweenService:Create(v.Bar.Move, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					Size = UDim2.new(v3 / Requirement, 0, 1, 0)
				}):Play()
				local v5 = if v3 < 1000 then math.round(v3 * 1000) / 1000 else Formatter.FormatCompact(v3)
				v.Bar.Progress.Text = v5 .. "/" .. Formatter.FormatCompact(Requirement)
			end
			if v4 then
				task.wait(2.5)
			end
		end
	end
end
function update() --[[ update | Line: 92 | Upvalues: v1 (ref), ClientState (copy), MainFrame (copy), Quests_2 (copy), TweenService (copy), Formatter (copy) ]]
	v1 = ClientState.GetData()
	for k, v in pairs({
		Personal = v1.Quests.Personal,
		Global = v1.Quests.Global
	}) do
		local v12 = MainFrame.HolderFrame[k]
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
					v3.Visible = true
					v3.Parent = v12
				end
			end
		end
		if k ~= "Global" then
			for k2, v2 in pairs(v12:GetChildren()) do
				if v2:IsA("Frame") and v2.Name ~= "Example" then
					local v4 = Quests_2[k][v2.Name]
					if v4 then
						local v5 = v1.Quests[k][v2.Name]
						if v5 then
							local v6 = if v5.Claimed then (1 / 0) else v5.Progress
							local v7 = if v4.Requirement then v4.Requirement else 1
							if v7 < v6 then
								v6 = v7
							end
							TweenService:Create(v2.Bar.Move, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								Size = UDim2.new(v6 / v7, 0, 1, 0)
							}):Play()
							local v8 = if v6 < 1000 then math.round(v6 * 1000) / 1000 else Formatter.FormatCompact(v6)
							v2.Bar.Progress.Text = v8 .. "/" .. Formatter.FormatCompact(v7)
							continue
						end
						v2:Destroy()
					end
				end
			end
		end
	end
	task.spawn(updateGlobal)
end
game.ReplicatedStorage.Remotes.Quests.Client.Second.OnClientEvent:Connect(function() --[[ Line: 146 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
local t2 = { MainFrame.HolderFrame.Personal, MainFrame.HolderFrame.Global, MainFrame.HolderFrame.Info }
for k, v in pairs({ MainFrame.Personal, MainFrame.Global, MainFrame.Info }) do
	Tween:AddButton(v)
	v.MouseButton1Click:Connect(function() --[[ Line: 157 | Upvalues: t2 (copy), v (copy), MainFrame (copy) ]]
		for k, v2 in pairs(t2) do
			v2.Visible = v.Name == v2.Name
			MainFrame.ProgressUI.Personal.Visible = false
			MainFrame.ProgressUI.Global.Visible = false
		end
	end)
end
MainFrame.HolderFrame.Personal.Visible = true
MainFrame.HolderFrame.Global.Visible = false
MainFrame.HolderFrame.Info.Visible = false
MainFrame.ProgressUI.Visible = true
MainFrame.ProgressUI.Personal.Visible = false
MainFrame.ProgressUI.Global.Visible = false
MainFrame.TransferButton.MouseButton1Click:Connect(function() --[[ Line: 173 | Upvalues: CommitData (copy) ]]
	CommitData:FireServer()
end)
MainFrame.HolderFrame.ViewProgress.MouseButton1Click:Connect(function() --[[ Line: 177 | Upvalues: MainFrame (copy) ]]
	if MainFrame.HolderFrame.Global.Visible then
		MainFrame.ProgressUI.Personal.Visible = false
		MainFrame.ProgressUI.Global.Visible = true
	else
		MainFrame.ProgressUI.Personal.Visible = true
		MainFrame.ProgressUI.Global.Visible = false
	end
	MainFrame.HolderFrame.Personal.Visible = false
	MainFrame.HolderFrame.Global.Visible = false
	MainFrame.HolderFrame.Info.Visible = false
end)
task.spawn(update)
local v3 = os.time({
	year = 2025,
	month = 10,
	day = 19,
	hour = 18,
	min = 0,
	sec = 0
})
task.spawn(timer, v3 - os.time())
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(MainFrame.HolderFrame.ViewProgress)
Tween:AddButton(MainFrame.TransferButton)
Quests.Update.OnClientEvent:Connect(update)