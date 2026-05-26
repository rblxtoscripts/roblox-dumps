-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local Workspace = game:GetService("Workspace")
local v1 = Sonar("AccelTween")
local v2 = Sonar("FakeSkyboxSide")
local v3 = Sonar("Maid")
local v4 = Sonar("Signal")
local t = {}
for k, v in pairs({
	Top = "Up",
	Bottom = "Dn",
	Right = "Lf",
	Left = "Rt",
	Front = "Ft",
	Back = "Bk"
}) do
	t[Enum.NormalId[k]] = "Skybox" .. v
end
local t2 = {}
t2.__index = t2
t2.ClassName = "FakeSkybox"
t2._partSize = 1024
function t2.new(p1) --[[ new | Line: 36 | Upvalues: t2 (copy), v3 (copy), v2 (copy), v4 (copy), v1 (copy), Workspace (copy) ]]
	local v22 = setmetatable({}, t2)
	v22._maid = v3.new()
	v22._parentFolder = Instance.new("Folder")
	v22._parentFolder.Name = "Skybox"
	v22._maid:GiveTask(v22._parentFolder)
	v22._sides = {}
	for k, v in pairs(Enum.NormalId:GetEnumItems()) do
		v22._sides[v] = v2.new(v22._partSize, v, v22._parentFolder)
	end
	v22._visible = false
	v22.VisibleChanged = v4.new()
	v22._percentVisible = v1.new(0.25)
	v22._percentVisible.t = 0
	v22._percentVisible.p = 0
	if p1 then
		v22:SetSkybox(p1)
	end
	v22._parentFolder.Parent = Workspace.CurrentCamera
	return v22
end
function t2.SetPartSize(p1, p2) --[[ SetPartSize | Line: 68 ]]
	p1._partSize = if p2 then p2 else error("No partSize")
	for k, v in pairs(p1._sides) do
		v:SetPartSize(p1._partSize)
	end
	return p1
end
function t2.Show(p1, p2) --[[ Show | Line: 78 ]]
	if p1._visible then
		return
	end
	p1._visible = true
	p1._percentVisible.t = 1
	if p2 then
		p1._percentVisible.p = 1
	end
	p1.VisibleChanged:Fire(p1._visible, p2)
end
function t2.Hide(p1, p2) --[[ Hide | Line: 92 ]]
	if not p1._visible then
		return
	end
	p1._visible = false
	p1._percentVisible.t = 0
	if p2 then
		p1._percentVisible.p = 0
	end
	p1.VisibleChanged:Fire(p1._visible, p2)
end
function t2.SetSkybox(p1, p2) --[[ SetSkybox | Line: 106 | Upvalues: t (copy) ]]
	p1._skybox = if p2 then p2 else error("No skybox")
	for k, v in pairs(p1._sides) do
		v:SetImage(p2[t[k]])
	end
	return p1
end
function t2.IsVisible(p1) --[[ IsVisible | Line: 117 ]]
	return p1._visible
end
function t2.UpdateRender(p1, p2) --[[ UpdateRender | Line: 121 ]]
	local p = p1._percentVisible.p
	for k, v in pairs(p1._sides) do
		v:UpdateRender(p2)
		v:SetTransparency(p)
	end
end
function t2.Destroy(p1) --[[ Destroy | Line: 130 ]]
	p1._maid:DoCleaning()
	p1._maid = nil
end
return t2