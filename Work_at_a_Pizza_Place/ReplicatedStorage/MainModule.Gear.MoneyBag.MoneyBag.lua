-- https://lua.expert/
local v2, v3, v4
if not (game:GetService("UserInputService").TouchEnabled and (not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled)) then
	v2 = script.Parent
	v3 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui")
	v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
	CoinCount = v3.Notifications:WaitForChild("CoinCount")
	Amount = CoinCount:WaitForChild("Amount")
	function UpdateCount(p1_2) --[[ UpdateCount | Line: 17 | Upvalues: v4 (copy) ]]
		if p1_2 <= 0 then
			CoinCount.Visible = false
			script.Parent:Destroy()
		else
			Amount.Text = v4.FormatNumber("Number", p1_2, Amount)
		end
	end
	enabled = true
	function onButton1Down(p1_2) --[[ onButton1Down | Line: 29 ]]
		if not enabled then
			return
		end
		enabled = false
		workspace.Animation.PlayAnimation.PlayAnimation:Fire("ThrowCoin", 0)
		wait(0.3)
		UpdateCount((workspace.Main.ThrowCoin:InvokeServer(script.Parent)))
		wait(2)
		enabled = true
	end
	function onEquippedLocal(p1_2) --[[ onEquippedLocal | Line: 44 ]]
		UpdateCount((workspace.Main.GetCoinCount:InvokeServer()))
		CoinCount.Visible = true
		p1_2.Button1Down:connect(function() --[[ Line: 48 | Upvalues: p1_2 (copy) ]]
			onButton1Down(p1_2)
		end)
	end
	function onUnequippedLocal(p1_2) --[[ onUnequippedLocal | Line: 51 ]]
		CoinCount.Visible = false
	end
	v2.Equipped:connect(onEquippedLocal)
	v2.Unequipped:connect(onUnequippedLocal)
	return
end
script.Parent.ToolTip = ""
v2 = script.Parent
v3 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui")
v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
CoinCount = v3.Notifications:WaitForChild("CoinCount")
Amount = CoinCount:WaitForChild("Amount")
function UpdateCount(p1_2) --[[ UpdateCount | Line: 17 | Upvalues: v4 (copy) ]]
	if p1_2 <= 0 then
		CoinCount.Visible = false
		script.Parent:Destroy()
	else
		Amount.Text = v4.FormatNumber("Number", p1_2, Amount)
	end
end
enabled = true
function onButton1Down(p1_2) --[[ onButton1Down | Line: 29 ]]
	if not enabled then
		return
	end
	enabled = false
	workspace.Animation.PlayAnimation.PlayAnimation:Fire("ThrowCoin", 0)
	wait(0.3)
	UpdateCount((workspace.Main.ThrowCoin:InvokeServer(script.Parent)))
	wait(2)
	enabled = true
end
function onEquippedLocal(p1_2) --[[ onEquippedLocal | Line: 44 ]]
	UpdateCount((workspace.Main.GetCoinCount:InvokeServer()))
	CoinCount.Visible = true
	p1_2.Button1Down:connect(function() --[[ Line: 48 | Upvalues: p1_2 (copy) ]]
		onButton1Down(p1_2)
	end)
end
function onUnequippedLocal(p1_2) --[[ onUnequippedLocal | Line: 51 ]]
	CoinCount.Visible = false
end
v2.Equipped:connect(onEquippedLocal)
v2.Unequipped:connect(onUnequippedLocal)