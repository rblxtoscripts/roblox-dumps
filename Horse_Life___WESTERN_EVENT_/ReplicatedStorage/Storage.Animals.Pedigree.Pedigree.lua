-- https://lua.expert/
local tbl = {
	Double = {
		UIGradient = "Doubles"
	},
	Alternate = {
		UIGradient = "Alternate"
	},
	Counting = {
		UIGradient = "Counting"
	},
	ReverseCounting = {
		UIGradient = "ReverseCounting"
	},
	Special1 = {
		UIGradient = "Special1"
	},
	Special2 = {
		UIGradient = "Special2"
	},
	Special3 = {
		UIGradient = "Special3"
	},
	Special4 = {
		UIGradient = "Special4"
	},
	Special5 = {
		UIGradient = "Special5"
	}
}
local tbl2 = {
	Tiers = {
		Tier5 = {
			Amount = NumberRange.new(5, 10)
		},
		Tier6 = {
			Amount = NumberRange.new(10, 50)
		},
		Tier7 = {
			Amount = NumberRange.new(50, 100)
		},
		Tier8 = {
			Amount = NumberRange.new(100, 250)
		},
		Tier9 = {
			Amount = NumberRange.new(250, 500)
		},
		Tier10 = {
			HideNumber = true,
			Amount = NumberRange.new(500, 750)
		},
		Tier11 = {
			HideNumber = true,
			Amount = NumberRange.new(750, 1500)
		},
		Tier12 = {
			HideNumber = true,
			Amount = NumberRange.new(1500, 100000)
		}
	},
	Special = {
		[1] = {},
		[2] = {},
		[3] = {},
		[4] = {},
		[1122] = tbl.Double,
		[2233] = tbl.Double,
		[3344] = tbl.Double,
		[4455] = tbl.Double,
		[5566] = tbl.Double,
		[6677] = tbl.Double,
		[7788] = tbl.Double,
		[8899] = tbl.Double,
		[1212] = tbl.Alternate,
		[2323] = tbl.Alternate,
		[3434] = tbl.Alternate,
		[4545] = tbl.Alternate,
		[5656] = tbl.Alternate,
		[6767] = tbl.Alternate,
		[7878] = tbl.Alternate,
		[123] = tbl.Counting,
		[1234] = tbl.Counting,
		[456] = tbl.Counting,
		[4567] = tbl.Counting,
		[789] = tbl.Counting,
		[321] = tbl.ReverseCounting,
		[4321] = tbl.ReverseCounting,
		[654] = tbl.ReverseCounting,
		[6543] = tbl.ReverseCounting,
		[7654] = tbl.ReverseCounting,
		[987] = tbl.ReverseCounting,
		[9876] = tbl.ReverseCounting,
		[11] = tbl.Special1,
		[111] = tbl.Special1,
		[1111] = tbl.Special1,
		[11111] = tbl.Special1,
		[22] = tbl.Special2,
		[222] = tbl.Special2,
		[2222] = tbl.Special2,
		[22222] = tbl.Special2,
		[33] = tbl.Special3,
		[333] = tbl.Special3,
		[3333] = tbl.Special3,
		[33333] = tbl.Special3,
		[44] = tbl.Special4,
		[444] = tbl.Special4,
		[4444] = tbl.Special4,
		[44444] = tbl.Special4,
		[55] = tbl.Special5,
		[555] = tbl.Special5,
		[5555] = tbl.Special5,
		[55555] = tbl.Special5,
		[66] = tbl.Special6,
		[666] = tbl.Special6,
		[6666] = tbl.Special6,
		[66666] = tbl.Special6,
		[77] = tbl.Special7,
		[777] = tbl.Special7,
		[7777] = tbl.Special7,
		[77777] = tbl.Special7,
		[88] = tbl.Special8,
		[888] = tbl.Special8,
		[8888] = tbl.Special8,
		[88888] = tbl.Special8,
		[99] = tbl.Special9,
		[999] = tbl.Special9,
		[9999] = tbl.Special9,
		[99999] = tbl.Special9
	}
}
for k, v in pairs(tbl) do
	v.UIGradient = v.UIGradient and script.Parent.UIGradients:FindFirstChild(v.UIGradient)
end
for k, v in pairs(tbl2) do
	for k2, v2 in pairs(v) do
		v2.Name = k2
		v2.Image = v2.Image
		v2.UIGradient = v2.UIGradient or script.Parent.UIGradients:FindFirstChild(k2) or script.Parent.UIGradients.Default
		v2.StrokeColor = v2.StrokeColor or Color3.fromRGB(0, 0, 0)
	end
end
return {
	Pedigrees = tbl2,
	TiersInOrder = (function() --[[ getSortedTiersByAmount | Line: 160 | Upvalues: tbl2 (copy) ]]
		local tbl = {}
		for k, v in pairs(tbl2.Tiers) do
			local v1, v2
			local Amount = v.Amount
			v1 = if type(v.Amount) == "number" and Amount then Amount else Amount.Min
			v2 = if type(v.Amount) == "number" and Amount then Amount else Amount.Max
			table.insert(tbl, {
				Name = k,
				Start = v1,
				End = v2
			})
		end
		table.sort(tbl, function(p1, p2) --[[ Line: 175 ]]
			return p1.Start < p2.Start
		end)
		local t = {}
		for k, v in pairs(tbl) do
			t[k] = tbl2.Tiers[v.Name]
		end
		return t
	end)()
}