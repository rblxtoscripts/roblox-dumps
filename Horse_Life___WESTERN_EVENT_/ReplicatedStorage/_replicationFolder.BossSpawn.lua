-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SocialService = game:GetService("SocialService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiManager")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("TimeUtils")
local v6 = Sonar("Effects")
local v7 = Sonar("BossFightGui")
local v8 = Sonar("ButtonTest")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("NotificationsClient")
local v11 = Sonar("InputTypeDetector")
local v12 = Sonar("MusicService")
local v13 = Sonar("GuiUtils")
local v14 = Sonar("TutorialService")
local v15 = Sonar("LightingService")
local v16 = Sonar("MessagesClient")
local v17 = Sonar("FormatString")
local v18 = Sonar("Constants")
local BossSpawn = ReplicatedStorage.Storage.Assets.BossSpawn
local t = {}
t.__index = t
local LocalPlayer = game:GetService("Players").LocalPlayer
local v19 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local HUDGui = PlayerGui:WaitForChild("HUDGui")
local TopFrame = PlayerGui:WaitForChild("BossGui").TopFrame
local LuckPower = v19.PlayerData.BossFight.LuckPower
local v20 = v2.new()
local function updateBossStateFrame(p1) --[[ updateBossStateFrame | Line: 47 | Upvalues: v19 (copy), v20 (copy), TopFrame (copy), v5 (copy), v18 (copy), Sonar (copy), v9 (copy), v13 (copy) ]]
	local v1 = nil
	local v2 = p1.Object:GetAttribute("BossSpawned")
	local v3 = p1.Object:GetAttribute("IsGlobalBoss")
	local v4 = v19:IsInAction("BossFight") or v19:IsInAction("GlobalBossFight")
	if (v3 or not v19:IsInAction("GlobalBossFight")) and (v3 or (not _G.FocusedBossZone or (_G.FocusedBossZone == p1 or not _G.FocusedBossZone.Object:GetAttribute("IsGlobalBoss")))) then
		v20:DoCleaning()
		if v4 and v2 then
			v1 = TopFrame.InFightFrame
			if v3 then
				v1.Content.Timer.Visible = false
			else
				local function setTimerLabel() --[[ setTimerLabel | Line: 71 | Upvalues: p1 (copy), v5 (ref), v18 (ref), v1 (ref) ]]
					v1.Content.Timer.TextLabel.Text = "Ends in " .. v5.FormatString(p1.Object:GetAttribute("BossEndTimestamp") and p1.Object:GetAttribute("BossEndTimestamp") - v5.Get() or v18.BossFightDuration)
				end
				v20:GiveTask(p1.Object:GetAttributeChangedSignal("BossEndTimestamp"):Connect(setTimerLabel))
				v20:GiveTask(v5.AttachToTime(setTimerLabel))
				setTimerLabel()
			end
			local function setTierLabel() --[[ setTierLabel | Line: 84 | Upvalues: p1 (copy), v1 (ref), v3 (copy) ]]
				local v12 = p1.Object:GetAttribute("BossTier") or 1
				local v2 = p1.Object:GetAttribute("BossType") or ""
				v1.Content.BossLabels.BossLabel.Text = "TIER " .. v12 .. " " .. (if v2 == "" then "SPIRIT" else v2:upper())
				if not v3 then
					return
				end
				v1.Content.BossLabels.BossLabel.Text = "GLOBAL BOSS"
			end
			v20:GiveTask(p1.Object:GetAttributeChangedSignal("BossTier"):Connect(setTierLabel))
			setTierLabel()
			v20:GiveTask(Sonar("StatBar").new({
				TweenAmount = true,
				Clipped = false,
				Frame = v1.Content.ProgressBar.Fill,
				AmountLabel = v1.Content.Hearts.TextLabel,
				GetText = function(p12, p2) --[[ GetText | Line: 103 | Upvalues: p1 (copy), v3 (copy), v1 (ref), v9 (ref) ]]
					local v12 = p1.Object:GetAttribute("TamingHealth")
					if not v12 then
						return "x" .. p2
					end
					if v3 then
						v1.Content.ProgressBar.Title.Visible = false
						v1.Content.ProgressBar.GlobalBoss.Visible = true
						v1.Content.ProgressBar.GlobalBoss.Text = "HP: " .. v9.splice(v12.Y - v12.X)
					else
						v1.Content.ProgressBar.GlobalBoss.Visible = false
						v1.Content.ProgressBar.Title.Visible = true
					end
					return "x" .. v12.Y - v12.X
				end,
				Get = function() --[[ Get | Line: 122 | Upvalues: p1 (copy) ]]
					local v1 = p1.Object:GetAttribute("TamingHealth")
					if v1 then
						return v1.Y - v1.X
					else
						return 1000
					end
				end,
				GetMax = function() --[[ GetMax | Line: 129 | Upvalues: p1 (copy) ]]
					local v1 = p1.Object:GetAttribute("TamingHealth")
					if v1 then
						return v1.Y
					else
						return 1000
					end
				end,
				Changed = { p1.Object:GetAttributeChangedSignal("TamingHealth") }
			}))
		elseif v3 and not v4 then
			v1 = nil
		elseif v2 and not (v4 or v3) then
			v1 = TopFrame.NotInFightFrame
		elseif not v3 then
			v1 = TopFrame.WaitingForFightFrame
			for k, v in pairs(v1:GetChildren()) do
				local function setTimerLabel() --[[ setTimerLabel | Line: 148 | Upvalues: p1 (copy), v5 (ref), v18 (ref), v (copy) ]]
					v.BossButton.Content.CountdownLabel.Text = v5.FormatString(p1.Object:GetAttribute("BossTimestamp") and p1.Object:GetAttribute("BossTimestamp") - v5.Get() or v18.BossFightWarningDuration)
				end
				v20:GiveTask(p1.Object:GetAttributeChangedSignal("BossTimestamp"):Connect(setTimerLabel))
				v20:GiveTask(v5.AttachToTime(setTimerLabel))
				setTimerLabel()
				local function setParticipatingLabel() --[[ setParticipatingLabel | Line: 158 | Upvalues: v19 (ref), v (copy) ]]
					local v1 = v19:IsInAction("BossFight") or v19:IsInAction("GlobalBossFight")
					v.BossButton.Content.InFightLabel.Visible = v1
					v.BossButton.Content.NotInFightLabel.Visible = not v1
				end
				v20:GiveTask(v19:OnActionChanged("BossFight"):Connect(setParticipatingLabel))
				v20:GiveTask(v19:OnActionChanged("GlobalBossFight"):Connect(setParticipatingLabel))
				local v52 = v19:IsInAction("BossFight") or v19:IsInAction("GlobalBossFight")
				v.BossButton.Content.InFightLabel.Visible = v52
				v.BossButton.Content.NotInFightLabel.Visible = not v52
			end
		end
		for k, v in pairs(TopFrame:GetChildren()) do
			v.Visible = v == v1
		end
		TopFrame.Visible = v13.GetGameState("TopFrame")
	end
