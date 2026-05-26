-- https://lua.expert/
local t = {}
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("DataStore", {
	Context = "Server"
})
local v2 = Sonar("PlaceTypeService")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("Signal")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("TableUtils")
local v8 = Sonar("TeleportSequence", {
	Context = "Client"
})
local v9 = Sonar("GameVersionUtils")
local v10 = RunService:IsServer()
local v11 = RunService:IsStudio()
local v12 = v9:IsPrivateServer()
local t2 = {
	[Enum.TeleportResult.Failure] = true,
	[Enum.TeleportResult.GameNotFound] = true,
	[Enum.TeleportResult.IsTeleporting] = true,
	[Enum.TeleportResult.Unauthorized] = true,
	[Enum.TeleportResult.Flooded] = true,
	[Enum.TeleportResult.GameFull] = true,
	Studio = true
}
local v13 = v6.GetConfig("PlaceTeleport")()
local v14 = v10 and v12 and v1.new("PlaceTeleportService_ReservedCodes" .. "/" .. game.PrivateServerOwnerId)
local t3 = {}
local t4 = {}
local t5 = {}
local v15 = nil
local v16 = v4.GetRemoteEvent("PrepareTeleportRemote")
local v17 = v4.GetRemoteEvent("TeleportFailedRemote")
local function reserveServer(p1) --[[ reserveServer | Line: 256 | Upvalues: TeleportService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 258 | Upvalues: TeleportService (ref), p1 (copy) ]]
		return TeleportService:ReserveServerAsync(p1)
	end)
	if v1 then
		return v2
	else
		warn("\226\154\160\239\184\143 PlaceTeleportService: Failed to reserve server for place", p1, ":", v2)
		return nil
	end
end
local function getOrCreateReservedCode(p1) --[[ getOrCreateReservedCode | Line: 274 | Upvalues: v12 (copy), t3 (copy), v14 (copy), TeleportService (copy) ]]
	if not v12 then
		return nil
	end
	local v1 = tostring(p1)
	if t3[v1] then
		return t3[v1]
	end
	local v2 = v14:Get(v1)
	if type(v2) == "string" then
		t3[v1] = v2
		print("\226\154\153\239\184\143 PlaceTeleportService: Retrieved existing reserved server for place", p1, v2)
		return v2
	end
	local v3, v4 = pcall(function() --[[ Line: 258 | Upvalues: TeleportService (ref), p1 (copy) ]]
		return TeleportService:ReserveServerAsync(p1)
	end)
	local v5
	if v3 then
		v5 = v4
	else
		warn("\226\154\160\239\184\143 PlaceTeleportService: Failed to reserve server for place", p1, ":", v4)
		v5 = nil
	end
	if v5 then
		v14:Set(v1, v5)
		t3[v1] = v5
		print("\226\154\153\239\184\143 PlaceTeleportService: Created reserved server for place", p1, v5)
		return v5
	else
		return nil
	end
end
local function getPendingTeleportForPlayer(p1) --[[ getPendingTeleportForPlayer | Line: 312 | Upvalues: t4 (copy) ]]
	if t4[p1] then
		return t4[p1]
	end
	for v1, v2 in t4 do
		if v2.Players and v2.Players[p1] then
			return v2
		end
	end
	return nil
end
local function removePendingTeleportForPlayer(p1) --[[ removePendingTeleportForPlayer | Line: 330 | Upvalues: t4 (copy) ]]
	local function teleportEnded(p1) --[[ teleportEnded | Line: 331 ]]
		if not p1.Ended then
			return
		end
		p1.Ended:Fire()
		p1.Ended:Destroy()
	end
	if t4[p1] then
		local v1 = t4[p1]
		if v1.Ended then
			v1.Ended:Fire()
			v1.Ended:Destroy()
		end
		t4[p1] = nil
	end
	for v2, v3 in t4 do
		if v3.Players then
			v3.Players[p1] = nil
			if not next(v3.Players) then
				if v3.Ended then
					v3.Ended:Fire()
					v3.Ended:Destroy()
				end
				t4[v2] = nil
			end
		end
	end
