-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = RunService:IsClient()
local v2 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v3 = v2 and Sonar("CollisionUtils")
local v4 = Sonar("Weld")
local v5 = Sonar("Maid")
local v6 = Sonar("RemoteUtils")
local v7 = v1 and Sonar("NotificationsClient")
local v8 = Sonar("SizeUtils")
local v9 = Sonar("AnimalDataService")
local v10 = Sonar("ItemReplicationService")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("MutationUtils")
local v13 = Sonar("DataUtils")
local v14 = Sonar("Constants")
local Part = Instance.new("Part")
Part.Shape = Enum.PartType.Ball
Part.Transparency = 1
Part.Massless = false
Part.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.1, 0, 100, 100)
local v15 = v2 and game.ServerStorage.ObjectModels
local ReplicatedObjectModels = ReplicatedStorage.Storage.Assets.ReplicatedObjectModels
local ReplicatedObjectData = ReplicatedStorage.Storage.Assets.ReplicatedObjectData
local t2 = {}
local t3 = {}
local function v16(p1, p2) --[[ addFolderContentsToTable | Line: 44 | Upvalues: v16 (copy) ]]
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("Folder") then
			p2[v.Name] = {}
			v16(v, p2[v.Name])
			continue
		end
		if v:IsA("ValueBase") then
			p2[v.Name] = v.Value
		end
	end
end
function t.IsAnimalEquipped(p1, p2) --[[ IsAnimalEquipped | Line: 57 ]]
	if not p1.EquippedAnimalsFolder then
		return
	end
	return p1.EquippedAnimalsFolder:FindFirstChild(if type(p2) == "string" and p2 then p2 else p2.Name)
end
function t.CanEquipAnimal(p1, p2) --[[ CanEquipAnimal | Line: 63 | Upvalues: v1 (copy), t (copy) ]]
	if v1 and _G.CanEquipHorses == false then
		return "CannotEquipHorses"
	end
	if t.IsAnimalEquipped(p1, p2) then
		return "AlreadyEquipped"
	end
	if p2.InStorage.Value then
		return "InStorage"
	end
	if p1:GetTotalEquippedAnimals() >= p1:GetMaxEquipSlots() then
		return "MaxEquipped"
	else
		return true
	end
end
function t.EquipAnimal(p1, p2) --[[ EquipAnimal | Line: 83 | Upvalues: v6 (copy) ]]
	return v6.GetRemoteFunction("EquipAnimalRemote"):InvokeServer(p2.Name)
end
function t.UnequipAnimal(p1, p2) --[[ UnequipAnimal | Line: 87 | Upvalues: t (copy), v7 (copy), v6 (copy) ]]
	if not t.HasCompletedPrimaryTutorial(p1) then
		v7.Notify({
			Message = "You can\'t do this during the tutorial!",
			Preset = "Red"
		})
		return
	end
	if t.IsAnimalEquipped(p1, p2) then
		return v6.GetRemoteFunction("UnequipAnimalRemote"):InvokeServer(p2.Name)
	else
		return "NotEquipped"
	end
end
function t.GetAnimalModel(p1) --[[ GetAnimalModel | Line: 104 | Upvalues: t3 (copy), v2 (copy), v10 (copy) ]]
	for k, v in pairs({ "Species" }) do
		local v22 = t3[p1[v].Name] and t3[p1[v].Name](p1) or p1[v].Model
		if v ~= "Set" or p1[v].HasSetModel then
			if v22 then
				return v22:Clone()
			end
			if not v2 then
				return v10.Get(p1[v], "Model"):Clone()
			end
		end
	end
