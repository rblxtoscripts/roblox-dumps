-- https://lua.expert/
Mouse_Icon = "rbxasset://textures/GunCursor.png"
Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"
Tool = script.Parent
Mouse = nil
function UpdateIcon() --[[ UpdateIcon | Line: 10 ]]
	if not Mouse then
		return
	end
	Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
end
function OnEquipped(p1) --[[ OnEquipped | Line: 16 ]]
	Mouse = p1
	UpdateIcon()
end
function OnChanged(p1) --[[ OnChanged | Line: 21 ]]
	if p1 ~= "Enabled" then
		return
	end
	UpdateIcon()
end
Tool.Equipped:connect(OnEquipped)
Tool.Changed:connect(OnChanged)