end
function t.new(p1) --[[ new | Line: 176 | Upvalues: t (copy), v2 (copy), BossSpawn (copy), v6 (copy), v5 (copy), v19 (copy), v15 (copy), updateBossStateFrame (copy), LuckPower (copy), v18 (copy), SocialService (copy), v4 (copy), LocalPlayer (copy), v14 (copy), v7 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Object = p1
	v22.TotemModel = BossSpawn.TotemModel:Clone()
	v22.TotemModel:PivotTo(p1.WorldCFrame)
	v22.TotemModel.Parent = workspace.Terrain
	v6.emitEffectAt("BossTotemSpawn", workspace.Terrain, v22.TotemModel.PrimaryPart.CFrame)
	v22.TotemBillboardGui = v22.TotemModel.BillboardGui
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("BossTimestamp"):Connect(function() --[[ Line: 190 | Upvalues: v22 (copy) ]]
		v22:SetTimer()
	end))
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("BossEndTimestamp"):Connect(function() --[[ Line: 193 | Upvalues: v22 (copy) ]]
		v22:SetTimer()
	end))
	v22.Maid:GiveTask(v5.AttachToTime(function() --[[ Line: 196 | Upvalues: v22 (copy) ]]
		v22:SetTimer()
	end))
	v22:SetTimer()
	local function updateGlobalBossLighting() --[[ updateGlobalBossLighting | Line: 201 | Upvalues: v22 (copy), v19 (ref), v15 (ref) ]]
		if not v22.Object:GetAttribute("IsGlobalBoss") then
			return
		end
		local v1 = v22.Object:GetAttribute("BossName") or "PumpkinKing"
		if v22.Object:GetAttribute("BossSpawned") and v19:IsInAction("GlobalBossFight") then
			v15.setLightingMode(v1, true)
		else
			v15.setLightingMode(v1, false)
		end
	end
	local function updateBossTypeLighting() --[[ updateBossTypeLighting | Line: 218 | Upvalues: v22 (copy), v19 (ref), v15 (ref) ]]
		local v1 = v22.Object:GetAttribute("BossType")
		if not v1 or v1 == "" then
			v1 = "Spirit"
		end
		local v2 = v1 .. "_Tier" .. (v22.Object:GetAttribute("BossTier") or 1)
		if v22.Object:GetAttribute("BossSpawned") and v19:IsInAction("BossFight") then
			v15.setLightingMode(v2, true)
			v22._activeBossLightingMode = v2
			return
		end
		if not v22._activeBossLightingMode then
			return
		end
		v15.setLightingMode(v22._activeBossLightingMode, false)
		v22._activeBossLightingMode = nil
	end
	v22.Maid:GiveTask(v19:OnActionChanged("GlobalBossFight"):Connect(function() --[[ Line: 238 | Upvalues: updateBossStateFrame (ref), v22 (copy), updateGlobalBossLighting (copy) ]]
		updateBossStateFrame(v22)
		updateGlobalBossLighting()
	end))
	v22.Maid:GiveTask(v19:OnActionChanged("BossFight"):Connect(function() --[[ Line: 242 | Upvalues: updateBossStateFrame (ref), v22 (copy), updateBossTypeLighting (copy) ]]
		updateBossStateFrame(v22)
		updateBossTypeLighting()
	end))
	v22.Maid:GiveTask(LuckPower:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 246 | Upvalues: v22 (copy), updateBossStateFrame (ref) ]]
		v22:SetLuckPower()
		updateBossStateFrame(v22)
	end))
	v22:SetLuckPower()
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("BossTier"):Connect(function() --[[ Line: 252 | Upvalues: v22 (copy) ]]
		v22:SetTier()
	end))
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("BossName"):Connect(function() --[[ Line: 255 | Upvalues: v22 (copy) ]]
		v22:SetTier()
	end))
	v22:SetTier()
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("BossSpawned"):Connect(function() --[[ Line: 260 | Upvalues: v22 (copy), updateBossStateFrame (ref), updateGlobalBossLighting (copy), updateBossTypeLighting (copy) ]]
		v22:BossSpawned()
		updateBossStateFrame(v22)
		updateGlobalBossLighting()
		updateBossTypeLighting()
	end))
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("IsGlobalBoss"):Connect(function() --[[ Line: 266 | Upvalues: updateBossStateFrame (ref), v22 (copy), updateGlobalBossLighting (copy) ]]
		updateBossStateFrame(v22)
		updateGlobalBossLighting()
		v22:SetLuckPower()
		v22:SetTier()
	end))
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("BossTier"):Connect(function() --[[ Line: 272 | Upvalues: updateBossStateFrame (ref), v22 (copy) ]]
		updateBossStateFrame(v22)
	end))
	v22.Maid:GiveTask(p1:GetAttributeChangedSignal("TamingHealth"):Connect(function() --[[ Line: 275 | Upvalues: updateBossStateFrame (ref), v22 (copy) ]]
		updateBossStateFrame(v22)
	end))
	v22.Maid:GiveTask(v18.GameStateChangedSignal:Connect(function() --[[ Line: 278 | Upvalues: updateBossStateFrame (ref), v22 (copy) ]]
		updateBossStateFrame(v22)
	end))
	if p1:GetAttribute("BossSpawned") then
		task.spawn(function() --[[ Line: 283 | Upvalues: v22 (copy) ]]
			v22:BossSpawned(true)
		end)
	end
	updateBossStateFrame(v22)
	updateGlobalBossLighting()
	updateBossTypeLighting()
	local function canSendGameInvite(p1) --[[ canSendGameInvite | Line: 291 | Upvalues: SocialService (ref) ]]
		local v1, v2 = pcall(function() --[[ Line: 292 | Upvalues: SocialService (ref), p1 (copy) ]]
			return SocialService:CanSendGameInviteAsync(p1)
		end)
		return v1 and v2
	end
	v22.Maid:GiveTask(v4.new(v22.TotemModel.InteractPart, {
		ShowHintLabel = true,
		Hint = "Join",
		Run = function() --[[ Run | Line: 301 | Upvalues: v22 (copy), LocalPlayer (ref), SocialService (ref), v14 (ref), v7 (ref) ]]
			if v22.Object:GetAttribute("IsGlobalBoss") then
				local v1 = LocalPlayer
				local v2, v3 = pcall(function() --[[ Line: 292 | Upvalues: SocialService (ref), v1 (copy) ]]
					return SocialService:CanSendGameInviteAsync(v1)
				end)
				if not (v2 and v3) then
					return
				end
				SocialService:PromptGameInvite(LocalPlayer)
			elseif v14.CanDoActionInTutorial("InteractZones") then
				v7.Open(v22)
			end
		end,
		GetRange = function() --[[ GetRange | Line: 320 ]]
			return 36
		end,
		Visibility = function() --[[ Visibility | Line: 323 | Upvalues: p1 (copy) ]]
			return not p1:GetAttribute("BossSpawned")
		end
	}))
	v22.EffectsPart = BossSpawn.EffectsPart:Clone()
	v22.EffectsPart.CFrame = p1.WorldCFrame * CFrame.new(0, -5, 0)
	v22.EffectsPart.Parent = workspace.Terrain
	v22:SetBossColor()
	v22:_initDistanceLoop();
	(function() --[[ connectBossMusic | Line: 337 | Upvalues: v22 (copy), v19 (ref) ]]
		local v1 = if v22.Object:GetAttribute("IsGlobalBoss") then "GlobalBossFight" else "BossFight"
		v22.Maid:GiveTask(v22.Object:GetAttributeChangedSignal("BossSpawned"):Connect(function() --[[ Line: 341 | Upvalues: v22 (ref) ]]
			if not v22.Destroyed then
				v22:_setMusic()
			end
		end))
		v22.Maid:GiveTask(v19:OnActionChanged(v1):Connect(function() --[[ Line: 347 | Upvalues: v22 (ref) ]]
			if not v22.Destroyed then
				v22:_setMusic()
			end
		end))
		v22.Object.Destroying:Once(function() --[[ Line: 353 | Upvalues: v22 (ref) ]]
			v22:_setMusic(true)
		end)
		v22:_setMusic()
	end)()
	return v22
