-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("PlayerWrapper").GetClient()
local v4 = Sonar("TutorialService")
local v5 = Sonar("Constants")
local v6 = v1.GetRemoteFunction("WinterEventRemote")
local LocalPlayer = Players.LocalPlayer
local v7 = nil
function t.SetupIndicator(p1) --[[ SetupIndicator | Line: 18 | Upvalues: v6 (copy), v3 (copy) ]]
	if not p1 then
		return
	end
	local BillboardGui = p1:FindFirstChild("BillboardGui", true)
	if not BillboardGui then
		return
	end
	local function updateVisibility() --[[ updateVisibility | Line: 24 | Upvalues: v6 (ref), BillboardGui (copy) ]]
		BillboardGui.Enabled = v6:InvokeServer("HasNewDialogue")
	end
	if v3.EventData then
		local LastReadWeek = v3.EventData:FindFirstChild("LastReadWeek")
		if LastReadWeek then
			LastReadWeek:GetPropertyChangedSignal("Value"):Connect(updateVisibility)
		end
		local IntroCompleted = v3.EventData:FindFirstChild("IntroCompleted")
		if IntroCompleted then
			IntroCompleted:GetPropertyChangedSignal("Value"):Connect(updateVisibility)
		end
	end
	BillboardGui.Enabled = v6:InvokeServer("HasNewDialogue")
end
function t.SetupFirstJoinArrow(p1) --[[ SetupFirstJoinArrow | Line: 44 | Upvalues: v5 (copy), v3 (copy), v4 (copy), v2 (copy), v6 (copy), v7 (ref), RunService (copy), LocalPlayer (copy) ]]
	if not p1 then
		return
	end
	if not v5.IsEventWorld then
		return
	end
	if not v3.EventData then
		return
	end
	if not v4.HasCompletedPrimaryTutorial(v3) then
		return
	end
	local ArrowShown = v3.EventData:FindFirstChild("ArrowShown")
	if ArrowShown and ArrowShown.Value then
		return
	end
	local v1 = p1:FindFirstChild("HumanoidRootPart") or (p1:FindFirstChild("RootPart") or p1.PrimaryPart)
	if v1 then
		v2.SetGuiWorldspacePointTo(v1.Position, "Head to Celleste")
		local function dismissArrow() --[[ dismissArrow | Line: 58 | Upvalues: v2 (ref), v6 (ref), v7 (ref) ]]
			v2.SetGuiWorldspacePointTo()
			v6:InvokeServer("MarkArrowShown")
			if not v7 then
				return
			end
			v7:Disconnect()
			v7 = nil
		end
		v7 = RunService.Heartbeat:Connect(function() --[[ Line: 67 | Upvalues: LocalPlayer (ref), v1 (copy), v2 (ref), v6 (ref), v7 (ref) ]]
			local Character = LocalPlayer.Character
			if not Character then
				return
			end
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if not HumanoidRootPart then
				return
			end
			if not ((HumanoidRootPart.Position - v1.Position).Magnitude <= 20) then
				return
			end
			v2.SetGuiWorldspacePointTo()
			v6:InvokeServer("MarkArrowShown")
			if not v7 then
				return
			end
			v7:Disconnect()
			v7 = nil
		end)
	end
end
return t