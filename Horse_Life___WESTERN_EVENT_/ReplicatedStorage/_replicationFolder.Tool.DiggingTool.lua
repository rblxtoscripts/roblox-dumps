-- https://lua.expert/
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PromptClient")
local v4 = Sonar("PlaceTypeService")
local v5 = Sonar("Constants")
local v6 = Sonar("Maid")
local v7 = Sonar("spr")
local v8 = Sonar("TimeUtils")
local v9 = Sonar("CharacterEffects")
local LocalPlayer = game.Players.LocalPlayer
local v10 = LocalPlayer and Sonar("PlayerWrapper").GetClient()
local SFX = game.ReplicatedStorage.Storage.SFX
local DigBillboard = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("WorkspaceGui"):WaitForChild("DigBillboard")
local v11 = nil
local function getDigRemote() --[[ getDigRemote | Line: 24 | Upvalues: v11 (ref), v5 (copy), v2 (copy) ]]
	if v11 ~= nil then
		return v11
	end
	local v1 = game.ReplicatedStorage:FindFirstChild(v5.RemoteStorageName)
	if v1 and v1:FindFirstChild("DigRemote") then
		v11 = v2.GetRemoteFunction("DigRemote")
		return v11
	else
		return nil
	end
end
local DigDirt = game.ReplicatedStorage.Storage.Assets.Particles.DigDirt
local t = {}
t.__index = t
local t2 = { workspace:FindFirstChild("DiggingPlots") }
function t.new(p1) --[[ new | Line: 43 | Upvalues: t (copy), v6 (copy), RunService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1.Object
	v2.ToolData = p1.ToolData
	v2.Maid = v6.new()
	if RunService:IsServer() then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initServer(p1) --[[ _initServer | Line: 59 ]] end
function t._initClient(p1) --[[ _initClient | Line: 62 | Upvalues: v4 (copy) ]]
	p1.DisabledInCompHub = v4.IsCompHub()
end
function t._startMinigame(p1) --[[ _startMinigame | Line: 66 | Upvalues: v6 (copy), UserInputService (copy), RunService (copy), t2 (copy), v10 (copy), v7 (copy), DigBillboard (copy), SFX (copy) ]]
	local v1 = v6.new()
	p1.Maid.MinigameMaid = v1
	local v2 = game.Players.LocalPlayer:GetMouse()
	local CurrentCamera = workspace.CurrentCamera
	local v3 = 0
	v1:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 74 | Upvalues: p1 (copy) ]]
		if p2 then
			return
		end
		p1.CursorLocation = p12 / workspace.CurrentCamera.ViewportSize
		p1:OnInput()
	end))
	v1:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 81 | Upvalues: v3 (ref), CurrentCamera (copy), v2 (copy), t2 (ref), p1 (copy), v10 (ref), v7 (ref), DigBillboard (ref), v1 (copy), SFX (ref) ]]
		v3 = v3 + p12
		local Position = CurrentCamera.CFrame.Position
		local v22 = RaycastParams.new()
		v22.IncludeInstances = t2
		local v32 = workspace:Raycast(Position, (v2.Hit.Position - Position).Unit * 100, v22)
		if v32 and not p1.Prompting then
			local v4 = v32.Instance
			if v10:IsInAction("CameraMode") then
				if p1.Target then
					v7.target(p1.Target, 0.5, 5, {
						Size = Vector3.new(8, 4, 8)
					})
					p1.Target = nil
					DigBillboard.Adornee = nil
					DigBillboard.Enabled = false
				end
				if not p1.Highlight then
					return
				end
				p1.Highlight:Destroy()
				p1.Highlight = nil
				return
			end
			if v4:HasTag("Diggable") and not v4:GetAttribute("IsBeingDug") then
				if not p1.Highlight then
					p1.Highlight = Instance.new("Highlight")
					p1.Highlight.FillTransparency = 0.7
					p1.Highlight.OutlineTransparency = 0
					p1.Highlight.FillColor = Color3.fromRGB(255, 255, 255)
					p1.Highlight.OutlineColor = Color3.fromRGB(255, 215, 0)
					p1.Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
					v1:GiveTask(p1.Highlight)
				end
				if p1.Target and p1.Target ~= v4 then
					v7.target(p1.Target, 0.5, 5, {
						Size = Vector3.new(8, 4, 8)
					})
					p1.Target = nil
				end
				if p1.Highlight.Parent ~= v4 then
					p1.Highlight.Parent = v4
					v7.target(v4, 0.5, 5, {
						Size = Vector3.new(9, 5, 9)
					})
					DigBillboard.Adornee = v4
					DigBillboard.Enabled = true
					SFX.Pop:Play()
				end
				p1.Target = v4
				local v6 = (math.sin(v3 * 4) + 1) / 2
				p1.Highlight.FillTransparency = v6 * 0.3 + 0.7
				p1.Highlight.OutlineTransparency = v6 * 0.5
				p1.Highlight.OutlineColor = Color3.fromHSV((math.sin(v3 * 2) + 1) / 2 * 0.1 + 0.1, 1, 1)
				local v102 = (math.sin(v3 * 3) + 1) / 2 + 8
				v7.target(v4, 0.25, 10, {
					Size = Vector3.new(v102, v102, v102)
				})
				return
			end
			if p1.Target then
				v7.target(p1.Target, 0.5, 5, {
					Size = Vector3.new(8, 4, 8)
				})
				p1.Target = nil
				DigBillboard.Adornee = nil
				DigBillboard.Enabled = false
			end
			if p1.Highlight then
				p1.Highlight:Destroy()
				p1.Highlight = nil
			end
		elseif v32 or p1.Prompting then
			if not (p1.Target and p1.Prompting) then
				return
			end
			local v122 = (math.sin(v3 * 4) + 1) / 2
			p1.Highlight.FillTransparency = v122 * 0.3 + 0.7
			p1.Highlight.OutlineTransparency = v122 * 0.5
			p1.Highlight.OutlineColor = Color3.fromHSV((math.sin(v3 * 2) + 1) / 2 * 0.1 + 0.1, 1, 1)
			local v16 = (math.sin(v3 * 8) + 1) / 2 + 5
			v7.target(p1.Target, 0.25, 5, {
				Size = Vector3.new(v16, v16, v16)
			})
		else
			if p1.Target then
				v7.target(p1.Target, 0.5, 5, {
					Size = Vector3.new(8, 4, 8)
				})
				p1.Target = nil
				DigBillboard.Adornee = nil
				DigBillboard.Enabled = false
			end
			if p1.Highlight then
				p1.Highlight:Destroy()
				p1.Highlight = nil
			end
		end
	end))
