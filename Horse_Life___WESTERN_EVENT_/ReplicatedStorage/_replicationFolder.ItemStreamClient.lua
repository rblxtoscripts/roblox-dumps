-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ItemStreamClass")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v7 = Sonar("PlayerWrapper").GetClient()
local ItemStreamGui = LocalPlayer.PlayerGui:WaitForChild("ItemStreamGui")
local t2 = {}
local v8 = false
local v9 = Sonar("Signal").new()
local function runQueue() --[[ runQueue | Line: 32 | Upvalues: v8 (ref), t2 (copy), v9 (copy) ]]
	if v8 then
		return
	end
	v8 = true
	repeat
		if t2[3] then
			t2[3]:_tweenIn(true, #t2 <= 3)
		end
		t2[1]:_delayTweenOut(if #t2 > 10 then "Massive" elseif #t2 > 3 then "Max" else false)
		t2[1]:_waitForTweenOut()
		table.remove(t2, 1)
		v9:Fire()
	until #t2 == 0
	v8 = false
end
local function addToQueue(p1) --[[ addToQueue | Line: 53 | Upvalues: t2 (copy), v9 (copy), runQueue (copy) ]]
	t2[#t2 + 1] = p1
	v9:Fire()
	local v1 = table.find(t2, p1)
	if v1 <= 3 then
		p1:_tweenIn(if v1 == 1 then true else t2[v1 - 1] and t2[v1 - 1].TweenedIn, true)
	end
	if v1 ~= 4 or not t2[1].TweenedIn then
		task.spawn(runQueue)
		return
	end
	t2[1].TweenOutValue.Value = true
	task.spawn(runQueue)
end
local function createOrAddToQueue(p1, p2, p3) --[[ createOrAddToQueue | Line: 74 | Upvalues: ItemStreamGui (copy), v1 (copy), v2 (copy), addToQueue (copy) ]]
	for k, v in pairs(ItemStreamGui.ItemStreamFrame:GetChildren()) do
		if v1.IsFrameOpen(v) and (v.Visible and not v2:Adjust(p1, p2)) then
			addToQueue(v2.new({
				Item = p1,
				Amount = p2,
				Parent = v,
				DataValue = p3
			}))
		end
	end
end
local function trackValueObject(p1, p2) --[[ trackValueObject | Line: 89 | Upvalues: createOrAddToQueue (copy) ]]
	local v1 = p1.Value
	p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 91 | Upvalues: p1 (copy), v1 (ref), createOrAddToQueue (ref), p2 (copy) ]]
		local v12 = p1.Value - v1
		v1 = p1.Value
		if not (v12 <= 0) then
			createOrAddToQueue(p2, v12)
		end
	end)
end
local function trackCurrencyValue(p1) --[[ trackCurrencyValue | Line: 100 | Upvalues: v4 (copy), createOrAddToQueue (copy) ]]
	for k, v in pairs(p1) do
		local v1, v2
		local v3 = type(v) == "table" and v.Name or k
		if type(v) == "table" then
			v1 = v.Value
			if v1 then
				v2 = v3
			else
				v1 = v
				v2 = v3
			end
		else
			v1 = v
			v2 = v3
		end
		local v42 = v4.GetByName(v2)
		if v42 then
			local v5 = v1
			local v6 = v5.Value
			v5:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 91 | Upvalues: v5 (copy), v6 (ref), createOrAddToQueue (ref), v42 (copy) ]]
				local v12 = v5.Value - v6
				v6 = v5.Value
				if not (v12 <= 0) then
					createOrAddToQueue(v42, v12)
				end
			end)
		end
	end
end
local function trackValueFolders(p1) --[[ trackValueFolders | Line: 112 | Upvalues: v4 (copy), createOrAddToQueue (copy) ]]
	for k, v in pairs(p1) do
		for v1, v2 in v:GetChildren() do
			local v3 = v4.GetByName(v2.Name)
			if v3 and not string.find(v2.Name, "BreedingLicense") then
				local v42 = v2.Value
				v2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 91 | Upvalues: v2 (copy), v42 (ref), createOrAddToQueue (ref), v3 (copy) ]]
					local v12 = v2.Value - v42
					v42 = v2.Value
					if not (v12 <= 0) then
						createOrAddToQueue(v3, v12)
					end
				end)
			end
		end
	end
end
local function trackIndexedFolders(p1) --[[ trackIndexedFolders | Line: 124 | Upvalues: v4 (copy), createOrAddToQueue (copy) ]]
	for k, v in pairs(p1) do
		v.ChildAdded:Connect(function(p1) --[[ Line: 126 | Upvalues: v4 (ref), createOrAddToQueue (ref) ]]
			task.wait()
			local v3 = v4.GetByName(tonumber(p1.Name) and p1.Value or p1.Name)
			if v3 then
				createOrAddToQueue(v3, 1, p1)
			end
		end)
	end
end
function t.HasItemsInQueue(p1) --[[ HasItemsInQueue | Line: 137 | Upvalues: t2 (copy) ]]
	return next(t2)
end
function t.GetQueueChangedSignal(p1) --[[ GetQueueChangedSignal | Line: 141 | Upvalues: v9 (copy) ]]
	return v9
end
function t.Init(p1) --[[ Init | Line: 145 | Upvalues: trackValueFolders (copy), v7 (copy), trackIndexedFolders (copy), v6 (copy), trackCurrencyValue (copy), v5 (copy), v4 (copy), createOrAddToQueue (copy), ItemStreamGui (copy), v1 (copy), v3 (copy) ]]
	trackValueFolders({
		Food = v7:GetItemFolder("Food"),
		Tools = v7:GetItemFolder("Tools"),
		Miscellaneous = v7:GetItemFolder("Miscellaneous"),
		Potions = v7:GetItemFolder("Potions"),
		Resources = v7:GetItemFolder("Resources"),
		EquipmentPalettes = v7:GetItemFolder("EquipmentPalettes"),
		StackableChests = v7:GetItemFolder("StackableChests"),
		Capsules = v7:GetItemFolder("Capsules"),
		ItemCapsules = v7:GetItemFolder("ItemCapsules")
	})
	trackIndexedFolders({
		Equipment = v7:GetItemFolder("Equipment"),
		Chests = v7:GetItemFolder("Chests"),
		Seeds = v7:GetItemFolder("Seeds")
	})
	if v6.EventName and v7.EventData then
		for k, v in pairs(v7.EventData:GetChildren()) do
			trackCurrencyValue({
				[v.Name] = v
			})
		end
	end
	trackCurrencyValue({
		ClubTokens = v7:GetCurrencyValue("ClubTokens")
	})
	v5.GetRemoteEvent("ItemStreamRemote").OnClientEvent:Connect(function(p1) --[[ Line: 178 | Upvalues: v4 (ref), createOrAddToQueue (ref) ]]
		local v1 = v4.GetByName(p1.Name)
		if v1 then
			createOrAddToQueue(v1, p1.Amount)
		end
	end)
	for k, v in pairs(ItemStreamGui.ItemStreamFrame:GetChildren()) do
		v1.AddFrame(v, {
			Overlay = true,
			TweenAnimation = false,
			KeepPosition = true,
			InputType = v.Name,
			CheckVisibility = function() --[[ CheckVisibility | Line: 190 | Upvalues: v3 (ref) ]]
				return v3.GetGameState("ItemStream")
			end
		})
	end
end
t:Init()
return t