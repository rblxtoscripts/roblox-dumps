-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("Maid")
local v3 = Sonar("IssueResponseClient")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("Binder")
local v6 = Sonar("AnimalRiggerService")
local v7 = Sonar("MutationUtils")
local v8 = Sonar("PlushMachineService")
local v9 = Sonar("Signal")
local v10 = Sonar("PromptClient")
local v11 = Sonar("Constants")
local t2 = {
	Piaffe = true,
	HappyStomp = true,
	HeadShake = true,
	HoofDig = true,
	LegRest = true
}
local v12 = Sonar("PlayerWrapper").GetClient()
local t3 = {}
local v13 = v9.new()
function t.new(p1) --[[ new | Line: 33 | Upvalues: t (copy), v2 (copy), v4 (copy), v8 (copy), v12 (copy), v13 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.LastUpdate = tick()
	v22.SlotMaid = v2.new()
	v22.Maid:GiveTask(v22.SlotMaid)
	v22.Model = p1
	v22.SpawnPart = p1
	v22.SpawnPart:WaitForChild("BillboardGui"):WaitForChild("Frame"):WaitForChild("Coins"):WaitForChild("Price"):WaitForChild("TextLabel").Text = v4.suffix(v8.PurchasePrice)
	v22.DisplaySeed = 1
	v22.Maid:GiveTask(v12.PlayerData.PlushMachine.MachinePurchases:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 48 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v13:Connect(function() --[[ Line: 51 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22:Update()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 60 ]]
	p1.RunDisplayLoop = false
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Update(p1) --[[ Update | Line: 66 | Upvalues: v8 (copy), t3 (ref) ]]
	local v1 = tick()
	p1.LastUpdate = v1
	task.wait()
	if v1 == p1.LastUpdate then
		task.spawn(function() --[[ Line: 72 | Upvalues: p1 (copy), v8 (ref), t3 (ref), v1 (copy) ]]
			local function create() --[[ create | Line: 73 | Upvalues: p1 (ref) ]]
				p1.SlotMaid:DoCleaning()
				p1.SlotMaid:GiveTask(p1:CreateVisualModel())
			end
			if v8.HasSubmittedMaterialsForSeed(t3) then
				while p1.LastUpdate == v1 do
					p1.SlotMaid:DoCleaning()
					p1.SlotMaid:GiveTask(p1:CreateVisualModel())
					task.wait(1)
					if p1.LastUpdate ~= v1 then
						continue
					end
					local v12 = p1
					v12.DisplaySeed = v12.DisplaySeed + 1
					if not (p1.DisplaySeed > v8.MaxDisplaySeed) then
						continue
					end
					p1.DisplaySeed = 1
				end
			else
				p1.SlotMaid:DoCleaning()
				p1.SlotMaid:GiveTask(p1:CreateVisualModel())
			end
		end)
	end
end
function t.CreateVisualModel(p1) --[[ CreateVisualModel | Line: 95 | Upvalues: v8 (copy), v12 (copy), t3 (ref), v6 (copy), v1 (copy), v11 (copy), t2 (copy), v7 (copy) ]]
	local SlotInfo = v8.GetSlotInfo(v12, {
		Age = 100,
		Seed = p1.DisplaySeed,
		SeedOffset = v12.PlayerData.PlushMachine.MachinePurchases.Value,
		Materials = t3
	}):Clone()
	local v13, v2 = v6.CreateAnimalModel({
		ForceAdult = true,
		SlotValue = SlotInfo,
		PlayerWrapper = v12
	})
	v2:GiveTask(v13)
	local v3 = v1.GetByName(SlotInfo.Species.Value)
	SlotInfo.Name = "SlotInfo"
	SlotInfo.Parent = v13
	for v4, v5 in v13:GetDescendants() do
		if v5:IsA("BasePart") then
			v5.Massless = true
			v5.CanCollide = false
			v5.CanTouch = false
			v5.CanQuery = false
			v5.EnableFluidForces = false
			if v5.Name ~= "RootPart" then
				v5.RootPriority = -127
			end
		end
	end
	v13:ScaleTo((v1.GetScale(SlotInfo)))
	local v62 = p1.SpawnPart.CFrame * CFrame.new(0, 0, 0)
	v13:PivotTo(v62 + Vector3.new(0, v13.HumanoidRootPart.Size.Y / 2 - (v13.HumanoidRootPart.Position - v13.PrimaryPart.Position).Y, 0))
	local Eyelid = v13:FindFirstChild("Eyelid")
	if Eyelid then
		Eyelid:Destroy()
	end
	v13.PrimaryPart.CanCollide = false
	v13.PrimaryPart.Anchored = true
	v13.PrimaryPart.BodyVelocity:Destroy()
	v13.PrimaryPart.BodyGyro:Destroy()
	v13:AddTag(v11.AnimalWithCosmeticsTag)
	v13.Parent = p1.Model.Parent
	local v82 = v13:FindFirstChild("AnimationController") or Instance.new("AnimationController", v13)
	local Animation = Instance.new("Animation")
	Animation.AnimationId = v3.Animations.Idle
	local v9 = v82:LoadAnimation(Animation)
	Animation:Destroy()
	local t = {}
	for v10, v112 in v3.Animations do
		if t2[v10] then
			local Animation_2 = Instance.new("Animation")
			Animation_2.AnimationId = v112
			table.insert(t, v82:LoadAnimation(Animation_2))
			Animation_2:Destroy()
		end
	end
	task.spawn(function() --[[ Line: 163 | Upvalues: v13 (copy), t (copy), v9 (copy) ]]
		local v1 = nil
		while v13.Parent do
			if v1 then
				v1:Stop()
			end
			v1 = t[math.random(#t)]
			v1:Play()
			task.wait(v1.Length)
			v9:Play()
			task.wait(math.random(2, 6))
		end
	end)
	task.defer(function() --[[ Line: 177 | Upvalues: v7 (ref), SlotInfo (copy), v13 (copy), v11 (ref) ]]
		local v1, _ = v7.GetMutationOfType(SlotInfo, "Wings")
		if not v1 then
			return
		end
		local v2 = v13:WaitForChild(v1.Name)
		local v3 = v2:FindFirstChild("AnimationController") or Instance.new("AnimationController", v2)
		local Animation = Instance.new("Animation")
		Animation.AnimationId = SlotInfo.UpliftedWings.Value and (v1.Animations.UPLIFTED_WING_IDLE_ANIMATION or v11.UPLIFTED_WING_IDLE_ANIMATION) or v1.Animations.Idle
		local v5 = v3:LoadAnimation(Animation)
		v5.Priority = Enum.AnimationPriority.Action4
		v5:Play()
		Animation:Destroy()
	end)
	return v2
end
function t.Buy() --[[ Buy | Line: 197 | Upvalues: v12 (copy), v10 (copy), Sonar (copy), v4 (copy), v8 (copy), t3 (ref), v3 (copy), v13 (copy) ]]
	if v12:HasUnlockedSpecies("Plush") then
		v10.Prompt({
			Type = "BuyPlushMachine",
			Setup = function(p1) --[[ Setup | Line: 217 | Upvalues: v4 (ref), v8 (ref) ]]
				p1.Content.Price.TextLabel.Text = v4.suffix(v8.PurchasePrice)
			end,
			Run = function() --[[ Run | Line: 220 | Upvalues: v8 (ref), v12 (ref), t3 (ref), v3 (ref), v13 (ref), Sonar (ref) ]]
				local v1 = v8.CanPurchaseSlot(v12, t3)
				if v1 ~= true then
					v3.NotifyIssue(v1)
					return
				end
				local v2 = v8.PurchasePlushMachine(t3)
				if not v2 then
					return true
				end
				t3 = {}
				v13:Fire()
				Sonar("DisplayAnimalClient"):DisplaySlot({
					Type = "Purchased",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = true,
					Slot = v12:GetItemFolder("Animals"):WaitForChild(v2)
				})
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 243 ]]
				return true
			end
		})
	else
		v10.Prompt({
			Type = "LockedJournal",
			Setup = function(p1) --[[ Setup | Line: 201 ]]
				p1.Content.Description.Text = string.format("To tame this species you must complete the %s Quests!", "Plush")
			end,
			Run = function() --[[ Run | Line: 204 | Upvalues: Sonar (ref) ]]
				Sonar("JournalGui").Open("Plush")
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 208 ]]
				return true
			end
		})
	end
end
function t.AddMaterial(p1) --[[ AddMaterial | Line: 249 | Upvalues: v8 (copy), t3 (ref), v13 (copy) ]]
	local v1 = v8.GetMaterialType(p1)
	if v1 then
		t3[v1] = p1
		v13:Fire()
	end
end
function t.RemoveMaterial(p1) --[[ RemoveMaterial | Line: 257 | Upvalues: v8 (copy), t3 (ref), v13 (copy) ]]
	if not v8.GetMaterialType(p1) then
		return
	end
	for k, v in pairs(t3) do
		if v == p1 then
			t3[k] = nil
		end
	end
	v13:Fire()
end
function t.GetSubmittedMaterials() --[[ GetSubmittedMaterials | Line: 269 | Upvalues: t3 (ref) ]]
	return t3
end
function t.Init(p1) --[[ Init | Line: 273 | Upvalues: t (copy), v13 (copy), v5 (copy) ]]
	t.MaterialsChangedSignal = v13
	v5.new("PlushMachineSpawn", t):Init()
end
t:Init()
return t