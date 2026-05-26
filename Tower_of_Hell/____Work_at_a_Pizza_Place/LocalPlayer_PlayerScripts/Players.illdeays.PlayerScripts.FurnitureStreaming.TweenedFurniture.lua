-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local t = {
	onTweenFurniture = function(p1, p2, p3, p4) --[[ onTweenFurniture | Line: 5 | Upvalues: TweenService (copy) ]]
		if not p2:IsDescendantOf(p1) then
			warn("[TweenFurniture]: Instance to tween is not a descendant of the furniture model")
			return
		end
		if p1:IsDescendantOf(workspace) then
			TweenService:Create(p2, TweenInfo.new(table.unpack(p3)), p4):Play()
			return
		end
		for k, v in pairs(p4) do
			p2[v] = p4[v]
		end
	end
}
local function synchronizeInstance(p1) --[[ synchronizeInstance | Line: 27 ]]
	for k, v in pairs((p1:GetAttributes())) do
		if string.sub(k, 1, 11) == "_TweenSync_" then
			local v2 = string.sub(k, 12)
			pcall(function() --[[ Line: 37 | Upvalues: p1 (copy), v2 (copy), v (copy) ]]
				p1[v2] = v
			end)
		end
	end
end
function t.onFurnitureStreamedIn(p1) --[[ onFurnitureStreamedIn | Line: 44 | Upvalues: synchronizeInstance (copy) ]]
	if not p1:GetAttribute("_UsesTweenSync") then
		return
	end
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA("BasePart") or (v2:IsA("Light") or v2:IsA("Texture")) then
			synchronizeInstance(v2)
		end
	end
end
return t