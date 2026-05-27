-- https://lua.expert/
local t = {}
t.__index = t
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterPlayer = game:GetService("StarterPlayer")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("Maid")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("State")
local v7 = Sonar("TameUtils")
local v8 = Sonar("WorldspaceGuiUtils")
local v9 = NumberRange.new(0.3333333333333333, 0.5)
local v10 = NumberRange.new(-0.03, 0.03)
local v11 = NumberRange.new(35, 35 + StarterPlayer.CameraMaxZoomDistance)
local v12 = NumberRange.new(0.7, 1)
local CurrentCamera = Workspace.CurrentCamera
local v13 = v4.GetClient()
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local v14 = v5.GetRemoteEvent("LassoSnappedRemote")
local t2 = {}
local Storage = ReplicatedStorage:WaitForChild("Storage")
local TameOverheadGui = Storage.Assets.TameOverheadGui
local SnapSound = Storage.SFX.SnapSound
function t.new(p1) --[[ new | Line: 53 | Upvalues: t (ref), v3 (copy), v2 (copy), TameOverheadGui (copy), PlayerGui (copy), v8 (copy), v6 (copy), v13 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v3.new()
	v22.Hitbox = p1
	v22.Motor = p1.Motor
	v22.HealthRangeColors = {
		green = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 225, 128)),
			ColorSequenceKeypoint.new(0.472, Color3.fromRGB(110, 225, 128)),
			ColorSequenceKeypoint.new(0.474, Color3.fromHex("4ac87a")),
			ColorSequenceKeypoint.new(1, Color3.fromHex("4ac87a"))
		}),
		red = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 94, 115)),
			ColorSequenceKeypoint.new(0.472, Color3.fromRGB(238, 94, 115)),
			ColorSequenceKeypoint.new(0.474, Color3.fromRGB(224, 77, 115)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 77, 115))
		}),
		yellow = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromHex("f2b158")),
			ColorSequenceKeypoint.new(0.472, Color3.fromHex("f2b158")),
			ColorSequenceKeypoint.new(0.474, Color3.fromRGB(231, 138, 74)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(231, 138, 74))
		})
	}
	v22.Species = v22.Hitbox.SlotInfo.Species.Value
	v22.SpeciesData = v2.GetByName(v22.Species)
	v22.Gui = v22.Maid:GiveTask(TameOverheadGui:Clone())
	v22.Gui.Enabled = false
	v22.Gui.Parent = PlayerGui
	v8.AddWorldspaceGui(v22.Gui)
	local BreakChanceNotice = v22.Gui.ContainerFrame.BreakChanceNotice
	local Fill = v22.Gui.ContainerFrame.ProgressBar.Fill
	local InnerFrame = v22.Gui.ContainerFrame.InnerFrame
	local ProgressBar = v22.Gui.ContainerFrame.ProgressBar
	local Overlay = v22.Gui.ContainerFrame.ProgressBar.Overlay
	local Rope = v22.Gui.ContainerFrame.ProgressBar.Rope
	local UIScale = v22.Gui.ContainerFrame.UIScale
	v22.ContainerFrame = v22.Gui.ContainerFrame
	v22.BreakChanceNotice = BreakChanceNotice
	v22.Fill = Fill
	v22.InnerFrame = InnerFrame
	v22.ProgressBar = ProgressBar
	v22.Overlay = Overlay
	v22.Rope = Rope
	v22.UIScale = UIScale
	v22.GuiReference = v22.Maid:GiveTask(Instance.new("ObjectValue"))
	v22.GuiReference.Name = "GuiReference"
	v22.GuiReference.Value = v22.Gui
	v22.GuiReference.Parent = p1
	v22.Attributes = v22.Maid:GiveTask(v6.new(p1:GetAttributes()))
	v22.Contributors = v22.Maid:GiveTask(v6.new({}))
	v22.Health = v22.Maid:GiveTask(v6.new(0))
	v22.State = v22.Maid:GiveTask(v6.new(nil))
	v22.BaseScale = v22.Maid:GiveTask(v6.new(1))
	v22.ScaleModifier = v22.Maid:GiveTask(v6.new(0))
	v22.Scale = v22.Maid:GiveTask(v6.deriveMulti({ v22.BaseScale, v22.ScaleModifier }, function(p1, p2) --[[ Line: 124 ]]
		return p1 + p2
	end))
	v22.BreakChance = v22.Maid:GiveTask(v6.new(0))
	v22.EquippedTool = v22.Maid:GiveTask(v6.new(v13.EquippedTool))
	v22:_setup()
	t2[v22] = p1
	return v22