end
function t._setMusic(p1, p2) --[[ _setMusic | Line: 364 | Upvalues: v19 (copy), v12 (copy) ]]
	local v1 = p1.Object:GetAttribute("IsGlobalBoss")
	local v2 = if v1 then p1.Object:GetAttribute("BossName") or "GlobalBossMusic" else "BossMusic"
	local v5 = p1.Object:GetAttribute("BossSpawned")
	if v5 and (v19:IsInAction(if v1 then "GlobalBossFight" else "BossFight") and ((if p1.Object.Parent == nil then false else true) and not p2)) then
		v12.setMusicTrack(v2, true)
	else
		v12.setMusicTrack(v2, false)
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 386 | Upvalues: v15 (copy) ]]
	warn("BossSpawn:Destroy() called for", if p1.Object:GetAttribute("IsGlobalBoss") then "Global Boss" else "Regular Boss")
	p1.Destroyed = true
	p1:Unfocus()
	p1:AnimateOut()
	p1.Maid:Destroy()
	p1:_setMusic(true)
	if p1.Object:GetAttribute("IsGlobalBoss") then
		v15.setLightingMode(p1.Object:GetAttribute("BossName") or "PumpkinKing", false)
	end
	if p1._activeBossLightingMode then
		v15.setLightingMode(p1._activeBossLightingMode, false)
		p1._activeBossLightingMode = nil
	end
	setmetatable(p1, nil)
