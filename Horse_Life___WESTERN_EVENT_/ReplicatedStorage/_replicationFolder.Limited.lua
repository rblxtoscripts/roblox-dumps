-- https://lua.expert/
local t = {}
local MessagingService = game:GetService("MessagingService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("RemoteUtils")
local v2 = RunService:IsClient()
local v3 = RunService:IsServer()
local v4 = nil
local v5 = nil
local v6 = v1.GetRemoteFunction("GetSoldCountValue")
local SoldCounts, StockAdjustments
if v3 then
	SoldCounts = Instance.new("Folder")
	SoldCounts.Name = "SoldCounts"
	SoldCounts.Parent = script
	StockAdjustments = Instance.new("Folder")
	StockAdjustments.Name = "StockAdjustments"
	StockAdjustments.Parent = script
else
	SoldCounts = script:WaitForChild("SoldCounts", 10)
	if not SoldCounts then
		error("[Limiteds] Failed to find SoldCounts folder on client!")
	end
	StockAdjustments = script:WaitForChild("StockAdjustments", 10)
end
function t.Init(p1) --[[ Init | Line: 39 | Upvalues: v3 (copy), v5 (ref), v4 (ref) ]]
	if not v3 then
		return
	end
	v5 = game:GetService("DataStoreService"):GetDataStore("PlayerSerials2")
	v4 = game:GetService("MemoryStoreService"):GetHashMap("Serials2")
end
function t.Start(p1) --[[ Start | Line: 46 | Upvalues: v3 (copy), v6 (copy), SoldCounts (ref), v4 (ref) ]]
	if not v3 then
		return
	end
	task.spawn(SubscribeToMessaging)
	function v6.OnServerInvoke(p1, p2) --[[ Line: 50 | Upvalues: SoldCounts (ref), v4 (ref) ]]
		local v1 = SoldCounts:FindFirstChild(p2)
		if v1 then
			return v1.Value
		end
		local v2 = SaveSoldCount(p2, 0)
		local v3, v42 = pcall(function() --[[ Line: 58 | Upvalues: v4 (ref), p2 (copy) ]]
			return v4:GetAsync(p2)
		end)
		if v3 and v42 ~= nil then
			v2.Value = v42
		end
		return v2.Value
	end
end
function SubscribeToMessaging() --[[ SubscribeToMessaging | Line: 71 | Upvalues: MessagingService (copy) ]]
	MessagingService:SubscribeAsync("SerialNumbers", function(p1) --[[ Line: 72 ]]
		local Data = p1.Data
		if Data then
			SaveSoldCount(Data.Name, Data.SoldCount)
		end
	end)
	MessagingService:SubscribeAsync("StockAdjustments", function(p1) --[[ Line: 84 ]]
		local Data = p1.Data
		if Data then
			SaveStockAdjustment(Data.Name, Data.Amount)
		end
	end)
end
function t.GetSoldCountValue(p1, p2) --[[ GetSoldCountValue | Line: 94 | Upvalues: SoldCounts (ref), v2 (copy), v6 (copy), v4 (ref) ]]
	local v1 = SoldCounts:FindFirstChild(p2)
	if v1 then
		return v1
	end
	if not v2 then
		local v22 = SaveSoldCount(p2, 0)
		task.spawn(function() --[[ Line: 124 | Upvalues: v4 (ref), p2 (copy), v22 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 125 | Upvalues: v4 (ref), p2 (ref) ]]
				return v4:GetAsync(p2)
			end)
			if v1 and v2 ~= nil then
				print("Fetched sold count for " .. p2 .. ": " .. tostring(v2))
				v22.Value = v2
				return
			end
			warn((("[Limiteds] Unable to fetch amount sold for item %* because %*"):format(p2, if v1 then "nil result" else v2)))
		end)
		return v22
	end
	task.spawn(function() --[[ Line: 101 | Upvalues: v6 (ref), p2 (copy) ]]
		if pcall(function() --[[ Line: 102 | Upvalues: v6 (ref), p2 (ref) ]]
			v6:InvokeServer(p2)
		end) then
			return
		end
		warn((("[Limiteds] Failed to request sold count from server for %*"):format(p2)))
	end)
	local v3 = SoldCounts:WaitForChild(p2)
	if not v3 then
		warn((("[Limiteds] Timeout waiting for %* to replicate from server"):format(p2)))
	end
	return v3
