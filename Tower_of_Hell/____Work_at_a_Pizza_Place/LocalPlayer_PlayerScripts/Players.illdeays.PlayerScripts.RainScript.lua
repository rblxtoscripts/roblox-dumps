-- https://lua.expert/
local Rain = require(script.Rain)
Rain:SetColor(Color3.fromRGB(script.Color.Value.x, script.Color.Value.y, script.Color.Value.z))
Rain:SetDirection(script.Direction.Value)
Rain:SetTransparency(script.Transparency.Value)
Rain:SetSpeedRatio(script.SpeedRatio.Value)
Rain:SetIntensityRatio(script.IntensityRatio.Value)
Rain:SetLightInfluence(script.LightInfluence.Value)
Rain:SetLightEmission(script.LightEmission.Value)
Rain:SetVolume(script.Volume.Value)
Rain:SetSoundId(script.SoundId.Value)
Rain:SetStraightTexture(script.StraightTexture.Value)
Rain:SetTopDownTexture(script.TopDownTexture.Value)
Rain:SetSplashTexture(script.SplashTexture.Value)
local TransparencyThreshold = script.TransparencyThreshold.Value
if script.TransparencyConstraint.Value and script.CanCollideConstraint.Value then
	Rain:SetCollisionMode(Rain.CollisionMode.Function, function(p1) --[[ Line: 24 | Upvalues: TransparencyThreshold (copy) ]]
		return if p1.Transparency <= TransparencyThreshold then p1.CanCollide else false
	end)
elseif script.TransparencyConstraint.Value then
	Rain:SetCollisionMode(Rain.CollisionMode.Function, function(p1) --[[ Line: 31 | Upvalues: TransparencyThreshold (copy) ]]
		return p1.Transparency <= TransparencyThreshold
	end)
elseif script.CanCollideConstraint.Value then
	Rain:SetCollisionMode(Rain.CollisionMode.Function, function(p1) --[[ Line: 38 ]]
		return p1.CanCollide
	end)
end
if game.ReplicatedStorage.GlobalData.Rain.Value then
	Rain:Enable(TweenInfo.new(1))
end
game.ReplicatedStorage.GlobalData.Rain:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 48 | Upvalues: Rain (copy) ]]
	if game.ReplicatedStorage.GlobalData.Rain.Value then
		Rain:Enable(TweenInfo.new(1))
	else
		Rain:Disable(TweenInfo.new(1))
	end
end)