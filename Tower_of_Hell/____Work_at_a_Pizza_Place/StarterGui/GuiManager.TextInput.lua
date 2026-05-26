-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local UIEvents = PlayerGui:WaitForChild("UIEvents")
PlayerGui:WaitForChild("MainGui")
game:GetService("GuiService")
require(game.ReplicatedStorage:WaitForChild("Enums"))
t.__index = t
function t.new(p1, p2) --[[ new | Line: 18 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = p1
	t2.WindowData = p2
	t2.NumbersOnly = false
	t2.LettersOnly = false
	t2.SpacesAllowed = true
	t2.PunctuationAllowed = true
	t2.UnderscoresAllowed = true
	t2.NumLines = 1
	t2.MaxLength = 1000
	t2.MinLength = 3
	t2.DefaultMessage = nil
	t2.DefaultMessageColor = Color3.new(179/255, 179/255, 179/255)
	t2.TextColor = p1.TextColor
	t2.FilteredString = nil
	t2.UnfilteredText = nil
	t2.IsValid = false
	t2.ExludedCharacters = nil
	t2.IsHashtagedTextValid = true
	t2.NeedsToBeFiltered = true
	return t2
end
function t.RunThroughFilter(p1) --[[ RunThroughFilter | Line: 46 ]]
	p1.UnfilteredText = p1.Object.Text
	p1.FilteredText = workspace.Main.FilterString:InvokeServer(nil, p1.Object.Text, "NonChat")
	p1.Object.Text = p1.FilteredText
	if string.find(p1.FilteredText, "##") and not p1.IsHashtagedTextValid then
		p1.Object.ErrorTextLabel.Text = "SomeOfTheTextWasFiltered"
		return false
	else
		return true
	end
end
function t.Initialize(p1) --[[ Initialize | Line: 58 | Upvalues: UIEvents (copy) ]]
	local Object = p1.Object
	Object.TextScaled = false
	Object.TextSize = math.floor(Object.AbsoluteSize.Y / p1.NumLines) - 2
	if p1.DefaultMessage then
		Object.TextColor = p1.DefaultMessageColor
		Object.Text = p1.DefaultMessage
	end
	Object.Focused:connect(function() --[[ Line: 71 | Upvalues: Object (copy), p1 (copy) ]]
		if Object.Text ~= p1.DefaultMessage then
			return
		end
		Object.Text = ""
		Object.TextColor = p1.TextColor
	end)
	Object.FocusLost:connect(function() --[[ Line: 81 | Upvalues: Object (copy), p1 (copy), UIEvents (ref) ]]
		if string.len(Object.Text) < p1.MinLength then
			p1.Object.ErrorTextLabel.Text = "Too Short"
			return
		end
		if not p1.NeedsToBeFiltered or p1:RunThroughFilter() then
			p1.IsValid = true
			UIEvents.TextInputChanged:Fire(p1.WindowData.Object, p1.Object, Object.Text)
			UIEvents.TextInputFocusLost:Fire(p1.WindowData.Object, p1.Object, Object.Text)
		end
	end)
	Object:GetPropertyChangedSignal("Text"):connect(function() --[[ Line: 105 | Upvalues: p1 (copy), Object (copy), UIEvents (ref) ]]
		p1.IsValid = false
		if string.len(Object.Text) > p1.MaxLength then
			Object.Text = string.sub(Object.Text, 1, p1.MaxLength)
			return
		end
		local v2 = ""
		local v3
		if p1.NumbersOnly then
			v3 = v2 .. "%d"
		elseif p1.LettersOnly then
			v3 = v2 .. "%a"
			if p1.SpacesAllowed then
				v3 = v3 .. "%s"
			end
		else
			v3 = v2 .. "%w"
			if p1.SpacesAllowed then
				v3 = v3 .. "%s"
			end
			if p1.PunctuationAllowed then
				v3 = v3 .. "%p"
			end
		end
		if p1.ExludedCharacters then
			Object.Text = Object.Text:gsub("[" .. p1.ExludedCharacters .. "]+", "")
		end
		Object.Text = Object.Text:gsub("[^" .. v3 .. "]+", "")
		UIEvents.TextInputChanged:Fire(p1.WindowData.Object, p1.Object, Object.Text)
	end)
end
function t.IsValid(p1) --[[ IsValid | Line: 152 ]]
	return p1.IsValid
end
function t.Reset(p1) --[[ Reset | Line: 156 ]]
	if p1.DefaultMessage then
		p1.Object.TextColor = p1.DefaultMessageColor
		p1.Object.Text = p1.DefaultMessage
	else
		p1.Object.Text = ""
	end
end
return t