end
function t.CreateAnimalModel(p1) --[[ CreateAnimalModel | Line: 120 | Upvalues: Sonar (copy), v9 (copy), v5 (copy), t (copy), v8 (copy), v2 (copy), CollectionService (copy) ]]
	local v1 = Sonar("AnimalDataService").IsFoal(p1.SlotValue) and (if p1.ForceAdult == true then false else true)
	p1.Species = v1 and not Sonar("AnimalDataService").IsToyHorse(p1.SlotValue) and v9.GetByName("Foal") or (p1.Species or v9.GetByName(p1.SlotValue.Species.Value))
	local v3 = v5.new()
	local v4 = p1.Model or t.GetAnimalModel(p1)
	if not p1.IsFairy then
		local v52 = v9.GetMutationOfType(p1.SlotValue, "Wings")
		if v52 and v52.Model then
			v3:GiveTask(t.CreateWingsModel(v4, v52, v1))
		end
	end
	if not p1.IsFairy then
		local v6 = v8.Sizes[p1.SlotValue.SizeType.Value]
		local v7 = if v6 then v6.SizeMultiplier or 1 else 1
		v4:ScaleTo(v9.GetScale(p1.SlotValue) * v7)
	end
	local Data = v4:WaitForChild("Data")
	if not v2 then
		return v4, v3
	end
	CollectionService:AddTag(Data, "AnimalData")
	return v4, v3
end
function t.color(p1, p2) --[[ color | Line: 152 ]]
	if p1:IsA("BasePart") or (p1:IsA("Light") or (p1:IsA("Fire") or p1:IsA("Smoke"))) then
		p1.Color = p2
	elseif p1:IsA("Beam") or (p1:IsA("ParticleEmitter") or p1:IsA("Trail")) then
		p1.Color = ColorSequence.new(p2) or p2
	elseif p1:IsA("Sparkles") then
		p1.SparkleColor = p1:GetAttribute("CustomizedColor") or p1.SparkleColor
	else
		if not (p1:IsA("Decal") or p1:IsA("Texture")) then
			return
		end
		p1.Color3 = p2
	end
end
function t.CreateWingsModel(p1, p2, p3) --[[ CreateWingsModel | Line: 164 ]]
	local v1 = p2.Model:Clone()
	v1:PivotTo(p1.RootPart.CFrame)
	local Bone = v1.WingL.RootPart:FindFirstChildOfClass("Bone")
	local Bone_2 = v1.WingR.RootPart:FindFirstChildOfClass("Bone")
	local WingL = p1.RootPart:FindFirstChild("WingL", true)
	local WingR = p1.RootPart:FindFirstChild("WingR", true)
	local RigidConstraint = Instance.new("RigidConstraint")
	local v2 = RigidConstraint:Clone()
	RigidConstraint.Attachment0 = WingL
	RigidConstraint.Attachment1 = Bone
	v2.Attachment0 = WingR
	v2.Attachment1 = Bone_2
	RigidConstraint.Parent = Bone
	v2.Parent = Bone_2
	v1.Parent = p1
	Instance.new("Animator", Instance.new("AnimationController", v1))
	if p3 then
		v1:ScaleTo(0.2)
	end
	return v1
