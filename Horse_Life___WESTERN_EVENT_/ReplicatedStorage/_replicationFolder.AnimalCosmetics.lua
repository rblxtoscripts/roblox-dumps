-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("MaterialUtils")
local v4 = Sonar("AnimalDataService")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("ItemReplicationService")
local v7 = Sonar("EquipmentService")
local v8 = Sonar("AssemblyUtils")
local v9 = Sonar("MutationUtils")
local v10 = Sonar("Color3")
local v11 = Sonar("TransparencyUtils")
local v12 = Sonar("ReflectanceUtils")
local v13 = Sonar("spr")
local v14 = Sonar("Constants")
local t2 = {
	"CoatBottom",
	"CoatTop",
	"Hair",
	"Hoof",
	"Keratin",
	"Nose",
	"Paint",
	"Pattern",
	"Sock"
}
local t3 = { "CoatBottom", "CoatTop", "Hoof", "Nose", "Sock" }
local t4 = {}
function t.new(p1, p2) --[[ new | Line: 48 | Upvalues: t (copy), v2 (copy), v4 (copy), ReplicatedStorage (copy), Sonar (copy), t4 (copy) ]]
	local v3 = setmetatable(p2 or {}, t)
	v3.Maid = v2.new()
	local v42 = p1:HasTag("LocalMob")
	v3.IsBoss = p1:HasTag("Boss")
	v3.IsMob = v42
	v3.AnimalModel = p1
	v3.AttachmentPoints = {}
	v3.TagRegionsToInstanceMap = {}
	v3.InstancesByName = {}
	v3.AddedTraits = {}
	v3.AllTraits = {}
	v3.AddedEquipmentAndFlairs = {}
	v3.AllEquipmentAndFlairs = {}
	v3.AddedMutations = {}
	v3.MutationTagRegionsMap = {}
	v3.MutationCosmeticTypeRegionsMap = {}
	v3.AnimalValue = v3.SlotValue or not v42 and p1:WaitForChild("SlotInfo") or p1.RootReference.Value:WaitForChild("SlotInfo")
	v3.SpeciesValue = v3.AnimalValue:WaitForChild("Species")
	v3.SpeciesData = v4.GetByName(v3.SpeciesValue.Value)
	v3.ColorData = v3.AnimalValue:WaitForChild("Colors")
	v3.MaterialData = v3.AnimalValue:WaitForChild("Materials")
	v3.TransparencyData = v3.AnimalValue:WaitForChild("Transparency")
	v3.ReflectanceData = v3.AnimalValue:WaitForChild("Reflectance")
	if v3.IsBoss then
		local v6 = p1:GetAttribute("CustomPresetName")
		if v6 then
			local v7 = ReplicatedStorage.Storage.BossPresets:FindFirstChild(v6)
			if v7 then
				v3.BossCosmeticData = Sonar(v7).Cosmetics
			else
				warn("CustomPresetName \'" .. v6 .. "\' not found in BossPresets, using default tier preset")
				v3.BossCosmeticData = Sonar(ReplicatedStorage.Storage.BossPresets["Tier" .. p1:GetAttribute("Tier")]).Cosmetics
			end
		else
			v3.BossCosmeticData = Sonar(ReplicatedStorage.Storage.BossPresets["Tier" .. p1:GetAttribute("Tier")]).Cosmetics
		end
	end
	v3.Character = p1.Parent and p1.Parent.Parent
	v3.IsLocal = not v3.IsMob and (if v3.Character == game.Players.LocalPlayer.Character then true else false)
	if v3.IsYoung == nil then
		v3.IsYoung = Sonar("AnimalDataService").IsFoal(v3.AnimalValue)
	end
	if v3.IsYoung then
		v3.YoungData = v4.GetByName("Foal")
		if not v3.AnimalModel:FindFirstChild("SpeciesPatterns") then
			local SpeciesPatterns = Instance.new("Folder")
			SpeciesPatterns.Name = "SpeciesPatterns"
			SpeciesPatterns.Parent = v3.AnimalModel
		end
		v3:ListenForTrait("SpeciesPatterns", v3.SpeciesValue)
	else
		for k, v in pairs({ "Patterns", "Paints", "Cosmetics" }) do
			for k2, v6 in pairs(v3.AnimalValue:WaitForChild(v):GetChildren()) do
				v3:ListenForTrait(v, v6)
			end
		end
		for k, v in pairs(v3.AnimalValue:WaitForChild("MiscCosmetics"):GetChildren()) do
			v3:ListenForTrait("MiscCosmetics", v)
		end
		if not (v3.DisableAccessories or p1:HasTag("DisableAccessories")) then
			v3.Maid:GiveTask(v3.AnimalValue:WaitForChild("EquippedEquipment").ChildAdded:Connect(function(p1) --[[ Line: 123 | Upvalues: v3 (copy) ]]
				task.wait()
				v3:ListenForEquipmentAndFlairs(p1)
			end))
			for k, v in pairs(v3.AnimalValue:WaitForChild("EquippedEquipment"):GetChildren()) do
				v3:ListenForEquipmentAndFlairs(v)
			end
		end
	end
	v3.Maid:GiveTask(v3.AnimalValue:WaitForChild("Mutations").ChildAdded:Connect(function(p1) --[[ Line: 143 | Upvalues: v3 (copy) ]]
		task.wait()
		v3:ListenForMutation(p1)
	end))
	for k, v in pairs(v3.AnimalValue:WaitForChild("Mutations"):GetChildren()) do
		v3:ListenForMutation(v)
	end
	v3.Maid:GiveTask(p1.DescendantAdded:Connect(function(p1) --[[ Line: 152 | Upvalues: v3 (copy) ]]
		if not (p1:IsA("Sound") or (p1:IsA("GuiObject") or p1:IsA("JointInstance"))) then
			v3:InstanceAdded(p1)
		end
	end))
	for k, v in pairs(p1:GetDescendants()) do
		v3:InstanceAdded(v)
	end
	t4[v3] = true
	return v3
