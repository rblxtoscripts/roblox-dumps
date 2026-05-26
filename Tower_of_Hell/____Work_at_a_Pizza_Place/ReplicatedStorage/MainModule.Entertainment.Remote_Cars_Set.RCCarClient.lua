-- https://lua.expert/
game:GetService("Players")
local v1 = script:WaitForChild("ObjectPointer").Value
local _ = script:WaitForChild("HousePointer").Value:FindFirstChild("Owner").Value
local AccelerateMode = v1:WaitForChild("AccelerateMode")
local Prompts = v1:WaitForChild("Prompts")
local red = Prompts:WaitForChild("red")
local blue = Prompts:WaitForChild("blue")
local function fireServer(p1, p2) --[[ fireServer | Line: 14 | Upvalues: AccelerateMode (copy) ]]
	AccelerateMode:FireServer(p1, p2)
end
local function initPrompt(p1) --[[ initPrompt | Line: 19 | Upvalues: AccelerateMode (copy) ]]
	local v1 = p1.Name
	p1.Triggered:Connect(function() --[[ Line: 22 | Upvalues: v1 (copy), AccelerateMode (ref) ]]
		AccelerateMode:FireServer(v1, "start")
	end)
	p1.TriggerEnded:Connect(function() --[[ Line: 26 | Upvalues: v1 (copy), AccelerateMode (ref) ]]
		AccelerateMode:FireServer(v1, "stop")
	end)
end
initPrompt(red)
initPrompt(blue)