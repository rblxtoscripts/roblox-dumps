-- https://lua.expert/
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Robux = require(ReplicatedStorage.Configs.Robux)
local Towers = require(ReplicatedStorage.Configs.Towers)
local TowersModule = require(ReplicatedStorage.Modules.Towers.TowersModule)
require(ReplicatedStorage.Configs.Lighting)
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Summon = PlayerGui:WaitForChild("Summon")
local SummonFrame = Summon:WaitForChild("SummonFrame")
local SoulSummonFrame = Summon:WaitForChild("SoulSummonFrame")
local EventSummonFrame = Summon:WaitForChild("EventSummonFrame")
local BuyTokens = SummonFrame:WaitForChild("BuyTokens")
local AnimationFrame = Summon:WaitForChild("AnimationFrame")
local Summoning = workspace:WaitForChild("Lobby"):WaitForChild("Gameplay"):WaitForChild("Summoning")
local Summon_2 = Summoning:WaitForChild("Summon")
local v1 = workspace.EventLobby["Event Summons"]
local Container = PlayerGui:WaitForChild("SideDock"):WaitForChild("Container")
local SummonEndDisplay = Summon:WaitForChild("SummonEndDisplay")
local CurrentCamera = workspace.CurrentCamera
local Size = AnimationFrame.Tower.Size
local Size_2 = SummonFrame:WaitForChild("NotEnoughSpace").Size
local Beam = Summoning:WaitForChild("Light"):WaitForChild("Main"):WaitForChild("Beam")
local t = { v1, Summoning }
local v2 = nil
local v3 = false
local v4 = false
local v5 = false
local v6 = false
local v7 = false
local v8 = nil
ReplicatedStorage.Remotes.Misc.ShinyHunter.Event:Connect(function(p1) --[[ Line: 45 | Upvalues: SummonFrame (copy), SoulSummonFrame (copy) ]]
	if p1 then
		SummonFrame.ShinyHunter.Header.Text = "Shiny Hunter (OWNED)"
	else
		SummonFrame.ShinyHunter.Header.Text = "Shiny Hunter"
	end
	SoulSummonFrame.ShinyHunter.Header.Text = "Shiny Hunter (OWNED)"
end)
AnimationFrame.Click.MouseButton1Click:Connect(function() --[[ Line: 55 | Upvalues: v3 (ref), v4 (ref), v5 (ref) ]]
	if v3 then
		v4 = true
	else
		v5 = true
	end
end)
function waitForClick() --[[ waitForClick | Line: 63 | Upvalues: AnimationFrame (copy), v3 (ref), v6 (ref), v4 (ref) ]]
	AnimationFrame.ClickToContinue.Visible = true
	v3 = true
	if v6 then
		task.delay(0.2, function() --[[ Line: 68 | Upvalues: v4 (ref) ]]
			v4 = true
		end)
	end
	repeat
		wait()
	until v4
	v3 = false
	v4 = false
	AnimationFrame.ClickToContinue.Visible = false
end
function buttonsVisible(p1) --[[ buttonsVisible | Line: 79 | Upvalues: Container (copy) ]]
	for k, v in pairs(Container:GetChildren()) do
		if v:IsA("ImageButton") then
			v.Visible = p1
		end
	end
end
function changeLighting(p1) --[[ changeLighting | Line: 86 ]] end
local v9 = false
function slowChangeExposure(p1) --[[ slowChangeExposure | Line: 116 | Upvalues: Lighting (copy), v9 (ref) ]]
	task.spawn(function() --[[ Line: 117 | Upvalues: Lighting (ref), p1 (copy), v9 (ref) ]]
		local ExposureCompensation = Lighting.ExposureCompensation
		local v1 = (p1 - ExposureCompensation) / 10
		for i = 1, 10 do
			if v9 then
				v9 = false
				return
			end
			Lighting.ExposureCompensation = ExposureCompensation + v1 * i
			task.wait(0.02)
		end
	end)
end
local function setAnimation(p1, p2, p3) --[[ setAnimation | Line: 128 ]]
	local Humanoid = p1:WaitForChild("Humanoid")
	local Animations = p1:WaitForChild("Animations")
	if not (Humanoid and Animations) then
		return
	end
	local v1 = Animations:FindFirstChild(p2)
	if not v1 then
		return
	end
	local v3 = (Humanoid:FindFirstChild("Animator") or Instance.new("Animator")):LoadAnimation(v1)
	v3.Priority = Enum.AnimationPriority[p3]
	if p2 == "Idle" then
		v3.Looped = true
	end
	return v3
end
local function playAnimation(p1, p2, p3) --[[ playAnimation | Line: 147 | Upvalues: setAnimation (copy) ]]
	local v1 = setAnimation(p1, p2, p3)
	if not v1 then
		return
	end
	v1:Play()
end
function changeStageLighting(p1, p2) --[[ changeStageLighting | Line: 155 | Upvalues: v9 (ref), Lighting (copy), Beam (copy), ReplicatedStorage (copy) ]]
	local v1
	if not p2 then
		Lighting.ExposureCompensation = 0
		Beam.Enabled = true
		v1 = ReplicatedStorage.Gradients[p1]
		Beam.Color = v1.Color
		Beam.Parent.Transparency = 0
		Beam.Parent.Color = Color3.fromRGB(v1.Color.Keypoints[1].Value.R * 255, v1.Color.Keypoints[1].Value.G * 255, v1.Color.Keypoints[1].Value.B * 255)
		return
	end
	v9 = true
	Lighting.ExposureCompensation = 0
	Beam.Enabled = true
	v1 = ReplicatedStorage.Gradients[p1]
	Beam.Color = v1.Color
	Beam.Parent.Transparency = 0
	Beam.Parent.Color = Color3.fromRGB(v1.Color.Keypoints[1].Value.R * 255, v1.Color.Keypoints[1].Value.G * 255, v1.Color.Keypoints[1].Value.B * 255)
