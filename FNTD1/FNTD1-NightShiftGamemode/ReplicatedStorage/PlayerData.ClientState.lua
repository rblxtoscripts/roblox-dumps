-- https://lua.expert/
local Remotes = game:GetService("ReplicatedStorage").Remotes
local GetData = Remotes.PlayerData.GetData
local v1 = nil
local v2 = false
local function loadData() --[[ loadData | Line: 10 | Upvalues: v2 (ref), v1 (ref), GetData (copy) ]]
	if v2 then
		return
	end
	while not v1 do
		v1 = GetData:InvokeServer()
		task.wait(1)
	end
	v2 = true
end
local function updateData(p1) --[[ updateData | Line: 20 | Upvalues: v2 (ref), v1 (ref) ]]
	while not v2 do
		task.wait(0.5)
	end
	if p1 == v1 then
		return
	end
	v1 = p1
end
Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updateData)
loadData()
return {
	GetData = function() --[[ GetData | Line: 36 | Upvalues: v2 (ref), v1 (ref) ]]
		if v2 then
			return v1
		end
		while not v2 do
			task.wait(0.5)
		end
		return v1
	end
}