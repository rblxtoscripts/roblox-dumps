-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Signal")
local v4 = Sonar("State")
local v5 = Sonar("TapToContinue")
Sonar("PlaceTypeService")
local v6 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t2 = {
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Get Coins by visiting the Help Board!",
		Response = "Let\'s do it!"
	},
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Follow the path to the Help Board!"
	}
}
local v7 = v2.GetClient()
local Container = Players.LocalPlayer.PlayerGui:WaitForChild("NewTutorialGui").Container.Container
local DialogBox = Container.DialogBox
local Instruction = DialogBox.Instruction
function t.Run(p1, p2) --[[ Run | Line: 49 | Upvalues: v7 (copy), v1 (copy), v4 (copy), v3 (copy), Instruction (copy), t2 (copy), Container (copy), DialogBox (copy), TweenService (copy), v6 (copy), v5 (copy) ]]
	local v12 = v7.PlayerCohorts.TrimmedTutorial:get()
	if v7.SkipTutorial then
		return
	end
	local v2 = v1.new()
	local v32 = v2:GiveTask(v4.new(1))
	local v42 = v2:GiveTask(v3.new())
	local Text = Instruction.Text
	Instruction.Visible = false
	v2:GiveTask(v32:subscribe(function(p1) --[[ Line: 62 | Upvalues: t2 (ref), v42 (copy), Container (ref), DialogBox (ref), Instruction (ref), Text (copy), v2 (copy), TweenService (ref), v6 (ref) ]]
		if #t2 < p1 then
			v42:Fire()
			return
		end
		local v1 = t2[p1]
		if v1 then
			local xAxis = Vector2.xAxis
			local v4 = UDim2.fromScale(0.006, 0.006)
			Container.AnchorPoint = xAxis
			Container.Position = v4
			Container.ImageLabel.Image = v1.Image
			DialogBox.Description.Text = v1.Dialog
			if v1.Response then
				Instruction.Text = v1.Response
			else
				Instruction.Text = Text
			end
			v2._tween = if v2._tween then v2._tween:Pause() else nil
			v2._tween = TweenService:Create(Container, v6, {
				AnchorPoint = Vector2.zero,
				Position = UDim2.fromScale(0.006, 0.006)
			})
		else
			v2._tween = if v2._tween then v2._tween:Pause() else nil
			v2._tween = TweenService:Create(Container, v6, {
				AnchorPoint = Vector2.one,
				Position = UDim2.fromScale(0, 0.5)
			})
		end
		v2._tween:Play()
		v2._tween.Completed:Wait()
	end))
	Instruction.Visible = true
	v32:set(1)
	if v12 then
		task.wait(1)
	else
		v2._activated = v5.Connect(function() --[[ Line: 101 | Upvalues: v42 (copy) ]]
			v42:Fire()
		end)
		v42:Wait()
	end
	v32:set(2)
	v2:DoCleaning()
end
return t