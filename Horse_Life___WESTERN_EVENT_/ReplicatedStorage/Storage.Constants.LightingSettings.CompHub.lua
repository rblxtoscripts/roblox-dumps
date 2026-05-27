-- https://lua.expert/
return {
	Default = {
		Priority = -100,
		TweenTime = 10,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.3,
			Ambient = Color3.fromRGB(157, 196, 255),
			ColorShift_Bottom = Color3.fromRGB(27, 0, 94),
			ColorShift_Top = Color3.fromRGB(255, 198, 148),
			OutdoorAmbient = Color3.fromRGB(0, 32, 70)
		},
		ColorCorrection = {
			Contrast = 0,
			Brightness = 0,
			Saturation = 0,
			TintColor = Color3.fromRGB(255, 255, 255)
		},
		SunRays = {
			Intensity = 0.01,
			Spread = 0.1
		},
		Bloom = {
			Intensity = 0.35,
			Size = 12,
			Threshold = 2.822
		},
		Atmosphere = {
			Density = 0.3,
			Offset = 0.5,
			Glare = 0.1,
			Haze = 2,
			Color = Color3.fromRGB(112, 198, 255),
			Decay = Color3.fromRGB(255, 223, 187)
		},
		DepthOfField = {
			FarIntensity = 0,
			FocusDistance = 0,
			InFocusRadius = 0,
			NearIntensity = 0
		},
		DOF = {
			FarIntensity = 0,
			FocusDistance = 0,
			InFocusRadius = 0,
			NearIntensity = 0
		},
		Clouds = {
			Cover = 0.5,
			Density = 0.7,
			Color = Color3.fromRGB(255, 255, 255)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(59, 168, 103),
			Basalt = Color3.fromRGB(75, 74, 74),
			Brick = Color3.fromRGB(138, 97, 73),
			Cobblestone = Color3.fromRGB(112, 105, 95),
			Concrete = Color3.fromRGB(152, 152, 152),
			CrackedLava = Color3.fromRGB(255, 24, 67),
			Glacier = Color3.fromRGB(221, 228, 229),
			Grass = Color3.fromRGB(69, 112, 52),
			Ground = Color3.fromRGB(89, 41, 29),
			Ice = Color3.fromRGB(149, 142, 105),
			LeafyGrass = Color3.fromRGB(44, 102, 34),
			Limestone = Color3.fromRGB(113, 102, 91),
			Mud = Color3.fromRGB(106, 66, 50),
			Pavement = Color3.fromRGB(143, 144, 135),
			Rock = Color3.fromRGB(86, 80, 73),
			Salt = Color3.fromRGB(112, 80, 65),
			Sand = Color3.fromRGB(207, 203, 167),
			Sandstone = Color3.fromRGB(148, 124, 95),
			Slate = Color3.fromRGB(89, 74, 67),
			Snow = Color3.fromRGB(235, 253, 255),
			WoodPlanks = Color3.fromRGB(172, 148, 108)
		},
		Blur = {
			Size = 0
		},
		Sky = {
			SkyboxBk = "rbxassetid://6444884337",
			SkyboxDn = "rbxassetid://16417109217",
			SkyboxFt = "rbxassetid://6444884337",
			SkyboxLf = "rbxassetid://6444884337",
			SkyboxRt = "rbxassetid://6444884337",
			SkyboxUp = "rbxassetid://16417109487",
			MoonTextureId = "rbxassetid://6444320592",
			MoonAngularSize = 11
		}
	}
}