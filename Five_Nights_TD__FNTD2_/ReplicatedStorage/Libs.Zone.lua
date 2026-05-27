-- https://lua.expert/
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local PreSimulation = RunService.PreSimulation
local v1 = RunService:IsClient() and Players.LocalPlayer
game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local enums = require(script.Enum).enums
local Janitor = require(script.Janitor)
local Signal = require(script.Signal)
local ZonePlusReference = require(script.ZonePlusReference)
local v2 = ZonePlusReference.getObject()
local ZoneController = script.ZoneController
local Tracker = ZoneController.Tracker
local CollectiveWorldModel = ZoneController.CollectiveWorldModel
local v3 = require(ZoneController)
local v5 = if v2 then v2:FindFirstChild(if RunService:IsClient() then "Client" else "Server") else v2
if v5 then
	return require(v2.Value)
end
debug.setmemorycategory("ZonePlus")
local t = {}
t.__index = t
local _, v6
if v5 then
	t.enum = enums
	function t.new(p1_2) --[[ new | Line: 38 | Upvalues: t (copy), enums (copy), Janitor (copy), HttpService (copy), v3 (copy), Signal (copy), v1 (copy) ]]
		local v2 = setmetatable({}, t)
		local v32 = typeof(p1_2)
		if v32 ~= "table" and v32 ~= "Instance" then
			error("The zone container must be a model, folder, basepart or table!")
		end
		debug.setmemorycategory("Zone." .. p1_2.Name)
		v2.accuracy = enums.Accuracy.High
		v2.autoUpdate = true
		v2.respectUpdateQueue = true
		local v4 = Janitor.new()
		v2.janitor = v4
		v2._updateConnections = v4:Add(Janitor.new(), "Destroy")
		v2.container = p1_2
		v2.zoneParts = {}
		v2.overlapParams = {}
		v2.region = nil
		v2.volume = nil
		v2.boundMin = nil
		v2.boundMax = nil
		v2.recommendedMaxParts = nil
		v2.zoneId = HttpService:GenerateGUID()
		v2.activeTriggers = {}
		v2.occupants = {}
		v2.trackingTouchedTriggers = {}
		v2.enterDetection = enums.Detection.Centre
		v2.exitDetection = enums.Detection.Centre
		v2._currentEnterDetection = nil
		v2._currentExitDetection = nil
		v2.totalPartVolume = 0
		v2.allZonePartsAreBlocks = true
		v2.trackedItems = {}
		v2.settingsGroupName = nil
		v2.worldModel = game:GetService("Workspace")
		v2.onItemDetails = {}
		v2.itemsToUntrack = {}
		v2.destroyed = false
		v3.updateDetection(v2)
		v2.updated = v4:Add(Signal.new(), "Destroy")
		local tbl2 = { "player", "part", "localPlayer", "item" }
		local tbl2_2 = { "entered", "exited" }
		for k2, v in pairs(tbl2) do
			local v5 = 0
			local v6 = 0
			for k2_2, v8 in pairs(tbl2_2) do
				local v72 = v4:Add(Signal.new(true), "Destroy")
				local v8_2 = v8:sub(1, 1):upper() .. v8:sub(2)
				v2[v .. v8_2] = v72
				v72.connectionsChanged:Connect(function(p1_2) --[[ Line: 111 | Upvalues: v (copy), v1 (ref), v8_2 (copy), v5 (ref), v6 (ref), v3 (ref), v2 (copy) ]]
					if v == "localPlayer" and (not v1 and p1_2 == 1) then
						error(("Can only connect to \'localPlayer%s\' on the client!"):format(v8_2))
					end
					v5 = v6
					v6 = v6 + p1_2
					if v5 == 0 and v6 > 0 then
						v3._registerConnection(v2, v, v8_2)
						return
					end
					if not (v5 > 0) or v6 ~= 0 then
						return
					end
					v3._deregisterConnection(v2, v)
				end)
			end
		end
		t.touchedConnectionActions = {}
		for k2, v in pairs(tbl2) do
			local v9 = v2[("_%sTouchedZone"):format(v)]
			if v9 then
				v2.trackingTouchedTriggers[v] = {}
				t.touchedConnectionActions[v] = function(p1_2) --[[ Line: 135 | Upvalues: v9 (copy), v2 (copy) ]]
					v9(v2, p1_2)
				end
			end
		end
		v2:_update()
		v3._registerZone(v2)
		v4:Add(function() --[[ Line: 147 | Upvalues: v3 (ref), v2 (copy) ]]
			v3._deregisterZone(v2)
		end, true)
		v4:Add(function() --[[ Line: 151 | Upvalues: v2 (copy) ]]
			v2.destroyed = true
		end, true)
		for v122, v13_2 in pairs(if typeof(p1_2) == "Instance" then { p1_2 } else p1_2) do
			v13_2.Destroying:Once(function() --[[ Line: 158 | Upvalues: v2 (copy) ]]
				if not v2.destroy or v2.destroyed then
					return
				end
				v2:Destroy()
			end)
		end
		return v2
	end
	function t.fromRegion(p1_2, p2_2) --[[ fromRegion | Line: 168 | Upvalues: t (copy) ]]
		local Model = Instance.new("Model")
		local function v1(p1_2, p2_2) --[[ createCube | Line: 171 | Upvalues: v1 (copy), Model (copy) ]]
			if not (p2_2.X > 2024 or (p2_2.Y > 2024 or p2_2.Z > 2024)) then
				local Part = Instance.new("Part")
				Part.CFrame = p1_2
				Part.Size = p2_2
				Part.Anchored = true
				Part.Parent = Model
				return
			end
			local v12 = p2_2 * 0.25
			local v2 = p2_2 * 0.5
			v1(p1_2 * CFrame.new(-v12.X, -v12.Y, -v12.Z), v2)
			v1(p1_2 * CFrame.new(-v12.X, -v12.Y, v12.Z), v2)
			v1(p1_2 * CFrame.new(-v12.X, v12.Y, -v12.Z), v2)
			v1(p1_2 * CFrame.new(-v12.X, v12.Y, v12.Z), v2)
			v1(p1_2 * CFrame.new(v12.X, -v12.Y, -v12.Z), v2)
			v1(p1_2 * CFrame.new(v12.X, -v12.Y, v12.Z), v2)
			v1(p1_2 * CFrame.new(v12.X, v12.Y, -v12.Z), v2)
			v1(p1_2 * CFrame.new(v12.X, v12.Y, v12.Z), v2)
		end
		v1(p1_2, p2_2)
		local v2 = t.new(Model)
		v2:relocate()
		return v2
	end
	function t._calculateRegion(p1_2, p2_2, p3_2) --[[ _calculateRegion | Line: 199 ]]
		local tbl2 = {
			Min = {},
			Max = {}
		}
		for k2, v in pairs(tbl2) do
			v.Values = {}
			function v.parseCheck(p1_2, p2_2) --[[ parseCheck | Line: 203 | Upvalues: k2 (copy) ]]
				if k2 == "Min" then
					return p1_2 <= p2_2
				else
					if k2 ~= "Max" then
						return
					end
					return p2_2 <= p1_2
				end
			end
			function v.parse(p1_2, p2_2) --[[ parse | Line: 210 ]]
				for k2, v in pairs(p2_2) do
					if p1_2.parseCheck(v, p1_2.Values[k2] or v) then
						p1_2.Values[k2] = v
					end
				end
			end
		end
		for k2, v in pairs(p2_2) do
			local v1 = v.Size * 0.5
			for k2_2, v3 in pairs({
				v.CFrame * CFrame.new(-v1.X, -v1.Y, -v1.Z),
				v.CFrame * CFrame.new(-v1.X, -v1.Y, v1.Z),
				v.CFrame * CFrame.new(-v1.X, v1.Y, -v1.Z),
				v.CFrame * CFrame.new(-v1.X, v1.Y, v1.Z),
				v.CFrame * CFrame.new(v1.X, -v1.Y, -v1.Z),
				v.CFrame * CFrame.new(v1.X, -v1.Y, v1.Z),
				v.CFrame * CFrame.new(v1.X, v1.Y, -v1.Z),
				v.CFrame * CFrame.new(v1.X, v1.Y, v1.Z)
			}) do
				local v22, v3_2, v4 = v3:GetComponents()
				local t2 = { v22, v3_2, v4 }
				tbl2.Min:parse(t2)
				tbl2.Max:parse(t2)
			end
		end
		local function roundToFour(p1_2) --[[ roundToFour | Line: 242 ]]
			return math.floor((p1_2 + 2) / 4) * 4
		end
		local t2 = {}
		local t2_2 = {}
		for k2, v in pairs(tbl2) do
			for k2_2, v3 in pairs(v.Values) do
				local v5, v6
				v5 = if k2 == "Min" and t2 then t2 else t2_2
				v6 = if p3_2 then v3 else math.floor((v3 + (if k2 == "Min" then -2 else 2) + 2) / 4) * 4
				table.insert(v5, v6)
			end
		end
		local v10 = Vector3.new(unpack(t2))
		local v12 = Vector3.new(unpack(t2_2))
		return Region3.new(v10, v12), v10, v12
	end
	function t._displayBounds(p1_2) --[[ _displayBounds | Line: 265 ]]
		if p1_2.displayBoundParts then
			return
		end
		p1_2.displayBoundParts = true
		for k2, v in pairs({
			BoundMin = p1_2.boundMin,
			BoundMax = p1_2.boundMax
		}) do
			local Part = Instance.new("Part")
			Part.Anchored = true
			Part.CanCollide = false
			Part.Transparency = 0.5
			Part.Size = Vector3.new(1, 1, 1)
			Part.Color = Color3.fromRGB(255, 0, 0)
			Part.CFrame = CFrame.new(v)
			Part.Name = k2
			Part.Parent = workspace
			p1_2.janitor:Add(Part, "Destroy")
		end
	end
	function t._update(p1_2) --[[ _update | Line: 284 | Upvalues: RunService (copy), PreSimulation (copy) ]]
		local container = p1_2.container
		local tbl2 = {}
		local v1 = 0
		p1_2._updateConnections:Cleanup()
		local v2 = typeof(container)
		local tbl2_2 = {}
		if v2 == "table" then
			for k2, v in pairs(container) do
				if v:IsA("BasePart") then
					table.insert(tbl2, v)
				end
			end
		elseif v2 == "Instance" and container:IsA("BasePart") then
			table.insert(tbl2, container)
		elseif v2 == "Instance" then
			table.insert(tbl2_2, container)
			for k2, v in pairs(container:GetDescendants()) do
				if v:IsA("BasePart") then
					table.insert(tbl2, v)
					continue
				end
				table.insert(tbl2_2, v)
			end
		end
		p1_2.zoneParts = tbl2
		p1_2.overlapParams = {}
		local v3 = true
		for k2, v in pairs(tbl2) do
			local _, v4 = pcall(function() --[[ Line: 319 | Upvalues: v (copy) ]]
				return v.Shape.Name
			end)
			if v4 ~= "Block" then
				v3 = false
			end
		end
		p1_2.allZonePartsAreBlocks = v3
		local v5 = OverlapParams.new()
		v5.FilterType = Enum.RaycastFilterType.Include
		v5.MaxParts = #tbl2
		v5.FilterDescendantsInstances = tbl2
		p1_2.overlapParams.zonePartsWhitelist = v5
		local v6 = OverlapParams.new()
		v6.FilterType = Enum.RaycastFilterType.Exclude
		v6.FilterDescendantsInstances = tbl2
		p1_2.overlapParams.zonePartsIgnorelist = v6
		local function update() --[[ update | Line: 339 | Upvalues: p1_2 (copy), v1 (ref), RunService (ref), PreSimulation (ref) ]]
			if not p1_2.autoUpdate then
				return
			end
			local sum_2 = os.clock()
			if p1_2.respectUpdateQueue then
				v1 = v1 + 1
				sum_2 = sum_2 + 0.1
			end
			local v12 = nil
			if RunService:IsClient() then
				local _ = RunService.PreRender:Connect(function() --[[ Line: 348 | Upvalues: sum_2 (ref), v12 (ref), p1_2 (ref), v1 (ref) ]]
					if not (sum_2 <= os.clock()) then
						return
					end
					v12:Disconnect()
					if p1_2.respectUpdateQueue then
						v1 = v1 - 1
					end
					if v1 ~= 0 or not p1_2.zoneId then
						return
					end
					p1_2:_update()
				end)
			else
				local _ = PreSimulation:Connect(function() --[[ Line: 360 | Upvalues: sum_2 (ref), v12 (ref), p1_2 (ref), v1 (ref) ]]
					if not (sum_2 <= os.clock()) then
						return
					end
					v12:Disconnect()
					if p1_2.respectUpdateQueue then
						v1 = v1 - 1
					end
					if v1 ~= 0 or not p1_2.zoneId then
						return
					end
					p1_2:_update()
				end)
			end
		end
		local function verifyDefaultCollision(p1_2) --[[ verifyDefaultCollision | Line: 375 ]]
			if p1_2.CollisionGroupId == 0 then
				return
			end
			error("Zone parts must belong to the \'Default\' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.")
		end
		local tbl3 = { "Size", "Position" }
		for k2, v in pairs(tbl2) do
			for k2_2, v7 in pairs(tbl3) do
				p1_2._updateConnections:Add(v:GetPropertyChangedSignal(v7):Connect(update), "Disconnect")
			end
			if v.CollisionGroupId ~= 0 then
				error("Zone parts must belong to the \'Default\' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.")
			end
			p1_2._updateConnections:Add(v:GetPropertyChangedSignal("CollisionGroupId"):Connect(function() --[[ Line: 385 | Upvalues: v (copy) ]]
				if v.CollisionGroupId == 0 then
					return
				end
				error("Zone parts must belong to the \'Default\' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.")
			end), "Disconnect")
		end
		local tbl4 = { "ChildAdded", "ChildRemoved" }
		for k2, v in pairs(tbl2_2) do
			for k2_2, v7 in pairs(tbl4) do
				p1_2._updateConnections:Add(p1_2.container[v7]:Connect(function(p1_2) --[[ Line: 392 | Upvalues: update (copy) ]]
					if not p1_2:IsA("BasePart") then
						return
					end
					update()
				end), "Disconnect")
			end
		end
		local v7, v8, v9 = p1_2:_calculateRegion(tbl2)
		local v10, _, _2_2 = p1_2:_calculateRegion(tbl2, true)
		p1_2.region = v7
		p1_2.exactRegion = v10
		p1_2.boundMin = v8
		p1_2.boundMax = v9
		local Size = v7.Size
		p1_2.volume = Size.X * Size.Y * Size.Z
		p1_2:_updateTouchedConnections()
		p1_2.updated:Fire()
	end
	function t._updateOccupants(p1_2, p2_2, p3_2) --[[ _updateOccupants | Line: 428 ]]
		local v1 = p1_2.occupants[p2_2]
		if not v1 then
			v1 = {}
			p1_2.occupants[p2_2] = v1
		end
		local t2 = {}
		for k2, v in pairs(v1) do
			local v2 = p3_2[k2]
			if v2 == nil or v2 ~= v then
				v1[k2] = nil
				if not t2.exited then
					t2.exited = {}
				end
				table.insert(t2.exited, k2)
			end
		end
		for k2, v in pairs(p3_2) do
			if v1[k2] == nil then
				v1[k2] = k2:IsA("Player") and k2.Character or true
				if not t2.entered then
					t2.entered = {}
				end
				table.insert(t2.entered, k2)
			end
		end
		return t2
	end
	function t._formTouchedConnection(p1_2, p2_2) --[[ _formTouchedConnection | Line: 458 | Upvalues: Janitor (copy) ]]
		local v1 = "_touchedJanitor" .. p2_2
		local v2 = p1_2[v1]
		if v2 then
			v2:Cleanup()
		else
			p1_2[v1] = p1_2.janitor:Add(Janitor.new(), "Destroy")
		end
		p1_2:_updateTouchedConnection(p2_2)
	end
	function t._updateTouchedConnection(p1_2, p2_2) --[[ _updateTouchedConnection | Line: 470 ]]
		local v1 = p1_2["_touchedJanitor" .. p2_2]
		if not v1 then
			return
		end
		for k2, v in pairs(p1_2.zoneParts) do
			v1:Add(v.Touched:Connect(p1_2.touchedConnectionActions[p2_2], p1_2), "Disconnect")
		end
	end
	function t._updateTouchedConnections(p1_2) --[[ _updateTouchedConnections | Line: 479 ]]
		for k2, v in pairs(p1_2.touchedConnectionActions) do
			local v1 = p1_2["_touchedJanitor" .. k2]
			if v1 then
				v1:Cleanup()
				p1_2:_updateTouchedConnection(k2)
			end
		end
	end
	function t._disconnectTouchedConnection(p1_2, p2_2) --[[ _disconnectTouchedConnection | Line: 490 ]]
		local v1 = "_touchedJanitor" .. p2_2
		local v2 = p1_2[v1]
		if not v2 then
			return
		end
		v2:Cleanup()
		p1_2[v1] = nil
	end
	_ = function(p1_2, p2_2) --[[ round | Line: 499 ]]
		return math.round(p1_2 * 10 ^ p2_2) * 10 ^ (-p2_2)
	end
	function t._partTouchedZone(p1_2, p2_2) --[[ _partTouchedZone | Line: 503 | Upvalues: Janitor (copy), PreSimulation (copy), enums (copy) ]]
		local part = p1_2.trackingTouchedTriggers.part
		if part[p2_2] then
			return
		end
		local v1 = 0
		local v2 = false
		local Position = p2_2.Position
		local v3 = os.clock()
		local v4 = p1_2.janitor:Add(Janitor.new(), "Destroy")
		part[p2_2] = v4
		if not ({
			Seat = true,
			VehicleSeat = true
		})[p2_2.ClassName] and ({
			HumanoidRootPart = true
		})[p2_2.Name] then
			p2_2.CanTouch = false
		end
		local v6 = math.round(p2_2.Size.X * p2_2.Size.Y * p2_2.Size.Z * 100000) * 0.00001
		p1_2.totalPartVolume = p1_2.totalPartVolume + v6
		v4:Add(PreSimulation:Connect(function() --[[ Line: 521 | Upvalues: v1 (ref), enums (ref), p1_2 (copy), p2_2 (copy), v2 (ref), Position (ref), v3 (ref), v4 (copy) ]]
			local v12 = os.clock()
			if not (v1 <= v12) then
				return
			end
			local v22 = enums.Accuracy.getProperty(p1_2.accuracy)
			v1 = v12 + v22
			local v32 = p1_2:findPoint(p2_2.CFrame)
			if not v32 then
				v32 = p1_2:findPart(p2_2)
			end
			if v2 then
				if v32 then
					return
				end
				v2 = false
				Position = p2_2.Position
				v3 = os.clock()
				p1_2.partExited:Fire(p2_2)
			else
				if v32 then
					v2 = true
					p1_2.partEntered:Fire(p2_2)
					return
				end
				if (p2_2.Position - Position).Magnitude > 1.5 and v22 <= v12 - v3 then
					v4:Cleanup()
				end
			end
		end), "Disconnect")
		v4:Add(function() --[[ Line: 552 | Upvalues: part (copy), p2_2 (copy), p1_2 (copy), v6 (copy) ]]
			part[p2_2] = nil
			p2_2.CanTouch = true
			p1_2.totalPartVolume = math.round((p1_2.totalPartVolume - v6) * 100000) * 0.00001
		end, true)
	end
	v6 = {
		Ball = function(p1_2) --[[ Line: 560 ]]
			return "GetPartBoundsInRadius", { p1_2.Position, p1_2.Size.X }
		end,
		Block = function(p1_2) --[[ Line: 563 ]]
			return "GetPartBoundsInBox", { p1_2.CFrame, p1_2.Size }
		end,
		Other = function(p1_2) --[[ Line: 566 ]]
			return "GetPartsInPart", { p1_2 }
		end
	}
	function t._getRegionConstructor(p1_2, p2_2, p3_2) --[[ _getRegionConstructor | Line: 570 | Upvalues: v6 (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 571 | Upvalues: p2_2 (copy) ]]
			return p2_2.Shape.Name
		end)
		local v3 = nil
		local v4 = nil
		if v1 and p1_2.allZonePartsAreBlocks then
			local v5 = v6[v2]
			if v5 then
				local v62, v7 = v5(p2_2)
				v3 = v62
				v4 = v7
			end
		end
		if not v3 then
			local v8, v9 = v6.Other(p2_2)
			v4 = v9
			v3 = v8
		end
		if p3_2 then
			table.insert(v4, p3_2)
		end
		return v3, v4
	end
	function t.findLocalPlayer(p1_2) --[[ findLocalPlayer | Line: 591 | Upvalues: v1 (copy) ]]
		if v1 then
			return p1_2:findPlayer(v1)
		end
		error("Can only call \'findLocalPlayer\' on the client!")
	end
	function t._find(p1_2, p2_2, p3_2) --[[ _find | Line: 598 | Upvalues: v3 (copy) ]]
		v3.updateDetection(p1_2)
		for k2, v in pairs((v3.getTouchingZones(p3_2, false, p1_2._currentEnterDetection, v3.trackers[p2_2]))) do
			if v == p1_2 then
				return true
			end
		end
		return false
	end
	function t.findPlayer(p1_2, p2_2) --[[ findPlayer | Line: 610 ]]
		local Character = p2_2.Character
		if if Character then Character:FindFirstChildOfClass("Humanoid") else Character then
			return p1_2:_find("player", p2_2.Character)
		else
			return false
		end
	end
	function t.findItem(p1_2, p2_2) --[[ findItem | Line: 619 ]]
		return p1_2:_find("item", p2_2)
	end
	function t.findPart(p1_2, p2_2) --[[ findPart | Line: 623 ]]
		local v1, v2 = p1_2:_getRegionConstructor(p2_2, p1_2.overlapParams.zonePartsWhitelist)
		local v3 = p1_2.worldModel[v1](p1_2.worldModel, unpack(v2))
		if #v3 > 0 then
			return true, v3
		else
			return false
		end
	end
	function t.getCheckerPart(p1_2) --[[ getCheckerPart | Line: 633 | Upvalues: v3 (copy) ]]
		local checkerPart = p1_2.checkerPart
		if not checkerPart then
			local ZonePlusCheckerPart = p1_2.janitor:Add(Instance.new("Part"), "Destroy")
			ZonePlusCheckerPart.Size = Vector3.new(0.1, 0.1, 0.1)
			ZonePlusCheckerPart.Name = "ZonePlusCheckerPart"
			ZonePlusCheckerPart.Anchored = true
			ZonePlusCheckerPart.Transparency = 1
			ZonePlusCheckerPart.CanCollide = false
			p1_2.checkerPart = ZonePlusCheckerPart
			checkerPart = ZonePlusCheckerPart
		end
		local worldModel = p1_2.worldModel
		if worldModel == workspace then
			worldModel = v3.getWorkspaceContainer()
		end
		if checkerPart.Parent ~= worldModel then
			checkerPart.Parent = worldModel
		end
		return checkerPart
	end
	function t.findPoint(p1_2, p2_2) --[[ findPoint | Line: 654 ]]
		local v1 = if typeof(p2_2) == "Vector3" then CFrame.new(p2_2) else p2_2
		local v3 = p1_2:getCheckerPart()
		v3.CFrame = v1
		local v4, v5 = p1_2:_getRegionConstructor(v3, p1_2.overlapParams.zonePartsWhitelist)
		local v6 = p1_2.worldModel[v4](p1_2.worldModel, unpack(v5))
		if #v6 > 0 then
			return true, v6
		else
			return false
		end
	end
	function t._getAll(p1_2, p2_2) --[[ _getAll | Line: 671 | Upvalues: v3 (copy) ]]
		v3.updateDetection(p1_2)
		local t2 = {}
		local v1 = v3._getZonesAndItems(p2_2, {
			self = true
		}, p1_2.volume, false, p1_2._currentEnterDetection)[p1_2]
		if v1 then
			for k2, v in pairs(v1) do
				table.insert(t2, k2)
			end
		end
		return t2
	end
	function t.getPlayers(p1_2) --[[ getPlayers | Line: 684 ]]
		return p1_2:_getAll("player")
	end
	function t.getItems(p1_2) --[[ getItems | Line: 688 ]]
		return p1_2:_getAll("item")
	end
	function t.getParts(p1_2) --[[ getParts | Line: 692 ]]
		local t2 = {}
		if p1_2.activeTriggers.part then
			for k2, v in pairs(p1_2.trackingTouchedTriggers.part) do
				table.insert(t2, k2)
			end
		else
			for k2, v in pairs((p1_2.worldModel:GetPartBoundsInBox(p1_2.region.CFrame, p1_2.region.Size, p1_2.overlapParams.zonePartsIgnorelist))) do
				if p1_2:findPart(v) then
					table.insert(t2, v)
				end
			end
		end
		return t2
	end
	function t.getRandomPoint(p1_2) --[[ getRandomPoint | Line: 713 ]]
		local exactRegion = p1_2.exactRegion
		local Size = exactRegion.Size
		local v1 = exactRegion.CFrame
		local v2 = Random.new()
		if #p1_2.overlapParams.zonePartsWhitelist.FilterDescendantsInstances <= 0 then
			return nil
		end
		local v3 = nil
		local v4, v5
		repeat
			v4 = v1 * CFrame.new(v2:NextNumber(-Size.X / 2, Size.X / 2), v2:NextNumber(-Size.Y / 2, Size.Y / 2), v2:NextNumber(-Size.Z / 2, Size.Z / 2))
			local v6
			v6, v5 = p1_2:findPoint(v4)
			if v6 then
				v3 = true
			end
		until v3
		return v4.Position, v5
	end
	function t.setAccuracy(p1_2, p2_2) --[[ setAccuracy | Line: 738 | Upvalues: enums (copy) ]]
		local v1 = tonumber(p2_2)
		if v1 then
			if not enums.Accuracy.getName(v1) then
				error(("%s is an invalid enumId!"):format(v1))
			end
		else
			v1 = enums.Accuracy[p2_2]
			if not v1 then
				error(("\'%s\' is an invalid enumName!"):format(p2_2))
			end
		end
		p1_2.accuracy = v1
	end
	function t.setDetection(p1_2, p2_2) --[[ setDetection | Line: 754 | Upvalues: enums (copy) ]]
		local v1 = tonumber(p2_2)
		if v1 then
			if not enums.Detection.getName(v1) then
				error(("%s is an invalid enumId!"):format(v1))
			end
		else
			v1 = enums.Detection[p2_2]
			if not v1 then
				error(("\'%s\' is an invalid enumName!"):format(p2_2))
			end
		end
		p1_2.enterDetection = v1
		p1_2.exitDetection = v1
	end
	function t.trackItem(p1_2, p2_2) --[[ trackItem | Line: 771 | Upvalues: Janitor (copy), Tracker (copy) ]]
		local v1 = p2_2:IsA("BasePart")
		local v2 = if v1 then false else p2_2:FindFirstChildOfClass("Humanoid") and p2_2:FindFirstChild("HumanoidRootPart")
		assert(v1 or v2, "Only BaseParts or Characters/NPCs can be tracked!")
		if p1_2.trackedItems[p2_2] then
			return
		end
		if p1_2.itemsToUntrack[p2_2] then
			p1_2.itemsToUntrack[p2_2] = nil
		end
		local v4 = p1_2.janitor:Add(Janitor.new(), "Destroy")
		local t2 = {
			janitor = v4,
			item = p2_2,
			isBasePart = v1,
			isCharacter = v2
		}
		p1_2.trackedItems[p2_2] = t2
		v4:Add(p2_2.AncestryChanged:Connect(function() --[[ Line: 796 | Upvalues: p2_2 (copy), p1_2 (copy) ]]
			if p2_2:IsDescendantOf(game) then
				return
			end
			p1_2:untrackItem(p2_2)
		end), "Disconnect")
		require(Tracker).itemAdded:Fire(t2)
	end
	function t.untrackItem(p1_2, p2_2) --[[ untrackItem | Line: 806 | Upvalues: Tracker (copy) ]]
		local v1 = p1_2.trackedItems[p2_2]
		if v1 then
			v1.janitor:Destroy()
		end
		p1_2.trackedItems[p2_2] = nil
		require(Tracker).itemRemoved:Fire(v1)
	end
	function t.bindToGroup(p1_2, p2_2) --[[ bindToGroup | Line: 817 | Upvalues: v3 (copy) ]]
		p1_2:unbindFromGroup()
		(v3.getGroup(p2_2) or v3.setGroup(p2_2))._memberZones[p1_2.zoneId] = p1_2
		p1_2.settingsGroupName = p2_2
	end
	function t.unbindFromGroup(p1_2) --[[ unbindFromGroup | Line: 824 | Upvalues: v3 (copy) ]]
		if not p1_2.settingsGroupName then
			return
		end
		local v1 = v3.getGroup(p1_2.settingsGroupName)
		if v1 then
			v1._memberZones[p1_2.zoneId] = nil
		end
		p1_2.settingsGroupName = nil
	end
	function t.relocate(p1_2) --[[ relocate | Line: 834 | Upvalues: CollectiveWorldModel (copy) ]]
		if p1_2.hasRelocated then
			return
		end
		local v1 = require(CollectiveWorldModel).setupWorldModel(p1_2)
		p1_2.worldModel = v1
		p1_2.hasRelocated = true
		local container = p1_2.container
		if typeof(container) == "table" then
			container = Instance.new("Folder")
			for k2, v in pairs(p1_2.zoneParts) do
				v.Parent = container
			end
		end
		p1_2.relocationContainer = p1_2.janitor:Add(container, "Destroy", "RelocationContainer")
		container.Parent = v1
	end
	function t._onItemCallback(p1_2, p2_2, p3_2, p4_2, p5_2) --[[ _onItemCallback | Line: 855 ]]
		local v1 = p1_2.onItemDetails[p4_2]
		if not v1 then
			v1 = {}
			p1_2.onItemDetails[p4_2] = v1
		end
		if #v1 == 0 then
			p1_2.itemsToUntrack[p4_2] = true
		end
		table.insert(v1, p4_2)
		p1_2:trackItem(p4_2)
		local function triggerCallback() --[[ triggerCallback | Line: 867 | Upvalues: p5_2 (copy), p1_2 (copy), p4_2 (copy) ]]
			p5_2()
			if not p1_2.itemsToUntrack[p4_2] then
				return
			end
			p1_2.itemsToUntrack[p4_2] = nil
			p1_2:untrackItem(p4_2)
		end
		if p1_2:findItem(p4_2) == p3_2 then
			p5_2()
			if p1_2.itemsToUntrack[p4_2] then
				p1_2.itemsToUntrack[p4_2] = nil
				p1_2:untrackItem(p4_2)
			end
		else
			local v2 = nil
			v2 = p1_2[p2_2]:Connect(function(p12_2) --[[ Line: 880 | Upvalues: v2 (ref), p4_2 (copy), p5_2 (copy), p1_2 (copy) ]]
				if not v2 or p12_2 ~= p4_2 then
					return
				end
				v2:Disconnect()
				v2 = nil
				p5_2()
				if not p1_2.itemsToUntrack[p4_2] then
					return
				end
				p1_2.itemsToUntrack[p4_2] = nil
				p1_2:untrackItem(p4_2)
			end)
		end
	end
	function t.onItemEnter(p1_2, ...) --[[ onItemEnter | Line: 901 ]]
		p1_2:_onItemCallback("itemEntered", true, ...)
	end
	function t.onItemExit(p1_2, ...) --[[ onItemExit | Line: 905 ]]
		p1_2:_onItemCallback("itemExited", false, ...)
	end
	function t.destroy(p1_2) --[[ destroy | Line: 909 ]]
		p1_2:unbindFromGroup()
		p1_2.janitor:Destroy()
	end
	function t.Cleanup(p1_2) --[[ Cleanup | Line: 914 ]]
		p1_2:destroy()
		table.clear(p1_2)
		setmetatable(p1_2, nil)
	end
	t.Destroy = t.destroy
	return t
