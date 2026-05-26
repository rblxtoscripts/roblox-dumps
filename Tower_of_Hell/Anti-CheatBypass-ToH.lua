local function tagCharacter()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    for _, name in ipairs({"gravity", "fusion", "hook", "jump"}) do
        if not char:FindFirstChild(name) then
            local tag = Instance.new("StringValue")
            tag.Name = name
            tag.Parent = char
        end
    end
end

tagCharacter()
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    tagCharacter()
end)
print("[cheat] anti-cheat bypass applied")
