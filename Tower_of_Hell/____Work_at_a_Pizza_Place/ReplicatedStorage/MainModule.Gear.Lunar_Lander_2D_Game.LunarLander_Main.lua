-- https://lua.expert/
local function Create_PrivImpl(p1) --[[ Create_PrivImpl | Line: 1 ]]
	if type(p1) == "string" then
		return function(p12_2_2_2) --[[ Line: 5 | Upvalues: p1 (copy) ]]
			local v1_2 = if p12_2_2_2 then p12_2_2_2 else {}
			local v2 = Instance.new(p1)
			local v3 = nil
			for k2, v in pairs(v1_2) do
				if type(k2) == "string" then
					v2[k2] = v
					continue
				end
				if type(k2) == "number" then
					if type(v) ~= "userdata" then
						error("Bad entry in Create body: Numeric keys must be paired with children, got a: " .. type(v), 2)
					end
					v.Parent = v2
					continue
				end
				if type(k2) == "table" and k2.__eventname then
					if type(v) ~= "function" then
						error("Bad entry in Create body: Key `[Create.E\'" .. k2.__eventname .. "\']` must have a function value\n\t\t\t\t\t       got: " .. tostring(v), 2)
					end
					v2[k2.__eventname]:connect(v)
					continue
				end
				if k2 == Create then
					if type(v) == "function" then
						if v3 then
							error("Bad entry in Create body: Only one constructor function is allowed", 2)
						end
					else
						error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \n\t\t\t\t\t       got: " .. tostring(v), 2)
					end
					v3 = v
					continue
				end
				error("Bad entry (" .. tostring(k2) .. " => " .. tostring(v) .. ") in Create body", 2)
			end
			if v3 then
				v3(v2)
			end
			return v2
		end
	end
	error("Argument of Create must be a string", 2)
end
Create = setmetatable({}, {
	__call = function(p1, ...) --[[ __call | Line: 41 ]]
		local v1 = ...
		if type(v1) == "string" then
			return function(p12_2_2_2) --[[ Line: 5 | Upvalues: v1 (copy) ]]
				local v1_2 = if p12_2_2_2 then p12_2_2_2 else {}
				local v2 = Instance.new(v1)
				local v3 = nil
				for k2, v in pairs(v1_2) do
					if type(k2) == "string" then
						v2[k2] = v
						continue
					end
					if type(k2) == "number" then
						if type(v) ~= "userdata" then
							error("Bad entry in Create body: Numeric keys must be paired with children, got a: " .. type(v), 2)
						end
						v.Parent = v2
						continue
					end
					if type(k2) == "table" and k2.__eventname then
						if type(v) ~= "function" then
							error("Bad entry in Create body: Key `[Create.E\'" .. k2.__eventname .. "\']` must have a function value\n\t\t\t\t\t       got: " .. tostring(v), 2)
						end
						v2[k2.__eventname]:connect(v)
						continue
					end
					if k2 == Create then
						if type(v) == "function" then
							if v3 then
								error("Bad entry in Create body: Only one constructor function is allowed", 2)
							end
						else
							error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \n\t\t\t\t\t       got: " .. tostring(v), 2)
						end
						v3 = v
						continue
					end
					error("Bad entry (" .. tostring(k2) .. " => " .. tostring(v) .. ") in Create body", 2)
				end
				if v3 then
					v3(v2)
				end
				return v2
			end
		end
		error("Argument of Create must be a string", 2)
	end
})
function Create.E(p1) --[[ Line: 42 ]]
	return {
		__eventname = p1
	}
