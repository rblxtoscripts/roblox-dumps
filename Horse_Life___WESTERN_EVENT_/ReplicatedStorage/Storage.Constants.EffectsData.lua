-- https://lua.expert/
local RunService = game:GetService("RunService")
local Effects = game:GetService("ReplicatedStorage"):WaitForChild("Storage"):WaitForChild("Assets").Effects
if RunService:IsServer() then
	for k, v in pairs(Effects:GetDescendants()) do
		if v:IsA("PointLight") or v:IsA("ParticleEmitter") then
			v.Enabled = false
		end
	end
end
return setmetatable({
	MobSpawn = {
		SmokeSplash = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 25
		},
		Specs = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 25
		},
		Confetti = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 25
		},
		ConfettiStar = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 25
		}
	},
	NodeSpawn = {
		SmokeSplash = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 25
		},
		Specs = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 25
		}
	},
	LyricSpawn = {
		SmokeSplash = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 40
		},
		Specs = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 40
		}
	},
	AureliaSpawn = {
		SmokeSplash = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 40
		},
		Specs = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 40
		}
	},
	AlexSpawn = {
		SmokeSplash = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 40
		},
		Specs = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 40
		}
	},
	TouchNodeDestroyed = {
		ClearSnow = {
			Duration = 0,
			StartDelay = 0,
			EmissionAmount = 35
		}
	}
}, {
	__index = function(p1, p2) --[[ __index | Line: 106 | Upvalues: Effects (copy) ]]
		local v1 = Effects:FindFirstChild(p2)
		if not v1 then
			return
		end
		local t = {}
		for v2, v3 in v1:GetDescendants() do
			if v3:IsA("PointLight") or (v3:IsA("ParticleEmitter") or v3:IsA("Sound")) then
				t[v3.Name] = {
					Duration = 1,
					StartDelay = 0
				}
			end
		end
		p1[p2] = t
		return t
	end
})