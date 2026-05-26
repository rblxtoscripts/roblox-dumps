-- https://lua.expert/
require(game.ReplicatedStorage.Sonar)
local t = {
	DullBrown = {
		P = 75,
		Strength = 75,
		Texture = "rbxassetid://15799553218",
		Color = Color3.new(),
		EyeTop = Color3.new(0.219608, 0.152941, 0.133333),
		EyeBottom = Color3.new(0.447059, 0.313725, 0.27451)
	},
	DarkBrown = {
		P = 75,
		Strength = 75,
		Texture = "rbxassetid://15799450171",
		Color = Color3.new(),
		EyeTop = Color3.new(0.0784314, 0.0352941, 0.0156863),
		EyeBottom = Color3.new(0.156863, 0.0901961, 0.0509804)
	},
	VibrantDarkBrown = {
		P = 75,
		Strength = 75,
		Texture = "rbxassetid://15799640392",
		Color = Color3.new(),
		EyeTop = Color3.new(0.12549, 0.0313725, 0),
		EyeBottom = Color3.new(0.333333, 0.121569, 0)
	},
	TanBrown = {
		P = 75,
		Strength = 75,
		Texture = "rbxassetid://15799509223",
		Color = Color3.new(),
		EyeTop = Color3.new(0.454902, 0.227451, 0.133333),
		EyeBottom = Color3.new(0.807843, 0.52549, 0.32549)
	},
	Brown = {
		P = 75,
		Strength = 75,
		Texture = "rbxassetid://16398597342",
		Color = Color3.new(),
		EyeTop = Color3.new(0.364706, 0.160784, 0.0784314),
		EyeBottom = Color3.new(0.690196, 0.341176, 0.2)
	},
	Truffle = {
		P = 50,
		Strength = 50,
		Texture = "rbxassetid://17563329942",
		Color = Color3.new(),
		EyeTop = Color3.new(0.235294, 0.0470588, 0.0352941),
		EyeBottom = Color3.new(0.792157, 0.282353, 0.215686)
	},
	RedBrown = {
		P = 50,
		Strength = 50,
		Texture = "rbxassetid://15799610891",
		Color = Color3.new(),
		EyeTop = Color3.new(0.235294, 0.0470588, 0.0352941),
		EyeBottom = Color3.new(0.792157, 0.282353, 0.215686)
	},
	Gold = {
		P = 50,
		Strength = 50,
		Texture = "rbxassetid://17563293675",
		Color = Color3.new(),
		EyeTop = Color3.new(0.235294, 0.0470588, 0.0352941),
		EyeBottom = Color3.new(0.792157, 0.282353, 0.215686)
	},
	Olive = {
		P = 50,
		Strength = 50,
		Texture = "rbxassetid://17834092106",
		Color = Color3.new(),
		EyeTop = Color3.new(0.156863, 0.133333, 0.0196078),
		EyeBottom = Color3.new(0.321569, 0.27451, 0.101961)
	},
	Hazel = {
		P = 40,
		Strength = 40,
		Texture = "rbxassetid://17833989084",
		Color = Color3.new(),
		EyeTop = Color3.new(0.427451, 0.145098, 0.0823529),
		EyeBottom = Color3.new(0.611765, 0.690196, 0.360784)
	},
	LightGray = {
		P = 35,
		Strength = 35,
		Texture = "rbxassetid://16541420146",
		Color = Color3.new(),
		EyeTop = Color3.new(0.443137, 0.435294, 0.443137),
		EyeBottom = Color3.new(0.721569, 0.721569, 0.717647)
	},
	DarkGray = {
		P = 35,
		Strength = 35,
		Texture = "rbxassetid://16541420218",
		Color = Color3.new(),
		EyeTop = Color3.new(0.168627, 0.168627, 0.168627),
		EyeBottom = Color3.new(0.313725, 0.313725, 0.317647)
	},
	OliveGreen = {
		P = 40,
		Strength = 45,
		Texture = "rbxassetid://17834069816",
		Color = Color3.new(),
		EyeTop = Color3.new(0.168627, 0.196078, 0.0901961),
		EyeBottom = Color3.new(0.470588, 0.517647, 0.313725)
	},
	DarkGreen = {
		P = 35,
		Strength = 35,
		Texture = "rbxassetid://18381881426",
		Color = Color3.new(),
		EyeTop = Color3.new(0.00784314, 0.113725, 0.00392157),
		EyeBottom = Color3.new(0.0627451, 0.513725, 0.0431373)
	},
	Green = {
		P = 25,
		Strength = 25,
		Texture = "rbxassetid://15798782610",
		Color = Color3.new(),
		EyeTop = Color3.new(0.141176, 0.427451, 0.176471),
		EyeBottom = Color3.new(0.572549, 0.937255, 0.203922)
	},
	LightGreen = {
		P = 15,
		Strength = 15,
		Texture = "rbxassetid://16541586601",
		Color = Color3.new(),
		EyeTop = Color3.new(0.592157, 0.862745, 0.317647),
		EyeBottom = Color3.new(0.843137, 1, 0.541176)
	},
	LimeGreen = {
		P = 15,
		Strength = 15,
		Texture = "rbxassetid://18381868751",
		Color = Color3.new(),
		EyeTop = Color3.new(0.439216, 0.6, 0.0901961),
		EyeBottom = Color3.new(0.839216, 1, 0.313725)
	},
	Ocean = {
		P = 20,
		Strength = 20,
		Texture = "rbxassetid://72745884892393",
		Color = Color3.new(),
		EyeTop = Color3.new(0.0156863, 0.588235, 0.494118),
		EyeBottom = Color3.new(0.458824, 1, 0.890196)
	},
	Abyss = {
		P = 10,
		Strength = 10,
		Texture = "rbxassetid://111747885076137",
		Color = Color3.new(),
		EyeTop = Color3.new(0, 0.152941, 0.152941),
		EyeBottom = Color3.new(0.180392, 0.635294, 0.737255)
	},
	GrayBlue = {
		P = 30,
		Strength = 30,
		Texture = "rbxassetid://117640780290343",
		Color = Color3.new(),
		EyeTop = Color3.new(0.152941, 0.235294, 0.360784),
		EyeBottom = Color3.new(0.403922, 0.552941, 0.745098)
	},
	Blue = {
		P = 25,
		Strength = 25,
		Texture = "rbxassetid://15798783011",
		Color = Color3.new(),
		EyeTop = Color3.new(0.152941, 0.329412, 0.592157),
		EyeBottom = Color3.new(0.427451, 0.678431, 0.752941)
	},
	CrystalBlue = {
		P = 15,
		Strength = 15,
		Texture = "rbxassetid://15854271941",
		Color = Color3.new(),
		EyeTop = Color3.new(0.321569, 0.847059, 1),
		EyeBottom = Color3.new(0.831373, 1, 1)
	},
	DarkBlue = {
		P = 15,
		Strength = 15,
		Texture = "rbxassetid://15854271812",
		Color = Color3.new(),
		EyeTop = Color3.new(0.0784314, 0.164706, 0.470588),
		EyeBottom = Color3.new(0.188235, 0.419608, 0.815686)
	},
	DeepBlue = {
		P = 10,
		Strength = 10,
		Texture = "rbxassetid://18566519096",
		Color = Color3.new(),
		EyeTop = Color3.new(0.0980392, 0.14902, 0.317647),
		EyeBottom = Color3.new(0.113725, 0.254902, 0.486275)
	},
	LightPink = {
		P = 5,
		Strength = 5,
		Texture = "rbxassetid://18381723882",
		Color = Color3.new(),
		EyeTop = Color3.new(1, 0.67451, 0.803922),
		EyeBottom = Color3.new(1, 0.921569, 0.956863)
	},
	Pink = {
		P = 5,
		Strength = 5,
		Texture = "rbxassetid://18381723882",
		Color = Color3.new(),
		EyeTop = Color3.new(1, 0.321569, 0.796078),
		EyeBottom = Color3.new(1, 0.619608, 0.886275)
	},
	Albino = {
		P = 2.5,
		Strength = 1,
		Texture = "rbxassetid://102745917939919",
		Color = Color3.new(),
		EyeTop = Color3.new(0.713725, 0.12549, 0.14902),
		EyeBottom = Color3.new(0.996078, 0.427451, 0.403922)
	},
	Magenta = {
		P = 5,
		Strength = 5,
		Texture = "rbxassetid://18381821086",
		Color = Color3.new(),
		EyeTop = Color3.new(0.478431, 0.0823529, 0.305882),
		EyeBottom = Color3.new(0.866667, 0.313725, 0.560784)
	},
	LightPurple = {
		P = 2.5,
		Strength = 2.5,
		Texture = "rbxassetid://18381724069",
		Color = Color3.new(),
		EyeTop = Color3.new(0.682353, 0.584314, 1),
		EyeBottom = Color3.new(0.835294, 0.792157, 1)
	},
	Purple = {
		P = 2.5,
		Strength = 2.5,
		Texture = "rbxassetid://18381737703",
		Color = Color3.new(),
		EyeTop = Color3.new(0.505882, 0.384314, 1),
		EyeBottom = Color3.new(0.654902, 0.596078, 1)
	},
	DarkPurple = {
		P = 2.5,
		Strength = 2.5,
		Texture = "rbxassetid://18381796575",
		Color = Color3.new(),
		EyeTop = Color3.new(0.188235, 0.101961, 0.541176),
		EyeBottom = Color3.new(0.427451, 0.388235, 1)
	},
	Sunset = {
		P = 2.5,
		Strength = 2.5,
		Texture = "rbxassetid://18381748678",
		Color = Color3.new(),
		EyeTop = Color3.new(0.231373, 0.054902, 0.686275),
		EyeBottom = Color3.new(0.709804, 0.305882, 1)
	},
	Candy = {
		P = 1.5,
		Strength = 2.5,
		Texture = "rbxassetid://18381770878",
		Color = Color3.new(),
		EyeTop = Color3.new(0.87451, 0.462745, 0.854902),
		EyeBottom = Color3.new(0.470588, 0.752941, 1)
	},
	Black = {
		P = 0.1,
		Strength = 0.1,
		Texture = "rbxassetid://17850095248",
		Color = Color3.new(),
		EyeTop = Color3.new(0/255, 0/255, 0/255),
		EyeBottom = Color3.new(0.129412, 0.129412, 0.129412)
	},
	White = {
		P = 0.25,
		Strength = 1,
		Texture = "rbxassetid://17850095408",
		Color = Color3.new(),
		EyeTop = Color3.new(0.87451, 0.835294, 0.823529),
		EyeBottom = Color3.new(255/255, 255/255, 255/255)
	},
	Yellow = {
		P = 1,
		Strength = 1,
		Texture = "rbxassetid://17850095585",
		Color = Color3.new(),
		EyeTop = Color3.new(1, 0.756863, 0.184314),
		EyeBottom = Color3.new(1, 0.819608, 0.509804)
	},
	PaleYellow = {
		P = 0.75,
		Strength = 1,
		Texture = "rbxassetid://18181082109",
		Color = Color3.new(),
		EyeTop = Color3.new(1, 0.870588, 0.145098),
		EyeBottom = Color3.new(1, 0.976471, 0.705882)
	},
	Amber = {
		P = 0.75,
		Strength = 1,
		Texture = "rbxassetid://17850095732",
		Color = Color3.new(),
		EyeTop = Color3.new(0.796078, 0.215686, 0),
		EyeBottom = Color3.new(1, 0.458824, 0.0117647)
	},
	Red = {
		P = 0.5,
		Strength = 1,
		Texture = "rbxassetid://17850095901",
		Color = Color3.new(),
		EyeTop = Color3.new(0.301961, 0, 0.054902),
		EyeBottom = Color3.new(255/255, 0/255, 0/255)
	},
	Blood = {
		P = 0.25,
		Strength = 1,
		Texture = "rbxassetid://18207851594",
		Color = Color3.new(),
		EyeTop = Color3.new(0.129412, 0, 0),
		EyeBottom = Color3.new(0.580392, 0.156863, 0.0156863)
	},
	Sun = {
		P = 0.35,
		Strength = 1,
		Texture = "rbxassetid://17850096000",
		Color = Color3.new(),
		EyeTop = Color3.new(255/255, 255/255, 0/255),
		EyeBottom = Color3.new(0.815686, 0.207843, 0.00392157)
	},
	Festive = {
		P = 0,
		Strength = 0.1,
		Texture = "rbxassetid://138660423743550",
		Color = Color3.new(),
		EyeTop = Color3.new(0.0392157, 0.45098, 0.145098),
		EyeBottom = Color3.new(0.815686, 0.00784314, 0.117647)
	},
	ToyBlue = {
		P = 0.01,
		Strength = 1,
		Texture = "rbxassetid://78020179873712",
		Color = Color3.new(),
		EyeTop = Color3.new(0, 0.537255, 0.701961),
		EyeBottom = Color3.new(0, 0.537255, 0.701961)
	},
	ToyBrown = {
		P = 0.01,
		Strength = 1,
		Texture = "rbxassetid://117475565331720",
		Color = Color3.new(),
		EyeTop = Color3.new(0.705882, 0.541176, 0.352941),
		EyeBottom = Color3.new(0.705882, 0.541176, 0.352941)
	},
	ToyPink = {
		P = 0.01,
		Strength = 0.1,
		Texture = "rbxassetid://116529733972895",
		Color = Color3.new(),
		EyeTop = Color3.new(0.964706, 0.545098, 0.537255),
		EyeBottom = Color3.new(0.964706, 0.545098, 0.537255)
	}
}
for v1, v2 in t do
	v2.Name = v1
	v2.Type = "Eyes"
end
return t