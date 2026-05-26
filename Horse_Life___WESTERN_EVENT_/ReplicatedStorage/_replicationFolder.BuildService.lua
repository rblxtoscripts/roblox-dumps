-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("ItemReplicationService")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("Signal")
local v7 = Sonar("NoBuildZone")
local v8 = Sonar("MarketplaceUtils")
local v9 = Sonar("FormatString")
local v10 = Sonar("Building")
local v11 = v1 and Sonar("AnalyticsService")
local v12 = Sonar("StorageUtils")
local v13 = Sonar("Constants")
local v14 = Sonar(v12.Get("PlotPlacementSlots"))
local v15 = Sonar(v12.Get("BuildingStorageSlots"))
local v16 = Sonar(v12.Get("PlotSaveSlots"))
local v17 = Sonar(v12.Get("PlotSaveIcons"))
local LocalPlayer = game:GetService("Players").LocalPlayer
function t.GetTamesToUnlock() --[[ GetTamesToUnlock | Line: 40 ]]
	return 0
end
local function unpackStr(p1) --[[ unpackStr | Line: 44 ]]
	local v1, v2, v3, v4 = string.unpack("ffff", p1)
	return Vector3.new(v1, v2, v3), v4
end
local function filterText(p1, p2, p3) --[[ filterText | Line: 49 | Upvalues: v9 (copy), TextService (copy) ]]
	return TextService:FilterStringAsync(v9.trimString(v9.trimString(p2, p3), p3), p1.UserId, Enum.TextFilterContext.PublicChat):GetNonChatStringForUserAsync(p1.UserId)
end
function t.CanCraftBuilding(p1, p2) --[[ CanCraftBuilding | Line: 56 | Upvalues: v5 (copy), t (copy) ]]
	local v1 = v5.GetByName(p2)
	if not v1 then
		return
	end
	if not v1.Crafting then
		return "CannotCraftBuilding"
	end
	if v1.PlacementLimit and p1:GetTrackedItemValue(v1.Name).Value >= v1.PlacementLimit then
		return "CraftingLimitReached"
	end
	for k, v in pairs(v1.Crafting) do
		if not p1:HasEnoughOfItem(v, k) then
			return "CannotAffordToCraft"
		end
	end
	if not p1:CanGiveItem("Buildings") then
		return "AtBuildingLimit"
	end
	local v2 = t.CanPlaceBuilding(p1, v1.Name)
	if v2 == true then
		return true, v1
	else
		return v2
	end
end
function t.CanPlaceBuilding(p1, p2) --[[ CanPlaceBuilding | Line: 88 | Upvalues: v5 (copy) ]]
	local v1 = v5.GetByName(p2)
	if not v1 then
		return
	end
	if p1:GetTotalPlacedValue().Value >= p1:GetMaxPlacedBuildings() then
		return "CannotPlaceAnymore"
	end
	if v1.PlacementLimit and p1:GetTotalPlacedBuildingValue(p2).Value >= v1.PlacementLimit then
		return "PlacementLimitReached"
	else
		return true
	end
end
function t.CraftBuilding(p1, p2) --[[ CraftBuilding | Line: 105 | Upvalues: t (copy), v11 (copy) ]]
	local v1, v2 = t.CanCraftBuilding(p1, p2)
	if v1 ~= true then
		v11.ReportDesignEvent(p1.Player, "CraftBuilding", {
			{
				Key = "BuildingName",
				Value = p2
			},
			{
				Key = "Success",
				Value = false
			},
			{
				Key = "Message",
				Value = v1
			}
		}, 1)
		return
	end
	for k, v in pairs(v2.Crafting) do
		local v3 = p1:GetItemValue(k)
		v3.Value = v3.Value - v
		v11.ReportResourceEvent(p1.Player, "Sink", "Miscellaneous", k, "Crafting", v)
	end
	v11.ReportDesignEvent(p1.Player, "CraftBuilding", {
		{
			Key = "BuildingName",
			Value = p2
		},
		{
			Key = "Success",
			Value = true
		}
	}, 1)
	return p1:GiveItem({
		Amount = 1,
		Source = "Crafting",
		ItemType = v2.ItemType,
		Name = v2.Name
	})