end
function t.Destroy(p1) --[[ Destroy | Line: 168 | Upvalues: t4 (copy) ]]
	t4[p1] = nil
	for k, v in pairs(p1.AddedTraits) do
		p1:TraitRemoved(k)
	end
	for k, v in pairs(p1.AddedEquipmentAndFlairs) do
		p1:EquipmentAndFlairRemoved(k)
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.ListenForMutation(p1, p2) --[[ ListenForMutation | Line: 180 ]]
	if not p1.IsMob then
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 182 | Upvalues: p1 (copy), p2 (copy) ]]
			p1:MutationAdded(p2)
		end))
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 185 | Upvalues: p2 (copy), p1 (copy) ]]
			if not p2.Parent then
				p1:MutationRemoved(p2)
			end
		end))
	end
	p1:MutationAdded(p2)
end
function t.MutationRemoved(p1, p2) --[[ MutationRemoved | Line: 193 | Upvalues: v9 (copy) ]]
	if not p1.AddedMutations[p2] then
		return
	end
	p1.AddedMutations[p2].Maid:Destroy()
	p1.AddedMutations[p2] = nil
	local v1 = v9.GetMutation(p2.Value)
	if not v1 then
		return
	end
	local Targets = v1.Targets
	if not Targets then
		return
	end
	for v2, v3 in Targets do
		if p1.MutationTagRegionsMap[v3] then
			for k, v in pairs(p1.MutationTagRegionsMap[v3]) do
				if v.Mutation == p2 then
					table.remove(p1.MutationTagRegionsMap[v3], k)
				end
			end
			table.sort(p1.MutationTagRegionsMap[v3], function(p1, p2) --[[ Line: 212 ]]
				return p1.Priority > p2.Priority
			end)
		end
		if v1.SetTo then
			for v4, v5 in p1.TagRegionsToInstanceMap do
				if p1.MutationCosmeticTypeRegionsMap[v3] then
					p1.MutationCosmeticTypeRegionsMap[v3] = nil
					for v6, v7 in v5.Instances do
						p1:SetColor(v6, v4)
					end
				end
			end
		end
		local v8 = p1.TagRegionsToInstanceMap[v3]
		if v8 then
			if v3 == "Eye" then
				for v92, v10 in v8.Instances do
					p1:SetEye(v92, v8.Color)
				end
				continue
			end
			for v11, v12 in v8.Instances do
				p1:SetMaterial(v11, v3)
			end
		end
	end
end
function t.MutationAdded(p1, p2) --[[ MutationAdded | Line: 244 | Upvalues: v9 (copy), v2 (copy), ReplicatedStorage (copy), v4 (copy), Sonar (copy) ]]
	p1:MutationRemoved(p2)
	local v1 = v9.GetMutation(p2.Value)
	if not v1 then
		return
	end
	local Targets = v1.Targets
	if not (Targets or (v1.Particles or (v1.ParticlesByAttachment or v1.MaterialByTarget))) then
		return
	end
	local v22 = v2.new()
	p1.AddedMutations[p2] = {
		Maid = v22,
		Mutation = v1
	}
	if v1.Particles then
		for k, v in pairs(v1.Particles) do
			local t = {}
			for v3, v42 in p1.AnimalModel:GetDescendants() do
				if v42:IsA("Attachment") and v42.Name == v then
					table.insert(t, v42)
				end
			end
			for v5, v6 in t do
				local v7 = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild(k)
				if v7 then
					local v8 = v7:Clone()
					v8.Parent = v6
					if v4.IsFoal(p1.AnimalValue) then
						Sonar("MathUtils").scaleParticle(v8, 0.5)
					end
					v22:GiveTask(v8)
				end
			end
		end
	end
	if v1.ParticlesByAttachment then
		for k, v in pairs(v1.ParticlesByAttachment) do
			local t = {}
			for v92, v10 in p1.AnimalModel:GetDescendants() do
				if v10:IsA("Attachment") and v10.Name == k then
					table.insert(t, v10)
				end
			end
			for v11, v12 in t do
				local v13 = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("Assets"):WaitForChild("Particles"):WaitForChild(v)
				if v13 then
					local v14 = v13:Clone()
					v14.Parent = v12
					if v4.IsFoal(p1.AnimalValue) then
						Sonar("MathUtils").scaleParticle(v14, 0.5)
					end
					v22:GiveTask(v14)
				end
			end
		end
	end
	if v1.MaterialByTarget then
		for v15, v16 in v1.MaterialByTarget do
			if not p1.MutationTagRegionsMap[v15] then
				p1.MutationTagRegionsMap[v15] = {}
			end
			table.insert(p1.MutationTagRegionsMap[v15], {
				Priority = -1,
				Mutation = p2,
				Material = v16,
				Type = v1.Type
			})
			table.sort(p1.MutationTagRegionsMap[v15], function(p1, p2) --[[ Line: 327 ]]
				return p1.Priority > p2.Priority
			end)
			local v18 = p1.TagRegionsToInstanceMap[v15]
			if v18 then
				for v19, v20 in v18.Instances do
					p1:SetMaterial(v19, v15)
				end
			end
		end
	end
	if not Targets then
		return
	end
	for v23, v24 in Targets do
		local v21, v222
		if v1.SetTo then
			if not p1.MutationCosmeticTypeRegionsMap[v24] then
				local v25 = p1.ColorData:FindFirstChild(v1.SetTo)
				if v25 then
					p1.MutationCosmeticTypeRegionsMap[v24] = function() --[[ Line: 350 | Upvalues: v25 (copy) ]]
						return v25.Value
					end
					v22:GiveTask(v25:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 354 | Upvalues: p1 (copy), v24 (copy) ]]
						for v1, v2 in p1.TagRegionsToInstanceMap do
							if p1.MutationCosmeticTypeRegionsMap[v24] then
								for v3, v4 in v2.Instances do
									p1:SetColor(v3, v1)
								end
							end
						end
					end))
				end
				for v26, v27 in p1.TagRegionsToInstanceMap do
					if p1.MutationCosmeticTypeRegionsMap[v24] then
						for v28, v29 in v27.Instances do
							p1:SetColor(v28, v26)
						end
					end
				end
			end
			continue
		end
		if not p1.MutationTagRegionsMap[v24] then
			p1.MutationTagRegionsMap[v24] = {}
		end
		if v1.Color then
			v21 = v1.Color[p2.Level.Value]
			v222 = 1
		else
			v222 = 0
			v21 = nil
		end
		if v1.Type == "Glow" then
			v222 = 2
		end
		table.insert(p1.MutationTagRegionsMap[v24], {
			Mutation = p2,
			Material = v1.Material,
			Priority = v222,
			Color = v21,
			Type = v1.Type
		})
		table.sort(p1.MutationTagRegionsMap[v24], function(p1, p2) --[[ Line: 397 ]]
			if p1.Priority == p2.Priority then
				local v1 = tostring(p1.Mutation)
				return tostring(p2.Mutation) < v1
			else
				return p1.Priority > p2.Priority
			end
		end)
		local v31 = p1.TagRegionsToInstanceMap[v24]
		if v31 then
			if v24 == "Eye" then
				for v32, v33 in v31.Instances do
					p1:SetEye(v32, v31.Color)
				end
				continue
			end
			for v34, v35 in v31.Instances do
				p1:SetMaterial(v34, v24)
				p1:SetColor(v34, v24)
			end
		end
	end