end
local t2 = {
	Model_Rock1 = {
		Name = "Rock1",
		Image = "http://www.roblox.com/asset/?id=84811980",
		{ 0.748, 0.007 },
		{ 0.902, 0.05 },
		{ 0.988, 0.183 },
		{ 0.98, 0.335 },
		{ 0.838, 0.535 },
		{ 0.52, 0.815 },
		{ 0.195, 0.978 },
		{ 0.083, 0.95 },
		{ 0.01, 0.815 },
		{ 0.058, 0.642 },
		{ 0.193, 0.453 },
		{ 0.512, 0.117 }
	},
	Model_Rock2 = {
		Name = "Rock2",
		Image = "http://www.roblox.com/asset/?id=84811991",
		{ 0.065, 0.328 },
		{ 0.215, 0.212 },
		{ 0.373, 0.077 },
		{ 0.552, 0.01 },
		{ 0.772, 0.028 },
		{ 0.92, 0.1 },
		{ 0.99, 0.215 },
		{ 0.98, 0.352 },
		{ 0.95, 0.482 },
		{ 0.848, 0.662 },
		{ 0.767, 0.833 },
		{ 0.59, 0.953 },
		{ 0.415, 0.968 },
		{ 0.297, 0.892 },
		{ 0.23, 0.83 },
		{ 0.147, 0.81 },
		{ 0.03, 0.675 },
		{ 0.015, 0.522 }
	},
	Model_Rock3 = {
		Name = "Rock3",
		Image = "http://www.roblox.com/asset/?id=84812013",
		{ 0.125, 0.265 },
		{ 0.33, 0.087 },
		{ 0.645, 0.035 },
		{ 0.873, 0.128 },
		{ 0.912, 0.175 },
		{ 0.925, 0.41 },
		{ 0.993, 0.698 },
		{ 0.988, 0.825 },
		{ 0.9, 0.925 },
		{ 0.743, 0.983 },
		{ 0.482, 0.983 },
		{ 0.203, 0.917 },
		{ 0.06, 0.815 },
		{ 0.003, 0.68 },
		{ 0.015, 0.532 },
		{ 0.06, 0.383 }
	},
	Model_Rock4 = {
		Name = "Rock4",
		Image = "http://www.roblox.com/asset/?id=84812033",
		{ 0.185, 0.25 },
		{ 0.335, 0.1 },
		{ 0.412, 0.063 },
		{ 0.555, 0.01 },
		{ 0.748, 0.03 },
		{ 0.892, 0.19 },
		{ 0.948, 0.37 },
		{ 0.927, 0.568 },
		{ 0.77, 0.823 },
		{ 0.655, 0.93 },
		{ 0.487, 0.973 },
		{ 0.265, 0.958 },
		{ 0.108, 0.838 },
		{ 0.028, 0.677 },
		{ 0.048, 0.487 }
	},
	Model_Rock5 = {
		Name = "Rock5",
		Image = "http://www.roblox.com/asset/?id=84812047",
		{ 0.517, 0.095 },
		{ 0.795, 0.328 },
		{ 0.99, 0.637 },
		{ 0.995, 0.78 },
		{ 0.95, 0.927 },
		{ 0.833, 0.97 },
		{ 0.635, 0.95 },
		{ 0.388, 0.813 },
		{ 0.185, 0.652 },
		{ 0.028, 0.417 },
		{ 0.015, 0.282 },
		{ 0.022, 0.145 },
		{ 0.09, 0.043 },
		{ 0.177, 0.003 },
		{ 0.375, 0.013 }
	}
}
local t3 = {
	Level1 = {
		{
			{ 0.0029, 0.16 },
			{ 0.1821, 0.1233 },
			{ 0.3013, 0.2256 },
			{ 0.3187, 0.3178 },
			{ 0.2529, 0.4022 },
			{ 0.0063, 0.3911 }
		},
		{
			{ 0.2512, 0.4033 },
			{ 0.2429, 0.4878 },
			{ 0.2129, 0.6089 },
			{ 0.0429, 0.4167 }
		},
		{
			{ 0.2179, 0.5922 },
			{ 0.2571, 0.7322 },
			{ 0.0921, 0.7278 }
		},
		{
			{ 0.2562, 0.7322 },
			{ 0.4479, 0.7922 },
			{ 0.3121, 0.89 }
		},
		{
			{ 0.4496, 0.7944 },
			{ 0.5938, 0.6922 },
			{ 0.5938, 0.9167 }
		},
		{
			{ 0.5879, 0.6978 },
			{ 0.6288, 0.6289 },
			{ 0.7021, 0.6144 },
			{ 0.7754, 0.7222 },
			{ 0.6754, 0.9256 }
		},
		{
			{ 0.7771, 0.7244 },
			{ 0.8812, 0.6544 },
			{ 0.8854, 0.8478 }
		},
		{
			{ 0.8554, 0.6933 },
			{ 0.8996, 0.42 },
			{ 0.9654, 0.6189 }
		},
		{
			{ 0.9046, 0.4733 },
			{ 0.7996, 0.2233 },
			{ 0.9429, 0.2989 }
		},
		{
			{ 0.8129, 0.2578 },
			{ 0.7204, 0.34 },
			{ 0.5904, 0.4 },
			{ 0.4571, 0.3422 },
			{ 0.4688, 0.2067 },
			{ 0.5554, 0.1378 },
			{ 0.6671, 0.1744 }
		},
		{
			{ 0.6679, 0.1744 },
			{ 0.8296, 0.1311 },
			{ 0.9971, 0.1789 },
			{ 0.8329, 0.2522 }
		}
	},
	Level2 = {
		{
			{ 0.0037, 0.0811 },
			{ 0.2188, 0.0478 },
			{ 0.3063, 0.0733 },
			{ 0.3362, 0.2844 }
		},
		{
			{ 0.3196, 0.2333 },
			{ 0.4404, 0.3611 },
			{ 0.2746, 0.4233 }
		},
		{
			{ 0.3854, 0.3389 },
			{ 0.5863, 0.3844 },
			{ 0.6821, 0.5011 },
			{ 0.6679, 0.6611 }
		},
		{
			{ 0.6646, 0.5944 },
			{ 0.7154, 0.7544 },
			{ 0.5737, 0.72 }
		},
		{
			{ 0.6787, 0.7111 },
			{ 0.8271, 0.7811 },
			{ 0.7279, 0.8444 }
		},
		{
			{ 0.7871, 0.7733 },
			{ 0.8388, 0.7533 },
			{ 0.8829, 0.7567 },
			{ 0.8496, 0.83 }
		},
		{
			{ 0.8529, 0.7822 },
			{ 0.8612, 0.7467 },
			{ 0.8854, 0.7389 },
			{ 0.8962, 0.7944 }
		},
		{
			{ 0.8562, 0.5856 },
			{ 0.8779, 0.76 },
			{ 0.9121, 0.4044 }
		},
		{
			{ 0.7146, 0.3378 },
			{ 0.8779, 0.3344 },
			{ 0.6004, 0.2267 }
		},
		{
			{ 0.4229, 0.1478 },
			{ 0.4846, 0.2356 },
			{ 0.6288, 0.2533 },
			{ 0.9979, 0.1456 },
			{ 0.7346, 0.0822 },
			{ 0.4537, 0.1089 }
		}
	},
	Level3 = {
		{
			{ 0.0013, 0.1028 },
			{ 0.1729, 0.1483 },
			{ 0.2046, 0.2906 },
			{ 0.1854, 0.4728 },
			{ 0.1354, 0.6194 }
		},
		{
			{ 0.1371, 0.595 },
			{ 0.1271, 0.7817 },
			{ 0.0254, 0.6572 }
		},
		{
			{ 0.1121, 0.7406 },
			{ 0.2321, 0.8683 },
			{ 0.0996, 0.9039 }
		},
		{
			{ 0.2004, 0.8639 },
			{ 0.3388, 0.785 },
			{ 0.4612, 0.8406 }
		},
		{
			{ 0.4238, 0.8361 },
			{ 0.5096, 0.8083 },
			{ 0.4813, 0.8894 }
		},
		{
			{ 0.4846, 0.8572 },
			{ 0.5246, 0.6183 },
			{ 0.5837, 0.5694 },
			{ 0.6704, 0.5683 },
			{ 0.7779, 0.6183 }
		},
		{
			{ 0.7638, 0.6317 },
			{ 0.7204, 0.3839 },
			{ 0.8512, 0.5172 }
		},
		{
			{ 0.7488, 0.4383 },
			{ 0.5837, 0.3083 },
			{ 0.7113, 0.2372 }
		},
		{
			{ 0.6496, 0.315 },
			{ 0.4562, 0.3506 },
			{ 0.5363, 0.1939 }
		},
		{
			{ 0.4113, 0.1328 },
			{ 0.4946, 0.3417 },
			{ 0.4796, 0.5394 },
			{ 0.4046, 0.6683 },
			{ 0.3196, 0.6372 },
			{ 0.2971, 0.4839 },
			{ 0.3287, 0.2939 }
		},
		{
			{ 0.4113, 0.1339 },
			{ 0.6763, 0.1794 },
			{ 0.5096, 0.3083 }
		},
		{
			{ 0.6454, 0.1917 },
			{ 0.9096, 0.1306 },
			{ 0.9979, 0.1506 },
			{ 0.8712, 0.275 }
		}
	},
	Level4 = {
		{
			{ 0.0013, 0.1028 },
			{ 0.1729, 0.1483 },
			{ 0.2046, 0.2906 },
			{ 0.1854, 0.4728 },
			{ 0.1354, 0.6194 }
		},
		{
			{ 0.1371, 0.595 },
			{ 0.1271, 0.7817 },
			{ 0.0254, 0.6572 }
		},
		{
			{ 0.1121, 0.7406 },
			{ 0.2321, 0.8683 },
			{ 0.0996, 0.9039 }
		},
		{
			{ 0.2004, 0.8639 },
			{ 0.3388, 0.785 },
			{ 0.4612, 0.8406 }
		},
		{
			{ 0.4238, 0.8361 },
			{ 0.5096, 0.8083 },
			{ 0.4813, 0.8894 }
		},
		{
			{ 0.4846, 0.8572 },
			{ 0.5246, 0.6183 },
			{ 0.5837, 0.5694 },
			{ 0.6704, 0.5683 },
			{ 0.7779, 0.6183 }
		},
		{
			{ 0.7638, 0.6317 },
			{ 0.7204, 0.3839 },
			{ 0.8512, 0.5172 }
		},
		{
			{ 0.7488, 0.4383 },
			{ 0.5837, 0.3083 },
			{ 0.7113, 0.2372 }
		},
		{
			{ 0.6496, 0.315 },
			{ 0.4562, 0.3506 },
			{ 0.5363, 0.1939 }
		},
		{
			{ 0.4113, 0.1328 },
			{ 0.4946, 0.3417 },
			{ 0.4796, 0.5394 },
			{ 0.4046, 0.6683 },
			{ 0.3196, 0.6372 },
			{ 0.2971, 0.4839 },
			{ 0.3287, 0.2939 }
		},
		{
			{ 0.4113, 0.1339 },
			{ 0.6763, 0.1794 },
			{ 0.5096, 0.3083 }
		},
		{
			{ 0.6454, 0.1917 },
			{ 0.9096, 0.1306 },
			{ 0.9979, 0.1506 },
			{ 0.8712, 0.275 }
		},
		{
			{ 0.3329, 0.7017 },
			{ 0.4071, 0.7172 },
			{ 0.4046, 0.7361 },
			{ 0.3312, 0.7183 }
		}
	},
	Level5 = {
		{
			{ 0.0021, 0.0728 },
			{ 0.1279, 0.1083 },
			{ 0.1646, 0.2228 },
			{ 0.1479, 0.3206 },
			{ 0.0862, 0.4083 }
		},
		{
			{ 0.0938, 0.3839 },
			{ 0.1238, 0.565 },
			{ 0.0179, 0.4906 }
		},
		{
			{ 0.1071, 0.5472 },
			{ 0.1729, 0.5617 },
			{ 0.2121, 0.6872 },
			{ 0.1479, 0.8317 }
		},
		{
			{ 0.1621, 0.785 },
			{ 0.1487, 0.955 },
			{ 0.0887, 0.8294 }
		},
		{
			{ 0.1354, 0.8994 },
			{ 0.1904, 0.9806 },
			{ 0.1088, 0.9739 }
		},
		{
			{ 0.1688, 0.9772 },
			{ 0.2537, 0.9106 },
			{ 0.2479, 0.9772 }
		},
		{
			{ 0.2463, 0.955 },
			{ 0.2221, 0.8706 },
			{ 0.2788, 0.6928 }
		},
		{
			{ 0.2621, 0.7583 },
			{ 0.2754, 0.615 },
			{ 0.3479, 0.5772 },
			{ 0.4279, 0.6594 }
		},
		{
			{ 0.3937, 0.6517 },
			{ 0.4663, 0.5539 },
			{ 0.5396, 0.5617 },
			{ 0.5546, 0.8606 }
		},
		{
			{ 0.5337, 0.8161 },
			{ 0.7321, 0.8383 },
			{ 0.6188, 0.9294 }
		},
		{
			{ 0.6763, 0.8517 },
			{ 0.8538, 0.7728 },
			{ 0.7763, 0.905 }
		},
		{
			{ 0.8046, 0.8106 },
			{ 0.9287, 0.635 },
			{ 0.9296, 0.8128 }
		},
		{
			{ 0.9196, 0.7006 },
			{ 0.9021, 0.5339 },
			{ 0.9596, 0.3261 },
			{ 0.9971, 0.2739 }
		},
		{
			{ 0.5879, 0.755 },
			{ 0.5871, 0.7761 },
			{ 0.7171, 0.7561 }
		},
		{
			{ 0.6388, 0.2128 },
			{ 0.7937, 0.405 },
			{ 0.8263, 0.5683 },
			{ 0.7846, 0.6628 },
			{ 0.6863, 0.7183 },
			{ 0.5863, 0.7161 },
			{ 0.5813, 0.4906 }
		},
		{
			{ 0.5804, 0.4872 },
			{ 0.6404, 0.2128 },
			{ 0.4704, 0.2128 },
			{ 0.5537, 0.3983 }
		},
		{
			{ 0.4521, 0.4028 },
			{ 0.5212, 0.2928 },
			{ 0.5537, 0.3961 }
		},
		{
			{ 0.1863, 0.345 },
			{ 0.1412, 0.4239 },
			{ 0.1554, 0.5039 },
			{ 0.2321, 0.4806 }
		},
		{
			{ 0.1821, 0.3517 },
			{ 0.2304, 0.4817 },
			{ 0.3329, 0.5083 },
			{ 0.4079, 0.475 },
			{ 0.4529, 0.4028 },
			{ 0.4713, 0.2128 },
			{ 0.2737, 0.105 }
		}
	},
	Level6 = {
		{
			{ 0.0037, 0.1228 },
			{ 0.2871, 0.1639 },
			{ 0.3821, 0.2539 },
			{ 0.3787, 0.3106 },
			{ 0.3454, 0.3928 },
			{ 0.2479, 0.4283 }
		},
		{
			{ 0.2721, 0.4083 },
			{ 0.1779, 0.5372 },
			{ 0.1821, 0.4017 }
		},
		{
			{ 0.1863, 0.4928 },
			{ 0.2037, 0.6861 },
			{ 0.0838, 0.5906 }
		},
		{
			{ 0.1812, 0.6294 },
			{ 0.2646, 0.7883 },
			{ 0.1412, 0.7539 }
		},
		{
			{ 0.2271, 0.7694 },
			{ 0.4437, 0.7206 },
			{ 0.3563, 0.8817 }
		},
		{
			{ 0.4004, 0.7517 },
			{ 0.4804, 0.6194 },
			{ 0.5496, 0.7506 }
		},
		{
			{ 0.5212, 0.7139 },
			{ 0.6054, 0.7406 },
			{ 0.5396, 0.8061 }
		},
		{
			{ 0.5687, 0.7539 },
			{ 0.6196, 0.6839 },
			{ 0.7221, 0.6817 }
		},
		{
			{ 0.6863, 0.7039 },
			{ 0.7196, 0.5661 },
			{ 0.7504, 0.6739 }
		},
		{
			{ 0.7146, 0.6094 },
			{ 0.7037, 0.4472 },
			{ 0.7763, 0.5361 }
		},
		{
			{ 0.7254, 0.485 },
			{ 0.5837, 0.4517 },
			{ 0.5521, 0.2972 },
			{ 0.6613, 0.2161 },
			{ 0.7771, 0.3228 }
		},
		{
			{ 0.6146, 0.4572 },
			{ 0.4929, 0.5039 },
			{ 0.3787, 0.4183 },
			{ 0.3979, 0.3639 }
		},
		{
			{ 0.4071, 0.2594 },
			{ 0.5504, 0.295 },
			{ 0.3996, 0.3594 }
		},
		{
			{ 0.3779, 0.4206 },
			{ 0.4921, 0.5028 },
			{ 0.4821, 0.565 }
		},
		{
			{ 0.4612, 0.5228 },
			{ 0.4804, 0.5794 },
			{ 0.4946, 0.4928 }
		},
		{
			{ 0.7588, 0.3228 },
			{ 0.9179, 0.3006 },
			{ 0.8354, 0.4006 }
		},
		{
			{ 0.8812, 0.3228 },
			{ 0.9971, 0.1894 },
			{ 0.9921, 0.3861 }
		}
	},
	Level7 = {
		{
			{ 0.0029, 0.0761 },
			{ 0.1154, 0.1117 },
			{ 0.2079, 0.215 },
			{ 0.2496, 0.3683 },
			{ 0.2296, 0.5283 }
		},
		{
			{ 0.2254, 0.5039 },
			{ 0.2371, 0.7139 },
			{ 0.1563, 0.7794 }
		},
		{
			{ 0.1821, 0.7383 },
			{ 0.1513, 0.895 },
			{ 0.0529, 0.7783 }
		},
		{
			{ 0.1354, 0.8661 },
			{ 0.3371, 0.9461 },
			{ 0.1871, 0.9661 }
		},
		{
			{ 0.3029, 0.9506 },
			{ 0.4854, 0.8161 },
			{ 0.4354, 0.9628 }
		},
		{
			{ 0.4604, 0.8672 },
			{ 0.4629, 0.6306 },
			{ 0.4954, 0.545 },
			{ 0.5863, 0.5494 }
		},
		{
			{ 0.5671, 0.5594 },
			{ 0.6062, 0.4872 },
			{ 0.6613, 0.4883 }
		},
		{
			{ 0.6563, 0.4994 },
			{ 0.6504, 0.4461 },
			{ 0.7004, 0.4761 }
		},
		{
			{ 0.6671, 0.4639 },
			{ 0.6296, 0.4639 },
			{ 0.5946, 0.3783 }
		},
		{
			{ 0.6254, 0.3883 },
			{ 0.4654, 0.4306 },
			{ 0.5279, 0.3217 }
		},
		{
			{ 0.5079, 0.4006 },
			{ 0.4254, 0.6506 },
			{ 0.2771, 0.7339 },
			{ 0.2637, 0.5328 }
		},
		{
			{ 0.4396, 0.6083 },
			{ 0.4346, 0.7828 },
			{ 0.3204, 0.8539 },
			{ 0.2321, 0.8006 },
			{ 0.2779, 0.7306 }
		},
		{
			{ 0.2637, 0.5317 },
			{ 0.2938, 0.3394 },
			{ 0.3696, 0.475 }
		},
		{
			{ 0.2863, 0.3917 },
			{ 0.2938, 0.2272 },
			{ 0.4788, 0.2661 }
		},
		{
			{ 0.4379, 0.2683 },
			{ 0.6721, 0.2339 },
			{ 0.5587, 0.3294 }
		},
		{
			{ 0.6713, 0.2328 },
			{ 0.9962, 0.2717 },
			{ 0.8104, 0.3961 }
		}
	},
	Level8 = {
		{
			{ 0.0021, 0.1139 },
			{ 0.1971, 0.1183 },
			{ 0.2712, 0.1739 },
			{ 0.2729, 0.4728 }
		},
		{
			{ 0.2671, 0.4228 },
			{ 0.3613, 0.6217 },
			{ 0.2171, 0.5772 }
		},
		{
			{ 0.3379, 0.6083 },
			{ 0.4113, 0.6106 },
			{ 0.4113, 0.7894 },
			{ 0.3654, 0.8694 }
		},
		{
			{ 0.3513, 0.8628 },
			{ 0.4946, 0.8628 },
			{ 0.4163, 0.9306 }
		},
		{
			{ 0.4338, 0.5161 },
			{ 0.4988, 0.5861 },
			{ 0.4829, 0.8739 },
			{ 0.4329, 0.7906 }
		},
		{
			{ 0.4104, 0.5739 },
			{ 0.3638, 0.5728 },
			{ 0.2954, 0.4217 },
			{ 0.2929, 0.1717 },
			{ 0.3921, 0.0872 },
			{ 0.4113, 0.4028 }
		},
		{
			{ 0.3921, 0.0861 },
			{ 0.5371, 0.0806 },
			{ 0.4696, 0.4039 },
			{ 0.4104, 0.4028 }
		},
		{
			{ 0.4871, 0.5894 },
			{ 0.5096, 0.5272 },
			{ 0.5421, 0.5839 }
		},
		{
			{ 0.5363, 0.5806 },
			{ 0.5721, 0.525 },
			{ 0.6138, 0.5861 }
		},
		{
			{ 0.5896, 0.5761 },
			{ 0.6679, 0.575 },
			{ 0.6671, 0.865 }
		},
		{
			{ 0.5329, 0.0806 },
			{ 0.6088, 0.4028 },
			{ 0.6887, 0.3983 },
			{ 0.7446, 0.1128 }
		},
		{
			{ 0.4629, 0.3872 },
			{ 0.5104, 0.4828 },
			{ 0.5437, 0.4183 }
		},
		{
			{ 0.5329, 0.4094 },
			{ 0.5704, 0.4839 },
			{ 0.6146, 0.3894 }
		},
		{
			{ 0.7462, 0.1117 },
			{ 0.7454, 0.7728 },
			{ 0.6896, 0.7694 },
			{ 0.6896, 0.3994 }
		},
		{
			{ 0.6554, 0.845 },
			{ 0.7829, 0.8461 },
			{ 0.7196, 0.925 }
		},
		{
			{ 0.7671, 0.8661 },
			{ 0.7671, 0.0828 },
			{ 0.9971, 0.0628 }
		}
	}
}
local function norm(p1, p2) --[[ norm | Line: 261 ]]
	local v1 = math.sqrt(p1 * p1 + p2 * p2)
	return p1 / v1, p2 / v1