end
function fastSummon(p1) --[[ fastSummon | Line: 167 | Upvalues: EventSummonFrame (copy), SoulSummonFrame (copy), SummonFrame (copy), SummonEndDisplay (copy), CurrentCamera (copy), v8 (ref), v1 (copy), Summon_2 (copy), t (copy), v7 (ref), TweenService (copy), Towers (copy), ReplicatedStorage (copy), AnimationFrame (copy), v2 (ref) ]]
	local v12 = if EventSummonFrame.Visible then EventSummonFrame elseif SoulSummonFrame.Visible then SoulSummonFrame else SummonFrame
	SummonEndDisplay.Visible = true
	v12.Visible = false
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	local v22 = if v8 == "NewSummer" then v1:FindFirstChild("SummonCamera") elseif v8 == "Soul" then workspace.Lobby.Gameplay.SoulSummons.SummonCamera else Summon_2:FindFirstChild("SummonCamera")
	if not v22 then
		for k, v in pairs(t) do
			if v:FindFirstChild("SummonCamera") then
				v22 = v.SummonCamera
			end
		end
		if not v22 then
			for k, v in pairs(SummonEndDisplay:GetChildren()) do
				if v:IsA("Frame") and v.Name ~= "Example" then
					v:Destroy()
				end
			end
			SummonEndDisplay.Visible = false
			v12.Visible = true
			v7 = false
			return
		end
	end
	local v3 = if v8 == "NewSummer" then v22.CFrame else v22.CFrame
	TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		CFrame = v3
	}):Play()
	changeLighting(true)
	task.wait(0.5)
	local count = 0
	for k, v in pairs(p1) do
		count = count + 1
	end
	if count == 50 then
		local t2 = {}
		for k, v in pairs(p1) do
			if t2[v] then
				t2[v] = {
					Name = v,
					Amount = t2[v].Amount + 1
				}
				continue
			end
			t2[v] = {
				Amount = 1,
				Name = v
			}
		end
		p1 = t2
	end
	local count_2 = 0
	for k, v in pairs(p1) do
		local Amount = v.Amount
		if count == 50 then
			v = v.Name
		end
		count_2 = count_2 + 1
		local v4 = if string.find(v, "Shiny ") then true else false
		local v5 = string.gsub(v, "Shiny ", "")
		local v6 = Towers.Towers[v5]
		if v6 then
			local v72 = SummonEndDisplay.Example:Clone()
			v72.Name = "Active" .. count_2
			v72.TowerName.Text = if v4 then "Shiny " .. v5 else v5
			v72.Tower.Shiny.Visible = v4
			v72.Tower.BorderImage.UIGradient.Color = if v4 then ReplicatedStorage.Gradients.Shiny.Color else ReplicatedStorage.Gradients[v6.Rarity].Color
			v72.Tower.BorderImage.TowerImage.Image = v6.Image
			v72.LayoutOrder = count_2
			v72.Visible = true
			v72.Parent = SummonEndDisplay
			if count == 50 then
				v72.Amount.Visible = true
				v72.Amount.Text = "x" .. Amount
			else
				v72.Amount.Visible = false
			end
			local UIScale = Instance.new("UIScale", v72)
			UIScale.Scale = 0
			TweenService:Create(UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
			task.wait(0.1)
		end
	end
	task.wait(0.8)
	AnimationFrame.Visible = true
	waitForClick()
	AnimationFrame.Visible = false
	for k, v in pairs(SummonEndDisplay:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	if not v2 then
		changeLighting(false)
		SummonEndDisplay.Visible = false
		v12.Visible = true
		v7 = false
		return
	end
	local v10 = TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		CFrame = v2
	})
	v10:Play()
	v10.Completed:Wait()
	CurrentCamera.CameraType = Enum.CameraType.Custom
	changeLighting(false)
	SummonEndDisplay.Visible = false
	v12.Visible = true
	v7 = false
