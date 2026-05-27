-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("LeaderboardGui")
local v4 = Sonar("InputTypeDetector")
local v5 = Sonar("SettingsGui")
local v6 = Sonar("CameraGui")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("GuiUtils")
local v9 = Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v10 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local TopbarGui = PlayerGui:WaitForChild("TopbarGui")
local t2 = {
	Leaderboard = {
		Run = function() --[[ Run | Line: 31 | Upvalues: v7 (copy), v3 (copy) ]]
			if _G.BlockHUDFunction then
				v7.Notify({
					Message = "You cannot do that right now!",
					Type = "EnterCameraMode"
				})
			else
				v3.Toggle()
			end
		end
	},
	Settings = {
		Run = function() --[[ Run | Line: 44 | Upvalues: v5 (copy) ]]
			v5.Open()
		end
	},
	Camera = {
		Run = function() --[[ Run | Line: 49 | Upvalues: v10 (copy), v7 (copy), v6 (copy) ]]
			if v10:IsInAction("BuildMode") or (v10:IsInAction("CustomiseMode") or (v10:IsInAction("BondMode") or (_G.BlockHUDFunction or (v10:IsInAction("AppleGame") or v10:IsInAction("Maze"))))) then
				v7.Notify({
					Message = "You cannot do that right now!",
					Type = "EnterCameraMode"
				})
			else
				v6:EnterMode()
			end
		end
	},
	Menu = {
		Run = function() --[[ Run | Line: 61 ]] end
	}
}
function t.Init(p1) --[[ Init | Line: 67 | Upvalues: GuiService (copy), v4 (copy), TopbarGui (copy), t2 (copy), v2 (copy), v8 (copy), v9 (copy), v1 (copy), PlayerGui (copy) ]]
	local isHeight = GuiService.TopbarInset.Height == 36
	local v12 = GuiService:GetGuiInset()
	local v22 = GuiService:IsTenFootInterface()
	local v3 = if isHeight then 12 else v12.Y - 46
	if v22 then
		v3 = 10
	end
	local v42 = if v4.IsMobileInputType() then 0.5 else 1
	local v5 = v3 * v42
	for k, v in pairs(TopbarGui.TopFrame:GetChildren()) do
		v.Position = v.Name == "Right" and UDim2.new(1, v5, 0, 0) or UDim2.new(0, v5, 0, 0)
	end
	TopbarGui.TopFrame.Left.UIListLayout.VerticalAlignment = v4.IsMobileInputType() and Enum.VerticalAlignment.Center or Enum.VerticalAlignment.Bottom
	TopbarGui.TopFrame.Left.UIListLayout.Padding = v4.IsMobileInputType() and UDim.new(0, 2) or UDim.new(0, 6)
	for k, v in pairs(TopbarGui.TopFrame:GetDescendants()) do
		if v:IsA("ImageButton") and v.Visible then
			local v92 = t2[v.Name]
			local v11 = if v4.IsMobileInputType() then 0.6 else 1
			local v122 = (if isHeight then 32 else 44) * v11
			v.Size = UDim2.fromOffset(v122, v122)
			v2.new(v, {
				NoHoverShadowLabel = true,
				HoverUpLabel = v:FindFirstChild("Icon", true),
				Click = function() --[[ Click | Line: 105 | Upvalues: v92 (copy) ]]
					v92.Run()
				end,
				HoverLabel = v:FindFirstChild("Title")
			})
			local function setVisible() --[[ setVisible | Line: 113 | Upvalues: v8 (ref), v (copy), v4 (ref) ]]
				if not v8.GetGameState("TopBar") then
					v.Visible = false
					return
				end
				if v.Name == "Settings" then
					v.Visible = true
					return
				end
				if not v8.GetGameState("TopBarAction") then
					v.Visible = false
					return
				end
				v.Visible = v.Name == "Leaderboard" and v4.IsMobileInputType() or (if v.Name == "Leaderboard" then false else true)
			end
			v4.InputTypeChanged:Connect(setVisible)
			v9.GameStateChangedSignal:Connect(setVisible)
			setVisible()
		end
	end
	v1.AddFrame(TopbarGui.TopFrame, {
		KeepPosition = true,
		HUD = true,
		CheckVisibility = function(p1) --[[ CheckVisibility | Line: 133 | Upvalues: v8 (ref) ]]
			return v8.GetGameState("TopBar")
		end
	})
	for k, v in pairs(PlayerGui.HUDGui.RightFrame:GetChildren()) do
		local CameraButton = v:FindFirstChild("CameraButton", true)
		if CameraButton then
			v2.new(CameraButton.Button, {
				Rotate = false,
				AddHoverButton = true,
				HoverUpLabel = CameraButton:FindFirstChild("Icon", true),
				Click = t2.Camera.Run
			})
		end
	end
end
t:Init()
return t