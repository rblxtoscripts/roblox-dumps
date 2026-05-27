-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("AnalyticsService", "Server")
local v3 = if v1 then Sonar("DatastoreClass") else v1
local v4 = Sonar("EventUtils")
local v5 = Sonar("ItemSetService")
local v6 = Sonar("RemoteUtils").GetRemoteFunction("RedeemCodeRemote")
local v7 = v1 and v3.new("live/codes") or nil
local t2 = {}
function t.CanRedeemCode(p1, p2) --[[ CanRedeemCode | Line: 23 | Upvalues: t2 (ref) ]]
	local v1 = t2[p2]
	if not v1 then
		return "NoExist"
	end
	if p1.PlayerData.Codes:FindFirstChild(p2) then
		return "AlreadyRedeemed"
	end
	local UnixTimestamp = DateTime.now().UnixTimestamp
	if v1.StartTime and UnixTimestamp < v1.StartTime then
		return "Error"
	end
	if v1.EndTime and v1.EndTime < UnixTimestamp then
		return "Expired"
	end
	if v1.Permission and not p1:HasPermission(v1.Permission) then
		return "Error"
	end
	if v1.Player then
		if type(v1.Player) == "table" then
			if not table.find(v1.Player, p1.Player.UserId) then
				return "Error"
			end
		elseif p1.Player.UserId ~= v1.Player then
			return "Error"
		end
	end
	return true, v1
end
function t.RedeemCode(p1, p2, p3) --[[ RedeemCode | Line: 62 | Upvalues: v1 (copy), v5 (copy), v2 (copy), v6 (copy) ]]
	if not v1 then
		return v6:InvokeServer(string.lower(p2))
	end
	local v12 = Instance.new("BoolValue")
	v12.Name = p2
	v12.Parent = p1.PlayerData.Codes
	for v22, v3 in p3.Rewards do
		if type(v3) == "table" and v3.Species then
			local v4 = v5:_giveHorse(p1, v3)
			if v4 then
				v2.ReportResourceEvent(p1.Player, "Source", "HorseSlot", v4.Species.Value, "CodeRedemption", 1)
			end
			continue
		end
		local v52 = v3.Name
		local v62 = if typeof(v3) == "table" then true else false
		local t = {
			Source = "Codes",
			IgnoreLimit = true,
			Name = v52,
			Amount = if v62 then v3.Amount or 1 elseif v3 then v3 else 1,
			Theme = if v62 then v3.Theme else v62,
			ThemeChance = if v62 then v3.ThemeChance else v62
		}
		t.ItemStream = if v52 == "Coins" then true else false
		p1:GiveItem(t)
	end
	return "Redeemed"
end
function t.RefreshCodes() --[[ RefreshCodes | Line: 100 | Upvalues: v1 (copy), t2 (ref), v7 (copy) ]]
	if v1 then
		t2 = v7:Get("ActiveCodes", t2)
	end
end
function t.Init(p1) --[[ Init | Line: 108 | Upvalues: v4 (copy), t (copy) ]]
	v4.spawnLoop(t.RefreshCodes, 60, true)
end
if v1 then
	local DataStoreService = game:GetService("DataStoreService")
	local GetApprovalsTableRemote = Instance.new("RemoteFunction")
	function t.CodeApprovalsQueue() --[[ CodeApprovalsQueue | Line: 116 | Upvalues: DataStoreService (copy) ]]
		local v1 = DataStoreService:GetDataStore("codes/approvals")
		local v2 = v1:GetAsync("1")
		if not v2 then
			v2 = {}
			v1:SetAsync("1", v2)
		end
		return v2
	end
	GetApprovalsTableRemote.Name = "GetApprovalsTableRemote"
	function GetApprovalsTableRemote.OnServerInvoke(p1) --[[ Line: 129 | Upvalues: t (copy) ]]
		return t.CodeApprovalsQueue()
	end
	GetApprovalsTableRemote.Parent = ReplicatedStorage
else
	local GetApprovalsTableRemote = ReplicatedStorage:WaitForChild("GetApprovalsTableRemote")
	function t.CodeApprovalsQueue() --[[ CodeApprovalsQueue | Line: 135 | Upvalues: GetApprovalsTableRemote (copy) ]]
		return GetApprovalsTableRemote:InvokeServer()
	end
end
t:Init()
return t