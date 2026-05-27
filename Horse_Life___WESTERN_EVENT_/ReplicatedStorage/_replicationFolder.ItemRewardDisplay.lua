-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("ItemGridButton")
local v4 = Sonar("AnimalGridButton")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("WeightedProbability")
local v7 = Sonar("SortedRandom")
local v8 = Sonar("Button")
local v9 = Sonar("Constants")
local t2 = {
	Active = Color3.fromRGB(158, 113, 85),
	Inactive = Color3.fromRGB(228, 182, 153)
}
local v10 = v5.GetClient()
local function GetThemes() --[[ GetThemes | Line: 24 | Upvalues: v9 (copy) ]]
	local t = {}
	for v1, v2 in v9.RandomEquipmentDropThemes do
		v2.Name = v1
		table.insert(t, v2)
	end
	table.sort(t, function(p1, p2) --[[ Line: 31 ]]
		return p1.Name < p2.Name
	end)
	return t
end
local function ResolveTheme(p1, p2, p3) --[[ ResolveTheme | Line: 37 | Upvalues: v6 (copy) ]]
	if not p1.Theme then
		return nil
	end
	local v1 = Random.new(p3 + (p1.SeedOffset or 0))
	local v2 = if p1.AlwaysTheme then p1.Theme elseif p1.ThemeChance then v1:NextNumber() <= p1.ThemeChance and p1.Theme or nil else v1:NextInteger(1, 2) == 1 and p1.Theme or nil
	if type(v2) == "table" then
		return v2[v1:NextInteger(1, #v2)]
	end
	if v2 == "Random" then
		v2 = p2[v6.getRandomWeightedItem(p2, p3 + (p1.SeedOffset or 0))].Name
	end
	return v2
end
local function ResolveItemName(p1, p2, p3) --[[ ResolveItemName | Line: 61 | Upvalues: v6 (copy), v7 (copy), v2 (copy), v9 (copy) ]]
	if p1 == "RandomEquipment" then
		return v7[v6.getRandomWeightedItem(v7, p2 + (p3 or 0))].Name
	end
	if not v2.GetByName(p1) and (v9.RandomDrops and v9.RandomDrops[p1]) then
		local v22 = v6.getRandomWeightedItem(v9.RandomDrops[p1], p2 + (p3 or 0))
		if v22 then
			return v22
		end
	end
	return p1
end
local function CreateItemDisplay(p1, p2, p3, p4, p5) --[[ CreateItemDisplay | Line: 78 | Upvalues: v3 (copy) ]]
	local v1 = v3.new({
		ForceVisible = true,
		DoNotClone = true,
		Item = p2,
		GuiObject = p1,
		Theme = p4,
		GetAmount = function() --[[ GetAmount | Line: 85 | Upvalues: p3 (copy) ]]
			return p3 or 1
		end
	})
	p5:GiveTask(v1)
	return v1
end
local function CreateHorseDisplay(p1, p2, p3, p4, p5, p6) --[[ CreateHorseDisplay | Line: 93 | Upvalues: Sonar (copy), v10 (copy), v4 (copy) ]]
	local v1 = Sonar("MissionsService").GetSlotInfoForMission(v10, {
		GiveToPlayer = false,
		Species = p2.Species,
		SlotInfo = p2
	}, p5 or 0, p6)
	local v2 = v4.new({
		ForceVisible = true,
		DoNotClone = true,
		SpeciesAsName = true,
		SlotValue = v1,
		Owner = v10.Player,
		GuiObject = p1,
		ViewportFrame = p4
	})
	p3:GiveTask(v1)
	p3:GiveTask(v2)
	return v2
end
local function ShuffleArray(p1, p2) --[[ ShuffleArray | Line: 116 ]]
	local t = {}
	for v1, v2 in p1 do
		table.insert(t, v2)
	end
	local v3 = Random.new(p2)
	for i = #t, 2, -1 do
		local v4 = v3:NextInteger(1, i)
		local v6 = t[i]
		t[i] = t[v4]
		t[v4] = v6
	end
	return t
end
local function BuildDisplay(p1, p2) --[[ BuildDisplay | Line: 131 | Upvalues: GetThemes (copy), CreateHorseDisplay (copy), ResolveItemName (copy), v2 (copy), ResolveTheme (copy), CreateItemDisplay (copy), ShuffleArray (copy) ]]
	local ParentFrame = p1.ParentFrame
	local CloneFrame = p1.CloneFrame
	local Rewards = p1.Rewards
	local v1 = p1.Seed or math.random(1, 1000000)
	local MaxRewards = p1.MaxRewards
	local v22 = p1.CompletedCount or 0
	local RandomHorse = p1.RandomHorse
	if not p1.DoNotClearChildren then
		for v3, v4 in ParentFrame:GetChildren() do
			if v4 ~= CloneFrame then
				v4:Destroy()
			end
		end
	end
	local v5 = GetThemes()
	local t = {}
	local v6 = 0
	local v7 = 0
	local function HasReachedMax() --[[ HasReachedMax | Line: 153 | Upvalues: MaxRewards (copy), v7 (ref) ]]
		return MaxRewards and MaxRewards <= v7
	end
	local function ProcessReward(p1, p22) --[[ ProcessReward | Line: 157 | Upvalues: MaxRewards (copy), v7 (ref), v6 (ref), CloneFrame (copy), ParentFrame (copy), p2 (copy), CreateHorseDisplay (ref), v22 (copy), RandomHorse (copy), v1 (copy), ResolveItemName (ref), v2 (ref), ResolveTheme (ref), v5 (copy), CreateItemDisplay (ref) ]]
		if MaxRewards and MaxRewards <= v7 then
			return
		end
		v7 = v7 + 1
		v6 = v6 + 1
		local v23 = CloneFrame:Clone()
		v23.Name = v6
		v23.Visible = true
		v23.Parent = ParentFrame
		if p1.Species then
			p2:GiveTask(v23)
			local Theme = v23:FindFirstChild("Theme")
			if Theme then
				Theme.Visible = false
			end
			local SpeciesViewport = v23:FindFirstChild("SpeciesViewport")
			if not SpeciesViewport then
				CreateHorseDisplay(v23, p1, p2, nil, v22, RandomHorse)
				return
			end
			SpeciesViewport.Visible = true
			local v3 = v23:FindFirstChild("Viewport") or v23:FindFirstChild("ItemViewport")
			if not v3 then
				CreateHorseDisplay(v23, p1, p2, SpeciesViewport, v22, RandomHorse)
				return
			end
			v3.Visible = false
			CreateHorseDisplay(v23, p1, p2, SpeciesViewport, v22, RandomHorse)
		else
			local v4 = p1.Name or p1
			local v52 = p22 and p22.Amount or (p1.Amount or 1)
			local v62 = p22 and p22.SeedOffset or (p1.SeedOffset or 0)
			if type(v4) == "table" then
				v4 = v4[Random.new(v1 + v62 + v6):NextInteger(1, #v4)]
			end
			local v8 = v2.GetByName((ResolveItemName(v4, v1, v62)))
			if v8 then
				p2:GiveTask(v23)
				CreateItemDisplay(v23, v8, v52, ResolveTheme(p22 or p1, v5, v1), p2)
			else
				v23:Destroy()
				v7 = v7 - 1
			end
		end
	end
	local function ProcessPullTable(p1) --[[ ProcessPullTable | Line: 209 | Upvalues: MaxRewards (copy), v7 (ref), v1 (copy), t (copy), v2 (ref), ProcessReward (copy) ]]
		if MaxRewards and MaxRewards <= v7 then
			return
		end
		local v22 = Random.new(v1 + (p1.SeedOffset or 0))
		local t2 = {}
		for v3, v4 in p1.PullTable do
			if not t[v4] and (type(v4) == "table" or v2.GetByName(v4)) then
				table.insert(t2, v4)
			end
		end
		table.sort(t2, function(p1, p2) --[[ Line: 223 ]]
			local v1 = type(p1) == "table" and p1[1] or p1
			local v2 = type(p2) == "table" and p2[1] or p2
			return tostring(v1) < tostring(v2)
		end)
		if not (#t2 > 0) then
			return
		end
		local v5 = t2[v22:NextInteger(1, #t2)]
		t[v5] = true
		if type(v5) == "table" then
			for v6, v72 in v5 do
				if MaxRewards and MaxRewards <= v7 then
					break
				end
				ProcessReward({
					Name = v72,
					Amount = p1.Amount or 1
				}, p1)
			end
			return
		end
		ProcessReward({
			Name = v5,
			Amount = p1.Amount or 1
		}, p1)
	end
	if Rewards.Items then
		for v10, v11 in Rewards.Items do
			local v8, v9
			if if MaxRewards then if MaxRewards <= v7 then true else false else MaxRewards then
				break
			end
			if v10 == "RandomEquipment" then
				v10 = ResolveItemName(v10, v1, v11.SeedOffset or 0)
			end
			if type(v11) == "table" and v11.PullTable then
				ProcessPullTable(v11)
				continue
			end
			if type(v10) == "table" then
				for v14, v15 in v10 do
					if if MaxRewards then if MaxRewards <= v7 then true else false else MaxRewards then
						break
					end
					ProcessReward({
						Name = v15,
						Amount = type(v11) == "table" and v11.Amount or (if v11 then v11 else 1)
					}, v11)
				end
				continue
			end
			local t2 = {
				Name = v10,
				Amount = type(v11) == "table" and v11.Amount or (if v11 then v11 else 1)
			}
			if type(v11) == "table" and v11 then
				v8 = ProcessReward
				v9 = v11
			else
				v8 = ProcessReward
				v9 = nil
			end
			v8(t2, v9)
		end
		if not (if MaxRewards then if MaxRewards <= v7 then true else false else MaxRewards) and Rewards.Horse then
			ProcessReward(Rewards.Horse)
		end
		if (if MaxRewards then MaxRewards <= v7 else MaxRewards) or not Rewards.Horse2 then
			return
		end
		ProcessReward(Rewards.Horse2)
	else
		for v222, v23 in MaxRewards and ShuffleArray(Rewards, v1) or Rewards do
			if if MaxRewards then if MaxRewards <= v7 then true else false else MaxRewards then
				break
			end
			if v23.PullTable then
				ProcessPullTable(v23)
				continue
			end
			if type(v23) == "table" then
				ProcessReward(v23)
				continue
			end
			ProcessReward({
				Amount = 1,
				Name = v23
			})
		end
	end
end
local function CollectRewardFrames(p1, p2) --[[ CollectRewardFrames | Line: 291 ]]
	local t = {}
	for v1, v2 in p1:GetChildren() do
		if v2 ~= p2 and v2:IsA("GuiObject") then
			table.insert(t, v2)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 298 ]]
		local v2 = tonumber(p1.Name)
		return v2 < tonumber(p2.Name)
	end)
	return t
end
local function CreateDots(p1, p2, p3, p4) --[[ CreateDots | Line: 304 | Upvalues: t2 (copy), v8 (copy) ]]
	local DotsContainer = Instance.new("Frame")
	DotsContainer.Name = "DotsContainer"
	DotsContainer.BackgroundTransparency = 1
	DotsContainer.AnchorPoint = Vector2.new(0.5, 1)
	DotsContainer.Position = UDim2.fromScale(0.5, 1)
	DotsContainer.Size = UDim2.fromScale(1, 0.15)
	DotsContainer.Parent = p1
	p3:GiveTask(DotsContainer)
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0.04, 0)
	UIListLayout.Parent = DotsContainer
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectRatio = 1
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	local t = {}
	for i = 1, p2 do
		local ImageButton = Instance.new("ImageButton")
		ImageButton.Name = i
		ImageButton.BackgroundColor3 = p4.InactiveDotColor or t2.Inactive
		ImageButton.Size = UDim2.fromScale(0.1, 1)
		ImageButton.LayoutOrder = i
		ImageButton.AutoButtonColor = false
		ImageButton.Parent = DotsContainer
		local UICorner = Instance.new("UICorner")
		UICorner.CornerRadius = UDim.new(1, 0)
		UICorner.Parent = ImageButton
		local UIStroke = Instance.new("UIStroke")
		UIStroke.Color = p4.ActiveDotColor or t2.Active
		UIStroke.Thickness = 3
		UIStroke.Parent = ImageButton
		UIAspectRatioConstraint:Clone().Parent = ImageButton
		p3:GiveTask((v8.new(ImageButton)))
		t[i] = ImageButton
	end
	UIAspectRatioConstraint:Destroy()
	return t
end
local function ShowPage(p1, p2, p3, p4) --[[ ShowPage | Line: 362 | Upvalues: t2 (copy) ]]
	for v1, v2 in p2 do
		v2.Visible = false
	end
	if p2[p1] then
		p2[p1].Visible = true
	end
	if not p3 then
		return
	end
	for v3, v4 in p3 do
		local UIStroke = v4:FindFirstChildOfClass("UIStroke")
		if v3 == p1 then
			v4.BackgroundColor3 = p4.ActiveDotColor or t2.Active
			if UIStroke then
				UIStroke.Color = p4.InactiveDotColor or t2.Inactive
			end
			continue
		end
		v4.BackgroundColor3 = p4.InactiveDotColor or t2.Inactive
		if UIStroke then
			UIStroke.Color = p4.ActiveDotColor or t2.Active
		end
	end
end
function t.new(p1) --[[ new | Line: 404 | Upvalues: v1 (copy), BuildDisplay (copy), CollectRewardFrames (copy), CreateDots (copy), ShowPage (copy), v8 (copy) ]]
	local v12 = p1.Maid or v1.new()
	local v2 = v1.new()
	local CycleTime = p1.CycleTime
	v12:GiveTask(v2)
	p1.CloneFrame.Visible = false
	if p1.Dots then
		p1.Seed = math.random(1, 1000000)
		BuildDisplay(p1, v2)
		local v3 = CollectRewardFrames(p1.ParentFrame, p1.CloneFrame)
		if #v3 > 1 then
			local v4 = CreateDots(p1.ParentFrame, #v3, v12, p1)
			local v5 = 1
			ShowPage(v5, v3, v4, p1)
			local function NextPage() --[[ NextPage | Line: 423 | Upvalues: v5 (ref), v3 (copy), ShowPage (ref), v4 (copy), p1 (copy) ]]
				v5 = v5 % #v3 + 1
				ShowPage(v5, v3, v4, p1)
			end
			for v6, v7 in v4 do
				v8:RegisterClick(v7, function() --[[ Line: 429 | Upvalues: v5 (ref), v6 (copy), ShowPage (ref), v3 (copy), v4 (copy), p1 (copy) ]]
					v5 = v6
					ShowPage(v6, v3, v4, p1)
				end)
			end
			for v82, v9 in v3 do
				local ClickOverlay = Instance.new("ImageButton")
				ClickOverlay.Name = "ClickOverlay"
				ClickOverlay.BackgroundTransparency = 1
				ClickOverlay.Size = UDim2.fromScale(1, 1)
				ClickOverlay.Parent = v9
				v12:GiveTask((v8.new(ClickOverlay)))
				v8:RegisterClick(ClickOverlay, NextPage)
			end
			if CycleTime then
				local v10 = true
				v12:GiveTask(function() --[[ Line: 449 | Upvalues: v10 (ref) ]]
					v10 = false
				end)
				v12:GiveTask(task.spawn(function() --[[ Line: 453 | Upvalues: v10 (ref), CycleTime (copy), v5 (ref), v3 (copy), ShowPage (ref), v4 (copy), p1 (copy) ]]
					while v10 do
						task.wait(CycleTime)
						if not v10 then
							break
						end
						v5 = v5 % #v3 + 1
						ShowPage(v5, v3, v4, p1)
					end
				end))
			end
			return v12
		end
	else
		local function Rebuild() --[[ Rebuild | Line: 464 | Upvalues: v2 (copy), p1 (copy), BuildDisplay (ref) ]]
			v2:DoCleaning()
			p1.Seed = math.random(1, 1000000)
			BuildDisplay(p1, v2)
		end
		v2:DoCleaning()
		p1.Seed = math.random(1, 1000000)
		BuildDisplay(p1, v2)
		if CycleTime then
			local v11 = true
			v12:GiveTask(function() --[[ Line: 474 | Upvalues: v11 (ref) ]]
				v11 = false
			end)
			v12:GiveTask(task.spawn(function() --[[ Line: 478 | Upvalues: v11 (ref), CycleTime (copy), v2 (copy), p1 (copy), BuildDisplay (ref) ]]
				while v11 do
					task.wait(CycleTime)
					if not v11 then
						break
					end
					v2:DoCleaning()
					p1.Seed = math.random(1, 1000000)
					BuildDisplay(p1, v2)
				end
			end))
		end
	end
	return v12
end
return t