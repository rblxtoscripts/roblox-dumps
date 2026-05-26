-- https://lua.expert/
local t = {}
local CommerceService = game:GetService("CommerceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
local t2 = {}
function t.GetCommerceInfo(p1) --[[ GetCommerceInfo | Line: 17 | Upvalues: t2 (copy), CommerceService (copy) ]]
	local v1 = tostring(p1)
	if t2[v1] then
		return t2[v1]
	end
	local v2, count = v1, 0
	repeat
		local v3, v4 = pcall(CommerceService.GetCommerceProductInfoAsync, CommerceService, v2)
		if v3 and v4 then
			t2[v2] = v4
			return v4
		end
		warn(v4)
		count = count + 1
		wait()
	until count >= 5
end
function t.PromptCommerceProductPurchase(p1, p2, p3) --[[ PromptCommerceProductPurchase | Line: 40 | Upvalues: CommerceService (copy) ]]
	CommerceService:PromptCommerceProductPurchase(p2, p3)
end
return t