end
local function sub(p1, p2, p3, p4) --[[ sub | Line: 265 ]]
	return p1 - p3, p2 - p4
end
local function add(p1, p2, p3, p4) --[[ add | Line: 268 ]]
	return p1 + p3, p2 + p4
end
local function len(p1, p2) --[[ len | Line: 271 ]]
	return math.sqrt(p1 * p1 + p2 * p2)
end
local function unit(p1, p2) --[[ unit | Line: 274 ]]
	local v1 = math.sqrt(p1 * p1 + p2 * p2)
	return p1 / v1, p2 / v1
end
local function dot(p1, p2, p3, p4) --[[ dot | Line: 278 ]]
	return p1 * p3 + p2 * p4
end
local function removeValue(p1, p2) --[[ removeValue | Line: 282 ]]
	for i = 1, #p1 do
		if p1[i] == p2 then
			table.remove(p1, i)
			return
		end
	end
end
local function waitForAny(...) --[[ waitForAny | Line: 291 ]]
	local v1 = Instance.new("IntValue")
	local v2 = nil
	local tbl = {}
	for k, v in pairs({ ... }) do
		tbl[k] = v:connect(function(...) --[[ Line: 297 | Upvalues: v2 (ref), v1 (copy), k (copy) ]]
			v2 = { ... }
			v1.Value = k
		end)
	end
	while v1.Value == 0 do
		v1.Changed:wait()
	end
	for k, v in pairs(tbl) do
		v:disconnect()
	end
	return v1.Value, unpack(v2)
