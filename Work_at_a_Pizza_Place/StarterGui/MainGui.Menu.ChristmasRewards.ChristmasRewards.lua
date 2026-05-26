-- https://lua.expert/
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v3 = Library:Load("Utility")
Library:Load("Events")
local v4 = Library:Load("SoundFX")
local v5 = Library:Load("Network")
local AssetLibraryManager = require(game.ReplicatedStorage:WaitForChild("AssetLibraryManager"))
local v6 = GuiManager:RegisterWindow(script.Parent, "Left", "Right", 0.8, Enum.EasingStyle.Quad, true)
v6.UseCursor = true
if Debug.Enabled and Debug.ChristmasRewardStartDay == 0 then
	_G.ChristmasRewardClaimed = true
	return
end
if v2.IsPartyServer then
	return
end
local Collection = v1:WaitForChild("Collection")
local UIGridLayout = Collection:WaitForChild("UIGridLayout")
local Template = v1:WaitForChild("Template")
local Countdown = v1:WaitForChild("Countdown")
v1:WaitForChild("OpeningDay"):WaitForChild("DateAndTime")
local v7 = v3:SendData("GetChristmasRewardData", "PlayerChannel", 5) or v3:SendData("GetChristmasRewardData", "PlayerChannel", 5)
local v8 = Debug.Enabled and Debug.ChristmasRewardStartDay or os.date("*t").day
local v9 = if Debug.Enabled then 12 else os.date("*t").month
local t = {}
local v10 = false
Template.Visible = false
_G.ChristmasRewardClaimed = false
function IsChristmasTime() --[[ IsChristmasTime | Line: 56 | Upvalues: v9 (copy), v8 (copy) ]]
	return if v9 == 12 and v8 <= 25 then v8 >= 1 else false
end
if not v2.IsStudio and (game.ReplicatedStorage.GlobalData.Holiday.Value ~= "Christmas" or not IsChristmasTime()) then
	_G.ChristmasRewardClaimed = true
	return
end
local v11 = if v2.ChristmasRewards[v8] < 1000 then true else false
local v12 = 0
function ButtonClicked(p1, p2, p3) --[[ ButtonClicked | Line: 89 | Upvalues: v12 (ref), v2 (copy), v3 (copy), v7 (copy), v4 (copy), v10 (ref), v8 (copy), v6 (copy), v11 (copy), GuiManager (copy) ]]
	v12 = p1
	local v1 = if v2.ChristmasRewards[p1] < 1000 then true else false
	if p3 then
		local v22 = false
		v3:SendData("PromptBuyChristmasPresent", "PlayerChannel", nil, p1)
		workspace.Main.ProductPurchaseComplete.OnClientEvent:connect(function(p1) --[[ Line: 103 | Upvalues: v22 (ref) ]]
			if p1 ~= "ChristmasPresentProduct" then
				return
			end
			v22 = true
		end)
		while p1 == p1 and not v22 do
			wait(0.5)
		end
	end
	v7[p1] = true
	local Checkmark = p2.Checkmark
	v4:PlaySound("ChristmasReward")
	game:GetService("TweenService"):Create(p2, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		ImageColor3 = Color3.fromRGB(204, 0, 0)
	}):Play()
	game:GetService("TweenService"):Create(p2.Button, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		ImageColor3 = Color3.fromRGB(204, 0, 0)
	}):Play()
	game:GetService("TweenService"):Create(p2.Button, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 60, 1, 60)
	}):Play()
	wait(0.1)
	game:GetService("TweenService"):Create(p2.Button, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 1, 0)
	}):Play()
	wait(0.2)
	p2.Button.Visible = false
	v10 = false
	if v1 then
		local v32 = false
		local v42 = _G.CoinAnimation(v2.ChristmasRewards[v8], p2.Moneyz.Icon.AbsolutePosition)
		v42.Event:connect(function(p1, p22) --[[ Line: 140 | Upvalues: p2 (copy), v2 (ref), v32 (ref), v42 (copy), Checkmark (copy) ]]
			if p1 == "CoinSpawned" then
				p2.Moneyz.MoneyzCount.Text = v2.FormatNumber("Int", p22, p2.Moneyz.MoneyzCount)
				return
			end
			if p1 ~= "Finished" then
				return
			end
			p2.Moneyz.MoneyzCount.Text = v2.FormatNumber("Int", 0, p2.Moneyz.MoneyzCount)
			v32 = true
			v42:Destroy()
			Checkmark.Visible = true
			p2.Button.Checkmark.Visible = true
		end)
		while not v32 do
			wait(0.5)
		end
	else
		Checkmark.Visible = true
		p2.Button.Checkmark.Visible = true
	end
	if p3 then
		return
	end
	v3:SendData("ClaimChristmasPresent", "PlayerChannel", nil, p1)
	wait(2)
	v6:SetVisible(false)
	wait(0.3)
	if v11 then
		return
	end
	GuiManager:GetWindowDataByName("Inventory"):SetVisible(true)