end
local function handleTeleportFailure(p1, p2) --[[ handleTeleportFailure | Line: 363 | Upvalues: t2 (copy), t4 (copy), t5 (copy), removePendingTeleportForPlayer (copy), v17 (copy) ]]
	if not t2[p2] then
		return
	end
	local v1
	if t4[p1] then
		v1 = t4[p1]
	else
		v1 = nil
		for v2, v3 in t4 do
			if v3.Players and v3.Players[p1] then
				v1 = v3
				break
			end
		end
	end
	if v1 then
		t5[p1] = p2
		removePendingTeleportForPlayer(p1)
		warn("\226\154\160\239\184\143 PlaceTeleportService: Teleport failed for", p1.Name, "- Result:", p2)
		v17:FireClient(p1, p2)
	end
end
local function teleportAsync(p1, p2, p3, p4) --[[ teleportAsync | Line: 388 | Upvalues: v7 (copy), v12 (copy), getOrCreateReservedCode (copy), TeleportService (copy), v11 (copy) ]]
	local v1 = type(p1) == "table" and v7.ToListByIndex(p1) or { p1 }
	p3.TeleportSequence = p4.TeleportSequence
	local TeleportOptions = Instance.new("TeleportOptions")
	TeleportOptions:SetTeleportData(p3)
	if p4.JobId then
		TeleportOptions.ServerInstanceId = p4.JobId
	else
		local ReservedServerCode = p4.ReservedServerCode
		local v2, v3, v4
		if ReservedServerCode or (not v12 or p4.UseReservedServer == false) then
			if p4.UseReservedServer then
				v2 = getOrCreateReservedCode(p2)
				if not v2 then
					v3, v4 = pcall(function() --[[ Line: 258 | Upvalues: TeleportService (ref), p2 (copy) ]]
						return TeleportService:ReserveServerAsync(p2)
					end)
					if v3 then
						v2 = v4
					else
						warn("\226\154\160\239\184\143 PlaceTeleportService: Failed to reserve server for place", p2, ":", v4)
						v2 = nil
					end
				end
				ReservedServerCode = v2
			end
		else
			v2 = getOrCreateReservedCode(p2)
			if not v2 then
				v3, v4 = pcall(function() --[[ Line: 258 | Upvalues: TeleportService (ref), p2 (copy) ]]
					return TeleportService:ReserveServerAsync(p2)
				end)
				if v3 then
					v2 = v4
				else
					warn("\226\154\160\239\184\143 PlaceTeleportService: Failed to reserve server for place", p2, ":", v4)
					v2 = nil
				end
			end
			ReservedServerCode = v2
		end
		if ReservedServerCode then
			TeleportOptions.ReservedServerAccessCode = ReservedServerCode
		end
	end
	if v11 then
		return false, "Studio"
	else
		local v5, v6 = pcall(function() --[[ Line: 413 | Upvalues: TeleportService (ref), p2 (copy), v1 (copy), TeleportOptions (copy) ]]
			return TeleportService:TeleportAsync(p2, v1, TeleportOptions)
		end)
		return v5, v6
	end
end
local function removeFailedTeleport(p1) --[[ removeFailedTeleport | Line: 424 | Upvalues: t5 (copy), t (copy) ]]
	if t5[p1] then
		t5[p1] = nil
		t.SetPlayerTeleporting(p1, false)
	end