end
function t.AnimateOut(p1) --[[ AnimateOut | Line: 407 | Upvalues: v6 (copy) ]]
	v6.emitEffectAt("BossTotemSpawn", workspace.Terrain, p1.TotemModel.PrimaryPart.CFrame)
	p1.TotemModel:Destroy()
	for k, v in pairs(p1.EffectsPart:GetDescendants()) do
		v.Enabled = false
	end
	task.wait(5)
	p1.EffectsPart:Destroy()
end
function t.BossSpawned(p1, p2) --[[ BossSpawned | Line: 420 ]] end
v10.AddNotificationCallback("BossFight", function(p1) --[[ Line: 423 | Upvalues: v11 (copy) ]]
	if v11.IsGamepadInputType() then
		return {
			Message = "\240\159\144\142 A Boss has appeared! \240\159\144\142",
			Preset = "Purple"
		}
	end
end)
v10.AddNotificationCallback("BossAnger", function(p1, p2, p3) --[[ Line: 432 | Upvalues: v19 (copy), v16 (copy) ]]
	if not (v19:IsInAction("GlobalBossFight") or v19:IsInAction("BossFight")) then
		return
	end
	if v19:IsInAction("GlobalBossFight") then
		v19:FlingPlayer()
	end
	local v1 = p3 and "Spirit" .. "_Tier" .. p3
	v16:AddNotification({
		Type = "BossAnger",
		DoNotSkip = true,
		Duration = 5,
		Text = p1,
		RunBefore = function(p1) --[[ RunBefore | Line: 452 | Upvalues: v1 (copy) ]]
			if not v1 then
				return
			end
			local v12 = p1.TextLabel:FindFirstChild(v1)
			if not v12 then
				return
			end
			v12.Enabled = true
		end
	})
end)
function t.SetLuckPower(p1) --[[ SetLuckPower | Line: 462 | Upvalues: v9 (copy), LuckPower (copy) ]]
	if not p1.Object.Parent then
		return
	end
	if p1.Object:GetAttribute("IsGlobalBoss") then
		p1.TotemBillboardGui.LuckPowerLabel.Visible = true
		p1.TotemBillboardGui.LuckPowerLabel.Text = "Invite your friends to the global boss fight!"
	else
		p1.TotemBillboardGui.LuckPowerLabel.Visible = true
		p1.TotemBillboardGui.LuckPowerLabel.Text = "Your Luck Power: " .. v9.percentage(LuckPower.Value) .. "%"
	end