end
function Refresh() --[[ Refresh | Line: 186 | Upvalues: Collection (copy), v6 (copy), v8 (copy), v7 (copy), v2 (copy), Template (copy), AssetLibraryManager (copy), v1 (copy), t (copy), UIGridLayout (copy) ]]
	for i, v in ipairs(Collection:GetChildren()) do
		if v:IsA("ImageLabel") then
			v:Destroy()
		end
	end
	v6.CanBeCanceled = false
	for i = 1, 25 do
		local v12 = if i < v8 then if v7[i] == false then true else false else false
		local v22 = if v2.ChristmasRewards[i] < 1000 then true else false
		local v4 = Template:clone()
		v4.ImageColor3 = v8 < i and Color3.fromRGB(0, 178, 51) or v4.ImageColor3
		v4.Parent = Collection
		v4.Visible = true
		v4.Checkmark.Visible = if i < v8 then true elseif v8 == i then _G.ChristmasRewardClaimed else false
		if v12 and v22 then
			v4.Checkmark.Image = "http://www.roblox.com/asset/?id=168397389"
		end
		v4.Day.Text = v2.FormatNumber("Int", i, v4.Day)
		v4.Button.Day.Text = v2.FormatNumber("Int", i, v4.Button.Day)
		if i ~= v8 then
			v4.Button.Glow:Destroy()
		end
		if v22 then
			v4.Moneyz.Visible = true
			v4.Button.Moneyz.Visible = true
			v4.Moneyz.MoneyzCount.Text = v2.FormatNumber("Int", v2.ChristmasRewards[i], v4.Moneyz.MoneyzCount)
			v4.Button.Moneyz.MoneyzCount.Text = v2.FormatNumber("Int", v2.ChristmasRewards[i], v4.Button.Moneyz.MoneyzCount)
		else
			if v2.ChristmasRewards[i] == 1001 then
				v4.QuestionMark.Visible = true
			else
				v4.Prize.Visible = true
				v4.Button.Prize.Visible = true
				local v72 = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. AssetLibraryManager:GetAssetById(v2.ChristmasRewards[i]).ModelId or v2.ChristmasRewards[i]
				v4.Prize.Image = v72
				v4.Button.Prize.Image = v72
			end
			v4.Moneyz.Visible = false
			v4.Button.Moneyz.Visible = false
		end
		if _G.ChristmasRewardClaimed then
			v6.CanBeCanceled = true
			v1.CancelButton.Visible = true
		end
		if i == v8 and not _G.ChristmasRewardClaimed then
			v4.Button.Visible = true
			v4.Button.Prize.Visible = v4.Prize.Visible
			v4.Button.Selectable = true
			v4.Button.Active = true
			v6.FirstSelectedObject = v4.Button
			local v82 = nil
			local v9 = nil
			local v10 = nil
			v82 = v4.Button.MouseButton1Down:connect(function() --[[ Line: 270 | Upvalues: v82 (ref), v9 (ref), v10 (ref), v8 (ref), v4 (copy) ]]
				v82:disconnect()
				v9:disconnect()
				v10:disconnect()
				ButtonClicked(v8, v4)
			end)
			v9 = v4.Button.MouseEnter:connect(function() --[[ Line: 277 | Upvalues: v4 (copy) ]]
				v4.Button.ImageColor3 = Color3.fromRGB(0, 210, 51)
				v4.Button.Size = UDim2.new(1, 20, 1, 20)
			end)
			v10 = v4.Button.MouseLeave:connect(function() --[[ Line: 282 | Upvalues: v4 (copy) ]]
				v4.Button.ImageColor3 = Color3.fromRGB(0, 178, 51)
				v4.Button.Size = UDim2.new(1, 0, 1, 0)
			end)
			spawn(function() --[[ Line: 287 | Upvalues: v1 (ref), v4 (copy) ]]
				while v1.Visible and (v4 and (v4.Parent and (v4:FindFirstChild("Button") and v4.Button.Visible))) do
					game:GetService("TweenService"):Create(v4.Button, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						Size = UDim2.new(1, 40, 1, 40)
					}):Play()
					wait(1)
					game:GetService("TweenService"):Create(v4.Button, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						Size = UDim2.new(1, 20, 1, 20)
					}):Play()
					wait(1)
				end
			end)
		end
		if if v12 then not v22 else v12 then
			v4.Button.Visible = true
			v4.Button.Prize.Visible = v4.Prize.Visible
			v4.Button.Selectable = true
			v4.Button.Active = true
			v4.Button.ImageColor3 = Color3.fromRGB(204, 0, 0)
			v4.Button.MouseEnter:connect(function() --[[ Line: 309 | Upvalues: v4 (copy) ]]
				v4.Button.ImageColor3 = Color3.fromRGB(230, 0, 0)
				v4.Button.Size = UDim2.new(1, 20, 1, 20)
			end)
			v4.Button.MouseLeave:connect(function() --[[ Line: 314 | Upvalues: v4 (copy) ]]
				v4.Button.ImageColor3 = Color3.fromRGB(204, 0, 0)
				v4.Button.Size = UDim2.new(1, 0, 1, 0)
			end)
			v4.Button.MouseButton1Down:connect(function() --[[ Line: 319 | Upvalues: i (copy), v4 (copy) ]]
				ButtonClicked(i, v4, true)
			end)
			v4.Button.Price.Visible = true
			spawn(function() --[[ Line: 325 | Upvalues: v1 (ref), v4 (copy) ]]
				while v1.Visible and (v4 and (v4.Parent and (v4:FindFirstChild("Button") and v4.Button.Visible))) do
					game:GetService("TweenService"):Create(v4.Button, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						Size = UDim2.new(1, 10, 1, 10)
					}):Play()
					wait(1)
					game:GetService("TweenService"):Create(v4.Button, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						Size = UDim2.new(1, 0, 1, 0)
					}):Play()
					wait(1)
				end
			end)
		end
		spawn(function() --[[ Line: 336 | Upvalues: v4 (copy) ]]
			game:GetService("ContentProvider"):PreloadAsync({ v4.Prize })
		end)
		t[i] = v4
	end
	UIGridLayout:ApplyLayout()
