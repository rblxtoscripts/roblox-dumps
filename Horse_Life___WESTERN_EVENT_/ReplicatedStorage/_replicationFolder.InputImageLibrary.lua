-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local UserInputService = game:GetService("UserInputService")
local t = {
	ClassName = "InputImageLibrary"
}
t.__index = t
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2._spritesheets = {}
	v2:_loadSpriteSheets(p1)
	return v2
end
function t.GetPreloadAssetIds(p1) --[[ GetPreloadAssetIds | Line: 28 ]]
	local t = {}
	for k, v in pairs(p1._spritesheets) do
		for k2, v2 in pairs(v) do
			table.insert(t, v2:GetPreloadAssetId())
		end
	end
	return t
end
function t._loadSpriteSheets(p1, p2) --[[ _loadSpriteSheets | Line: 38 | Upvalues: Sonar (copy) ]]
	assert(if typeof(p2) == "Instance" then true else false, "Bad parentFolder")
	for k, v in pairs(p2:GetChildren()) do
		p1._spritesheets[v.Name] = {}
		for k2, v2 in pairs(v:GetChildren()) do
			if v2:IsA("ModuleScript") then
				p1._spritesheets[v.Name][v2.Name] = Sonar(v2).new()
			end
		end
	end
end
function t.GetSprite(p1, p2, p3, p4) --[[ GetSprite | Line: 59 ]]
	assert(if p2 == nil then false else true, "Bad keyCode")
	assert(if type(p3) == "string" then true elseif p3 == nil then true else false, "Bad preferredStyle")
	assert(if type(p4) == "string" then true elseif p4 == nil then true else false, "Bad preferredPlatform")
	local v4 = p1:PickSheet(p2, p3, p4)
	if v4 then
		return v4:GetSprite(p2)
	else
		return nil
	end
end
function t.StyleImage(p1, p2, p3, p4, p5) --[[ StyleImage | Line: 86 ]]
	assert(if typeof(p2) == "Instance" then p2:IsA("ImageLabel") or p2:IsA("ImageButton") else false, "Bad gui")
	assert(if p3 == nil then false else true, "Bad keyCode")
	assert(if type(p4) == "string" then true elseif p4 == nil then true else false, "Bad preferredStyle")
	assert(if type(p5) == "string" then true elseif p5 == nil then true else false, "Bad preferredPlatform")
	local v5 = p1:PickSheet(p3, p4, p5)
	if v5 then
		return v5:GetSprite(p3):Style(p2)
	else
		return nil
	end
end
function t._getDefaultPreferredPlatform(p1) --[[ _getDefaultPreferredPlatform | Line: 100 | Upvalues: UserInputService (copy) ]]
	local v1 = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonA)
	if not v1 then
		return nil
	end
	if string.find(v1, "PlayStation") then
		return "PlayStation"
	end
	local _ = string.find(v1, "Xbox")
	return "XBox"
end
function t.GetScaledImageLabel(p1, p2, p3, p4) --[[ GetScaledImageLabel | Line: 117 ]]
	assert(if p2 == nil then false else true, "Bad keyCode")
	assert(if type(p3) == "string" then true elseif p3 == nil then true else false, "Bad preferredStyle")
	assert(if type(p4) == "string" then true elseif p4 == nil then true else false, "Bad preferredPlatform")
	local v4 = p1:_getImageInstance("ImageLabel", p2, p3 or "Dark", p4)
	if v4 then
		local Size = v4.Size
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
		UIAspectRatioConstraint.AspectRatio = Size.Y.Offset / Size.X.Offset
		UIAspectRatioConstraint.Parent = v4
		v4.Size = UDim2.new(1, 0, 1, 0)
		return v4
	else
		return nil
	end
end
function t.PickSheet(p1, p2, p3, p4) --[[ PickSheet | Line: 140 ]]
	assert(if p2 == nil then false else true, "Bad keyCode")
	assert(if type(p3) == "string" then true elseif p3 == nil then true else false, "Bad preferredStyle")
	assert(if type(p4) == "string" then true elseif p4 == nil then true else false, "Bad preferredPlatform")
	local function findSheet(p1) --[[ findSheet | Line: 145 | Upvalues: p3 (copy), p2 (copy) ]]
		local v1 = p1[p3]
		if v1 and v1:HasSprite(p2) then
			return v1
		end
		for k, v in pairs(p1) do
			if v:HasSprite(p2) then
				return v
			end
		end
	end
	local v4 = if p4 == "Gamepad" or not p4 then p1:_getDefaultPreferredPlatform() else p4
	if v4 then
		local v5 = p1._spritesheets[v4]
		local v6 = if v5 then findSheet(v5) else v5
		if v6 and v6:HasSprite(p2) then
			return v6
		end
	end
	for k, v in pairs(p1._spritesheets) do
		local v7 = findSheet(v)
		if v7 then
			return v7
		end
	end
	return nil
end
function t._getImageInstance(p1, p2, p3, p4, p5) --[[ _getImageInstance | Line: 185 ]]
	assert(if type(p2) == "string" then true else false, "Bad instanceType")
	assert(if p3 == nil then false else true, "Bad keyCode")
	assert(if type(p4) == "string" then true elseif p4 == nil then true else false, "Bad preferredStyle")
	assert(if type(p5) == "string" then true elseif p5 == nil then true else false, "Bad preferredPlatform")
	local v5 = p1:PickSheet(p3, p4, p5)
	if v5 then
		return v5:GetSprite(p3):Get(p2)
	else
		return nil
	end
end
return t.new(script:WaitForChild("Spritesheets"))