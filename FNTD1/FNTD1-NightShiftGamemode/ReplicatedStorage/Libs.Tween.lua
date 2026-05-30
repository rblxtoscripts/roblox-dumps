-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local v1 = script:GetAttributes()
local TweenModuleBlur = Instance.new("BlurEffect", Lighting)
TweenModuleBlur.Name = "TweenModuleBlur"
TweenModuleBlur.Size = 0
local LocalPlayer = Players.LocalPlayer
local t = {}
local t2 = {}
local function getSoundsFolder() --[[ getSoundsFolder | Line: 33 | Upvalues: ReplicatedStorage (copy), v1 (copy) ]]
	for v12, v2 in ReplicatedStorage:GetDescendants() do
		if v2:IsA("Folder") and v2.Name == v1.SoundsFolder then
			return v2
		end
	end
	return nil
end
function t.AddButton(p1, p2, p3, p4, p5, p6) --[[ AddButton | Line: 45 | Upvalues: TweenModuleBlur (copy), t2 (copy), TweenService (copy), v1 (copy), getSoundsFolder (copy), SoundService (copy) ]]
	local Size = p2.Size
	if p2 == "Blur" then
		TweenModuleBlur.Size = if p3 == "On" then 24 else 0
	else
		if p3 then
			p3.Visible = false
			p3.Position = UDim2.new(0.5, 0, -2, 0)
			table.insert(t2, p3)
		end
		local v4 = if p6 == true then Instance.new("UIScale", p2) else p6
		if p6 ~= true then
			local _ = typeof(p6) == "number"
		end
		if typeof(p2) ~= "string" then
			p2.MouseButton1Down:Connect(function() --[[ Line: 101 | Upvalues: v4 (ref), TweenService (ref), p2 (copy), Size (copy) ]]
				if v4 then
					TweenService:Create(v4, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Scale = 0.95
					}):Play()
				else
					TweenService:Create(p2, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Size = Size - UDim2.new(0, 5, 0, 5)
					}):Play()
				end
			end)
			p2.MouseLeave:Connect(function() --[[ Line: 111 | Upvalues: p5 (copy), TweenService (ref), p2 (copy), v1 (ref), Size (copy), v4 (ref) ]]
				if p5 then
					TweenService:Create(p2, TweenInfo.new(v1.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Rotation = 0,
						Size = Size
					}):Play()
					return
				end
				if v4 then
					TweenService:Create(v4, TweenInfo.new(v1.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Scale = 1
					}):Play()
				else
					TweenService:Create(p2, TweenInfo.new(v1.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Size = Size
					}):Play()
				end
			end)
			p2.MouseEnter:Connect(function() --[[ Line: 123 | Upvalues: p5 (copy), TweenService (ref), p2 (copy), v1 (ref), Size (copy), v4 (ref) ]]
				if p5 then
					TweenService:Create(p2, TweenInfo.new(v1.Time, Enum.EasingStyle[v1.ButtonStyle], Enum.EasingDirection.Out), {
						Rotation = 10,
						Size = Size + UDim2.new(0, 3, 0, 3)
					}):Play()
					return
				end
				if v4 then
					TweenService:Create(v4, TweenInfo.new(v1.Time, Enum.EasingStyle[v1.ButtonStyle], Enum.EasingDirection.Out), {
						Scale = 1.05
					}):Play()
				else
					TweenService:Create(p2, TweenInfo.new(v1.Time, Enum.EasingStyle[v1.ButtonStyle], Enum.EasingDirection.Out), {
						Size = Size + UDim2.new(0, 3, 0, 3)
					}):Play()
				end
			end)
			p2.MouseButton1Up:Connect(function() --[[ Line: 135 | Upvalues: v4 (ref), TweenService (ref), v1 (ref), p2 (copy), Size (copy) ]]
				if v4 then
					TweenService:Create(v4, TweenInfo.new(v1.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Scale = 1
					}):Play()
				else
					TweenService:Create(p2, TweenInfo.new(v1.Time, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						Size = Size
					}):Play()
				end
			end)
			p2.MouseButton1Click:Connect(function() --[[ Line: 143 | Upvalues: v1 (ref), getSoundsFolder (ref), p4 (copy), SoundService (ref), p3 (copy), t2 (ref), TweenService (ref), TweenModuleBlur (ref) ]]
				if v1.SoundsFolder then
					if type(v1.SoundsFolder) == "string" then
						v1.SoundsFolder = getSoundsFolder(v1.SoundsFolder)
					end
				else
					warn("UI Tweener: Can\'t find SoundsFolder, sounds will not function")
				end
				if v1.SoundsFolder and (p4 and v1.SoundsFolder:FindFirstChild(p4)) then
					SoundService:PlayLocalSound(v1.SoundsFolder[p4])
				end
				if not p3 then
					return
				end
				if p3.Visible then
					TweenModuleBlur.Size = 0
					TweenService:Create(p3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
						Position = UDim2.new(0.5, 0, -2, 0)
					}):Play()
					task.wait(0.3)
					p3.Visible = false
				else
					for v12, v2 in t2 do
						if v2.Visible then
							if pcall(function() --[[ Line: 161 | Upvalues: TweenService (ref), v2 (copy), v1 (ref) ]]
								TweenService:Create(v2, TweenInfo.new(v1.Time, Enum.EasingStyle[v1.FrameStyle], Enum.EasingDirection.Out), {
									Position = UDim2.new(0.5, 0, -2, 0)
								}):Play()
							end) then
								task.delay(0.3, function() --[[ Line: 168 | Upvalues: v2 (copy) ]]
									v2.Visible = false
								end)
								continue
							end
							table.remove(t2, v12)
						end
					end
					p3.Visible = true
					TweenService:Create(p3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}):Play()
					task.wait(0.1)
					TweenModuleBlur.Size = 24
				end
			end)
		elseif p2 == "Open" then
			for v5, v6 in t2 do
				if v6.Visible then
					if pcall(function() --[[ Line: 74 | Upvalues: TweenService (ref), v6 (copy), v1 (ref) ]]
						TweenService:Create(v6, TweenInfo.new(v1.Time, Enum.EasingStyle[v1.FrameStyle], Enum.EasingDirection.Out), {
							Position = UDim2.new(0.5, 0, -2, 0)
						}):Play()
					end) then
						task.delay(0.3, function() --[[ Line: 81 | Upvalues: v6 (copy) ]]
							v6.Visible = false
						end)
						continue
					end
					table.remove(t2, v5)
				end
			end
			p3.Visible = true
			TweenService:Create(p3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				Position = UDim2.new(0.5, 0, 0.5, 0)
			}):Play()
			task.wait(0.1)
			TweenModuleBlur.Size = 24
		elseif p2 == "Close" then
			TweenModuleBlur.Size = 0
			TweenService:Create(p3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
				Position = UDim2.new(0.5, 0, -2, 0)
			}):Play()
			task.wait(0.3)
			p3.Visible = false
		end
	end
end
return t