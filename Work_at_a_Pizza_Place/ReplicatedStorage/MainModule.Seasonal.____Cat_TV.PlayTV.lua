-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local v2 = script:WaitForChild("HousePointer").Value
local Screen = v1.Screen.SurfaceGui.Screen
local VideoCreator = v2.Video.VideoCreator
local VideoName = v2.Video.VideoName
local VideoClips = v2.Video.VideoClips
local VideoCurrentFrame = v2.Video.VideoCurrentFrame
local v3 = nil
local t = {}
local function AddScreen(p1) --[[ AddScreen | Line: 16 | Upvalues: t (copy) ]]
	if not (p1:FindFirstChild("Screen") and p1.Screen:FindFirstChild("SurfaceGui")) then
		return
	end
	t[p1.Screen.SurfaceGui] = true
end
local function RemoveScreen(p1) --[[ RemoveScreen | Line: 22 | Upvalues: t (copy) ]]
	if not (p1:FindFirstChild("Screen") and (p1.Screen:FindFirstChild("SurfaceGui") and t[p1.Screen.SurfaceGui])) then
		return
	end
	t[p1.Screen.SurfaceGui] = nil
end
local function CollectTVs() --[[ CollectTVs | Line: 31 | Upvalues: v2 (copy), t (copy) ]]
	for i, v in ipairs(v2.Furniture:GetChildren()) do
		if v:FindFirstChild("Screen") and v.Screen:FindFirstChild("SurfaceGui") then
			t[v.Screen.SurfaceGui] = true
		end
	end
end
local function ShowClip(p1) --[[ ShowClip | Line: 41 | Upvalues: v3 (ref), t (copy), VideoCreator (copy), VideoName (copy) ]]
	if p1 == -1 or v3 == nil then
		return
	end
	for k, v in pairs(t) do
		if p1 == 0 then
			k.Screen.Image = ""
			k.Caption.Visible = true
			k.Caption.Text = "created by " .. VideoCreator.Value
			k.Title.Text = VideoName.Value
			k.Title.Visible = true
			continue
		end
		k.Caption.Visible = true
		k.Screen.Image = "rbxassetid://" .. v3[p1][1]
		k.Caption.Text = v3[p1][3]
		k.Title.Visible = false
	end
	if not v3[p1 + 1] then
		return
	end
	game:GetService("ContentProvider"):Preload("http://www.roblox.com/asset/?id=" .. v3[p1 + 1][1])
end
VideoClips:GetPropertyChangedSignal("Value"):connect(function() --[[ Line: 70 | Upvalues: VideoClips (copy), v3 (ref), ShowClip (copy), VideoCurrentFrame (copy) ]]
	if VideoClips.Value == "" then
		return
	end
	v3 = game:GetService("HttpService"):JSONDecode(VideoClips.Value)
	ShowClip(VideoCurrentFrame.Value)
end)
VideoCurrentFrame:GetPropertyChangedSignal("Value"):connect(function() --[[ Line: 78 | Upvalues: ShowClip (copy), VideoCurrentFrame (copy) ]]
	ShowClip(VideoCurrentFrame.Value)
end)
v2.Furniture.ChildAdded:connect(AddScreen)
v2.Furniture.ChildRemoved:connect(RemoveScreen)
for i, v in ipairs(v2.Furniture:GetChildren()) do
	if v:FindFirstChild("Screen") and v.Screen:FindFirstChild("SurfaceGui") then
		t[v.Screen.SurfaceGui] = true
	end
end
if VideoClips.Value == "" then
	return
end
v3 = game:GetService("HttpService"):JSONDecode(VideoClips.Value)
ShowClip(VideoCurrentFrame.Value)