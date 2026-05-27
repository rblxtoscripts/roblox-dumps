-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("BirthdayService")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PromptClient")
local v4 = Sonar("TimeFormat")
local v5 = Sonar("AnimalGridButton")
local v6 = Sonar("PlayerWrapper").GetClient()
function t.PromptFromJoin() --[[ PromptFromJoin | Line: 17 | Upvalues: v1 (copy), v6 (copy), v3 (copy), v4 (copy), v5 (copy), v2 (copy) ]]
	local v12 = v1.GetBirthdaysFromJoin(v6)
	if not next(v12) then
		return
	end
	v3.Prompt({
		KeepVisible = true,
		Type = "ClaimBirthday",
		Setup = function(p1, p2) --[[ Setup | Line: 23 | Upvalues: v12 (copy), v6 (ref), v4 (ref), v5 (ref) ]]
			for k, v in pairs(v12) do
				local v1 = v6:GetAnimalSlot(v)
				local v3 = math.floor((workspace:GetServerTimeNow()))
				local v42 = v4.GetYear(v1.TimeReceived.Value)
				local v52 = v4.GetYear(v3)
				v5.new({
					ForceVisible = true,
					SlotValue = v1,
					Owner = game.Players.LocalPlayer,
					ParentFrame = p1.Content.Items.Content.Content
				}).Frame:FindFirstChild("AgeLabel", true).Text = v52 - v42 .. " Years"
			end
			local count = 0
			for k, v in pairs(p1.Content.Items.Content.Content:GetChildren()) do
				if v:IsA("ImageButton") and v.Visible then
					count = count + 1
				end
			end
			p1.Content.Items.Content.Content.UIListLayout.HorizontalAlignment = count >= 5 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
		end,
		Run = function() --[[ Run | Line: 49 | Upvalues: v2 (ref), v12 (copy) ]]
			v2.GetRemoteFunction("ClaimBirthdayRemote"):InvokeServer(v12)
			return true
		end
	})
	v3.YieldForNoPrompt()
end
return t