end
local function prepareTeleport(p1, p2, p3) --[[ prepareTeleport | Line: 440 | Upvalues: t (copy), v2 (copy), v13 (copy), v7 (copy), v5 (copy), t4 (copy), v11 (copy), v16 (copy) ]]
	local v1 = if p3 then p3 else {}
	if type(p1) == "table" then
		local v22 = tick()
		v3 = v1
		v4 = nil
		for v52, v6 in p1 do
			local v72 = t.CanTeleport(v6, p2, v3)
			if v72 ~= true then
				return v72
			end
			local v8 = v3.TeleportData or {}
			v8.SourcePlaceId = game.PlaceId
			v8.SourcePlaceType = v2.GetPlaceType()
			if v13.AddPartyTeleportData then
				v8 = v7.Merge(v8, v13.AddPartyTeleportData(p2, v3))
			end
			if not v4 then
				v4 = {
					TeleportId = v22,
					PlaceId = p2,
					Options = v3,
					Players = {},
					TeleportData = v8,
					Ended = v5.new()
				}
			end
			v4.Players[v6] = true
		end
		t4[v22] = v4
		if v11 then
			print("\226\156\133 PlaceTeleportService: Prepared teleport for", v4.Players, "to place", p2)
		end
		for v10, v112 in v4.Players do
			t.SetPlayerTeleporting(v10, true)
			local t2 = {
				PlaceId = p2,
				TeleportSequence = v3.TeleportSequence
			}
			t2.TeleportSequenceData = v3.TeleportSequenceData or {}
			v16:FireClient(v10, t2)
		end
		return true, t4[v22]
	else
		local v14, v15 = t.CanTeleport(p1, p2, v1)
		if v14 ~= true then
			return v14
		end
		local v162 = v1.TeleportData or {}
		v162.SourcePlaceId = game.PlaceId
		v162.SourcePlaceType = v2.GetPlaceType()
		local v17
		if v13.AddTeleportData then
			v17, v162 = v1, v7.Merge(v162, v13.AddTeleportData(v15, p2, v1))
		else
			v17 = v1
		end
		t4[p1] = {
			TeleportId = p1,
			PlaceId = p2,
			Options = v17,
			TeleportData = v162,
			Ended = v5.new()
		}
		t.SetPlayerTeleporting(p1, true)
		local t2 = {
			PlaceId = p2,
			TeleportSequence = v17.TeleportSequence
		}
		t2.TeleportSequenceData = v17.TeleportSequenceData or {}
		v16:FireClient(p1, t2)
		if v11 then
			print("\226\156\133 PlaceTeleportService: Prepared teleport for", p1.Name, "to place", p2)
		end
		return true, t4[p1]
	end
end
local function executeTeleport(p1, p2) --[[ executeTeleport | Line: 543 | Upvalues: t4 (copy), teleportAsync (copy), handleTeleportFailure (copy), v11 (copy) ]]
	local v1
	if t4[p1] then
		v1 = t4[p1]
	else
		v1 = nil
		for v2, v3 in t4 do
			if v3.Players and v3.Players[p1] then
				v1 = v3
				break
			end
		end
	end
	if not v1 then
		return "NoPendingTeleport"
	end
	local v4 = v1.Options or {}
	v4.TeleportSequence = p2
	local v5 = if v1.Players == nil then false else true
	if v5 then
		if v1.Processing then
			return true
		end
		v1.Processing = true
		task.wait(1)
	end
	local v8, v9 = teleportAsync(v5 and v1.Players or p1, v1.PlaceId, v1.TeleportData, v4)
	if v8 then
		if v5 then
			if v11 then
				print("\226\156\133 PlaceTeleportService: Teleported for party to place", v1.PlaceId)
				return v8
			end
		else
			if not v11 then
				return v8
			end
			print("\226\156\133 PlaceTeleportService: Teleported for", p1.Name, "to place", v1.PlaceId)
		end
	else
		for v112, v12 in v1.Players or {
			[p1] = true
		} do
			handleTeleportFailure(v112, v9)
		end
	end
	return v8
end
function t.GetReservedServerCode(p1) --[[ GetReservedServerCode | Line: 595 | Upvalues: getOrCreateReservedCode (copy) ]]
	return getOrCreateReservedCode(p1)
end
function t.IsPlayerTeleporting(p1) --[[ IsPlayerTeleporting | Line: 603 | Upvalues: v3 (copy) ]]
	local v1 = v3.getWrapperFromPlayer(p1)
	if v1 then
		return v1:IsInAction("Teleporting")
	else
		return false
	end
end
function t.SetPlayerTeleporting(p1, p2) --[[ SetPlayerTeleporting | Line: 616 | Upvalues: v3 (copy) ]]
	local v1 = v3.getWrapperFromPlayer(p1)
	if v1 then
		v1:SetActionState("Teleporting", p2)
	end
