-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local WandShared = require(ReplicatedStorage._v6FiRE_Additions.Manager.Wand.WandShared)
local t = {}
local WandOutlinePart = script.Objects.WandOutlinePart
local function getTargetAttributes(p1) --[[ getTargetAttributes | Line: 17 ]]
	local t = {}
	t.CFrame = p1:IsA("Model") and p1:GetBoundingBox() or p1.CFrame
	t.Size = p1:GetAttribute("_WandOutlineSize")
	return t
end
local function _moveOutlineToFront(p1, p2, p3, p4, p5) --[[ _moveOutlineToFront | Line: 35 ]]
	p1.CFrame = p2
	p1.Size = p3
	p1.CFrame = CFrame.new(p1.CFrame.Position + p2[p4] * p5) * p1.CFrame.Rotation
end
local function _weldOutlineToPart(p1, p2) --[[ _weldOutlineToPart | Line: 47 ]]
	p1.Anchored = false
	local _WantOutlineAttachment = p2:FindFirstChild("_WantOutlineAttachment") or Instance.new("Attachment")
	_WantOutlineAttachment.Name = "_WantOutlineAttachment"
	_WantOutlineAttachment.Parent = p2
	local _WandOutlineWeld = Instance.new("WeldConstraint")
	_WandOutlineWeld.Name = "_WandOutlineWeld"
	_WandOutlineWeld.Parent = p1
	_WandOutlineWeld.Part0 = p2
	_WandOutlineWeld.Part1 = p1
end
function t.Oven(p1, p2, p3) --[[ Oven | Line: 65 ]]
	local v1 = p3.CFrame
	p1.CFrame = v1
	p1.Size = p3.Size
	p1.CFrame = CFrame.new(p1.CFrame.Position + v1.RightVector * p3.Size.X) * p1.CFrame.Rotation
	local Glass = p2.Glass
	p1.Anchored = false
	local _WantOutlineAttachment = Glass:FindFirstChild("_WantOutlineAttachment") or Instance.new("Attachment")
	_WantOutlineAttachment.Name = "_WantOutlineAttachment"
	_WantOutlineAttachment.Parent = Glass
	local _WandOutlineWeld = Instance.new("WeldConstraint")
	_WandOutlineWeld.Name = "_WandOutlineWeld"
	_WandOutlineWeld.Parent = p1
	_WandOutlineWeld.Part0 = Glass
	_WandOutlineWeld.Part1 = p1
end
function t.Vehicle(p1, p2, p3) --[[ Vehicle | Line: 77 ]]
	p3.Size = p3.Size + Vector3.new(1.5, 0, 1.5)
	p1.CFrame = p3.CFrame
	p1.Size = p3.Size
	local Driver = p2.Driver
	p1.Anchored = false
	local _WantOutlineAttachment = Driver:FindFirstChild("_WantOutlineAttachment") or Instance.new("Attachment")
	_WantOutlineAttachment.Name = "_WantOutlineAttachment"
	_WantOutlineAttachment.Parent = Driver
	local _WandOutlineWeld = Instance.new("WeldConstraint")
	_WandOutlineWeld.Name = "_WandOutlineWeld"
	_WandOutlineWeld.Parent = p1
	_WandOutlineWeld.Part0 = Driver
	_WandOutlineWeld.Part1 = p1
end
function t.SupplyCounter(p1, p2, p3) --[[ SupplyCounter | Line: 90 ]]
	local v2 = p3.CFrame
	p1.CFrame = v2
	p1.Size = p3.Size
	p1.CFrame = CFrame.new(p1.CFrame.Position + v2.RightVector * (p3.Size.X * -1)) * p1.CFrame.Rotation
end
return {
	CreateOutlinePart = function(p1) --[[ CreateOutlinePart | Line: 107 | Upvalues: t (copy), WandOutlinePart (copy), getTargetAttributes (copy), CollectionService (copy), WandShared (copy) ]]
		local v1 = t[p1.Tags.WandType]
		if v1 then
			local v2 = WandOutlinePart:Clone()
			v2.Name = ("__WandOutline_%*"):format(p1.Tags.WandType)
			local Target = p1.Tags.Target
			local v3 = getTargetAttributes(Target)
			v2.Parent = workspace
			v1(v2, Target, v3)
			CollectionService:AddTag(v2, WandShared.CollectionTagName)
			return v2
		else
			warn((("[%*]: No outline init function for WandType: %*"):format(script.Name, p1.Tags.WandType)))
		end
	end
}