end
function t.ListenForEquipmentAndFlairs(p1, p2) --[[ ListenForEquipmentAndFlairs | Line: 423 | Upvalues: v5 (copy) ]]
	p1.AllEquipmentAndFlairs[p2] = v5.GetByName(p2.Value)
	if not p1.IsMob then
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 427 | Upvalues: p2 (copy), p1 (copy) ]]
			if not p2.Parent then
				p1:EquipmentAndFlairRemoved(p2)
			end
		end))
	end
	p1:EquipmentAndFlairAdded(p2)
end
function t.EquipmentAndFlairRemoved(p1, p2) --[[ EquipmentAndFlairRemoved | Line: 435 ]]
	if not p1.AddedEquipmentAndFlairs[p2] then
		return
	end
	if p1.AddedEquipmentAndFlairs[p2].ClassName == "Maid" then
		p1.AddedEquipmentAndFlairs[p2]:Destroy()
		p1.AddedEquipmentAndFlairs[p2] = nil
	else
		for k, v in pairs(p1.AddedEquipmentAndFlairs[p2]) do
			v:Destroy()
			p1.AddedEquipmentAndFlairs[p2][k] = nil
		end
	end
	p1.AllEquipmentAndFlairs[p2] = nil
end
function t.FindToyAttachment(p1, p2) --[[ FindToyAttachment | Line: 449 ]]
	if not p2 then
		return nil
	end
	if type(p2) ~= "string" then
		warn("[AnimalCosmetics] FindToyAttachment: attachmentName is not string", "type =", type(p2), "value =", p2)
		return nil
	end
	local RootPart = p1.AnimalModel:FindFirstChild("RootPart")
	if not RootPart then
		return nil
	end
	for v1, v2 in p1.AllTraits do
		local v4 = type(v1.Value) == "string" and v1.Value or v1.Name
		if v4 ~= "" then
			local v5 = p2 .. v4
			for v6, v7 in RootPart:GetDescendants() do
				if v7:IsA("Attachment") and v7.Name == v5 then
					return v7
				end
			end
		end
	end
	return nil
end
function t.GetToyAttachmentName(p1, p2) --[[ GetToyAttachmentName | Line: 475 | Upvalues: v6 (copy) ]]
	local v1 = v6.Get(p2.Name)
	if not v1 then
		return nil
	end
	local v2 = v1:FindFirstChildWhichIsA("BasePart")
	if not v2 then
		return nil
	end
	local v3 = v2:FindFirstChildWhichIsA("Attachment")
	if v3 then
		return v3.Name
	else
		return nil
	end
end
function t.EquipmentAndFlairAdded(p1, p2) --[[ EquipmentAndFlairAdded | Line: 488 | Upvalues: v5 (copy) ]]
	local v1 = v5.GetByName(p2.Value)
	if not v1 then
		return
	end
	if v1.ItemType == "Flairs" then
		p1:CreateFlair(p2)
		return
	end
	if v1.ItemType ~= "Equipment" then
		return
	end
	if v1.ToyEvent then
		local v2 = p1:GetToyAttachmentName(v1)
		if not v2 then
			return
		end
		local v3 = p1:FindToyAttachment(v2)
		if v3 then
			p1:CreateToyEquipment(p2, v3)
		end
	else
		if not v1.Models then
			warn("NO ITEM MODELS CAN BE FOUND FOR", v1.Name)
			return
		end
		for k, v in pairs(v1.Models) do
			local v4 = p1.AttachmentPoints[v.AttachmentPoint]
			if v4 then
				p1:CreateEquipment(p2, k, v4)
			end
		end
	end
