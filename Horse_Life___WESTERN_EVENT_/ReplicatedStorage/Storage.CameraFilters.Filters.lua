-- https://lua.expert/
local LightingSettings = require(game.ReplicatedStorage.Sonar)("Constants").LightingSettings
local tbl = {
	BlackAndWhite = {
		DisplayName = "B&W",
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 2,
			Ambient = Color3.fromRGB(31, 32, 117),
			ColorShift_Bottom = Color3.fromRGB(44, 0, 94),
			ColorShift_Top = Color3.fromRGB(0, 138, 197),
			OutdoorAmbient = Color3.fromRGB(109, 143, 159)
		},
		Atmosphere = {
			Color = Color3.fromRGB(95, 142, 173),
			Decay = Color3.fromRGB(242, 247, 255)
		},
		ColorCorrection = {
			Contrast = 0.5,
			Brightness = 0,
			Saturation = -1,
			TintColor = Color3.fromRGB(255, 255, 255)
		}
	},
	Ethereal = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 2,
			Ambient = Color3.fromRGB(248, 176, 255),
			ColorShift_Top = Color3.fromRGB(255, 199, 103),
			OutdoorAmbient = Color3.fromRGB(0, 32, 70)
		},
		Atmosphere = {
			Density = 0.35,
			Glare = 0.2,
			Haze = 2,
			Color = Color3.fromRGB(61, 236, 255),
			Decay = Color3.fromRGB(255, 129, 200)
		},
		Bloom = {
			Intensity = 0.1,
			Size = 30,
			Threshold = 1.4
		},
		ColorCorrection = {
			Contrast = -0.1,
			Brightness = 0.05,
			Saturation = 0.3,
			TintColor = Color3.fromRGB(190, 224, 255)
		},
		DOF = {
			FarIntensity = 0.1,
			FocusDistance = 50,
			InFocusRadius = 0,
			NearIntensity = 0
		}
	},
	Kawaii = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 2,
			Ambient = Color3.fromRGB(250, 179, 255),
			ColorShift_Top = Color3.fromRGB(255, 169, 152),
			OutdoorAmbient = Color3.fromRGB(29, 78, 130)
		},
		Atmosphere = {
			Glare = 0.5,
			Haze = 2.2,
			Color = Color3.fromRGB(255, 156, 247),
			Decay = Color3.fromRGB(217, 237, 255)
		},
		DOF = {
			FarIntensity = 0.2,
			FocusDistance = 75,
			InFocusRadius = 0,
			NearIntensity = 0
		}
	},
	Vintage = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 2,
			Ambient = Color3.fromRGB(161, 129, 255),
			ColorShift_Top = Color3.fromRGB(255, 186, 146),
			OutdoorAmbient = Color3.fromRGB(70, 0, 0)
		},
		Atmosphere = {
			Color = Color3.fromRGB(95, 142, 173),
			Decay = Color3.fromRGB(242, 247, 255)
		},
		ColorCorrection = {
			Contrast = -0.3,
			Brightness = 0,
			Saturation = 0.3,
			TintColor = Color3.fromRGB(239, 182, 154)
		}
	},
	Evil = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 2,
			Ambient = Color3.fromRGB(85, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(255, 204, 0),
			ColorShift_Top = Color3.fromRGB(255, 0, 0),
			OutdoorAmbient = Color3.fromRGB(121, 0, 99)
		},
		Atmosphere = {
			Density = 0.5,
			Glare = 0,
			Haze = 2.5,
			Color = Color3.fromRGB(45, 59, 77),
			Decay = Color3.fromRGB(255, 0, 4)
		},
		ColorCorrection = {
			Contrast = 0.1,
			Brightness = 0,
			Saturation = 0.3,
			TintColor = Color3.fromRGB(239, 182, 154)
		},
		DOF = {
			FarIntensity = 0.7,
			FocusDistance = 75,
			InFocusRadius = 0,
			NearIntensity = 0
		}
	},
	Focused = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 2,
			Ambient = Color3.fromRGB(138, 163, 255),
			ColorShift_Top = Color3.fromRGB(255, 176, 119),
			OutdoorAmbient = Color3.fromRGB(0, 32, 70)
		},
		Atmosphere = {
			Density = 0.4,
			Glare = 0.05,
			Haze = 1.75,
			Color = Color3.fromRGB(120, 197, 255),
			Decay = Color3.fromRGB(255, 222, 193)
		},
		DOF = {
			FarIntensity = 1,
			FocusDistance = 40,
			InFocusRadius = 0,
			NearIntensity = 0
		}
	},
	Dreamy = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			Brightness = 3,
			Ambient = Color3.fromRGB(100, 69, 255),
			ColorShift_Bottom = Color3.fromRGB(153, 119, 255),
			ColorShift_Top = Color3.fromRGB(191, 146, 255),
			OutdoorAmbient = Color3.fromRGB(144, 116, 255)
		},
		Atmosphere = {
			Density = 0.35,
			Glare = 0.3,
			Haze = 2.35,
			Color = Color3.fromRGB(170, 170, 255),
			Decay = Color3.fromRGB(189, 204, 255)
		},
		Bloom = {
			Intensity = 0.15,
			Size = 55,
			Threshold = 1
		}
	},
	Cool = {
		Priority = 9000000000,
		TweenTime = 0.5,
		Lighting = {
			ColorShift_Top = Color3.fromRGB(255, 211, 181)
		},
		Atmosphere = {
			Density = 0.3,
			Glare = 0.45,
			Haze = 2,
			Color = Color3.fromRGB(147, 185, 255),
			Decay = Color3.fromRGB(189, 204, 255)
		},
		ColorCorrection = {
			Contrast = 0,
			Brightness = 0.1,
			Saturation = 0,
			TintColor = Color3.fromRGB(183, 208, 255)
		}
	}
}
for k, v in pairs(tbl) do
	v.UIGradient = script.Parent.Gradients:FindFirstChild(k)
	LightingSettings[k] = v
end
return tbl