end
function t._endMinigame(p1) --[[ _endMinigame | Line: 200 | Upvalues: v7 (copy), v9 (copy), v3 (copy), DigBillboard (copy) ]]
	if p1.Target then
		v7.target(p1.Target, 0.5, 5, {
			Size = Vector3.new(8, 4, 8)
		})
		p1.Target = nil
	end
	v9.UpdateVisibility(false)
	p1.Prompting = false
	if p1.Highlight then
		p1.Highlight:Destroy()
		p1.Highlight = nil
	end
	v3.Close()
	DigBillboard.Adornee = nil
	DigBillboard.Enabled = false
	p1.Maid.MinigameMaid = nil
end
function t.OnInput(p1, p2) --[[ OnInput | Line: 223 | Upvalues: v10 (copy), v8 (copy), v3 (copy), v11 (ref), v5 (copy), v2 (copy), v1 (copy), Sonar (copy), SFX (copy), v7 (copy), DigDirt (copy), DigBillboard (copy) ]]
	if p1.DisabledInCompHub then
		return
	end
	if v10:IsInAction("CameraMode") then
		return
	end
	if p1.LastDigTime and v8.Get() - p1.LastDigTime < 1 then
		return
	end
	if p2 and (p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.KeyCode ~= Enum.KeyCode.ButtonX) then
		return
	end
	if not p1.Target or p1.Prompting then
		return
	end
	p1.LastDigTime = v8.Get()
	p1.Prompting = true
	v3.Prompt({
		Type = "DigDirt",
		Run = function() --[[ Run | Line: 243 | Upvalues: v11 (ref), v5 (ref), v2 (ref), p1 (copy), v8 (ref), v1 (ref), Sonar (ref), v10 (ref), SFX (ref), v7 (ref), DigDirt (ref), DigBillboard (ref) ]]
			local v12
			if v11 == nil then
				local v22 = game.ReplicatedStorage:FindFirstChild(v5.RemoteStorageName)
				if v22 and v22:FindFirstChild("DigRemote") then
					v11 = v2.GetRemoteFunction("DigRemote")
					v12 = v11
				else
					v12 = nil
				end
			else
				v12 = v11
			end
			if not v12 then
				p1.Prompting = false
				return true
			end
			local v3, v4 = v12:InvokeServer("DigDirt", p1.Target.Parent.Name, p1.Target.Name)
			local Target = p1.Target
			p1.LastDigTime = v8.Get()
			if v3 ~= true then
				v1.Notify({
					Message = "Error digging!",
					Preset = "Red"
				})
				p1.Prompting = false
				return true
			end
			if v4.Slot then
				Sonar("DisplayAnimalClient"):DisplaySlot({
					Type = "Claim",
					AllowNaming = true,
					ShowMaxWarning = false,
					MobileClickBackgroundToClose = false,
					Slot = v10:GetItemFolder("Animals"):WaitForChild(v4.Slot)
				})
			end
			if v4.Message then
				v1.Notify({
					Preset = "Green",
					Message = v4.Message
				})
			end
			if Target then
				Target:SetAttribute("IsBeingDug", true)
			end
			p1.Prompting = false
			SFX.LevelUp2:Play()
			task.wait()
			if Target then
				v7.target(Target, 0.5, 5, {
					Size = Vector3.new(0, 0, 0)
				})
				local v52 = DigDirt:Clone()
				v52.Parent = Target
				for v6, v72 in v52:GetChildren() do
					v72:Emit(v72:GetAttribute("EmitCount"))
				end
				task.delay(2, function() --[[ Line: 307 | Upvalues: v52 (copy) ]]
					v52:Destroy()
				end)
				Target.CanCollide = false
			end
			p1.Target = nil
			if not p1.Highlight then
				DigBillboard.Adornee = nil
				DigBillboard.Enabled = false
				return true
			end
			p1.Highlight:Destroy()
			p1.Highlight = nil
			DigBillboard.Adornee = nil
			DigBillboard.Enabled = false
			return true
		end,
		Cancel = function() --[[ Cancel | Line: 326 | Upvalues: v7 (ref), p1 (copy) ]]
			v7.target(p1.Target, 0.5, 5, {
				Size = Vector3.new(8, 4, 8)
			})
			p1.Prompting = false
			return true
		end
	})
end
function t.Equip(p1) --[[ Equip | Line: 336 | Upvalues: v9 (copy), v4 (copy), v1 (copy) ]]
	p1.Equipped = true
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		return
	end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		return
	end
	if not Humanoid.SeatPart then
		v9.UpdateVisibility({
			ExcludeLocalPlayer = true,
			ExcludeLocalAnimals = true
		})
	end
	if v4.IsMarketWorld() then
		v1.Notify({
			Message = "You cannot duel in the Market Realm!",
			Preset = "Red"
		})
		return
	end
	if not p1.DisabledInCompHub then
		p1.Character = Character
		p1:_startMinigame()
	end
end
function t.Unequip(p1) --[[ Unequip | Line: 370 ]]
	p1:_endMinigame()
end
function t.Destroy(p1) --[[ Destroy | Line: 374 ]]
	p1:_endMinigame()
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t