end
function t.CanLoadPlot(p1) --[[ CanLoadPlot | Line: 135 ]]
	local v1 = (p1.NextPlotLoad or 0) - tick()
	if v1 > 0 then
		return "OnLoadCooldown", v1
	else
		return true
	end
end
function t.SetNextPlotCooldown(p1) --[[ SetNextPlotCooldown | Line: 144 ]]
	p1.NextPlotLoad = math.floor(tick() + 60)
end
function t.HasUnlockedBuilding(p1) --[[ HasUnlockedBuilding | Line: 148 ]]
	return true
end
function t.GetCustomName(p1) --[[ GetCustomName | Line: 152 ]]
	return #p1.CustomName.Value > 0 and p1.CustomName.Value or "Save Slot " .. p1.Name
end
function t.GetCustomIcon(p1) --[[ GetCustomIcon | Line: 157 | Upvalues: v17 (copy) ]]
	return v17[p1.Icon.Value] or v17[1]
end
function t.GetPlotCapacitySlotPurchase(p1) --[[ GetPlotCapacitySlotPurchase | Line: 161 | Upvalues: v14 (copy) ]]
	for k, v in pairs(v14) do
		if p1.PlayerData.PlotSaves.PlotPlacementTiersPurchased.Value < k then
			return v
		end
	end
end
function t.GetBuildingStorageSlotPurchase(p1) --[[ GetBuildingStorageSlotPurchase | Line: 169 | Upvalues: v15 (copy) ]]
	for k, v in pairs(v15) do
		if p1.PlayerData.PlotSaves.BuildingStorageTiersPurchased.Value < k then
			return v
		end
	end
end
function t.GetPlotSaveSlotPurchase(p1) --[[ GetPlotSaveSlotPurchase | Line: 177 | Upvalues: v16 (copy) ]]
	return v16[p1]
