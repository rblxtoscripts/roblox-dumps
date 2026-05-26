-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v3 = script.Parent
local Handle = v3:WaitForChild("Handle", 1)
local FloorWire = v3:WaitForChild("FloorWire", 1)
if not Handle then
	return
end
Handle.Locked = true
FloorWire.Transparency = 0.5
workspace.TutorialService.PlayerAction:FireServer("GrabbedPizza", true)
local v4, v5, v6
if game.Players.LocalPlayer.TeamColor == BrickColor.new(37) or game.Players.LocalPlayer.TeamColor == BrickColor.new(23) then
	connection = nil
	v4 = nil
	v5 = nil
	v6 = nil
	game.Workspace.Main.RefreshJobsCompleted.OnClientEvent:connect(function(p1_2) --[[ Line: 35 | Upvalues: v3 (copy), FloorWire (copy) ]]
		if p1_2 and p1_2.Delivery < 10 or v3 and (v3:FindFirstChild("PlayerCustomer") and v3.PlayerCustomer.Value) then
			FloorWire.Visible = true
		else
			FloorWire.Visible = false
		end
	end)
	function onEquippedLocal(p1_2) --[[ onEquippedLocal | Line: 44 | Upvalues: v3 (copy), v4 (ref), v5 (ref), Handle (copy), v6 (ref), FloorWire (copy), v2 (copy) ]]
		if v3.Handle:FindFirstChild("Chimes") then
			v3.Handle.Chimes:Play()
		end
		if v3.PlayerCustomer.Value == game.Players.LocalPlayer then
			v4 = v3.Handle:clone()
			v4.Name = "Frame"
			v4.Parent = workspace
			v4.Anchored = true
			v4.CanCollide = false
			v4.Transparency = 1
			v4.Logo.Transparency = 1
			p1_2.TargetFilter = v4
			local SelectionBox = Instance.new("SelectionBox")
			SelectionBox.Adornee = v4
			SelectionBox.Parent = v4
			v5 = p1_2.Move:connect(function() --[[ Line: 69 | Upvalues: p1_2 (copy), Handle (ref), v4 (ref) ]]
				if not ((p1_2.Hit.p - Handle.Position).magnitude < 30) then
					return
				end
				v4.CFrame = CFrame.new(p1_2.Hit.p + Vector3.new(0, 0.35, 0))
			end)
			v6 = p1_2.Button1Down:connect(function() --[[ Line: 75 | Upvalues: v3 (ref), v4 (ref), p1_2 (copy) ]]
				workspace.Main.PlacePizzaSlices:FireServer(v3, v4.CFrame)
				onUnequippedLocal(p1_2)
			end)
			FloorWire.Visible = false
			return
		end
		game.Workspace.Main.RefreshJobsCompleted:FireServer()
		local House = v3.House.Value
		if House ~= nil and (House:FindFirstChild("CurrentUpgrade") ~= nil and House.CurrentUpgrade.Value ~= nil) then
			FloorWire.From = v3.Handle
			FloorWire.To = House.CurrentUpgrade.Value.GivePizza
			v3.TextureId = "rbxassetid://" .. v2.AddressImages[House.Address.Value]
			return
		end
		if House ~= nil or not v3.PlayerCustomer.Value then
			v3.Parent = workspace
			wait()
			v3:Destroy()
			return
		end
		local PlayerCustomer = v3.PlayerCustomer.Value
		if PlayerCustomer and (PlayerCustomer.Parent and (PlayerCustomer.Character and PlayerCustomer.Character:FindFirstChild("HumanoidRootPart"))) then
			FloorWire.From = v3.Handle
			FloorWire.To = PlayerCustomer.Character.HumanoidRootPart
		else
			v3.Parent = workspace
			wait()
			v3:Destroy()
		end
	end
	function onUnequippedLocal(p1_2) --[[ onUnequippedLocal | Line: 125 | Upvalues: v5 (ref), v6 (ref), v4 (ref), FloorWire (copy), v3 (copy) ]]
		if v5 then
			v5:disconnect()
		end
		if v6 then
			v6:disconnect()
		end
		if v4 then
			v4:Destroy()
		end
		FloorWire.Visible = false
		if v3 and (v3:FindFirstChild("Handle") and v3.Handle:FindFirstChild("Chimes")) then
			v3.Handle.Chimes:Stop()
		end
		if not p1_2 then
			return
		end
		p1_2.Icon = ""
	end
	v3.Equipped:connect(onEquippedLocal)
	v3.Unequipped:connect(onUnequippedLocal)
	return