end
function t.CreateFlair(p1, p2) --[[ CreateFlair | Line: 517 | Upvalues: v2 (copy), v6 (copy) ]]
	if not p1.AddedEquipmentAndFlairs[p2] then
		local v1 = p1.AllEquipmentAndFlairs[p2]
		local v22 = v2.new()
		p1.AddedEquipmentAndFlairs[p2] = v22
		task.spawn(function() --[[ Line: 525 | Upvalues: v6 (ref), v1 (copy), p1 (copy), v22 (copy) ]]
			local v12 = v6.Get(v1.Name)
			if v1.DisplayBodyPart == "Legs" then
				local function resolvePath(p1, p2) --[[ resolvePath | Line: 530 ]]
					local v1 = p1
					for i, v in ipairs(p2) do
						v1 = v1:WaitForChild(v)
					end
					return v1
				end
				local SpeciesValue = p1.SpeciesValue.Value
				for v2, v3 in { "L", "R" } do
					local v62 = p1.AnimalModel
					for i, v in ipairs(if SpeciesValue == "Hippocampus" then {} else {
	"RootPart",
	"MiddleBody",
	"LowerBody",
	"Thigh." .. v3,
	"Leg." .. v3,
	"Ankle." .. v3,
	"Trail"
}) do
						v62 = v62:WaitForChild(v)
					end
					local v8, v9 = p1.AnimalModel, v62
					for i, v in ipairs(if SpeciesValue == "Felorse" then {
	"RootPart",
	"MiddleBody",
	"UpperBody",
	"Collar." .. v3,
	"Shoulder." .. v3,
	"Elbow." .. v3,
	"Trail"
} else {
	"RootPart",
	"MiddleBody",
	"UpperBody",
	"Collar." .. v3,
	"Shoulder." .. v3,
	"Elbow." .. v3,
	"Wrist." .. v3,
	"Trail"
}) do
						v8 = v8:WaitForChild(v)
					end
					local v11 = v8
					for k, v in pairs(v12:GetChildren()) do
						for k2, v7 in pairs({ v9, v11 }) do
							local v122 = v:Clone()
							if v122:IsA("Trail") or v122:IsA("Beam") then
								if v7 ~= p1.AnimalModel then
									v122.Attachment0 = v7
									if v7 == v9 then
										v122.Attachment1 = v7.Parent:WaitForChild("Foot." .. v3):WaitForChild("Step")
									else
										v122.Attachment1 = v7.Parent:WaitForChild("Hand." .. v3):WaitForChild("Step")
									end
									v22:GiveTask(v122)
									v122.Parent = v7
								end
							else
								v22:GiveTask(v122)
								v122.Parent = v7
							end
						end
					end
				end
			else
				for k, v in pairs(v12:GetChildren()) do
					local v13 = v:Clone()
					v13.Parent = p1.AnimalModel:WaitForChild(v1.DisplayBodyPart)
					v22:GiveTask(v13)
				end
			end
		end)
	end
end
function t.CreateToyEquipment(p1, p2, p3) --[[ CreateToyEquipment | Line: 590 | Upvalues: v2 (copy), v6 (copy), v8 (copy) ]]
	if not p1.AddedEquipmentAndFlairs[p2] then
		local v1 = p1.AllEquipmentAndFlairs[p2]
		local v22 = v2.new()
		p1.AddedEquipmentAndFlairs[p2] = v22
		task.spawn(function() --[[ Line: 597 | Upvalues: v6 (ref), v1 (copy), v22 (copy), p1 (copy), v8 (ref), p3 (copy) ]]
			local v12 = v6.Get(v1.Name)
			if not v12 then
				return
			end
			local v2 = v12:FindFirstChildWhichIsA("BasePart")
			if not v2 then
				return
			end
			local v3 = v2:Clone()
			v3.Name = v1.Name
			v3.Anchored = false
			v22:GiveTask(v3)
			local v4 = v3:FindFirstChildWhichIsA("Attachment")
			if v4 then
				v3.Size = v2.Size * p1.AnimalModel:GetScale()
				v22:GiveTask((v8.rigidConstraintAttachment(p3, v4)))
				v3.Parent = p1.AnimalModel.Equipment
			end
		end)
	end
