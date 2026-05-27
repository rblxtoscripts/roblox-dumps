-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper").GetClient()
local v2 = Sonar("InputTypeDetector")
local t = {}
local t2 = {}
for k, v in pairs(Sonar("Constants").InputTypes) do
	t[v] = k
end
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
function t2.AddControls(p1, p2, p3, p4, p5, p6, p7) --[[ AddControls | Line: 27 | Upvalues: t3 (copy), t4 (copy), t5 (copy) ]]
	if t3[p2] then
		warn("Control with name \'" .. p2 .. "\' already exists.")
		return
	end
	local v1 = p3.InputBegan or p3
	local v2 = p3.InputEnded or v1
	local v3 = if typeof(p4) == "function" and p4 then p4 else p4.InputBegan
	t3[p2] = {
		InputBegan = v1,
		InputEnded = v2,
		CanUseCallback = p5,
		ActivationCallback = v3,
		DeactivationCallback = typeof(p4) ~= "function" and p4.InputEnded or nil,
		IgnoreSink = p7,
		Buttons = {}
	}
	local function f5(p1, p22) --[[ Line: 51 | Upvalues: p2 (copy) ]]
		for k, v in pairs(p22) do
			if not p1[v] then
				p1[v] = {}
			end
			p1[v][p2] = true
		end
	end
	f5(t4, v1)
	f5(t5, v2)
end
function t2.AddButtonControls(p1, p2, p3) --[[ AddButtonControls | Line: 69 | Upvalues: t2 (copy) ]]
	local v1 = t2:GetControls(p2)
	if v1 then
		v1.Buttons[p3] = true
		p3:RegisterAction(p3.Button, "OnClick", v1.ButtonCallback)
	else
		warn("No controls found for", p2)
	end
end
function t2.GetControls(p1, p2) --[[ GetControls | Line: 80 | Upvalues: t3 (copy) ]]
	return t3[p2]
end
function t2.RemoveControls(p1, p2) --[[ RemoveControls | Line: 85 | Upvalues: t3 (copy), t4 (copy), t5 (copy) ]]
	local v1 = t3[p2]
	if not v1 then
		warn("No controls found for \'" .. p2 .. "\' to remove.")
		return
	end
	local function f2(p1, p22) --[[ Line: 93 | Upvalues: p2 (copy) ]]
		for k, v in pairs(p22) do
			if p1[v] and p1[v][p2] then
				p1[v][p2] = nil
				if next(p1[v]) == nil then
					p1[v] = nil
				end
			end
		end
	end
	f2(t4, v1.InputBegan)
	f2(t5, v1.InputEnded or v1.InputBegan)
	for k, v in pairs(v1.Buttons) do
		local v5 = table.find(k.OnClick, v1.ButtonCallback)
		if v5 then
			table.remove(k.OnClick, v5)
		end
	end
	t3[p2] = nil
end
function t2.GetActionCallbacks(p1, p2, p3) --[[ GetActionCallbacks | Line: 117 | Upvalues: t4 (copy), t5 (copy), t6 (copy), t3 (copy), t (copy), v2 (copy) ]]
	local UserInputType = p3.UserInputType
	local KeyCode = p3.KeyCode
	local v1 = p2 and t4 or t5
	local v22 = v1[UserInputType] or v1[KeyCode]
	local t2 = {}
	if t6[UserInputType] or (t6[KeyCode] or not v22) then
		return
	end
	for k, v in pairs(v22) do
		local v3 = t3[k]
		local v4 = v3.CanUseCallback or true
		if v4 and typeof(v4) == "function" then
			v4 = v4(UserInputType, KeyCode, t[v2.GetInputType()])
		end
		if v4 then
			table.insert(t2, v3)
		end
	end
	return t2
end
function t2.AddBlockedInputs(p1, p2) --[[ AddBlockedInputs | Line: 139 | Upvalues: t6 (copy) ]]
	for k, v in pairs(p2) do
		t6[v] = true
	end
end
function t2.RemoveBlockedInputs(p1, p2) --[[ RemoveBlockedInputs | Line: 145 | Upvalues: t6 (copy) ]]
	for k, v in pairs(p2) do
		t6[v] = nil
	end
end
t2:AddControls("Cheats", { Enum.KeyCode.Backquote }, {
	InputBegan = function(p1) --[[ InputBegan | Line: 155 | Upvalues: v1 (copy) ]]
		local CheatFrame = v1.Player.PlayerGui.HUDGui:FindFirstChild("CheatFrame")
		if not CheatFrame then
			return
		end
		CheatFrame.Visible = not CheatFrame.Visible
	end
}, function() --[[ Line: 161 ]]
	return true
end)
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 166 | Upvalues: UserInputService (copy), v1 (copy), t2 (copy), t (copy), v2 (copy) ]]
	if UserInputService:GetFocusedTextBox() then
		return
	end
	if v1.ControlsDisabled then
		return
	end
	local v12 = t2:GetActionCallbacks(true, p1)
	if not v12 then
		return
	end
	for i, v in ipairs(v12) do
		if (v.IgnoreSink or not p2) and v.ActivationCallback then
			v.ActivationCallback(v1, p1, t[v2.GetInputType()])
		end
	end
end)
UserInputService.InputEnded:Connect(function(p1, p2) --[[ Line: 186 | Upvalues: UserInputService (copy), v1 (copy), t2 (copy), t (copy), v2 (copy) ]]
	if UserInputService:GetFocusedTextBox() then
		return
	end
	if v1.ControlsDisabled then
		return
	end
	local v12 = t2:GetActionCallbacks(false, p1)
	if not v12 then
		return
	end
	for i, v in ipairs(v12) do
		if (v.IgnoreSink or not p2) and v.DeactivationCallback then
			v.DeactivationCallback(v1, p1, t[v2.GetInputType()])
		end
	end
end)
return t2