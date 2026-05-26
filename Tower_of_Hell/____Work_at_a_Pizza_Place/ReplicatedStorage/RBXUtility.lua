-- https://lua.expert/
local t = {}
local v1 = string
local v2 = math
local v3 = table
local v4 = error
local v5 = tonumber
local v6 = tostring
local v7 = type
local v8 = setmetatable
local v9 = pairs
local v10 = ipairs
local v11 = assert
local t2 = {
	buffer = {},
	New = function(p1) --[[ New | Line: 52 | Upvalues: v8 (copy) ]]
		local t = {}
		v8(t, p1)
		p1.__index = p1
		t.buffer = {}
		return t
	end,
	Append = function(p1, p2) --[[ Append | Line: 60 ]]
		p1.buffer[#p1.buffer + 1] = p2
	end,
	ToString = function(p1) --[[ ToString | Line: 64 | Upvalues: v3 (copy) ]]
		return v3.concat(p1.buffer)
	end
}
local t3 = {
	backslashes = {
		["\8"] = "\\b",
		["\t"] = "\\t",
		["\n"] = "\\n",
		["\f"] = "\\f",
		["\r"] = "\\r",
		["\""] = "\\\"",
		["\\"] = "\\\\",
		["/"] = "\\/"
	},
	New = function(p1) --[[ New | Line: 81 | Upvalues: t2 (copy), v8 (copy) ]]
		local t = {
			writer = t2:New()
		}
		v8(t, p1)
		p1.__index = p1
		return t
	end,
	Append = function(p1, p2) --[[ Append | Line: 89 ]]
		p1.writer:Append(p2)
	end,
	ToString = function(p1) --[[ ToString | Line: 93 ]]
		return p1.writer:ToString()
	end,
	Write = function(p1, p2) --[[ Write | Line: 97 | Upvalues: v7 (copy) ]]
		local v1 = v7(p2)
		if v1 == "nil" then
			p1:WriteNil()
			return
		end
		if v1 == "boolean" then
			p1:WriteString(p2)
			return
		end
		if v1 == "number" then
			p1:WriteString(p2)
			return
		end
		if v1 == "string" then
			p1:ParseString(p2)
			return
		end
		if v1 == "table" then
			p1:WriteTable(p2)
			return
		end
		if v1 == "function" then
			p1:WriteFunction(p2)
			return
		end
		if v1 == "thread" then
			p1:WriteError(p2)
			return
		end
		if v1 ~= "userdata" then
			return
		end
		p1:WriteError(p2)
	end,
	WriteNil = function(p1) --[[ WriteNil | Line: 118 ]]
		p1:Append("null")
	end,
	WriteString = function(p1, p2) --[[ WriteString | Line: 122 | Upvalues: v6 (copy) ]]
		p1:Append((v6(p2)))
	end,
	ParseString = function(p1, p2) --[[ ParseString | Line: 126 | Upvalues: v1 (copy) ]]
		p1:Append("\"")
		p1:Append(v1.gsub(p2, "[%z%c\\\"/]", function(p12) --[[ Line: 128 | Upvalues: p1 (copy), v1 (ref) ]]
			local v12 = p1.backslashes[p12]
			if v12 then
				return v12
			else
				return v1.format("\\u%.4X", v1.byte(p12))
			end
		end))
		p1:Append("\"")
	end,
	IsArray = function(p1, p2) --[[ IsArray | Line: 136 | Upvalues: v7 (copy), v2 (copy), v9 (copy) ]]
		local v1 = 0
		for v3, v4 in v9(p2) do
			local v22
			v22 = v7(v3) == "number" and (v3 > 0 and v2.floor(v3) == v3)
			if not v22 then
				return false, "{", "}"
			end
			v1 = v2.max(v1, v3)
		end
		return true, "[", "]", v1
	end,
	WriteTable = function(p1, p2) --[[ WriteTable | Line: 156 | Upvalues: v9 (copy) ]]
		local v1, v2, v3, v4 = p1:IsArray(p2)
		p1:Append(v2)
		if v1 then
			for i = 1, v4 do
				p1:Write(p2[i])
				if i < v4 then
					p1:Append(",")
				end
			end
		else
			local v5 = true
			for v6, v7 in v9(p2) do
				if not v5 then
					p1:Append(",")
				end
				p1:ParseString(v6)
				p1:Append(":")
				p1:Write(v7)
				v5 = false
			end
		end
		p1:Append(v3)
	end,
	WriteError = function(p1, p2) --[[ WriteError | Line: 181 | Upvalues: v4 (copy), v1 (copy), v6 (copy) ]]
		v4(v1.format("Encoding of %s unsupported", (v6(p2))))
	end,
	WriteFunction = function(p1, p2) --[[ WriteFunction | Line: 187 ]]
		if p2 == Null then
			p1:WriteNil()
		else
			p1:WriteError(p2)
		end
	end
}
local t4 = {
	s = "",
	i = 0,
	New = function(p1, p2) --[[ New | Line: 200 | Upvalues: v8 (copy) ]]
		local t = {}
		v8(t, p1)
		p1.__index = p1
		t.s = if p2 then p2 else t.s
		return t
	end,
	Peek = function(p1) --[[ Peek | Line: 208 | Upvalues: v1 (copy) ]]
		local v12 = p1.i + 1
		if v12 <= #p1.s then
			return v1.sub(p1.s, v12, v12)
		else
			return nil
		end
	end,
	Next = function(p1) --[[ Next | Line: 216 | Upvalues: v1 (copy) ]]
		p1.i = p1.i + 1
		if p1.i <= #p1.s then
			return v1.sub(p1.s, p1.i, p1.i)
		else
			return nil
		end
	end,
	All = function(p1) --[[ All | Line: 224 ]]
		return p1.s
	end
}
local t5 = {
	escapes = {
		t = "\t",
		n = "\n",
		f = "\f",
		r = "\r",
		b = "\8"
	},
	New = function(p1, p2) --[[ New | Line: 238 | Upvalues: t4 (copy), v8 (copy) ]]
		local t = {
			reader = t4:New(p2)
		}
		v8(t, p1)
		p1.__index = p1
		return t
	end,
	Read = function(p1) --[[ Read | Line: 246 | Upvalues: v4 (copy), v1 (copy) ]]
		p1:SkipWhiteSpace()
		local v12 = p1:Peek()
		if v12 == nil then
			v4(v1.format("Nil string: \'%s\'", p1:All()))
			return
		end
		if v12 == "{" then
			return p1:ReadObject()
		end
		if v12 == "[" then
			return p1:ReadArray()
		end
		if v12 == "\"" then
			return p1:ReadString()
		end
		if v1.find(v12, "[%+%-%d]") then
			return p1:ReadNumber()
		end
		if v12 == "t" then
			return p1:ReadTrue()
		end
		if v12 == "f" then
			return p1:ReadFalse()
		end
		if v12 == "n" then
			return p1:ReadNull()
		end
		if v12 == "/" then
			p1:ReadComment()
			return p1:Read()
		else
			return nil
		end
	end,
	ReadTrue = function(p1) --[[ ReadTrue | Line: 275 ]]
		p1:TestReservedWord({ "t", "r", "u", "e" })
		return true
	end,
	ReadFalse = function(p1) --[[ ReadFalse | Line: 280 ]]
		p1:TestReservedWord({ "f", "a", "l", "s", "e" })
		return false
	end,
	ReadNull = function(p1) --[[ ReadNull | Line: 285 ]]
		p1:TestReservedWord({ "n", "u", "l", "l" })
		return nil
	end,
	TestReservedWord = function(p1, p2) --[[ TestReservedWord | Line: 290 | Upvalues: v10 (copy), v4 (copy), v1 (copy), v3 (copy) ]]
		for v12, v2 in v10(p2) do
			if p1:Next() ~= v2 then
				v4(v1.format("Error reading \'%s\': %s", v3.concat(p2), p1:All()))
			end
		end
	end,
	ReadNumber = function(p1) --[[ ReadNumber | Line: 301 | Upvalues: v1 (copy), v5 (copy), v4 (copy) ]]
		local v12 = p1:Next()
		local v2 = p1:Peek()
		while v2 ~= nil and v1.find(v2, "[%+%-%d%.eE]") do
			v12 = v12 .. p1:Next()
			v2 = p1:Peek()
		end
		local v42 = v5(v12)
		if v42 == nil then
			v4(v1.format("Invalid number: \'%s\'", v42))
		else
			return v42
		end
	end,
	ReadString = function(p1) --[[ ReadString | Line: 320 | Upvalues: v11 (copy), v5 (copy), v1 (copy) ]]
		local v12 = ""
		v11(p1:Next() == "\"")
		while p1:Peek() ~= "\"" do
			local v3 = p1:Next()
			if v3 == "\\" then
				local v4 = p1:Next()
				v3 = if p1.escapes[v4] then p1.escapes[v4] else v4
			end
			v12 = v12 .. v3
		end
		v11(if p1:Next() == "\"" then true else false)
		local function f6(p1) --[[ Line: 334 | Upvalues: v5 (ref), v1 (ref) ]]
			return v1.char((v5(p1, 16)))
		end
		return v1.gsub(v12, "u%x%x(%x%x)", f6)
	end,
	ReadComment = function(p1) --[[ ReadComment | Line: 343 | Upvalues: v11 (copy), v4 (copy), v1 (copy) ]]
		v11(p1:Next() == "/")
		local v2 = p1:Next()
		if v2 == "/" then
			p1:ReadSingleLineComment()
			return
		end
		if v2 == "*" then
			p1:ReadBlockComment()
		else
			v4(v1.format("Invalid comment: %s", p1:All()))
		end
	end,
	ReadBlockComment = function(p1) --[[ ReadBlockComment | Line: 357 | Upvalues: v4 (copy), v1 (copy) ]]
		local v12 = false
		while not v12 do
			local v2 = p1:Next()
			if v2 == "*" and p1:Peek() == "/" then
				v12 = true
			end
			if not v12 and (v2 == "/" and p1:Peek() == "*") then
				v4(v1.format("Invalid comment: %s, \'/*\' illegal.", p1:All()))
			end
		end
		p1:Next()
	end,
	ReadSingleLineComment = function(p1) --[[ ReadSingleLineComment | Line: 375 ]]
		local v1 = p1:Next()
		while v1 ~= "\r" and v1 ~= "\n" do
			v1 = p1:Next()
		end
	end,
	ReadArray = function(p1) --[[ ReadArray | Line: 382 | Upvalues: v11 (copy), v4 (copy), v1 (copy) ]]
		local t = {}
		v11(p1:Next() == "[")
		local v2 = if p1:Peek() == "]" then true else false
		while not v2 do
			t[#t + 1] = p1:Read()
			p1:SkipWhiteSpace()
			if p1:Peek() == "]" then
				v2 = true
			end
			if not v2 then
				local v3 = p1:Next()
				if v3 == "," then
					continue
				end
				v4(v1.format("Invalid array: \'%s\' due to: \'%s\'", p1:All(), v3))
			end
		end
		v11(if p1:Next() == "]" then true else false)
		return t
	end,
	ReadObject = function(p1) --[[ ReadObject | Line: 409 | Upvalues: v11 (copy), v7 (copy), v4 (copy), v1 (copy) ]]
		local t = {}
		v11(p1:Next() == "{")
		local v2 = if p1:Peek() == "}" then true else false
		while not v2 do
			local v3 = p1:Read()
			if v7(v3) ~= "string" then
				v4(v1.format("Invalid non-string object key: %s", v3))
			end
			p1:SkipWhiteSpace()
			local v42 = p1:Next()
			if v42 ~= ":" then
				v4(v1.format("Invalid object: \'%s\' due to: \'%s\'", p1:All(), v42))
			end
			p1:SkipWhiteSpace()
			t[v3] = p1:Read()
			p1:SkipWhiteSpace()
			if p1:Peek() == "}" then
				v2 = true
			end
			if not v2 then
				local v5 = p1:Next()
				if v5 == "," then
					continue
				end
				v4(v1.format("Invalid array: \'%s\' near: \'%s\'", p1:All(), v5))
			end
		end
		v11(if p1:Next() == "}" then true else false)
		return t
	end,
	SkipWhiteSpace = function(p1) --[[ SkipWhiteSpace | Line: 452 | Upvalues: v1 (copy) ]]
		local v12 = p1:Peek()
		while v12 ~= nil and v1.find(v12, "[%s/]") do
			if v12 == "/" then
				p1:ReadComment()
			else
				p1:Next()
			end
			v12 = p1:Peek()
		end
	end,
	Peek = function(p1) --[[ Peek | Line: 464 ]]
		return p1.reader:Peek()
	end,
	Next = function(p1) --[[ Next | Line: 468 ]]
		return p1.reader:Next()
	end,
	All = function(p1) --[[ All | Line: 472 ]]
		return p1.reader:All()
	end
}
function Encode(p1) --[[ Encode | Line: 476 | Upvalues: t3 (copy) ]]
	local v1 = t3:New()
	v1:Write(p1)
	return v1:ToString()
end
function Decode(p1) --[[ Decode | Line: 482 | Upvalues: t5 (copy) ]]
	return t5:New(p1):Read()
end
function Null() --[[ Null | Line: 487 ]]
	return Null
end
function t.DecodeJSON(p1) --[[ Line: 492 | Upvalues: v7 (copy) ]]
	pcall(function() --[[ Line: 493 ]]
		warn("RbxUtility.DecodeJSON is deprecated, please use Game:GetService(\'HttpService\'):JSONDecode() instead.")
	end)
	if v7(p1) == "string" then
		return Decode(p1)
	else
		print("RbxUtil.DecodeJSON expects string argument!")
		return nil
	end
end
function t.EncodeJSON(p1) --[[ Line: 502 ]]
	pcall(function() --[[ Line: 503 ]]
		warn("RbxUtility.EncodeJSON is deprecated, please use Game:GetService(\'HttpService\'):JSONEncode() instead.")
	end)
	return Encode(p1)
end
function t.MakeWedge(p1, p2, p3, p4) --[[ Line: 524 ]]
	return game:GetService("Terrain"):AutoWedgeCell(p1, p2, p3)
end
function t.SelectTerrainRegion(p1, p2, p3, p4) --[[ Line: 528 | Upvalues: v11 (copy), v7 (copy), v4 (copy), v3 (copy), v9 (copy) ]]
	local Terrain = game:GetService("Workspace"):FindFirstChild("Terrain")
	if not Terrain then
		return
	end
	v11(p1)
	v11(p2)
	if not v7(p1) == "Region3" then
		v4("regionToSelect (first arg), should be of type Region3, but is type", (v7(p1)))
	end
	if not v7(p2) == "BrickColor" then
		v4("color (second arg), should be of type BrickColor, but is type", (v7(p2)))
	end
	local GetCell = Terrain.GetCell
	local WorldToCellPreferSolid = Terrain.WorldToCellPreferSolid
	local CellCenterToWorld = Terrain.CellCenterToWorld
	local Empty = Enum.CellMaterial.Empty
	local SelectionContainer = Instance.new("Model")
	SelectionContainer.Name = "SelectionContainer"
	SelectionContainer.Archivable = false
	if p4 then
		SelectionContainer.Parent = p4
	else
		SelectionContainer.Parent = game:GetService("Workspace")
	end
	local v1 = nil
	local v2 = 0
	local t = {}
	local t2 = {}
	local SelectionPart = Instance.new("Part")
	SelectionPart.Name = "SelectionPart"
	SelectionPart.Transparency = 1
	SelectionPart.Anchored = true
	SelectionPart.Locked = true
	SelectionPart.CanCollide = false
	SelectionPart.Size = Vector3.new(4.2, 4.2, 4.2)
	local SelectionBox = Instance.new("SelectionBox")
	local function Region3ToRegion3int16(p1) --[[ Region3ToRegion3int16 | Line: 576 | Upvalues: WorldToCellPreferSolid (copy), Terrain (copy) ]]
		local v1 = WorldToCellPreferSolid(Terrain, p1.CFrame.p - p1.Size / 2 + Vector3.new(2, 2, 2))
		local v2 = WorldToCellPreferSolid(Terrain, p1.CFrame.p + p1.Size / 2 - Vector3.new(2, 2, 2))
		local v3 = Vector3int16.new(v2.x, v2.y, v2.z)
		return Region3int16.new(Vector3int16.new(v1.x, v1.y, v1.z), v3)
	end
	function createAdornment(p1) --[[ createAdornment | Line: 590 | Upvalues: t2 (copy), v3 (ref), SelectionPart (copy), SelectionBox (copy), SelectionContainer (copy) ]]
		local v1, v2
		if #t2 > 0 then
			v1 = t2[1].part
			v2 = t2[1].box
			v3.remove(t2, 1)
			v2.Visible = true
		else
			local v32 = SelectionPart:Clone()
			v32.Archivable = false
			local v4 = SelectionBox:Clone()
			v4.Archivable = false
			v4.Adornee = v32
			v4.Parent = SelectionContainer
			v4.Adornee = v32
			v4.Parent = SelectionContainer
			v2 = v4
			v1 = v32
		end
		if p1 then
			v2.Color = p1
		end
		return v1, v2
	end
	function cleanUpAdornments() --[[ cleanUpAdornments | Line: 623 | Upvalues: v9 (ref), t (ref), v1 (ref), t2 (copy), v3 (ref) ]]
		for v12, v2 in v9(t) do
			if v2.KeepAlive ~= v1 then
				v2.SelectionBox.Visible = false
				v3.insert(t2, {
					part = v2.SelectionPart,
					box = v2.SelectionBox
				})
				t[v12] = nil
			end
		end
	end
	function incrementAliveCounter() --[[ incrementAliveCounter | Line: 635 | Upvalues: v2 (ref) ]]
		v2 = v2 + 1
		if not (v2 > 1000000) then
			return v2
		end
		v2 = 0
		return v2
	end
	function adornFullCellsInRegion(p1, p2) --[[ adornFullCellsInRegion | Line: 644 | Upvalues: WorldToCellPreferSolid (copy), Terrain (copy), v1 (ref), GetCell (copy), Empty (copy), CellCenterToWorld (copy), v9 (ref), t (ref) ]]
		local v3 = WorldToCellPreferSolid(Terrain, p1.CFrame.p - p1.Size / 2 + Vector3.new(2, 2, 2))
		local v4 = WorldToCellPreferSolid(Terrain, p1.CFrame.p + p1.Size / 2 - Vector3.new(2, 2, 2))
		v1 = incrementAliveCounter()
		for i = v3.y, v4.y do
			for j = v3.z, v4.z do
				for k = v3.x, v4.x do
					if GetCell(Terrain, k, i, j) ~= Empty then
						local v5 = CellCenterToWorld(Terrain, k, i, j)
						local v6 = Vector3int16.new(k, i, j)
						local v7 = false
						for v8, v92 in v9(t) do
							if v8 == v6 then
								v92.KeepAlive = v1
								if p2 then
									v92.SelectionBox.Color = p2
								end
								v7 = true
								break
							end
						end
						if not v7 then
							local v10, v11 = createAdornment(p2)
							v10.Size = Vector3.new(4, 4, 4)
							v10.CFrame = CFrame.new(v5)
							t[v6] = {
								SelectionPart = v10,
								SelectionBox = v11,
								KeepAlive = v1
							}
						end
					end
				end
			end
		end
		cleanUpAdornments()
	end
	local v32 = p1
	local v42
	if p3 then
		local v5, v6 = createAdornment(p2)
		v5.Size = p1.Size
		v5.CFrame = p1.CFrame
		t.SelectionPart = v5
		t.SelectionBox = v6
		v42 = function(p1, p2) --[[ Line: 701 | Upvalues: v32 (ref), v5 (copy), v6 (copy) ]]
			if p1 and p1 ~= v32 then
				v32 = p1
				v5.Size = p1.Size
				v5.CFrame = p1.CFrame
			end
			if not p2 then
				return
			end
			v6.Color = p2
		end
	else
		adornFullCellsInRegion(p1, p2)
		v42 = function(p1, p2) --[[ Line: 714 | Upvalues: v32 (ref) ]]
			if not p1 or p1 == v32 then
				return
			end
			v32 = p1
			adornFullCellsInRegion(p1, p2)
		end
	end
	return v42, function() --[[ Line: 723 | Upvalues: v42 (ref), SelectionContainer (copy), t (ref) ]]
		v42 = nil
		if SelectionContainer then
			SelectionContainer:Destroy()
		end
		t = nil
	end
end
function t.CreateSignal() --[[ CreateSignal | Line: 775 | Upvalues: v4 (copy), v7 (copy), v9 (copy) ]]
	local t = {}
	local v1 = Instance.new("BindableEvent")
	local t2 = {}
	function t.connect(p1, p2) --[[ connect | Line: 782 | Upvalues: t (copy), v4 (ref), v7 (ref), v1 (copy), t2 (copy) ]]
		if p1 ~= t then
			v4("connect must be called with `:`, not `.`", 2)
		end
		if v7(p2) ~= "function" then
			v4("Argument #1 of connect must be a function, got a " .. v7(p2), 2)
		end
		local v12 = v1.Event:Connect(p2)
		t2[v12] = true
		local t3 = {
			disconnect = function(p1) --[[ disconnect | Line: 790 | Upvalues: v12 (copy), t2 (ref) ]]
				v12:Disconnect()
				t2[v12] = nil
			end
		}
		t3.Disconnect = t3.disconnect
		return t3
	end
	function t.disconnect(p1) --[[ disconnect | Line: 799 | Upvalues: t (copy), v4 (ref), v9 (ref), t2 (copy) ]]
		if p1 ~= t then
			v4("disconnect must be called with `:`, not `.`", 2)
		end
		for v1, v2 in v9(t2) do
			v1:Disconnect()
			t2[v1] = nil
		end
	end
	function t.wait(p1) --[[ wait | Line: 807 | Upvalues: t (copy), v4 (ref), v1 (copy) ]]
		if p1 == t then
			return v1.Event:Wait()
		end
		v4("wait must be called with `:`, not `.`", 2)
		return v1.Event:Wait()
	end
	function t.fire(p1, ...) --[[ fire | Line: 812 | Upvalues: t (copy), v4 (ref), v1 (copy) ]]
		if p1 ~= t then
			v4("fire must be called with `:`, not `.`", 2)
		end
		v1:Fire(...)
	end
	t.Connect = t.connect
	t.Disconnect = t.disconnect
	t.Wait = t.wait
	t.Fire = t.fire
	return t
end
local function Create_PrivImpl(p1) --[[ Create_PrivImpl | Line: 923 | Upvalues: v7 (copy), v4 (copy), v9 (copy), v6 (copy), t (copy) ]]
	if v7(p1) == "string" then
		return function(p12_2_2_2) --[[ Line: 931 | Upvalues: p1 (copy), v9 (ref), v7 (ref), v4 (ref), v6 (ref), t (ref) ]]
			local v1_2 = if p12_2_2_2 then p12_2_2_2 else {}
			local v2 = Instance.new(p1)
			local v3 = nil
			local v42 = nil
			for v5, v62 in v9(v1_2) do
				if v7(v5) == "string" then
					if v5 == "Parent" then
						v42 = v62
						continue
					end
					v2[v5] = v62
					continue
				end
				if v7(v5) == "number" then
					if v7(v62) ~= "userdata" then
						v4("Bad entry in Create body: Numeric keys must be paired with children, got a: " .. v7(v62), 2)
					end
					v62.Parent = v2
					continue
				end
				if v7(v5) == "table" and v5.__eventname then
					if v7(v62) ~= "function" then
						v4("Bad entry in Create body: Key `[Create.E\'" .. v5.__eventname .. "\']` must have a function value\n\t\t\t\t\t       got: " .. v6(v62), 2)
					end
					v2[v5.__eventname]:connect(v62)
					continue
				end
				if v5 == t.Create then
					if v7(v62) == "function" then
						if v3 then
							v4("Bad entry in Create body: Only one constructor function is allowed", 2)
						end
					else
						v4("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \n\t\t\t\t\t       got: " .. v6(v62), 2)
					end
					v3 = v62
					continue
				end
				v4("Bad entry (" .. v6(v5) .. " => " .. v6(v62) .. ") in Create body", 2)
			end
			if v3 then
				v3(v2)
			end
			if v42 then
				v2.Parent = v42
			end
			return v2
		end
	end
	v4("Argument of Create must be a string", 2)
	return function(p12_2_2_2) --[[ Line: 931 | Upvalues: p1 (copy), v9 (ref), v7 (ref), v4 (ref), v6 (ref), t (ref) ]]
		local v1_2 = if p12_2_2_2 then p12_2_2_2 else {}
		local v2 = Instance.new(p1)
		local v3 = nil
		local v42 = nil
		for v5, v62 in v9(v1_2) do
			if v7(v5) == "string" then
				if v5 == "Parent" then
					v42 = v62
					continue
				end
				v2[v5] = v62
				continue
			end
			if v7(v5) == "number" then
				if v7(v62) ~= "userdata" then
					v4("Bad entry in Create body: Numeric keys must be paired with children, got a: " .. v7(v62), 2)
				end
				v62.Parent = v2
				continue
			end
			if v7(v5) == "table" and v5.__eventname then
				if v7(v62) ~= "function" then
					v4("Bad entry in Create body: Key `[Create.E\'" .. v5.__eventname .. "\']` must have a function value\n\t\t\t\t\t       got: " .. v6(v62), 2)
				end
				v2[v5.__eventname]:connect(v62)
				continue
			end
			if v5 == t.Create then
				if v7(v62) == "function" then
					if v3 then
						v4("Bad entry in Create body: Only one constructor function is allowed", 2)
					end
				else
					v4("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \n\t\t\t\t\t       got: " .. v6(v62), 2)
				end
				v3 = v62
				continue
			end
			v4("Bad entry (" .. v6(v5) .. " => " .. v6(v62) .. ") in Create body", 2)
		end
		if v3 then
			v3(v2)
		end
		if v42 then
			v2.Parent = v42
		end
		return v2
	end
end
t.Create = v8({}, {
	__call = function(p1, ...) --[[ __call | Line: 1003 | Upvalues: v7 (copy), v4 (copy), v9 (copy), v6 (copy), t (copy) ]]
		local v1 = ...
		if v7(v1) == "string" then
			return function(p12_2_2_2) --[[ Line: 931 | Upvalues: v1 (copy), v9 (ref), v7 (ref), v4 (ref), v6 (ref), t (ref) ]]
				local v1_2 = if p12_2_2_2 then p12_2_2_2 else {}
				local v2 = Instance.new(v1)
				local v3 = nil
				local v42 = nil
				for v5, v62 in v9(v1_2) do
					if v7(v5) == "string" then
						if v5 == "Parent" then
							v42 = v62
							continue
						end
						v2[v5] = v62
						continue
					end
					if v7(v5) == "number" then
						if v7(v62) ~= "userdata" then
							v4("Bad entry in Create body: Numeric keys must be paired with children, got a: " .. v7(v62), 2)
						end
						v62.Parent = v2
						continue
					end
					if v7(v5) == "table" and v5.__eventname then
						if v7(v62) ~= "function" then
							v4("Bad entry in Create body: Key `[Create.E\'" .. v5.__eventname .. "\']` must have a function value\n\t\t\t\t\t       got: " .. v6(v62), 2)
						end
						v2[v5.__eventname]:connect(v62)
						continue
					end
					if v5 == t.Create then
						if v7(v62) == "function" then
							if v3 then
								v4("Bad entry in Create body: Only one constructor function is allowed", 2)
							end
						else
							v4("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \n\t\t\t\t\t       got: " .. v6(v62), 2)
						end
						v3 = v62
						continue
					end
					v4("Bad entry (" .. v6(v5) .. " => " .. v6(v62) .. ") in Create body", 2)
				end
				if v3 then
					v3(v2)
				end
				if v42 then
					v2.Parent = v42
				end
				return v2
			end
		end
		v4("Argument of Create must be a string", 2)
		return function(p12_2_2_2) --[[ Line: 931 | Upvalues: v1 (copy), v9 (ref), v7 (ref), v4 (ref), v6 (ref), t (ref) ]]
			local v1_2 = if p12_2_2_2 then p12_2_2_2 else {}
			local v2 = Instance.new(v1)
			local v3 = nil
			local v42 = nil
			for v5, v62 in v9(v1_2) do
				if v7(v5) == "string" then
					if v5 == "Parent" then
						v42 = v62
						continue
					end
					v2[v5] = v62
					continue
				end
				if v7(v5) == "number" then
					if v7(v62) ~= "userdata" then
						v4("Bad entry in Create body: Numeric keys must be paired with children, got a: " .. v7(v62), 2)
					end
					v62.Parent = v2
					continue
				end
				if v7(v5) == "table" and v5.__eventname then
					if v7(v62) ~= "function" then
						v4("Bad entry in Create body: Key `[Create.E\'" .. v5.__eventname .. "\']` must have a function value\n\t\t\t\t\t       got: " .. v6(v62), 2)
					end
					v2[v5.__eventname]:connect(v62)
					continue
				end
				if v5 == t.Create then
					if v7(v62) == "function" then
						if v3 then
							v4("Bad entry in Create body: Only one constructor function is allowed", 2)
						end
					else
						v4("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \n\t\t\t\t\t       got: " .. v6(v62), 2)
					end
					v3 = v62
					continue
				end
				v4("Bad entry (" .. v6(v5) .. " => " .. v6(v62) .. ") in Create body", 2)
			end
			if v3 then
				v3(v2)
			end
			if v42 then
				v2.Parent = v42
			end
			return v2
		end
	end
})
function t.Create.E(p1) --[[ Line: 1007 ]]
	return {
		__eventname = p1
	}
end
function t.Help(p1) --[[ Line: 1025 | Upvalues: t (copy) ]]
	if p1 == "DecodeJSON" or p1 == t.DecodeJSON then
		return "Function DecodeJSON.  Arguments: (string).  Side effect: returns a table with all parsed JSON values"
	end
	if p1 == "EncodeJSON" or p1 == t.EncodeJSON then
		return "Function EncodeJSON.  Arguments: (table).  Side effect: returns a string composed of argument table in JSON data format"
	end
	if p1 == "MakeWedge" or p1 == t.MakeWedge then
		return "Function MakeWedge. Arguments: (x, y, z, [default material]). Description: Makes a wedge at location x, y, z. Sets cell x, y, z to default material if parameter is provided, if not sets cell x, y, z to be whatever material it previously was. Returns true if made a wedge, false if the cell remains a block "
	end
	if p1 == "SelectTerrainRegion" or p1 == t.SelectTerrainRegion then
		return "Function SelectTerrainRegion. Arguments: (regionToSelect, color, selectEmptyCells, selectionParent). Description: Selects all terrain via a series of selection boxes within the regionToSelect (this should be a region3 value). The selection box color is detemined by the color argument (should be a brickcolor value). SelectionParent is the parent that the selection model gets placed to (optional).SelectEmptyCells is bool, when true will select all cells in the region, otherwise we only select non-empty cells. Returns a function that can update the selection,arguments to said function are a new region3 to select, and the adornment color (color arg is optional). Also returns a second function that takes no arguments and destroys the selection"
	end
	if p1 == "CreateSignal" or p1 == t.CreateSignal then
		return "Function CreateSignal. Arguments: None. Returns: The newly created Signal object. This object is identical to the RBXScriptSignal class used for events in Objects, but is a Lua-side object so it can be used to create custom events inLua code. Methods of the Signal object: :connect, :wait, :fire, :disconnect. For more info you can pass the method name to the Help function, or view the wiki page for this library. EG: Help(\'Signal:connect\')."
	end
	if p1 == "Signal:connect" then
		return "Method Signal:connect. Arguments: (function handler). Return: A connection object which can be used to disconnect the connection to this handler. Description: Connectes a handler function to this Signal, so that when |fire| is called the handler function will be called with the arguments passed to |fire|."
	end
	if p1 == "Signal:wait" then
		return "Method Signal:wait. Arguments: None. Returns: The arguments passed to the next call to |fire|. Description: This call does not return until the next call to |fire| is made, at which point it will return the values which were passed as arguments to that |fire| call."
	end
	if p1 == "Signal:fire" then
		return "Method Signal:fire. Arguments: Any number of arguments of any type. Returns: None. Description: This call will invoke any connected handler functions, and notify any waiting code attached to this Signal to continue, with the arguments passed to this function. Note: The calls to handlers are made asynchronously, so this call will return immediately regardless of how long it takes the connected handler functions to complete."
	end
	if p1 == "Signal:disconnect" then
		return "Method Signal:disconnect. Arguments: None. Returns: None. Description: This call disconnects all handlers attacched to this function, note however, it does NOT make waiting code continue, as is the behavior of normal Roblox events. This method can also be called on the connection object which is returned from Signal:connect to only disconnect a single handler, as opposed to this method, which will disconnect all handlers."
	end
	if p1 == "Create" then
		return "Function Create. Arguments: A table containing information about how to construct a collection of objects. Returns: The constructed objects. Descrition: Create is a very powerfull function, whose description is too long to fit here, and is best described via example, please see the wiki page for a description of how to use it."
	end
end
return t