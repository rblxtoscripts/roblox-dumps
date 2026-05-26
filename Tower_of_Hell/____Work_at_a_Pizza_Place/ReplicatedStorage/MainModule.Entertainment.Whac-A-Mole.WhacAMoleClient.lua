-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
game.ReplicatedStorage:WaitForChild("_v6FiRE_Additions"):WaitForChild("FurnitureRemotes"):WaitForChild("FurnitureOffloadEvent"):Fire(v1.Name, v1)