-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("Effects")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("DynamicNPCService")
local v6 = Sonar("WorldspaceGuiUtils")
local v7 = Sonar("DynamicNPCDialogClient")
local v8 = Sonar("PromptClient")
local v9 = Sonar("ItemDataService")
local v10 = Sonar("TutorialService")
local v11 = Sonar("RemoteUtils")
local v12 = Sonar("GuiManager")
local v13 = Sonar("Constants")
Sonar("ContextualUtils")
local v14 = v5.GetAll()
local t = {}
t.__index = t
local v15 = Sonar("PlayerWrapper").GetClient()
local v16 = tick()
local Models = game.ReplicatedStorage.Storage.DynamicNPCs.Models
local Signs = game.ReplicatedStorage.Storage.DynamicNPCs.Signs
local GiftNotification = game.Players.LocalPlayer.PlayerGui:WaitForChild("GiftNotification")
local MainFrame = GiftNotification.MainFrame
local DynamicNPCNodes = workspace.DynamicNPCNodes
local DynamicNPCs = Instance.new("Folder")
DynamicNPCs.Name = "DynamicNPCs"
DynamicNPCs.Parent = workspace
local v17 = nil
function t.new(p1) --[[ new | Line: 47 | Upvalues: t (copy), v2 (copy), v7 (copy), v14 (copy), Models (copy), v6 (copy), v4 (copy), v10 (copy), v15 (copy), v8 (copy), v9 (copy), Sonar (copy), v11 (copy), v13 (copy), DynamicNPCs (copy), v16 (ref) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Type = p1.Name
	v7.YieldForNoInteraction(v22.Type)
	v22.NPCData = v14[v22.Type]
	v22.Attachment = p1
	v22.Model = Models[v22.Type]:Clone()
	local WorldCFrame = p1.WorldCFrame
	if v22.NPCData.IsToyEvent then
		WorldCFrame = WorldCFrame * CFrame.new(0, -0.6, 0)
	end
	v22.Model:PivotTo(WorldCFrame)
	v22.AnimationController = Instance.new("AnimationController")
	v22.AnimationController.Parent = v22.Model.NPC
	v22.Maid:GiveTask(v22.AnimationController)
	v22.BillboardGui = v22.Model:FindFirstChild("BillboardGui", true)
	local v3 = v22.Model.NPC:FindFirstChild("HumanoidRootPart") or v22.Model.NPC:FindFirstChild("Primary")
	v6.AddWorldspaceGui(v22.BillboardGui)
	if v22.Type ~= "Orion" then
		v22.Maid:GiveTask(v4.new(v3, {
			ShowHintLabel = true,
			Hint = "Talk",
			Run = function() --[[ Run | Line: 108 | Upvalues: v10 (ref), v15 (ref), v22 (copy), v8 (ref), v9 (ref), Sonar (ref), v11 (ref), v13 (ref), v7 (ref), v3 (copy) ]]
				if not v10.CanDoActionInTutorial("InteractZones") then
					return
				end
				if not v15:HasUnlockedSpecies(v22.NPCData.RequiredSpecies) then
					v8.Prompt({
						Type = "LockedJournal",
						Setup = function(p1) --[[ Setup | Line: 116 | Upvalues: v9 (ref), v22 (ref) ]]
							local v1 = v9.GetByName(v22.NPCData.RequiredSpecies)
							p1.Content.Description.Text = string.format("To talk to %s you must complete the %s Quests!", v22.Type, (DisplayUtils.GetDisplayName(v1.Name, v1)))
						end,
						Run = function() --[[ Run | Line: 121 | Upvalues: Sonar (ref) ]]
							Sonar("JournalGui").Open("Horses")
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 125 ]]
							return true
						end
					})
					return
				end
				v11.GetRemoteEvent("NPCInteracted"):FireServer(v22.Type)
				if v22.Type ~= "EventGuide" or not v13.EventName then
					v7.Start({
						Type = v22.Type,
						Character = game.Players.LocalPlayer.Character,
						Target = v3,
						NPC = v22
					})
					return
				end
				local v1 = v15.PlayerData.Events:FindFirstChild(v13.EventName)
				local v2 = if v1 then v1:FindFirstChild("HasInteractedWithGuide") else v1
				if not v2 or v2.Value then
					v7.Start({
						Type = v22.Type,
						Character = game.Players.LocalPlayer.Character,
						Target = v3,
						NPC = v22
					})
					return
				end
				v11.GetRemoteEvent("EventGuideInteractedRemote"):FireServer()
				v7.Start({
					Type = v22.Type,
					Character = game.Players.LocalPlayer.Character,
					Target = v3,
					NPC = v22
				})
			end,
			GetRange = function() --[[ GetRange | Line: 149 | Upvalues: v15 (ref) ]]
				if v15:GetCurrentAnimal() then
					return 20
				else
					return 10
				end
			end
		}))
	end
	for k, v in pairs(v22.Model.NPC:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = if v == v3 then true elseif v.Name == "RootPart" then true else false
			v.CanCollide = false
			v.CanTouch = false
			v.CanQuery = false
		end
	end
	v22.Model.Parent = DynamicNPCs
	v22.Maid:GiveTask(v22.Model)
	if v22.NPCData.Animations.Idle then
		local Animation = Instance.new("Animation")
		Animation.AnimationId = "http://www.roblox.com/Asset?ID=" .. v22.NPCData.Animations.Idle
		local v5 = v22.AnimationController:LoadAnimation(Animation)
		task.delay(math.random(0.1, 0.5), function() --[[ Line: 172 | Upvalues: v5 (copy) ]]
			v5:Play()
		end)
		v22.Maid:GiveTask(Animation)
	end
	if tick() - v16 > 5 then
		v22:AnimateSpawnInAndOut()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 186 ]]
	p1:YieldForNoInteract()
	p1:AnimateSpawnInAndOut()
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.AnimateSpawnInAndOut(p1) --[[ AnimateSpawnInAndOut | Line: 194 | Upvalues: v3 (copy) ]]
	v3.emitEffectAt(p1.Type .. "Spawn", workspace.Terrain, p1.Attachment.WorldCFrame)
