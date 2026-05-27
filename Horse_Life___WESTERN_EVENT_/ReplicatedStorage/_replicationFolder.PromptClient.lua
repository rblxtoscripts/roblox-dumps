-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("NotificationsService")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("Maid")
local v6 = Sonar("CharacterControls")
local v7 = Sonar("UINavigator")
local PromptFrame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("PromptGui"):WaitForChild("PromptFrame")
local PromptFrames = PromptFrame:WaitForChild("PromptFrames")
local v8 = v4.GetRemoteEvent("PromptRemote")
local v9 = nil
local t2 = {}
function t.Prompt(p1) --[[ Prompt | Line: 31 | Upvalues: v9 (ref), PromptFrames (copy), v5 (copy), PromptFrame (copy), v7 (copy), v1 (copy) ]]
	if v9 and not p1.OverwritePrompt then
		return
	end
	if v9 and v9.KeepVisible then
		return
	end
	v9 = p1
	local v12 = PromptFrames:FindFirstChild(p1.Type)
	p1.Maid = v5.new()
	if p1.Setup then
		p1.Setup(v12, p1)
	end
	if p1.BackgroundNotVisible then
		PromptFrame.BackgroundLabel.Visible = false
	else
		PromptFrame.BackgroundLabel.Visible = true
		if not p1.DontSetHUDNavigationEnabled then
			v7.SetHUDNavigationEnabled(false)
		end
	end
	p1.Frame = v12
	if p1.AsFrame then
		v1.OpenFrame(PromptFrame, {
			CloseAll = "CloseOverlay",
			Background = true
		})
	else
		v1.OpenFrame(PromptFrame)
	end
	for k, v in pairs(PromptFrames:GetChildren()) do
		if v12 == v then
			v1.OpenFrame(v)
			continue
		end
		v1.CloseFrame(v)
	end
end
function t.Close() --[[ Close | Line: 76 | Upvalues: PromptFrames (copy), v1 (copy), PromptFrame (copy) ]]
	for k, v in pairs(PromptFrames:GetChildren()) do
		v1.CloseFrame(v)
	end
	v1.CloseFrame(PromptFrame)
end
function t.GetPromptFrame(p1) --[[ GetPromptFrame | Line: 84 | Upvalues: PromptFrames (copy) ]]
	return PromptFrames:FindFirstChild(p1)
end
function t.Clear() --[[ Clear | Line: 88 | Upvalues: v9 (ref), v7 (copy) ]]
	if not v9 then
		v9 = nil
		v7.SetHUDNavigationEnabled(true)
		v7.ResetSelectionToTargetFrame()
		return
	end
	v9.Maid:DoCleaning()
	v9 = nil
	v7.SetHUDNavigationEnabled(true)
	v7.ResetSelectionToTargetFrame()
end
function t.YieldForNoPrompt() --[[ YieldForNoPrompt | Line: 97 | Upvalues: v9 (ref) ]]
	if not v9 then
		return
	end
	repeat
		task.wait()
	until not v9
	return true
end
function t.IsActive() --[[ IsActive | Line: 106 | Upvalues: v9 (ref) ]]
	return v9
end
function t.AddPromptCallback(p1, p2) --[[ AddPromptCallback | Line: 111 | Upvalues: v3 (copy), t2 (copy) ]]
	local v1 = v3.ConvertNotifyType(p1)
	if t2[v1] then
		warn("Prompt callback already added for", v1)
	end
	t2[v1] = p2
end
v8.OnClientEvent:Connect(function(p1, ...) --[[ Line: 121 | Upvalues: v9 (ref), t2 (copy), v3 (copy), t (copy) ]]
	if v9 then
		return
	end
	local v1 = t2[p1](...)
	v1.Type = v1.Type or v3.RevertNotifyType(p1)
	t.Prompt(v1)
end)
function t.Init(p1) --[[ Init | Line: 130 | Upvalues: PromptFrames (copy), v2 (copy), v9 (ref), t (copy), v1 (copy), PromptFrame (copy), v6 (copy) ]]
	for k, v in pairs(PromptFrames:GetChildren()) do
		for k2, v3 in pairs({ "Run", "Cancel" }) do
			for k3, v4 in pairs(v:GetDescendants()) do
				if v4:IsA("ImageButton") and v4.Name == v3 .. "Button" then
					v2.new(v4, {
						Click = function() --[[ Click | Line: 136 | Upvalues: v9 (ref), v (copy), v3 (copy), v4 (copy), t (ref) ]]
							if not v9 then
								return
							end
							if v9.Type ~= v.Name then
								return
							end
							local v1 = v9[v3]
							if not v1 then
								return
							end
							if not v1(v, v4) then
								return
							end
							if v9 ~= v9 then
								return
							end
							t.Close()
						end
					})
				end
			end
		end
		local CloseButton = v:FindFirstChild("CloseButton", true)
		if CloseButton then
			v2.new(CloseButton, {
				Click = function() --[[ Click | Line: 158 | Upvalues: v9 (ref), CloseButton (copy), t (ref) ]]
					local Close = v9.Close
					if Close then
						if not Close(CloseButton) then
							return
						end
						if v9 == v9 then
							t.Close()
						end
						return
					end
					t.Close()
				end
			})
		end
		v1.AddFrame(v, {
			TweenAnimation = "Open",
			Overlay = true,
			OpenPosition = v.Position,
			ClosePosition = v.Position + UDim2.new(0, 0, 0.15, 0),
			CheckVisibility = function() --[[ CheckVisibility | Line: 178 | Upvalues: v9 (ref), v (copy) ]]
				return v9 and v9.Frame == v
			end,
			SelectOnOpen = function() --[[ SelectOnOpen | Line: 181 | Upvalues: v9 (ref), v (copy) ]]
				if v9 and v9.SelectOnOpen then
					return v9.SelectOnOpen(v)
				else
					return v:FindFirstChild("CancelButton", true)
				end
			end
		})
	end
	v1.AddFrame(PromptFrame, {
		KeepPosition = true
	})
	v1.AddStateCallback(PromptFrame, "OnClose", t.Clear)
	v6:AddControls("GamepadRunPrompt", { Enum.KeyCode.ButtonY }, {
		InputBegan = function() --[[ InputBegan | Line: 198 | Upvalues: v9 (ref), t (ref) ]]
			local Run = v9.Run
			if not Run then
				return
			end
			if not Run(v9.Frame, v9.Frame:FindFirstChild("RunButton", true)) then
				return
			end
			if v9 ~= v9 then
				return
			end
			t.Close()
		end
	}, function() --[[ Line: 209 | Upvalues: t (ref) ]]
		return t.IsActive()
	end, nil, true)
	v6:AddControls("GamepadClosePrompt", { Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 215 | Upvalues: v9 (ref), t (ref) ]]
			local Cancel = v9.Cancel
			if not Cancel then
				return
			end
			if not Cancel(v9.Frame, v9.Frame:FindFirstChild("CancelButton", true)) then
				return
			end
			if v9 ~= v9 then
				return
			end
			t.Close()
		end
	}, function() --[[ Line: 226 | Upvalues: t (ref) ]]
		return t.IsActive()
	end, nil, true)
end
t:Init()
return t