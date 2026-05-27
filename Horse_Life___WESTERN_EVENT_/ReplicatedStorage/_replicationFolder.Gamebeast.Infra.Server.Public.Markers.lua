-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("EngagementMarkers")
local v2 = shared.GBMod("PurchaseAnalytics")
function t.SendMarker(p1, p2, p3, p4) --[[ SendMarker | Line: 38 | Upvalues: v1 (copy) ]]
	v1:FireMarker(p2, p3, {
		position = p4
	})
end
function t.SendPlayerMarker(p1, p2, p3, p4, p5) --[[ SendPlayerMarker | Line: 42 | Upvalues: v1 (copy) ]]
	v1:FireMarker(p3, p4, {
		player = p2,
		position = p5
	})
end
function t.SendNewPurchaseGrantedMarker(p1, p2, p3) --[[ SendNewPurchaseGrantedMarker | Line: 47 | Upvalues: Players (copy), v2 (copy) ]]
	if Players:GetPlayerByUserId(p2.PlayerId) then
		task.spawn(function() --[[ Line: 52 | Upvalues: v2 (ref), p2 (copy), p3 (copy) ]]
			v2:DevProductPurchased(true, p2.PlayerId, p2.ProductId, p3)
		end)
	else
		return false
	end
end
function t.OnMarkersFailed(p1, p2) --[[ OnMarkersFailed | Line: 57 | Upvalues: v1 (copy) ]]
	return v1.MarkersFailed:Connect(p2)
end
function t.RetryFailedMarkersAsync(p1, p2) --[[ RetryFailedMarkersAsync | Line: 62 | Upvalues: v1 (copy) ]]
	return v1:SendMarkers(p2)
end
return t