-- https://lua.expert/
local RunService = game:GetService("RunService")
local t = {}
local t2 = {
	UpperAngle = 10,
	TwistLowerAngle = -10,
	TwistUpperAngle = 10,
	ReferenceMass = 0.43671694397926
}
local t3 = {
	UpperAngle = 20,
	TwistLowerAngle = 5,
	TwistUpperAngle = 120,
	ReferenceMass = 0.70196455717087
}
local t4 = {
	UpperAngle = 30,
	TwistLowerAngle = -10,
	TwistUpperAngle = 10,
	ReferenceMass = 0.69132566452026
}
local t5 = {
	UpperAngle = 5,
	TwistLowerAngle = -120,
	TwistUpperAngle = -5,
	ReferenceMass = 0.65389388799667
}
local t6 = {
	UpperAngle = 110,
	TwistLowerAngle = -85,
	TwistUpperAngle = 85,
	FrictionTorque = 0,
	ReferenceMass = 0.90918225049973
}
local t7 = {
	UpperAngle = 40,
	TwistLowerAngle = -5,
	TwistUpperAngle = 80,
	FrictionTorque = 0,
	ReferenceMass = 1.9175016880035
}
local t8 = {
	UpperAngle = 110,
	TwistLowerAngle = -85,
	TwistUpperAngle = 85
}
local t9 = {
	UpperAngle = 40,
	TwistLowerAngle = -5,
	TwistUpperAngle = 80
}
local v1 = Vector3.new()
local t10 = {
	{
		"UpperTorso",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(v1, Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"RightUpperArm",
		"RightShoulderRagdollAttachment",
		CFrame.fromMatrix(v1, Vector3.new(0, -1, 0), Vector3.new(1, 0, 0)),
		"RightShoulderRigAttachment"
	},
	{
		"UpperTorso",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(v1, Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0)),
		"LeftShoulderRigAttachment"
	},
	{
		"LeftUpperArm",
		"LeftShoulderRagdollAttachment",
		CFrame.fromMatrix(v1, Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0)),
		"LeftShoulderRigAttachment"
	}
}
local t11 = {
	{
		"UpperTorso",
		"Head",
		"NeckRigAttachment",
		{
			UpperAngle = 45,
			TwistLowerAngle = -40,
			TwistUpperAngle = 40,
			FrictionTorque = 400,
			ReferenceMass = 1.0249234437943
		}
	},
	{
		"LowerTorso",
		"UpperTorso",
		"WaistRigAttachment",
		{
			UpperAngle = 20,
			TwistLowerAngle = -40,
			TwistUpperAngle = 20,
			FrictionTorque = 750,
			ReferenceMass = 2.861558675766
		}
	},
	{ "UpperTorso", "LeftUpperArm", "LeftShoulderRagdollAttachment", t6 },
	{ "LeftUpperArm", "LeftLowerArm", "LeftElbowRigAttachment", t3 },
	{ "LeftLowerArm", "LeftHand", "LeftWristRigAttachment", t4 },
	{ "UpperTorso", "RightUpperArm", "RightShoulderRagdollAttachment", t6 },
	{ "RightUpperArm", "RightLowerArm", "RightElbowRigAttachment", t3 },
	{ "RightLowerArm", "RightHand", "RightWristRigAttachment", t4 },
	{ "LowerTorso", "LeftUpperLeg", "LeftHipRigAttachment", t7 },
	{ "LeftUpperLeg", "LeftLowerLeg", "LeftKneeRigAttachment", t5 },
	{ "LeftLowerLeg", "LeftFoot", "LeftAnkleRigAttachment", t2 },
	{ "LowerTorso", "RightUpperLeg", "RightHipRigAttachment", t7 },
	{ "RightUpperLeg", "RightLowerLeg", "RightKneeRigAttachment", t5 },
	{ "RightLowerLeg", "RightFoot", "RightAnkleRigAttachment", t2 }
}
local t12 = {
	{ "LowerTorso", "LeftUpperArm" },
	{ "LeftUpperArm", "LeftHand" },
	{ "LowerTorso", "RightUpperArm" },
	{ "RightUpperArm", "RightHand" },
	{ "LeftUpperLeg", "RightUpperLeg" },
	{ "UpperTorso", "RightUpperLeg" },
	{ "RightUpperLeg", "RightFoot" },
	{ "UpperTorso", "LeftUpperLeg" },
	{ "LeftUpperLeg", "LeftFoot" },
	{ "UpperTorso", "LeftLowerLeg" },
	{ "UpperTorso", "RightLowerLeg" },
	{ "LowerTorso", "LeftLowerLeg" },
	{ "LowerTorso", "RightLowerLeg" },
	{ "UpperTorso", "LeftLowerArm" },
	{ "UpperTorso", "RightLowerArm" },
	{ "Head", "LeftUpperArm" },
	{ "Head", "RightUpperArm" }
}
local t13 = {
	{ "Waist", "UpperTorso" },
	{ "Neck", "Head" },
	{ "LeftShoulder", "LeftUpperArm" },
	{ "LeftElbow", "LeftLowerArm" },
	{ "LeftWrist", "LeftHand" },
	{ "RightShoulder", "RightUpperArm" },
	{ "RightElbow", "RightLowerArm" },
	{ "RightWrist", "RightHand" },
	{ "LeftHip", "LeftUpperLeg" },
	{ "LeftKnee", "LeftLowerLeg" },
	{ "LeftAnkle", "LeftFoot" },
	{ "RightHip", "RightUpperLeg" },
	{ "RightKnee", "RightLowerLeg" },
	{ "RightAnkle", "RightFoot" }
}
local t14 = {
	{ "Head", "NeckAttachment", CFrame.new(0, -0.5, 0) },
	{ "Torso", "RightShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(1, 0.5, 0), Vector3.new(1, 0, 0), Vector3.new(0, 1, 0)) },
	{ "Right Arm", "RightShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(-0.5, 0.5, 0), Vector3.new(0, -1, 0), Vector3.new(1, 0, 0)) },
	{ "Torso", "LeftShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(-1, 0.5, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 1, 0)) },
	{ "Left Arm", "LeftShoulderRagdollAttachment", CFrame.fromMatrix(Vector3.new(0.5, 0.5, 0), Vector3.new(0, -1, 0), Vector3.new(-1, 0, 0)) },
	{ "Torso", "RightHipAttachment", CFrame.new(0.5, -1, 0) },
	{ "Right Leg", "RightHipAttachment", CFrame.new(0, 1, 0) },
	{ "Torso", "LeftHipAttachment", CFrame.new(-0.5, -1, 0) },
	{ "Left Leg", "LeftHipAttachment", CFrame.new(0, 1, 0) }
}
local t15 = {
	{
		"Torso",
		"Head",
		"NeckAttachment",
		{
			UpperAngle = 30,
			TwistLowerAngle = -40,
			TwistUpperAngle = 40
		}
	},
	{ "Torso", "Left Leg", "LeftHipAttachment", t9 },
	{ "Torso", "Right Leg", "RightHipAttachment", t9 },
	{ "Torso", "Left Arm", "LeftShoulderRagdollAttachment", t8 },
	{ "Torso", "Right Arm", "RightShoulderRagdollAttachment", t8 }
}
local t16 = {
	{ "Left Leg", "Right Leg" },
	{ "Head", "Right Arm" },
	{ "Head", "Left Arm" }
}
local t17 = {
	{ "Neck", "Torso" },
	{ "Left Shoulder", "Torso" },
	{ "Right Shoulder", "Torso" },
	{ "Left Hip", "Torso" },
	{ "Right Hip", "Torso" }
}
local function indexParts(p1) --[[ indexParts | Line: 227 ]]
	local t = {}
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("BasePart") then
			local name = v.name
			if not t[name] then
				t[name] = v
			end
		end
	end
	return t
end
local function createRigJoints(p1, p2) --[[ createRigJoints | Line: 241 | Upvalues: RunService (copy) ]]
	for i, v in ipairs(p2) do
		local v1, v2, v3, v4 = unpack(v)
		local v5 = p1[v1]
		local v6 = p1[v2]
		if v5 and v6 then
			local v7 = v5:FindFirstChild(v3)
			local v8 = v6:FindFirstChild(v3)
			if v7 and (v8 and (v7:IsA("Attachment") and v8:IsA("Attachment"))) then
				local RagdollBallSocket = v6:FindFirstChild("RagdollBallSocket")
				if not RagdollBallSocket then
					local RagdollBallSocket_2 = Instance.new("BallSocketConstraint")
					RagdollBallSocket_2.Name = "RagdollBallSocket"
					if RunService:IsClient() then
						warn("[RagdollRigging] - Creating BallSocketConstraint %q")
					end
					RagdollBallSocket = RagdollBallSocket_2
				end
				RagdollBallSocket.Attachment0 = v7
				RagdollBallSocket.Attachment1 = v8
				RagdollBallSocket.LimitsEnabled = true
				RagdollBallSocket.UpperAngle = v4.UpperAngle
				RagdollBallSocket.TwistLimitsEnabled = true
				RagdollBallSocket.TwistLowerAngle = v4.TwistLowerAngle
				RagdollBallSocket.TwistUpperAngle = v4.TwistUpperAngle
				local v9 = workspace.Gravity / 196.2
				local ReferenceMass = v4.ReferenceMass
				RagdollBallSocket.MaxFrictionTorque = (v4.FrictionTorque or 0.5) * (ReferenceMass and v6:GetMass() / ReferenceMass or 1) * v9
				RagdollBallSocket.Parent = v6
			end
		end
	end
end
local function createAdditionalAttachments(p1, p2) --[[ createAdditionalAttachments | Line: 281 | Upvalues: RunService (copy) ]]
	for i, v in ipairs(p2) do
		local v1, v2, v3, v4 = unpack(v)
		local v5 = p1[v1]
		if v5 then
			local v6 = v5:FindFirstChild(v2)
			if not v6 or v6:IsA("Attachment") then
				if v4 then
					local v7 = v5:FindFirstChild(v4)
					if v7 and v7:IsA("Attachment") then
						v3 = v7.CFrame * v3
					end
				end
				if v6 then
					v6.CFrame = v3
					continue
				end
				local Attachment = Instance.new("Attachment")
				Attachment.Name = v2
				Attachment.CFrame = v3
				Attachment.Parent = v5
				if RunService:IsClient() then
					warn(("[RagdollRigging] - Creating attachment %q"):format(v2))
				end
			end
		end
	end
end
local function createNoCollides(p1, p2) --[[ createNoCollides | Line: 313 | Upvalues: RunService (copy) ]]
	local tbl = {}
	for i, v in ipairs(p2) do
		local v1, v2 = unpack(v)
		local v3 = p1[v1]
		local v4 = p1[v2]
		if v3 and v4 then
			local v5 = tbl[v4]
			if not v5 then
				v5 = {}
				tbl[v4] = v5
			end
			v5[v3] = true
		end
	end
	local t = {}
	for k, v in pairs(tbl) do
		local t2 = {}
		for i, v2 in ipairs(k:GetChildren()) do
			if v2:IsA("NoCollisionConstraint") and v2.Name == "RagdollNoCollision" then
				local Part0 = v2.Part0
				if v2.Part1 == k and v[Part0] then
					v[Part0] = nil
					continue
				end
				table.insert(t2, v2)
			end
		end
		t[k] = t2
	end
	for k, v in pairs(tbl) do
		local v6 = t[k]
		for k2, v2 in pairs(v) do
			local RagdollNoCollision = table.remove(v6)
			if not RagdollNoCollision then
				local NoCollisionConstraint = Instance.new("NoCollisionConstraint")
				if RunService:IsClient() then
					warn("[RagdollRigging] - Creating NoCollisionConstraint %q")
				end
				RagdollNoCollision = NoCollisionConstraint
			end
			RagdollNoCollision.Name = "RagdollNoCollision"
			RagdollNoCollision.Part0 = k2
			RagdollNoCollision.Part1 = k
			RagdollNoCollision.Parent = k
		end
	end
end
local function disableMotorSet(p1, p2) --[[ disableMotorSet | Line: 375 ]]
	local t = {}
	for i, v in ipairs(p2) do
		local v1 = p1:FindFirstChild(v[2])
		if v1 then
			local v2 = v1:FindFirstChild(v[1])
			if v2 and v2:IsA("Motor6D") then
				table.insert(t, v2)
				v2.Enabled = false
			end
		end
	end
	return t
end
function t.createRagdollJoints(p1, p2) --[[ createRagdollJoints | Line: 391 | Upvalues: indexParts (copy), createAdditionalAttachments (copy), t14 (copy), createRigJoints (copy), t15 (copy), createNoCollides (copy), t16 (copy), t10 (copy), t11 (copy), t12 (copy) ]]
	local v1 = indexParts(p1)
	if p2 == Enum.HumanoidRigType.R6 then
		createAdditionalAttachments(v1, t14)
		createRigJoints(v1, t15)
		createNoCollides(v1, t16)
		return
	end
	if p2 == Enum.HumanoidRigType.R15 then
		createAdditionalAttachments(v1, t10)
		createRigJoints(v1, t11)
		createNoCollides(v1, t12)
	else
		error("unknown rig type", 2)
	end
end
function t.removeRagdollJoints(p1) --[[ removeRagdollJoints | Line: 406 ]]
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BallSocketConstraint") and v.Name == "RagdollBallSocket" or v:IsA("NoCollisionConstraint") and v.Name == "RagdollNoCollision" then
			v:Destroy()
		end
	end
end
function t.disableMotors(p1, p2) --[[ disableMotors | Line: 417 | Upvalues: disableMotorSet (copy), t17 (copy), t13 (copy) ]]
	local v1 = nil
	if p2 == Enum.HumanoidRigType.R6 then
		v1 = disableMotorSet(p1, t17)
	elseif p2 == Enum.HumanoidRigType.R15 then
		v1 = disableMotorSet(p1, t13)
	else
		error("unknown rig type", 2)
	end
	local v4 = p1.PrimaryPart or p1:FindFirstChild("HumanoidRootPart")
	if not (v4 and v4:IsA("BasePart")) then
		return v1
	end
	v4.CanCollide = false
	return v1
end
function t.disableParticleEmittersAndFadeOutYielding(p1, p2) --[[ disableParticleEmittersAndFadeOutYielding | Line: 440 | Upvalues: RunService (copy) ]]
	if RunService:IsServer() then
		error("disableParticleEmittersAndFadeOutYielding should not be called on the server.", 2)
	end
	local tbl = {}
	for k, v in pairs((p1:GetDescendants())) do
		if v:IsA("BasePart") or v:IsA("Decal") then
			tbl[v] = v.Transparency
			continue
		end
		if v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
	local sum = 0
	while sum < p2 do
		sum = sum + RunService.Heartbeat:Wait()
		local v2 = math.min(sum / p2, 1)
		for k, v in pairs(tbl) do
			k.Transparency = (1 - v2) * v + v2
		end
	end
end
function t.easeJointFriction(p1, p2) --[[ easeJointFriction | Line: 468 | Upvalues: RunService (copy) ]]
	local tbl = {}
	for k, v in pairs((p1:GetDescendants())) do
		if v:IsA("BallSocketConstraint") and v.Name == "RagdollBallSocket" then
			local MaxFrictionTorque = v.MaxFrictionTorque
			local v2 = v.Parent.Name
			tbl[v] = { v, MaxFrictionTorque, MaxFrictionTorque * (if v2 == "UpperTorso" or v2 == "Head" then 0.5 else 0.05) }
		end
	end
	local sum = 0
	while sum < p2 do
		local _, v4 = RunService.Stepped:Wait()
		sum = sum + v4
		local v5 = math.min(sum / p2, 1)
		for k, v in pairs(tbl) do
			local v6, v7, v8 = unpack(v)
			v6.MaxFrictionTorque = (1 - v5) * v7 + v5 * v8
		end
	end
end
return t