end
function t.RigWingsModel(p1) --[[ RigWingsModel | Line: 203 | Upvalues: v2 (copy) ]]
	if not v2 then
		return
	end
	if not p1.Model then
		return
	end
	for k, v in pairs(p1.Model:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanQuery = false
			v.Anchored = false
			v.CanCollide = false
			v.RootPriority = -127
			v.Massless = true
			v.CanTouch = false
			v.CastShadow = false
			v.CollisionGroup = "Animals"
		end
	end
end
function t.RigAnimalModel(p1, p2) --[[ RigAnimalModel | Line: 223 | Upvalues: v2 (copy), Part (copy), v4 (copy), v3 (copy) ]]
	if not v2 then
		return
	end
	if not p1 then
		return
	end
	if not p1:IsA("Model") then
		return
	end
	p1.PrimaryPart = p1:WaitForChild("RootPart")
	p1.PrimaryPart.RootPriority = 127
	local BodyGyro = Instance.new("BodyGyro")
	BodyGyro.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
	BodyGyro.P = 3000
	BodyGyro.D = 100
	BodyGyro.Parent = p1.PrimaryPart
	local BodyVelocity = Instance.new("BodyVelocity")
	BodyVelocity.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
	BodyVelocity.Velocity = Vector3.new(0, 0, 0)
	BodyVelocity.Parent = p1.PrimaryPart
	local AnimationController = Instance.new("AnimationController", p1)
	Instance.new("Animator", AnimationController)
	local HumanoidRootPart = p1.HumanoidRootPart
	HumanoidRootPart.Massless = true
	local Hitbox = p1:FindFirstChild("Hitbox")
	if not Hitbox then
		local Hitbox_2 = Part:Clone()
		local v1 = HumanoidRootPart.Size * 0.99
		Hitbox_2.Size = Vector3.new(v1.Y, v1.Y, v1.Y)
		Hitbox_2.CFrame = HumanoidRootPart.CFrame
		v4:Weld(HumanoidRootPart, Hitbox_2, HumanoidRootPart)
		Hitbox_2.Name = "Hitbox"
		Hitbox_2.Parent = p1
		Hitbox = Hitbox_2
	end
	Hitbox.RootPriority = -127
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BasePart") then
			if v ~= Hitbox then
				v.Anchored = false
				v.CanCollide = false
			end
			if v ~= p1.PrimaryPart and v ~= Hitbox then
				v.CanQuery = false
				v.RootPriority = -127
				v.Massless = true
				v.CanTouch = false
			end
			v.CastShadow = false
		end
	end
	local function makeSeat(p12) --[[ makeSeat | Line: 280 | Upvalues: p1 (copy) ]]
		local RiderSeat = Instance.new("Seat", p1)
		RiderSeat.Size = Vector3.new(0.5, 0.5, 0.5)
		RiderSeat.CFrame = p12.WorldCFrame
		RiderSeat.Massless = true
		RiderSeat.RootPriority = -127
		local RigidConstraint = Instance.new("RigidConstraint")
		RigidConstraint.Parent = RiderSeat
		RigidConstraint.Attachment0 = p1:FindFirstChild("MiddleBody", true)
		local Attachment = Instance.new("Attachment", RiderSeat)
		Attachment.CFrame = RiderSeat.CFrame:ToObjectSpace(RigidConstraint.Attachment0.WorldCFrame)
		RigidConstraint.Attachment1 = Attachment
		RiderSeat.Transparency = 1
		if p12.Name ~= "SeatAttach" then
			RiderSeat.Name = "RiderSeat"
		end
		RiderSeat.CanCollide = false
		RiderSeat.CanTouch = false
		RiderSeat.CanQuery = false
		RiderSeat.Parent = p1
	end
	makeSeat(p1.PrimaryPart:WaitForChild("SeatAttach"))
	makeSeat(p1.PrimaryPart:FindFirstChild("SeatAttach2"))
	p1.PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(100, 0, 0)
	v3.SetCollisionGroupOfModel(p1, "Animals")
	local v22
	if p1 then
		local Data = Instance.new("Folder")
		Data.Name = "Data"
		Data.Parent = p1
		v22 = Data
	else
		v22 = nil
	end
	if p1 then
		local Ailments = v22:Clone()
		Ailments.Name = "Ailments"
		Ailments.Parent = p1
	end
	if not p1:FindFirstChild("Equipment") then
		local Equipment = v22:Clone()
		Equipment.Name = "Equipment"
		Equipment.Parent = p1
	end
	if not v22 then
		return p1
	end
	v22:SetAttribute("Species", p2.Name)
	return p1
end
function t.RigAnimalEquipment(p1, p2) --[[ RigAnimalEquipment | Line: 335 | Upvalues: v11 (copy), v14 (copy), ReplicatedObjectData (copy) ]]
	local v1 = v11.GetByName(p1.Name)
	local v2 = Instance.new("Folder")
	v2.Name = p1.Name
	if p2 then
		local Species = Instance.new("StringValue")
		Species.Name = "Species"
		Species.Value = p2.Name
		Species.Parent = v2
		v1.Species = p2.Name
	end
	local Models = Instance.new("Folder")
	Models.Name = "Models"
	Models.Parent = v2
	local ColorableRegions = Instance.new("Folder")
	ColorableRegions.Name = "ColorableRegions"
	ColorableRegions.Parent = v2
	v1.ColorableRegions = {}
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 0
			v.Name = k
			v.CollisionGroup = "Animals"
			local v3 = Instance.new("Folder")
			v3.Name = v.Name
			local v4 = v:FindFirstChildWhichIsA("Motor6D") or v:FindFirstChildWhichIsA("Weld")
			if v4 then
				local RelativeCFrame = Instance.new("CFrameValue")
				RelativeCFrame.Name = "RelativeCFrame"
				RelativeCFrame.Value = v4.Part0.CFrame:Inverse() * v4.Part1.CFrame
				RelativeCFrame.Parent = v3
				if v4 then
					v4:Destroy()
				end
				local SeatAttach = v:FindFirstChild("SeatAttach")
				if SeatAttach then
					local SeatAttach_2 = p2.Model.RootPart.SeatAttach
					local RelativeSeatPosition = Instance.new("Vector3Value")
					RelativeSeatPosition.Name = "RelativeSeatPosition"
					RelativeSeatPosition.Value = SeatAttach.Parent.Position + SeatAttach.Position - (SeatAttach_2.Parent.Position + SeatAttach_2.Position)
					RelativeSeatPosition.Parent = v3
				end
			else
				for k2, v5 in pairs(v14.BodyPartAttachRegions) do
					local v6 = v:FindFirstChild(v5)
					if v6 then
						local AttachmentPoint = Instance.new("StringValue")
						AttachmentPoint.Name = "AttachmentPoint"
						AttachmentPoint.Value = v6.Name
						AttachmentPoint.Parent = v3
					end
				end
			end
			for k2, v5 in pairs((v:GetTags())) do
				local RegionTag = Instance.new("StringValue")
				RegionTag.Name = "RegionTag"
				RegionTag.Value = v5
				RegionTag.Parent = v3
				local v8 = v5:gsub("ColorableRegion", "")
				if v8 and tonumber(v8) then
					local ColorableRegion = Instance.new("StringValue")
					ColorableRegion.Name = "ColorableRegion"
					ColorableRegion.Value = v5:gsub("ColorableRegion", "")
					ColorableRegion.Parent = v3
					if not ColorableRegions:FindFirstChild(v8) then
						local v9 = Instance.new("BoolValue")
						v9.Name = v8
						v9.Value = true
						v9.Parent = ColorableRegions
						v1.ColorableRegions[v8] = true
					end
				end
				break
			end
			v3.Parent = Models
		end
	end
	v2.Parent = ReplicatedObjectData.Equipment
end
function t.RigAnimalTrait(p1, p2, p3) --[[ RigAnimalTrait | Line: 434 | Upvalues: t2 (copy), CollectionService (copy), v13 (copy), v15 (copy), ReplicatedObjectData (copy) ]]
	if t2[p2.Name] then
		warn("Duplicate trait name found for", p2.Name, p3.Name, t2)
	end
	t2[p2.Name] = true
	local v1 = Instance.new("Folder")
	v1.Name = p2.Name
	local v2 = Instance.new("Folder")
	v2.Name = p2.Name
	local Models = Instance.new("Folder")
	Models.Name = "Models"
	Models.Parent = v1
	local ColorRegion = Instance.new("StringValue")
	ColorRegion.Name = "ColorRegion"
	ColorRegion.Parent = v1
	local v3 = 1
	while true do
		local v6 = p1:FindFirstChild(p2.Name .. (if v3 == 1 then "" else v3 - 1), true)
		local v7 = v3 + 1
		if v6 then
			local v8 = v6:FindFirstChildWhichIsA("Motor6D") or v6:FindFirstChildWhichIsA("Weld")
			if v8 then
				v6.Transparency = 0
				v6.Name = v3
				local v9 = Instance.new("Folder")
				v9.Name = v6.Name
				local RelativeCFrame = Instance.new("CFrameValue")
				RelativeCFrame.Name = "RelativeCFrame"
				RelativeCFrame.Value = v8.Part0.CFrame:Inverse() * v8.Part1.CFrame
				RelativeCFrame.Parent = v9
				v9.Parent = Models
				v8:Destroy()
				if v7 == 1 or #ColorRegion.Value <= 0 then
					local v10 = CollectionService:GetTags(v6)
					if #v10 > 0 then
						for k, v in pairs(v10) do
							local v11 = v13.DATA_TEMPLATES.Animals.Colors:FindFirstChild(v)
							if v11 then
								ColorRegion.Value = v11.Name
								break
							end
						end
					else
						warn("No color region tag found for", p2.Name, p3.Name)
					end
				end
				v6.Parent = v2
			end
			v3 = v7
		else
			if not next(v2:GetChildren()) then
				warn("No trait model can be found for", p2.Name, p3.Name)
			end
			p2.Model = v2
			v2.Parent = v15.Traits
			v1.Parent = ReplicatedObjectData.Traits
			return
		end
	end
end
function t.RigAnimalCosmetics(p1, p2) --[[ RigAnimalCosmetics | Line: 508 | Upvalues: v2 (copy), t (copy), v11 (copy), v15 (copy), ReplicatedObjectModels (copy) ]]
	if not v2 then
		return
	end
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("Folder") then
			local v1 = if v.Name == "MiscCosmetics" then true else false
			if p2.Traits[v.Name] or v1 then
				if v1 then
					for k2, v3 in pairs({ "Tails", "Manes", "Horns", "Ears", "Whiskers", "Sticker" }) do
						if p2.Traits[v3] then
							for k3, v4 in pairs(p2.Traits[v3]) do
								if k3 ~= "Nothing" then
									t.RigAnimalTrait(v, v4, p2)
								end
							end
						end
					end
				elseif p2.Traits[v.Name] then
					for k2, v3 in pairs(p2.Traits[v.Name]) do
						if k2 ~= "Nothing" then
							t.RigAnimalTrait(v, v3, p2)
						end
					end
				end
			elseif v.Name == "Equipment" then
				for k2, v3 in pairs(v:GetChildren()) do
					local v22 = v11.GetByName(v3.Name)
					if v22 then
						t.RigAnimalEquipment(v3, p2)
						v22.Model = v3
						v3.Parent = v15.Equipment
						continue
					end
					warn("No item data can be found for equipment", v3, p2.Name)
				end
			end
			v:ClearAllChildren()
		end
	end
	p1.Parent = ReplicatedObjectModels.Animals
end
function t.AddModelHandler(p1, p2) --[[ AddModelHandler | Line: 556 | Upvalues: t3 (copy) ]]
	t3[p1] = p2
end
function t.Init(p1) --[[ Init | Line: 560 | Upvalues: v2 (copy), v9 (copy), t (copy), v12 (copy), v11 (copy), v10 (copy), ReplicatedObjectData (copy), v16 (copy) ]]
	if v2 then
		for k, v in pairs(v9.GetAll()) do
			local v1, v22 = pcall(function() --[[ Line: 563 | Upvalues: t (ref), v (copy) ]]
				t.RigAnimalModel(v.Model, v)
			end)
			if not v1 then
				warn("[LOAD ERROR] There was an error setting up:", v.Name or v)
				error(v22)
			end
		end
		for k, v in pairs(v12.Mutations) do
			local v3, v4 = pcall(function() --[[ Line: 573 | Upvalues: t (ref), v (copy) ]]
				t.RigWingsModel(v)
			end)
			if not v3 then
				warn("[LOAD ERROR] There was an error setting up:", k)
				error(v4)
			end
		end
		for k, v in pairs(v11.GetType("Equipment")) do
			if v.Model then
				local v5, v6 = pcall(function() --[[ Line: 584 | Upvalues: t (ref), v (copy) ]]
					t.RigAnimalEquipment(v.Model)
				end)
				if not v5 then
					warn("[LOAD ERROR] There was an error setting up:", k)
					error(v6)
				end
			end
		end
		for k, v in pairs(v9.GetAll()) do
			local v7, v8 = pcall(function() --[[ Line: 595 | Upvalues: t (ref), v (copy) ]]
				t.RigAnimalCosmetics(v.Model, v)
			end)
			if not v7 then
				warn("[LOAD ERROR] There was an error setting up:", v.Name or v)
				error(v8)
			end
		end
		v10.AddItemTypeHandler("Traits", function() --[[ Line: 604 ]] end)
	else
		for k, v in pairs(v11.GetType("Equipment")) do
			local v92 = ReplicatedObjectData.Equipment:WaitForChild(k, 1)
			if v92 then
				v16(v92, v)
				for k2, v3 in pairs(v.Models) do
					v3.AttachmentPoint = v3.AttachmentPoint or "RootPart"
				end
			end
		end
		for k, v in pairs(v9.GetAll()) do
			for k2, v3 in pairs(v.Traits) do
				if k2 ~= "Materials" then
					for k3, v4 in pairs(v3) do
						if k3 ~= "Nothing" then
							local v102 = ReplicatedObjectData.Traits:FindFirstChild(k3)
							if v102 then
								v16(v102, v4)
							end
						end
					end
				end
			end
		end
	end
end
t:Init()
return t