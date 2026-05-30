-- https://lua.expert/
local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
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
local function updateData(p1) --[[ updateData | Line: 19 | Upvalues: v2 (ref), v1 (ref) ]]
	if not v2 then
		while not v2 do
			task.wait(0.5)
		end
	end
	if p1 == v1 then
		return
	end
	v1 = p1
end
Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updateData)
local t = {
	GetData = function() --[[ GetData | Line: 35 | Upvalues: v2 (ref), v1 (ref) ]]
		while not v2 do
			task.wait(0.5)
		end
		return v1
	end
}
task.defer(function() --[[ Line: 43 | Upvalues: v2 (ref), loadData (copy) ]]
	while true do
		task.wait(15)
		v2 = false
		pcall(loadData)
	end
end)
loadData()
return t