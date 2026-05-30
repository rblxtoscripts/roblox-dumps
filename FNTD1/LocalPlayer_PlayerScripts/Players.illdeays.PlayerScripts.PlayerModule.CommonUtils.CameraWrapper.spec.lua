-- https://lua.expert/
local CorePackages = game:GetService("CorePackages")
local JestGlobals = require(CorePackages.Packages.Dev.JestGlobals)
local expect = JestGlobals.expect
local it = JestGlobals.it
local waitForEvents = require(CorePackages.Workspace.Packages.TestUtils).DeferredLuaHelpers.waitForEvents
local CameraWrapper = require(script.Parent.CameraWrapper)
JestGlobals.describe("CameraWrapper", function() --[[ Line: 12 | Upvalues: it (copy), CameraWrapper (copy), expect (copy), waitForEvents (copy) ]]
	it("should instantiate", function() --[[ Line: 13 | Upvalues: CameraWrapper (ref), expect (ref) ]]
		expect((CameraWrapper.new())).never.toBeNil()
	end)
	it("should return updated camera", function() --[[ Line: 19 | Upvalues: CameraWrapper (ref), expect (ref), waitForEvents (ref) ]]
		local v1 = CameraWrapper.new()
		v1:Enable()
		local Camera = Instance.new("Camera")
		Camera.Parent = game.Workspace
		expect(v1:getCamera()).toBe(game.Workspace.CurrentCamera)
		expect(v1:getCamera()).never.toBe(Camera)
		game.Workspace.CurrentCamera = Camera
		waitForEvents()
		expect(v1:getCamera()).toBe(game.Workspace.CurrentCamera)
		expect(v1:getCamera()).toBe(Camera)
	end)
end)