end
function InstanceModel(p1, p2, p3, p4, p5, p6) --[[ InstanceModel | Line: 311 ]]
	local t = {
		Gui = Create("ImageLabel")({
			BackgroundTransparency = 1,
			Image = p1.Image or "",
			Position = UDim2.new(0, p2, 0, p3),
			Size = UDim2.new(0, p4, 0, p5)
		}),
		Name = p1.Name or ""
	}
	if p6 then
		local v1 = (-1 / 0)
		local v2 = (1 / 0)
		local v3 = (-1 / 0)
		local v4 = (1 / 0)
		local t2 = {}
		local function AddAxisFromSeg(p12, p22) --[[ AddAxisFromSeg | Line: 326 | Upvalues: p2 (copy), p4 (copy), p3 (copy), p5 (copy), v1 (ref), v2 (ref), v3 (ref), v4 (ref), p1 (copy), t2 (copy) ]]
			local v12 = p2 + p12[1] * p4
			local v22 = p3 + p12[2] * p5
			if v1 < v12 then
				v1 = v12
			end
			if v12 < v2 then
				v2 = v12
			end
			if v3 < v22 then
				v3 = v22
			end
			if v22 < v4 then
				v4 = v22
			end
			local t = {}
			local v5 = p2 + p22[1] * p4 - v12
			local v6 = p3 + p22[2] * p5 - v22
			local v7 = math.sqrt(v5 * v5 + v6 * v6)
			local v8 = v5 / v7
			local v9 = -(v6 / v7)
			t.DirX = v9
			t.DirY = v8
			local v10, v11, v122, v13 = (1 / 0), v9, v8, (-1 / 0)
			for i = 1, #p1 do
				local v14 = p1[i]
				local v15 = (p2 + v14[1] * p4) * v11 + (p3 + v14[2] * p5) * v122
				if v15 < v10 then
					v10 = v15
				end
				if v13 < v15 then
					v13 = v15
				end
			end
			t.Min = v10
			t.Max = v13
			t2[#t2 + 1] = t
		end
		t.Axis = t2
		for i = 1, #p1 - 1 do
			AddAxisFromSeg(p1[i], p1[i + 1])
		end
		AddAxisFromSeg(p1[#p1], p1[1])
		t.CenterX = (v2 + v1) / 2
		t.CenterY = (v4 + v3) / 2
		t.RadiusSq = ((v1 - v2) / 2) ^ 2 + ((v3 - v4) / 2) ^ 2
		t.Radius = math.sqrt(t.RadiusSq)
	end
	return t
end
function CreateLevel_FromGui(p1) --[[ CreateLevel_FromGui | Line: 392 | Upvalues: t2 (copy) ]]
	local t = {
		Terrain = {}
	}
	for k, v in pairs(p1:GetChildren()) do
		v:Destroy()
		local v1 = t2[v.Name]
		if v1 then
			local Position = v.Position
			local Size = v.Size
			local v2 = InstanceModel(v1, Position.X.Offset, Position.Y.Offset, Size.X.Offset, Size.Y.Offset, true)
			t.Terrain[#t.Terrain + 1] = v2
			v2.Gui.Parent = p1
		end
	end
	return t
end
function CreateLevel_FromData(p1) --[[ CreateLevel_FromData | Line: 410 | Upvalues: t3 (copy) ]]
	local t = {
		Terrain = {}
	}
	for k, v in pairs(t3[p1.Parent.Name]) do
		local v1 = InstanceModel(v, 0, 0, p1.Size.X.Offset, p1.Size.Y.Offset, true)
		t.Terrain[#t.Terrain + 1] = v1
		v1.Gui.Parent = p1
	end
	return t
end
local t4 = {
	{ 0, 1.5 },
	{ 1, -0.5 },
	{ 1, -1.5 },
	{ 0, -0.5 },
	{ -1, -1.5 },
	{ -1, -0.5 }
}
local t5 = {
	{ 1, 1 },
	{ -1, 1 },
	{ -1, -1 },
	{ 1, -1 }
}
function CreateBody(p1, p2) --[[ CreateBody | Line: 433 ]]
	local t = {}
	local t2 = {
		X = 0,
		Y = 0,
		VX = 0,
		VY = 0,
		Radius = 0,
		Rotation = 0,
		Restitution = 1,
		NumPoints = #p1
	}
	for k, v in pairs(p1) do
		t[k] = { v[1] * p2, v[2] * p2 }
		local v2 = math.sqrt(t[k][1] ^ 2 + t[k][2] ^ 2)
		if t2.Radius < v2 then
			t2.Radius = v2
		end
	end
	local v3 = t
	t2.RadiusSq = t2.Radius * t2.Radius
	function t2.GetPoints(p1) --[[ GetPoints | Line: 454 | Upvalues: v3 (ref), t2 (copy) ]]
		local t = {}
		for k, v in pairs(v3) do
			local v1 = math.sin(t2.Rotation)
			local v2 = math.cos(t2.Rotation)
			t[k] = { t2.X + v[1] * v2 - v[2] * v1, t2.Y + v[2] * v2 + v[1] * v1 }
		end
		return t
	end
	return t2
end
function CreateLine(p1, p2) --[[ CreateLine | Line: 470 ]]
	local t = {}
	local t2 = {}
	function t.Show(p12, p22, p3, p4, p5) --[[ Show | Line: 475 | Upvalues: t2 (copy), p1 (copy), p2 (copy) ]]
		local v1 = p4 - p22
		local v2 = p5 - p3
		local v3 = math.sqrt(v1 * v1 + v2 * v2)
		local count = 0
		local v4 = v1 / v3
		local v5 = v2 / v3
		for i = 0, math.sqrt(v1 * v1 + v2 * v2) do
			local v6
			count = count + 1
			if t2[count] then
				v6 = t2[count]
			else
				local v7 = Create("Frame")({
					Parent = p1,
					BorderSizePixel = 0,
					BackgroundColor3 = p2,
					Size = UDim2.new(0, 3, 0, 3),
					BackgroundTransparency = 0.7,
					Create("Frame")({
						BorderSizePixel = 0,
						BackgroundColor3 = p2,
						Size = UDim2.new(0, 1, 0, 1),
						Position = UDim2.new(0, 1, 0, 1)
					})
				})
				t2[count] = v7
				v6 = v7
			end
			v6.Position = UDim2.new(0, p22 + v4 * i, 0, p3 + v5 * i)
		end
		for j = count + 1, #t2 do
			t2[j]:Destroy()
			t2[j] = nil
		end
	end
	function t.Hide(p1) --[[ Hide | Line: 511 | Upvalues: t2 (copy) ]]
		for i = 1, #t2 do
			t2[i]:Destroy()
			t2[i] = nil
		end
	end
	return t
end
function CreateBodyView(p1, p2, p3) --[[ CreateBodyView | Line: 521 ]]
	local t = {}
	local t2 = {}
	for i = 1, p1.NumPoints do
		t[i] = CreateLine(p2, p3)
	end
	function t2.Show(p12) --[[ Show | Line: 529 | Upvalues: p1 (copy), t (copy) ]]
		local v1 = p1:GetPoints()
		for i = 1, #v1 - 1 do
			local v2 = v1[i]
			local v3 = v1[i + 1]
			t[i]:Show(v2[1], v2[2], v3[1], v3[2])
		end
		local v4 = v1[#v1]
		local v5 = v1[1]
		t[#t]:Show(v4[1], v4[2], v5[1], v5[2])
	end
	function t2.Hide(p1) --[[ Hide | Line: 538 | Upvalues: t (copy) ]]
		for i = 1, #t do
			t[i]:Hide()
		end
	end
	return t2
end
function CollidePointWithLevel(p1, p2, p3, p4) --[[ CollidePointWithLevel | Line: 549 ]]
	local t = {}
	local t2 = {}
	for k, v in pairs(p1.Terrain) do
		if not p4 or p4[v] then
			local v1 = p2 - v.CenterX
			local v2 = p3 - v.CenterY
			if v1 * v1 + v2 * v2 < v.RadiusSq then
				local v3 = (1 / 0)
				local v4 = nil
				local v5 = 1
				for k2, v6 in pairs(v.Axis) do
					local v62 = p2 * v6.DirX + p3 * v6.DirY
					if v62 < v6.Min or v6.Max < v62 then
						v3 = 0
						v4 = v6
						continue
					end
					local v7 = v6.Max - v62
					local v8 = v62 - v6.Min
					if math.min(v7, v8) < v3 then
						if v7 < v8 then
							v3 = v7
							v4 = v6
							v5 = 1
							continue
						end
						v3 = v8
						v4 = v6
						v5 = -1
					end
				end
				if v3 > 0 then
					local v9 = #t + 1
					t[v9] = v4
					t2[v9] = v3 * v5
				end
			end
		end
	end
	if not (#t > 0) then
		return nil
	end
	local sum = 0
	local sum_2 = 0
	for i = 1, #t do
		local v10 = t[i]
		local v11 = t2[i]
		sum = sum + v10.DirX * v11
		sum_2 = sum_2 + v10.DirY * v11
	end
	return sum, sum_2
end
function CollideBodyWithLevel(p1, p2) --[[ CollideBodyWithLevel | Line: 610 ]]
	local t = {}
	for k, v in pairs(p1.Terrain) do
		local v1 = v.CenterX - p2.X
		local v2 = v.CenterY - p2.Y
		if v1 * v1 + v2 * v2 < (v.Radius + p2.Radius) ^ 2 then
			t[v] = true
		end
	end
	if not next(t) then
		return nil
	end
	local sum = 0
	local sum_2 = 0
	local v4 = false
	for k, v in pairs((p2:GetPoints())) do
		local v5, v6 = CollidePointWithLevel(p1, v[1] + sum, v[2] + sum_2)
		if v5 then
			sum = sum + v5
			sum_2 = sum_2 + v6
			v4 = true
		end
	end
	if v4 then
		return sum, sum_2
	else
		return nil
	end
end
function PlayLevel(p1, p2, p3, p4, p5) --[[ PlayLevel | Line: 646 | Upvalues: t4 (copy), t5 (copy), removeValue (copy), unit (copy) ]]
	local v1 = p4:Clone()
	v1.Parent = p4.Parent
	local v2 = CreateBody(t4, 7)
	v2.X = p2.Parent.StartAt.Value.x
	v2.Y = p2.Parent.StartAt.Value.y
	v2.Restitution = 0.1
	v2.Rotation = math.pi
	local v3 = CreateBodyView(v2, p2, Color3.new(0/255, 255/255, 0/255))
	local v4 = CreateBody(t5, 6)
	v4.X = p2.Parent.CrateAt.Value.x
	v4.Y = p2.Parent.CrateAt.Value.y
	v4.Restitution = 0.2
	local v5 = CreateBodyView(v4, p2, Color3.new(153/255, 153/255, 153/255))
	local tbl = { v2, v4 }
	local tbl2 = { v3, v5 }
	local tbl3 = {}
	local function addJetParticle(p1) --[[ addJetParticle | Line: 666 | Upvalues: v2 (copy), p2 (copy), tbl3 (copy) ]]
		local t = {}
		if p1 then
			local v1 = math.random() * math.pi * 2
			local v22 = p1.X + (math.random() - 0.5) * 5
			local v3 = p1.Y + (math.random() - 0.5) * 5
			t.X = v22
			t.Y = v3
			local v4 = p1.VX + math.cos(v1) * 30
			local v5 = p1.VY + math.sin(v1) * 30
			t.VX = v4
			t.VY = v5
		else
			t.X = v2.X + math.sin(v2.Rotation) * 7
			t.Y = v2.Y - math.cos(v2.Rotation) * 7
			local v6 = 0.6 * (math.random() - 0.5) ^ 2
			local v7 = v2.Rotation + v6
			local v8 = 50 + math.random() * 5
			t.VX = math.sin(v7) * v8 + v2.VX
			t.VY = -math.cos(v7) * v8 + v2.VY
			local VX = t.VX
			local VY = t.VY
			local v9 = math.sqrt(VX * VX + VY * VY)
			local v11 = t.VY - VY / v9 * 10 * v6
			t.VX = t.VX - VX / v9 * 10 * v6
			t.VY = v11
		end
		t.Timestamp = tick()
		t.Gui = Create("Frame")({
			BorderSizePixel = 0,
			Parent = p2,
			Position = UDim2.new(0, t.X - 2, 0, t.Y - 2),
			Size = UDim2.new(0, 3, 0, 3),
			BackgroundColor3 = Color3.new(1, math.random(), 0)
		})
		tbl3[#tbl3 + 1] = t
		return t
	end
	local v6 = false
	local v7 = false
	local v8 = CreateLine(p2, Color3.new(255/255, 255/255, 255/255))
	local v9 = "play"
	local v10 = 0
	local v11 = ""
	function v2.Touched(p1, p2) --[[ Line: 710 | Upvalues: v2 (copy), v9 (ref), v10 (ref), v11 (ref), removeValue (ref), tbl (copy), tbl2 (copy), v3 (copy), v8 (copy), v6 (ref), p5 (copy), addJetParticle (copy) ]]
		local v1 = -math.sin(v2.Rotation)
		local v32 = math.acos(p1 * v1 + p2 * math.cos(v2.Rotation))
		local VX = v2.VX
		local VY = v2.VY
		local v4 = math.sqrt(VX * VX + VY * VY)
		if v32 > 0.7853981633974483 and v4 > 35 then
		elseif not (v4 > 60) then
			return
		end
		v9 = "loss"
		v10 = tick()
		v11 = if v4 > 60 then "Hey man, easy on the gas!" elseif v32 < 0.7853981633974483 and p2 < -0.5 then "Bit rough on the landing there, don\'t you think?" else "Oops! Mind the rocks."
		removeValue(tbl, v2)
		removeValue(tbl2, v3)
		v3:Hide()
		v8:Hide()
		v6 = false
		p5:Play()
		for i = 1, 20 do
			addJetParticle(v2)
		end
	end
	function v4.Touched(p1, p2) --[[ Line: 740 | Upvalues: v6 (ref), v4 (copy), v9 (ref), v10 (ref), v11 (ref), removeValue (ref), tbl (copy), tbl2 (copy), v5 (copy), v8 (copy), p5 (copy), addJetParticle (copy) ]]
		if not v6 then
			return
		end
		local VX = v4.VX
		local VY = v4.VY
		if not (math.sqrt(VX * VX + VY * VY) > 15) then
			return
		end
		v9 = "loss"
		v10 = tick()
		v11 = "That\'s expensive equipment you\'re hauling, careful with it!"
		removeValue(tbl, v4)
		removeValue(tbl2, v5)
		v5:Hide()
		v8:Hide()
		v6 = false
		p5:Play()
		for i = 1, 20 do
			addJetParticle(v4)
		end
	end
	local v12 = tick()
	local v13 = false
	while v9 == "play" or v9 == "loss" and tick() - v10 < 1.6 do
		wait()
		local v14 = tick()
		local v15 = v14 - v12
		if v9 == "play" then
			if p3.a then
				v2.Rotation = v2.Rotation - v15 * 2
			end
			local s = p3.s
			if p3.d then
				v2.Rotation = v2.Rotation + v15 * 2
			end
			if p3.w then
				local v16 = -math.sin(v2.Rotation)
				local v17 = math.cos(v2.Rotation)
				v2.VX = v2.VX + v15 * v16 * 70
				v2.VY = v2.VY + v15 * v17 * 70
				addJetParticle()
				addJetParticle()
				if not v13 then
					v13 = true
					p4:Play()
					Delay(0.5, function() --[[ Line: 796 | Upvalues: v13 (ref), v1 (copy) ]]
						if not v13 then
							return
						end
						v1:Play()
					end)
				end
				v12 = v14
			elseif v13 then
				p4:Stop()
				v1:Stop()
				v13 = false
				v12 = v14
			else
				v12 = v14
			end
		else
			p4:Stop()
			v1:Stop()
			v12 = v14
		end
		for k, v in pairs(tbl) do
			v.VY = v.VY + v15 * 20
			v.X = v.X + v.VX * v15
			v.Y = v.Y + v.VY * v15
			local v18, v19 = CollideBodyWithLevel(p1, v)
			if v18 then
				if v.Touched then
					v.Touched(unit(v18, v19))
				end
				v.X = v.X + v18
				v.Y = v.Y + v19
				if v.VX * v18 + v.VY * v19 < 0 then
					local v20 = math.sqrt(v18 * v18 + v19 * v19)
					local v21 = v18 / v20
					local v22 = v19 / v20
					local v23 = v21 * v.VX + v22 * v.VY
					v.VX = v.VX - (1 + v.Restitution) * v21 * v23
					v.VY = v.VY - (1 + v.Restitution) * v22 * v23
					local v24 = -v22
					local v25 = v24 * v.VX + v21 * v.VY
					if v25 > 1 then
						v.VX = v.VX - 0.5 * v24 * v25
						v.VY = v.VY - 0.5 * v21 * v25
						continue
					end
					v.VX = v.VX - 1 * v24 * v25
					v.VY = v.VY - 1 * v21 * v25
				end
			end
		end
		if v9 == "play" and v6 then
			if v7 then
				local v26 = v4.X - v2.X
				local v27 = v4.Y - v2.Y
				local v28 = math.sqrt(v26 * v26 + v27 * v27)
				local v29 = v26 / v28
				local v30 = v27 / v28
				local v31 = math.sqrt(v26 * v26 + v27 * v27) - 40
				v4.X = v2.X + v29 * 40
				v4.Y = v2.Y + v30 * 40
				v2.VX = v2.VX + v31 * v29 * v15 * 10
				v2.VY = v2.VY + v31 * v30 * v15 * 10
				v4.VX = v4.VX - v31 * v29 * v15 * 22
				v4.VY = v4.VY - v31 * v30 * v15 * 22
			else
				local v32 = v2.X - v4.X
				local v33 = v2.Y - v4.Y
				if math.sqrt(v32 * v32 + v33 * v33) > 40 then
					v7 = true
				end
			end
		elseif v9 == "play" then
			local v34 = v2.X - v4.X
			local v35 = v2.Y - v4.Y
			if math.sqrt(v34 * v34 + v35 * v35) < 40 then
				local VX = v2.VX
				local VY = v2.VY
				if math.sqrt(VX * VX + VY * VY) < 5 then
					local VX_2 = v4.VX
					local VY_2 = v4.VY
					if math.sqrt(VX_2 * VX_2 + VY_2 * VY_2) < 5 then
						v6 = true
					end
				end
			end
		end
		if v6 and v2.Y < 0 then
			v9 = "win"
			v11 = "Well done, you saved the equipment!"
		end
		local Size = p2.Parent.Size
		local Size_2 = p2.Size
		p2.Position = UDim2.new(0, Size.X.Offset / 2 - v2.X, 0, Size.Y.Offset / 2 - v2.Y)
		if v9 == "play" and v6 then
			v8:Show(v2.X, v2.Y, v4.X, v4.Y)
		elseif v9 == "play" then
			v8:Hide()
		end
		for k, v in pairs(tbl2) do
			v:Show()
		end
		local tbl4 = {}
		for k, v in pairs(tbl3) do
			local v37 = v.Y + v.VY * v15
			v.X = v.X + v.VX * v15
			v.Y = v37
			local v38, v39 = CollidePointWithLevel(p1, v.X, v.Y)
			local v40 = tick() - v.Timestamp
			if v40 > 1.2 then
				tbl4[#tbl4 + 1] = v
			end
			v.Gui.Position = UDim2.new(0, v.X - 1, 0, v.Y - 1)
			v.Gui.BackgroundTransparency = math.min(1, v40 / 1.2) ^ 2
			if v38 then
				local v42 = v.Y + v39
				v.X = v.X + v38
				v.Y = v42
				if v.VX * v38 + v.VY * v39 < 0 then
					local v43 = math.sqrt(v38 * v38 + v39 * v39)
					local v44 = v38 / v43
					local v45 = v39 / v43
					local v46 = v44 * v.VX + v45 * v.VY
					v.VX = v.VX - 1.2 * v44 * v46
					v.VY = v.VY - 1.2 * v45 * v46
				end
			end
		end
		for k, v in pairs(tbl4) do
			removeValue(tbl3, v)
			v.Gui:Destroy()
		end
	end
	p4:Stop()
	v1:Destroy()
	return v9, v11
end
local v1 = script.Parent
local v2 = nil
local v3 = nil
local v4 = nil
local v5 = nil
v1.Equipped:connect(function(p1) --[[ Line: 964 | Upvalues: v3 (ref), v1 (copy), v4 (ref), v5 (ref), v2 (ref), waitForAny (copy) ]]
	v3 = game.Players:GetPlayerFromCharacter(v1.Parent)
	local t = {}
	v4 = v1.RocketSound:Clone()
	v4.Parent = game.Workspace.CurrentCamera
	v5 = v1.ExplodeSound:Clone()
	v5.Parent = game.Workspace.CurrentCamera
	v3.Character.Humanoid.WalkSpeed = 0
	p1.KeyDown:connect(function(p1) --[[ Line: 975 | Upvalues: t (copy) ]]
		t[p1] = true
	end)
	p1.KeyUp:connect(function(p1) --[[ Line: 978 | Upvalues: t (copy) ]]
		t[p1] = nil
	end)
	v2 = v1.Gui:Clone()
	v2.Parent = v3.PlayerGui
	v2.MainContainer.Visible = true
	local function v12(p1) --[[ DoLevel | Line: 986 | Upvalues: v2 (ref), t (copy), v4 (ref), v5 (ref), waitForAny (ref), v12 (copy), v1 (ref) ]]
		v2.MainContainer.Visible = false
		local v13 = p1:Clone()
		v13.Parent = v2
		v13.Visible = true
		local v3, v42 = PlayLevel(CreateLevel_FromData(v13.Level), v13.Level, t, v4, v5)
		local v52 = v2.WinLossMessage:Clone()
		v52.Visible = true
		v52.Parent = v13
		v52.TitleLabel.Text = v42
		v52.TitleLabel.TitleLabel.Text = v42
		if v3 == "win" then
			if p1.NextLevel.Value == "" then
				v52.TitleLabel.Text = "You beat the game!"
				v52.TitleLabel.TitleLabel.Text = "You beat the game!"
				v52.Button1.Button.Text = "Exit"
				v52.Button1.Button.Button.Text = "Exit"
				v52.Button1.Position = UDim2.new(0.5, -60, 0, 80)
				v52.Button2.Visible = false
				v52.Button1.MouseButton1Down:wait()
				v13:Destroy()
				v2.MainContainer.Visible = true
				return
			end
			v52.Button1.Button.Text = "Next Level"
			v52.Button1.Button.Button.Text = "Next Level"
			v52.Button2.Button.Text = "Exit"
			v52.Button2.Button.Button.Text = "Exit"
			local v6 = waitForAny(v52.Button1.Button.MouseButton1Down, v52.Button2.Button.MouseButton1Down)
			v13:Destroy()
			if v6 == 1 then
				return v12(v1.Levels:FindFirstChild(p1.NextLevel.Value))
			end
			if v6 == 2 then
				v2.MainContainer.Visible = true
			end
		else
			v52.Button1.Button.Text = "Retry"
			v52.Button1.Button.Button.Text = "Retry"
			v52.Button2.Button.Text = "Exit"
			v52.Button2.Button.Button.Text = "Exit"
			local v7 = waitForAny(v52.Button1.Button.MouseButton1Down, v52.Button2.Button.MouseButton1Down)
			v13:Destroy()
			if v7 == 1 then
				return v12(p1)
			end
			if v7 == 2 then
				v2.MainContainer.Visible = true
			end
		end
	end
	for k, v in pairs(v2.MainContainer:GetChildren()) do
		local v22 = v1.Levels:FindFirstChild(v.Name)
		if v22 then
			v.Button.MouseButton1Down:connect(function() --[[ Line: 1049 | Upvalues: v12 (copy), v22 (copy) ]]
				v12(v22)
			end)
		end
	end
end)
v1.Unequipped:connect(function() --[[ Line: 1056 | Upvalues: v3 (ref), v2 (ref), v4 (ref), v5 (ref) ]]
	if v3 then
		v3.Character.Humanoid.WalkSpeed = game.StarterPlayer.CharacterWalkSpeed
	end
	if v2 then
		v2:Destroy()
		v2 = nil
	end
	if not v4 then
		return
	end
	v5:Destroy()
	v5 = nil
	v4:Destroy()
	v4 = nil
end)