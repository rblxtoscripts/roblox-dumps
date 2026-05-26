-- https://lua.expert/
local Players = game:GetService("Players")
local v1 = script.Parent
local t = {
	LOCAL_PLAYER = "LOCAL_PLAYER",
	ON_LOCAL_PLAYER = "ON_LOCAL_PLAYER",
	CHARACTER_ADDED = "CHARACTER_ADDED",
	ON_CHARACTER = "ON_CHARACTER",
	CHARACTER_CHILD_ADDED = "CHARACTER_CHILD_ADDED"
}
local t2 = {
	_connectionUtil = require(v1:WaitForChild("ConnectionUtil")).new(),
	_boundEvents = {},
	getLocalPlayer = function() --[[ getLocalPlayer | Line: 53 | Upvalues: Players (copy) ]]
		return Players.LocalPlayer
	end
}
function t2.onLocalPlayer(p1) --[[ onLocalPlayer | Line: 57 | Upvalues: t2 (copy), t (copy), Players (copy) ]]
	local v1 = t2.getLocalPlayer()
	if v1 then
		p1(v1)
	end
	t2._connectionUtil:trackConnection(t.LOCAL_PLAYER, Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 66 | Upvalues: t2 (ref), t (ref) ]]
		local v1 = t2.getLocalPlayer()
		assert(v1)
		t2._getOrCreateBoundEvent(t.LOCAL_PLAYER):Fire(v1)
	end))
	return t2._getOrCreateBoundEvent(t.LOCAL_PLAYER).Event:Connect(p1)
end
function t2.getCharacter() --[[ getCharacter | Line: 77 | Upvalues: t2 (copy) ]]
	local v1 = t2.getLocalPlayer()
	if v1 then
		return v1.Character
	else
		return nil
	end
end
function t2.onCharacter(p1) --[[ onCharacter | Line: 85 | Upvalues: t2 (copy), t (copy) ]]
	t2._connectionUtil:trackConnection(t.ON_LOCAL_PLAYER, t2.onLocalPlayer(function(p12) --[[ Line: 89 | Upvalues: t2 (ref), p1 (copy), t (ref) ]]
		local v1 = t2.getCharacter()
		if v1 then
			p1(v1)
		end
		t2._connectionUtil:trackConnection(t.CHARACTER_ADDED, p12.CharacterAdded:Connect(function(p1) --[[ Line: 98 | Upvalues: t2 (ref), t (ref) ]]
			assert(p1)
			t2._getOrCreateBoundEvent(t.CHARACTER_ADDED):Fire(p1)
		end))
	end))
	return t2._getOrCreateBoundEvent(t.CHARACTER_ADDED).Event:Connect(p1)
end
function t2.getChild(p1, p2) --[[ getChild | Line: 110 | Upvalues: t2 (copy) ]]
	local v1 = t2.getCharacter()
	if not v1 then
		return nil
	end
	local v2 = v1:FindFirstChild(p1)
	if v2 and v2:IsA(p2) then
		return v2
	else
		return nil
	end
end
function t2.onChild(p1, p2, p3) --[[ onChild | Line: 122 | Upvalues: t2 (copy), t (copy) ]]
	t2._connectionUtil:trackConnection(t.ON_CHARACTER, t2.onCharacter(function(p12) --[[ Line: 126 | Upvalues: t2 (ref), p1 (copy), p2 (copy), p3 (copy), t (ref) ]]
		local v1 = t2.getChild(p1, p2)
		if not v1 then
			t2._connectionUtil:trackConnection(t.CHARACTER_CHILD_ADDED, p12.ChildAdded:Connect(function(p12_2) --[[ Line: 135 | Upvalues: p1 (ref), p2 (ref), t2 (ref), t (ref) ]]
				if p12_2.Name ~= p1 or not p12_2:IsA(p2) then
					return
				end
				t2._getOrCreateBoundEvent(t.CHARACTER_CHILD_ADDED .. p1 .. p2):Fire(p12_2)
			end))
			return
		end
		p3(v1)
		t2._connectionUtil:trackConnection(t.CHARACTER_CHILD_ADDED, p12.ChildAdded:Connect(function(p12_2) --[[ Line: 135 | Upvalues: p1 (ref), p2 (ref), t2 (ref), t (ref) ]]
			if p12_2.Name ~= p1 or not p12_2:IsA(p2) then
				return
			end
			t2._getOrCreateBoundEvent(t.CHARACTER_CHILD_ADDED .. p1 .. p2):Fire(p12_2)
		end))
	end))
	return t2._getOrCreateBoundEvent(t.CHARACTER_CHILD_ADDED .. p1 .. p2).Event:Connect(p3)
end
function t2._getOrCreateBoundEvent(p1) --[[ _getOrCreateBoundEvent | Line: 149 | Upvalues: t2 (copy) ]]
	if not t2._boundEvents[p1] then
		t2._boundEvents[p1] = Instance.new("BindableEvent")
	end
	return t2._boundEvents[p1]
end
return t2