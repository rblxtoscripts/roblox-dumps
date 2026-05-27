-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("SettingsService")
local v3 = Sonar("InputTypeService")
local v4 = Sonar("FormatString")
local v5 = Sonar("Debounce")
local v6 = Sonar("PlayerWrapper").GetClient()
local t2 = {
	Volume = {
		Template = "SliderTemplate",
		Init = function(p1, p2) --[[ Init | Line: 22 | Upvalues: v1 (copy), v6 (copy), v5 (copy) ]]
			p1:GiveTask(v1.AddComponent("InputSlider", {
				Instance = v1.FindElement(p1.Instance, "InputSlider"),
				MinValue = p2.MinValue,
				MaxValue = p2.MaxValue,
				DefaultValue = v6:GetSetting(p2.Name),
				OnInput = { v5.new(function(p1, p22) --[[ Line: 32 | Upvalues: v6 (ref), p2 (copy) ]]
						v6:ChangeSetting(p2.Name, p22.NewValue)
					end, 0.2), function(p1, p22) --[[ Line: 35 | Upvalues: v6 (ref), p2 (copy) ]]
						v6:SetSetting(p2.Name, p22.NewValue)
					end }
			}, p1))
		end
	},
	States = {
		Template = "ToggleTemplate",
		Init = function(p1, p2) --[[ Init | Line: 44 | Upvalues: v1 (copy), v6 (copy) ]]
			p1:GiveTask(v1.AddComponent("ToggleSlider", {
				Instance = v1.FindElement(p1.Instance, "ToggleSlider"),
				DefaultValue = v6:GetSetting(p2.Name),
				GetValue = function() --[[ GetValue | Line: 50 | Upvalues: v6 (ref), p2 (copy) ]]
					return v6:GetSetting(p2.Name)
				end,
				OnToggle = function(p1, p22) --[[ OnToggle | Line: 53 | Upvalues: v6 (ref), p2 (copy) ]]
					v6:ChangeSetting(p2.Name, p22)
				end,
				Changed = v6:GetSettingChangedSignal(p2.Name)
			}, p1))
		end
	},
	Choice = {
		Template = "DropdownTemplate",
		Init = function(p1, p2) --[[ Init | Line: 62 | Upvalues: v1 (copy), v6 (copy) ]]
			p1:GiveTask(v1.AddComponent("Dropdown", {
				HideOptionWhenSelected = true,
				Instance = v1.FindElement(p1.Instance, "Dropdown"),
				Options = p2.Choices,
				GetValue = function() --[[ GetValue | Line: 68 | Upvalues: v6 (ref), p2 (copy) ]]
					return v6:GetSetting(p2.Name)
				end,
				OnSelected = function(p1, p22) --[[ OnSelected | Line: 71 | Upvalues: v6 (ref), p2 (copy) ]]
					v6:ChangeSetting(p2.Name, p22.Name)
				end,
				Changed = v6:GetSettingChangedSignal(p2.Name)
			}, p1))
		end
	}
}
function t.new(p1) --[[ new | Line: 80 | Upvalues: t (copy), v1 (copy), v2 (copy), v3 (copy), t2 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.GuiProvider = p1
	v22.SettingsScreen = p1.GuiScreens.Settings
	local function buildSettings(p1, p2) --[[ buildSettings | Line: 86 | Upvalues: v22 (copy), v1 (ref), v2 (ref), v3 (ref), t2 (ref), v4 (ref) ]]
		if v22._initialized then
			return
		end
		v22._initialized = true
		v22.ContentFrame = v1.FindElement(v22.SettingsScreen.Instance, "ContentFrame")
		for v12, v23 in v2.GetAllSettings() do
			if (not v23.Platforms or table.find(v23.Platforms, v3.GetInputTypeName())) and v23.Category then
				local v32 = t2[v23.Type]
				if v32 then
					v1.AddComponent("GuiObject", {
						Template = v22.ContentFrame:FindFirstChild(v32.Template),
						Parent = v22.ContentFrame,
						Name = v23.Name,
						OnCreated = function(p1) --[[ OnCreated | Line: 114 | Upvalues: v1 (ref), v4 (ref), v23 (copy), v32 (copy) ]]
							local v12 = v1.FindElement(p1.Instance, "NameLabel")
							if v12 then
								v12.Text = v4.GetDisplayName(v23)
							end
							local v2 = v1.FindElement(p1.Instance, "DescriptionLabel")
							if v2 then
								v2.Text = v23.Description or ""
							end
							local v3 = v1.FindElement(p1.Instance, "ImageLabel")
							if not v3 then
								v32.Init(p1, v23)
								return
							end
							v3.Image = v23.Icon or ""
							v32.Init(p1, v23)
						end,
						LayoutOrder = v23.LayoutOrder or nil
					})
				end
			end
		end
	end
	v22.SettingsScreen:AddCallback("OnOpen", buildSettings)
	v1.AddComponent("CloseButton", {
		Instance = v1.FindElement(v22.SettingsScreen.Instance, "CloseButton")
	})
	v1.BindToTag("HUD_SettingsButton", function(p1) --[[ Line: 143 | Upvalues: v1 (ref) ]]
		v1.AddComponent("Button", {
			Instance = p1,
			OnClick = function() --[[ OnClick | Line: 146 | Upvalues: v1 (ref) ]]
				v1.OpenScreenGroup("Settings", {
					Args = {}
				})
			end
		})
	end)
	return v22
end
return t