end
function t.CreateEquipment(p1, p2, p3, p4) --[[ CreateEquipment | Line: 622 | Upvalues: v7 (copy), v2 (copy), v6 (copy), v10 (copy), v8 (copy) ]]
	if not p1.AddedEquipmentAndFlairs[p2] then
		p1.AddedEquipmentAndFlairs[p2] = {}
	end
	if p1.AddedEquipmentAndFlairs[p2][p3] then
		return
	end
	local v1 = p1.AllEquipmentAndFlairs[p2]
	local v22 = v1.Models[p3]
	local v3 = v7.GetThemeFromValue(p2)
	local v4 = not v3 and v1.Editable and v22.ColorableRegion
	local v5 = v2.new()
	p1.AddedEquipmentAndFlairs[p2][p3] = v5
	task.spawn(function() --[[ Line: 636 | Upvalues: v6 (ref), v1 (copy), p3 (copy), v5 (copy), v22 (copy), v3 (copy), v4 (copy), p2 (copy), p1 (copy), v10 (ref), p4 (copy), v8 (ref) ]]
		local v12 = v6.Get(v1.Name):WaitForChild(p3)
		local v2 = v12:Clone()
		v2.Name = v1.Name .. p3
		v5:GiveTask(v2)
		if v22.RegionTag then
			if v3 then
				local v32 = v3.RegionsByTag[v22.RegionTag]
				if v32 then
					if v32.Texture then
						v2.TextureID = v32.Texture
					end
					if v32.Color then
						v2.Color = v32.Color
					end
					if v32.Material then
						v2.Material = Enum.Material[v32.Material]
					end
					v2.MaterialVariant = v32.MaterialVariant or ""
					if v32.Particle then
						local v42 = v32.Particle:Clone()
						v42.Parent = v2
						v5:GiveTask(v42)
					end
					for k, v in pairs(v2:GetDescendants()) do
						for k2, v7 in pairs((v:GetTags())) do
							local v62 = v3.RegionsByTag[v7]
							if v62 and v62.Color then
								v.Color = v62.Color
							end
						end
					end
				end
			elseif v4 then
				local v7 = p2:FindFirstChild(v22.ColorableRegion)
				if v7 then
					local Color = v2.Color
					local function setColor() --[[ setColor | Line: 680 | Upvalues: p1 (ref), v22 (ref), p2 (ref), v2 (copy), v10 (ref), Color (copy), v7 (copy) ]]
						local IsLocal = p1.IsLocal
						if IsLocal then
							local EditedColors = _G.EditedColors
							IsLocal = EditedColors[tostring(v22.ColorableRegion)]
						end
						if IsLocal and _G.EditedEquipment == p2.Name then
							local v23
							if #IsLocal > 0 then
								local EditedColors = _G.EditedColors
								v23 = v10.fromHex(EditedColors[tostring(v22.ColorableRegion)]) or Color
							else
								v23 = Color
							end
							v2.Color = v23
						elseif #v7.Value > 0 then
							v2.Color = v10.fromHex(v7.Value)
						else
							v2.Color = Color
						end
					end
					if p1.IsLocal then
						v5:GiveTask(_G.EditedColorsChangedSignal:Connect(setColor))
					end
					if not p1.IsMob then
						v5:GiveTask(v7:GetPropertyChangedSignal("Value"):Connect(setColor))
					end
					setColor()
				end
			end
		end
		local v82 = p1.AnimalModel:GetScale()
		local function getAxis(p1, p2) --[[ getAxis | Line: 704 ]]
			return p1:FindFirstChild(p2)
		end
		local function getAxisValue(p1, p2, p3) --[[ getAxisValue | Line: 708 ]]
			local v1 = p1:FindFirstChild(p2) and v1:FindFirstChild(p3)
			return v1
		end
		local XAxis = p2:FindFirstChild("XAxis")
		local v9 = XAxis and XAxis:FindFirstChild("Position")
		local YAxis = p2:FindFirstChild("YAxis")
		local v102 = YAxis and YAxis:FindFirstChild("Position")
		local ZAxis = p2:FindFirstChild("ZAxis")
		local v11 = ZAxis and ZAxis:FindFirstChild("Position")
		local XAxis_2 = p2:FindFirstChild("XAxis")
		local v122 = XAxis_2 and XAxis_2:FindFirstChild("Rotation")
		local YAxis_2 = p2:FindFirstChild("YAxis")
		local v13 = YAxis_2 and YAxis_2:FindFirstChild("Rotation")
		local ZAxis_2 = p2:FindFirstChild("ZAxis")
		local v14 = ZAxis_2 and ZAxis_2:FindFirstChild("Rotation")
		local function getPositionOffset() --[[ getPositionOffset | Line: 720 | Upvalues: v9 (copy), v102 (copy), v11 (copy), v122 (copy), v13 (copy), v14 (copy) ]]
			local v1 = if v9 then v9.Value or 0 else 0
			local v5 = math.rad(v122 and v122.Value or 0)
			local v7 = math.rad(v13 and v13.Value or 0)
			local v92 = math.rad(v14 and v14.Value or 0)
			local v10 = Vector3.new(v1, v102 and v102.Value or 0, v11 and v11.Value or 0)
			return CFrame.new(v10) * CFrame.Angles(v5, v7, v92)
		end
		local function setSeatOffset() --[[ setSeatOffset | Line: 731 | Upvalues: v22 (ref), v2 (copy), p1 (ref) ]]
			if not (v22.RelativeSeatPosition and v2:FindFirstChild("SeatAttach")) then
				return
			end
			p1.AnimalModel:SetAttribute("SeatOffset", v22.RelativeSeatPosition * p1.AnimalModel:GetScale())
		end
		if v22.RelativeCFrame then
			local WeldConstraint = Instance.new("WeldConstraint")
			WeldConstraint.Part0 = p4
			WeldConstraint.Part1 = v2
			local function setSizeAndOffset(p12) --[[ setSizeAndOffset | Line: 747 | Upvalues: p1 (ref), v2 (copy), v12 (copy), getPositionOffset (copy), v22 (ref) ]]
				if not p12 then
					task.wait()
				end
				v2.Size = v12.Size * p1.AnimalModel:GetScale()
				v2.CFrame = p1.AnimalModel.RootPart.CFrame * v22.RelativeCFrame * getPositionOffset()
				if not (v22.RelativeSeatPosition and v2:FindFirstChild("SeatAttach")) then
					return
				end
				p1.AnimalModel:SetAttribute("SeatOffset", v22.RelativeSeatPosition * p1.AnimalModel:GetScale())
			end
			v5:GiveTask(p1.AnimalModel.RootPart:GetPropertyChangedSignal("Size"):Connect(setSizeAndOffset))
			local v15 = p1.AnimalModel:GetScale()
			v2.Size = v12.Size * v15
			v2.CFrame = p1.AnimalModel.RootPart.CFrame * v22.RelativeCFrame * getPositionOffset()
			if v22.RelativeSeatPosition and v2:FindFirstChild("SeatAttach") then
				p1.AnimalModel:SetAttribute("SeatOffset", v22.RelativeSeatPosition * p1.AnimalModel:GetScale())
			end
			WeldConstraint.Parent = v2
			if not p1.IsMob then
				for k, v in pairs({ v9, v102, v11, v122, v13, v14 }) do
					if v then
						v5:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setSizeAndOffset))
					end
				end
			end
		else
			local v18 = v2:WaitForChild(v22.AttachmentPoint)
			v18.Name = "Attachment" .. p3
			v2.Size = v12.Size * v82
			local v19 = CFrame.new(v18.CFrame.p) * v18.CFrame.Rotation
			local function setSizeAndOffset(p12) --[[ setSizeAndOffset | Line: 778 | Upvalues: p1 (ref), v2 (copy), v12 (copy), getPositionOffset (copy), p4 (ref), v18 (copy), v19 (copy), v22 (ref) ]]
				local v1 = p1.AnimalModel:GetScale()
				if p1.InViewport then
					v2.Size = v12.Size * v1
					local v23 = getPositionOffset()
					v2.CFrame = p4.WorldCFrame * v18.CFrame:inverse() * v23
				else
					local v3 = getPositionOffset()
					v18.CFrame = CFrame.new(v19.p * v1) * v19.Rotation * v3
					v2.Size = v12.Size * v1
				end
				if not (v22.RelativeSeatPosition and v2:FindFirstChild("SeatAttach")) then
					return
				end
				p1.AnimalModel:SetAttribute("SeatOffset", v22.RelativeSeatPosition * p1.AnimalModel:GetScale())
			end
			pcall(function() --[[ Line: 794 | Upvalues: p1 (ref), v5 (ref), setSizeAndOffset (copy) ]]
				if not p1.IsMob then
					v5:GiveTask(p1.AnimalModel.RootPart:GetPropertyChangedSignal("Size"):Connect(setSizeAndOffset))
				end
			end)
			setSizeAndOffset(true)
			v5:GiveTask((v8.rigidConstraintAttachment(p4, v18)))
			if not p1.IsMob then
				for k, v in pairs({ v9, v102, v11, v122, v13, v14 }) do
					if v then
						v5:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setSizeAndOffset))
					end
				end
			end
		end
		v2.Parent = p1.AnimalModel.Equipment
		if v22.RelativeSeatPosition then
			v5:GiveTask(function() --[[ Line: 817 | Upvalues: p1 (ref) ]]
				if not (p1.AnimalModel and p1.AnimalModel.Parent) then
					return
				end
				p1.AnimalModel:SetAttribute("SeatOffset", nil)
			end)
		end
		if not (v22.RelativeSeatPosition and v2:FindFirstChild("SeatAttach")) then
			return
		end
		local v20 = p1.AnimalModel:GetScale()
		p1.AnimalModel:SetAttribute("SeatOffset", v22.RelativeSeatPosition * v20)
	end)