end
function newSummerSummonAnimation(p1) --[[ newSummerSummonAnimation | Line: 281 | Upvalues: AnimationFrame (copy), EventSummonFrame (copy), CurrentCamera (copy), TweenService (copy), v1 (copy), Towers (copy), ReplicatedStorage (copy), v5 (ref), setAnimation (copy), Size (copy), v2 (ref), v7 (ref) ]]
	AnimationFrame.Visible = true
	EventSummonFrame.Visible = false
	changeLighting(true)
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		CFrame = v1.SummonCamera.CFrame
	}):Play()
	task.wait(0.5)
	task.wait(0.5)
	AnimationFrame.Tower.Visible = false
	for k, v in pairs(p1) do
		local v12, v22
		local v3 = string.find(v, "Shiny")
		local v4 = string.gsub(v, "Shiny ", "")
		waitForClick()
		if Towers.Towers[v4] and (Towers.Towers[v4].Rarity and ReplicatedStorage.Gradients:FindFirstChild(Towers.Towers[v4].Rarity)) then
			v12 = Towers.Towers[v4].Rarity
			v22 = v4
		else
			v22 = v4
			v12 = "Common"
		end
		v5 = false
		local v52 = ReplicatedStorage.Objects.Towers:FindFirstChild(v22) or ReplicatedStorage.Objects.Towers.Freddy
		if v52 then
			local v6 = v52:Clone()
			v6.Parent = workspace
			v6.HumanoidRootPart.Anchored = true
			local v72 = setAnimation(v6, "Idle", "Idle")
			if v72 then
				v72:Play()
			end
			local v8 = if v6.Name == "Present Boy" then Vector3.new(0, -4, 0) else Vector3.new(0, 0, 0)
			local _, _2 = v6:GetBoundingBox()
			v6:SetPrimaryPartCFrame(v1.TowerSpot.CFrame + v8)
			TweenService:Create(v6.PrimaryPart, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				CFrame = v6.PrimaryPart.CFrame + Vector3.new(0, 5, 0) + v8
			}):Play()
			v52 = v6
		end
		local sum = 0
		repeat
			sum = sum + 0.05
			task.wait(0.05)
		until v5 or sum >= 1
		v5 = false
		AnimationFrame.Tower.Size = UDim2.new(0, 0, 0, 0)
		AnimationFrame.Tower.Visible = true
		local v9 = Towers.Towers[v22]
		AnimationFrame.Tower.Frame.Tower.Shiny.Visible = v3
		AnimationFrame.Tower.Frame.Tower.BorderImage.UIGradient.Color = if v3 then ReplicatedStorage.Gradients.Shiny.Color else ReplicatedStorage.Gradients[v9.Rarity].Color
		AnimationFrame.Tower.Frame.Tower.BorderImage.TowerImage.Image = v9.Image
		AnimationFrame.Tower.TowerName.Text = if v3 then "Shiny " .. v22 else v22
		AnimationFrame.Tower.Rarity.Text = v12
		AnimationFrame.Tower.Rarity.UIGradient.Color = ReplicatedStorage.Gradients[v12].Color
		TweenService:Create(AnimationFrame.Tower, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = Size
		}):Play()
		local sum_2 = 0
		repeat
			sum_2 = sum_2 + 0.05
			task.wait(0.05)
		until v5 or sum_2 >= 1.2
		if v5 then
			task.wait(0.5)
		end
		v5 = false
		TweenService:Create(AnimationFrame.Tower, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		local sum_3 = 0
		repeat
			sum_3 = sum_3 + 0.05
			task.wait(0.05)
		until v5 or sum_3 >= 0.3
		v5 = false
		v52:Destroy()
	end
	task.wait(0.5)
	if not v2 then
		changeLighting(false)
		AnimationFrame.Visible = false
		EventSummonFrame.Visible = true
		v7 = false
		return
	end
	local v122 = TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		CFrame = v2
	})
	v122:Play()
	v122.Completed:Wait()
	CurrentCamera.CameraType = Enum.CameraType.Custom
	changeLighting(false)
	AnimationFrame.Visible = false
	EventSummonFrame.Visible = true
	v7 = false
