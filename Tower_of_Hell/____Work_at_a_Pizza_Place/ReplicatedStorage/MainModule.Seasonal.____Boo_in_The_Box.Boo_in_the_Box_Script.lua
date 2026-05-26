-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local _ = script:WaitForChild("HousePointer").Value
local BooMesh = v1.BooMesh
function BooVisible(p1) --[[ BooVisible | Line: 6 | Upvalues: BooMesh (copy), v1 (copy) ]]
	BooMesh.Transparency = if p1 then 0 else 1
	v1.Eye1.Transparency = if p1 then 0 else 1
	v1.Eye2.Transparency = if p1 then 0 else 1
end
local v2 = false
function onMouseClick(p1) --[[ onMouseClick | Line: 13 | Upvalues: v2 (ref), BooMesh (copy), v1 (copy) ]]
	if v2 then
		return
	end
	v2 = true
	BooMesh.Laugh.SoundId = BooMesh.Laugh.SoundFXId.Value
	BooMesh.MusicBox.SoundId = BooMesh.MusicBox.SoundFXId.Value
	spawn(function() --[[ Line: 21 | Upvalues: v1 (ref) ]]
		game:GetService("ContentProvider"):PreloadAsync({ v1.Boo.Laugh, v1.Boo.MusicBox })
	end)
	local MusicBox = BooMesh.MusicBox
	MusicBox:Play()
	MusicBox.Ended:Connect(function() --[[ Line: 27 | Upvalues: BooMesh (ref), v2 (ref) ]]
		BooVisible(true)
		BooMesh.Laugh:Play()
		delay(1, function() --[[ Line: 30 | Upvalues: v2 (ref) ]]
			BooVisible(false)
			v2 = false
		end)
	end)
end
v1.ClickDetector.Detector.Event:connect(onMouseClick)