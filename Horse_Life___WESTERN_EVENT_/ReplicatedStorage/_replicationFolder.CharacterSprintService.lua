-- https://lua.expert/
local t = {}
local TweenService = game:GetService("TweenService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("FoVService")
local v2 = Sonar("Constants")
local v3 = Sonar("Signal")
local v4 = Sonar("PlayerWrapper").GetClient()
local CharacterSprint = Instance.new("BoolValue")
CharacterSprint.Name = "CharacterSprint"
CharacterSprint.Parent = game.Players.LocalPlayer
local SprintTween = Instance.new("NumberValue", CharacterSprint)
SprintTween.Name = "SprintTween"
local v5 = false
local v6 = nil
local v7 = nil
local function canSetWalkspeed() --[[ canSetWalkspeed | Line: 29 ]]
	return true
end
local function sprint() --[[ sprint | Line: 34 | Upvalues: CharacterSprint (copy), v1 (copy), TweenService (copy), SprintTween (copy) ]]
	CharacterSprint.Value = true
	v1.setModifier("CharacterSprint", true)
	TweenService:Create(SprintTween, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Value = 1
	}):Play()
end
local function walk() --[[ walk | Line: 43 | Upvalues: v1 (copy), v6 (ref), v4 (copy), v7 (ref), CharacterSprint (copy), TweenService (copy), SprintTween (copy) ]]
	v1.setModifier("CharacterSprint", false)
	v1.setModifier("Crouch", false)
	v6:Stop()
	v4.PetAnimation:Stop()
	v7:Stop()
	CharacterSprint.Value = false
	TweenService:Create(SprintTween, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Value = 0
	}):Play()
end
local function crouch() --[[ crouch | Line: 54 | Upvalues: v5 (ref), v6 (ref), v1 (copy), TweenService (copy), SprintTween (copy), t (copy) ]]
	v5 = true
	v6:Play(0.25)
	v1.setModifier("Crouch", true)
	TweenService:Create(SprintTween, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Value = 1
	}):Play()
	t.CrouchChanged:Fire()
end
function t.GetAlpha(p1) --[[ GetAlpha | Line: 63 | Upvalues: SprintTween (copy) ]]
	return SprintTween.Value
end
function t.IsSprinting(p1) --[[ IsSprinting | Line: 67 | Upvalues: CharacterSprint (copy) ]]
	return CharacterSprint.Value
end
function t.StopSprinting(p1) --[[ StopSprinting | Line: 71 | Upvalues: walk (copy) ]]
	walk()
end
function t.Sprint(p1) --[[ Sprint | Line: 76 | Upvalues: t (copy), sprint (copy) ]]
	t:StopCrouching()
	sprint()
end
function t.IsCrouching(p1) --[[ IsCrouching | Line: 81 | Upvalues: v5 (ref) ]]
	return v5
end
function t.Crouch(p1) --[[ Crouch | Line: 85 | Upvalues: t (copy), crouch (copy) ]]
	t:StopSprinting()
	crouch()
end
function t.StopCrouching(p1) --[[ StopCrouching | Line: 90 | Upvalues: v5 (ref), t (copy), walk (copy) ]]
	v5 = false
	t.CrouchChanged:Fire()
	walk()
end
t.SprintValue = CharacterSprint
t.SprintChanged = CharacterSprint:GetPropertyChangedSignal("Value")
t.CrouchChanged = v3.new()
local Animation = Instance.new("Animation")
Animation.AnimationId = v2.CROUCH_ANIMATION
local Animation_2 = Instance.new("Animation")
Animation_2.AnimationId = v2.CROUCH_WALK_ANIMATION
local Animation_3 = Instance.new("Animation")
Animation_3.AnimationId = v2.PET_HORSE_ANIMATION
local function updateCharacter(p1) --[[ updateCharacter | Line: 131 | Upvalues: v6 (ref), Animation (copy), v7 (ref), Animation_2 (copy), v4 (copy), Animation_3 (copy), v5 (ref) ]]
	if not p1 then
		return
	end
	repeat
		task.wait()
	until p1:IsDescendantOf(workspace)
	local Humanoid = p1:WaitForChild("Humanoid")
	v6 = Humanoid:LoadAnimation(Animation)
	v6.Priority = Enum.AnimationPriority.Movement
	v7 = Humanoid:LoadAnimation(Animation_2)
	v7.Priority = Enum.AnimationPriority.Action
	v4.PetAnimation = Humanoid:LoadAnimation(Animation_3)
	v4.PetAnimation.Priority = Enum.AnimationPriority.Action
	Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 145 | Upvalues: v4 (ref), v5 (ref), Humanoid (copy), v7 (ref), v6 (ref) ]]
		if v4.PetAnimation.IsPlaying then
			v4.PetAnimation:Stop(0.125)
		end
		if not v5 then
			return
		end
		if Humanoid.MoveDirection.Magnitude > 0 then
			if not v7.IsPlaying then
				v6:Stop(0.125)
				v4.PetAnimation:Stop(0.125)
				v7:Play(0.125)
			end
		else
			if v6.IsPlaying then
				return
			end
			v7:Stop(0.125)
			v6:Play(0.125)
		end
	end)
end
game.Players.LocalPlayer.CharacterAdded:Connect(updateCharacter)
updateCharacter(game.Players.LocalPlayer.Character)
return t