end
local function openingAnimation(p1) --[[ openingAnimation | Line: 396 | Upvalues: v7 (ref), ClientState (copy), v8 (ref), AnimationFrame (copy), SummonFrame (copy), Summoning (copy), EventSummonFrame (copy), CurrentCamera (copy), RunService (copy), TweenService (copy), Towers (copy), ReplicatedStorage (copy), v5 (ref), Size (copy), Beam (copy), v2 (ref) ]]
	v7 = true
	local count = 0
	for k, v in pairs(p1) do
		count = count + 1
	end
	if ClientState.GetData().Settings.SkipSummon and count ~= 50 then
		if v8 == "NewSummer" then
			local _, v1 = pcall(function() --[[ Line: 408 | Upvalues: p1 (copy) ]]
				newSummerSummonAnimation(p1)
			end)
			if not v1 then
				return
			end
			warn(v1)
		else
			if v8 == "Soul" then
				fastSummon(p1)
				return
			end
			AnimationFrame.Visible = true
			SummonFrame.Visible = false
			local v22 = Summoning:FindFirstChild("Blender Camera")
			if not (v22 or v22) then
				AnimationFrame.Visible = false
				EventSummonFrame.Visible = true
				v7 = false
				return
			end
			local Claw = Summoning["Gacha Machine Rig"].Claw
			CurrentCamera.CameraType = Enum.CameraType.Scriptable
			local v3 = nil
			local t = {}
			local v4 = false
			local v52 = RunService.RenderStepped:Connect(function() --[[ Line: 443 | Upvalues: v4 (ref), CurrentCamera (ref), v22 (copy), v3 (ref), t (copy), Claw (copy) ]]
				if not v4 then
					CurrentCamera.CFrame = v22.Camera.CFrame
				end
				if not v3 then
					return
				end
				if not t[v3] then
					t[v3] = CFrame.Angles(math.random(0, 1.0471975511965976), math.random(0, 1.0471975511965976), math.random(0, 1.0471975511965976))
				end
				v3:SetPrimaryPartCFrame(Claw.PrimaryPart.CFrame * CFrame.Angles(0, math.pi, 0) * t[v3] + Vector3.new(0, -1.7, 0))
			end)
			AnimationFrame.Tower.Visible = false
			local v6 = nil
			for k, v in pairs(p1) do
				local v72
				delay(3.2, function() --[[ Line: 463 | Upvalues: v6 (ref), v (ref), v4 (ref) ]]
					if v6 ~= v then
						return
					end
					v4 = true
				end)
				Summoning["Blender Camera"].Humanoid.Animator:LoadAnimation(Summoning["Blender Camera"].Animation):Play()
				Summoning["Gacha Machine Rig"].Humanoid.Animator:LoadAnimation(Summoning["Gacha Machine Rig"].Animation):Play()
				v4 = true
				delay(0.1, function() --[[ Line: 474 | Upvalues: TweenService (ref), CurrentCamera (ref), v22 (copy), v4 (ref) ]]
					TweenService:Create(CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						CFrame = v22.Camera.CFrame
					}):Play()
					task.wait(0.1)
					v4 = false
				end)
				local v82 = if string.find(v, "Shiny ") then true else false
				local v9 = string.gsub(v, "Shiny ", "")
				v6 = v9
				v72 = if Towers.Towers[v9] and (Towers.Towers[v9].Rarity and ReplicatedStorage.Gradients:FindFirstChild(Towers.Towers[v9].Rarity)) then Towers.Towers[v9].Rarity else "Common"
				v5 = false
				task.wait(1)
				local v10 = ReplicatedStorage.Objects.Towers:FindFirstChild(v9) or ReplicatedStorage.Objects.Towers.Freddy
				if v10 then
					local v11 = v10:Clone()
					v11.Parent = workspace
					v11:ScaleTo(0.4)
					v11.PrimaryPart.Anchored = true
					local _, _2 = v11:GetBoundingBox()
					v10 = v11
					for k2, v12 in pairs(v11:GetDescendants()) do
						if v12:IsA("BasePart") then
							v12.CanCollide = false
						end
					end
					v3 = v11
					if Towers.Towers[v11.Name] then
						local AnimationOffset = Towers.Towers[v11.Name].AnimationOffset
					end
				end
				task.wait(1.3)
				AnimationFrame.Tower.Size = UDim2.new(0, 0, 0, 0)
				AnimationFrame.Tower.Visible = true
				AnimationFrame.Tower.TowerName.Text = if v82 then "Shiny " .. v9 else v9
				AnimationFrame.Tower.Rarity.Text = v72
				AnimationFrame.Tower.Rarity.UIGradient.Color = ReplicatedStorage.Gradients[v72].Color
				local v13 = Towers.Towers[v9]
				if v13 then
					local Frame = AnimationFrame.Tower.Frame
					Frame.Tower.Shiny.Visible = v82
					Frame.Tower.BorderImage.UIGradient.Color = if v82 then ReplicatedStorage.Gradients.Shiny.Color else ReplicatedStorage.Gradients[v13.Rarity].Color
					Frame.Tower.BorderImage.TowerImage.Image = v13.Image
					Frame.LayoutOrder = k
					Frame.Visible = true
					if v3 then
						TweenService:Create(v3.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							CFrame = v3.PrimaryPart.CFrame - Vector3.new(0, 5, 0)
						}):Play()
						v3 = nil
					end
					task.wait(0.2)
					TweenService:Create(AnimationFrame.Tower, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Size = Size
					}):Play()
					task.wait(0.5)
					waitForClick()
					TweenService:Create(AnimationFrame.Tower, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Size = UDim2.new(0, 0, 0, 0)
					}):Play()
					v10:Destroy()
				end
			end
			task.wait(0.5)
			Beam.Enabled = false
			if v52 then
				v52:Disconnect()
			end
			if not v2 then
				AnimationFrame.Visible = false
				SummonFrame.Visible = true
				v7 = false
				return
			end
			local v15 = TweenService:Create(CurrentCamera, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				CFrame = v2
			})
			v15:Play()
			v15.Completed:Wait()
			CurrentCamera.CameraType = Enum.CameraType.Custom
			AnimationFrame.Visible = false
			SummonFrame.Visible = true
			v7 = false
		end
	else
		fastSummon(p1)
	end
end
local v10 = 0
function notEnoughSpace() --[[ notEnoughSpace | Line: 584 | Upvalues: v10 (ref), EventSummonFrame (copy), SoulSummonFrame (copy), SummonFrame (copy), TweenService (copy), Size_2 (copy) ]]
	local v1 = tick()
	v10 = v1
	local v2 = if EventSummonFrame.Visible then EventSummonFrame elseif SoulSummonFrame.Visible then SoulSummonFrame else SummonFrame
	local v3 = TweenService:Create(v2.NotEnoughSpace, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	})
	local v4 = TweenService:Create(v2.NotEnoughSpace.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 0
	})
	v3:Play()
	v4:Play()
	v2.NotEnoughSpace.Size = UDim2.new(0, 0, 0, 0)
	v2.NotEnoughSpace.TextTransparency = 0
	v2.NotEnoughSpace.UIStroke.Transparency = 0
	v2.NotEnoughSpace.Visible = true
	TweenService:Create(v2.NotEnoughSpace, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size_2
	}):Play()
	task.wait(1)
	if v1 == v1 then
		local v5 = TweenService:Create(v2.NotEnoughSpace, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 1
		})
		local v6 = TweenService:Create(v2.NotEnoughSpace.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Transparency = 1
		})
		v5:Play()
		v6:Play()
		task.wait(0.5)
		v2.NotEnoughSpace.Visible = false
	end