end
function t.SetTier(p1) --[[ SetTier | Line: 479 | Upvalues: v17 (copy) ]]
	if not p1.Object.Parent then
		return
	end
	if p1.Object:GetAttribute("IsGlobalBoss") then
		p1.TotemBillboardGui.TierLabel.Text = v17.separateWordsInString(p1.Object:GetAttribute("BossName") or "GLOBAL BOSS")
	else
		local v2 = p1.Object:GetAttribute("BossType") or ""
		p1.TotemBillboardGui.TierLabel.Text = (if v2 == "" then "Spirit" else v2) .. " Tier " .. p1.Object:GetAttribute("BossTier")
	end
	p1:SetBossColor()
end
function t.SetBossColor(p1) --[[ SetBossColor | Line: 496 | Upvalues: ReplicatedStorage (copy), Sonar (copy) ]]
	if not (p1.Object.Parent and p1.TotemModel) then
		return
	end
	local v1 = p1.Object:GetAttribute("IsGlobalBoss")
	local v2 = p1.Object:GetAttribute("BossType") or ""
	local v3 = p1.Object:GetAttribute("BossTier") or 1
	local v4 = nil
	if v1 then
		local v5 = p1.Object:GetAttribute("BossName")
		if v5 then
			local v6 = ReplicatedStorage.Storage.BossPresets:FindFirstChild(v5)
			if v6 then
				v4 = Sonar(v6)
			end
		end
	end
	if not v4 then
		local v7 = ReplicatedStorage.Storage.BossPresets:FindFirstChild(v2 .. "Tier" .. v3)
		if not v7 then
			v7 = ReplicatedStorage.Storage.BossPresets:FindFirstChild("Tier" .. v3)
		end
		if v7 then
			v4 = Sonar(v7)
		end
	end
	if not (v4 and v4.AttackColor) then
		return
	end
	local function applyColor(p1) --[[ applyColor | Line: 533 | Upvalues: v4 (ref) ]]
		if p1:IsA("BasePart") then
			p1.Color = v4.AttackColor
			return
		end
		if p1:IsA("ParticleEmitter") or p1:IsA("Trail") then
			p1.Color = ColorSequence.new(v4.AttackColor)
		else
			if p1:IsA("Beam") then
				p1.Color = ColorSequence.new(v4.AttackColor)
				return
			end
			if p1:IsA("PointLight") or (p1:IsA("SpotLight") or p1:IsA("SurfaceLight")) then
				p1.Color = v4.AttackColor
			else
				if p1:IsA("Fire") then
					p1.Color = v4.AttackColor
					p1.SecondaryColor = v4.AttackColor
					return
				end
				if not (p1:IsA("Decal") or p1:IsA("Texture")) then
					return
				end
				p1.Color3 = v4.AttackColor
			end
		end
	end
	for v9, v10 in p1.TotemModel:GetDescendants() do
		if v10:HasTag("BossColor") then
			applyColor(v10)
		end
	end
	if not p1.EffectsPart then
		return
	end
	for v11, v12 in p1.EffectsPart:GetDescendants() do
		if v12:HasTag("BossColor") then
			applyColor(v12)
		end
	end
