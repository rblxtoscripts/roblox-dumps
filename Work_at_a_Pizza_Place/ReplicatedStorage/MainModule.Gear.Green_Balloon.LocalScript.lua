-- https://lua.expert/
function Leap() --[[ Leap | Line: 1 ]]
	script.Parent.Parent.Humanoid.Jump = false
end
script.Parent.Parent.Humanoid.Jumping:connect(Leap)