end
function t.CanTeleport(p1, p2, p3) --[[ CanTeleport | Line: 630 | Upvalues: v3 (copy), t (copy), t4 (copy), v2 (copy), v13 (copy) ]]
	local v1 = v3.getWrapperFromPlayer(p1)
	if not v1 then
		return "PlayerWrapperNotFound"
	end
	if t.IsPlayerTeleporting(p1) or t4[p1] then
		return "AlreadyTeleporting"
	end
	if not v2.GetPlaceInfo(p2) then
		return "PlaceNotFound"
	end
	if v13.CanTeleport then
		local v22 = v13.CanTeleport(v1, p2, p3)
		if v22 ~= true then
			return v22
		end
	end
	return true, v1
end
function t.TeleportToPlace(p1, p2, p3) --[[ TeleportToPlace | Line: 661 | Upvalues: v10 (copy), prepareTeleport (copy), t (copy) ]]
	if v10 then
		return prepareTeleport(p1, p2, p3)
	else
		return t.RequestToTeleport("ToPlaceId", p2, p3)
	end
end
function t.TeleportToPlaceType(p1, p2, p3) --[[ TeleportToPlaceType | Line: 675 | Upvalues: v10 (copy), v2 (copy), prepareTeleport (copy), t (copy) ]]
	if not v10 then
		return t.RequestToTeleport("ToPlaceType", p2, p3)
	end
	local v1 = if p3 then p3 else {}
	local v22 = v1.Context or v2.GetPlaceContext()
	local v4 = next((v2.GetPlacesByType(p2, v22)))
	if v4 then
		return prepareTeleport(p1, v4, v1)
	else
		warn("\226\154\160\239\184\143 PlaceTeleportService: No places found for type", p2, "in context", v22)
		return false
	end
end
function t.TeleportToPlaceName(p1, p2, p3) --[[ TeleportToPlaceName | Line: 701 | Upvalues: v10 (copy), v2 (copy), prepareTeleport (copy), t (copy) ]]
	if not v10 then
		return t.RequestToTeleport("ToPlaceName", p2, p3)
	end
	local v1 = v2.GetPlaceIdFromName(p2)
	if v1 then
		return prepareTeleport(p1, v1, p3)
	else
		warn("\226\154\160\239\184\143 PlaceTeleportService: Place not found:", p2)
		return false
	end
end
function t.FollowPlayer(p1, p2, p3) --[[ FollowPlayer | Line: 722 | Upvalues: v10 (copy), TeleportService (copy), prepareTeleport (copy), v4 (copy) ]]
	if not v10 then
		return v4.GetRemoteFunction("FollowPlayerRemote"):InvokeServer(p2, p3)
	end
	local v1, v2, v3, v42, v5 = pcall(function() --[[ Line: 725 | Upvalues: TeleportService (ref), p2 (copy) ]]
		return TeleportService:GetPlayerPlaceInstanceAsync(p2)
	end)
	if v1 then
		return prepareTeleport(p1, v42, {
			UseReservedServer = false,
			JobId = v5,
			TeleportData = p3
		})
	else
		warn("\226\154\160\239\184\143 PlaceTeleportService, FollowPlayer: Failed to get player location:", v3 or v2)
		return false
	end
end
function t.RequestToTeleport(p1, ...) --[[ RequestToTeleport | Line: 749 | Upvalues: v4 (copy) ]]
	return v4.GetRemoteFunction("TeleportToRemote"):InvokeServer(p1, ...)
end
function t.ReadyToTeleport(...) --[[ ReadyToTeleport | Line: 757 | Upvalues: v4 (copy) ]]
	return v4.GetRemoteEvent("ReadyToTeleportRemote"):FireServer(...)
end
function t.RemoveFailedTeleport() --[[ RemoveFailedTeleport | Line: 762 | Upvalues: v4 (copy) ]]
	return v4.GetRemoteEvent("RemoveFailedTeleportRemote"):FireServer()