end
function t.GetAnimalDataForCosmetics(p1) --[[ GetAnimalDataForCosmetics | Line: 828 ]]
	return p1.YoungData or p1.SpeciesData
end
function t.GetTrait(p1, p2) --[[ GetTrait | Line: 832 | Upvalues: v4 (copy) ]]
	if not p2:IsA("BoolValue") then
		return v4.GetTraitFromSpecies(p1:GetAnimalDataForCosmetics(), p2.Value)
	end
	if p2.Value then
		return v4.GetTraitFromSpecies(p1:GetAnimalDataForCosmetics(), p2.Name)
	end
end
function t.ListenForTrait(p1, p2, p3) --[[ ListenForTrait | Line: 842 ]]
	if not p1.IsMob then
		p1.Maid:GiveTask(p3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 844 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
			p1:TraitAdded(p2, p3)
		end))
	end
	p1:TraitAdded(p2, p3)
	p1.AllTraits[p3] = p2
end
function t.TraitRemoved(p1, p2) --[[ TraitRemoved | Line: 853 ]]
	if p1.AddedTraits[p2] then
		p1.AddedTraits[p2]:Destroy()
		p1.AddedTraits[p2] = nil
	end
end
function t.TraitAdded(p1, p2, p3) --[[ TraitAdded | Line: 859 | Upvalues: v2 (copy), v6 (copy) ]]
	if p1.AddedTraits[p3] then
		return
	end
	if not p1.AnimalModel:FindFirstChild("RootPart") then
		return
	end
	local v1 = p1:GetTrait(p3)
	if not v1 then
		return
	end
	if v1.Name == "Nothing" then
		return
	end
	if v1.Models and next(v1.Models) then
		local v22 = v2.new()
		p1.AddedTraits[p3] = v22
		task.spawn(function() --[[ Line: 877 | Upvalues: v6 (ref), p1 (copy), v1 (copy), v22 (copy), p2 (copy) ]]
			local v12 = v6.Get(p1:GetAnimalDataForCosmetics(), {
				"Traits",
				v1.TraitType,
				v1.Name,
				"Model"
			}):Clone()
			for k, v in pairs(v12:GetChildren()) do
				local Size = v.Size
				local v3 = v1.Models[tonumber(v.Name)] or v1.Models[v.Name]
				local WeldConstraint = Instance.new("WeldConstraint")
				local RootPart = p1.AnimalModel:WaitForChild("RootPart", 10)
				if RootPart then
					WeldConstraint.Part0 = RootPart
					WeldConstraint.Part1 = v
					local function setSizeAndOffset(p12) --[[ setSizeAndOffset | Line: 893 | Upvalues: p1 (ref), v (copy), Size (copy), v3 (copy) ]]
						if p12 then
							v.Size = Size * p1.AnimalModel:GetScale()
							v.CFrame = p1.AnimalModel.RootPart.CFrame * v3.RelativeCFrame
							return
						end
						task.wait()
						v.Size = Size * p1.AnimalModel:GetScale()
						v.CFrame = p1.AnimalModel.RootPart.CFrame * v3.RelativeCFrame
					end
					if not p1.IsMob and p1.AnimalModel:FindFirstChild("RootPart") then
						v22:GiveTask(p1.AnimalModel.RootPart:GetPropertyChangedSignal("Size"):Connect(setSizeAndOffset))
					end
					v.Size = Size * p1.AnimalModel:GetScale()
					v.CFrame = p1.AnimalModel.RootPart.CFrame * v3.RelativeCFrame
					if v1.CustomTransparency then
						v.Transparency = v1.CustomTransparency
					end
					WeldConstraint.Parent = v
					v.Parent = p1.AnimalModel:WaitForChild(p2)
					v22:GiveTask(v)
					continue
				end
				WeldConstraint:Destroy()
			end
		end)
		return
	end
	warn("No trait models can be found for", v1)