end
function t.SetTimer(p1) --[[ SetTimer | Line: 565 | Upvalues: v5 (copy) ]]
	if not p1.Object.Parent then
		return
	end
	if p1.Object:GetAttribute("IsGlobalBoss") then
		p1.TotemBillboardGui.TimerLabel.Visible = false
		return
	end
	if p1.Object:GetAttribute("BossEndTimestamp") then
		p1.TotemBillboardGui.TimerLabel.Text = "Ends in " .. v5.FormatString(p1.Object:GetAttribute("BossEndTimestamp") - v5.Get())
	else
		p1.TotemBillboardGui.TimerLabel.Text = "Starts in " .. v5.FormatString(p1.Object:GetAttribute("BossTimestamp") - v5.Get())
	end
end
function t._initDistanceLoop(p1) --[[ _initDistanceLoop | Line: 586 | Upvalues: v19 (copy) ]]
	task.spawn(function() --[[ Line: 587 | Upvalues: p1 (copy), v19 (ref) ]]
		while p1.Object.Parent do
			task.wait(1)
			local v1 = p1.Object:GetAttribute("IsGlobalBoss")
			local v2 = p1.Object:GetAttribute("BossSpawned")
			local v3 = v19:IsInAction("BossFight") or v19:IsInAction("GlobalBossFight")
			if v1 and (v2 and v3) then
				if not p1.Focused then
					p1:Focus()
				end
				continue
			end
			if v1 and (p1.Focused and not (v2 and v3)) then
				p1:Unfocus()
				continue
			end
			if v1 then
				continue
			end
			if _G.FocusedBossZone and (_G.FocusedBossZone ~= p1 and _G.FocusedBossZone.Object:GetAttribute("IsGlobalBoss")) then
				if p1.Focused then
					p1:Unfocus()
				end
				continue
			end
			local v4 = not p1.Destroyed
			if v4 then
				v4 = v19:IsInRange(p1.Object.WorldPosition, if v3 then 450 else 150)
			end
			if v4 then
				if not p1.Focused then
					p1:Focus()
				end
				continue
			end
			if not p1.Focused then
				continue
			end
			p1:Unfocus()
		end
	end)
end
function t.Focus(p1) --[[ Focus | Line: 636 | Upvalues: v3 (copy), TopFrame (copy), HUDGui (copy) ]]
	p1.Focused = true
	if p1.Object:GetAttribute("IsGlobalBoss") and (_G.FocusedBossZone and _G.FocusedBossZone ~= p1) then
		_G.FocusedBossZone:Unfocus()
	end
	_G.FocusedBossZone = p1
	_G.HideTopHUD = true
	if not v3.IsHUDOpen() then
		return
	end
	v3.UpdateFrame(TopFrame)
	for k, v in pairs(HUDGui.TopFrame:GetChildren()) do
		v3.UpdateFrame(v)
	end
end
function t.Unfocus(p1) --[[ Unfocus | Line: 657 | Upvalues: v3 (copy), TopFrame (copy), HUDGui (copy) ]]
	p1.Focused = false
	_G.FocusedBossZone = false
	_G.HideTopHUD = false
	if not v3.IsHUDOpen() then
		return
	end
	v3.UpdateFrame(TopFrame)
	for k, v in pairs(HUDGui.TopFrame:GetChildren()) do
		v3.UpdateFrame(v)
	end