end
function t._setup(p1) --[[ _setup | Line: 139 | Upvalues: v13 (copy), v14 (copy), SnapSound (copy), v1 (copy), v3 (copy), TweenService (copy), v6 (copy), LocalPlayer (copy), v7 (copy), v10 (copy), v9 (copy), HttpService (copy) ]]
	p1.Maid:GiveTask(v13.EquippedToolChangedSignal:Connect(function(...) --[[ Line: 140 | Upvalues: p1 (copy), v13 (ref) ]]
		p1.EquippedTool:set(v13.EquippedTool)
	end))
	p1.Maid:GiveTask(v14.OnClientEvent:Connect(function(p12) --[[ Line: 144 | Upvalues: p1 (copy), SnapSound (ref), v1 (ref), v3 (ref), TweenService (ref) ]]
		if p12 ~= p1.Hitbox:GetAttribute("ID") then
			return
		end
		SnapSound:Play()
		v1.stop(p1.Overlay)
		p1.Overlay.BackgroundTransparency = 1
		local v12 = v3.new()
		local v2 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local v32 = p1.Maid:GiveTask(TweenService:Create(p1.ProgressBar, v2, {
			Rotation = -12
		}))
		local v4 = p1.Maid:GiveTask(TweenService:Create(p1.ProgressBar, v2, {
			Rotation = 0
		}))
		local v5 = p1.Maid:GiveTask(TweenService:Create(p1.ProgressBar, v2, {
			Rotation = 12
		}))
		local Template = p1.ContainerFrame.Template
		local v6 = v12:GiveTask(Template:Clone())
		v6.Visible = true
		v6.Parent = Template.Parent
		v1.target(v6, 1, 0.8, {
			ImageTransparency = 1,
			Position = UDim2.fromScale(0.5, 3)
		})
		local Template_2 = p1.InnerFrame.Template
		local v7 = v12:GiveTask(Template_2:Clone())
		local UIStroke = v7.UIStroke
		v7.Visible = true
		v7.Parent = Template_2.Parent
		v1.target(v7, 1, 1.6, {
			Position = UDim2.fromScale(0.75, 0.1)
		})
		v1.completed(v7, function() --[[ Line: 177 | Upvalues: v1 (ref), v7 (copy), UIStroke (copy) ]]
			v1.target(v7, 1, 1.6, {
				TextTransparency = 1,
				Position = UDim2.fromScale(0.88, 0.8)
			})
			v1.target(UIStroke, 1, 1.6, {
				Transparency = 1
			})
		end)
		for v8, v9 in {
			[v32] = v5,
			[v5] = v4
		} do
			v12:GiveTask(v8.Completed:Once(function() --[[ Line: 183 | Upvalues: v9 (copy) ]]
				v9:Play()
			end))
		end
		v12:GiveTask(v4.Completed:Once(function() --[[ Line: 188 | Upvalues: v1 (ref), p1 (ref) ]]
			v1.stop(p1.Overlay)
			v1.target(p1.Overlay, 1, 2, {
				BackgroundTransparency = 1
			})
		end))
		v1.target(p1.Overlay, 1, 2, {
			BackgroundTransparency = 0.4
		})
		v32:Play()
		p1.Maid._tweenMaid = v12
	end))
	local Image = p1.BreakChanceNotice.Icon.Image
	p1.Maid:GiveTask(p1.BreakChance:subscribe(function(p12) --[[ Line: 202 | Upvalues: p1 (copy), Image (copy) ]]
		local BreakChanceNotice = p1.BreakChanceNotice.BreakChanceNotice
		BreakChanceNotice.Low.Enabled = p12 == 0
		BreakChanceNotice.High.Enabled = p12 ~= 0
		BreakChanceNotice.Text = ("%*%%"):format((string.format("%d", p12)))
		p1.BreakChanceNotice.Icon.Image = if p12 == 0 then "rbxassetid://130833121127009" else Image
	end))
	p1.Maid:GiveTask(v6.subscribeMulti({ p1.Contributors, p1.EquippedTool }, function(p12, p2) --[[ Line: 211 | Upvalues: LocalPlayer (ref), v7 (ref), p1 (copy) ]]
		local v1 = if p2 then if p2.ToolType == "Lasso" then true else false else p2
		local v2 = if v1 then table.find(p12, LocalPlayer.UserId) and true or false else v1
		local v3
		if v2 then
			local v4 = v7.GetSnapChanceLimit(p1.Species, p2.ToolData.Name) * 100
			p1.BreakChance:set(v4)
			v3 = v4 > 0
		else
			v3 = v2
		end
		p1.BreakChanceNotice.Visible = v3
	end))
	p1.Maid:GiveTask(p1.Scale:subscribe(function(p12) --[[ Line: 230 | Upvalues: v1 (ref), p1 (copy) ]]
		v1.target(p1.UIScale, 1, 3, {
			Scale = p12
		})
	end))
	local v12 = true
	p1.Maid:GiveTask(p1.Health:subscribe(function(p12) --[[ Line: 235 | Upvalues: v12 (ref), p1 (copy), v10 (ref), v9 (ref), v1 (ref) ]]
		local v13 = if v12 then 0 else 1 - p12
		v12 = false
		local green = p1.HealthRangeColors.green
		local v2 = Random.new()
		local v3 = v2:NextNumber(v10.Min, v10.Max)
		p1.Fill.UIGradient.Color = if v9.Max + v3 <= v13 then p1.HealthRangeColors.green elseif v9.Min + v2:NextNumber(v10.Min, v10.Max) <= v13 then p1.HealthRangeColors.yellow else p1.HealthRangeColors.red
		v1.target(p1.Fill, 1, 3, {
			Size = UDim2.new(v13, p1.Fill.Size.X.Offset, p1.Fill.Size.Y.Scale, p1.Fill.Size.Y.Offset)
		})
		v1.targetState(p1.ScaleModifier, 1, 6, 0.25)
		v1.completedState(p1.ScaleModifier, function() --[[ Line: 262 | Upvalues: v1 (ref), p1 (ref) ]]
			v1.targetState(p1.ScaleModifier, 1, 6, 0)
		end)
	end))
	p1.Maid:GiveTask(v6.subscribeMulti({ p1.Contributors, p1.State }, function(p12, p2) --[[ Line: 267 | Upvalues: p1 (copy), v1 (ref), LocalPlayer (ref), v12 (ref) ]]
		local v13 = UDim2.new()
		local v2 = UDim2.new()
		local sum = UDim2.new()
		local v3, sum_2
		sum_2 = v13
		if (p2 == "taming" or p2 == "tamingFleeing") and #p12 >= 1 then
			v3 = v2 + UDim2.fromScale(0.85, 0.85)
		else
			v3 = v2
			if p2 == "curious" then
				sum_2 = sum_2 + UDim2.fromScale(0.85, 0.85)
			elseif p2 == "flee" or p2 == "charge" then
				sum = sum + UDim2.fromScale(0.85, 0.85)
			end
		end
		for v4, v5 in {
			[p1.InnerFrame.CuriousIcon] = sum_2,
			[p1.InnerFrame.LassoIcon] = v3,
			[p1.InnerFrame.StressIcon] = sum
		} do
			v1.target(v4, if v5 == UDim2.new() then 1 else 0.5, 3, {
				Size = v5
			})
		end
		local v7 = table.find(p12, LocalPlayer.UserId) and true or false
		v12 = if v7 == false then true else false
		p1.InnerFrame.Visible = if v7 then v7 else p2 ~= "idle"
		p1.ProgressBar.Visible = v7
	end))
	p1.Maid:GiveTask(p1.Attributes:subscribe(function(p12, p2) --[[ Line: 292 | Upvalues: HttpService (ref), p1 (copy), LocalPlayer (ref) ]]
		local t = { (tonumber(p12.TamingId)) }
		if p12.TamingContributors then
			for v1, v2 in HttpService:JSONDecode(p12.TamingContributors) do
				table.insert(t, (tonumber(v2)))
			end
		end
		p1.Contributors:set(t)
		p1.State:set(p12.State)
		if table.find(t, LocalPlayer.UserId) then
			p2:add(task.spawn(function() --[[ Line: 306 | Upvalues: p12 (copy), p1 (ref) ]]
				while task.wait() do
					local TamingTimerEnd = p12.TamingTimerEnd
					p1.InnerFrame.LassoIcon.UIGradient.Offset = Vector2.yAxis * (0.5 - (workspace:GetServerTimeNow() - TamingTimerEnd) / (p12.TamingTimer - TamingTimerEnd))
				end
			end))
		end
		if not p12.TamingHealth then
			return
		end
		local TamingHealth = p12.TamingHealth
		local Y = TamingHealth.Y
		p1.Health:set((Y - (TamingHealth.Z + TamingHealth.X)) / Y)
	end))
	p1.Maid:GiveTask(p1.Hitbox.AttributeChanged:Connect(function() --[[ Line: 328 | Upvalues: p1 (copy) ]]
		local v1 = p1.Hitbox:GetAttributes()
		local v2 = p1.Attributes:get()
		local v3 = v1
		for v4, v5 in { v1, v2 } do
			local v6 = false
			for v7 in v5 do
				v6 = v3[v7] ~= v2[v7]
				if v6 then
					p1.Maid._onAttributesChanged = task.defer(function() --[[ Line: 343 | Upvalues: p1 (ref) ]]
						p1.Attributes:set(p1.Hitbox:GetAttributes())
					end)
					break
				end
			end
			if v6 then
				break
			end
		end
	end))
