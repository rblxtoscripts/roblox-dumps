-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataUpdateService", "Server")
local v2 = Sonar("MarketplaceService")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("FormatTime")
local v6 = Sonar("DataUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("BattlepassService")
local v9 = Sonar("Battlepass")
local t = {}
t.__index = t
local v10 = Sonar("Constants")
local v11 = v4.GetConfig("Battlepass")()
function t.new(p1) --[[ new | Line: 34 | Upvalues: t (copy), v7 (copy), v10 (copy) ]]
	local v2 = setmetatable({}, t)
	if not p1:IsLocalOrServer() then
		return v2
	end
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = p1.PlayerData
	v2.BattlepassFolder = v2.PlayerData.Battlepasses
	v2.ActiveBattlepasses = {}
	v2.ActivatedBattlepassChangedSignal = v7.new()
	if v10.IS_SERVER then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initServer(p1) --[[ _initServer | Line: 60 | Upvalues: v8 (copy) ]]
	for v1, v2 in p1.BattlepassFolder:GetChildren() do
		if not v8.GetBattlepassData(v2.Name) then
			warn("Found old battlepass in player data. Data is being destroyed:", v2.Name)
			v2:Destroy()
		end
	end
	p1.Maid:GiveTask(function() --[[ Line: 68 | Upvalues: p1 (copy) ]]
		if not p1.ActiveBattlepasses then
			local v1
			table.clear(p1)
			v1 = p1
			setmetatable(p1, nil)
			return
		end
		for v2, v3 in p1.ActiveBattlepasses do
			v3:Destroy()
		end
		table.clear(p1)
		setmetatable(p1, nil)
	end)
end
function t._initClient(p1) --[[ _initClient | Line: 81 ]]
	local function battlepassAdded(p12) --[[ battlepassAdded | Line: 82 | Upvalues: p1 (copy) ]]
		local v1 = p12.Name
		local function battlepassActiveChanged() --[[ battlepassActiveChanged | Line: 84 | Upvalues: p12 (copy), p1 (ref), v1 (copy) ]]
			if p12.Active.Value then
				p1:_forceActivateBattlepass(v1)
			else
				p1:DeactivateBattlepass(v1)
			end
		end
		p1.Maid:GiveTask(p12.Active.Changed:Connect(battlepassActiveChanged))
		if p12.Active.Value then
			p1:_forceActivateBattlepass(v1)
		else
			p1:DeactivateBattlepass(v1)
		end
	end
	p1.Maid:GiveTask(p1.BattlepassFolder.ChildAdded:Connect(battlepassAdded))
	for v1, v2 in p1.BattlepassFolder:GetChildren() do
		local v3 = v2.Name
		local function battlepassActiveChanged() --[[ battlepassActiveChanged | Line: 84 | Upvalues: v2 (copy), p1 (copy), v3 (copy) ]]
			if v2.Active.Value then
				p1:_forceActivateBattlepass(v3)
			else
				p1:DeactivateBattlepass(v3)
			end
		end
		p1.Maid:GiveTask(v2.Active.Changed:Connect(battlepassActiveChanged))
		if v2.Active.Value then
			p1:_forceActivateBattlepass(v3)
			continue
		end
		p1:DeactivateBattlepass(v3)
	end
end
function t.GetBattlepassPlayerData(p1, p2) --[[ GetBattlepassPlayerData | Line: 101 ]]
	return p1.BattlepassFolder:FindFirstChild(p2)
end
function t.GetOrCreateBattlepassPlayerData(p1, p2) --[[ GetOrCreateBattlepassPlayerData | Line: 106 | Upvalues: v10 (copy), v6 (copy), v8 (copy) ]]
	local v1 = p1:GetBattlepassPlayerData(p2)
	if not v1 and v10.IS_SERVER then
		local v2 = v6.CreateDataValueFromType("Battlepasses")
		v2.Name = p2
		v2.Parent = p1.BattlepassFolder
		v1 = v2
	end
	if v1 and v10.IS_SERVER then
		for v3, v4 in v8.GetBattlepassSequence(p2):GetTracks() do
			if not v1.Tracks:FindFirstChild(v3) then
				local v5 = Instance.new("BoolValue")
				v5.Name = v3
				v5.Value = false
				v5.Parent = v1.Tracks
			end
		end
	end
	return v1
end
function t.GetBattlepass(p1, p2) --[[ GetBattlepass | Line: 132 ]]
	return p1.ActiveBattlepasses[p2]
end
function t.IsBattlepassActive(p1, p2) --[[ IsBattlepassActive | Line: 137 ]]
	local v1 = p1:GetBattlepassPlayerData(p2)
	return if v1 then v1.Active.Value else v1
end
function t.GetActiveBattlepasses(p1, p2) --[[ GetActiveBattlepasses | Line: 145 ]]
	local v1 = if p2 then p2 else {}
	v1.Category = v1.Category or "All"
	local v2, v3 = v1, {}
	for v4, v5 in p1.ActiveBattlepasses do
		if v2.Category == "All" or v5.BattlepassData.Category == v2.Category then
			table.insert(v3, v5)
		end
	end
	return v3
end
function t.GetMaxActiveBattlepasses(p1, p2) --[[ GetMaxActiveBattlepasses | Line: 166 | Upvalues: v11 (copy), v8 (copy) ]]
	local v1 = if p2 then p2 else {}
	v1.Category = v1.Category or "Total"
	local v2 = v11.MaxActiveBattlepasses[v1.Category]
	if not v2 then
		return 0
	end
	if typeof(v2) == "number" then
		return v2
	end
	local v3 = v8.GetMaxBattlepassSequence()
	local v4 = v3:GetTrack(v1.Category)
	if not v4 then
		return 0
	end
	local v5 = v1.WhenFullyUpgraded and v4.Tiers[#v4.Tiers] or v3:GetCurrentTier(p1.PlayerWrapper, v4)
	return if v5 then v5.Amount or 0 else 0
end
function t.GetMaxActiveBattlepassesChangedSignal(p1, p2) --[[ GetMaxActiveBattlepassesChangedSignal | Line: 193 | Upvalues: v8 (copy) ]]
	return v8.GetMaxBattlepassSequence():GetTiersChangedSignal(p1.PlayerWrapper, p2 or "Total")
end
function t.CanActivateBattlepass(p1, p2, p3) --[[ CanActivateBattlepass | Line: 206 | Upvalues: v8 (copy) ]]
	return v8.CanBattlepassBeActivated(p2, p1.PlayerWrapper, p3)
end
function t.PurchaseBattlepassActivation(p1, p2, p3) --[[ PurchaseBattlepassActivation | Line: 215 | Upvalues: v8 (copy), v2 (copy) ]]
	if not p1:CanActivateBattlepass(p2, p3) then
		return false
	end
	if p3.Robux then
		v2.PromptPurchase(p1.PlayerWrapper.Player, v8.GetActivateBattlepassProductId(p2), "DeveloperProduct", {
			PassName = p2,
			CanBattlepassBeActivatedOptions = p3
		})
		return true
	end
	local v22 = v8.GetPriceToActivate(p2, p1.PlayerWrapper)
	if not p1:ActivateBattlepass(p2, p3) then
		return false
	end
	if not v22 then
		return true
	end
	for v3, v4 in v22 do
		p1.PlayerWrapper:RemoveItem({
			Name = v3,
			Amount = v4,
			AnalyticsSource = "BattlepassActivation-" .. p2
		})
	end
	return true
end
function t.ActivateBattlepass(p1, p2, p3) --[[ ActivateBattlepass | Line: 254 | Upvalues: v10 (copy), v5 (copy) ]]
	local v1 = if p3 then p3 else {}
	assert(v10.IS_SERVER, "ActiveBattlepass can only be called on the server")
	local v2, v3 = p1:CanActivateBattlepass(p2, v1)
	if not v2 then
		return false
	end
	if v1.Reset and p1:CanResetBattlepass(p2) then
		p1:ResetBattlepass(p2)
	end
	if v3 then
		p1:DeactivateBattlepass(v3)
	end
	local v4 = p1:GetOrCreateBattlepassPlayerData(p2)
	v4.Active.Value = true
	if not (v4.Value <= 0) then
		p1:_forceActivateBattlepass(p2)
		return true
	end
	v4.Value = v5.GetTime()
	p1:_forceActivateBattlepass(p2)
	return true
end
function t._forceActivateBattlepass(p1, p2) --[[ _forceActivateBattlepass | Line: 286 | Upvalues: v9 (copy) ]]
	if not p1.ActiveBattlepasses[p2] then
		p1.ActiveBattlepasses[p2] = v9.new(p1:GetOrCreateBattlepassPlayerData(p2), p1.PlayerWrapper)
		p1.ActivatedBattlepassChangedSignal:Fire(p2, true)
	end
end
function t.DeactivateBattlepass(p1, p2) --[[ DeactivateBattlepass | Line: 299 ]]
	local v1 = p1.ActiveBattlepasses[p2]
	if v1 then
		v1:GetUnlockSequence():ClaimAvailableTiers(p1.PlayerWrapper)
		v1.BattlepassValue.Active.Value = false
		v1:Destroy()
		p1.ActiveBattlepasses[p2] = nil
		p1.ActivatedBattlepassChangedSignal:Fire(p2, false)
		return true
	else
		return false
	end
end
function t.GetBattlepassToDeactivate(p1, p2) --[[ GetBattlepassToDeactivate | Line: 322 | Upvalues: v8 (copy) ]]
	if p2 == false then
		return nil
	end
	local v1 = if p2 then p2 else {}
	local v2 = if v1 == true then {
	Category = "All"
} else v1
	local v3 = nil
	local v4 = v2.PassName or v2.PreviousOnly
	local v5
	if v2.PreviousOnly then
		local v6 = v8.GetBattlepassOrder({
			UnlockedOnly = true,
			Sort = "Ascending",
			Category = v2.Category,
			PlayerWrapper = p1.PlayerWrapper
		})[1]
		v5 = if v6 then v6.Name else v6
	else
		v5 = nil
	end
	if v2.PassName then
		v5 = v2.PassName
	end
	for v82, v9 in p1:GetActiveBattlepasses(v2) do
		if v8.CanBattlepassBeActivated(v9.BattlepassName) and v9.BattlepassName ~= v5 then
			if not v4 and (v2.Category == "All" or v9.Category == v2.Category) then
				v3 = v9
			end
		else
			v3 = v9
			break
		end
	end
	return if v3 then v3.BattlepassName else v3
end
function t.CanResetBattlepass(p1, p2) --[[ CanResetBattlepass | Line: 382 | Upvalues: v8 (copy) ]]
	local v1 = v8.GetBattlepassSequence(p2)
	if v1 then
		return v1:IsSequenceCompleted(p1.PlayerWrapper)
	else
		return false
	end
end
function t.ResetBattlepass(p1, p2) --[[ ResetBattlepass | Line: 393 | Upvalues: v8 (copy) ]]
	local v1 = p1:GetBattlepassPlayerData(p2)
	if v1 then
		local v2 = v8.GetBattlepassSequence(p2)
		v2:ClaimAvailableTiers(p1.PlayerWrapper)
		v2:ResetPlayerData(p1.PlayerWrapper)
		v1.Value = -1
		v1.XP.Value = 0
	end
end
function t.IncrementBattlepass(p1, p2) --[[ IncrementBattlepass | Line: 413 | Upvalues: v11 (copy) ]]
	local v1 = if p2 then p2 else {}
	local Amount = v1.Amount
	if typeof(v1.Amount) == "string" then
		Amount = v11.XPAmountPresets[Amount]
		if not Amount then
			warn("\226\154\160\239\184\143 BattlepassWrapper:IncrementBattlepass - Invalid battlepass XP amount preset:", v1.Amount)
			return
		end
	end
	local v3, v4 = v1, if Amount then Amount else v11.XPAmountPresets.Default or 1
	for v5, v6 in p1:GetActiveBattlepasses() do
		if v6:CanIncrementProgress(v3) and (if v3.Category == "All" or v3.Category == v6.BattlepassData.Category then true elseif v3.PassName == v6.BattlepassName then true else false) then
			v6:IncrementProgress(v4)
		end
	end
end
function t.GetActivatedBattlepassChangedSignal(p1) --[[ GetActivatedBattlepassChangedSignal | Line: 444 ]]
	return p1.ActivatedBattlepassChangedSignal
end
function t.Init(p1) --[[ Init | Line: 449 | Upvalues: v10 (copy), v1 (copy), v3 (copy), v8 (copy), v11 (copy) ]]
	if not v10.IS_SERVER then
		return
	end
	v1.AddRigDataCallback(function(p1) --[[ Line: 451 | Upvalues: v3 (ref), v8 (ref), v11 (ref) ]]
		if not p1:FindFirstChild("Battlepasses") then
			v3.Create("Folder", {
				Name = "Battlepasses",
				Parent = p1
			})
		end
		local BattlepassCapacity = p1:FindFirstChild("BattlepassCapacity")
		if not BattlepassCapacity then
			BattlepassCapacity = v3.Create("Folder", {
				Name = "BattlepassCapacity",
				Parent = p1
			})
		end
		local v2 = v8.GetMaxBattlepassSequence()
		for v32, v4 in v11.MaxActiveBattlepasses do
			if not BattlepassCapacity:FindFirstChild(v32) and v2:GetTrack(v32) then
				v3.Create("IntValue", {
					Value = 0,
					Name = v32,
					Parent = BattlepassCapacity
				})
			end
		end
	end)
end
return t