end
v5:BindEvents({
	ShowChristmasCalendar = function() --[[ ShowChristmasCalendar | Line: 350 | Upvalues: v7 (copy), v6 (copy), v4 (copy), v3 (copy) ]]
		if not IsChristmasTime() or (game.ReplicatedStorage.GlobalData.Holiday.Value ~= "Christmas" or (v7 == nil or #v7 == 0)) then
			v3:SendData("AdventWindowClosed", "PlayerChannel")
			return
		end
		v6:SetVisible(true)
		if not _G.ChristmasRewardClaimed then
			v4:PlaySound("ChristmasRewardWindowOpen")
		end
		Refresh()
	end
})
v1:WaitForChild("CancelButton").MouseButton1Click:connect(function() --[[ Line: 364 | Upvalues: v3 (copy) ]]
	v3:SendData("AdventWindowClosed", "PlayerChannel")
end)
local _ = {
	Countdown.Day1,
	Countdown.Day2,
	Countdown.Hour1,
	Countdown.Hour2,
	Countdown.Minute1,
	Countdown.Minute2,
	Countdown.Second1,
	Countdown.Second2
}
if v7 and v7[v8] ~= true then
	v4:Preload("ChristmasRewardWindowOpen")
else
	_G.ChristmasRewardClaimed = true
end