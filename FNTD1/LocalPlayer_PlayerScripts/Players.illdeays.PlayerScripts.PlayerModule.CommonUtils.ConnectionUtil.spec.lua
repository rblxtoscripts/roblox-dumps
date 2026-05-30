-- https://lua.expert/
local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local expect = JestGlobals.expect
local it = JestGlobals.it
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local ConnectionUtil = require(script.Parent.ConnectionUtil)
JestGlobals.describe("ConnectionUtil", function() --[[ Line: 13 | Upvalues: it (copy), ConnectionUtil (copy), expect (copy), Signal (copy) ]]
	it("should instantiate", function() --[[ Line: 14 | Upvalues: ConnectionUtil (ref), expect (ref) ]]
		expect((ConnectionUtil.new())).never.toBeNil()
	end)
	it("should track a connection", function() --[[ Line: 20 | Upvalues: ConnectionUtil (ref), Signal (ref), expect (ref) ]]
		local v1 = ConnectionUtil.new()
		local v2 = Signal.new()
		local v3 = ""
		v1:trackConnection("Signal", v2:Connect(function(p1) --[[ Line: 27 | Upvalues: v3 (ref) ]]
			v3 = p1
		end))
		v2:fire("Testing")
		expect(v3).toBe("Testing")
	end)
	it("should disconnect from signal", function() --[[ Line: 36 | Upvalues: ConnectionUtil (ref), Signal (ref), expect (ref) ]]
		local v1 = ConnectionUtil.new()
		local v2 = Signal.new()
		local v3 = ""
		v1:trackConnection("Signal", v2:Connect(function(p1) --[[ Line: 43 | Upvalues: v3 (ref) ]]
			v3 = p1
		end))
		v1:disconnect("Signal")
		v2:fire("Testing")
		expect(v3).toBe("")
	end)
	it("should disconnect from all", function() --[[ Line: 53 | Upvalues: ConnectionUtil (ref), Signal (ref), expect (ref) ]]
		local v1 = ConnectionUtil.new()
		local v2 = Signal.new()
		local v3 = Signal.new()
		local v4 = Signal.new()
		local v5 = ""
		local v6 = ""
		local v7 = ""
		v1:trackConnection("Signal", v2:Connect(function(p1) --[[ Line: 65 | Upvalues: v5 (ref) ]]
			v5 = p1
		end))
		v1:trackConnection("Signal1", v3:Connect(function(p1) --[[ Line: 71 | Upvalues: v6 (ref) ]]
			v6 = p1
		end))
		v1:trackConnection("Signal2", v4:Connect(function(p1) --[[ Line: 77 | Upvalues: v7 (ref) ]]
			v7 = p1
		end))
		v1:disconnectAll()
		v2:fire("TestingPrimary")
		v2:fire("TestingSecondary")
		v2:fire("TestingTertiary")
		expect(v5).toBe("")
		expect(v6).toBe("")
		expect(v7).toBe("")
	end)
	it("should call manual disconnect", function() --[[ Line: 92 | Upvalues: ConnectionUtil (ref), expect (ref) ]]
		local v1 = ConnectionUtil.new()
		local v2 = ""
		v1:trackBoundFunction("Manual", function() --[[ Line: 96 | Upvalues: v2 (ref) ]]
			v2 = "Disconnected"
		end)
		v1:disconnect("Manual")
		expect(v2).toBe("Disconnected")
	end)
end)