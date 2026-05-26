-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("UnlockSequence")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("MarketplaceService")
local v5 = Sonar("Signal")
local v6 = Sonar("NotificationsService")
local v7 = game:GetService("RunService"):IsServer()
local t2 = {
	TierNotCompleted = "You do not have the requirements!"
}
local t3 = {}
local v8 = v5.new()
function t.AddSequence(p1, p2) --[[ AddSequence | Line: 217 | Upvalues: t (copy), v2 (copy), t3 (copy), v8 (copy) ]]
	if t.GetSequence(p1) then
		warn("\226\154\160\239\184\143 UnlockSequenceService, Sequence already exists", p1)
	else
		local v1 = v2.new(p1, p2)
		t3[p1] = v1
		v8:Fire(v1)
		return v1
	end
end
function t.GetSequence(p1) --[[ GetSequence | Line: 232 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.GetSequenceAddedSignal(p1) --[[ GetSequenceAddedSignal | Line: 236 | Upvalues: v5 (copy), v8 (copy) ]]
	local v1 = v5.new()
	v1:GiveTask(v8:Connect(function(p12) --[[ Line: 239 | Upvalues: p1 (copy), v1 (copy) ]]
		if p12.Name ~= p1 then
			return
		end
		v1:Fire(p12)
	end))
	return v1
end
function t.OnSequenceAdded(p1, p2) --[[ OnSequenceAdded | Line: 248 | Upvalues: t (copy) ]]
	local v1 = t.GetSequenceAddedSignal(p1)
	v1:Connect(p2)
	local v2 = t.GetSequence(p1)
	if not v2 then
		return v1
	end
	p2(v2)
	return v1
end
function t.YieldForSequence(p1) --[[ YieldForSequence | Line: 261 | Upvalues: t (copy) ]]
	local v1 = nil
	while not v1 do
		local v2 = t.GetSequence(p1)
		if v2 then
			v1 = v2
			continue
		end
		task.wait()
		v1 = v2
	end
	return v1
end
function t.RequestToClaimTier(p1) --[[ RequestToClaimTier | Line: 280 | Upvalues: v3 (copy) ]]
	p1.Sequence = type(p1.Sequence) == "table" and p1.Sequence.Name or p1.Sequence
	p1.Tier = type(p1.Tier) == "table" and p1.Tier.Index or p1.Tier
	return v3.GetRemoteFunction("UnlockSequenceRemote"):InvokeServer(p1)
end
function t.Init(p1) --[[ Init | Line: 291 | Upvalues: v6 (copy), t2 (copy), v7 (copy), v3 (copy), v1 (copy), t (copy), v4 (copy) ]]
	v6.AddResponses(t2)
	if not v7 then
		return
	end
	v3.GetRemoteFunction("UnlockSequenceRemote").OnServerInvoke = function(p1, p2) --[[ Line: 296 | Upvalues: v1 (ref), t (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		local v2 = t.GetSequence(p2.Sequence)
		if not v2 then
			return "SequenceNotFound"
		end
		local v3, v4 = v2:CanClaim(v12, p2)
		if v3 == true then
			return v2:ClaimOrPromptPurchase(v12, v4)
		else
			return v3
		end
	end
	v4.AddPurchaseDetailsValidation("UnlockSequenceTier", function(p1, p2, p3) --[[ Line: 318 | Upvalues: t (ref) ]]
		local v1 = t.GetSequence(p3.Sequence)
		if not v1 then
			return false
		end
		if v1:GetUnlockTier(p3) then
			return v1:CanClaim(p1, p3) == true
		else
			return false
		end
	end)
	v4.AddProductPurchasedCallback("UnlockSequenceTier", function(p1, p2, p3) --[[ Line: 337 | Upvalues: t (ref) ]]
		local v1 = t.GetSequence(p3.Sequence)
		if not v1 then
			return
		end
		local v2 = v1:GetUnlockTier(p3)
		if not v2 then
			return
		end
		if not v1:Claim(p1, {
			Tier = v2,
			Track = p3.Track,
			Sequence = v1
		}) then
			return
		end
		local t2 = {
			ItemType = p3.Sequence
		}
		local v3 = v2.Name
		if not v3 then
			v3 = ("Tier%*"):format(v2.Index)
		end
		t2.ItemId = v3
		return t2
	end)
	v4.AddPurchaseDetailsValidation("UnlockSequenceTrack", function(p1, p2, p3) --[[ Line: 361 | Upvalues: t (ref) ]]
		local v1 = t.GetSequence(p3.Sequence)
		if v1 then
			return v1:GetTrack(p3.Track) and true or false
		else
			return false
		end
	end)
	v4.AddProductPurchasedCallback("UnlockSequenceTrack", function(p1, p2, p3) --[[ Line: 375 | Upvalues: t (ref) ]]
		local v1 = t.GetSequence(p3.Sequence)
		if not v1 then
			return
		end
		if v1:UnlockTrack(p3.Track) then
			return {
				ItemType = p3.Sequence,
				ItemId = p3.Track
			}
		end
	end)
end
t:Init()
return t