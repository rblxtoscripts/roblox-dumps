-- https://lua.expert/
local t = {}
local MarketplaceService = game:GetService("MarketplaceService")
local v1 = shared.GBMod("GetRemote")
local v2 = shared.GBMod("ClientSessionPreservation")
local v3 = v1("Event", "ClientInfoChanged")
local v4 = v1("Function", "GetProductPrice")
local t2 = {
	device = true,
	deviceSubType = true,
	inputType = true
}
local t3 = {}
local t4 = {}
local v5 = false
function t.UpdateClientInfo(p1, p2, p3) --[[ UpdateClientInfo | Line: 51 | Upvalues: t4 (copy), v2 (copy), t2 (copy), v5 (ref), v3 (copy) ]]
	if t4[p2] == p3 then
		return
	end
	t4[p2] = p3
	v2:UpdateStoredData(p2, p3)
	for v1 in t2 do
		if not t4[v1] then
			return
		end
	end
	if v5 then
		return
	end
	v5 = true
	task.defer(function() --[[ Line: 67 | Upvalues: v5 (ref), v3 (ref), t4 (ref) ]]
		v5 = false
		v3:FireServer(t4)
	end)
end
function t.GetClientInfo(p1, p2) --[[ GetClientInfo | Line: 74 | Upvalues: t4 (copy) ]]
	return t4[p2]
end
for v6, v7 in v2:GetStoredData() do
	t:UpdateClientInfo(v6, v7)
end
function v4.OnClientInvoke(p1, p2) --[[ Line: 85 | Upvalues: t3 (copy), MarketplaceService (copy) ]]
	if t3[p1] then
		return t3[p1]
	end
	local v1, v2 = pcall(function() --[[ Line: 90 | Upvalues: MarketplaceService (ref), p1 (copy), p2 (copy) ]]
		return MarketplaceService:GetProductInfo(p1, p2)
	end)
	if v1 then
		t3[p1] = v2
		return v2.PriceInRobux
	else
		return nil
	end
end
v3.OnClientEvent:Connect(function(p1, p2) --[[ Line: 102 | Upvalues: t (copy) ]]
	t:UpdateClientInfo(p1, p2)
end)
return t