end
function t.CreateTagRegionMap(p1, p2) --[[ CreateTagRegionMap | Line: 923 | Upvalues: t2 (copy), t3 (copy) ]]
	local t = {
		Instances = {}
	}
	if table.find(t2, p2) or p2 == "Eye" then
		for k, v in pairs({ "Color", "Material" }) do
			if p1[v .. "Data"] then
				if not p1.IsMob then
					p1.Maid:GiveTask(p1[v .. "Data"]:WaitForChild(p2):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 933 | Upvalues: t (copy), v (copy), p1 (copy), p2 (copy) ]]
						t[v] = p1[v .. "Data"][p2].Value
						for k, v2 in pairs(t.Instances) do
							p1["Set" .. v](p1, k, p2)
						end
					end))
				end
				t[v] = p1[v .. "Data"][p2].Value
			end
		end
	end
	if table.find(t2, p2) then
		for v1, v2 in { "Transparency", "Reflectance" } do
			local v3 = table.find(t3, p2)
			if p1[v2 .. "Data"] and v3 then
				p1.Maid:GiveTask(p1[v2 .. "Data"]:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 952 | Upvalues: t (copy), v2 (copy), p1 (copy), p2 (copy) ]]
					t[v2] = p1[v2 .. "Data"].Value
					for k, v in pairs(t.Instances) do
						p1["Set" .. v2](p1, k, p2)
					end
				end))
			end
			t[v2] = v3 and p1[v2 .. "Data"] and p1[v2 .. "Data"].Value or true
		end
	end
	if p2 == "Eye" then
		p1.Maid:GiveTask(p1.ColorData:WaitForChild("Eye"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 967 | Upvalues: t (copy), p1 (copy) ]]
			t.Color = p1.ColorData.Eye.Value
			for k, v in pairs(t.Instances) do
				p1:SetEye(k, t.Color)
			end
		end))
		t.Color = p1.ColorData.Eye.Value
	end
	p1.TagRegionsToInstanceMap[p2] = t
	return t
end
function t.GetTagRegionMap(p1, p2) --[[ GetTagRegionMap | Line: 981 ]]
	return p1.TagRegionsToInstanceMap[p2] or p1:CreateTagRegionMap(p2)
end
function t.InstanceAdded(p1, p2, p3, p4) --[[ InstanceAdded | Line: 986 | Upvalues: v14 (copy) ]]
	local v1 = p2:IsA("BasePart") and (if p2.Name == "RootPart" then if p2.Parent == p1.AnimalModel then true else false else false)
	local v2 = p2:GetTags()
	next(v2)
	for k, v in pairs(v2) do
		local v3 = p1:GetTagRegionMap(v)
		if v3 then
			v3.Instances[p2] = true
			for k2, v4 in pairs({ "Color", "Material" }) do
				if v3[v4] then
					if v == "Eye" then
						if v4 == "Color" then
							p1:SetEye(p2, v3[v4])
						end
						continue
					end
					p1["Set" .. v4](p1, p2, v)
				end
			end
			for k2, v4 in pairs({ "Transparency", "Reflectance" }) do
				if v3[v4] then
					p1["Set" .. v4](p1, p2, v)
				end
			end
		end
	end
	if p4 then
		return
	end
	if v1 then
		for k, v in pairs(p1.AllTraits) do
			p1:TraitAdded(v, k)
		end
	end
	if (p2:IsA("Attachment") and table.find(v14.BodyPartAttachRegions, p2.Name) or v1) and not p1.AttachmentPoints[p2.Name] then
		p1.AttachmentPoints[p2.Name] = p2
		for k, v in pairs(p1.AllEquipmentAndFlairs) do
			if v.ItemType == "Equipment" and not v.ToyEvent then
				for k2, v3 in pairs(v.Models) do
					if v3.AttachmentPoint == p2.Name then
						p1:CreateEquipment(k, k2, p2)
					end
				end
				continue
			end
			if v.ItemType == "Flairs" then
				p1:CreateFlair(k)
			end
		end
	end
	if not p2:IsA("Attachment") then
		return
	end
	local RootPart = p1.AnimalModel:FindFirstChild("RootPart")
	local v4 = if RootPart then p2:IsDescendantOf(RootPart) else RootPart
	for k, v in pairs(p1.AllEquipmentAndFlairs) do
		if v.ItemType == "Equipment" and (v.ToyEvent and v4) then
			local v5 = p1:GetToyAttachmentName(v)
			if v5 then
				for v6, v7 in p1.AllTraits do
					local v9 = type(v6.Value) == "string" and v6.Value or v6.Name
					if v9 ~= "" and v5 .. v9 == p2.Name then
						p1:CreateToyEquipment(k, p2)
						break
					end
				end
			end
		end
	end