end
local function Tween(p1, p2, p3) --[[ Tween | Line: 198 | Upvalues: TweenService (copy) ]]
	local v1 = TweenService:Create(p1, TweenInfo.new(1, Enum.EasingStyle.Quad), p2)
	v1.Completed:Connect(function() --[[ Line: 203 | Upvalues: p3 (copy), p1 (copy) ]]
		task.wait(0.2)
		for k, v in pairs(p3) do
			p1[k] = v
		end
	end)
	v1:Play()
end
function t.AnimateGift(p1, p2) --[[ AnimateGift | Line: 213 | Upvalues: v9 (copy), MainFrame (copy), v17 (ref), v12 (copy), Tween (copy) ]]
	if not p2 then
		return
	end
	local v1 = v9.GetByName(p2.Name)
	local ContainerFrame = MainFrame.ContainerFrame
	v17 = true
	ContainerFrame.Icon.Image = v1.Image
	ContainerFrame.Icon.Viewport.Image = v1.Image
	ContainerFrame.NameLabel.Text = v1.Name
	ContainerFrame.Rarity.Text = v1.Rarity.Name
	ContainerFrame.Amount.Text = p2.Amount
	v12.UpdateFrame(MainFrame)
	task.delay(2, function() --[[ Line: 228 | Upvalues: v17 (ref), ContainerFrame (copy), Tween (ref), v12 (ref), MainFrame (ref) ]]
		v17 = false
		for v1, v2 in ContainerFrame:GetChildren() do
			if not (v2:IsA("UIScale") or v2:IsA("UIAspectRatioConstraint")) then
				if v2:IsA("Frame") then
					Tween(v2, {
						BackgroundTransparency = 1
					}, {
						BackgroundTransparency = v2.BackgroundTransparency
					})
					continue
				end
				if v2:IsA("ImageLabel") then
					Tween(v2, {
						ImageTransparency = 1
					}, {
						ImageTransparency = v2.ImageTransparency
					})
					if v2:FindFirstChild("Viewport") then
						Tween(v2.Viewport, {
							ImageTransparency = 1
						}, {
							ImageTransparency = v2.Viewport.ImageTransparency
						})
					end
					continue
				end
				Tween(v2, {
					TextTransparency = 1
				}, {
					TextTransparency = v2.TextTransparency
				})
				if v2:FindFirstChild("UIStroke") then
					Tween(v2.UIStroke, {
						Transparency = 1
					}, {
						Transparency = v2.UIStroke.Transparency
					})
				end
			end
		end
		task.wait(1)
		v12.UpdateFrame(MainFrame)
	end)
end
function t.AnimateBond(p1) --[[ AnimateBond | Line: 258 ]]
	local v1 = game.ReplicatedStorage.Storage.Assets.Particles.DynamicNPCBond:Clone()
	for k, v in pairs(v1:GetChildren()) do
		v:Emit(5)
		v.Enabled = true
	end
	v1.WorldCFrame = p1.Model.NPC.PrimaryPart.CFrame
	v1.Parent = workspace.Terrain
	task.delay(3, function() --[[ Line: 266 | Upvalues: v1 (copy) ]]
		for k, v in pairs(v1:GetChildren()) do
			v.Enabled = false
		end
		task.wait(5)
		v1:Destroy()
	end)
end
function t.YieldForNoInteract(p1) --[[ YieldForNoInteract | Line: 275 | Upvalues: v7 (copy) ]]
	return v7.YieldForNoInteraction(p1.Type)
end
function t.Init(p1) --[[ Init | Line: 279 | Upvalues: v16 (ref), v1 (copy), t (copy), v14 (copy), Signs (copy), v7 (copy), DynamicNPCNodes (copy), DynamicNPCs (copy), v12 (copy), GiftNotification (copy), v17 (ref) ]]
	v16 = tick()
	v1.new("DynamicNPC", t):Init()
	for k, v in pairs(v14) do
		local v13 = Signs:FindFirstChild(k)
		if v13 then
			local v2 = v13:Clone()
			local function setSignModel() --[[ setSignModel | Line: 288 | Upvalues: v7 (ref), p1 (copy), v2 (ref), DynamicNPCNodes (ref), k (copy), DynamicNPCs (ref) ]]
				v7.YieldForNoInteraction(p1.Type)
				v2.Parent = if DynamicNPCNodes:GetAttribute(k .. "SpawnedAt") == "Map" then DynamicNPCs or nil else nil
			end
			DynamicNPCNodes:GetAttributeChangedSignal(k .. "SpawnedAt"):Connect(setSignModel)
			v7.YieldForNoInteraction(p1.Type)
			v2.Parent = if DynamicNPCNodes:GetAttribute(k .. "SpawnedAt") == "Map" then DynamicNPCs or nil else nil
		end
	end
	v12.AddFrame(GiftNotification.MainFrame, {
		HUD = true,
		TweenAnimation = false,
		OpenPosition = GiftNotification.MainFrame.Position,
		ClosePosition = GiftNotification.MainFrame.Position + UDim2.new(0, 0, 0.5, 0),
		CheckVisibility = function() --[[ CheckVisibility | Line: 302 | Upvalues: v17 (ref) ]]
			return v17
		end
	})
end
t:Init()
return t