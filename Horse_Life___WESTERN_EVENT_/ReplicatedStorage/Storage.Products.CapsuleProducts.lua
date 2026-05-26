-- https://lua.expert/
local t = {
	{
		ProductId = 3588742465,
		ProductName = "Product7",
		BackgroundColor = Color3.fromRGB(255, 213, 0),
		Drops = {
			{
				Name = "ArtisanCapsule",
				P = 50
			}
		}
	},
	{
		ProductId = 3368174622,
		ProductName = "Product1",
		Drops = {
			{
				Name = "DevHorseCapsule",
				P = 25
			},
			{
				Name = "HippocampusCapsule",
				P = 50
			},
			{
				Name = "AnticornCapsule",
				P = 50
			},
			{
				Name = "CybredCapsule",
				P = 50
			},
			{
				Name = "CelestialCapsule",
				P = 50
			}
		}
	},
	{
		ProductId = 3592877640,
		ProductName = "Product2",
		Drops = {
			{
				Name = "SaurequineCapsule",
				P = 50
			},
			{
				Name = "KirinCapsule",
				P = 50
			},
			{
				Name = "FelorseCapsule",
				P = 50
			},
			{
				Name = "SeraphCapsule",
				P = 50
			},
			{
				Name = "NephyrianCapsule",
				P = 50
			}
		}
	},
	{
		ProductId = 3368173483,
		ProductName = "Product3",
		Drops = {
			{
				Name = "FloraCapsule",
				P = 50
			},
			{
				Name = "PlushCapsule",
				P = 50
			},
			{
				Name = "CactalineCapsule",
				P = 50
			},
			{
				Name = "PlushCapsule",
				P = 50
			}
		}
	},
	{
		ProductId = 3592877381,
		ProductName = "Product4",
		Drops = {
			{
				Name = "ClydesdaleCapsule",
				P = 50
			},
			{
				Name = "FriesianCapsule",
				P = 50
			},
			{
				Name = "CaniquineCapsule",
				P = 50
			}
		}
	},
	{
		ProductId = 3592877069,
		ProductName = "Product5",
		Drops = {
			{
				Name = "BisorseCapsule",
				P = 50
			},
			{
				Name = "AkhalTekeCapsule",
				P = 50
			}
		}
	},
	{
		ProductId = 3368174278,
		ProductName = "Product6",
		Drops = {
			{
				Name = "EquusCapsule",
				P = 50
			}
		}
	}
}
for v1, v2 in t do
	v2.ProductType = "CapsuleProducts"
end
return t