end
function t.SetTransparency(p1, p2, p3) --[[ SetTransparency | Line: 1074 | Upvalues: v11 (copy) ]]
	local v1 = p1.BossCosmeticData and p1.BossCosmeticData[p3]
	if not v1 then
		local v2 = v11.GetTransparency(p1.TagRegionsToInstanceMap[p3].Transparency)
		v1 = if v2 then v2.Transparency else v2
	end
	if not p2:IsA("BasePart") then
		return
	end
	p2.Transparency = if v1 then v1 else p2.Transparency
end
function t.SetReflectance(p1, p2, p3) --[[ SetReflectance | Line: 1087 | Upvalues: v12 (copy) ]]
	local v1 = v12.GetReflectance(p1.TagRegionsToInstanceMap[p3].Reflectance)
	if not p2:IsA("BasePart") then
		return
	end
	p2.Reflectance = v1 and v1.Reflectance or p2.Reflectance
end
function t.SetEye(p1, p2, p3) --[[ SetEye | Line: 1095 | Upvalues: v14 (copy), v10 (copy), v13 (copy) ]]
	local v1 = v14.Eyes[p3] or v14.Eyes.DullBrown
	if p1.AddedMutations then
		local v2 = nil
		for v3, v4 in p1.AddedMutations do
			if v4.Mutation.EyeGlow then
				v2 = v4
				break
			end
			if table.find(v4.Mutation.Targets or {}, "Eye") then
				v2 = v4
				break
			end
		end
		if v2 then
			if v2.Mutation.EyeGlow then
				p2.Material = Enum.Material.Neon
				p2.Color = v2.Mutation.EyeColor
				p2.TextureID = ""
				return
			end
			if v2.Mutation.Eyecolor1 and v2.Mutation.Eyecolor2 then
				p2.Material = Enum.Material.Neon
				p2.Color = v2.Mutation.Eyecolor1
				p2.TextureID = ""
				return
			end
			if v2.Mutation.Texture then
				p2.TextureID = v2.Mutation.Texture
				p2.Color = v1.EyeTop or v10.new(0, 0, 0)
				p2.Material = v2.Mutation.Material
				return
			end
		end
	end
	v13.stop(p2, "Color")
	p2.TextureID = v1.Texture or ""
	p2.Color = v1.Color or v10.new(1, 1, 1)
	p2.Material = Enum.Material.SmoothPlastic
end
function t.SetColor(p1, p2, p3) --[[ SetColor | Line: 1138 | Upvalues: v10 (copy) ]]
	local v1 = nil
	for v2, v3 in p1.MutationCosmeticTypeRegionsMap do
		if p2:HasTag(v2) then
			v1 = v3()
			break
		end
	end
	if not v1 and p1.MutationTagRegionsMap[p3] then
		for i, v in ipairs(p1.MutationTagRegionsMap[p3]) do
			if v.Color then
				v1 = v.Color
				break
			end
		end
	end
	local v5 = if v1 then v1 else p1.TagRegionsToInstanceMap[p3].Color
	local v6 = if v5 == "" or v5 == nil then p2.Color else v10.fromHex(v5)
	if p2:IsA("Beam") then
		p2.Color = ColorSequence.new(v6)
		return
	end
	if p2:IsA("ParticleEmitter") or p2:IsA("Trail") then
		p2.Color = ColorSequence.new(v6)
	else
		if p2:IsA("BasePart") then
			p2.Color = v6
			return
		end
		if not p2:IsA("Texture") then
			return
		end
		p2.Color3 = v6
	end
end
function t.SetMaterial(p1, p2, p3) --[[ SetMaterial | Line: 1180 | Upvalues: v14 (copy), v3 (copy) ]]
	local v1 = p1.MutationTagRegionsMap[p3] and (p1.MutationTagRegionsMap[p3][1] and p1.MutationTagRegionsMap[p3][1].Material)
	local v2 = if v1 then v1 else p1.TagRegionsToInstanceMap[p3].Material
	if not v2 then
		return
	end
	if not p2:IsA("BasePart") then
		return
	end
	local v32 = v14.MutationMaterials[v2]
	if not v32 then
		v32 = v3.GetMaterial(v2, not p1.IsBoss and p1.SpeciesValue.Value)
	end
	local v5 = v2
	local v7 = nil
	if v32 and (if typeof(v32.Material) == "Instance" then true else false) then
		v7 = v32.Material
		v5 = v7.BaseMaterial
	elseif v32 then
		v5 = v32.Material
	end
	if v5 then
		p2.Material = v5
	else
		warn((("Failed to find material (\'%*\')"):format(v5)))
	end
	if not v7 then
		return
	end
	p2.MaterialVariant = v7.Name
end
function t.Init(p1) --[[ Init | Line: 1215 | Upvalues: v1 (copy), v14 (copy), t (copy) ]]
	v1.new(v14.AnimalWithCosmeticsTag, t):Init()
end
t:Init()
return t