-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiManager")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("Button")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("DisplayUtils")
local v8 = Sonar("CapsuleService")
local v9 = Sonar("spr")
local v10 = Sonar("NotificationsClient")
local v11 = Sonar("CharacterControls")
local v12 = Sonar("InputTypeDetector")
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("ItemCapsuleGui").ContainerFrame
local ContentFrame = ContainerFrame.Content.ContentFrame
local BottomFrame = ContainerFrame.Content.BottomFrame
local v13 = v5.GetRemoteFunction("PredictItemCapsuleRemote")
local v14 = v5.GetRemoteFunction("ClaimItemCapsuleRemote")
local v15 = v1.new()
local v16 = nil
local v17 = tick()
local v18 = false
function t.PredictItems(p1) --[[ PredictItems | Line: 35 | Upvalues: v18 (ref), v17 (ref), v13 (copy), v16 (ref), t (copy) ]]
	if v18 then
		return
	end
	if tick() - v17 < 0.5 then
		return
	end
	v17 = tick()
	local v1 = v13:InvokeServer(p1)
	if v1 then
		v16 = p1
		t.DisplayItems(p1, v1)
	else
		v18 = false
	end
end
function t.DisplayItems(p1, p2) --[[ DisplayItems | Line: 56 | Upvalues: v6 (copy), v15 (copy), v18 (ref), BottomFrame (copy), v12 (copy), v8 (copy), v2 (copy), ContainerFrame (copy), ContentFrame (copy), v7 (copy), ReplicatedStorage (copy), v9 (copy) ]]
	local v1 = v6.GetByName(p1)
	if not v1 then
		return warn("NO ITEM CAPSULE DATA", p1)
	end
	if not v1.ItemDropTable then
		return warn("NO ITEM DROP TABLE", p1)
	end
	v15:DoCleaning()
	v18 = true
	local Dismiss = BottomFrame.ButtonContainer.Dismiss
	Dismiss.Gamepad.Visible = v12.IsGamepadInputType()
	Dismiss.Keyboard.Visible = not v12.IsGamepadInputType() and not v12.IsMobileInputType()
	local v3 = v8.GetItemCapsuleItems(v1.ItemDropTable, v1.ItemPullAmount, p2, v1.NoRepeatItems, p1)
	v2.OpenFrame(ContainerFrame)
	ContainerFrame.Content.BottomFrame.ButtonContainer.PredictButton.Top.AmountLabel.Text = "($" .. v1.Price .. ")"
	local t = {}
	for v4, v5 in v3 do
		task.wait(0.05)
		local Item = v5.Item
		local v62 = v6.GetByName(Item.Name)
		if v62 then
			local v72 = ContentFrame.Default:Clone()
			v15:GiveTask(v72)
			v72.UIScale.Scale = 0
			v72.NameLabel.Text = v7.GetDisplayName(v62.Name, v62)
			v72.Viewport.Image = v62.Image
			v72.Viewport.AmountLabel.Text = Item.Amount
			local v82 = v5.Theme and v6.GetByName(v5.Theme)
			if v82 then
				if v82.Texture then
					v72.ThemeFrame.ImageLabel.Image = v82.Texture
					v72.ThemeFrame.ImageLabel.UIGradient.Enabled = false
				else
					v72.ThemeFrame.ImageLabel.Image = ""
					v72.ThemeFrame.ImageLabel.UIGradient.Color = v82.ColorSequence
					v72.ThemeFrame.ImageLabel.UIGradient.Enabled = true
				end
				v72.ThemeFrame.Visible = true
			else
				v72.ThemeFrame.Visible = false
			end
			if v62.ColorSequence then
				local v92 = ReplicatedStorage.Storage.Assets.ItemColorGradient:Clone()
				v92.Color = v62.ColorSequence
				v92.Parent = v72.Viewport
				v72.Viewport.UIGradient:Destroy()
				v15:GiveTask(v92)
			end
			v72.Visible = true
			v72.Parent = ContentFrame
			table.insert(t, v72)
		end
	end
	local v10 = #t
	if not (v10 > 0) then
		v18 = false
		return
	end
	local v11 = 0
	local v122 = false
	local function MarkComplete() --[[ MarkComplete | Line: 135 | Upvalues: v122 (ref), v11 (ref), v10 (copy), v18 (ref) ]]
		if v122 then
			return
		end
		v11 = v11 + 1
		if not (v10 <= v11) then
			return
		end
		v122 = true
		v18 = false
	end
	for v13, v14 in t do
		v9.completed(v14.UIScale, MarkComplete)
		v9.target(v14.UIScale, 0.8, 5, {
			Scale = 1
		})
	end
	task.delay(2, function() --[[ Line: 152 | Upvalues: v122 (ref), v18 (ref) ]]
		if v122 then
			return
		end
		v122 = true
		v18 = false
	end)
end
function t.ClaimItems() --[[ ClaimItems | Line: 163 | Upvalues: v14 (copy), v16 (ref), v10 (copy), v2 (copy), ContainerFrame (copy), LocalPlayer (copy) ]]
	local v1, _ = v14:InvokeServer(v16)
	if v1 then
		v10.Notify({
			Message = "Items claimed successfully!",
			Preset = "Green"
		})
		v2.CloseFrame(ContainerFrame)
		v2.OpenFrame(LocalPlayer.PlayerGui:WaitForChild("InventoryGui").ContainerFrame)
	else
		v10.Notify({
			Message = "Failed to claim items!",
			Preset = "Red"
		})
	end
end
function t.Close() --[[ Close | Line: 182 | Upvalues: v2 (copy), ContainerFrame (copy), LocalPlayer (copy) ]]
	if v2.IsFrameOpen(ContainerFrame) then
		v2.CloseFrame(ContainerFrame)
		v2.OpenFrame(LocalPlayer.PlayerGui:WaitForChild("InventoryGui").ContainerFrame)
	end
end
function t.Init() --[[ Init | Line: 189 | Upvalues: v2 (copy), ContainerFrame (copy), v15 (copy), v18 (ref), v4 (copy), t (copy), v3 (copy), v16 (ref), v11 (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 196 | Upvalues: v15 (ref), v18 (ref) ]]
		v15:DoCleaning()
		v18 = false
	end)
	v4.new(ContainerFrame, {
		Selectable = false,
		Click = function() --[[ Click | Line: 203 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v3.new(ContainerFrame.Content.BottomFrame.ButtonContainer.PayClaim, {
		Click = function() --[[ Click | Line: 209 | Upvalues: t (ref) ]]
			t.ClaimItems()
		end
	})
	v3.new(ContainerFrame.Content.BottomFrame.ButtonContainer.PredictButton, {
		Click = function() --[[ Click | Line: 215 | Upvalues: t (ref), v16 (ref) ]]
			t.PredictItems(v16)
		end
	})
	v11:AddControls("GamepadCapsuleClose", { Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 223 | Upvalues: t (ref) ]]
			t.Close()
		end
	}, function() --[[ Line: 226 | Upvalues: v2 (ref), ContainerFrame (ref) ]]
		return v2.IsFrameOpen(ContainerFrame)
	end, nil, true)
end
t.Init()
return t