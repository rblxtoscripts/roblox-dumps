-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("ColorCorrectionUtils")
local v3 = Sonar("CameraShaker")
local v4 = Sonar("MessagesClient")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("CharacterEffects")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("Maid")
local v9 = Sonar("Signal")
local t = {}
t.__index = t
t.EndedSignal = v9.new()
local v10 = v7.GetClient()
local CurrentCamera = workspace.CurrentCamera
local v11 = 0
local t2 = {}
local t3 = {
	"The Kirin spirits are watching...",
	"Your ceremonial dance is flawless!",
	"The ancient hoofbeats echo...",
	"A mystical energy surrounds your horse.",
	"The ceremonial dance deepens your bond!",
	"Sparks of ancient power light your path.",
	"You feel the wisdom of past riders.",
	"The wind seems to whisper your name.",
	"Your horse moves with supernatural grace.",
	"The spirits smile upon your performance!"
}
local v12 = nil
local v13 = #ReplicatedStorage.Storage.KirinDance.Trail:GetChildren()
local v14 = 0
local v15 = v3.new(Enum.RenderPriority.Camera.Value + 1, "EventRaceShaker", function(p1) --[[ Line: 44 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v15:Start()
local function AddEffects() --[[ AddEffects | Line: 49 | Upvalues: v4 (copy), t3 (copy), v2 (copy), v15 (copy), v3 (copy) ]]
	v4:AddNotification({
		Type = "JumpCompleted",
		Duration = 1.5,
		Text = t3[math.random(#t3)],
		RunBefore = function() --[[ RunBefore | Line: 53 | Upvalues: v2 (ref), v15 (ref), v3 (ref) ]]
			v2:Tween()
			v15:Shake(v3.Presets.SmallRotationBump)
		end
	})
end
function t.new(p1) --[[ new | Line: 61 | Upvalues: t (copy), v8 (copy), v12 (ref), v1 (copy), v11 (ref), v5 (copy), v14 (ref), v2 (copy), v15 (copy), v3 (copy), v10 (copy), v13 (copy), AddEffects (copy), t2 (copy) ]]
	local v16 = t
	local v22 = setmetatable({}, v16)
	v22.Model = p1
	v22.CheckpointNumber = tonumber(v22.Model.name)
	v22.Maid = v8.new()
	v22.Touched = false
	if v22.Model:GetAttribute("State") and v22.Model.RaceRing:FindFirstChild("DisplayGui") then
		v22.Model.RaceRing.DisplayGui.Frame.FullLabel.Text = v22.Model:GetAttribute("State")
	elseif v22.Model.RaceRing:FindFirstChild("DisplayGui") then
		v22.Model.RaceRing.DisplayGui.Enabled = false
	end
	if v22.CheckpointNumber and v22.CheckpointNumber == 1 then
		v22.Model.RaceRing.DisplayGui.Enabled = true
	else
		for v32, v4 in v22.Model:GetChildren() do
			if v4:IsA("BasePart") then
				v4.Transparency = 1
			end
		end
	end
	v22.Maid:GiveTask(v22.Model)
	v22.Maid:GiveTask(v22.Model.RaceRing.Touched:Connect(function() --[[ Line: 91 | Upvalues: v22 (copy), v12 (ref), v1 (ref), v11 (ref), v5 (ref), t (ref), v14 (ref), v2 (ref), v15 (ref), v3 (ref), v10 (ref), v13 (ref), AddEffects (ref) ]]
		if v22.Touched then
			return
		end
		if v22.Model.Name == "Finish" and #v12.Trail:GetChildren() == 1 then
			local v16, v23 = v1.GetRemoteFunction("KirinDance"):InvokeServer()
			if v16 then
				v22.Touched = true
				v14 = #v12:GetChildren() - 1
				v2:Tween()
				v15:Shake(v3.Presets.SmallRotationBump)
				t.EndedSignal:Fire()
				t.EndRace()
				return
			end
			if not (os.time() - v11 > 1) then
				t.EndedSignal:Fire()
				t.EndRace()
				return
			end
			v5.Notify({
				Preset = "Red",
				Message = v23
			})
			v11 = os.time()
			t.EndedSignal:Fire()
			t.EndRace()
		else
			if v22.CheckpointNumber ~= v14 + 1 then
				return
			end
			local v32 = v10:GetCurrentAnimal()
			if v32 and (v22.Model:GetAttribute("State") and v32.MoveState ~= v22.Model:GetAttribute("State")) then
				if v11 ~= 0 and not (os.time() - v11 > 1) then
					return
				end
				v11 = os.time()
				v5.Notify({
					Preset = "Red",
					Message = "You must be in " .. v22.Model:GetAttribute("State") .. " state to complete this checkpoint!"
				})
				return
			end
			v22.Touched = true
			local v52 = v12.Trail:FindFirstChild((tostring(v22.CheckpointNumber + 1)))
			if v52 then
				for v6, v7 in v52:GetChildren() do
					if v7:IsA("BasePart") then
						if v52.RaceRing:FindFirstChild("DisplayGui") and v52:GetAttribute("State") then
							v52.RaceRing.DisplayGui.Enabled = true
						end
						v7.Transparency = 0
					end
				end
			else
				local Finish = v12.Trail:FindFirstChild("Finish")
				if Finish then
					for v8, v9 in Finish:GetChildren() do
						if v9:IsA("BasePart") then
							v9.Transparency = 0
						end
					end
				end
			end
			v22:Destroy()
			v14 = v14 + 1
			local t2 = {
				Preset = "Green"
			}
			t2.Message = string.format("%s/%s", v14, (tostring(v13)))
			v5.Notify(t2)
			AddEffects()
		end
	end))
	table.insert(t2, v22)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 188 | Upvalues: t2 (copy) ]]
	p1.Maid:DoCleaning()
	table.remove(t2, table.find(t2, p1))
	setmetatable(p1, nil)
end
function t.InitRace() --[[ InitRace | Line: 196 | Upvalues: v12 (ref), ReplicatedStorage (copy), t (copy) ]]
	v12 = ReplicatedStorage.Storage.KirinDance:Clone()
	for v1, v2 in v12.Trail:GetChildren() do
		t.new(v2)
	end
	v12.Parent = workspace
	game.Players.LocalPlayer.Character:PivotTo(v12.StartPos:GetPivot())
end
function t.EndRace() --[[ EndRace | Line: 208 | Upvalues: t2 (copy), v14 (ref), v12 (ref), v6 (copy) ]]
	for v1, v2 in table.clone(t2) do
		v2:Destroy()
	end
	v14 = 0
	v12:Destroy()
	v6.UpdateVisibility(false)
end
return t