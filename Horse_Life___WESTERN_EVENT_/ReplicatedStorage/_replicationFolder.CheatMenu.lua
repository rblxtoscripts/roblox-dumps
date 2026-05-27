-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("LevelUtils")
local v4 = RunService:IsServer()
local v5 = nil
if game.PlaceId == 13590762934 or RunService:IsStudio() then
	if not v4 then
		game:GetService("TextChatService").SendingMessage:Connect(function(p1) --[[ Line: 32 | Upvalues: v5 (ref) ]]
			if p1.Text:lower() ~= "/cheatmenu" or not v5 then
				return
			end
			v5.Visible = not v5.Visible
		end)
	end
	warn("[Cheat Menu] Cheating is ENABLED")
	local v7 = if v4 then nil else Sonar("GuiUtils")
	local v8 = v2.GetRemoteEvent("CheatStat")
	local v9 = v2.GetRemoteEvent("LogCheat")
	local v10 = v2.GetRemoteEvent("CheatLevel")
	function make(p1) --[[ make | Line: 57 | Upvalues: v5 (ref), v7 (ref), v8 (copy), v1 (copy), v10 (copy), v9 (copy) ]]
		v5 = p1
		local v12 = nil
		local v2 = nil
		v7.manageCanvasSize(p1.ScrollingFrame.UIListLayout)
		local function makeStat(p12) --[[ makeStat | Line: 65 | Upvalues: p1 (copy), v2 (ref), v8 (ref), v12 (ref) ]]
			local v22 = typeof(p12.Value)
			if v22 ~= "number" and v22 ~= "string" then
				return
			end
			local Default = p1.ScrollingFrame.Default
			local v3 = Default:Clone()
			v3.Stat.Text = v2:_decompress(p12.Name)
			v3.TextBox.PlaceholderText = p12.Value
			v3.TextBox.FocusLost:Connect(function(p1) --[[ Line: 75 | Upvalues: v3 (copy), v22 (copy), v8 (ref), p12 (copy) ]]
				local Text = v3.TextBox.Text
				if Text == "" then
					return
				end
				local v1 = tonumber(Text)
				if (if v1 then "number" else "string") == v22 then
					v8:FireServer(p12.Name, v1 or Text)
				else
					print("Illegal type!")
				end
			end)
			local v4 = v2:_compress(p12.Name)
			local v5 = v12.Model.Data:GetAttributeChangedSignal(v4):Connect(function() --[[ Line: 92 | Upvalues: v3 (copy), v12 (ref), v4 (copy) ]]
				v3.TextBox.PlaceholderText = v12.Model.Data:GetAttribute(v4)
			end)
			v3.Destroying:Connect(function() --[[ Line: 96 | Upvalues: v5 (ref) ]]
				v5:Disconnect()
				v5 = nil
			end)
			v3.Visible = true
			v3.Parent = Default.Parent
			return v3
		end
		local function remakeStats() --[[ remakeStats | Line: 107 | Upvalues: p1 (copy), v1 (ref), v12 (ref), v2 (ref), makeStat (copy) ]]
			for k, v in pairs(p1.ScrollingFrame:GetChildren()) do
				if v:IsA("Frame") and v.Visible then
					v:Destroy()
				end
			end
			v12 = v1.GetClient():GetCurrentCharacter()
			if not v12 then
				return
			end
			v2 = v12.AnimalData
			local t = {}
			for k, v in pairs((v2:GetAllStats())) do
				table.insert(t, k)
			end
			table.sort(t)
			for k, v in pairs(v2:GetAllStats()) do
				local v22 = makeStat({
					Name = k,
					Value = v
				})
				if v22 then
					v22.LayoutOrder = table.find(t, k) or 0
				end
			end
		end
		p1.Level.Level.FocusLost:Connect(function(p12) --[[ Line: 137 | Upvalues: p1 (copy), v10 (ref) ]]
			if not p12 then
				return
			end
			local Text = p1.Level.Level.Text
			if not tonumber(Text) then
				return
			end
			if not (tonumber(Text) < 0 or tonumber(Text) > 10000000000) then
				v10:FireServer((tonumber(Text)))
			end
		end)
		game.Players.LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 151 | Upvalues: remakeStats (copy) ]]
			task.wait(1)
			remakeStats()
		end)
		p1.Close.MouseButton1Click:Connect(function() --[[ Line: 156 | Upvalues: p1 (copy) ]]
			p1.Visible = false
		end)
		local function makeLog(p12) --[[ makeLog | Line: 160 | Upvalues: p1 (copy) ]]
			local v1 = typeof(p12)
			if v1 == "number" or v1 == "string" then
				local Default = p1.Log.ScrollingFrame.Default
				local v2 = Default:Clone()
				v2.Label.Text = p12
				v2.Visible = true
				v2.Parent = Default.Parent
			end
		end
		v7.manageCanvasSize(p1.Log.ScrollingFrame.UIListLayout)
		game.Players.LocalPlayer.Chatted:Connect(function(p12) --[[ Line: 176 | Upvalues: v1 (ref), p1 (copy) ]]
			if p12:lower() ~= "/dump" then
				return
			end
			v1.getWrapperFromPlayer(game.Players.LocalPlayer):GetCurrentCharacter():_dump()
			local Default = p1.Log.ScrollingFrame.Default
			local v12 = Default:Clone()
			v12.Label.Text = "CHARACTER DEBUG DUMP IN F9 CONSOLE, PRESS F9 OR TYPE /CONSOLE TO VIEW"
			v12.Visible = true
			v12.Parent = Default.Parent
			local Default_2 = p1.Log.ScrollingFrame.Default
			local v2 = Default_2:Clone()
			v2.Label.Text = "CHARACTER DEBUG DUMP IN F9 CONSOLE, PRESS F9 OR TYPE /CONSOLE TO VIEW"
			v2.Visible = true
			v2.Parent = Default_2.Parent
			local Default_3 = p1.Log.ScrollingFrame.Default
			local v3 = Default_3:Clone()
			v3.Label.Text = "CHARACTER DEBUG DUMP IN F9 CONSOLE, PRESS F9 OR TYPE /CONSOLE TO VIEW"
			v3.Visible = true
			v3.Parent = Default_3.Parent
		end)
		v9.OnClientEvent:Connect(function(p12) --[[ Line: 185 | Upvalues: p1 (copy) ]]
			local v1 = typeof(p12)
			if v1 == "number" or v1 == "string" then
				local Default = p1.Log.ScrollingFrame.Default
				local v2 = Default:Clone()
				v2.Label.Text = p12
				v2.Visible = true
				v2.Parent = Default.Parent
			end
		end)
	end
	if not v4 then
		return make
	end
	local function check(p1) --[[ check | Line: 191 | Upvalues: v1 (copy) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if v12 then
			return v12:HasPermission("Developer")
		end
	end
	v8.OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 200 | Upvalues: v1 (copy) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not (if v12 then v12:HasPermission("Developer") else nil) then
			return
		end
		local v4 = v1.getWrapperFromPlayer(p1):GetCurrentCharacter()
		if not v4 then
			return
		end
		v4.AGE_LOCK = true
		v4.AnimalData:Set(p2, p3)
	end)
	v10.OnServerEvent:Connect(function(p1, p2) --[[ Line: 212 | Upvalues: v1 (copy), v3 (copy) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if if v12 then v12:HasPermission("Developer") else nil then
			local v4 = v1.getWrapperFromPlayer(p1)
			v4.PlayerData.Level.Value = p2
			v4.PlayerData.Experience.Value = v3.GetRequiredExperience(p2, 1) - 1
		end
	end)
	game:GetService("LogService").MessageOut:Connect(function(p1, p2) --[[ Line: 221 | Upvalues: v9 (copy) ]]
		if p2 ~= Enum.MessageType.MessageError then
			return
		end
		local v1 = p1:lower()
		if v1:find("download") then
			return
		end
		if not v1:find("unable") then
			v9:FireAllClients(p1)
		end
	end)
	return make
else
	if v4 then
		return nil
	end
	game.Players.LocalPlayer.Chatted:Connect(function(p1) --[[ Line: 19 | Upvalues: v1 (copy) ]]
		if p1:lower() ~= "/dump" then
			return
		end
		v1.getWrapperFromPlayer(game.Players.LocalPlayer):GetCurrentCharacter():_dump()
	end)
	local _ = v1.GetClient():HasPermission("Tester") or v1.GetClient():HasPermission("Developer")
	return nil
end