end
local function v11(p1) --[[ openSummon | Line: 617 | Upvalues: ClientState (copy), TowersModule (copy), v8 (ref), v6 (ref), v7 (ref), ReplicatedStorage (copy), openingAnimation (copy), v11 (copy) ]]
	local v1 = ClientState.GetData()
	local v2 = TowersModule.GetStorage(v1)
	local v3 = TowersModule.GetMaxStorage(v1)
	local v5 = v1[if v8 == "NewSummer" then "NewSummer Tokens" else "Tokens"]
	local v62 = if v1.Items.Souls then v1.Items.Souls else 0
	local v72 = if v1.Gamepasses.QuickOpen then true else false
	if p1 == "Auto" then
		p1 = if v8 == "Soul" then if v72 and v62 >= 2000 then 50 elseif v62 >= 400 then 10 else 1 elseif v72 and v5 >= 4500 then 50 elseif v5 >= 900 then 10 else 1
	end
	if not (if v2 + p1 <= v3 then true else false) then
		notEnoughSpace()
		return
	end
	local v9 = if p1 == 1 then 100 elseif p1 == 10 then 900 else 4500
	if v8 == "Soul" then
		v9 = if p1 == 1 then 50 elseif p1 == 10 then 400 else 2000
	end
	if if v8 == "Soul" then v9 <= v62 elseif v9 <= v5 then true else false then
		if v7 then
			return
		end
		local v112 = ReplicatedStorage.Remotes.Summons.Hatch:InvokeServer(p1, v8)
		if v112 then
			openingAnimation(v112)
		end
		task.delay(0.5, function() --[[ Line: 667 | Upvalues: v6 (ref), v11 (ref) ]]
			if not v6 then
				return
			end
			v11("Auto")
		end)
	else
		if not v6 then
			return
		end
		v6 = false
		updateAuto()
	end
end
local function updateSummon(p1) --[[ updateSummon | Line: 674 | Upvalues: ReplicatedStorage (copy), SummonFrame (copy), Towers (copy), SoulSummonFrame (copy) ]]
	if not p1 then
		p1 = ReplicatedStorage.Remotes.Summons.GetCurrentSummon:InvokeServer()
	end
	for v2, v3 in p1 do
		if SummonFrame:FindFirstChild(v2) then
			SummonFrame[v2].BorderImage.TowerImage.Image = Towers.Towers[v3].Image
		end
	end
	for v4, v5 in ReplicatedStorage.Remotes.Summons.GetCurrentSummon.Souls:InvokeServer() do
		local Tower = v5.Tower
		if SoulSummonFrame:FindFirstChild(v4) then
			SoulSummonFrame[v4].BorderImage.TowerImage.Image = Towers.Towers[Tower].Image
		end
	end
end
local t2 = {}
local function close() --[[ close | Line: 689 | Upvalues: SummonFrame (copy), v6 (ref), Players (copy), Summon (copy), LocalPlayer (copy), TweenService (copy), ReplicatedStorage (copy), CurrentCamera (copy), EventSummonFrame (copy), SoulSummonFrame (copy), PlayerGui (copy), t2 (ref) ]]
	SummonFrame.Exit.Tutorial.Value = false
	v6 = false
	for i, v in ipairs(Players:GetPlayers()) do
		if v.Character then
			for k, v2 in pairs(v.Character:GetDescendants()) do
				if (v2:IsA("BasePart") or v2:IsA("Decal")) and (v2.Name ~= "HumanoidRootPart" and v2.Name ~= "Hitbox") then
					v2.Transparency = 0
				end
			end
		end
	end
	Summon.Transition.Visible = true
	if LocalPlayer:FindFirstChild("InSummon") then
		LocalPlayer.InSummon:Destroy()
	end
	TweenService:Create(Summon.Transition, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 0
	}):Play()
	task.wait(0.5)
	TweenService:Create(Summon.Transition, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 1
	}):Play()
	buttonsVisible(true)
	ReplicatedStorage.Remotes.Main.Controls.Bindable:Fire(true)
	CurrentCamera.CameraType = Enum.CameraType.Custom
	CurrentCamera.CameraSubject = LocalPlayer.Character
	SummonFrame.Visible = false
	EventSummonFrame.Visible = false
	SoulSummonFrame.Visible = false
	PlayerGui.SideDock.Container.InventoryButton.Visible = true
	PlayerGui.Placement.Enabled = true
	Summon.Transition.Visible = true
	for k, v in pairs(t2) do
		v.Enabled = true
	end
	t2 = {}
end
local function open(p1) --[[ open | Line: 733 | Upvalues: Summon (copy), PlayerGui (copy), v8 (ref), ReplicatedStorage (copy), LocalPlayer (copy), Players (copy), TweenService (copy), CurrentCamera (copy), v1 (copy), v2 (ref), t2 (ref), Tween (copy), updateSummon (copy), EventSummonFrame (copy), SoulSummonFrame (copy), SummonFrame (copy) ]]
	if not Summon.Enabled then
		return
	end
	if PlayerGui:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	v8 = p1
	ReplicatedStorage.Remotes.Main.Controls.Bindable:Fire(false)
	Instance.new("StringValue", LocalPlayer).Name = "InSummon"
	for i, v in ipairs(Players:GetPlayers()) do
		if v.Character then
			for k, v3 in pairs(v.Character:GetDescendants()) do
				if v3:IsA("BasePart") or v3:IsA("Decal") then
					v3.Transparency = 1
				end
			end
		end
	end
	Summon.Transition.Visible = true
	TweenService:Create(Summon.Transition, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 0
	}):Play()
	task.wait(0.5)
	TweenService:Create(Summon.Transition, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Transparency = 1
	}):Play()
	buttonsVisible(false)
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = if p1 == "NewSummer" then v1:WaitForChild("SummonCamera").CFrame elseif p1 == "Soul" then workspace.Lobby.Gameplay.SoulSummons.SummonCamera.CFrame else workspace.Lobby.Gameplay.Summoning.Summon["Summon Block"].CFrame
	task.wait(0.1)
	v2 = CurrentCamera.CFrame
	for k, v in pairs(PlayerGui:GetChildren()) do
		if v.Name ~= "SideDock" and (v.Name ~= "Summon" and (v.Name ~= "Messages" and v.Enabled)) then
			v.Enabled = false
			t2[v] = v
		end
	end
	Tween:AddButton("Blur", "Off")
	PlayerGui.SideDock.Container.InventoryButton.Visible = false
	PlayerGui.Placement.Enabled = false
	updateSummon((ReplicatedStorage.Remotes.Summons.GetCurrentSummon:InvokeServer()))
	if p1 == "NewSummer" then
		EventSummonFrame.Visible = true
	elseif p1 == "Soul" then
		SoulSummonFrame.Visible = true
	else
		SummonFrame.Visible = true
	end
	Summon.Transition.Visible = false
