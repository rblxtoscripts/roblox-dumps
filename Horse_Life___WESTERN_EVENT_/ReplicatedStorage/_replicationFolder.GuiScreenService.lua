-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiScreen")
local v2 = Sonar("PlayerWrapper")
function t.OpenScreen(p1, p2) --[[ OpenScreen | Line: 152 | Upvalues: t (copy) ]]
	local v1 = t.GetScreen(p1)
	if v1 then
		v1:Open(p2)
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Cannot open screen without a screen instance or screen name")
	end
end
function t.CloseScreen(p1, p2) --[[ CloseScreen | Line: 162 | Upvalues: t (copy) ]]
	local v1 = t.GetScreen(p1)
	if v1 then
		v1:Close(p2)
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Cannot close screen without a screen instance or screen name")
	end
end
function t.IsScreenOpen(p1) --[[ IsScreenOpen | Line: 172 | Upvalues: t (copy) ]]
	local v1 = t.GetScreen(p1)
	if v1 then
		return v1:IsOpen()
	end
	if typeof(p1) ~= "string" then
		return false
	end
	warn("\226\154\160\239\184\143 GuiScreenService, Screen not found:", p1)
	return false
end
function t.OpenScreenGroup(p1, p2) --[[ OpenScreenGroup | Line: 184 | Upvalues: t (copy), v1 (copy) ]]
	if typeof(p1) == "table" then
		for v12, v2 in p1 do
			t.OpenScreenGroup(v2, p2)
		end
	else
		if not p1 then
			p1 = v1.GetCurrentDefaultGroup()
		end
		local v4 = v1.GetGroupMap()[p1]
		if not v4 then
			warn("\226\154\160\239\184\143 GuiScreenService, Group not found:", p1)
			return
		end
		local v5 = if p2 then p2 else {}
		if p1 == v1.GetCurrentDefaultGroup() and v5.FullScreen == nil then
			v5.FullScreen = true
		end
		local v6 = v5
		local _, v7 = next(v4.Screens)
		if v7 then
			v7:OpenGroup(p1, v6)
		else
			warn("\226\154\160\239\184\143 GuiScreenService, Group has no screens:", p1)
		end
	end
end
function t.CloseScreenGroup(p1, p2) --[[ CloseScreenGroup | Line: 220 | Upvalues: t (copy), v1 (copy) ]]
	if typeof(p1) == "table" then
		for v12, v2 in p1 do
			t.CloseScreenGroup(v2, p2)
		end
	else
		if not p1 then
			warn("\226\154\160\239\184\143 GuiScreenService, Cannot close group without a group name")
			return
		end
		local v3 = v1.GetGroupMap()[p1]
		if not v3 then
			warn("\226\154\160\239\184\143 GuiScreenService, Group not found:", p1)
			return
		end
		local v4 = if p2 then p2 else {}
		local _, v5 = next(v3.Screens)
		if v5 then
			v5:CloseGroup(p1, v4)
		else
			warn("\226\154\160\239\184\143 GuiScreenService, Group has no screens:", p1)
		end
	end
end
function t.OpenDefaultScreenGroup(p1) --[[ OpenDefaultScreenGroup | Line: 251 | Upvalues: v1 (copy) ]]
	v1:OpenDefaultGroup(p1)
end
function t.CloseDefaultScreenGroup(p1) --[[ CloseDefaultScreenGroup | Line: 255 | Upvalues: v1 (copy) ]]
	v1:CloseDefaultGroup(p1)
end
function t.CloseAllScreens(p1) --[[ CloseAllScreens | Line: 259 | Upvalues: v1 (copy) ]]
	local _, v2 = next((v1.GetScreenMap()))
	if v2 then
		v2:CloseAllScreens(p1)
	else
		v1:CloseAllScreens(p1)
	end
