-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnalyticsService", "Server")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = not RunService:IsServer() and Sonar("PromptClient")
local v5 = not RunService:IsServer() and Sonar("NotificationsClient")
local v6 = Sonar("TimeUtils")
Sonar("WeightedProbability")
Sonar("ItemSetService")
local v7 = not RunService:IsServer() and Sonar("CameraShaker")
local v8 = Sonar("SettingsService")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("PlaceTypeService")
local v11 = Sonar("Maid")
local v12 = v2.GetRemoteEvent("ClientDuelEvent")
local v13 = Sonar(v9.Get("JoustingRods"))
local Medieval2025Turnin = Sonar("Constants").Medieval2025Turnin
local _ = RunService:IsStudio() or v10.IsTestGame()
local t = {}
local t2 = {}
local t3 = {}
function t.CheckTimer(p1) --[[ CheckTimer | Line: 40 ]] end
function t.ResetMedieval(p1) --[[ ResetMedieval | Line: 58 ]] end
function t.IsInDuel(p1) --[[ IsInDuel | Line: 74 | Upvalues: t3 (copy) ]]
	for v1, v2 in t3 do
		if v2.Player1 == p1 or v2.Player2 == p1 then
			return true
		end
	end
	return false
end
function t.IncrementSpeciesPoints(p1, p2) --[[ IncrementSpeciesPoints | Line: 84 ]] end
function t.GetMountedHorse(p1) --[[ GetMountedHorse | Line: 103 ]]
	local Character = p1.Character
	if not Character then
		return nil
	end
	local Humanoid = Character:FindFirstChild("Humanoid")
	if not Humanoid then
		return nil
	end
	local SeatPart = Humanoid.SeatPart
	if not SeatPart then
		return nil
	end
	if SeatPart:IsDescendantOf(Character.Animals) then
		return SeatPart.Parent
	else
		return nil
	end
end
local function GetEquippedTool(p1) --[[ GetEquippedTool | Line: 120 ]]
	if p1 == nil then
		return nil
	end
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("Tool") then
			return v
		end
	end
	return nil
end
function t.DetermineJoustWinner(p1, p2, p3, p4) --[[ DetermineJoustWinner | Line: 131 | Upvalues: v13 (copy) ]]
	local v1 = v13[p3]
	local v2 = v13[p4]
	if (v1.Reliability + v2.Reliability) / 100 < math.random() then
		return nil, "missed"
	end
	if v1.Strength / (v1.Strength + v2.Strength) >= math.random() then
		return p1, "strength"
	else
		return p2, "strength"
	end
end
function t.CheckJoustRequirements(p1, p2) --[[ CheckJoustRequirements | Line: 190 | Upvalues: t (copy), v3 (copy), Sonar (copy), GetEquippedTool (copy), v13 (copy) ]]
	if not (p1 and p2) then
		return false, "PlayerNotFound"
	end
	local v1 = t.GetMountedHorse(p1)
	local v2 = t.GetMountedHorse(p2)
	if not v1 then
		return false, "NotMounted"
	end
	if not v2 then
		return false, "TargetNotMounted"
	end
	local v32 = v3.getWrapperFromPlayer(p1)
	local v4 = v3.getWrapperFromPlayer(p2)
	if Sonar("TutorialService").IsInTutorial(v4) or Sonar("TutorialService").IsInTutorial(v32) then
		return false, "InTutorial"
	end
	local v5 = GetEquippedTool(p1.Character)
	local v6 = GetEquippedTool(p2.Character)
	if not v5 then
		return false, "NoJoustingTool"
	end
	if not v6 then
		return false, "TargetNoJoustingTool"
	end
	local v7 = v13[v5.Name]
	local v8 = v13[v6.Name]
	if not v7 or v7.ToolType ~= "Jousting" then
		return false, "NoJoustingTool"
	end
	if not v8 or v8.ToolType ~= "Jousting" then
		return false, "TargetNoJoustingTool"
	end
	if t.IsInDuel(p1) then
		return false, "AlreadyDueling"
	end
	if t.IsInDuel(p2) then
		return false, "TargetAlreadyDueling"
	else
		return true
	end