end
function updatePity() --[[ updatePity | Line: 793 | Upvalues: ClientState (copy), SummonFrame (copy), TweenService (copy), SoulSummonFrame (copy) ]]
	local v1 = ClientState.GetData()
	local v2 = v1.Pity.Normal or 0
	if v2 and v2 > 500 then
		v2 = 500
	end
	SummonFrame.PityBar.Base.TextLabel.Text = if v2 then "Secret Pity " .. v2 .. "/" .. 500 else "Secret Pity: 0/" .. 500
	TweenService:Create(SummonFrame.PityBar.Base.Bar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v2 / 500, 0, 1, 0)
	}):Play()
	local v4 = v1.Pity.Soul or 0
	if v4 and v4 > 250 then
		v4 = 250
	end
	SoulSummonFrame.PityBar.Base.TextLabel.Text = if v4 then "Secret Pity " .. v4 .. "/" .. 250 else "Secret Pity: 0/" .. 250
	TweenService:Create(SoulSummonFrame.PityBar.Base.Bar, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v4 / 250, 0, 1, 0)
	}):Play()
end
function updateAutoDelete() --[[ updateAutoDelete | Line: 813 | Upvalues: ClientState (copy), SummonFrame (copy), SoulSummonFrame (copy), EventSummonFrame (copy) ]]
	local v1 = ClientState.GetData()
	for k, v in pairs(SummonFrame.Rarities:GetChildren()) do
		if v:IsA("ImageButton") then
			v.AutoDelete.Visible = v1.AutoDelete[v.Name] and true or false
		end
	end
	for k, v in pairs(SoulSummonFrame.Rarities:GetChildren()) do
		if v:IsA("ImageButton") then
			v.AutoDelete.Visible = v1.AutoDelete[v.Name] and true or false
		end
	end
	for k, v in pairs(EventSummonFrame.Rarities:GetChildren()) do
		if v:IsA("ImageButton") then
			v.AutoDelete.Visible = v1.AutoDelete[v.Name] and true or false
		end
	end
end
function autoDelete() --[[ autoDelete | Line: 829 | Upvalues: ClientState (copy), SummonFrame (copy), Tween (copy), ReplicatedStorage (copy), SoulSummonFrame (copy), EventSummonFrame (copy) ]]
	ClientState.GetData()
	for k, v in pairs(SummonFrame.Rarities:GetChildren()) do
		if v:IsA("ImageButton") then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 835 | Upvalues: ReplicatedStorage (ref), v (copy) ]]
				ReplicatedStorage.Remotes.Misc.AutoDelete:FireServer(v.Name)
			end)
		end
	end
	for k, v in pairs(SoulSummonFrame.Rarities:GetChildren()) do
		if v:IsA("ImageButton") then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 843 | Upvalues: ReplicatedStorage (ref), v (copy) ]]
				ReplicatedStorage.Remotes.Misc.AutoDelete:FireServer(v.Name)
			end)
		end
	end
	for k, v in pairs(EventSummonFrame.Rarities:GetChildren()) do
		if v:IsA("ImageButton") then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 851 | Upvalues: ReplicatedStorage (ref), v (copy) ]]
				ReplicatedStorage.Remotes.Misc.AutoDelete:FireServer(v.Name)
			end)
		end
	end
end
SummonFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 857 | Upvalues: LocalPlayer (copy), SummonFrame (copy) ]]
	if not LocalPlayer:FindFirstChild("InTutorial") then
		return
	end
	SummonFrame.Open1.Tutorial.Value = true
	SummonFrame.Auto.Visible = false
	SummonFrame.AutoDelete.Visible = false
	SummonFrame.CoinsBG.Visible = false
	SummonFrame.BuyTokens.Visible = false
	SummonFrame.PotionsBG.Visible = false
	SummonFrame.LuckPotion.Visible = false
	SummonFrame.SuperLuckPotion.Visible = false
	SummonFrame.ShinyHunter.Visible = false
	SummonFrame.Open10.Visible = false
	SummonFrame.Open50.Visible = false
