-- https://lua.expert/
local buildConstraints = require(script:WaitForChild("buildConstraints"))
local buildCollisionFilters = require(script:WaitForChild("buildCollisionFilters"))
function buildAttachmentMap(p1) --[[ buildAttachmentMap | Line: 23 ]]
	local t = {}
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("BasePart") then
			for k2, v2 in pairs(v:GetChildren()) do
				if v2:IsA("Attachment") then
					local v1 = v2.Name:match("^(.+)RigAttachment$")
					local v22 = v2.Name:match("^(.+)RigAttachment$") and v2.Parent:FindFirstChild(v1) or nil
					if v22 then
						t[v2.Name] = {
							Joint = v22,
							Attachment0 = v22.Part0[v2.Name],
							Attachment1 = v22.Part1[v2.Name]
						}
					end
				end
			end
		end
	end
	return t
end
return function(p1) --[[ Line: 50 | Upvalues: buildConstraints (copy), buildCollisionFilters (copy) ]]
	local v1 = p1.Parent
	p1.BreakJointsOnDeath = false
	local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
	local v2, v3
	if HumanoidRootPart then
		HumanoidRootPart.CanCollide = false
	end
	v2 = buildAttachmentMap(v1)
	v3 = buildConstraints(v2)
	buildCollisionFilters(v2, v1.PrimaryPart).Parent = v3
	v3.Parent = v1
	game:GetService("CollectionService"):AddTag(p1, "Ragdoll")
end