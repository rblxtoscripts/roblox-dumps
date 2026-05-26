-- https://lua.expert/
local getLastWordFromPascalCase = require(script.Parent:WaitForChild("getLastWordFromPascalCase"))
local t = {}
for k, v in pairs(script:GetChildren()) do
	t[v.Name] = v
end
function getConstraintTemplate(p1) --[[ getConstraintTemplate | Line: 44 | Upvalues: getLastWordFromPascalCase (copy), t (copy) ]]
	return t[getLastWordFromPascalCase(p1)] or t.Default
end
function createConstraint(p1) --[[ createConstraint | Line: 49 ]]
	local v1 = p1.Joint.Name
	local v2 = getConstraintTemplate(v1):Clone()
	v2.Attachment0 = p1.Attachment0
	v2.Attachment1 = p1.Attachment1
	v2.Name = v1 .. "RagdollConstraint"
	local RigidJoint = Instance.new("ObjectValue", v2)
	RigidJoint.Name = "RigidJoint"
	RigidJoint.Value = p1.Joint
	return v2
end
return function(p1) --[[ Line: 68 ]]
	local RagdollConstraints = Instance.new("Folder")
	RagdollConstraints.Name = "RagdollConstraints"
	for k, v in pairs(p1) do
		if v.Joint.Name ~= "Root" then
			createConstraint(v).Parent = RagdollConstraints
		end
	end
	return RagdollConstraints
end