-- https://lua.expert/
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local v1 = "Lobby"
local t = {
	Presets = {
		Summer = {
			Brightness = 2,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 2,
			ClockTime = 13,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(70, 36, 36),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(255, 224, 170),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.SunsetSereneSky,
			ColorCorrection = script.SummerCC
		},
		Normal = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Sky,
			ColorCorrection = script.NormalCC,
			Bloom = script.StandardBloom
		},
		Game3 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.1,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 17.5,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(24, 35, 24),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(41, 58, 41),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Sky,
			ColorCorrection = script.Game3CC
		},
		Military = {
			Brightness = 1.5,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.MilitarySky,
			ColorCorrection = script.MilitaryCC
		},
		Game4 = {
			Brightness = 1.5,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.MilitarySky,
			ColorCorrection = script.Game4CC
		},
		Western = {
			Brightness = 1.5,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(115, 101, 87),
			Sky = script.Sky,
			ColorCorrection = script.NormalCC
		},
		Western2 = {
			Brightness = 0.1,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.NormalCC,
			Sky = script.WesternSky,
			Bloom = script.StandardBloom
		},
		Halloween1 = {
			Brightness = 1,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 0,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(61, 61, 61),
			ColorCorrection = script.NormalCC,
			Sky = script.Sky,
			Atmosphere = script.Halloween1Atmosphere,
			Bloom = script.StandardBloom
		},
		Halloween2 = {
			Brightness = 0.1,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 20.5,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(70, 70, 70),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.NormalCC,
			Sky = script.Sky,
			Atmosphere = script.Halloween2Atmosphere,
			Bloom = script.StandardBloom
		},
		HalloweenStandardLobby = {
			Brightness = 1.5,
			EnvironmentDiffuseScale = 1,
			EnvironmentSpecularScale = 1,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 17.85,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(79, 69, 59),
			ColorCorrection = script.NormalCC,
			Sky = script.Sky,
			Atmosphere = script.Halloween3Atmosphere,
			Bloom = script.StandardBloom
		},
		Steampunk = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 9.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.NormalCC,
			Sky = script.Sky,
			Atmosphere = script.SteampunkAtmosphere,
			Bloom = script.StandardBloom
		},
		Steampunk2 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 19,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.NormalCC,
			Sky = script.Sky,
			Atmosphere = script.SteampunkAtmosphere,
			Bloom = script.StandardBloom
		},
		Lobby = {
			Brightness = 0.93,
			EnvironmentDiffuseScale = 0.76,
			EnvironmentSpecularScale = 0.44,
			GlobalShadows = true,
			ShadowSoftness = 0,
			ClockTime = 0,
			GeographicLatitude = -6.367,
			Ambient = Color3.fromRGB(65, 55, 68),
			ColorShift_Bottom = Color3.fromRGB(193, 193, 193),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(69, 53, 70),
			ColorCorrection = script.NormalCC,
			Sky = script.Sky,
			Atmosphere = script.SteampunkAtmosphere,
			Bloom = script.LobbyBloom
		},
		Christmas1 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 10,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.Christmas1CC,
			Sky = script.Sky,
			Atmosphere = script.Atmosphere
		},
		Christmas2 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.Christmas1CC,
			Sky = script.Sky,
			Atmosphere = script.Atmosphere
		},
		ChristmasEndless = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 10,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.ChristmasEndlessCC,
			Sky = script.Sky,
			Atmosphere = script.Atmosphere,
			Bloom = script.StandardBloom
		},
		Game6 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Game6.Sky,
			ColorCorrection = script.Game6.ColorCorrection,
			Atmosphere = script.Game6.Atmosphere,
			Bloom = script.StandardBloom
		},
		Game7 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 0,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Sky,
			ColorCorrection = script.NormalCC,
			Bloom = script.Game7Bloom,
			Atmosphere = script.Atmosphere
		},
		Endless7 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 10,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.Endless7,
			Sky = script.Sky,
			Atmosphere = script.Atmosphere,
			Bloom = script.StandardBloom
		},
		Greek1 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 10,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(70, 70, 70),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(163, 140, 113),
			OutdoorAmbient = Color3.fromRGB(104, 80, 80),
			ColorCorrection = script.Greek1.ColorCorrection,
			Sky = script.Greek1.Sky,
			Atmosphere = script.Greek1.Atmosphere,
			Bloom = script.Greek1.Bloom
		},
		Greek2 = {
			Brightness = 10,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 19.26,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(70, 70, 70),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(163, 140, 113),
			OutdoorAmbient = Color3.fromRGB(104, 80, 80),
			ColorCorrection = script.Greek2.ColorCorrection,
			Sky = script.Greek2.Sky,
			Atmosphere = script.Greek2.Atmosphere,
			Bloom = script.Greek2.Bloom
		},
		GreekEndless = {
			Brightness = 0,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.3,
			ClockTime = 12,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(106, 145, 163),
			OutdoorAmbient = Color3.fromRGB(101, 129, 176),
			ColorCorrection = script.GreekEndless.ColorCorrection,
			Sky = script.GreekEndless.Sky,
			Atmosphere = script.GreekEndless.Atmosphere,
			Bloom = script.GreekEndless.Bloom
		},
		Ruin = {
			Brightness = 0,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 0,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(189, 169, 122),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.Ruin.ColorCorrection,
			Sky = script.Ruin.Sky,
			Atmosphere = script.Ruin.Atmosphere,
			Bloom = script.Ruin.Bloom
		},
		RuinEndless = {
			Brightness = 1,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 0,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(189, 169, 122),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.RuinEndless.ColorCorrection,
			Sky = script.Ruin.Sky,
			Atmosphere = script.Ruin.Atmosphere,
			Bloom = script.Ruin.Bloom
		},
		TradingPlaza = {
			Brightness = 1,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 0,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(189, 169, 122),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			ColorCorrection = script.RuinEndless.ColorCorrection,
			Sky = script.Ruin.Sky,
			Atmosphere = script.Ruin.Atmosphere,
			Bloom = script.LobbyBloom
		},
		Space1 = {
			Brightness = 1.5,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 13,
			GeographicLatitude = 170,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(189, 169, 122),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Space1["Dark Blue Space Skybox"],
			ColorCorrection = script.Space1.ColorCorrection,
			Bloom = script.Space1.Bloom,
			Atmosphere = script.Space1.Atmosphere
		},
		Space2 = {
			Brightness = 1.5,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 13,
			GeographicLatitude = 170,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(189, 169, 122),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Space2["Purple Nebula"],
			ColorCorrection = script.Space2.ColorCorrection,
			Bloom = script.Space2.Bloom,
			Atmosphere = script.Space2.Atmosphere
		},
		Dojo = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 17.8,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Dojo.Sky,
			ColorCorrection = script.Dojo.ColorCorrection,
			Bloom = script.Dojo.Bloom,
			Atmosphere = script.Dojo.Atmosphere
		},
		Chipper = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 10,
			GeographicLatitude = 0,
			Ambient = Color3.fromRGB(70, 70, 70),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(163, 140, 113),
			OutdoorAmbient = Color3.fromRGB(104, 80, 80),
			ColorCorrection = script.Chipper.ColorCorrection,
			Sky = script.Chipper.Sky,
			Atmosphere = script.Chipper.Atmosphere,
			Bloom = script.Chipper.Bloom
		},
		Prehistoric1 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Prehistoric1.Sky,
			ColorCorrection = script.Prehistoric1.ColorCorrection,
			Bloom = script.Prehistoric1.Bloom,
			Atmosphere = script.Prehistoric1.Atmosphere
		},
		Prehistoric2 = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 12.5,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.Prehistoric2.Sky,
			ColorCorrection = script.Prehistoric2.ColorCorrection,
			Bloom = script.Prehistoric2.Bloom,
			Atmosphere = script.Prehistoric2.Atmosphere
		},
		PrehistoricEndless = {
			Brightness = 3,
			EnvironmentDiffuseScale = 0.345,
			EnvironmentSpecularScale = 0,
			GlobalShadows = true,
			ShadowSoftness = 0.2,
			ClockTime = 21,
			GeographicLatitude = 21,
			Ambient = Color3.fromRGB(0, 0, 0),
			ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
			ColorShift_Top = Color3.fromRGB(0, 0, 0),
			OutdoorAmbient = Color3.fromRGB(70, 70, 70),
			Sky = script.PrehistoricEndless.Sky,
			ColorCorrection = script.PrehistoricEndless.ColorCorrection,
			Bloom = script.PrehistoricEndless.Bloom,
			Atmosphere = script.PrehistoricEndless.Atmosphere
		}
	}
}
function t.Change(p1) --[[ Change | Line: 549 | Upvalues: t (copy), v1 (ref), Lighting (copy) ]]
	if not t.Presets[p1] then
		return
	end
	v1 = p1
	for k, v in pairs(t.Presets[p1]) do
		if k == "Sky" or (k == "ColorCorrection" or (k == "Atmosphere" or k == "Bloom")) then
			if k == "Atmosphere" then
				local Atmosphere = v:Clone()
				Atmosphere.Name = "Temp"
				Atmosphere.Parent = Lighting
				if Lighting:FindFirstChild("Atmosphere") then
					Lighting.Atmosphere:Destroy()
				end
				Atmosphere.Name = "Atmosphere"
				continue
			end
			if k == "Sky" then
				local Sky = v:Clone()
				Sky.Name = "Temp"
				Sky.Parent = Lighting
				if Lighting:FindFirstChild("Sky") then
					Lighting.Sky:Destroy()
				end
				Sky.Name = "Sky"
				continue
			end
			if k == "ColorCorrection" then
				local ColorCorrection = v:Clone()
				ColorCorrection.Name = "Temp2"
				ColorCorrection.Parent = Lighting
				if Lighting:FindFirstChild("ColorCorrection") then
					Lighting.ColorCorrection:Destroy()
				end
				ColorCorrection.Name = "ColorCorrection"
				continue
			end
			if k == "Bloom" then
				local Bloom = v:Clone()
				Bloom.Name = "Temp2"
				Bloom.Parent = Lighting
				if Lighting:FindFirstChild("Bloom") then
					Lighting.Bloom:Destroy()
				end
				Bloom.Name = "Bloom"
			end
			continue
		end
		Lighting[k] = v
	end
end
function t.GetCurrent() --[[ GetCurrent | Line: 593 | Upvalues: v1 (ref) ]]
	return v1
end
if Players.LocalPlayer then
	t.Change(v1)
end
return t