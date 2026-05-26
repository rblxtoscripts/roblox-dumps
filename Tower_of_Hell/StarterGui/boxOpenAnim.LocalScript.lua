-- https://lua.expert/
local TweenService = game:GetService("TweenService")
function script.Parent.play.OnInvoke(p1, p2) --[[ Line: 2 | Upvalues: TweenService (copy) ]]
	local v1 = game.ReplicatedStorage.Configuration.Effects.Boxes:FindFirstChild(p1)
	while _G.buyingBox do
		wait()
	end
	local tbl = {}
	local v2 = script.template:Clone()
	v2.boxBottom.Image = v1.iconBox.Value
	v2.boxTop.Image = v1.iconLid.Value
	local v3 = game.ReplicatedStorage.Assets.Effects:FindFirstChild(p2.name)
	if p2.type == "gear" then
		local v4 = game.ReplicatedStorage.Assets.Gear:FindFirstChild(p2.name)
		local v5 = script.ImageLabel:Clone()
		v5.Image = v4.pic.Value
		tbl = { v5 }
	elseif p2.type == "effect" or p2.type == "dupe" then
		local v6 = game.ReplicatedStorage.Assets.Effects:FindFirstChild(p2.name)
		if v6:FindFirstChild("pic") then
			local v7 = script.ImageLabel:Clone()
			v7.Image = v6.pic.Value
			tbl = { v7 }
		end
		if v6:FindFirstChild("customPic") then
			local v8 = require(v6.customPic)()
			tbl = v8
			for k, v in pairs(v8) do
				v.ImageColor3 = v.BackgroundColor3
			end
		end
	end
	for k, v in pairs(tbl) do
		v.Parent = v2.reward
	end
	v2.Parent = script.Parent
	TweenService:Create(v2, TweenInfo.new(0.8), {
		Position = UDim2.new(0.5, 0, 0.5, 0)
	}):Play()
	wait(0.75)
	TweenService:Create(v2, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0.22, 0, 0.16, 0)
	}):Play()
	wait(1.2)
	TweenService:Create(v2, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0.2, 0, 0.2, 0)
	}):Play()
	TweenService:Create(v2.boxTop, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 2, 0)
	}):Play()
	TweenService:Create(v2.boxBottom, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 2, 0)
	}):Play()
	wait(0.05)
	local v9 = TweenService:Create(v2.boxTop, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
		Position = UDim2.new(0.5, 0, -5)
	})
	v9.Completed:Connect(function() --[[ Line: 50 | Upvalues: v2 (copy) ]]
		v2.boxTop:Destroy()
		v2.boxBottom:Destroy()
	end)
	v9:Play()
	TweenService:Create(v2.boxBottom, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
		Position = UDim2.new(0.5, 0, 5)
	}):Play()
	TweenService:Create(v2.reward, TweenInfo.new(0.2), {
		Size = UDim2.new(1, 0, 1, 0)
	}):Play()
	wait(0.4)
	v2.title.Visible = true
	if p2.type == "dupe" then
		v2.yxles.Visible = true
		v2.title.TextColor3 = game.ReplicatedStorage.Configuration.Effects.Rarities:FindFirstChild(v3.rarity.Value).color.Value
		TweenService:Create(v2.yxles, TweenInfo.new(0.2), {
			TextTransparency = 0
		}):Play()
		TweenService:Create(v2.yxles.yxle, TweenInfo.new(0.2), {
			ImageTransparency = 0
		}):Play()
		v2.yxles.Text = p2.value
	elseif p2.type == "effect" then
		v2.title.Text = game.ReplicatedStorage.Configuration.Effects.Rarities:FindFirstChild(v3.rarity.Value).title.Value
		v2.title.TextColor3 = game.ReplicatedStorage.Configuration.Effects.Rarities:FindFirstChild(v3.rarity.Value).color.Value
	end
	TweenService:Create(v2.title, TweenInfo.new(0.2), {
		TextTransparency = 0
	}):Play()
	wait(1)
	local v10 = TweenService:Create(v2, TweenInfo.new(0.3), {
		Size = UDim2.new(0, 0, 0, 0)
	})
	v10.Completed:Connect(function() --[[ Line: 72 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
	v10:Play()
end