end
function t.Init(p1) --[[ Init | Line: 181 | Upvalues: v3 (copy), v14 (copy), ReplicatedStorage (copy), Sonar (copy), v10 (copy), v5 (copy), v1 (copy), v2 (copy), t (copy), v11 (copy), v4 (copy), v7 (copy), v13 (copy), v9 (copy), TextService (copy), v8 (copy), LocalPlayer (copy), v6 (copy) ]]
	function v3.DestroyPlot(p1) --[[ DestroyPlot | Line: 182 ]]
		for v1, v2 in p1.PlacedBuildingModels do
			if v2.Maid then
				v2.Maid:Destroy()
			end
		end
		p1.PlacedBuildingModels = {}
		local v3 = workspace.Terrain.Builds:FindFirstChild(p1.Player.Name)
		if v3 then
			v3:Destroy()
		end
		local v4 = workspace.Terrain:FindFirstChild(p1.Player.Name .. "_PlotMarker")
		if not v4 then
			return
		end
		v4:Destroy()
	end
	function v3.HasPlot(p1) --[[ HasPlot | Line: 201 ]]
		return workspace.Terrain.Builds:FindFirstChild(p1.Player.Name)
	end
	function v3.ClearPlot(p1, p2) --[[ ClearPlot | Line: 205 ]]
		for k, v in pairs(p1.PlacedBuildingModels) do
			if not p2 then
				v.DataValue.Value = ""
			end
			if v.Maid then
				v.Maid:Destroy()
			end
			v.Model:Destroy()
		end
		p1.PlacedBuildingModels = {}
		p1:SetLastEdit()
	end
	function v3.GetPlotSave(p1) --[[ GetPlotSave | Line: 220 ]]
		return math.clamp(p1.PlotSaveValue.Value, 1, 3)
	end
	function v3.GetPlotSaveData(p1, p2) --[[ GetPlotSaveData | Line: 224 ]]
		return p1.PlotSavesData:FindFirstChild(if p2 then p2 else p1:GetPlotSave())
	end
	function v3.SetLastEdit(p1, p2) --[[ SetLastEdit | Line: 229 ]]
		local LastEdit = p1:GetPlotSaveData(p2).LastEdit
		LastEdit.Value = math.floor((workspace:GetServerTimeNow()))
	end
	function v3.GetTotalPlacedBuildingValues(p1, p2) --[[ GetTotalPlacedBuildingValues | Line: 234 ]]
		local t = {}
		for k, v in pairs(p1.TrackedPlacedBuildings) do
			t[k] = v[p2].TotalPlacedValue
		end
		return t
	end
	function v3.GetTotalPlacedBuildingChangedSignals(p1, p2) --[[ GetTotalPlacedBuildingChangedSignals | Line: 242 ]]
		local t = {}
		for k, v in pairs(p1:GetTotalPlacedBuildingValues(p2)) do
			t[#t + 1] = v:GetPropertyChangedSignal("Value")
		end
		return t
	end
	function v3.GetTotalPlacedBuildingValue(p1, p2, p3) --[[ GetTotalPlacedBuildingValue | Line: 250 ]]
		return p1.TrackedPlacedBuildings[if p3 then p3 else p1:GetPlotSave()][p2].TotalPlacedValue
	end
	function v3.GetTotalRemainingBuilding(p1, p2) --[[ GetTotalRemainingBuilding | Line: 254 ]]
		return p1:GetTrackedItemValue(p2).Value - p1:GetTotalPlacedBuildingValue(p2).Value
	end
	function v3.GetUnplacedBuildingValue(p1, p2, p3) --[[ GetUnplacedBuildingValue | Line: 258 ]]
		local v2 = p1.TrackedPlacedBuildings[if p3 then p3 else p1:GetPlotSave()][p2]
		for k, v in pairs(v2.AllValues) do
			if not v2.Values[k] then
				return k
			end
		end
	end
	function v3.GetTotalPlacedValue(p1, p2) --[[ GetTotalPlacedValue | Line: 266 ]]
		return p1.TrackedPlotBuildings[if p2 then p2 else p1:GetPlotSave()].TotalPlacedValue
	end
	function v3.GetMaxPlacedBuildings(p1, p2) --[[ GetMaxPlacedBuildings | Line: 270 | Upvalues: v14 (ref) ]]
		local sum = 50
		for k, v in pairs(v14) do
			if not (k <= p1.PlotPlacementTiersPurchasedValue.Value) then
				break
			end
			sum = sum + v.Amount
		end
		return sum
	end
	for k, v in pairs(ReplicatedStorage.Storage.Items.Buildings:GetChildren()) do
		for k2, v12 in pairs(Sonar(v)) do
			v12.BuildingType = v12.BuildingType or v.Name
		end
	end
	local function PackVector3AndRotation(p1, p2, p3, p4) --[[ PackVector3AndRotation | Line: 291 ]]
		return string.format("%.3f", p1) .. "," .. string.format("%.3f", p2) .. "," .. string.format("%.3f", p3) .. "," .. string.format("%.0f", p4)
	end
	local function UnpackVector3AndRotation(p1) --[[ UnpackVector3AndRotation | Line: 303 ]]
		local t = {}
		for v1 in string.gmatch(p1, "[^,]+") do
			table.insert(t, (tonumber(v1)))
		end
		return t[1], t[2], t[3], t[4]
	end
	local function createBuilding(p1, p2, p3, p4) --[[ createBuilding | Line: 314 | Upvalues: ReplicatedStorage (ref), v10 (ref) ]]
		local InteractionType = p3.InteractionType
		if not InteractionType then
			return
		end
		local v1 = ReplicatedStorage.Storage.Buildings:FindFirstChild(InteractionType)
		if v1 then
			return v10.new(p2, {
				Player = p1.Player,
				Data = p3,
				DataValue = p4,
				BuildingClass = v1
			})
		end
	end
	local function makeBuilding(p1, p2, p3, p4, p5) --[[ makeBuilding | Line: 329 | Upvalues: createBuilding (copy) ]]
		local v1 = p2.Model:Clone()
		v1:PivotTo(p4)
		v1:SetAttribute("ID", (tonumber(p3.Name)))
		p1.PlacedBuildingModels[p3.Name] = {
			Model = v1,
			DataValue = p5,
			Maid = createBuilding(p1, v1, p2, p3)
		}
		v1.Parent = p1.Plot
	end
	local function LoadPlot(p1) --[[ LoadPlot | Line: 343 | Upvalues: v5 (ref), UnpackVector3AndRotation (copy), makeBuilding (copy) ]]
		if p1:GetPlotSaveData().LastEdit.Value <= 0 then
			p1:SetLastEdit()
		end
		for v1, v2 in p1.TrackedPlotBuildings[tonumber(p1.PlotSaveValue.Value)].Values do
			local v3 = v5.GetByName(v1.Value)
			if v3 then
				local v4 = v1[tostring(p1.PlotSaveValue.Value)]
				if v4.Value ~= "" then
					local v52, v6, v7, v8 = UnpackVector3AndRotation(v4.Value)
					makeBuilding(p1, v3, v1, p1.Plot.PrimaryPart.CFrame:ToWorldSpace(CFrame.new(v52, v6, v7) * CFrame.Angles(0, math.rad(v8), 0)), v4)
				end
			end
		end
	end
	local v22
	if v1 then
		local Builds = Instance.new("Folder", workspace.Terrain)
		Builds.Name = "Builds"
		for k, v in pairs(v5.GetType("Buildings")) do
			local Model = v.Model
			if Model then
				for v32, v42 in Model:GetDescendants() do
					local isPrimaryPart = v42 == Model.PrimaryPart
					if v42:IsA("BasePart") then
						v42.CanQuery = isPrimaryPart
						v42.CanTouch = false
					end
					if isPrimaryPart and v42:FindFirstChildOfClass("Attachment") then
						Model:AddTag("IgnoreSnaps")
					end
				end
				if v.Crafting then
					for k2, v12 in pairs(v.Crafting) do
						if not v5.GetByName(k2) then
							warn("No item data can be found for crafting", k, k2)
						end
					end
				end
			end
		end
		v2.GetRemoteFunction("CraftBuildingRemote").OnServerInvoke = function(p1, p2) --[[ Line: 390 | Upvalues: v3 (ref), t (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = t.CraftBuilding(v1, p2)
			if v2 then
				return v2.Name
			end
		end
		v2.GetRemoteFunction("SetBuildModeRemote").OnServerInvoke = function(p1, p2) --[[ Line: 400 | Upvalues: v3 (ref), v11 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = v1:SetActionState("BuildMode", p2)
			if p2 and v1.MinigameActive then
				return false
			end
			if v2 then
				local t = {}
				local t2 = {
					Key = "State"
				}
				t2.Value = if p2 then "Enter" else "Exit"
				t[1] = t2
				v11.ReportDesignEvent(p1, "BuildMode", t, 1)
			end
			return v2
		end
		v2.GetRemoteEvent("ClearBuildingCacheRemote").OnServerEvent:Connect(function(p1) --[[ Line: 416 | Upvalues: v3 (ref), v4 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if v1 then
				v4.ClearReplicatedItemsOfType(v1, "Buildings")
			end
		end)
		v2.GetRemoteFunction("ClearPlot").OnServerInvoke = function(p1) --[[ Line: 422 | Upvalues: v3 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if v1 then
				v1:ClearPlot()
				return true
			end
		end
		v2.GetRemoteFunction("RemovePlot").OnServerInvoke = function(p1) --[[ Line: 429 | Upvalues: v3 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if v1 then
				v1:DestroyPlot()
				return true
			end
		end
		v2.GetRemoteFunction("PlacePlot").OnServerInvoke = function(p1, p2, p3) --[[ Line: 436 | Upvalues: v3 (ref), t (ref), v7 (ref), ReplicatedStorage (ref), Builds (copy), LoadPlot (copy), v11 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not v1:IsInAction("BuildMode") then
				warn("Not in build mode")
				return
			end
			if v1:HasPlot() then
				return
			end
			if not t.HasUnlockedBuilding(v1) then
				return
			end
			local v2, v32, v4, v5 = string.unpack("ffff", p2)
			local v6 = Vector3.new(v2, v32, v4)
			if v7:IsInZone(v6) then
				return
			end
			local v72 = math.clamp(p3 or 1, 1, 3)
			local v8 = v1:GetPlotSaveData(v72)
			if v8 and v8.Unlocked.Value then
				v1:DestroyPlot()
				v1.PlotSaveValue.Value = math.clamp(v72, 1, 3)
				local v9 = CFrame.new(v6) * CFrame.Angles(0, v5, 0)
				local Model = Instance.new("Model")
				local v10 = ReplicatedStorage.Storage.Assets.Zone:Clone()
				v10.Parent = Model
				v10.Transparency = 1
				v10.Size = v10.Size * Vector3.new(1, 0, 1)
				Model.PrimaryPart = v10
				Model:PivotTo(v9)
				Model.Name = p1.Name
				Model.Parent = Builds
				v1.Plot = Model
				local Attachment = Instance.new("Attachment")
				Attachment:SetAttribute("MarkerType", "PlayerPlot")
				Attachment:SetAttribute("Size", 0.35)
				Attachment.Name = p1.Name .. "_PlotMarker"
				Attachment:AddTag("MinimapBlip")
				Attachment.CFrame = Model.PrimaryPart.CFrame
				Attachment.Parent = workspace.Terrain
				LoadPlot(v1)
				v11.ReportResourceEvent(p1, "Source", "Plot", "Overworld", "Plots", 1)
				return true
			end
		end
		v2.GetRemoteFunction("SwapPlot").OnServerInvoke = function(p1, p2) --[[ Line: 491 | Upvalues: v3 (ref), LoadPlot (copy) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not v1:IsInAction("BuildMode") then
				return
			end
			if not v1:HasPlot() then
				return
			end
			local v2 = math.clamp(p2 or 1, 1, 3)
			local v32 = v1:GetPlotSaveData(v2)
			if not (v32 and v32.Unlocked.Value) then
				return
			end
			if v1:GetPlotSave() == v2 then
			else
				v1.PlotSaveValue.Value = math.clamp(v2, 1, 3)
				v1:ClearPlot(true)
				LoadPlot(v1)
				return true
			end
		end
		v2.GetRemoteFunction("PlaceBuild").OnServerInvoke = function(p1, p2, p3) --[[ Line: 513 | Upvalues: v3 (ref), v5 (ref), t (ref), v11 (ref), makeBuilding (copy), PackVector3AndRotation (copy) ]]
			warn("PLACING BUILDING", p2, p3)
			local v1 = tostring(p3)
			local v2 = v3.getWrapperFromPlayer(p1)
			if not v2 then
				return
			end
			if not v2:IsInAction("BuildMode") then
				warn("Not in build mode")
				return
			end
			local v32 = v2:GetItemValue(v1, "Buildings")
			if not v32 then
				return
			end
			local v4 = v5.GetByName(v32.Value)
			if not v4 then
				return
			end
			local v52 = v32[tostring(v2.PlotSaveValue.Value)]
			local v6, v7, v8, v9 = string.unpack("ffff", p2)
			local v10 = Vector3.new(v6, v7, v8)
			local v112 = CFrame.new(v10) * CFrame.Angles(0, v9, 0)
			if #v52.Value > 0 and v2.PlacedBuildingModels[v1] then
				local v12 = v2.PlacedBuildingModels[v1]
				if not v12 then
					return
				end
				v12.Model:PivotTo(v112)
			else
				local v13 = t.CanPlaceBuilding(v2, v4.Name)
				if v13 ~= true then
					v11.ReportDesignEvent(v2.Player, "BuildingPlaced", {
						{
							Key = "BuildingName",
							Value = v4.Name
						},
						{
							Key = "Success",
							Value = false
						},
						{
							Key = "Message",
							Value = v13
						}
					}, 1)
					return
				end
				v11.ReportDesignEvent(v2.Player, "BuildingPlaced", {
					{
						Key = "BuildingName",
						Value = v4.Name
					},
					{
						Key = "Success",
						Value = true
					}
				}, 1)
				makeBuilding(v2, v4, v32, v112, v52)
			end
			local v14 = v2.Plot.PrimaryPart.CFrame:ToObjectSpace(v112)
			local Position = v14.Position
			local _, v15 = v14:ToOrientation()
			v52.Value = PackVector3AndRotation(Position.X, Position.Y, Position.Z, (math.deg(v15)))
			v2:SetLastEdit()
			return true
		end
		v2.GetRemoteFunction("RemoveBuild").OnServerInvoke = function(p1, p2) --[[ Line: 572 | Upvalues: v3 (ref) ]]
			local v1 = tostring(p2)
			local v2 = v3.getWrapperFromPlayer(p1)
			if not v2 then
				return
			end
			if not v2:IsInAction("BuildMode") then
				warn("Not in build mode")
				return
			end
			local v32 = v2.PlacedBuildingModels[v1]
			if not v32 then
				return
			end
			v32.DataValue.Value = ""
			if v32 then
				if v32.Maid then
					v32.Maid:Destroy()
				end
				v32.Model:Destroy()
			end
			v2.PlacedBuildingModels[v1] = nil
			v2:SetLastEdit()
			return true
		end
		v2.GetRemoteFunction("DeleteBuild").OnServerInvoke = function(p1, p2) --[[ Line: 598 | Upvalues: v3 (ref) ]]
			local v1 = tostring(p2)
			local v2 = v3.getWrapperFromPlayer(p1)
			if not v2 then
				return
			end
			if not v2:IsInAction("BuildMode") then
				warn("Not in build mode")
				return
			end
			local v32 = v2.PlacedBuildingModels[v1]
			if not v32 then
				return
			end
			local v4 = v2:GetItemValue(v1, "Buildings")
			if not v4 then
				return
			end
			v4:Destroy()
			v32.DataValue.Value = ""
			if v32 then
				if v32.Maid then
					v32.Maid:Destroy()
				end
				v32.Model:Destroy()
			end
			v2.PlacedBuildingModels[v1] = nil
			v2:SetLastEdit()
			return true
		end
		v2.GetRemoteFunction("EditBuildSave").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 631 | Upvalues: v3 (ref), v13 (ref), v9 (ref), TextService (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1):GetPlotSaveData(p2)
			if not v1 then
				return
			end
			local v2
			if #p3 > 0 then
				local MaxPlotSaveNameLength = v13.MaxPlotSaveNameLength
				v2 = TextService:FilterStringAsync(v9.trimString(v9.trimString(p3, MaxPlotSaveNameLength), MaxPlotSaveNameLength), p1.UserId, Enum.TextFilterContext.PublicChat):GetNonChatStringForUserAsync(p1.UserId) or ""
			else
				v2 = ""
			end
			v1.CustomName.Value = v2
			v1.Icon.Value = p4
			return true
		end
		v2.GetRemoteFunction("PurchaseBuildingStorageSlotsRemote").OnServerInvoke = function(p1) --[[ Line: 642 | Upvalues: v3 (ref), t (ref), v8 (ref), v11 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = t.GetBuildingStorageSlotPurchase(v1)
			if not v2 then
				return
			end
			if v2.ProductId then
				v8.PromptPurchase(p1, v2.ProductId)
			else
				local v32 = v1:CanAfford(v2.Price, v2.Currency)
				if not v32 then
					return
				end
				v32.Value = v32.Value - v2.Price
				v11.ReportResourceEvent(p1, "Sink", "Currency", v2.Currency, "BuildingStorageSlots", v2.Price)
				local BuildingStorageTiersPurchased = v1.PlayerData.PlotSaves.BuildingStorageTiersPurchased
				BuildingStorageTiersPurchased.Value = BuildingStorageTiersPurchased.Value + 1
			end
			return true
		end
		v2.GetRemoteFunction("PurchasePlotPlacementSlotsRemote").OnServerInvoke = function(p1) --[[ Line: 662 | Upvalues: v3 (ref), t (ref), v8 (ref), v11 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = t.GetPlotCapacitySlotPurchase(v1)
			if not v2 then
				return
			end
			if v2.ProductId then
				v8.PromptPurchase(p1, v2.ProductId)
			else
				local v32 = v1:CanAfford(v2.Price, v2.Currency)
				if not v32 then
					return
				end
				v32.Value = v32.Value - v2.Price
				v11.ReportResourceEvent(p1, "Sink", "Currency", v2.Currency, "PlotPlacementSlots", v2.Price)
				local PlotPlacementTiersPurchased = v1.PlayerData.PlotSaves.PlotPlacementTiersPurchased
				PlotPlacementTiersPurchased.Value = PlotPlacementTiersPurchased.Value + 1
			end
			return true
		end
		v2.GetRemoteFunction("PurchasePlotSaveSlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 682 | Upvalues: v3 (ref), t (ref), v8 (ref), v11 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = t.GetPlotSaveSlotPurchase(p2)
			if not v2 then
				return
			end
			local v32 = v1:GetPlotSaveData(p2)
			if not v32 or v32.Unlocked.Value then
				return
			end
			if v2.ProductId then
				v8.PromptPurchase(p1, v2.ProductId)
			else
				local v4 = v1:CanAfford(v2.Price, v2.Currency)
				if not v4 then
					return
				end
				if v2.Stats then
					for k, v in pairs(v2.Stats) do
						if v1:GetStatValue(k).Value < v then
							return
						end
					end
				end
				v4.Value = v4.Value - v2.Price
				v11.ReportResourceEvent(p1, "Sink", "Currency", v2.Currency, "PlotSaveSlots", v2.Price)
				v32.Unlocked.Value = true
			end
			return true
		end
		v8.AddProductHandler("PlotSaveSlot", function(p1, p2) --[[ Line: 714 ]]
			p1:GetPlotSaveData(p2.SaveSlotIndex).Unlocked.Value = true
			local t = {
				ItemType = "PlotSaveSlot"
			}
			t.ItemId = tostring(p2.SaveSlotIndex)
			return t
		end)
		v8.AddProductHandler("BuildingStorageSlots", function(p1, p2) --[[ Line: 720 ]]
			local BuildingStorageTiersPurchased = p1.PlayerData.PlotSaves.BuildingStorageTiersPurchased
			BuildingStorageTiersPurchased.Value = BuildingStorageTiersPurchased.Value + 1
			local t = {
				ItemType = "BuildingStorageSlots"
			}
			t.ItemId = tostring(p2.Index)
			return t
		end)
		v8.AddProductHandler("PlotPlacementSlots", function(p1, p2) --[[ Line: 725 ]]
			local PlotPlacementTiersPurchased = p1.PlayerData.PlotSaves.PlotPlacementTiersPurchased
			PlotPlacementTiersPurchased.Value = PlotPlacementTiersPurchased.Value + 1
			local t = {
				ItemType = "PlotPlacementSlots"
			}
			t.ItemId = tostring(p2.Index)
			return t
		end)
	end
	v22 = function(p1) --[[ playerAdded | Line: 731 | Upvalues: v3 (ref), v1 (ref), LocalPlayer (ref), v6 (ref), v5 (ref) ]]
		local v12 = v3.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		if not v1 and p1 ~= LocalPlayer then
			return
		end
		v12.PlotSaveValue = v12.PlotSavesData:WaitForChild("CurrentSave")
		v12.PlotSaveChangedSignal = v12.PlotSaveValue:GetPropertyChangedSignal("Value")
		if v1 then
			v12.PlacedBuildingModels = {}
			table.insert(v12.OnRemoved, function() --[[ Line: 742 | Upvalues: v12 (copy) ]]
				v12:DestroyPlot()
			end)
		end
		v12.PlotPlacementTiersPurchasedValue = v12.PlotSavesData.PlotPlacementTiersPurchased
		local v2 = v6.new()
		for k, v in pairs({ v12.PlotPlacementTiersPurchasedValue:GetPropertyChangedSignal("Value") }) do
			v12.Maid:GiveTask(v:Connect(function() --[[ Line: 751 | Upvalues: v2 (copy) ]]
				v2:Fire()
			end))
		end
		v12.MaxPlacementChangedSignal = v2
		v12.TrackedPlotBuildings = {}
		v12.TrackedPlacedBuildings = {}
		local v32 = v6.new()
		for i = 1, 3 do
			local v4 = Instance.new("IntValue")
			v12.TrackedPlotBuildings[i] = {
				Values = {},
				TotalPlacedValue = v4
			}
			v12.Maid:GiveTask(v4:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 767 | Upvalues: v32 (copy) ]]
				v32:Fire()
			end))
			v12.TrackedPlacedBuildings[i] = {}
			for k, v in pairs(v5.GetType("Buildings")) do
				v12.TrackedPlacedBuildings[i][v.Name] = {
					Values = {},
					AllValues = {},
					TotalPlacedValue = Instance.new("IntValue")
				}
			end
		end
		v12.Maid:GiveTask(v12.PlotSaveChangedSignal:Connect(function() --[[ Line: 779 | Upvalues: v12 (copy) ]]
			v12.TotalPlacedChangedSignal:Fire()
		end))
		v12.TotalPlacedChangedSignal = v32
		local function removePlacement(p1, p2) --[[ removePlacement | Line: 784 | Upvalues: v12 (copy) ]]
			local v1 = v12.TrackedPlotBuildings[p2]
			if v1 then
				if v1.Values[p1] then
					local TotalPlacedValue = v1.TotalPlacedValue
					TotalPlacedValue.Value = TotalPlacedValue.Value - 1
				end
				v1.Values[p1] = nil
			end
			local v2 = v12.TrackedPlacedBuildings[p2][p1.Value]
			if not v2 then
				return
			end
			if v2.Values[p1] then
				local TotalPlacedValue = v2.TotalPlacedValue
				TotalPlacedValue.Value = TotalPlacedValue.Value - 1
			end
			v2.Values[p1] = nil
		end
		local function addPlacement(p1, p2, p3) --[[ addPlacement | Line: 802 | Upvalues: v12 (copy) ]]
			local v1 = v12.TrackedPlotBuildings[p2]
			if v1 then
				if not v1.Values[p1] then
					local TotalPlacedValue = v1.TotalPlacedValue
					TotalPlacedValue.Value = TotalPlacedValue.Value + 1
				end
				v1.Values[p1] = true
			end
			local v2 = v12.TrackedPlacedBuildings[p2][p1.Value]
			if not v2 then
				return
			end
			if not v2.Values[p1] then
				local TotalPlacedValue = v2.TotalPlacedValue
				TotalPlacedValue.Value = TotalPlacedValue.Value + 1
			end
			v2.Values[p1] = true
		end
		local function trackItem(p12, p2) --[[ trackItem | Line: 820 | Upvalues: v12 (copy), p1 (copy), addPlacement (copy) ]]
			if not p2 then
				task.wait()
			end
			for k, v in pairs(p12:GetChildren()) do
				local TrackedPlacedBuildings = v12.TrackedPlacedBuildings
				local v2 = TrackedPlacedBuildings[tonumber(v.Name)][p12.Value]
				if v2 then
					if p2 and v.Value == "filled" then
						v.Value = ""
					end
					v.AncestryChanged:Connect(function() --[[ Line: 830 | Upvalues: p12 (copy), p1 (ref), v2 (copy), v (copy), v12 (ref) ]]
						if p12.Parent then
							return
						end
						if not p1.Parent then
							return
						end
						v2.AllValues[p12] = nil
						local v1 = p12
						local v3 = tonumber(v.Name)
						local v4 = v12.TrackedPlotBuildings[v3]
						if v4 then
							if v4.Values[v1] then
								local TotalPlacedValue = v4.TotalPlacedValue
								TotalPlacedValue.Value = TotalPlacedValue.Value - 1
							end
							v4.Values[v1] = nil
						end
						local v5 = v12.TrackedPlacedBuildings[v3][v1.Value]
						if not v5 then
							return
						end
						if v5.Values[v1] then
							local TotalPlacedValue = v5.TotalPlacedValue
							TotalPlacedValue.Value = TotalPlacedValue.Value - 1
						end
						v5.Values[v1] = nil
					end)
					v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 836 | Upvalues: v (copy), p12 (copy), v12 (ref), addPlacement (ref) ]]
						if #v.Value <= 0 then
							local v1 = p12
							local v3 = tonumber(v.Name)
							local v4 = v12.TrackedPlotBuildings[v3]
							if v4 then
								if v4.Values[v1] then
									local TotalPlacedValue = v4.TotalPlacedValue
									TotalPlacedValue.Value = TotalPlacedValue.Value - 1
								end
								v4.Values[v1] = nil
							end
							local v5 = v12.TrackedPlacedBuildings[v3][v1.Value]
							if not v5 then
								return
							end
							if v5.Values[v1] then
								local TotalPlacedValue = v5.TotalPlacedValue
								TotalPlacedValue.Value = TotalPlacedValue.Value - 1
							end
							v5.Values[v1] = nil
							return
						end
						addPlacement(p12, (tonumber(v.Name)))
					end)
					v2.AllValues[p12] = true
					if #v.Value > 0 then
						addPlacement(p12, tonumber(v.Name), true)
					end
				end
			end
		end
		v12.Maid:GiveTask(v12:GetItemFolder("Buildings").ChildAdded:Connect(trackItem))
		for k, v in pairs(v12:GetItemFolder("Buildings"):GetChildren()) do
			trackItem(v, true)
		end
	end
	v3.bindToPlayers(v22)
end
t:Init()
return t