-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiManager")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("MarketplaceUtils")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("FormatNumber")
local v8 = Sonar("ViewportModel")
local v9 = Sonar("TutorialService")
local v10 = Sonar("Button")
local v11 = Sonar("PlaceTypeService")
local v12 = Sonar("Constants")
local ProductId = Sonar(v6.Get("TutorialHorsePresets"))[3].ProductId
local LocalPlayer = game:GetService("Players").LocalPlayer
local v13 = Sonar("PlayerWrapper").GetClient()
local SelectFrame = LocalPlayer.PlayerGui:WaitForChild("TutorialGui").SelectFrame
local v14 = v1.new()
local PurchasedStartHorse = v13.TutorialData.PurchasedStartHorse
function t.Start(p1) --[[ Start | Line: 39 | Upvalues: SelectFrame (copy), v4 (copy), ProductId (copy), v7 (copy), v11 (copy), PurchasedStartHorse (copy), v9 (copy), v13 (copy), Sonar (copy), v8 (copy), v14 (copy), LocalPlayer (copy), t (copy), v5 (copy), v10 (copy), RunService (copy), v12 (copy), v3 (copy), v2 (copy) ]]
	for k, v in pairs(SelectFrame.SlotsFrame.Content:GetChildren()) do
		if v:IsA("Frame") then
			local v22 = tonumber(v.Name) == 3
			local InnerFrame = v.InnerFrame
			local RobuxLabel = InnerFrame:FindFirstChild("RobuxLabel", true)
			local SelectButton = InnerFrame:FindFirstChild("SelectButton", true)
			if v22 and RobuxLabel then
				task.spawn(function() --[[ Line: 51 | Upvalues: v4 (ref), ProductId (ref), v7 (ref), RobuxLabel (copy), v11 (ref), PurchasedStartHorse (ref) ]]
					local v1 = v4.GetProductInfo(ProductId, Enum.InfoType.Product)
					local v2 = if v1 then v1.PriceInRobux else v1
					local v3 = if v2 then v7.splice(v2) or "N/A" else "N/A"
					local function setPurchaseButton() --[[ setPurchaseButton | Line: 56 | Upvalues: RobuxLabel (ref), v11 (ref), PurchasedStartHorse (ref), v3 (copy) ]]
						RobuxLabel.Text = if v11.IsTestGame() or PurchasedStartHorse.Value then "Play" else "\238\128\130" .. v3 or "Play"
					end
					PurchasedStartHorse:GetPropertyChangedSignal("Value"):Connect(setPurchaseButton)
					local v42 = RobuxLabel
					v42.Text = if v11.IsTestGame() or PurchasedStartHorse.Value then "Play" else "\238\128\130" .. v3 or "Play"
				end)
			end
			for k2, v6 in pairs({ InnerFrame.Content.Viewport, InnerFrame.Content.Viewport:FindFirstChild("Viewport") }) do
				local v52 = v9.GetHorseSlotInfoForSelection(v13, tonumber(v.Name), {
					DoNotIncrementCount = true
				})
				local v62, v72 = Sonar("AnimalRiggerService").CreateAnimalModel({
					ForceAdult = true,
					SlotValue = v52
				})
				v62.Parent = v6
				local Camera = Instance.new("Camera")
				Camera.Parent = v6
				v6.CurrentCamera = Camera
				Camera.FieldOfView = 1
				Camera.CFrame = v8(v62, v6, -130, -8)
				local Eyelid = v62:FindFirstChild("Eyelid")
				if Eyelid then
					Eyelid:Destroy()
				end
				v6.Ambient = Color3.fromRGB(192, 192, 192)
				v6.LightDirection = Camera.CFrame.LookVector
				v14:GiveTask(Sonar("AnimalCosmetics").new(v62, {
					InViewport = true,
					SlotValue = v52
				}))
				v14:GiveTask(v72)
			end
			local function purchaseOrSelectHorse() --[[ purchaseOrSelectHorse | Line: 92 | Upvalues: v22 (copy), PurchasedStartHorse (ref), v11 (ref), v4 (ref), LocalPlayer (ref), ProductId (ref), t (ref), v (copy), v14 (ref) ]]
				if v22 and not (PurchasedStartHorse.Value or v11.IsTestGame()) then
					v4.PromptPurchase(LocalPlayer, ProductId, "Product")
				else
					t.StartSequence("TameHorse", {
						PreviousStage = function() --[[ PreviousStage | Line: 99 | Upvalues: t (ref), v (ref), v14 (ref) ]]
							local v2 = t.SetTutorialStageRemote:InvokeServer("TameHorse", (tonumber(v.Name)))
							v14:DoCleaning()
							return v2
						end
					})
				end
			end
			v5.new(SelectButton, {
				Click = purchaseOrSelectHorse
			})
			v10.new(v.InnerFrame, {
				HoverUpLabel = v.InnerFrame.Content.Viewport,
				Click = purchaseOrSelectHorse
			})
			local OutsideRaysLabel = v:FindFirstChild("OutsideRaysLabel", true)
			if OutsideRaysLabel then
				v14:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 117 | Upvalues: OutsideRaysLabel (copy) ]]
					for k, v in pairs({ OutsideRaysLabel }) do
						v.Rotation = v.Rotation + (if v == OutsideRaysLabel then -0.25 else 0.25)
						if v.Rotation <= 0 then
							v.Rotation = 360
							continue
						end
						if v.Rotation >= 360 then
							v.Rotation = 0
						end
					end
				end))
			end
		end
	end
	if p1.AfterInit then
		p1.AfterInit()
	end
	task.spawn(t.YieldForConditionThenPost, "ViewingSelectionGui", function() --[[ Line: 137 | Upvalues: v12 (ref) ]]
		return v12.IntroFrameFaded
	end)
	v3.SetCoreGui(Enum.CoreGuiType.Chat, false)
	t.YieldForClientLoaded()
	v9.PostTutorialStage("SetupSelectionGui")
	v2.OpenMainFrame(SelectFrame, {
		DisableControls = true
	})
	v13:yieldForCharacter()
	if not v13.Player:GetAttribute("TutorialEnabled") then
		return
	end
	t.TeleportToStart()
end
v2.AddFrame(SelectFrame, {
	IgnoreLayerCollector = true,
	TweenAnimation = false,
	KeepPosition = true
})
return t