end
function t.GetCachedSoldCount(p1, p2) --[[ GetCachedSoldCount | Line: 141 | Upvalues: SoldCounts (ref) ]]
	local v1 = SoldCounts:FindFirstChild(p2)
	if v1 then
		return math.max(0, v1.Value)
	else
		return 0
	end
end
function SaveSoldCount(p1, p2) --[[ SaveSoldCount | Line: 149 | Upvalues: SoldCounts (ref) ]]
	local v1 = SoldCounts:FindFirstChild(p1)
	if not v1 then
		local v2 = Instance.new("IntValue")
		v2.Name = p1
		v2.Parent = SoldCounts
		v1 = v2
	end
	v1.Value = p2
	return v1
end
function SaveStockAdjustment(p1, p2) --[[ SaveStockAdjustment | Line: 162 | Upvalues: StockAdjustments (ref) ]]
	local v1 = StockAdjustments:FindFirstChild(p1)
	if not v1 then
		local v2 = Instance.new("IntValue")
		v2.Name = p1
		v2.Parent = StockAdjustments
		v1 = v2
	end
	v1.Value = p2
	return v1
end
function t.GetStockAdjustmentValue(p1, p2) --[[ GetStockAdjustmentValue | Line: 175 | Upvalues: StockAdjustments (ref), v2 (copy), v4 (ref) ]]
	if not StockAdjustments then
		return nil
	end
	local v1 = StockAdjustments:FindFirstChild(p2)
	if v1 then
		return v1
	end
	if v2 then
		return nil
	else
		local v22 = SaveStockAdjustment(p2, 0)
		task.spawn(function() --[[ Line: 191 | Upvalues: v4 (ref), p2 (copy), v22 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 192 | Upvalues: v4 (ref), p2 (ref) ]]
				return v4:GetAsync("StockAdj_" .. p2)
			end)
			if not v1 or v2 == nil then
				return
			end
			v22.Value = v2
		end)
		return v22
	end
end
function t.GetStockAdjustmentsFolder(p1) --[[ GetStockAdjustmentsFolder | Line: 204 | Upvalues: StockAdjustments (ref) ]]
	return StockAdjustments
end
function t.AddStock(p1, p2, p3) --[[ AddStock | Line: 208 | Upvalues: v4 (ref), MessagingService (copy) ]]
	local v1 = nil
	local v2, v3 = pcall(function() --[[ Line: 210 | Upvalues: v4 (ref), p2 (copy), p3 (copy), v1 (ref) ]]
		return v4:UpdateAsync("StockAdj_" .. p2, function(p1) --[[ Line: 211 | Upvalues: p3 (ref), v1 (ref) ]]
			local v12 = (p1 or 0) + p3
			v1 = v12
			return v12
		end, 3888000)
	end)
	if v2 then
		SaveStockAdjustment(p2, v1)
		pcall(function() --[[ Line: 226 | Upvalues: MessagingService (ref), p2 (copy), v1 (ref) ]]
			MessagingService:PublishAsync("StockAdjustments", {
				Name = p2,
				Amount = v1
			})
		end)
		return true, v1
	else
		warn((("[Limiteds] Unable to adjust stock for %*: %*"):format(p2, v3)))
		return false
	end
end
function t.MintSerialNumberRobux(p1, p2, p3, p4) --[[ MintSerialNumberRobux | Line: 236 | Upvalues: v4 (ref) ]]
	local v1 = false
	local v2 = nil
	local v3, v42 = pcall(function() --[[ Line: 240 | Upvalues: v4 (ref), p3 (copy), v2 (ref), v1 (ref) ]]
		return v4:UpdateAsync(p3, function(p1) --[[ Line: 241 | Upvalues: v2 (ref), v1 (ref) ]]
			local v12 = (tonumber(p1) or 0) + 1
			v2 = v12
			v1 = true
			return v12
		end, 3888000)
	end)
	if not v3 then
		warn((("[Limiteds] Unable to assign Robux serial number for item %* because %*"):format(p3, v42)))
		return
	end
	if p4 == true then
		SaveSoldCount(p3, v2)
		PublishSerial(p3, v2)
	end
	SavePlayerSerials(p2, p3, v2)
	return v1, v2
