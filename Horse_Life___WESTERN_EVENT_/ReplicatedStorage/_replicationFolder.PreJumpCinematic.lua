-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("Maid")
local v4 = Sonar("PlayerWrapper")
local v5 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true)
local v6 = v4.GetClient()
local Tutorial = ReplicatedStorage:WaitForChild("Storage").Assets.Tutorial
function t.Run(p1) --[[ Run | Line: 29 | Upvalues: v6 (copy), v3 (copy), v1 (copy), CollectionService (copy), Tutorial (copy), TweenService (copy), v5 (copy), v2 (copy) ]]
	if v6.SkipTutorial then
		return
	end
	local v12 = v3.new()
	select(-1, next(v1.GetAllAnimals())):ChangeCommand()
	local v22 = CollectionService:GetTagged("TutorialLog")
	local v32 = v12
	for v4, v52 in v22 do
		local v62 = Tutorial.Highlight:Clone()
		v62.Parent = v52
		v32:GiveTask(TweenService:Create(v62, v5, {
			FillTransparency = 1,
			OutlineTransparency = 1
		})):Play()
	end
	table.sort(v22, function(p1, p2) --[[ Line: 55 ]]
		return p1:GetPivot().Position.Z < p2:GetPivot().Position.Z
	end)
	local v7 = v22[1]
	if v7 then
		local v8 = if v7:IsA("BasePart") then v7 else v7.PrimaryPart or v7:FindFirstChildOfClass("BasePart")
		if v8 then
			local v9 = v2.FromPlayer(v8)
			v32:GiveTask(function() --[[ Line: 67 | Upvalues: v9 (copy), v2 (ref) ]]
				if not v9 then
					return
				end
				v2.Destroy(v9)
			end)
		end
	end
	v32:DoCleaning()
end
return t