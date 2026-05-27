-- https://lua.expert/
require(game.ReplicatedStorage.Sonar)
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
			Asphalt = Color3.fromRGB(49, 140, 84),
			Basalt = Color3.fromRGB(75, 74, 74),
			Brick = Color3.fromRGB(103, 111, 136),
			Cobblestone = Color3.fromRGB(175, 175, 175),
			Concrete = Color3.fromRGB(152, 152, 152),
			CrackedLava = Color3.fromRGB(255, 24, 67),
			Glacier = Color3.fromRGB(221, 228, 229),
			Grass = Color3.fromRGB(69, 112, 52),
			Ground = Color3.fromRGB(225, 177, 152),
			Ice = Color3.fromRGB(255, 128, 0),
			LeafyGrass = Color3.fromRGB(112, 145, 56),
			Limestone = Color3.fromRGB(177, 136, 106),
			Mud = Color3.fromRGB(77, 105, 127),
			Pavement = Color3.fromRGB(144, 95, 55),
			Rock = Color3.fromRGB(99, 100, 102),
			Salt = Color3.fromRGB(109, 77, 62),
			Sand = Color3.fromRGB(203, 170, 131),
			Sandstone = Color3.fromRGB(78, 226, 255),
			Slate = Color3.fromRGB(86, 79, 73),
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
	},
	DressUp = {
		Priority = 10000,
		TweenTime = 0,
		Atmosphere = {
			Density = 0.45,
			Glare = 0.1,
			Haze = 2,
			Color = Color3.fromRGB(248, 247, 255),
			Decay = Color3.fromRGB(248, 247, 255)
		},
		Clouds = {
			Cover = 0,
			Density = 0
		},
		Sky = {
			SkyboxBk = "rbxassetid://600830446",
			SkyboxDn = "rbxassetid://600831635",
			SkyboxFt = "rbxassetid://600832720",
			SkyboxLf = "rbxassetid://600886090",
			SkyboxRt = "rbxassetid://600833862",
			SkyboxUp = "rbxassetid://600835177"
		}
	},
	SnowVillage = {
		Priority = 66,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(174, 213, 255),
			ColorShift_Bottom = Color3.fromRGB(114, 199, 255),
			ColorShift_Top = Color3.fromRGB(255, 160, 43),
			OutdoorAmbient = Color3.fromRGB(35, 141, 255)
		},
		ColorCorrection = {
			Contrast = 0,
			Brightness = 0,
			Saturation = 0,
			TintColor = Color3.fromRGB(255, 255, 255)
		},
		SunRays = {
			Intensity = 0.495,
			Spread = 0.495
		},
		Atmosphere = {
			Density = 0.375,
			Offset = 0,
			Glare = 0.1,
			Haze = 2,
			Color = Color3.fromRGB(103, 161, 255),
			Decay = Color3.fromRGB(255, 223, 187)
		},
		Clouds = {
			Cover = 0.77,
			Density = 0.179,
			Color = Color3.fromRGB(255, 153, 128)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(170, 255, 252),
			Basalt = Color3.fromRGB(75, 74, 74),
			Brick = Color3.fromRGB(103, 111, 136),
			Cobblestone = Color3.fromRGB(175, 175, 175),
			Concrete = Color3.fromRGB(152, 152, 152),
			CrackedLava = Color3.fromRGB(255, 24, 67),
			Glacier = Color3.fromRGB(161, 255, 255),
			Grass = Color3.fromRGB(79, 120, 101),
			Ground = Color3.fromRGB(140, 130, 104),
			Ice = Color3.fromRGB(144, 235, 255),
			LeafyGrass = Color3.fromRGB(115, 172, 141),
			Limestone = Color3.fromRGB(177, 136, 106),
			Mud = Color3.fromRGB(158, 133, 125),
			Pavement = Color3.fromRGB(144, 95, 55),
			Rock = Color3.fromRGB(99, 100, 102),
			Salt = Color3.fromRGB(135, 94, 71),
			Sand = Color3.fromRGB(203, 170, 131),
			Sandstone = Color3.fromRGB(179, 90, 62),
			Slate = Color3.fromRGB(115, 117, 112),
			Snow = Color3.fromRGB(235, 253, 255),
			WoodPlanks = Color3.fromRGB(172, 148, 108)
		}
	},
	Royal = {
		Priority = 1,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(157, 196, 255),
			ColorShift_Bottom = Color3.fromRGB(27, 0, 94),
			ColorShift_Top = Color3.fromRGB(255, 198, 148),
			OutdoorAmbient = Color3.fromRGB(0, 3, 70)
		},
		Atmosphere = {
			Density = 0.281,
			Offset = 0.3,
			Glare = 0.1,
			Haze = 2,
			Color = Color3.fromRGB(90, 115, 255),
			Decay = Color3.fromRGB(255, 238, 142)
		},
		Clouds = {
			Cover = 0.676,
			Density = 0.305,
			Color = Color3.fromRGB(170, 73, 255)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(49, 140, 84),
			Basalt = Color3.fromRGB(234, 245, 255),
			Grass = Color3.fromRGB(69, 112, 52),
			Ground = Color3.fromRGB(182, 125, 111),
			LeafyGrass = Color3.fromRGB(112, 145, 56),
			Limestone = Color3.fromRGB(177, 136, 106),
			Mud = Color3.fromRGB(44, 36, 32),
			Sand = Color3.fromRGB(136, 81, 60),
			Sandstone = Color3.fromRGB(255, 179, 116),
			Snow = Color3.fromRGB(108, 179, 255),
			Salt = Color3.fromRGB(109, 77, 62),
			Ice = Color3.fromRGB(99, 242, 255)
		}
	},
	Easter = {
		Priority = 1,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(157, 196, 255),
			ColorShift_Bottom = Color3.fromRGB(27, 0, 94),
			ColorShift_Top = Color3.fromRGB(255, 198, 148),
			OutdoorAmbient = Color3.fromRGB(0, 3, 70)
		},
		Atmosphere = {
			Density = 0.281,
			Offset = 0.3,
			Glare = 0.1,
			Haze = 2,
			Color = Color3.fromRGB(90, 115, 255),
			Decay = Color3.fromRGB(255, 238, 142)
		},
		Clouds = {
			Cover = 0.676,
			Density = 0.305,
			Color = Color3.fromRGB(170, 73, 255)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(49, 140, 84),
			Basalt = Color3.fromRGB(62, 62, 61),
			Grass = Color3.fromRGB(69, 112, 52),
			Ground = Color3.fromRGB(182, 125, 111),
			LeafyGrass = Color3.fromRGB(112, 145, 56),
			Limestone = Color3.fromRGB(177, 136, 106),
			Mud = Color3.fromRGB(44, 36, 32),
			Sand = Color3.fromRGB(136, 81, 60),
			Sandstone = Color3.fromRGB(75, 59, 166),
			Snow = Color3.fromRGB(108, 179, 255),
			Salt = Color3.fromRGB(109, 77, 62)
		}
	},
	Carnival = {
		Priority = 1,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(157, 137, 255),
			ColorShift_Bottom = Color3.fromRGB(174, 12, 255),
			ColorShift_Top = Color3.fromRGB(255, 212, 247),
			OutdoorAmbient = Color3.fromRGB(0, 3, 70)
		},
		Atmosphere = {
			Density = 0.3,
			Offset = 0,
			Glare = 0.15,
			Haze = 2.2,
			Color = Color3.fromRGB(140, 230, 255),
			Decay = Color3.fromRGB(172, 151, 255)
		},
		Clouds = {
			Cover = 0.676,
			Density = 0.305,
			Color = Color3.fromRGB(170, 73, 255)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(49, 140, 84),
			Basalt = Color3.fromRGB(62, 62, 61),
			Grass = Color3.fromRGB(69, 112, 52),
			Ground = Color3.fromRGB(182, 125, 111),
			LeafyGrass = Color3.fromRGB(112, 145, 56),
			Limestone = Color3.fromRGB(177, 136, 106),
			Mud = Color3.fromRGB(44, 36, 32),
			Sand = Color3.fromRGB(203, 170, 131),
			Snow = Color3.fromRGB(255, 120, 215),
			Ice = Color3.fromRGB(172, 117, 255),
			Salt = Color3.fromRGB(109, 77, 62),
			Sandstone = Color3.fromRGB(148, 124, 95)
		}
	},
	Valentines = {
		Priority = 1,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(108, 123, 255),
			ColorShift_Bottom = Color3.fromRGB(63, 25, 255),
			ColorShift_Top = Color3.fromRGB(255, 198, 148),
			OutdoorAmbient = Color3.fromRGB(0, 3, 70)
		},
		Atmosphere = {
			Density = 0.32,
			Offset = 0,
			Glare = 0.25,
			Haze = 2,
			Color = Color3.fromRGB(208, 192, 255),
			Decay = Color3.fromRGB(255, 175, 242)
		},
		Clouds = {
			Cover = 0.6,
			Density = 0.1,
			Color = Color3.fromRGB(201, 213, 255)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(74, 140, 98),
			Basalt = Color3.fromRGB(39, 0, 0),
			Grass = Color3.fromRGB(72, 112, 60),
			Ground = Color3.fromRGB(255, 140, 155),
			LeafyGrass = Color3.fromRGB(121, 145, 70),
			Limestone = Color3.fromRGB(89, 35, 21),
			Mud = Color3.fromRGB(121, 112, 98),
			Sand = Color3.fromRGB(136, 81, 60),
			Sandstone = Color3.fromRGB(255, 121, 163),
			Snow = Color3.fromRGB(255, 74, 177),
			Salt = Color3.fromRGB(129, 70, 58),
			CrackedLava = Color3.fromRGB(147, 44, 106)
		}
	},
	Birchwoods = {
		Priority = 1,
		TweenTime = 15,
		Terrain = {
			Asphalt = Color3.fromRGB(255, 187, 78),
			Grass = Color3.fromRGB(75, 127, 53),
			LeafyGrass = Color3.fromRGB(255, 176, 65),
			Sandstone = Color3.fromRGB(226, 230, 255)
		},
		Atmosphere = {
			Density = 0.33,
			Offset = 0.5,
			Glare = 0.3,
			Haze = 2,
			Color = Color3.fromRGB(255, 213, 161),
			Decay = Color3.fromRGB(255, 166, 93)
		}
	},
	Mountains = {
		Priority = 1,
		TweenTime = 15,
		Terrain = {
			Asphalt = Color3.fromRGB(65, 159, 100),
			Grass = Color3.fromRGB(62, 127, 68),
			LeafyGrass = Color3.fromRGB(91, 181, 89),
			Sandstone = Color3.fromRGB(255, 213, 164)
		},
		Atmosphere = {
			Density = 0.4,
			Offset = 0.5,
			Glare = 0.05,
			Haze = 2,
			Color = Color3.fromRGB(164, 205, 255),
			Decay = Color3.fromRGB(238, 250, 255)
		}
	},
	Arid = {
		Priority = 1,
		TweenTime = 15,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.3,
			Ambient = Color3.fromRGB(255, 200, 160),
			ColorShift_Bottom = Color3.fromRGB(27, 0, 94),
			ColorShift_Top = Color3.fromRGB(255, 198, 85),
			OutdoorAmbient = Color3.fromRGB(0, 32, 70)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(137, 140, 89),
			Grass = Color3.fromRGB(108, 109, 71),
			LeafyGrass = Color3.fromRGB(163, 147, 91),
			Sandstone = Color3.fromRGB(255, 142, 76),
			Slate = Color3.fromRGB(117, 98, 93),
			Basalt = Color3.fromRGB(63, 26, 26),
			Rock = Color3.fromRGB(100, 48, 39),
			Ground = Color3.fromRGB(255, 148, 116)
		},
		Atmosphere = {
			Density = 0.375,
			Offset = 0,
			Glare = 0.1,
			Haze = 2.45,
			Color = Color3.fromRGB(255, 218, 181),
			Decay = Color3.fromRGB(180, 214, 255)
		}
	},
	Desert = {
		Priority = 1,
		TweenTime = 15,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.3,
			Ambient = Color3.fromRGB(255, 200, 160),
			ColorShift_Bottom = Color3.fromRGB(94, 46, 45),
			ColorShift_Top = Color3.fromRGB(255, 198, 85),
			OutdoorAmbient = Color3.fromRGB(0, 32, 70)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(137, 140, 89),
			Grass = Color3.fromRGB(108, 109, 71),
			LeafyGrass = Color3.fromRGB(163, 147, 91),
			Sandstone = Color3.fromRGB(255, 142, 76),
			Slate = Color3.fromRGB(117, 98, 93),
			Basalt = Color3.fromRGB(63, 26, 26),
			Rock = Color3.fromRGB(100, 48, 39),
			Ground = Color3.fromRGB(255, 148, 116)
		},
		Atmosphere = {
			Density = 0.45,
			Offset = 0,
			Glare = 0.1,
			Haze = 2.45,
			Color = Color3.fromRGB(255, 208, 161),
			Decay = Color3.fromRGB(255, 168, 92)
		}
	},
	Blossom = {
		Priority = 1,
		TweenTime = 15,
		Terrain = {
			Asphalt = Color3.fromRGB(255, 174, 255),
			Grass = Color3.fromRGB(90, 148, 73),
			LeafyGrass = Color3.fromRGB(255, 157, 201),
			Sandstone = Color3.fromRGB(255, 178, 179)
		},
		Atmosphere = {
			Density = 0.33,
			Offset = 0.5,
			Glare = 0.5,
			Haze = 2,
			Color = Color3.fromRGB(255, 183, 208),
			Decay = Color3.fromRGB(255, 185, 185)
		}
	},
	Beach = {
		Priority = 1,
		TweenTime = 15,
		Terrain = {
			Limestone = Color3.fromRGB(177, 130, 65),
			Sand = Color3.fromRGB(227, 164, 86),
			Sandstone = Color3.fromRGB(255, 121, 94)
		},
		Atmosphere = {
			Density = 0.33,
			Offset = 0,
			Glare = 1,
			Haze = 2,
			Color = Color3.fromRGB(255, 163, 110),
			Decay = Color3.fromRGB(255, 107, 183)
		}
	},
	Swamp = {
		Priority = 1,
		TweenTime = 15,
		Terrain = {
			Asphalt = Color3.fromRGB(29, 70, 17),
			Grass = Color3.fromRGB(105, 149, 47),
			LeafyGrass = Color3.fromRGB(56, 98, 23),
			Sandstone = Color3.fromRGB(255, 248, 148)
		},
		Atmosphere = {
			Density = 0.4,
			Offset = 0.5,
			Glare = 0.2,
			Haze = 3,
			Color = Color3.fromRGB(152, 255, 229),
			Decay = Color3.fromRGB(170, 255, 134)
		}
	},
	["Clear Skies"] = {
		Priority = 2,
		TweenTime = 5,
		Clouds = {
			Cover = 0.5,
			Density = 0.7,
			Color = Color3.fromRGB(255, 255, 255)
		}
	},
	Rain = {
		Priority = 2,
		TweenTime = 5,
		Clouds = {
			Cover = 0.63,
			Density = 0.619,
			Color = Color3.fromRGB(64, 82, 138)
		}
	},
	Snow = {
		Priority = 3,
		TweenTime = 1,
		Clouds = {
			Cover = 1.4,
			Density = 1.3,
			Color = Color3.fromRGB(220, 225, 230)
		},
		Lighting = {
			Brightness = 1.6,
			EnvironmentDiffuseScale = 0.8,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.4,
			Ambient = Color3.fromRGB(190, 205, 220),
			ColorShift_Bottom = Color3.fromRGB(170, 190, 220),
			ColorShift_Top = Color3.fromRGB(220, 230, 245),
			OutdoorAmbient = Color3.fromRGB(150, 170, 190)
		},
		Atmosphere = {
			Density = 0.55,
			Offset = 0.5,
			Glare = 0.05,
			Haze = 4,
			Color = Color3.fromRGB(210, 220, 235),
			Decay = Color3.fromRGB(240, 245, 255)
		}
	},
	Sunny = {
		Priority = 3,
		TweenTime = 1,
		Clouds = {
			Cover = 0.15,
			Density = 0.35,
			Color = Color3.fromRGB(255, 255, 255)
		},
		Lighting = {
			Brightness = 2.6,
			EnvironmentDiffuseScale = 0.6,
			EnvironmentSpecularScale = 0.6,
			ExposureCompensation = 0.55,
			Ambient = Color3.fromRGB(195, 210, 225),
			ColorShift_Bottom = Color3.fromRGB(60, 40, 120),
			ColorShift_Top = Color3.fromRGB(255, 220, 170),
			OutdoorAmbient = Color3.fromRGB(30, 60, 100)
		},
		Atmosphere = {
			Density = 0.25,
			Offset = 0.5,
			Glare = 0.2,
			Haze = 1.5,
			Color = Color3.fromRGB(130, 200, 255),
			Decay = Color3.fromRGB(255, 230, 190)
		},
		SunRays = {
			Intensity = 0.08,
			Spread = 0.15
		}
	},
	Storm = {
		Priority = 2,
		TweenTime = 5,
		Clouds = {
			Cover = 0.83,
			Density = 0.719,
			Color = Color3.fromRGB(44, 56, 95)
		}
	},
	WildZoom = {
		Priority = 10,
		TweenTime = 0,
		DOF = {
			FarIntensity = 0,
			FocusDistance = 0,
			InFocusRadius = 10,
			NearIntensity = 0
		}
	},
	Dive = {
		Priority = 10,
		TweenTime = 0,
		Blur = {
			Size = 1
		}
	},
	CustomiseAnimal = {
		Priority = 9000000000,
		TweenTime = 0.6,
		DOF = {
			FarIntensity = 0.8,
			FocusDistance = 15,
			InFocusRadius = 5,
			NearIntensity = 0
		}
	},
	NPCDialog = {
		Priority = 9000000000,
		TweenTime = 0.6,
		DOF = {
			FarIntensity = 1,
			FocusDistance = 5,
			InFocusRadius = 2,
			NearIntensity = 0
		}
	},
	Night = {
		Priority = 1,
		TweenTime = 7,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.3,
			Ambient = Color3.fromRGB(231, 255, 255),
			ColorShift_Bottom = Color3.fromRGB(112, 181, 255),
			ColorShift_Top = Color3.fromRGB(140, 255, 247),
			OutdoorAmbient = Color3.fromRGB(0, 166, 255)
		},
		Atmosphere = {
			Density = 0.33,
			Offset = 0,
			Glare = 1.65,
			Haze = 2.1,
			Color = Color3.fromRGB(34, 122, 255),
			Decay = Color3.fromRGB(143, 212, 255)
		},
		Clouds = {
			Cover = 0.5,
			Density = 0.7,
			Color = Color3.fromRGB(16, 39, 125)
		}
	},
	Morning = {
		Priority = 1,
		TweenTime = 2,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.3,
			Ambient = Color3.fromRGB(157, 50, 0),
			ColorShift_Bottom = Color3.fromRGB(27, 0, 94),
			ColorShift_Top = Color3.fromRGB(255, 185, 64),
			OutdoorAmbient = Color3.fromRGB(225, 225, 225)
		},
		Atmosphere = {
			Density = 0.3,
			Offset = 0,
			Glare = 0.7,
			Haze = 2.1,
			Color = Color3.fromRGB(254, 143, 110),
			Decay = Color3.fromRGB(255, 232, 179)
		},
		Clouds = {
			Cover = 0.5,
			Density = 0.7,
			Color = Color3.fromRGB(255, 172, 130)
		}
	},
	Dusk = {
		Priority = 1,
		TweenTime = 7,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.3,
			Ambient = Color3.fromRGB(8, 0, 94),
			ColorShift_Bottom = Color3.fromRGB(0, 2, 94),
			ColorShift_Top = Color3.fromRGB(60, 15, 197),
			OutdoorAmbient = Color3.fromRGB(144, 128, 209)
		},
		Atmosphere = {
			Density = 0.375,
			Offset = 0,
			Glare = 0.4,
			Haze = 2.1,
			Color = Color3.fromRGB(123, 125, 255),
			Decay = Color3.fromRGB(248, 247, 255)
		},
		Clouds = {
			Cover = 0.5,
			Density = 0.75,
			Color = Color3.fromRGB(93, 81, 185)
		}
	},
	Races = {
		Priority = 10,
		TweenTime = 7,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.5,
			EnvironmentSpecularScale = 0.4,
			ExposureCompensation = 0.1,
			Ambient = Color3.fromRGB(0, 68, 255),
			ColorShift_Bottom = Color3.fromRGB(0, 145, 255),
			ColorShift_Top = Color3.fromRGB(255, 245, 208),
			OutdoorAmbient = Color3.fromRGB(0, 136, 255)
		},
		Atmosphere = {
			Density = 0.33,
			Offset = 0,
			Glare = 0.2,
			Haze = 2.08,
			Color = Color3.fromRGB(55, 68, 255),
			Decay = Color3.fromRGB(255, 215, 121)
		},
		Clouds = {
			Cover = 0.75,
			Density = 0.1,
			Color = Color3.fromRGB(255, 191, 101)
		}
	},
	PumpkinKing = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(255, 157, 0),
			ColorShift_Bottom = Color3.fromRGB(70, 144, 0),
			ColorShift_Top = Color3.fromRGB(255, 170, 0),
			OutdoorAmbient = Color3.fromRGB(255, 0, 0)
		},
		Atmosphere = {
			Density = 0.32,
			Offset = 0,
			Glare = 0.25,
			Haze = 2,
			Color = Color3.fromRGB(255, 140, 0),
			Decay = Color3.fromRGB(42, 61, 33)
		},
		Clouds = {
			Cover = 0.6,
			Density = 0.1,
			Color = Color3.fromRGB(36, 98, 40)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(74, 140, 98),
			Basalt = Color3.fromRGB(39, 0, 0),
			Grass = Color3.fromRGB(112, 0, 0),
			Ground = Color3.fromRGB(255, 0, 0),
			LeafyGrass = Color3.fromRGB(0, 0, 0),
			Limestone = Color3.fromRGB(89, 35, 21),
			Mud = Color3.fromRGB(121, 0, 0),
			Sand = Color3.fromRGB(136, 0, 0),
			Sandstone = Color3.fromRGB(255, 0, 0),
			Snow = Color3.fromRGB(255, 0, 0),
			Salt = Color3.fromRGB(129, 0, 0),
			CrackedLava = Color3.fromRGB(147, 0, 0)
		},
		Sky = {
			SkyboxBk = "http://www.roblox.com/asset/?id=458016711",
			SkyboxDn = "http://www.roblox.com/asset/?id=458016826",
			SkyboxFt = "http://www.roblox.com/asset/?id=458016532",
			SkyboxLf = "http://www.roblox.com/asset/?id=458016655",
			SkyboxRt = "http://www.roblox.com/asset/?id=458016782",
			SkyboxUp = "http://www.roblox.com/asset/?id=458016792",
			MoonTextureId = "rbxassetid://6444320592",
			MoonAngularSize = 11
		}
	},
	UndeadHaunt = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 3,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			ExposureCompensation = 0,
			Ambient = Color3.fromRGB(187, 233, 255),
			ColorShift_Bottom = Color3.fromRGB(23, 40, 61),
			ColorShift_Top = Color3.fromRGB(199, 242, 255),
			OutdoorAmbient = Color3.fromRGB(216, 255, 249)
		},
		Atmosphere = {
			Density = 0.45,
			Offset = 0,
			Glare = 0.25,
			Haze = 2,
			Color = Color3.fromRGB(255, 255, 255),
			Decay = Color3.fromRGB(0, 0, 0)
		},
		Clouds = {
			Cover = 0.6,
			Density = 0.1,
			Color = Color3.fromRGB(0, 0, 0)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(140, 140, 140),
			Basalt = Color3.fromRGB(10, 39, 4),
			Grass = Color3.fromRGB(255, 255, 255),
			Ground = Color3.fromRGB(255, 255, 255),
			LeafyGrass = Color3.fromRGB(0, 0, 0),
			Limestone = Color3.fromRGB(9, 89, 12),
			Mud = Color3.fromRGB(45, 121, 31),
			Sand = Color3.fromRGB(25, 136, 38),
			Sandstone = Color3.fromRGB(0, 0, 0),
			Snow = Color3.fromRGB(89, 255, 0),
			Salt = Color3.fromRGB(0, 129, 15),
			CrackedLava = Color3.fromRGB(0, 147, 5)
		}
	},
	Cupid = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.6,
			EnvironmentSpecularScale = 0.8,
			ExposureCompensation = -0.2,
			Ambient = Color3.fromRGB(80, 0, 40),
			ColorShift_Bottom = Color3.fromRGB(20, 0, 10),
			ColorShift_Top = Color3.fromRGB(200, 0, 80),
			OutdoorAmbient = Color3.fromRGB(60, 0, 30)
		},
		Atmosphere = {
			Density = 0.4,
			Offset = 0,
			Glare = 0.25,
			Haze = 2,
			Color = Color3.fromRGB(255, 30, 120),
			Decay = Color3.fromRGB(180, 0, 80)
		},
		Clouds = {
			Cover = 0.6,
			Density = 0.1,
			Color = Color3.fromRGB(180, 0, 80)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(80, 0, 40),
			Basalt = Color3.fromRGB(40, 0, 20),
			Grass = Color3.fromRGB(200, 20, 80),
			Ground = Color3.fromRGB(120, 0, 50),
			LeafyGrass = Color3.fromRGB(180, 30, 90),
			Limestone = Color3.fromRGB(160, 60, 100),
			Mud = Color3.fromRGB(80, 10, 30),
			Sand = Color3.fromRGB(200, 100, 130),
			Sandstone = Color3.fromRGB(140, 20, 60),
			Snow = Color3.fromRGB(255, 200, 220),
			Salt = Color3.fromRGB(255, 180, 210),
			CrackedLava = Color3.fromRGB(160, 0, 50)
		}
	},
	WinterSpirit = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.7,
			EnvironmentSpecularScale = 0.9,
			ExposureCompensation = -0.1,
			Ambient = Color3.fromRGB(120, 150, 190),
			ColorShift_Bottom = Color3.fromRGB(40, 90, 140),
			ColorShift_Top = Color3.fromRGB(180, 220, 255),
			OutdoorAmbient = Color3.fromRGB(90, 130, 180)
		},
		Atmosphere = {
			Density = 0.35,
			Offset = 0,
			Glare = 0.2,
			Haze = 1.8,
			Color = Color3.fromRGB(200, 235, 255),
			Decay = Color3.fromRGB(80, 140, 200)
		},
		Clouds = {
			Cover = 0.65,
			Density = 0.15,
			Color = Color3.fromRGB(190, 220, 255)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(70, 90, 120),
			Basalt = Color3.fromRGB(60, 80, 110),
			Grass = Color3.fromRGB(140, 180, 200),
			Ground = Color3.fromRGB(120, 150, 190),
			LeafyGrass = Color3.fromRGB(160, 200, 220),
			Limestone = Color3.fromRGB(170, 190, 210),
			Mud = Color3.fromRGB(90, 110, 130),
			Sand = Color3.fromRGB(200, 220, 230),
			Sandstone = Color3.fromRGB(180, 210, 230),
			Snow = Color3.fromRGB(235, 245, 255),
			Salt = Color3.fromRGB(210, 230, 240),
			CrackedLava = Color3.fromRGB(80, 110, 150)
		}
	},
	LEGO = {
		Priority = 1888888,
		TweenTime = 10,
		Lighting = {
			Ambient = Color3.fromRGB(70, 70, 70)
		}
	},
	Spirit_Tier1 = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.7,
			EnvironmentSpecularScale = 0.9,
			ExposureCompensation = -0.1,
			Ambient = Color3.fromRGB(60, 90, 40),
			ColorShift_Bottom = Color3.fromRGB(30, 70, 20),
			ColorShift_Top = Color3.fromRGB(200, 230, 150),
			OutdoorAmbient = Color3.fromRGB(80, 120, 50)
		},
		Atmosphere = {
			Density = 0.35,
			Offset = 0,
			Glare = 0.2,
			Haze = 1.8,
			Color = Color3.fromRGB(180, 210, 140),
			Decay = Color3.fromRGB(100, 140, 60)
		},
		Clouds = {
			Cover = 0.65,
			Density = 0.15,
			Color = Color3.fromRGB(210, 230, 180)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(55, 70, 45),
			Basalt = Color3.fromRGB(50, 65, 40),
			Grass = Color3.fromRGB(80, 140, 50),
			Ground = Color3.fromRGB(90, 110, 60),
			LeafyGrass = Color3.fromRGB(100, 160, 65),
			Limestone = Color3.fromRGB(160, 175, 130),
			Mud = Color3.fromRGB(85, 70, 45),
			Sand = Color3.fromRGB(190, 175, 120),
			Sandstone = Color3.fromRGB(175, 155, 100),
			Snow = Color3.fromRGB(230, 240, 210),
			Salt = Color3.fromRGB(200, 210, 180),
			CrackedLava = Color3.fromRGB(70, 80, 50)
		}
	},
	Spirit_Tier2 = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 1.8,
			EnvironmentDiffuseScale = 0.7,
			EnvironmentSpecularScale = 0.9,
			ExposureCompensation = -0.2,
			Ambient = Color3.fromRGB(20, 50, 90),
			ColorShift_Bottom = Color3.fromRGB(10, 40, 100),
			ColorShift_Top = Color3.fromRGB(150, 200, 255),
			OutdoorAmbient = Color3.fromRGB(30, 70, 130)
		},
		Atmosphere = {
			Density = 0.45,
			Offset = 0,
			Glare = 0.1,
			Haze = 2.5,
			Color = Color3.fromRGB(100, 160, 220),
			Decay = Color3.fromRGB(20, 60, 130)
		},
		Clouds = {
			Cover = 0.85,
			Density = 0.3,
			Color = Color3.fromRGB(80, 120, 200)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(40, 55, 80),
			Basalt = Color3.fromRGB(35, 50, 75),
			Grass = Color3.fromRGB(40, 90, 110),
			Ground = Color3.fromRGB(50, 80, 120),
			LeafyGrass = Color3.fromRGB(50, 110, 140),
			Limestone = Color3.fromRGB(130, 160, 200),
			Mud = Color3.fromRGB(45, 60, 90),
			Sand = Color3.fromRGB(140, 170, 210),
			Sandstone = Color3.fromRGB(120, 150, 195),
			Snow = Color3.fromRGB(210, 230, 255),
			Salt = Color3.fromRGB(180, 210, 240),
			CrackedLava = Color3.fromRGB(50, 70, 110)
		}
	},
	Spirit_Tier3 = {
		Priority = 100,
		TweenTime = 1,
		Lighting = {
			Brightness = 2.2,
			EnvironmentDiffuseScale = 0.7,
			EnvironmentSpecularScale = 0.9,
			ExposureCompensation = 0.2,
			Ambient = Color3.fromRGB(120, 30, 10),
			ColorShift_Bottom = Color3.fromRGB(180, 40, 0),
			ColorShift_Top = Color3.fromRGB(255, 160, 60),
			OutdoorAmbient = Color3.fromRGB(160, 50, 10)
		},
		Atmosphere = {
			Density = 0.55,
			Offset = 0.05,
			Glare = 0.6,
			Haze = 4,
			Color = Color3.fromRGB(220, 100, 30),
			Decay = Color3.fromRGB(140, 20, 0)
		},
		Clouds = {
			Cover = 0.9,
			Density = 0.4,
			Color = Color3.fromRGB(180, 60, 10)
		},
		Terrain = {
			Asphalt = Color3.fromRGB(80, 35, 20),
			Basalt = Color3.fromRGB(70, 25, 10),
			Grass = Color3.fromRGB(90, 40, 10),
			Ground = Color3.fromRGB(110, 50, 20),
			LeafyGrass = Color3.fromRGB(100, 45, 15),
			Limestone = Color3.fromRGB(160, 100, 60),
			Mud = Color3.fromRGB(80, 40, 20),
			Sand = Color3.fromRGB(200, 130, 60),
			Sandstone = Color3.fromRGB(185, 110, 50),
			Snow = Color3.fromRGB(220, 180, 140),
			Salt = Color3.fromRGB(200, 160, 110),
			CrackedLava = Color3.fromRGB(180, 50, 10)
		}
	},
	Lassoing = {
		Priority = 90000000000,
		TweenTime = 0.6,
		ColorCorrection = {
			Saturation = 0.15
		},
		DepthOfField = {
			FarIntensity = 0,
			FocusDistance = 0,
			InFocusRadius = 0,
			NearIntensity = 0
		},
		DOF = {
			FarIntensity = 0.125,
			FocusDistance = 40,
			InFocusRadius = 35,
			NearIntensity = 0
		},
		Blur = {
			Size = 0
		}
	}
}