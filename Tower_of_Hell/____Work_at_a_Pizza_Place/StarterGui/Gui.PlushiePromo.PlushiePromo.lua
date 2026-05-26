-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("Network")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
v2:WaitForChild("CancelButton")
local List = v2:FindFirstChild("List")
local Redeem = List:WaitForChild("CodeRewards"):WaitForChild("Redeem")
local Code = List.CodeRewards:WaitForChild("Code")
local HowToBuy = List:WaitForChild("Plushie"):WaitForChild("HowToBuy")
local Countdown = v2:WaitForChild("Countdown")
local Instructions = v2:WaitForChild("Instructions")
local CancelButton = Instructions:WaitForChild("CancelButton")
local v4 = GuiManager:RegisterWindow(v2, "Left", "Right")
v4.UseCursor = true
HowToBuy.MouseButton1Down:Connect(function() --[[ Line: 28 | Upvalues: Instructions (copy) ]]
	Instructions.Visible = true
end)
CancelButton.MouseButton1Down:Connect(function() --[[ Line: 32 | Upvalues: Instructions (copy) ]]
	Instructions.Visible = false
end)
Redeem.MouseButton1Down:Connect(function() --[[ Line: 36 | Upvalues: v1 (copy), Code (copy) ]]
	v1:FireServer("RedeemCode", Code.Text)
end)
local PlushiePromoEndTick = v3.PlushiePromoEndTick
local v5 = nil
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 44 | Upvalues: v2 (copy), v5 (ref), PlushiePromoEndTick (copy), Countdown (copy), v1 (copy) ]]
	if p1 ~= v2 then
		return
	end
	if p2 then
		v5 = task.spawn(function() --[[ Line: 47 | Upvalues: PlushiePromoEndTick (ref), Countdown (ref), v2 (ref) ]]
			while PlushiePromoEndTick > os.time() do
				local v1 = DateTime.fromUnixTimestamp(PlushiePromoEndTick - os.time())
				Countdown.Text = string.format("%02d", tonumber(v1:FormatUniversalTime("DDD", "en-us")) - 1) .. ":" .. v1:FormatUniversalTime("HH", "en-us") .. ":" .. v1:FormatUniversalTime("mm", "en-us") .. ":" .. v1:FormatUniversalTime("ss", "en-us")
				task.wait(1)
			end
			Countdown.Text = "EXPIRED"
			v2.List.Plushie.Icon.Expired.Visible = true
		end)
		return
	end
	if v5 then
		task.cancel(v5)
		v5 = nil
	end
	v1:FireServer("PlushiePromoClosed")
end)
if not workspace:FindFirstChild("MerchPromoDisplay") then
	v1:BindEvents({
		ShowPlushiePromo = function() --[[ ShowPlushiePromo | Line: 85 | Upvalues: v1 (copy), v4 (copy) ]]
			if _G.GamepadEnabled then
				v1:FireServer("PlushiePromoClosed")
			else
				v4:SetVisible(true)
			end
		end
	})
	return
end
task.spawn(function() --[[ Line: 68 | Upvalues: GuiManager (copy), PlushiePromoEndTick (copy) ]]
	workspace.MerchPromoDisplay.Sign.ClickDetector.Detector.Event:Connect(function() --[[ Line: 69 | Upvalues: GuiManager (ref) ]]
		GuiManager:GetWindowDataByName("PlushiePromo"):SetVisible(true)
	end)
	while PlushiePromoEndTick > os.time() do
		task.wait(1)
		local v1 = DateTime.fromUnixTimestamp(PlushiePromoEndTick - os.time())
		workspace.MerchPromoDisplay.Sign.BillboardGui.Countdown.Text = string.format("%02d", tonumber(v1:FormatUniversalTime("DDD", "en-us")) - 1) .. ":" .. v1:FormatUniversalTime("HH", "en-us") .. ":" .. v1:FormatUniversalTime("mm", "en-us") .. ":" .. v1:FormatUniversalTime("ss", "en-us")
	end
	workspace.MerchPromoDisplay.Sign.BillboardGui.Countdown.Text = "REDEEM"
end)
v1:BindEvents({
	ShowPlushiePromo = function() --[[ ShowPlushiePromo | Line: 85 | Upvalues: v1 (copy), v4 (copy) ]]
		if _G.GamepadEnabled then
			v1:FireServer("PlushiePromoClosed")
		else
			v4:SetVisible(true)
		end
	end
})