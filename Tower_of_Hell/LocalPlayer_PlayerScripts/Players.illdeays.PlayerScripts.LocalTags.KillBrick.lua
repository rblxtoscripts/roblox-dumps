-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local killbricksDisabled = game.ReplicatedStorage.GameValues.killbricksDisabled
local v1 = game:GetService("RunService"):IsStudio()
local v2 = nil
local function onCharacterAdded(p1) --[[ onCharacterAdded | Line: 25 | Upvalues: v2 (ref), CollectionService (copy), killbricksDisabled (copy), v1 (copy) ]]
	v2 = p1:WaitForChild("Humanoid")
	v2.Touched:Connect(function(p1_2, p2_2) --[[ Line: 27 | Upvalues: CollectionService (ref), killbricksDisabled (ref), v2 (ref), v1 (ref) ]]
		if workspace:FindFirstChild("KillbrickFlag") then
			return
		end
		if not CollectionService:HasTag(p1_2, "KillBrick") then
			return
		end
		local v12 = p1_2:GetAttribute("KillPriority")
		local v22 = p2_2:GetAttribute("KillPriority")
		if not (v12 and v22) then
			return
		end
		if v12 == 1 and killbricksDisabled.Value then
			return
		end
		if v12 < v22 then
			return
		end
		if v2.Health <= 0 then
			return
		end
		local v3 = print
		local v6
		if v1 then
			local v7 = ("(%*)"):format((p1_2:GetFullName()))
			v6 = if v7 then v7 else ""
		else
			v6 = ""
		end
		v3((("Killed because %* touched a killing part. %*"):format(p2_2.Name, v6)))
		v2.Health = 0
	end)
end
if not game.Players.LocalPlayer.Character then
	game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
	function t.AddTagged(p1_2, p2_2) --[[ AddTagged | Line: 52 ]] end
	function t.RemoveTagged(p1_2, p2_2) --[[ RemoveTagged | Line: 56 ]] end
	return t
end
v2 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
v2.Touched:Connect(function(p1_2, p2_2) --[[ Line: 27 | Upvalues: CollectionService (copy), killbricksDisabled (copy), v2 (ref), v1 (copy) ]]
	if workspace:FindFirstChild("KillbrickFlag") then
		return
	end
	if not CollectionService:HasTag(p1_2, "KillBrick") then
		return
	end
	local v12 = p1_2:GetAttribute("KillPriority")
	local v22 = p2_2:GetAttribute("KillPriority")
	if not (v12 and v22) then
		return
	end
	if v12 == 1 and killbricksDisabled.Value then
		return
	end
	if v12 < v22 then
		return
	end
	if v2.Health <= 0 then
		return
	end
	local v3 = print
	local v6
	if v1 then
		local v7 = ("(%*)"):format((p1_2:GetFullName()))
		v6 = if v7 then v7 else ""
	else
		v6 = ""
	end
	v3((("Killed because %* touched a killing part. %*"):format(p2_2.Name, v6)))
	v2.Health = 0
end)
game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
function t.AddTagged(p1_2, p2_2) --[[ AddTagged | Line: 52 ]] end
function t.RemoveTagged(p1_2, p2_2) --[[ RemoveTagged | Line: 56 ]] end
return t