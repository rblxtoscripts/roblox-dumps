-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("CodesService")
local v3 = Sonar("Maid")
local v4 = Sonar("PlayerWrapper").GetClient()
local Codes = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RewardsGuiNew").ContainerFrame.Menu.TabFrames.Codes
local RedeemButton = Codes.Content.RedeemButton
local Codes_2 = Codes.Content.Codes
local ErrorLabel = Codes_2.ErrorLabel
local TextBox = Codes_2.InputContainer.TextBox
local RedeemedLabel = Codes_2.RedeemedLabel
local ValidLabel = Codes_2.ValidLabel
local v5 = v3.new()
function t.Run(p1, p2) --[[ Run | Line: 37 | Upvalues: v5 (copy), ErrorLabel (copy), RedeemedLabel (copy), ValidLabel (copy), v1 (copy), RedeemButton (copy), TextBox (copy), v2 (copy), v4 (copy) ]]
	v5:DoCleaning()
	if p2 then
		local t = {
			Error = function() --[[ Error | Line: 45 | Upvalues: ErrorLabel (ref), v5 (ref) ]]
				ErrorLabel.Text = "Error redeeming code!"
				ErrorLabel.Visible = true
				v5:GiveTask(task.delay(2, function() --[[ Line: 49 | Upvalues: ErrorLabel (ref) ]]
					ErrorLabel.Visible = false
				end))
				v5:GiveTask(function() --[[ Line: 53 | Upvalues: ErrorLabel (ref) ]]
					ErrorLabel.Visible = false
				end)
			end,
			NoExist = function() --[[ NoExist | Line: 57 | Upvalues: ErrorLabel (ref), v5 (ref) ]]
				ErrorLabel.Text = "This code doesn\'t exist!"
				ErrorLabel.Visible = true
				v5:GiveTask(task.delay(2, function() --[[ Line: 61 | Upvalues: ErrorLabel (ref) ]]
					ErrorLabel.Visible = false
				end))
				v5:GiveTask(function() --[[ Line: 65 | Upvalues: ErrorLabel (ref) ]]
					ErrorLabel.Visible = false
				end)
			end,
			AlreadyRedeemed = function() --[[ AlreadyRedeemed | Line: 69 | Upvalues: RedeemedLabel (ref), v5 (ref) ]]
				RedeemedLabel.Visible = true
				v5:GiveTask(task.delay(2, function() --[[ Line: 72 | Upvalues: RedeemedLabel (ref) ]]
					RedeemedLabel.Visible = false
				end))
				v5:GiveTask(function() --[[ Line: 76 | Upvalues: RedeemedLabel (ref) ]]
					RedeemedLabel.Visible = false
				end)
			end,
			Expired = function(p1) --[[ Expired | Line: 80 | Upvalues: ErrorLabel (ref), v5 (ref) ]]
				ErrorLabel.Text = "This code has expired!"
				ErrorLabel.Visible = true
				v5:GiveTask(task.delay(2, function() --[[ Line: 84 | Upvalues: ErrorLabel (ref) ]]
					ErrorLabel.Visible = false
				end))
				v5:GiveTask(function() --[[ Line: 88 | Upvalues: ErrorLabel (ref) ]]
					ErrorLabel.Visible = false
				end)
			end,
			Redeemed = function() --[[ Redeemed | Line: 92 | Upvalues: ValidLabel (ref), v5 (ref) ]]
				ValidLabel.Visible = true
				v5:GiveTask(task.delay(2, function() --[[ Line: 95 | Upvalues: ValidLabel (ref) ]]
					ValidLabel.Visible = false
				end))
				v5:GiveTask(function() --[[ Line: 99 | Upvalues: ValidLabel (ref) ]]
					ValidLabel.Visible = false
				end)
			end
		}
		v5:GiveTask(v1.new(RedeemButton, {
			Click = function() --[[ Click | Line: 106 | Upvalues: TextBox (ref), v2 (ref), v4 (ref), t (copy) ]]
				if not (#TextBox.Text <= 0) then
					t[v2.RedeemCode(v4, TextBox.Text)](TextBox.Text)
				end
			end
		}))
	end
end
return t