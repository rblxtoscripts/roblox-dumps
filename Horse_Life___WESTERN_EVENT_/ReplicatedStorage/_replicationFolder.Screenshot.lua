-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local CaptureService = game:GetService("CaptureService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("SoundService")
local LocalPlayer = game:GetService("Players").LocalPlayer
function t.Snap(p1, p2) --[[ Snap | Line: 19 | Upvalues: UserInputService (copy), TweenService (copy), v2 (copy), CaptureService (copy) ]]
	if tick() - p1.LastCaptureTick < 1 then
		return
	end
	if p2.BeforeCapture then
		p2.BeforeCapture()
	end
	if p1.WatermarkLabel then
		p1.WatermarkLabel.Visible = true
	end
	UserInputService.MouseIconEnabled = false
	if p1.SnapFrame then
		p1.SnapFrame.Visible = true
		TweenService:Create(p1.SnapFrame, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
			BackgroundTransparency = 0
		}):Play()
		v2.playSoundOnce("PictureTaken", {
			TimePosition = 0.45
		})
	end
	local v1 = false
	local function finishedCapture(p12) --[[ finishedCapture | Line: 41 | Upvalues: v1 (ref), p1 (copy), UserInputService (ref), CaptureService (ref), p2 (copy) ]]
		if v1 then
			return
		end
		task.wait(0.3)
		v1 = true
		p1.LastCaptureTick = tick()
		if p1.WatermarkLabel then
			p1.WatermarkLabel.Visible = false
		end
		UserInputService.MouseIconEnabled = true
		CaptureService:PromptSaveCapturesToGallery({ p12 }, function() --[[ Line: 56 ]] end)
		if not p2.AfterCapture then
			return
		end
		p2.AfterCapture()
	end
	CaptureService:CaptureScreenshot(finishedCapture)
	task.delay(2, finishedCapture)
end
function t.Init(p1) --[[ Init | Line: 70 | Upvalues: GuiService (copy), v1 (copy), LocalPlayer (copy) ]]
	GuiService:WaitForChild("ScreenshotHud").HideCoreGuiForCaptures = true
	p1.LastCaptureTick = tick()
	p1.WatermarkLabel = v1.FindElement("WatermarkLabel")
	p1.SnapFrame = v1.FindElement("ScreenshotSnapFrame")
	if p1.SnapFrame then
		p1.SnapFrame.Visible = false
	end
	if p1.WatermarkLabel then
		p1.WatermarkLabel.Visible = false
	end
	p1.NameLabel = p1.WatermarkLabel and v1.FindElement(p1.WatermarkLabel, "NameLabel")
	if p1.NameLabel then
		p1.NameLabel.Text = "@" .. LocalPlayer.DisplayName
	end
	return p1
end
t:Init()
return t