end
function t.Step(p1) --[[ Step | Line: 358 | Upvalues: CurrentCamera (copy), LocalPlayer (copy), v11 (copy), v12 (copy) ]]
	local v1 = nil
	local v2 = false
	local Part1 = p1.Motor.Part1
	local v3 = if Part1 then Part1.Parent else nil
	if v3 then
		local v4, v5 = v3:GetBoundingBox()
		local v6, v7 = CurrentCamera:WorldToScreenPoint((v4 * CFrame.new(v5 * Vector3.new(0, 0.5, -0.5))).Position)
		v1 = v6 - Vector3.new(0, 1, 0) * p1.ContainerFrame.AbsoluteSize.Y * 0.5
		local v8 = p1.Contributors:get()
		local v9 = p1.State:get()
		v2 = (if v7 then if v9 == "idle" then table.find(v8, LocalPlayer.UserId) and true or false else true else v7) and (if v1.Z <= 300 then true else false)
	end
	p1.Gui.Enabled = v2
	if v2 then
		local v122 = math.map(math.clamp(v1.Z, v11.Min, v11.Max), v11.Min, v11.Max, v12.Min, v12.Max)
		p1.ContainerFrame.Position = UDim2.fromOffset(v1.X, v1.Y)
		p1.InnerFrame.Size = UDim2.fromScale(1, 75 / p1.ContainerFrame.AbsoluteSize.Y)
		p1.BaseScale:set(v122)
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 402 | Upvalues: t2 (copy) ]]
	t2[p1] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._bind(p1) --[[ _bind | Line: 411 ]] end
function t.Init(p1) --[[ Init | Line: 415 | Upvalues: t (ref), RunService (copy), t2 (copy) ]]
	t._bind()
	RunService.PostSimulation:Connect(function() --[[ Line: 418 | Upvalues: t2 (ref) ]]
		for v1 in t2 do
			v1:Step()
		end
	end)
end
t:Init()
return t