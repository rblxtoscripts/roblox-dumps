-- Place a folder named "KillbrickFlag" in workspace.
-- The client-side killbrick handler exits early if this exists.
if not workspace:FindFirstChild("KillbrickFlag") then
    Instance.new("Folder", workspace).Name = "KillbrickFlag"
end
print("[cheat] killbricks disabled (client-side)")