end
ZonePlusReference.addToReplicatedStorage()
t.enum = enums
function t.new(p1_2) --[[ new | Line: 38 | Upvalues: t (copy), enums (copy), Janitor (copy), HttpService (copy), v3 (copy), Signal (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	local v32 = typeof(p1_2)
	if v32 ~= "table" and v32 ~= "Instance" then
		error("The zone container must be a model, folder, basepart or table!")
	end
	debug.setmemorycategory("Zone." .. p1_2.Name)
	v2.accuracy = enums.Accuracy.High
	v2.autoUpdate = true
	v2.respectUpdateQueue = true
	local v4 = Janitor.new()
	v2.janitor = v4
	v2._updateConnections = v4:Add(Janitor.new(), "Destroy")
	v2.container = p1_2
	v2.zoneParts = {}
	v2.overlapParams = {}
	v2.region = nil
	v2.volume = nil
	v2.boundMin = nil
	v2.boundMax = nil
	v2.recommendedMaxParts = nil
	v2.zoneId = HttpService:GenerateGUID()
	v2.activeTriggers = {}
	v2.occupants = {}
	v2.trackingTouchedTriggers = {}
	v2.enterDetection = enums.Detection.Centre
	v2.exitDetection = enums.Detection.Centre
	v2._currentEnterDetection = nil
	v2._currentExitDetection = nil
	v2.totalPartVolume = 0
	v2.allZonePartsAreBlocks = true
	v2.trackedItems = {}
	v2.settingsGroupName = nil
	v2.worldModel = game:GetService("Workspace")
	v2.onItemDetails = {}
	v2.itemsToUntrack = {}
	v2.destroyed = false
	v3.updateDetection(v2)
	v2.updated = v4:Add(Signal.new(), "Destroy")
	local tbl2 = { "player", "part", "localPlayer", "item" }
	local tbl2_2 = { "entered", "exited" }
	for k2, v in pairs(tbl2) do
		local v5 = 0
		local v6 = 0
		for k2_2, v8 in pairs(tbl2_2) do
			local v72 = v4:Add(Signal.new(true), "Destroy")
			local v8_2 = v8:sub(1, 1):upper() .. v8:sub(2)
			v2[v .. v8_2] = v72
			v72.connectionsChanged:Connect(function(p1_2) --[[ Line: 111 | Upvalues: v (copy), v1 (ref), v8_2 (copy), v5 (ref), v6 (ref), v3 (ref), v2 (copy) ]]
				if v == "localPlayer" and (not v1 and p1_2 == 1) then
					error(("Can only connect to \'localPlayer%s\' on the client!"):format(v8_2))
				end
				v5 = v6
				v6 = v6 + p1_2
				if v5 == 0 and v6 > 0 then
					v3._registerConnection(v2, v, v8_2)
					return
				end
				if not (v5 > 0) or v6 ~= 0 then
					return
				end
				v3._deregisterConnection(v2, v)
			end)
		end
	end
	t.touchedConnectionActions = {}
	for k2, v in pairs(tbl2) do
		local v9 = v2[("_%sTouchedZone"):format(v)]
		if v9 then
			v2.trackingTouchedTriggers[v] = {}
			t.touchedConnectionActions[v] = function(p1_2) --[[ Line: 135 | Upvalues: v9 (copy), v2 (copy) ]]
				v9(v2, p1_2)
			end
		end
	end
	v2:_update()
	v3._registerZone(v2)
	v4:Add(function() --[[ Line: 147 | Upvalues: v3 (ref), v2 (copy) ]]
		v3._deregisterZone(v2)
	end, true)
	v4:Add(function() --[[ Line: 151 | Upvalues: v2 (copy) ]]
		v2.destroyed = true
	end, true)
	for v122, v13_2 in pairs(if typeof(p1_2) == "Instance" then { p1_2 } else p1_2) do
		v13_2.Destroying:Once(function() --[[ Line: 158 | Upvalues: v2 (copy) ]]
			if not v2.destroy or v2.destroyed then
				return
			end
			v2:Destroy()
		end)
	end
	return v2
end
function t.fromRegion(p1_2, p2_2) --[[ fromRegion | Line: 168 | Upvalues: t (copy) ]]
	local Model = Instance.new("Model")
	local function v1(p1_2, p2_2) --[[ createCube | Line: 171 | Upvalues: v1 (copy), Model (copy) ]]
		if not (p2_2.X > 2024 or (p2_2.Y > 2024 or p2_2.Z > 2024)) then
			local Part = Instance.new("Part")
			Part.CFrame = p1_2
			Part.Size = p2_2
			Part.Anchored = true
			Part.Parent = Model
			return
		end
		local v12 = p2_2 * 0.25
		local v2 = p2_2 * 0.5
		v1(p1_2 * CFrame.new(-v12.X, -v12.Y, -v12.Z), v2)
		v1(p1_2 * CFrame.new(-v12.X, -v12.Y, v12.Z), v2)
		v1(p1_2 * CFrame.new(-v12.X, v12.Y, -v12.Z), v2)
		v1(p1_2 * CFrame.new(-v12.X, v12.Y, v12.Z), v2)
		v1(p1_2 * CFrame.new(v12.X, -v12.Y, -v12.Z), v2)
		v1(p1_2 * CFrame.new(v12.X, -v12.Y, v12.Z), v2)
		v1(p1_2 * CFrame.new(v12.X, v12.Y, -v12.Z), v2)
		v1(p1_2 * CFrame.new(v12.X, v12.Y, v12.Z), v2)
	end
	v1(p1_2, p2_2)
	local v2 = t.new(Model)
	v2:relocate()
	return v2
end
function t._calculateRegion(p1_2, p2_2, p3_2) --[[ _calculateRegion | Line: 199 ]]
	local tbl2 = {
		Min = {},
		Max = {}
	}
	for k2, v in pairs(tbl2) do
		v.Values = {}
		function v.parseCheck(p1_2, p2_2) --[[ parseCheck | Line: 203 | Upvalues: k2 (copy) ]]
			if k2 == "Min" then
				return p1_2 <= p2_2
			else
				if k2 ~= "Max" then
					return
				end
				return p2_2 <= p1_2
			end
		end
		function v.parse(p1_2, p2_2) --[[ parse | Line: 210 ]]
			for k2, v in pairs(p2_2) do
				if p1_2.parseCheck(v, p1_2.Values[k2] or v) then
					p1_2.Values[k2] = v
				end
			end
		end
	end
	for k2, v in pairs(p2_2) do
		local v1 = v.Size * 0.5
		for k2_2, v3 in pairs({
			v.CFrame * CFrame.new(-v1.X, -v1.Y, -v1.Z),
			v.CFrame * CFrame.new(-v1.X, -v1.Y, v1.Z),
			v.CFrame * CFrame.new(-v1.X, v1.Y, -v1.Z),
			v.CFrame * CFrame.new(-v1.X, v1.Y, v1.Z),
			v.CFrame * CFrame.new(v1.X, -v1.Y, -v1.Z),
			v.CFrame * CFrame.new(v1.X, -v1.Y, v1.Z),
			v.CFrame * CFrame.new(v1.X, v1.Y, -v1.Z),
			v.CFrame * CFrame.new(v1.X, v1.Y, v1.Z)
		}) do
			local v22, v3_2, v4 = v3:GetComponents()
			local t2 = { v22, v3_2, v4 }
			tbl2.Min:parse(t2)
			tbl2.Max:parse(t2)
		end
	end
	local function roundToFour(p1_2) --[[ roundToFour | Line: 242 ]]
		return math.floor((p1_2 + 2) / 4) * 4
	end
	local t2 = {}
	local t2_2 = {}
	for k2, v in pairs(tbl2) do
		for k2_2, v3 in pairs(v.Values) do
			local v5, v6
			v5 = if k2 == "Min" and t2 then t2 else t2_2
			v6 = if p3_2 then v3 else math.floor((v3 + (if k2 == "Min" then -2 else 2) + 2) / 4) * 4
			table.insert(v5, v6)
		end
	end
	local v10 = Vector3.new(unpack(t2))
	local v12 = Vector3.new(unpack(t2_2))
	return Region3.new(v10, v12), v10, v12
end
function t._displayBounds(p1_2) --[[ _displayBounds | Line: 265 ]]
	if p1_2.displayBoundParts then
		return
	end
	p1_2.displayBoundParts = true
	for k2, v in pairs({
		BoundMin = p1_2.boundMin,
		BoundMax = p1_2.boundMax
	}) do
		local Part = Instance.new("Part")
		Part.Anchored = true
		Part.CanCollide = false
		Part.Transparency = 0.5
		Part.Size = Vector3.new(1, 1, 1)
		Part.Color = Color3.fromRGB(255, 0, 0)
		Part.CFrame = CFrame.new(v)
		Part.Name = k2
		Part.Parent = workspace
		p1_2.janitor:Add(Part, "Destroy")
	end
end
function t._update(p1_2) --[[ _update | Line: 284 | Upvalues: RunService (copy), PreSimulation (copy) ]]
	local container = p1_2.container
	local tbl2 = {}
	local v1 = 0
	p1_2._updateConnections:Cleanup()
	local v2 = typeof(container)
	local tbl2_2 = {}
	if v2 == "table" then
		for k2, v in pairs(container) do
			if v:IsA("BasePart") then
				table.insert(tbl2, v)
			end
		end
	elseif v2 == "Instance" and container:IsA("BasePart") then
		table.insert(tbl2, container)
	elseif v2 == "Instance" then
		table.insert(tbl2_2, container)
		for k2, v in pairs(container:GetDescendants()) do
			if v:IsA("BasePart") then
				table.insert(tbl2, v)
				continue
			end
			table.insert(tbl2_2, v)
		end
	end
	p1_2.zoneParts = tbl2
	p1_2.overlapParams = {}
	local v3 = true
	for k2, v in pairs(tbl2) do
		local _, v4 = pcall(function() --[[ Line: 319 | Upvalues: v (copy) ]]
			return v.Shape.Name
		end)
		if v4 ~= "Block" then
			v3 = false
		end
	end
	p1_2.allZonePartsAreBlocks = v3
	local v5 = OverlapParams.new()
	v5.FilterType = Enum.RaycastFilterType.Include
	v5.MaxParts = #tbl2
	v5.FilterDescendantsInstances = tbl2
	p1_2.overlapParams.zonePartsWhitelist = v5
	local v6 = OverlapParams.new()
	v6.FilterType = Enum.RaycastFilterType.Exclude
	v6.FilterDescendantsInstances = tbl2
	p1_2.overlapParams.zonePartsIgnorelist = v6
	local function update() --[[ update | Line: 339 | Upvalues: p1_2 (copy), v1 (ref), RunService (ref), PreSimulation (ref) ]]
		if not p1_2.autoUpdate then
			return
		end
		local sum_2 = os.clock()
		if p1_2.respectUpdateQueue then
			v1 = v1 + 1
			sum_2 = sum_2 + 0.1
		end
		local v12 = nil
		if RunService:IsClient() then
			local _ = RunService.PreRender:Connect(function() --[[ Line: 348 | Upvalues: sum_2 (ref), v12 (ref), p1_2 (ref), v1 (ref) ]]
				if not (sum_2 <= os.clock()) then
					return
				end
				v12:Disconnect()
				if p1_2.respectUpdateQueue then
					v1 = v1 - 1
				end
				if v1 ~= 0 or not p1_2.zoneId then
					return
				end
				p1_2:_update()
			end)
		else
			local _ = PreSimulation:Connect(function() --[[ Line: 360 | Upvalues: sum_2 (ref), v12 (ref), p1_2 (ref), v1 (ref) ]]
				if not (sum_2 <= os.clock()) then
					return
				end
				v12:Disconnect()
				if p1_2.respectUpdateQueue then
					v1 = v1 - 1
				end
				if v1 ~= 0 or not p1_2.zoneId then
					return
				end
				p1_2:_update()
			end)
		end
	end
	local function verifyDefaultCollision(p1_2) --[[ verifyDefaultCollision | Line: 375 ]]
		if p1_2.CollisionGroupId == 0 then
			return
		end
		error("Zone parts must belong to the \'Default\' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.")
	end
	local tbl3 = { "Size", "Position" }
	for k2, v in pairs(tbl2) do
		for k2_2, v7 in pairs(tbl3) do
			p1_2._updateConnections:Add(v:GetPropertyChangedSignal(v7):Connect(update), "Disconnect")
		end
		if v.CollisionGroupId ~= 0 then
			error("Zone parts must belong to the \'Default\' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.")
		end
		p1_2._updateConnections:Add(v:GetPropertyChangedSignal("CollisionGroupId"):Connect(function() --[[ Line: 385 | Upvalues: v (copy) ]]
			if v.CollisionGroupId == 0 then
				return
			end
			error("Zone parts must belong to the \'Default\' (0) CollisionGroup! Consider using zone:relocate() if you wish to move zones outside of workspace to prevent them interacting with other parts.")
		end), "Disconnect")
	end
	local tbl4 = { "ChildAdded", "ChildRemoved" }
	for k2, v in pairs(tbl2_2) do
		for k2_2, v7 in pairs(tbl4) do
			p1_2._updateConnections:Add(p1_2.container[v7]:Connect(function(p1_2) --[[ Line: 392 | Upvalues: update (copy) ]]
				if not p1_2:IsA("BasePart") then
					return
				end
				update()
			end), "Disconnect")
		end
	end
	local v7, v8, v9 = p1_2:_calculateRegion(tbl2)
	local v10, _, _2_2 = p1_2:_calculateRegion(tbl2, true)
	p1_2.region = v7
	p1_2.exactRegion = v10
	p1_2.boundMin = v8
	p1_2.boundMax = v9
	local Size = v7.Size
	p1_2.volume = Size.X * Size.Y * Size.Z
	p1_2:_updateTouchedConnections()
	p1_2.updated:Fire()
end
function t._updateOccupants(p1_2, p2_2, p3_2) --[[ _updateOccupants | Line: 428 ]]
	local v1 = p1_2.occupants[p2_2]
	if not v1 then
		v1 = {}
		p1_2.occupants[p2_2] = v1
	end
	local t2 = {}
	for k2, v in pairs(v1) do
		local v2 = p3_2[k2]
		if v2 == nil or v2 ~= v then
			v1[k2] = nil
			if not t2.exited then
				t2.exited = {}
			end
			table.insert(t2.exited, k2)
		end
	end
	for k2, v in pairs(p3_2) do
		if v1[k2] == nil then
			v1[k2] = k2:IsA("Player") and k2.Character or true
			if not t2.entered then
				t2.entered = {}
			end
			table.insert(t2.entered, k2)
		end
	end
	return t2
end
function t._formTouchedConnection(p1_2, p2_2) --[[ _formTouchedConnection | Line: 458 | Upvalues: Janitor (copy) ]]
	local v1 = "_touchedJanitor" .. p2_2
	local v2 = p1_2[v1]
	if v2 then
		v2:Cleanup()
	else
		p1_2[v1] = p1_2.janitor:Add(Janitor.new(), "Destroy")
	end
	p1_2:_updateTouchedConnection(p2_2)
end
function t._updateTouchedConnection(p1_2, p2_2) --[[ _updateTouchedConnection | Line: 470 ]]
	local v1 = p1_2["_touchedJanitor" .. p2_2]
	if not v1 then
		return
	end
	for k2, v in pairs(p1_2.zoneParts) do
		v1:Add(v.Touched:Connect(p1_2.touchedConnectionActions[p2_2], p1_2), "Disconnect")
	end
end
function t._updateTouchedConnections(p1_2) --[[ _updateTouchedConnections | Line: 479 ]]
	for k2, v in pairs(p1_2.touchedConnectionActions) do
		local v1 = p1_2["_touchedJanitor" .. k2]
		if v1 then
			v1:Cleanup()
			p1_2:_updateTouchedConnection(k2)
		end
	end
end
function t._disconnectTouchedConnection(p1_2, p2_2) --[[ _disconnectTouchedConnection | Line: 490 ]]
	local v1 = "_touchedJanitor" .. p2_2
	local v2 = p1_2[v1]
	if not v2 then
		return
	end
	v2:Cleanup()
	p1_2[v1] = nil
end
_ = function(p1_2, p2_2) --[[ round | Line: 499 ]]
	return math.round(p1_2 * 10 ^ p2_2) * 10 ^ (-p2_2)
end
function t._partTouchedZone(p1_2, p2_2) --[[ _partTouchedZone | Line: 503 | Upvalues: Janitor (copy), PreSimulation (copy), enums (copy) ]]
	local part = p1_2.trackingTouchedTriggers.part
	if part[p2_2] then
		return
	end
	local v1 = 0
	local v2 = false
	local Position = p2_2.Position
	local v3 = os.clock()
	local v4 = p1_2.janitor:Add(Janitor.new(), "Destroy")
	part[p2_2] = v4
	if not ({
		Seat = true,
		VehicleSeat = true
	})[p2_2.ClassName] and ({
		HumanoidRootPart = true
	})[p2_2.Name] then
		p2_2.CanTouch = false
	end
	local v6 = math.round(p2_2.Size.X * p2_2.Size.Y * p2_2.Size.Z * 100000) * 0.00001
	p1_2.totalPartVolume = p1_2.totalPartVolume + v6
	v4:Add(PreSimulation:Connect(function() --[[ Line: 521 | Upvalues: v1 (ref), enums (ref), p1_2 (copy), p2_2 (copy), v2 (ref), Position (ref), v3 (ref), v4 (copy) ]]
		local v12 = os.clock()
		if not (v1 <= v12) then
			return
		end
		local v22 = enums.Accuracy.getProperty(p1_2.accuracy)
		v1 = v12 + v22
		local v32 = p1_2:findPoint(p2_2.CFrame)
		if not v32 then
			v32 = p1_2:findPart(p2_2)
		end
		if v2 then
			if v32 then
				return
			end
			v2 = false
			Position = p2_2.Position
			v3 = os.clock()
			p1_2.partExited:Fire(p2_2)
		else
			if v32 then
				v2 = true
				p1_2.partEntered:Fire(p2_2)
				return
			end
			if (p2_2.Position - Position).Magnitude > 1.5 and v22 <= v12 - v3 then
				v4:Cleanup()
			end
		end
	end), "Disconnect")
	v4:Add(function() --[[ Line: 552 | Upvalues: part (copy), p2_2 (copy), p1_2 (copy), v6 (copy) ]]
		part[p2_2] = nil
		p2_2.CanTouch = true
		p1_2.totalPartVolume = math.round((p1_2.totalPartVolume - v6) * 100000) * 0.00001
	end, true)
end
v6 = {
	Ball = function(p1_2) --[[ Line: 560 ]]
		return "GetPartBoundsInRadius", { p1_2.Position, p1_2.Size.X }
	end,
	Block = function(p1_2) --[[ Line: 563 ]]
		return "GetPartBoundsInBox", { p1_2.CFrame, p1_2.Size }
	end,
	Other = function(p1_2) --[[ Line: 566 ]]
		return "GetPartsInPart", { p1_2 }
	end
}
function t._getRegionConstructor(p1_2, p2_2, p3_2) --[[ _getRegionConstructor | Line: 570 | Upvalues: v6 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 571 | Upvalues: p2_2 (copy) ]]
		return p2_2.Shape.Name
	end)
	local v3 = nil
	local v4 = nil
	if v1 and p1_2.allZonePartsAreBlocks then
		local v5 = v6[v2]
		if v5 then
			local v62, v7 = v5(p2_2)
			v3 = v62
			v4 = v7
		end
	end
	if not v3 then
		local v8, v9 = v6.Other(p2_2)
		v4 = v9
		v3 = v8
	end
	if p3_2 then
		table.insert(v4, p3_2)
	end
	return v3, v4
end
function t.findLocalPlayer(p1_2) --[[ findLocalPlayer | Line: 591 | Upvalues: v1 (copy) ]]
	if v1 then
		return p1_2:findPlayer(v1)
	end
	error("Can only call \'findLocalPlayer\' on the client!")
end
function t._find(p1_2, p2_2, p3_2) --[[ _find | Line: 598 | Upvalues: v3 (copy) ]]
	v3.updateDetection(p1_2)
	for k2, v in pairs((v3.getTouchingZones(p3_2, false, p1_2._currentEnterDetection, v3.trackers[p2_2]))) do
		if v == p1_2 then
			return true
		end
	end
	return false
end
function t.findPlayer(p1_2, p2_2) --[[ findPlayer | Line: 610 ]]
	local Character = p2_2.Character
	if if Character then Character:FindFirstChildOfClass("Humanoid") else Character then
		return p1_2:_find("player", p2_2.Character)
	else
		return false
	end
end
function t.findItem(p1_2, p2_2) --[[ findItem | Line: 619 ]]
	return p1_2:_find("item", p2_2)
end
function t.findPart(p1_2, p2_2) --[[ findPart | Line: 623 ]]
	local v1, v2 = p1_2:_getRegionConstructor(p2_2, p1_2.overlapParams.zonePartsWhitelist)
	local v3 = p1_2.worldModel[v1](p1_2.worldModel, unpack(v2))
	if #v3 > 0 then
		return true, v3
	else
		return false
	end
end
function t.getCheckerPart(p1_2) --[[ getCheckerPart | Line: 633 | Upvalues: v3 (copy) ]]
	local checkerPart = p1_2.checkerPart
	if not checkerPart then
		local ZonePlusCheckerPart = p1_2.janitor:Add(Instance.new("Part"), "Destroy")
		ZonePlusCheckerPart.Size = Vector3.new(0.1, 0.1, 0.1)
		ZonePlusCheckerPart.Name = "ZonePlusCheckerPart"
		ZonePlusCheckerPart.Anchored = true
		ZonePlusCheckerPart.Transparency = 1
		ZonePlusCheckerPart.CanCollide = false
		p1_2.checkerPart = ZonePlusCheckerPart
		checkerPart = ZonePlusCheckerPart
	end
	local worldModel = p1_2.worldModel
	if worldModel == workspace then
		worldModel = v3.getWorkspaceContainer()
	end
	if checkerPart.Parent ~= worldModel then
		checkerPart.Parent = worldModel
	end
	return checkerPart
end
function t.findPoint(p1_2, p2_2) --[[ findPoint | Line: 654 ]]
	local v1 = if typeof(p2_2) == "Vector3" then CFrame.new(p2_2) else p2_2
	local v3 = p1_2:getCheckerPart()
	v3.CFrame = v1
	local v4, v5 = p1_2:_getRegionConstructor(v3, p1_2.overlapParams.zonePartsWhitelist)
	local v6 = p1_2.worldModel[v4](p1_2.worldModel, unpack(v5))
	if #v6 > 0 then
		return true, v6
	else
		return false
	end
end
function t._getAll(p1_2, p2_2) --[[ _getAll | Line: 671 | Upvalues: v3 (copy) ]]
	v3.updateDetection(p1_2)
	local t2 = {}
	local v1 = v3._getZonesAndItems(p2_2, {
		self = true
	}, p1_2.volume, false, p1_2._currentEnterDetection)[p1_2]
	if v1 then
		for k2, v in pairs(v1) do
			table.insert(t2, k2)
		end
	end
	return t2
end
function t.getPlayers(p1_2) --[[ getPlayers | Line: 684 ]]
	return p1_2:_getAll("player")
end
function t.getItems(p1_2) --[[ getItems | Line: 688 ]]
	return p1_2:_getAll("item")
end
function t.getParts(p1_2) --[[ getParts | Line: 692 ]]
	local t2 = {}
	if p1_2.activeTriggers.part then
		for k2, v in pairs(p1_2.trackingTouchedTriggers.part) do
			table.insert(t2, k2)
		end
	else
		for k2, v in pairs((p1_2.worldModel:GetPartBoundsInBox(p1_2.region.CFrame, p1_2.region.Size, p1_2.overlapParams.zonePartsIgnorelist))) do
			if p1_2:findPart(v) then
				table.insert(t2, v)
			end
		end
	end
	return t2
end
function t.getRandomPoint(p1_2) --[[ getRandomPoint | Line: 713 ]]
	local exactRegion = p1_2.exactRegion
	local Size = exactRegion.Size
	local v1 = exactRegion.CFrame
	local v2 = Random.new()
	if #p1_2.overlapParams.zonePartsWhitelist.FilterDescendantsInstances <= 0 then
		return nil
	end
	local v3 = nil
	local v4, v5
	repeat
		v4 = v1 * CFrame.new(v2:NextNumber(-Size.X / 2, Size.X / 2), v2:NextNumber(-Size.Y / 2, Size.Y / 2), v2:NextNumber(-Size.Z / 2, Size.Z / 2))
		local v6
		v6, v5 = p1_2:findPoint(v4)
		if v6 then
			v3 = true
		end
	until v3
	return v4.Position, v5
end
function t.setAccuracy(p1_2, p2_2) --[[ setAccuracy | Line: 738 | Upvalues: enums (copy) ]]
	local v1 = tonumber(p2_2)
	if v1 then
		if not enums.Accuracy.getName(v1) then
			error(("%s is an invalid enumId!"):format(v1))
		end
	else
		v1 = enums.Accuracy[p2_2]
		if not v1 then
			error(("\'%s\' is an invalid enumName!"):format(p2_2))
		end
	end
	p1_2.accuracy = v1
end
function t.setDetection(p1_2, p2_2) --[[ setDetection | Line: 754 | Upvalues: enums (copy) ]]
	local v1 = tonumber(p2_2)
	if v1 then
		if not enums.Detection.getName(v1) then
			error(("%s is an invalid enumId!"):format(v1))
		end
	else
		v1 = enums.Detection[p2_2]
		if not v1 then
			error(("\'%s\' is an invalid enumName!"):format(p2_2))
		end
	end
	p1_2.enterDetection = v1
	p1_2.exitDetection = v1
end
function t.trackItem(p1_2, p2_2) --[[ trackItem | Line: 771 | Upvalues: Janitor (copy), Tracker (copy) ]]
	local v1 = p2_2:IsA("BasePart")
	local v2 = if v1 then false else p2_2:FindFirstChildOfClass("Humanoid") and p2_2:FindFirstChild("HumanoidRootPart")
	assert(v1 or v2, "Only BaseParts or Characters/NPCs can be tracked!")
	if p1_2.trackedItems[p2_2] then
		return
	end
	if p1_2.itemsToUntrack[p2_2] then
		p1_2.itemsToUntrack[p2_2] = nil
	end
	local v4 = p1_2.janitor:Add(Janitor.new(), "Destroy")
	local t2 = {
		janitor = v4,
		item = p2_2,
		isBasePart = v1,
		isCharacter = v2
	}
	p1_2.trackedItems[p2_2] = t2
	v4:Add(p2_2.AncestryChanged:Connect(function() --[[ Line: 796 | Upvalues: p2_2 (copy), p1_2 (copy) ]]
		if p2_2:IsDescendantOf(game) then
			return
		end
		p1_2:untrackItem(p2_2)
	end), "Disconnect")
	require(Tracker).itemAdded:Fire(t2)
end
function t.untrackItem(p1_2, p2_2) --[[ untrackItem | Line: 806 | Upvalues: Tracker (copy) ]]
	local v1 = p1_2.trackedItems[p2_2]
	if v1 then
		v1.janitor:Destroy()
	end
	p1_2.trackedItems[p2_2] = nil
	require(Tracker).itemRemoved:Fire(v1)
end
function t.bindToGroup(p1_2, p2_2) --[[ bindToGroup | Line: 817 | Upvalues: v3 (copy) ]]
	p1_2:unbindFromGroup()
	(v3.getGroup(p2_2) or v3.setGroup(p2_2))._memberZones[p1_2.zoneId] = p1_2
	p1_2.settingsGroupName = p2_2
end
function t.unbindFromGroup(p1_2) --[[ unbindFromGroup | Line: 824 | Upvalues: v3 (copy) ]]
	if not p1_2.settingsGroupName then
		return
	end
	local v1 = v3.getGroup(p1_2.settingsGroupName)
	if v1 then
		v1._memberZones[p1_2.zoneId] = nil
	end
	p1_2.settingsGroupName = nil
end
function t.relocate(p1_2) --[[ relocate | Line: 834 | Upvalues: CollectiveWorldModel (copy) ]]
	if p1_2.hasRelocated then
		return
	end
	local v1 = require(CollectiveWorldModel).setupWorldModel(p1_2)
	p1_2.worldModel = v1
	p1_2.hasRelocated = true
	local container = p1_2.container
	if typeof(container) == "table" then
		container = Instance.new("Folder")
		for k2, v in pairs(p1_2.zoneParts) do
			v.Parent = container
		end
	end
	p1_2.relocationContainer = p1_2.janitor:Add(container, "Destroy", "RelocationContainer")
	container.Parent = v1
end
function t._onItemCallback(p1_2, p2_2, p3_2, p4_2, p5_2) --[[ _onItemCallback | Line: 855 ]]
	local v1 = p1_2.onItemDetails[p4_2]
	if not v1 then
		v1 = {}
		p1_2.onItemDetails[p4_2] = v1
	end
	if #v1 == 0 then
		p1_2.itemsToUntrack[p4_2] = true
	end
	table.insert(v1, p4_2)
	p1_2:trackItem(p4_2)
	local function triggerCallback() --[[ triggerCallback | Line: 867 | Upvalues: p5_2 (copy), p1_2 (copy), p4_2 (copy) ]]
		p5_2()
		if not p1_2.itemsToUntrack[p4_2] then
			return
		end
		p1_2.itemsToUntrack[p4_2] = nil
		p1_2:untrackItem(p4_2)
	end
	if p1_2:findItem(p4_2) == p3_2 then
		p5_2()
		if p1_2.itemsToUntrack[p4_2] then
			p1_2.itemsToUntrack[p4_2] = nil
			p1_2:untrackItem(p4_2)
		end
	else
		local v2 = nil
		v2 = p1_2[p2_2]:Connect(function(p12_2) --[[ Line: 880 | Upvalues: v2 (ref), p4_2 (copy), p5_2 (copy), p1_2 (copy) ]]
			if not v2 or p12_2 ~= p4_2 then
				return
			end
			v2:Disconnect()
			v2 = nil
			p5_2()
			if not p1_2.itemsToUntrack[p4_2] then
				return
			end
			p1_2.itemsToUntrack[p4_2] = nil
			p1_2:untrackItem(p4_2)
		end)
	end
end
function t.onItemEnter(p1_2, ...) --[[ onItemEnter | Line: 901 ]]
	p1_2:_onItemCallback("itemEntered", true, ...)
end
function t.onItemExit(p1_2, ...) --[[ onItemExit | Line: 905 ]]
	p1_2:_onItemCallback("itemExited", false, ...)
end
function t.destroy(p1_2) --[[ destroy | Line: 909 ]]
	p1_2:unbindFromGroup()
	p1_2.janitor:Destroy()
end
function t.Cleanup(p1_2) --[[ Cleanup | Line: 914 ]]
	p1_2:destroy()
	table.clear(p1_2)
	setmetatable(p1_2, nil)
end
t.Destroy = t.destroy
return t