end
local t4 = {
	InitiateDuel = function(p1, p2) --[[ InitiateDuel | Line: 251 | Upvalues: Players (copy), v3 (copy), v8 (copy), v6 (copy), t (copy), t2 (copy), v12 (copy) ]]
		local v1 = Players:FindFirstChild(p2)
		if not v1 then
			return "PlayerNotFound"
		end
		local v2 = v3.getWrapperFromPlayer(p1)
		local v32 = v3.getWrapperFromPlayer(v1)
		if not v8.GetRequestStatusForPlayer(v2, v32, "JoustingRequests") then
			return "CannotRequestDuel"
		end
		if v2.LastJoustTime and v2.LastJoustTime > v6.Get() - 5 then
			return "RecentlyJousted"
		end
		if v32.LastJoustTime and v32.LastJoustTime > v6.Get() - 5 then
			return "RecentlyJousted"
		end
		local v4, v5 = t.CheckJoustRequirements(p1, v1)
		if not v4 then
			return v5
		end
		for k, v in pairs(t2) do
			if k == p1 or (k == v1 or (v.Target == p1 or v.Target == v1)) then
				return "AlreadyRequested"
			end
		end
		t2[p1] = {
			Initiator = p1,
			Target = v1
		}
		v12:FireClient(v1, p1.Name, nil, "RequestDuel")
		return true
	end,
	AcceptDuel = function(p1, p2) --[[ AcceptDuel | Line: 295 | Upvalues: Players (copy), t (copy), t2 (copy), v3 (copy), v11 (copy), t3 (copy), v13 (copy), v12 (copy), RunService (copy), GetEquippedTool (copy), v6 (copy), Sonar (copy), v1 (copy) ]]
		local v14 = Players:FindFirstChild(p2)
		if not v14 then
			return "PlayerNotFound"
		end
		local v2, v32 = t.CheckJoustRequirements(p1, v14)
		local v4 = false
		for k, v in pairs(t2) do
			if k == v14 and v.Target == p1 then
				t2[k] = nil
				v4 = true
				break
			end
		end
		if not v2 then
			return v32
		end
		local v5 = v3.getWrapperFromPlayer(p1)
		local v62 = v3.getWrapperFromPlayer(v14)
		if v4 then
			local t4 = {
				Player1 = p1,
				Player2 = v14,
				Maid = v11.new()
			}
			v14:SetAttribute("Dueling", true)
			p1:SetAttribute("Dueling", true)
			t4.Maid:GiveTask(function() --[[ Line: 331 | Upvalues: t3 (ref), t4 (copy), v14 (copy), p1 (copy) ]]
				table.remove(t3, table.find(t3, t4))
				v14:SetAttribute("Dueling", false)
				p1:SetAttribute("Dueling", false)
			end)
			local function monitorPlayer(p12) --[[ monitorPlayer | Line: 340 | Upvalues: t4 (copy), v13 (ref), v12 (ref), p1 (copy), t (ref) ]]
				if not p12.Character then
					return
				end
				t4.Maid:GiveTask(p12.Character.ChildRemoved:Connect(function(p13) --[[ Line: 342 | Upvalues: v13 (ref), v12 (ref), p12 (copy), p1 (ref), t4 (ref) ]]
					if not p13:IsA("Tool") or (not v13[p13.Name] or v13[p13.Name].ToolType ~= "Jousting") then
						return
					end
					v12:FireClient(p12, p1.Name, nil, "JoustCanceled")
					v12:FireClient(p1, p12.Name, nil, "JoustCanceled")
					t4.Maid:DoCleaning()
				end))
				if not p12.Character:FindFirstChild("Humanoid") then
					return
				end
				t4.Maid:GiveTask(p12.Character.Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 353 | Upvalues: t (ref), p12 (copy), v12 (ref), p1 (ref), t4 (ref) ]]
					if t.GetMountedHorse(p12) then
						return
					end
					v12:FireClient(p12, p1.Name, nil, "JoustCanceled")
					v12:FireClient(p1, p12.Name, nil, "JoustCanceled")
					t4.Maid:DoCleaning()
				end))
			end
			monitorPlayer(p1)
			monitorPlayer(v14)
			local v7 = tick()
			v12:FireClient(p1, p1.Name, v14.Name, "JoustStarted", 0)
			v12:FireClient(v14, v14.Name, p1.Name, "JoustStarted", 0)
			t4.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 376 | Upvalues: p1 (copy), v14 (copy), t (ref), v7 (ref), GetEquippedTool (ref), v5 (copy), v6 (ref), v62 (copy), v12 (ref), v3 (ref), Sonar (ref), v1 (ref), t4 (copy) ]]
				if not (p1.Character and v14.Character) then
					return
				end
				local v13 = t.GetMountedHorse(p1)
				local v2 = t.GetMountedHorse(v14)
				if not (v13 and v2) then
					return
				end
				if not (v13.Parent and v2.Parent) then
					return
				end
				if not ((v13.Hitbox.Position - v2.Hitbox.Position).Magnitude < 10) then
					return
				end
				if tick() - v7 < 1.5 then
					return
				end
				local v32 = GetEquippedTool(p1.Character)
				local v4 = GetEquippedTool(v14.Character)
				if not (v13.Hitbox.AssemblyLinearVelocity.Magnitude >= 5 and (v2.Hitbox.AssemblyLinearVelocity.Magnitude >= 5 and (v32 and v4))) then
					return
				end
				local v52, v63 = t.DetermineJoustWinner(p1, v14, v32.Name, v4.Name)
				v7 = tick()
				if v52 then
					v5.LastJoustTime = v6.Get()
					v62.LastJoustTime = v6.Get()
					v12:FireClient(p1, v52.Name, nil, "JoustWinner", v63)
					v12:FireClient(v14, v52.Name, nil, "JoustWinner", v63)
					local v72 = v3.getWrapperFromPlayer(v52)
					if not v72 then
						return
					end
					local v9 = v3.getWrapperFromPlayer(v52 == p1 and v14 or p1)
					if v9 then
						v5:IncrementMission({
							Type = "CompleteJoust",
							Amount = 1
						})
						v62:IncrementMission({
							Type = "CompleteJoust",
							Amount = 1
						})
						v72:IncrementMission({
							Type = "WinJoust",
							Amount = 1
						})
						Sonar("LeaderboardService"):IncrementScore(v72, "JoustWins", 1)
						Sonar("LeaderboardService"):IncrementScore(v9, "JoustLosses", 1)
						v1.ReportDesignEvent(p1, "MinigameCompleted", {
							{
								Key = "MinigameName",
								Value = "Jousting"
							}
						}, 1)
						v1.ReportDesignEvent(v14, "MinigameCompleted", {
							{
								Key = "MinigameName",
								Value = "Jousting"
							}
						}, 1)
						t4.Maid:DoCleaning()
					end
				else
					v12:FireClient(p1, p1.Name, v14.Name, "JoustMissed")
					v12:FireClient(v14, v14.Name, p1.Name, "JoustMissed")
				end
			end))
			local v8 = t3
			table.insert(v8, t4)
			return true
		else
			return "NoDuelRequest"
		end
	end,
	CancelDuel = function(p1, p2) --[[ CancelDuel | Line: 478 | Upvalues: Players (copy), t2 (copy) ]]
		local v1 = Players:FindFirstChild(p2)
		if not v1 then
			return "PlayerNotFound"
		end
		local v2 = false
		for v3, v4 in t2 do
			if v3 == p1 and v4.Target == v1 or v3 == v1 and v4.Target == p1 then
				t2[v3] = nil
				v2 = true
				break
			end
		end
		if v2 then
			return true
		else
			return "NoDuelRequest"
		end
	end
}
function t.Init(p1) --[[ Init | Line: 505 | Upvalues: RunService (copy), v3 (copy), t2 (copy), t3 (copy), v2 (copy), t4 (copy), v11 (copy), v7 (copy), v4 (copy), Players (copy), ReplicatedStorage (copy), v5 (copy), t (copy), v12 (copy) ]]
	if RunService:IsServer() then
		v3.bindToPlayers(function(p1) --[[ Line: 507 ]] end, function(p1) --[[ Line: 521 | Upvalues: t2 (ref), t3 (ref) ]]
			for v1, v2 in t2 do
				if v1 == p1 or v2.Target == p1 then
					t2[v1] = nil
				end
			end
			for v3, v4 in t3 do
				if v4.Player1 == p1 or v4.Player2 == p1 then
					v4.Maid:DoCleaning()
					return
				end
			end
		end)
		v2.GetRemoteFunction("DuelAction").OnServerInvoke = function(p1, p2, p3) --[[ Line: 537 | Upvalues: t4 (ref) ]]
			if t4[p3] then
				return t4[p3](p1, p2)
			else
				return "InvalidAction"
			end
		end
		v2.GetRemoteFunction("ClaimMedievalSpeciesBonus").OnServerInvoke = function(p1) --[[ Line: 545 ]]
			return false
		end
		v2.GetRemoteFunction("TurninEventTicket").OnServerInvoke = function(p1, p2) --[[ Line: 567 ]]
			return "EventDisabled"
		end
		v2.GetRemoteFunction("CollectEventTicket").OnServerInvoke = function(p1) --[[ Line: 597 ]]
			return "EventDisabled"
		end
	else
		local v1 = v11.new()
		local CurrentCamera = workspace.CurrentCamera
		local v22 = v7.new(Enum.RenderPriority.Camera.Value + 1, "JoustingShaker", function(p1) --[[ Line: 652 | Upvalues: CurrentCamera (copy) ]]
			CurrentCamera.CFrame = CurrentCamera.CFrame * p1
		end)
		v22:Start()
		local t5 = {
			RequestDuel = function(p1) --[[ RequestDuel | Line: 659 | Upvalues: v4 (ref), v2 (ref) ]]
				local v1 = true
				v4.Prompt({
					Type = "RequestDuel",
					Setup = function(p12, p2) --[[ Setup | Line: 663 | Upvalues: p1 (copy), v1 (ref) ]]
						p12.Content.Player.Text = p1 .. " wants to duel you!"
						task.spawn(function() --[[ Line: 666 | Upvalues: v1 (ref), p12 (copy), p1 (ref) ]]
							for i = 20, 0, -1 do
								if not v1 then
									break
								end
								p12.Content.Player.Text = p1 .. " wants to duel you! \n" .. i .. " Seconds to accept"
								task.wait(1)
							end
						end)
					end,
					Run = function() --[[ Run | Line: 675 | Upvalues: v2 (ref), p1 (copy), v1 (ref) ]]
						v2.GetRemoteFunction("DuelAction"):InvokeServer(p1, "AcceptDuel")
						v1 = false
						return true
					end,
					Close = function() --[[ Close | Line: 680 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 683 | Upvalues: v2 (ref), p1 (copy), v1 (ref) ]]
						v2.GetRemoteFunction("DuelAction"):InvokeServer(p1, "CancelDuel")
						v1 = false
						return true
					end
				})
				task.delay(20, function() --[[ Line: 690 | Upvalues: v1 (ref), v2 (ref), p1 (copy), v4 (ref) ]]
					if not v1 then
						return
					end
					v2.GetRemoteFunction("DuelAction"):InvokeServer(p1, "CancelDuel")
					v4.Close()
				end)
			end,
			JoustWinner = function(p1, p2, p3) --[[ JoustWinner | Line: 698 | Upvalues: Players (ref), v1 (copy), v3 (ref), ReplicatedStorage (ref), v22 (copy), v7 (ref), v5 (ref) ]]
				local LocalPlayer = Players.LocalPlayer
				v1:DoCleaning()
				if p1 == LocalPlayer.Name then
					ReplicatedStorage.Storage.SFX.NodeCompleted:Play()
					local Part = Instance.new("Part")
					Part.Parent = workspace
					Part.Size = Vector3.new(1, 1, 1)
					Part.Position = LocalPlayer.Character.PrimaryPart.Position
					Part.Anchored = true
					Part.CanCollide = false
					Part.Transparency = 1
					local v12 = ReplicatedStorage.Storage.Assets.Particles.Confetti:Clone()
					v12.Parent = Part
					v12:Emit(50)
					v1:GiveTask(v12)
					task.delay(2, function() --[[ Line: 749 | Upvalues: v12 (copy), Part (copy) ]]
						v12:Destroy()
						Part:Destroy()
					end)
				else
					local Character = LocalPlayer.Character
					local v2 = v3.getWrapperFromPlayer(LocalPlayer)
					v2:Ragdoll()
					task.wait()
					ReplicatedStorage.Storage.SFX.Error:Play()
					v22:Shake(v7.Presets.BigRotationBump)
					local BodyForce = Character.Head:FindFirstChildOfClass("BodyForce")
					local v32 = BodyForce or Instance.new("BodyForce", Character.Head)
					v32.Force = ((-Character.PrimaryPart.CFrame.LookVector).Unit + Vector3.new(0, 1.5, 0)).Unit * Character.PrimaryPart.AssemblyMass * workspace.Gravity * math.random(3, 6)
					if not BodyForce then
						local v4 = math.random(-1, 1)
						local v52 = math.random(-1, 1)
						local random = math.random
						Character.PrimaryPart:ApplyAngularImpulse(Vector3.new(v4, v52, random(-1, 1)).Unit * math.random(-3, 3))
					end
					task.delay(0.15, function() --[[ Line: 726 | Upvalues: v32 (copy) ]]
						v32:Destroy()
					end)
					task.delay(1.5, function() --[[ Line: 729 | Upvalues: v2 (copy) ]]
						v2:Ragdoll(true)
					end)
				end
				_G.UnlimitedStamina = false
				v5.Notify({
					Preset = "Yellow",
					Message = p1 .. " won the duel!"
				})
			end,
			JoustStarted = function(p1, p2, p3) --[[ JoustStarted | Line: 763 | Upvalues: Players (ref), t (ref), v1 (copy), ReplicatedStorage (ref), v5 (ref) ]]
				local LocalPlayer = Players.LocalPlayer
				local v12 = Players:FindFirstChild(p2)
				if not v12 then
					return
				end
				local v2 = t.GetMountedHorse(v12)
				if v2 then
					local Highlight = Instance.new("Highlight")
					Highlight.Parent = v2
					Highlight.FillTransparency = 1
					Highlight.OutlineColor = Color3.fromRGB(255, 210, 48)
					Highlight.OutlineTransparency = 0
					v1:GiveTask(Highlight)
					_G.UnlimitedStamina = true
					ReplicatedStorage.Storage.SFX.TickChime:Play()
					local JoustOverhead = LocalPlayer.PlayerGui.WorkspaceGui.JoustOverhead
					JoustOverhead.Adornee = v12.Character
					JoustOverhead.TextLabel.Text = p3 .. " Wins"
					JoustOverhead.Enabled = true
					v5.Notify({
						Message = "Duel Started! Run into the opponent to win!",
						Preset = "Yellow"
					})
					v1:GiveTask(function() --[[ Line: 794 | Upvalues: JoustOverhead (copy) ]]
						JoustOverhead.Adornee = nil
						JoustOverhead.Enabled = false
					end)
				end
			end,
			JoustMissed = function(p1, p2) --[[ JoustMissed | Line: 800 | Upvalues: Players (ref), ReplicatedStorage (ref), v22 (copy), v7 (ref), v1 (copy) ]]
				local v12 = Players:FindFirstChild(p1)
				if not v12 then
					return
				end
				local v2 = ReplicatedStorage.Storage.Assets.Particles.Stars:Clone()
				local Part = Instance.new("Part")
				Part.Parent = workspace
				Part.Size = Vector3.new(1, 1, 1)
				Part.Position = v12.Character.PrimaryPart.Position
				Part.Anchored = true
				Part.CanCollide = false
				Part.Transparency = 1
				v2.Parent = Part
				for v3, v4 in v2:GetChildren() do
					if v4:IsA("ParticleEmitter") then
						v4:Emit(v4:GetAttribute("EmitCount"))
					end
				end
				v22:Shake(v7.Presets.BigRotationBump)
				if if math.random(1, 100) >= 90 then true else false then
					ReplicatedStorage.Storage.SFX.MetalPipe:Play()
				else
					ReplicatedStorage.Storage.SFX.JoustHit:Play()
				end
				v1:GiveTask(v2)
				v1:GiveTask(Part)
				task.delay(2, function() --[[ Line: 836 | Upvalues: v2 (copy), Part (copy) ]]
					v2:Destroy()
					Part:Destroy()
				end)
			end,
			JoustCanceled = function() --[[ JoustCanceled | Line: 842 | Upvalues: v1 (copy), v5 (ref) ]]
				v1:DoCleaning()
				_G.UnlimitedStamina = false
				v5.Notify({
					Message = "Duel Canceled.",
					Preset = "Red"
				})
			end
		}
		v12.OnClientEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 854 | Upvalues: t5 (copy) ]]
			if t5[p3] then
				t5[p3](p1, p2, p4)
			end
		end)
	end
end
t:Init()
return t