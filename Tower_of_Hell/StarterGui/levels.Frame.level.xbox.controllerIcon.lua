-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
function updateController(p1) --[[ updateController | Line: 4 | Upvalues: VRService (copy) ]]
	local v1
	if p1.UserInputType.Value >= 12 and p1.UserInputType.Value <= 19 then
		v1 = true
	else
		if not (p1.UserInputType.Value <= 8) then
			return
		end
		v1 = false
	end
	if not v1 or (VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
		return
	end
	local v4 = Enum.KeyCode[script:GetAttribute("Button")]
	script.Parent.Image = game:GetService("UserInputService"):GetImageForKeyCode(v4)
end
UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 22 ]]
	updateController(p1)
end)