-- https://lua.expert/
local Door = script.Parent:WaitForChild("Door")
local AdPortal = Door:WaitForChild("AdPortal")
local AdGui = AdPortal:WaitForChild("AdGui")
local AdGuiAdornee = script.Parent:WaitForChild("AdGuiAdornee")
local AdGuiVisible = script.Parent:WaitForChild("AdGuiVisible")
local AdGuiHidden = script.Parent:WaitForChild("AdGuiHidden")
local function hide_portal() --[[ hide_portal | Line: 9 ]]
	script.Parent.towerwall.Value.Transparency = 0
	script.Parent.towerwall.Value.CanCollide = true
end
local function hide() --[[ hide | Line: 14 | Upvalues: Door (copy), AdGuiAdornee (copy), AdGuiHidden (copy) ]]
	for k, v in pairs(script.Parent:GetDescendants()) do
		if v:IsA("BasePart") and v ~= Door then
			v.CanCollide = false
			v.Transparency = 1
		end
	end
	AdGuiAdornee.CFrame = AdGuiHidden.CFrame
	script.Parent.towerwall.Value.Transparency = 0
	script.Parent.towerwall.Value.CanCollide = true
end
local function show() --[[ show | Line: 26 | Upvalues: Door (copy), AdGuiAdornee (copy), AdGuiVisible (copy) ]]
	for k, v in pairs(script.Parent:GetDescendants()) do
		if v:IsA("BasePart") and v ~= Door then
			v.CanCollide = true
			v.Transparency = 0
		end
	end
	AdGuiAdornee.CFrame = AdGuiVisible.CFrame
end
local function show_portal() --[[ show_portal | Line: 37 | Upvalues: show (copy) ]]
	script.Parent.towerwall.Value.Transparency = 1
	script.Parent.towerwall.Value.CanCollide = false
	show()
end
local function update() --[[ update | Line: 43 | Upvalues: hide (copy), AdGui (copy), AdPortal (copy), show (copy) ]]
	if not game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("settings"):WaitForChild("Adblock").Value then
		if AdGui.Status == Enum.AdUnitStatus.Active and AdPortal.Status == Enum.AdUnitStatus.Active then
			script.Parent.towerwall.Value.Transparency = 1
			script.Parent.towerwall.Value.CanCollide = false
			show()
			return
		end
		if AdGui.Status == Enum.AdUnitStatus.Active and AdPortal.Status == Enum.AdUnitStatus.Inactive then
			script.Parent.towerwall.Value.Transparency = 0
			script.Parent.towerwall.Value.CanCollide = true
			show()
			return
		end
		if AdGui.Status ~= Enum.AdUnitStatus.Inactive then
			return
		end
	end
	hide()
end
AdGui:GetPropertyChangedSignal("Status"):Connect(update)
AdPortal:GetPropertyChangedSignal("Status"):Connect(update)
script.Parent.DescendantAdded:Connect(function() --[[ Line: 60 | Upvalues: update (copy) ]]
	update()
end)
update()