end
function t.OnPrepareToTeleport(p1) --[[ OnPrepareToTeleport | Line: 770 | Upvalues: v16 (copy) ]]
	return v16.OnClientEvent:Connect(p1)
end
function t.OnTeleportFailed(p1) --[[ OnTeleportFailed | Line: 778 | Upvalues: v17 (copy) ]]
	return v17.OnClientEvent:Connect(p1)
end
function t.SetTeleportGui(p1) --[[ SetTeleportGui | Line: 785 | Upvalues: TeleportService (copy) ]]
	TeleportService:SetTeleportGui(p1)
end
function t.GetTeleportSequence() --[[ GetTeleportSequence | Line: 792 | Upvalues: v15 (ref) ]]
	return v15
end
function t.SetTeleportSequence(p1) --[[ SetTeleportSequence | Line: 799 | Upvalues: v15 (ref), v8 (copy) ]]
	v15 = if p1 then v8.Create(p1) else nil
	return v15
end
function t.CreateArrivalTeleportScreen(p1) --[[ CreateArrivalTeleportScreen | Line: 808 | Upvalues: v8 (copy) ]]
	return v8.new(p1)
end
function t.GetPendingTeleport(p1) --[[ GetPendingTeleport | Line: 816 | Upvalues: t4 (copy) ]]
	return t4[p1]
end
function t.Init(p1) --[[ Init | Line: 820 | Upvalues: v10 (copy), TeleportService (copy), handleTeleportFailure (copy), v3 (copy), removePendingTeleportForPlayer (copy), t5 (copy), v4 (copy), executeTeleport (copy), removeFailedTeleport (copy), t (copy), v12 (copy), getOrCreateReservedCode (copy), v13 (copy) ]]
	if v10 then
		TeleportService.TeleportInitFailed:Connect(handleTeleportFailure)
		v3.bindToPlayers({
			OnRemoved = function(p1) --[[ OnRemoved | Line: 826 | Upvalues: removePendingTeleportForPlayer (ref), t5 (ref) ]]
				removePendingTeleportForPlayer(p1)
				t5[p1] = nil
			end
		})
		v4.GetRemoteEvent("ReadyToTeleportRemote").OnServerEvent:Connect(executeTeleport)
		v4.GetRemoteEvent("RemoveFailedTeleportRemote").OnServerEvent:Connect(removeFailedTeleport)
		v4.GetRemoteFunction("TeleportToRemote").OnServerInvoke = function(p1, p2, ...) --[[ Line: 839 | Upvalues: t (ref) ]]
			if p2 == "ToPlaceId" then
				return t.TeleportToPlace(p1, ...)
			end
			if p2 == "ToPlaceType" then
				return t.TeleportToPlaceType(p1, ...)
			end
			if p2 == "ToPlaceName" then
				return t.TeleportToPlaceName(p1, ...)
			end
			if p2 == "FollowPlayer" then
				return t.FollowPlayer(p1, ...)
			else
				return false
			end
		end
		if v12 then
			task.spawn(getOrCreateReservedCode, game.PlaceId)
		end
	else
		t.OnPrepareToTeleport(function(p1) --[[ Line: 857 | Upvalues: v13 (ref), t (ref) ]]
			local v1 = p1.TeleportSequence or "Default"
			if v13.TeleportSequences[v1] then
				t.SetTeleportSequence({
					Name = v1,
					TeleportInfo = p1
				}):Start()
				return
			end
			if not p1.TeleportSequence then
				t.ReadyToTeleport()
				return
			end
			warn("\226\154\160\239\184\143 PlaceTeleportService: Sequence not found:", v1)
			t.ReadyToTeleport()
		end)
		t.OnTeleportFailed(function(p1) --[[ Line: 878 | Upvalues: t (ref) ]]
			local v1 = t.GetTeleportSequence()
			if v1 then
				v1:Fail(p1)
			else
				warn("\226\154\160\239\184\143 PlaceTeleportService: Teleport failed but no sequence found:", p1)
				t.RemoveFailedTeleport()
			end
			t.SetTeleportSequence(nil)
		end)
	end
end
t:Init()
return t