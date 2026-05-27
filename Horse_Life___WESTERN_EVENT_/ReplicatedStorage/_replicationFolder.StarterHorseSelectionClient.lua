-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("AnimalCosmetics")
local v3 = Sonar("AnimalDataService")
local v4 = Sonar("AnimalRiggerService")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("GuiManager")
local v7 = Sonar("GuiUtils")
local v8 = Sonar("Maid")
local v9 = Sonar("MarketplaceUtils")
local v10 = Sonar("PlayerWrapper")
local v11 = Sonar("RemoteUtils")
local v12 = Sonar("Signal")
local v13 = Sonar("State")
local v14 = Sonar("StorageUtils")
local v15 = Sonar("TutorialService")
local v16 = Sonar("ViewportModel")
local v17 = Sonar(v14.Get("TutorialHorsePresets"))
local t2 = { 15696848933, 16727629658, 16618922530 }
local v18 = v10.GetClient()
local PurchasedStartHorse = v18.TutorialData.PurchasedStartHorse
local NewTutorial = v18.PlayerCohorts.NewTutorial
local v19 = v13.fromProperty(v18.PlayerData.NewTutorialComplete, "Value")
local LocalPlayer = Players.LocalPlayer
local Container = LocalPlayer.PlayerGui:WaitForChild("StarterHorseSelectionGui").Container
local v20 = v11.GetRemoteEvent("StarterHorseRemote")
local v21 = v12.new()
local Cosmetics = ReplicatedStorage:WaitForChild("Storage").Cosmetics
function t.StartFromJoin(p1) --[[ StartFromJoin | Line: 61 | Upvalues: NewTutorial (copy), v19 (copy), v18 (copy), v15 (copy), t2 (copy), v13 (copy), PurchasedStartHorse (copy), Container (copy), v8 (copy), v17 (copy), v4 (copy), v16 (copy), v2 (copy), Cosmetics (copy), v1 (copy), v5 (copy), v9 (copy), LocalPlayer (copy), v3 (copy), v21 (copy), v7 (copy), v6 (copy), v20 (copy) ]]
	if not NewTutorial:get() then
		return
	end
	if v19:get() then
		return
	end
	if v18.PrimaryTutorialStageValue and v15.HasCompletedPrimaryTutorial(v18) then
		return
	end
	if not table.find(t2, game.PlaceId) then
		return
	end
	if #v18:GetItemFolder("Animals"):GetChildren() > 0 then
		return
	end
	local v12 = v13.fromProperty(PurchasedStartHorse, "Value")
	local Template = Container.Horses.Content.Template
	local v22 = v8.new()
	local v32 = nil
	for v42, v52 in v17 do
		local v62 = v15.GetHorseSlotInfoForSelection(v18, v42)
		local v72 = Template:Clone()
		local InnerFrame = v72.InnerFrame
		local SelectButton = InnerFrame.SelectFrame.SelectButton
		local v82 = InnerFrame.Content
		local Viewport = v82.Viewport
		local Camera = Instance.new("Camera")
		local v92, v10 = v4.CreateAnimalModel({
			ForceAdult = true,
			SlotValue = v62
		})
		v92.Parent = Viewport
		Camera.Parent = Viewport
		Viewport.CurrentCamera = Camera
		Camera.FieldOfView = 1
		Camera.CFrame = v16(v92, Viewport, -130, -8)
		local Eyelid = v92:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		Viewport.Ambient = Color3.fromRGB(192, 192, 192)
		Viewport.LightDirection = Camera.CFrame.LookVector
		v22:GiveTask(v10)
		v22:GiveTask(v2.new(v92, {
			InViewport = true,
			SlotValue = v62
		}))
		local ProductId = v52.ProductId
		local v11 = if ProductId then Cosmetics.TutorialHorseButtonProductColor.Value else Cosmetics.TutorialHorseButtonColor.Value
		local v122 = if ProductId then Color3.fromRGB(61, 203, 255) else Color3.fromRGB(152, 142, 94)
		local v132 = if ProductId then Cosmetics.TutorialHorseProductButton else Cosmetics.TutorialHorseButton
		local v14 = if ProductId then Cosmetics.TutorialHorseProduct else Cosmetics.TutorialHorse
		local v152 = nil
		local v162 = nil
		local v172 = (if v152 then v152 else SelectButton.Top:FindFirstChildOfClass("UIGradient")) or v132:Clone()
		local v182 = (if v162 then v162 else v82.SpeciesLabel:FindFirstChildOfClass("UIGradient")) or v14:Clone()
		for v202, v212 in {
			[v132] = v172,
			[v14] = v182
		} do
			for v222, v23 in { "Color", "Offset", "Rotation", "Transparency" } do
				v212[v23] = v202[v23]
			end
		end
		v182.Parent = v82.SpeciesLabel
		v82.BackgroundColor3 = v122
		v82.SpeciesLabel.Text = v52.Species
		SelectButton.Bottom.BackgroundColor3 = v11
		SelectButton.Top.TextLabel.TextColor3 = v11
		local v24 = v13.fromProperty(v72, "GuiState")
		local v25 = v24:derive(function(p1) --[[ Line: 160 ]]
			return p1 == Enum.GuiState.Hover
		end)
		v22:GiveTask(v24)
		v22:GiveTask(v25)
		v22:GiveTask(v25:subscribe(function(p1) --[[ Line: 166 | Upvalues: v1 (ref), Viewport (copy) ]]
			local t = {}
			t.Position = UDim2.fromScale(0.45, if p1 then 0.5 else 0.6)
			v1.target(Viewport, 1, 1.6666666666666667, t)
		end))
		local v26 = false
		for v27, v28 in { InnerFrame, SelectButton } do
			v22:GiveTask(v5.new(v28, {
				Click = function() --[[ Click | Line: 174 | Upvalues: v26 (ref), v32 (ref), ProductId (copy), v9 (ref), LocalPlayer (ref), v42 (copy), v17 (ref), v18 (ref), v3 (ref), v21 (ref) ]]
					if v26 then
						return
					end
					if v32 then
						return
					end
					if ProductId then
						v9.PromptPurchase(LocalPlayer, ProductId, "Product")
						return
					end
					v26 = true
					v32 = v42
					local v1 = v17[v42]
					local v2 = LocalPlayer.UserId * v42
					local t = {
						DoNotIncrementCount = true,
						DoNotParent = true,
						NoMutations = true,
						Starter = true,
						Age = 66,
						Gender = "Male",
						Origin = "Wild",
						Preset = Random.new(v2):NextInteger(1, #v1.Presets),
						Seed = v2,
						Species = v1.Species
					}
					t.MaxCosmetics = v1.MaxCosmetics or {
						MaxPatternsPerSlot = 3,
						MaxPaintsPerSlot = 2,
						MaxCosmeticsPerSlot = 2
					}
					v18.StarterHorseSlotInfo = v3.CreateSlot(v18, t)
					task.delay(0.2, function() --[[ Line: 216 | Upvalues: v21 (ref) ]]
						v21:Fire()
					end)
				end
			}))
		end
		if ProductId then
			local v29 = v22:GiveTask(v13.new(nil))
			v29:subscribe(function(p1) --[[ Line: 227 | Upvalues: SelectButton (copy) ]]
				SelectButton.Top.TextLabel.Text = if p1 then ("%*%*"):format(utf8.char(57346), p1.PriceInRobux) else ""
			end)
			v22:GiveTask(task.spawn(function() --[[ Line: 231 | Upvalues: v29 (copy), v9 (ref), ProductId (copy) ]]
				v29:set(v9.GetProductInfo(ProductId, Enum.InfoType.Product))
			end))
		end
		v72.Name = v42
		v72.Visible = true
		v72.Parent = Template.Parent
	end
	v22:GiveTask(v12)
	v22:GiveTask(v12:subscribe(function(p1) --[[ Line: 242 | Upvalues: v32 (ref), v17 (ref), LocalPlayer (ref), v18 (ref), v3 (ref), v21 (ref) ]]
		if not p1 then
			return
		end
		if v32 then
			return
		end
		v32 = 3
		local v1 = v17[v32]
		local v2 = LocalPlayer.UserId * v32
		local t = {
			DoNotIncrementCount = true,
			DoNotParent = true,
			NoMutations = true,
			Starter = true,
			Age = 66,
			Gender = "Male",
			Origin = "Wild",
			Preset = Random.new(v2):NextInteger(1, #v1.Presets),
			Seed = v2,
			Species = v1.Species
		}
		t.MaxCosmetics = v1.MaxCosmetics or {
			MaxPatternsPerSlot = 3,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 2
		}
		v18.StarterHorseSlotInfo = v3.CreateSlot(v18, t)
		v21:Fire()
	end))
	v7.SetGameElements({
		BottomFrame = false,
		PlayerLeaderboard = false,
		SideFrame = false,
		TopBar = false,
		TopFrame = false
	}, true)
	v6.OpenMainFrame(Container)
	v21:Wait()
	v6.CloseMainFrame(Container)
	v20:FireServer(v32)
	v18.PlayerData.StarterHorseSelected:GetPropertyChangedSignal("Value"):Wait()
	v22:Destroy()
end
function t.Init(p1) --[[ Init | Line: 305 | Upvalues: v6 (copy), Container (copy) ]]
	v6.AddFrame(Container, {
		KeepPosition = true,
		TweenAnimation = false
	})
end
t:Init()
return t