end
v1:SendData("ChangeJob", "PlayerChannel", nil, "Delivery")
connection = nil
v4 = nil
v5 = nil
v6 = nil
game.Workspace.Main.RefreshJobsCompleted.OnClientEvent:connect(function(p1_2) --[[ Line: 35 | Upvalues: v3 (copy), FloorWire (copy) ]]
	if p1_2 and p1_2.Delivery < 10 or v3 and (v3:FindFirstChild("PlayerCustomer") and v3.PlayerCustomer.Value) then
		FloorWire.Visible = true
	else
		FloorWire.Visible = false
	end
end)
function onEquippedLocal(p1_2) --[[ onEquippedLocal | Line: 44 | Upvalues: v3 (copy), v4 (ref), v5 (ref), Handle (copy), v6 (ref), FloorWire (copy), v2 (copy) ]]
	if v3.Handle:FindFirstChild("Chimes") then
		v3.Handle.Chimes:Play()
	end
	if v3.PlayerCustomer.Value == game.Players.LocalPlayer then
		v4 = v3.Handle:clone()
		v4.Name = "Frame"
		v4.Parent = workspace
		v4.Anchored = true
		v4.CanCollide = false
		v4.Transparency = 1
		v4.Logo.Transparency = 1
		p1_2.TargetFilter = v4
		local SelectionBox = Instance.new("SelectionBox")
		SelectionBox.Adornee = v4
		SelectionBox.Parent = v4
		v5 = p1_2.Move:connect(function() --[[ Line: 69 | Upvalues: p1_2 (copy), Handle (ref), v4 (ref) ]]
			if not ((p1_2.Hit.p - Handle.Position).magnitude < 30) then
				return
			end
			v4.CFrame = CFrame.new(p1_2.Hit.p + Vector3.new(0, 0.35, 0))
		end)
		v6 = p1_2.Button1Down:connect(function() --[[ Line: 75 | Upvalues: v3 (ref), v4 (ref), p1_2 (copy) ]]
			workspace.Main.PlacePizzaSlices:FireServer(v3, v4.CFrame)
			onUnequippedLocal(p1_2)
		end)
		FloorWire.Visible = false
		return
	end
	game.Workspace.Main.RefreshJobsCompleted:FireServer()
	local House = v3.House.Value
	if House ~= nil and (House:FindFirstChild("CurrentUpgrade") ~= nil and House.CurrentUpgrade.Value ~= nil) then
		FloorWire.From = v3.Handle
		FloorWire.To = House.CurrentUpgrade.Value.GivePizza
		v3.TextureId = "rbxassetid://" .. v2.AddressImages[House.Address.Value]
		return
	end
	if House ~= nil or not v3.PlayerCustomer.Value then
		v3.Parent = workspace
		wait()
		v3:Destroy()
		return
	end
	local PlayerCustomer = v3.PlayerCustomer.Value
	if PlayerCustomer and (PlayerCustomer.Parent and (PlayerCustomer.Character and PlayerCustomer.Character:FindFirstChild("HumanoidRootPart"))) then
		FloorWire.From = v3.Handle
		FloorWire.To = PlayerCustomer.Character.HumanoidRootPart
	else
		v3.Parent = workspace
		wait()
		v3:Destroy()
	end
end
function onUnequippedLocal(p1_2) --[[ onUnequippedLocal | Line: 125 | Upvalues: v5 (ref), v6 (ref), v4 (ref), FloorWire (copy), v3 (copy) ]]
	if v5 then
		v5:disconnect()
	end
	if v6 then
		v6:disconnect()
	end
	if v4 then
		v4:Destroy()
	end
	FloorWire.Visible = false
	if v3 and (v3:FindFirstChild("Handle") and v3.Handle:FindFirstChild("Chimes")) then
		v3.Handle.Chimes:Stop()
	end
	if not p1_2 then
		return
	end
	p1_2.Icon = ""
end
v3.Equipped:connect(onEquippedLocal)
v3.Unequipped:connect(onUnequippedLocal)