end)
SummonFrame.Open1.MouseButton1Click:Connect(function() --[[ Line: 873 | Upvalues: v11 (copy), SummonFrame (copy), LocalPlayer (copy) ]]
	v11(1)
	SummonFrame.Open1.Tutorial.Value = false
	if not LocalPlayer:FindFirstChild("InTutorial") then
		return
	end
	SummonFrame.Exit.Tutorial.Value = true
	LocalPlayer.InTutorial:Destroy()
end)
SummonFrame.Open10.MouseButton1Click:Connect(function() --[[ Line: 881 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 10)
end)
SummonFrame.Open50.MouseButton1Click:Connect(function() --[[ Line: 884 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 50)
end)
EventSummonFrame.Open1.MouseButton1Click:Connect(function() --[[ Line: 887 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 1, "NewSummer")
end)
EventSummonFrame.Open10.MouseButton1Click:Connect(function() --[[ Line: 890 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 10, "NewSummer")
end)
EventSummonFrame.Open50.MouseButton1Click:Connect(function() --[[ Line: 893 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 50, "NewSummer")
end)
SoulSummonFrame.Open1.MouseButton1Click:Connect(function() --[[ Line: 896 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 1, "Soul")
end)
SoulSummonFrame.Open10.MouseButton1Click:Connect(function() --[[ Line: 899 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 10, "Soul")
end)
SoulSummonFrame.Open50.MouseButton1Click:Connect(function() --[[ Line: 902 | Upvalues: v11 (copy) ]]
	task.spawn(v11, 50, "Soul")
end)
function updateAuto() --[[ updateAuto | Line: 906 | Upvalues: v6 (ref), SummonFrame (copy), SoulSummonFrame (copy), EventSummonFrame (copy) ]]
	if v6 then
		SummonFrame.Auto.ImageColor3 = Color3.fromRGB(0, 255, 0)
		SummonFrame.Auto.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		SoulSummonFrame.Auto.ImageColor3 = Color3.fromRGB(0, 255, 0)
		SoulSummonFrame.Auto.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		EventSummonFrame.Auto.ImageColor3 = Color3.fromRGB(0, 255, 0)
		EventSummonFrame.Auto.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
	else
		SummonFrame.Auto.ImageColor3 = Color3.fromRGB(255, 32, 36)
		SummonFrame.Auto.TextLabel.TextColor3 = Color3.fromRGB(255, 32, 36)
		SoulSummonFrame.Auto.ImageColor3 = Color3.fromRGB(255, 32, 36)
		SoulSummonFrame.Auto.TextLabel.TextColor3 = Color3.fromRGB(255, 32, 36)
		EventSummonFrame.Auto.ImageColor3 = Color3.fromRGB(255, 32, 36)
		EventSummonFrame.Auto.TextLabel.TextColor3 = Color3.fromRGB(255, 32, 36)
	end
end
SummonFrame.Auto.MouseButton1Click:Connect(function() --[[ Line: 924 | Upvalues: v6 (ref), UserInputService (copy), LocalPlayer (copy), v11 (copy), SummonFrame (copy) ]]
	if v6 then
		v6 = false
		updateAuto()
		return
	end
	if LocalPlayer:IsInGroup(33298472) or UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and not UserInputService.TouchEnabled) then
		v6 = true
		updateAuto()
		v11("Auto")
	else
		SummonFrame.AutoFrame.Visible = true
	end
end)
SoulSummonFrame.Auto.MouseButton1Click:Connect(function() --[[ Line: 940 | Upvalues: v6 (ref), UserInputService (copy), LocalPlayer (copy), v11 (copy), SoulSummonFrame (copy) ]]
	if v6 then
		v6 = false
		updateAuto()
		return
	end
	if LocalPlayer:IsInGroup(33298472) or UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and not UserInputService.TouchEnabled) then
		v6 = true
		updateAuto()
		v11("Auto")
	else
		SoulSummonFrame.AutoFrame.Visible = true
	end
end)
EventSummonFrame.Auto.MouseButton1Click:Connect(function() --[[ Line: 956 | Upvalues: v6 (ref), UserInputService (copy), LocalPlayer (copy), v11 (copy), EventSummonFrame (copy) ]]
	if v6 then
		v6 = false
		updateAuto()
		return
	end
	if LocalPlayer:IsInGroup(33298472) or UserInputService.GamepadEnabled and (not UserInputService.MouseEnabled and not UserInputService.TouchEnabled) then
		v6 = true
		updateAuto()
		v11("Auto", "NewSummer")
	else
		EventSummonFrame.AutoFrame.Visible = true
	end
end)
SummonFrame.AutoFrame.Okay.MouseButton1Click:Connect(function() --[[ Line: 973 | Upvalues: SummonFrame (copy) ]]
	SummonFrame.AutoFrame.Visible = false
end)
SoulSummonFrame.AutoFrame.Okay.MouseButton1Click:Connect(function() --[[ Line: 976 | Upvalues: SoulSummonFrame (copy) ]]
	SoulSummonFrame.AutoFrame.Visible = false
end)
EventSummonFrame.AutoFrame.Okay.MouseButton1Click:Connect(function() --[[ Line: 979 | Upvalues: EventSummonFrame (copy) ]]
	EventSummonFrame.AutoFrame.Visible = false
end)
SummonFrame.ShinyHunter.Buy.MouseButton1Click:Connect(function() --[[ Line: 983 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ShinyHunter)
end)
pcall(function() --[[ Line: 986 | Upvalues: SummonFrame (copy), Robux (copy) ]]
	SummonFrame.ShinyHunter.Buy.Info.Text = ("R$ %*"):format(game:GetService("MarketplaceService"):GetProductInfo(Robux.Products.ShinyHunter, Enum.InfoType.Product).PriceInRobux)
end)
SummonFrame.ShinyHunter.MouseButton1Click:Connect(function() --[[ Line: 991 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ShinyHunter)
end)
function updateSouls() --[[ updateSouls | Line: 995 | Upvalues: ClientState (copy), SoulSummonFrame (copy) ]]
	local v1 = ClientState.GetData()
	SoulSummonFrame.SoulsAmount.Text = if v1.Items.Souls then v1.Items.Souls else 0
end
SummonFrame.Exit.MouseButton1Click:Connect(close)
SoulSummonFrame.Exit.MouseButton1Click:Connect(close)
EventSummonFrame.Exit.MouseButton1Click:Connect(close)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 1006 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 1008 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if not p1 then
			error(0)
		end
		Towers.Towers = p1
	end) then
		return
	end
	warn("Failed to update Client MetaData.")
end)
SummonEndDisplay.Visible = false
AnimationFrame.Visible = false
Summon:WaitForChild("Transition").Visible = false
autoDelete()
updatePity()
updateAutoDelete()
updateAuto()
updateSouls()
Tween:AddButton(SummonFrame.Open1)
Tween:AddButton(SummonFrame.Open10)
Tween:AddButton(SummonFrame.Open50)
Tween:AddButton(SummonFrame.Auto)
Tween:AddButton(SummonFrame.AutoFrame.Okay)
Tween:AddButton(SoulSummonFrame.Open1)
Tween:AddButton(SoulSummonFrame.Open10)
Tween:AddButton(SoulSummonFrame.Open50)
Tween:AddButton(SoulSummonFrame.Auto)
Tween:AddButton(SoulSummonFrame.AutoFrame.Okay)
Tween:AddButton(EventSummonFrame.Open1)
Tween:AddButton(EventSummonFrame.Open10)
Tween:AddButton(EventSummonFrame.Open50)
Tween:AddButton(EventSummonFrame.Auto)
Tween:AddButton(EventSummonFrame.AutoFrame.Okay)
Tween:AddButton(SummonFrame.LuckPotion)
Tween:AddButton(SummonFrame.SuperLuckPotion)
Tween:AddButton(SoulSummonFrame.LuckPotion)
Tween:AddButton(SoulSummonFrame.SuperLuckPotion)
Tween:AddButton(EventSummonFrame.LuckPotion)
Tween:AddButton(EventSummonFrame.SuperLuckPotion)
Tween:AddButton(SummonFrame.ShinyHunter.Buy)
Tween:AddButton(SummonFrame.ShinyHunter)
ReplicatedStorage.Remotes.Summons.Open.OnClientEvent:Connect(open)
ReplicatedStorage.Remotes.Summons.UpdateSummon.OnClientEvent:Connect(updateSummon)
ReplicatedStorage.Remotes.Summons.UpdateSummon.OnClientEvent:Connect(updatePity)
ReplicatedStorage.Remotes.Misc.AutoDelete.OnClientEvent:Connect(updateAutoDelete)
ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updateSouls)
task.spawn(function() --[[ Line: 1069 | Upvalues: SummonFrame (copy), SoulSummonFrame (copy) ]]
	while task.wait(1) do
		local v1 = os.date("!*t")
		local v2 = 59 - v1.min
		local v3 = 60 - v1.sec
		if v2 < 10 then
			v2 = "0" .. v2
		end
		if v3 < 10 then
			v3 = "0" .. v3
		end
		SummonFrame.Timer.Text = v2 .. ":" .. v3
		SoulSummonFrame.Timer.Text = v2 .. ":" .. v3
	end
end)
for v12, v13 in BuyTokens:GetChildren() do
	if v13:IsA("ImageButton") then
		Tween:AddButton(v13, nil, nil, nil, true)
		v13.MouseButton1Click:Connect(function() --[[ Line: 1093 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy), v13 (copy) ]]
			MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v13.Name])
		end)
	end
end
for v14, v15 in SoulSummonFrame.BuyTokens:GetChildren() do
	if v15:IsA("ImageButton") then
		Tween:AddButton(v15, nil, nil, nil, true)
		v15.MouseButton1Click:Connect(function() --[[ Line: 1101 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy), v15 (copy) ]]
			MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v15.Name])
		end)
	end