end
function t.MintSerialNumber(p1, p2, p3) --[[ MintSerialNumber | Line: 265 | Upvalues: v4 (ref) ]]
	local v1 = false
	local v2 = nil
	local v3, v42 = pcall(function() --[[ Line: 269 | Upvalues: v4 (ref), p3 (copy), v2 (ref), v1 (ref) ]]
		return v4:UpdateAsync(p3, function(p1) --[[ Line: 270 | Upvalues: v2 (ref), v1 (ref) ]]
			local v12 = (tonumber(p1) or 0) + 1
			v2 = v12
			v1 = true
			return v12
		end, 3888000)
	end)
	if v3 then
		SaveSoldCount(p3, v2)
		PublishSerial(p3, v2)
		print("recorded serial!", p2, p3, v2)
		SavePlayerSerials(p2, p3, v2)
		return v1, v2
	else
		warn((("[Limiteds] Unable to assign serial number for item %* because %*"):format(p3, v42)))
	end
end
local t2 = {}
local v7 = false
function PublishSerial(p1, p2) --[[ PublishSerial | Line: 296 | Upvalues: t2 (copy), v7 (ref), MessagingService (copy) ]]
	local v1 = t2[p1]
	t2[p1] = p2
	if v1 then
		return
	end
	if not v7 then
		task.spawn(function() --[[ Line: 308 | Upvalues: v7 (ref), t2 (ref), MessagingService (ref) ]]
			v7 = true
			print("starting serial publish loop!")
			while task.wait(1) and next(t2) do
				local t = {}
				for v1, v2 in t2 do
					t[v1] = v2
				end
				table.clear(t2)
				for v3, v4 in t do
					local v5, v6 = pcall(function() --[[ Line: 325 | Upvalues: MessagingService (ref), v3 (copy), v4 (copy) ]]
						MessagingService:PublishAsync("SerialNumbers", {
							Name = v3,
							SoldCount = v4
						})
					end)
					if not v5 then
						warn((("Unable to successfully public serial numbers! Most recent serial: %* ItemName: %* Error: %*"):format(v4, v3, v6)))
					end
				end
			end
			print("loop finished. back to idle")
			v7 = false
		end)
	end
end
local t3 = {}
local v8 = false
function SavePlayerSerials(p1, p2, p3) --[[ SavePlayerSerials | Line: 344 | Upvalues: t3 (copy), v8 (ref), v5 (ref) ]]
	local v1 = t3[p2] or {}
	table.insert(v1, { p1.UserId, p3 })
	t3[p2] = v1
	if not v8 then
		task.spawn(function() --[[ Line: 359 | Upvalues: v8 (ref), t3 (ref), v5 (ref) ]]
			v8 = true
			while task.wait(2) and next(t3) do
				local t = {}
				for v1, v2 in t3 do
					t[v1] = v2
				end
				table.clear(t3)
				local updatedsoldcountto = 0
				for v3, v4 in t do
					pcall(function() --[[ Line: 376 | Upvalues: v5 (ref), v3 (copy), v4 (copy), updatedsoldcountto (ref) ]]
						v5:UpdateAsync(v3, function(p1) --[[ Line: 377 | Upvalues: v4 (ref), updatedsoldcountto (ref) ]]
							if not p1 then
								p1 = {}
							end
							for v1, v2 in v4 do
								updatedsoldcountto = updatedsoldcountto + 1
								table.insert(p1, v2)
							end
							return p1
						end)
					end)
				end
				print("updated sold count to", updatedsoldcountto)
			end
			v8 = false
			print("serial post loop running now!")
		end)
	end
end
return t