end
function t.GetScreen(p1) --[[ GetScreen | Line: 269 | Upvalues: v1 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 GuiScreenService, Screen name or instance is required")
		return nil
	end
	local v12 = v1.GetScreenMap()
	if typeof(p1) == "string" then
		local v2 = v12[p1]
		if v2 then
			return v2
		else
			warn("\226\154\160\239\184\143 GuiScreenService, Screen not found:", p1)
			return nil
		end
	else
		for v3, v4 in v12 do
			if v4.Instance == p1 then
				return v4
			end
		end
		return nil
	end
end
function t.GetScreenInstance(p1) --[[ GetScreenInstance | Line: 294 | Upvalues: t (copy) ]]
	local v1 = t.GetScreen(p1)
	if not v1 then
		return nil
	end
	if v1.Instance then
		return v1.Instance
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Screen has no instance:", v1.Name)
		return nil
	end
end
function t.IsScreenInitialized(p1) --[[ IsScreenInitialized | Line: 308 | Upvalues: t (copy) ]]
	local v1 = t.GetScreen(p1)
	if v1 then
		return v1:IsInitialized()
	else
		return false
	end
end
function t.FindGuiScreenAncestor(p1) --[[ FindGuiScreenAncestor | Line: 317 | Upvalues: t (copy) ]]
	while p1 do
		local v1 = t.GetScreen(p1)
		if v1 then
			return v1
		end
		p1 = p1.Parent
	end
	return nil
end
function t.GetScreenGroup(p1) --[[ GetScreenGroup | Line: 328 | Upvalues: v1 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 GuiScreenService, Group name is required")
		return nil
	end
	local v12 = v1.GetGroupMap()[p1]
	if v12 then
		return v12.Screens
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Group not found:", p1)
		return nil
	end
end
function t.IsAScreenGroup(p1) --[[ IsAScreenGroup | Line: 344 | Upvalues: v1 (copy) ]]
	if p1 then
		return v1.GetGroupMap()[p1] and true or false
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Group name is required")
		return false
	end
end
function t.IsAScreen(p1) --[[ IsAScreen | Line: 354 | Upvalues: v1 (copy) ]]
	if p1 then
		return v1.GetScreenMap()[p1] and true or false
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Screen name is required")
		return false
	end
end
function t.IsScreenGroupOpen(p1) --[[ IsScreenGroupOpen | Line: 364 | Upvalues: v1 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 GuiScreenService, Group name is required")
		return false
	end
	local v12 = v1.GetGroupMap()[p1]
	if v12 then
		return v12.State.IsOpen
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Group not found:", p1)
		return false
	end
end
function t.ObserveScreenGroupState(p1, p2) --[[ ObserveScreenGroupState | Line: 380 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetGroupMap()[p1]
	if v12 then
		task.spawn(p2, v12.State.IsOpen)
		return v12.StateChangedSignal:Connect(p2)
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Group not found:", p1)
	end
end
function t.GetOpenScreenGroups() --[[ GetOpenScreenGroups | Line: 391 | Upvalues: v1 (copy), t (copy) ]]
	local t2 = {}
	for v12, v2 in v1.GetGroupMap() do
		if t.IsScreenGroupOpen(v12) then
			table.insert(t2, v12)
		end
	end
	return t2
end
function t.SetScreenDefaultGroup(p1) --[[ SetScreenDefaultGroup | Line: 403 | Upvalues: v1 (copy) ]]
	return v1.SetDefaultGroup(p1)
end
function t.GetCurrentDefaultGroup() --[[ GetCurrentDefaultGroup | Line: 407 | Upvalues: v1 (copy) ]]
	return v1.GetCurrentDefaultGroup()
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 411 | Upvalues: t (copy) ]]
	local v1 = t.GetScreen(p1)
	if v1 then
		return v1:AddCallback(p2, p3)
	else
		warn("\226\154\160\239\184\143 GuiScreenService, Screen not found for AddCallback")
		return false
	end
end
function t.Init(p1) --[[ Init | Line: 421 | Upvalues: v2 (copy), v1 (copy) ]]
	v2.bindToLocalPlayer({
		OnAdded = function(p1) --[[ OnAdded | Line: 425 | Upvalues: v1 (ref) ]]
			while task.wait() do
				local _, v12 = v1.GetCurrentDefaultGroup()
				if v12 then
					local v2 = true
					for v3, v4 in v12.Screens do
						if not v4:IsInitialized() then
							v2 = false
							break
						end
					end
					if v2 then
						p1:SetAttribute("GuiInitialised", true)
						return
					end
				end
			end
		end
	})
end
t:Init()
return t