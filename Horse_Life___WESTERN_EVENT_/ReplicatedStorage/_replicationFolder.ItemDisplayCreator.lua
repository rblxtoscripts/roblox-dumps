-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Maid")
function t.Create(p1, p2) --[[ Create | Line: 10 | Upvalues: v1 (copy), ReplicatedStorage (copy) ]]
	local v12 = v1.new()
	if not p2 then
		warn("NO DISPLAY", p2)
		return
	end
	if not p2.Item then
		warn("NO ITEM")
		return
	end
	local Viewport = p2.Viewport
	local Item = p2.Item
	Viewport.Image = Item.Image or "rbxassetid://16190522266"
	local v2 = Viewport:FindFirstChild("UpperLabel") or Viewport:FindFirstChild("Viewport")
	if v2 then
		v2.Image = Viewport.Image
		Viewport.ImageColor3 = Color3.fromRGB(100, 100, 100)
	else
		Viewport.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end
	if Item.ColorSequence then
		local v3 = ReplicatedStorage.Storage.Assets.ItemColorGradient:Clone()
		v3.Color = Item.ColorSequence
		v3.Parent = Viewport
		v12:GiveTask(v3)
		if v2 then
			local v4 = v3:Clone()
			v4.Parent = v2
			v12:GiveTask(v4)
		end
	end
	return v12
end
return t