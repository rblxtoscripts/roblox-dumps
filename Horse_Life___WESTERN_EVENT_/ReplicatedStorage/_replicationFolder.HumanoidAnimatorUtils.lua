-- https://lua.expert/
return {
	getOrCreateAnimator = function(p1) --[[ getOrCreateAnimator | Line: 6 ]]
		local Animator = p1:FindFirstChildOfClass("Animator")
		if not Animator then
			local Animator_2 = Instance.new("Animator")
			Animator_2.Name = "Animator"
			Animator_2.Parent = p1
			Animator = Animator_2
		end
		return Animator
	end,
	stopAnimations = function(p1, p2) --[[ stopAnimations | Line: 17 ]]
		for k, v in pairs(p1:GetPlayingAnimationTracks()) do
			v:Stop(p2)
		end
	end,
	isPlayingAnimationTrack = function(p1, p2) --[[ isPlayingAnimationTrack | Line: 23 ]]
		for k, v in pairs(p1:GetPlayingAnimationTracks()) do
			if v == p2 then
				return true
			end
		end
		return false
	end
}