end
for v16, v17 in EventSummonFrame.BuyTokens:GetChildren() do
	if v17:IsA("ImageButton") then
		Tween:AddButton(v17, nil, nil, nil, true)
		v17.MouseButton1Click:Connect(function() --[[ Line: 1109 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy), v17 (copy) ]]
			MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v17.Name])
		end)
	end
end
SummonFrame.SuperLuckPotion.MouseButton1Click:Connect(function() --[[ Line: 1114 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.SuperLuckPotion)
end)
pcall(function() --[[ Line: 1117 | Upvalues: SummonFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	SummonFrame.SuperLuckPotion.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.SuperLuckPotion, Enum.InfoType.Product).PriceInRobux)
end)
SummonFrame.LuckPotion.MouseButton1Click:Connect(function() --[[ Line: 1122 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.LuckPotion)
end)
pcall(function() --[[ Line: 1125 | Upvalues: SummonFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	SummonFrame.LuckPotion.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.LuckPotion, Enum.InfoType.Product).PriceInRobux)
end)
SoulSummonFrame.SuperLuckPotion.MouseButton1Click:Connect(function() --[[ Line: 1130 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.SuperLuckPotion)
end)
pcall(function() --[[ Line: 1133 | Upvalues: SoulSummonFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	SoulSummonFrame.SuperLuckPotion.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.SuperLuckPotion, Enum.InfoType.Product).PriceInRobux)
end)
SoulSummonFrame.LuckPotion.MouseButton1Click:Connect(function() --[[ Line: 1138 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.LuckPotion)
end)
pcall(function() --[[ Line: 1141 | Upvalues: SoulSummonFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	SoulSummonFrame.LuckPotion.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.LuckPotion, Enum.InfoType.Product).PriceInRobux)
end)
EventSummonFrame.SuperLuckPotion.MouseButton1Click:Connect(function() --[[ Line: 1146 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.SuperLuckPotion)
end)
pcall(function() --[[ Line: 1149 | Upvalues: EventSummonFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	EventSummonFrame.SuperLuckPotion.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.SuperLuckPotion, Enum.InfoType.Product).PriceInRobux)
end)
EventSummonFrame.LuckPotion.MouseButton1Click:Connect(function() --[[ Line: 1154 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.LuckPotion)
end)
pcall(function() --[[ Line: 1157 | Upvalues: EventSummonFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	EventSummonFrame.LuckPotion.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.LuckPotion, Enum.InfoType.Product).PriceInRobux)
end)