end
function t.Init() --[[ Init | Line: 672 | Upvalues: v3 (copy), TopFrame (copy), v13 (copy), v8 (copy), v7 (copy), v10 (copy), ReplicatedStorage (copy), v19 (copy), v1 (copy), t (copy) ]]
	v3.AddFrame(TopFrame, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = TopFrame.Position,
		ClosePosition = TopFrame.Position + UDim2.new(0, 0, -0.2, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 679 | Upvalues: v13 (ref) ]]
			if v13.GetGameState("TopFrame") then
				return _G.FocusedBossZone
			end
		end
	})
	for k, v in pairs(TopFrame.WaitingForFightFrame:GetChildren()) do
		v3.AddFrame(v, {
			HUD = true,
			TweenAnimation = true,
			OpenPosition = v.Position,
			ClosePosition = v.Position + UDim2.new(0, 0, -0.2, 0),
			TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
			InputType = v.Name
		})
		local BossButton = v:FindFirstChild("BossButton", true)
		if BossButton then
			v8.new(BossButton.Button, {
				AddHoverButton = true,
				HoverUpLabel = BossButton:FindFirstChild("Icon", true),
				Click = function() --[[ Click | Line: 701 | Upvalues: v7 (ref) ]]
					v7.Open(_G.FocusedBossZone)
				end
			})
			local function setButton(p1) --[[ setButton | Line: 707 | Upvalues: BossButton (copy) ]]
				if not BossButton:GetAttribute("IsActive") then
					game.TweenService:Create(BossButton.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
						Scale = 0
					}):Play()
					return
				end
				local TweenService = game.TweenService
				local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				local t = {}
				t.Scale = if BossButton.Button:FindFirstChild("Color").Menu.Locked.Visible then 0.7 else 1
				TweenService:Create(BossButton.UIScale, v1, t):Play()
			end
			BossButton.Button:FindFirstChild("Color").Menu.Locked:GetPropertyChangedSignal("Visible"):Connect(setButton)
			BossButton:GetAttributeChangedSignal("IsActive"):Connect(setButton)
			setButton(true)
			BossButton:SetAttribute("IsActive", true)
		end
	end
	v10.AddNotificationCallback("LassoLost", function(p1) --[[ Line: 734 | Upvalues: ReplicatedStorage (ref), v19 (ref) ]]
		task.spawn(function() --[[ Line: 735 | Upvalues: ReplicatedStorage (ref), v19 (ref) ]]
			local v1 = ReplicatedStorage.Storage.Assets.Effects.LassoLost:Clone()
			local ItemsGui = v1.ItemsGui
			ItemsGui.Enabled = true
			v1.WorldPosition = v19.PrimaryPart.Position
			v1.Parent = workspace.Terrain
			local v2 = ItemsGui.Default:Clone()
			v2.UIScale.Scale = 0
			v2.Visible = true
			v2.Parent = ItemsGui
			local t = {
				TextLabel = {
					TextTransparency = 1,
					TextStrokeTransparency = 1
				},
				ImageLabel = {
					BackgroundTransparency = 1,
					ImageTransparency = 1
				}
			}
			local t2 = {}
			local tbl = {}
			for k, v in pairs(v2:GetDescendants()) do
				local v3 = t[v.ClassName]
				if v3 then
					t2[v] = {}
					for k2, v4 in pairs(v3) do
						t2[v][k2] = v[k2]
						v[k2] = v4
					end
				end
			end
			tbl[v2] = t2
			for k, v in pairs(tbl) do
				game.TweenService:Create(k.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
					Scale = 1
				}):Play()
				for k2, v3 in pairs(v) do
					game.TweenService:Create(k2, TweenInfo.new(0.15), v3):Play()
				end
			end
			task.wait(0.45)
			local v4 = nil
			for k, v in pairs(tbl) do
				for k2, v3 in pairs(v) do
					local v5 = game.TweenService:Create(k2, TweenInfo.new(0.6), t[k2.ClassName])
					v5:Play()
					v4 = v5
				end
			end
			v4.Completed:Wait()
			v1:Destroy()
		end)
	end)
	v1.new("BossSpawn", t):Init()
end
t.Init()
return t