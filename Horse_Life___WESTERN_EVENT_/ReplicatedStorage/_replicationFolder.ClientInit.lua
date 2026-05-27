-- https://lua.expert/
local Sonar, v1, v2
do
	do
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
		v1 = Sonar("MathUtils")
		v2 = Sonar("PlaceTypeService")
		local v3 = Sonar("Constants")
		local function init(p1, p2) --[[ init | Line: 17 | Upvalues: Sonar (copy), v1 (copy) ]]
			local v12 = os.clock()
			local function INITIALIZE() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (ref), p1 (copy), p2 (copy), v12 (copy), v1 (ref) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), p1 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: p1 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (p2 and os.clock() - v12 > 0.01) then
					return v2
				end
				print("[Init]", p1 .. ":", "took", v1.round(os.clock() - v12, 0.01), "seconds")
				return v2
			end
			if p2 then
				return INITIALIZE()
			else
				return task.spawn(INITIALIZE)
			end
		end
		task.spawn(function() --[[ Line: 47 | Upvalues: Sonar (copy) ]]
			Sonar("GameAnalytics"):initClient()
		end)
		task.spawn(function() --[[ Line: 54 | Upvalues: v2 (copy), v3 (copy), Sonar (copy) ]]
			if not v2.IsTestGame() or v3.IsStudio then
				Sonar("Gamebeast"):Setup()
			end
		end)
		task.spawn(function() --[[ Line: 64 | Upvalues: Sonar (copy) ]]
			Sonar("AdClient").StartAdAvailabilityManager()
		end)
		local v4 = os.clock()
		local v5 = "WrapperInit"
		local v6 = true
		(function() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v5 (copy), v6 (copy), v4 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v5 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v5 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v6 and os.clock() - v4 > 0.01) then
				return v2
			end
			print("[Init]", v5 .. ":", "took", v1.round(os.clock() - v4, 0.01), "seconds")
			return v2
		end)()
		local v7 = os.clock()
		local v8 = "Animal"
		local v9 = nil
		local function INITIALIZE() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v8 (copy), v9 (copy), v7 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v8 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v8 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v9 and os.clock() - v7 > 0.01) then
				return v2
			end
			print("[Init]", v8 .. ":", "took", v1.round(os.clock() - v7, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE)
		local v10 = os.clock()
		local v11 = "CharacterEffects"
		local v12 = nil
		local function INITIALIZE_2() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v11 (copy), v12 (copy), v10 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v11 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v11 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v12 and os.clock() - v10 > 0.01) then
				return v2
			end
			print("[Init]", v11 .. ":", "took", v1.round(os.clock() - v10, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_2)
		local v13 = os.clock()
		local v14 = "RagdollBindersClient"
		local v15 = true
		local function INITIALIZE_3() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v14 (copy), v15 (copy), v13 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v14 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v14 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v15 and os.clock() - v13 > 0.01) then
				return v2
			end
			print("[Init]", v14 .. ":", "took", v1.round(os.clock() - v13, 0.01), "seconds")
			return v2
		end
		local v16 = INITIALIZE_3()
		task.spawn(function() --[[ Line: 73 | Upvalues: v16 (copy) ]]
			v16:Init()
		end)
		local v17 = os.clock()
		local v18 = "EventService"
		local v19 = nil
		local function INITIALIZE_4() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v18 (copy), v19 (copy), v17 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v18 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v18 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v19 and os.clock() - v17 > 0.01) then
				return v2
			end
			print("[Init]", v18 .. ":", "took", v1.round(os.clock() - v17, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_4)
		local v20 = os.clock()
		local v21 = "HUDGui"
		local v22 = true
		(function() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v21 (copy), v22 (copy), v20 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v21 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v21 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v22 and os.clock() - v20 > 0.01) then
				return v2
			end
			print("[Init]", v21 .. ":", "took", v1.round(os.clock() - v20, 0.01), "seconds")
			return v2
		end)()
		local v23 = os.clock()
		local v24 = "StablesGui"
		local v25 = nil
		local function INITIALIZE_5() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v24 (copy), v25 (copy), v23 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v24 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v24 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v25 and os.clock() - v23 > 0.01) then
				return v2
			end
			print("[Init]", v24 .. ":", "took", v1.round(os.clock() - v23, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_5)
		local v26 = os.clock()
		local v27 = "AnimalEffects"
		local v28 = nil
		local function INITIALIZE_6() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v27 (copy), v28 (copy), v26 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v27 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v27 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v28 and os.clock() - v26 > 0.01) then
				return v2
			end
			print("[Init]", v27 .. ":", "took", v1.round(os.clock() - v26, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_6)
		local v29 = os.clock()
		local v30 = "GlobalWindService"
		local v31 = nil
		local function INITIALIZE_7() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v30 (copy), v31 (copy), v29 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v30 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v30 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v31 and os.clock() - v29 > 0.01) then
				return v2
			end
			print("[Init]", v30 .. ":", "took", v1.round(os.clock() - v29, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_7)
		local v32 = os.clock()
		local v33 = "PinnedMissionsGui"
		local v34 = nil
		local function INITIALIZE_8() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v33 (copy), v34 (copy), v32 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v33 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v33 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v34 and os.clock() - v32 > 0.01) then
				return v2
			end
			print("[Init]", v33 .. ":", "took", v1.round(os.clock() - v32, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_8)
		local v35 = os.clock()
		local v36 = "StockItemGui"
		local v37 = nil
		local function INITIALIZE_9() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v36 (copy), v37 (copy), v35 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v36 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v36 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v37 and os.clock() - v35 > 0.01) then
				return v2
			end
			print("[Init]", v36 .. ":", "took", v1.round(os.clock() - v35, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_9)
		local v38 = os.clock()
		local v39 = "LeaderboardGui"
		local v40 = nil
		local function INITIALIZE_10() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v39 (copy), v40 (copy), v38 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v39 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v39 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v40 and os.clock() - v38 > 0.01) then
				return v2
			end
			print("[Init]", v39 .. ":", "took", v1.round(os.clock() - v38, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_10)
		local v41 = os.clock()
		local v42 = "UpdateLogGui"
		local v43 = nil
		local function INITIALIZE_11() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v42 (copy), v43 (copy), v41 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v42 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v42 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v43 and os.clock() - v41 > 0.01) then
				return v2
			end
			print("[Init]", v42 .. ":", "took", v1.round(os.clock() - v41, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_11)
		local v44 = os.clock()
		local v45 = "HelpGui"
		local v46 = nil
		local function INITIALIZE_12() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v45 (copy), v46 (copy), v44 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v45 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v45 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v46 and os.clock() - v44 > 0.01) then
				return v2
			end
			print("[Init]", v45 .. ":", "took", v1.round(os.clock() - v44, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_12)
		local v47 = os.clock()
		local v48 = "RewardsGuiNew"
		local v49 = nil
		local function INITIALIZE_13() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v48 (copy), v49 (copy), v47 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v48 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v48 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v49 and os.clock() - v47 > 0.01) then
				return v2
			end
			print("[Init]", v48 .. ":", "took", v1.round(os.clock() - v47, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_13)
		local v50 = os.clock()
		local v51 = "ItemStreamClient"
		local v52 = nil
		local function INITIALIZE_14() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v51 (copy), v52 (copy), v50 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v51 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v51 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v52 and os.clock() - v50 > 0.01) then
				return v2
			end
			print("[Init]", v51 .. ":", "took", v1.round(os.clock() - v50, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_14)
		local v53 = os.clock()
		local v54 = "ItemDropClient"
		local v55 = nil
		local function INITIALIZE_15() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v54 (copy), v55 (copy), v53 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v54 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v54 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v55 and os.clock() - v53 > 0.01) then
				return v2
			end
			print("[Init]", v54 .. ":", "took", v1.round(os.clock() - v53, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_15)
		local v56 = os.clock()
		local v57 = "PlayerOverhead"
		local v58 = nil
		local function INITIALIZE_16() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v57 (copy), v58 (copy), v56 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v57 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v57 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v58 and os.clock() - v56 > 0.01) then
				return v2
			end
			print("[Init]", v57 .. ":", "took", v1.round(os.clock() - v56, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_16)
		local v59 = os.clock()
		local v60 = "PlayerLocatorOverhead"
		local v61 = nil
		local function INITIALIZE_17() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v60 (copy), v61 (copy), v59 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v60 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v60 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v61 and os.clock() - v59 > 0.01) then
				return v2
			end
			print("[Init]", v60 .. ":", "took", v1.round(os.clock() - v59, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_17)
		local v62 = os.clock()
		local v63 = "AnimalOverhead"
		local v64 = nil
		local function INITIALIZE_18() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v63 (copy), v64 (copy), v62 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v63 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v63 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v64 and os.clock() - v62 > 0.01) then
				return v2
			end
			print("[Init]", v63 .. ":", "took", v1.round(os.clock() - v62, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_18)
		local v65 = os.clock()
		local v66 = "TextChatClient"
		local v67 = nil
		local function INITIALIZE_19() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v66 (copy), v67 (copy), v65 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v66 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v66 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v67 and os.clock() - v65 > 0.01) then
				return v2
			end
			print("[Init]", v66 .. ":", "took", v1.round(os.clock() - v65, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_19)
		local v68 = os.clock()
		local v69 = "CustomiseAnimalGui"
		local v70 = nil
		local function INITIALIZE_20() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v69 (copy), v70 (copy), v68 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v69 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v69 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v70 and os.clock() - v68 > 0.01) then
				return v2
			end
			print("[Init]", v69 .. ":", "took", v1.round(os.clock() - v68, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_20)
		local v71 = os.clock()
		local v72 = "QuickFeedGui"
		local v73 = nil
		local function INITIALIZE_21() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v72 (copy), v73 (copy), v71 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v72 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v72 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v73 and os.clock() - v71 > 0.01) then
				return v2
			end
			print("[Init]", v72 .. ":", "took", v1.round(os.clock() - v71, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_21)
		local v74 = os.clock()
		local v75 = "InfoOverlayGui"
		local v76 = nil
		local function INITIALIZE_22() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v75 (copy), v76 (copy), v74 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v75 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v75 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v76 and os.clock() - v74 > 0.01) then
				return v2
			end
			print("[Init]", v75 .. ":", "took", v1.round(os.clock() - v74, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_22)
		local v77 = os.clock()
		local v78 = "AnimalExperienceTracker"
		local v79 = nil
		local function INITIALIZE_23() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v78 (copy), v79 (copy), v77 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v78 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v78 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v79 and os.clock() - v77 > 0.01) then
				return v2
			end
			print("[Init]", v78 .. ":", "took", v1.round(os.clock() - v77, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_23)
		local v80 = os.clock()
		local v81 = "AnimalPregnancyTracker"
		local v82 = nil
		local function INITIALIZE_24() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v81 (copy), v82 (copy), v80 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v81 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v81 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v82 and os.clock() - v80 > 0.01) then
				return v2
			end
			print("[Init]", v81 .. ":", "took", v1.round(os.clock() - v80, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_24)
		local v83 = os.clock()
		local v84 = "TeleportClient"
		local v85 = nil
		local function INITIALIZE_25() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v84 (copy), v85 (copy), v83 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v84 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v84 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v85 and os.clock() - v83 > 0.01) then
				return v2
			end
			print("[Init]", v84 .. ":", "took", v1.round(os.clock() - v83, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_25)
		local v86 = os.clock()
		local v87 = "SpawnHorsesClient"
		local v88 = nil
		local function INITIALIZE_26() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v87 (copy), v88 (copy), v86 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v87 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v87 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v88 and os.clock() - v86 > 0.01) then
				return v2
			end
			print("[Init]", v87 .. ":", "took", v1.round(os.clock() - v86, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_26)
		local v89 = os.clock()
		local v90 = "UnlockMessagesClient"
		local v91 = nil
		local function INITIALIZE_27() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v90 (copy), v91 (copy), v89 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v90 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v90 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v91 and os.clock() - v89 > 0.01) then
				return v2
			end
			print("[Init]", v90 .. ":", "took", v1.round(os.clock() - v89, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_27)
		local v92 = os.clock()
		local v93 = "HideNode"
		local v94 = nil
		local function INITIALIZE_28() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v93 (copy), v94 (copy), v92 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v93 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v93 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v94 and os.clock() - v92 > 0.01) then
				return v2
			end
			print("[Init]", v93 .. ":", "took", v1.round(os.clock() - v92, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_28)
		if v2.IsMarketWorld() or v2.IsMainWorld() then
			local v95 = os.clock()
			local v96 = "AnimalStorageGui"
			local v97 = nil
			local function INITIALIZE_29() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v96 (copy), v97 (copy), v95 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v96 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v96 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v97 and os.clock() - v95 > 0.01) then
					return v2
				end
				print("[Init]", v96 .. ":", "took", v1.round(os.clock() - v95, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_29)
		end
		if not v2.IsCompHub() then
			local v98 = os.clock()
			local v99 = "BreedContestClient"
			local v100 = nil
			local function INITIALIZE_29() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v99 (copy), v100 (copy), v98 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v99 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v99 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v100 and os.clock() - v98 > 0.01) then
					return v2
				end
				print("[Init]", v99 .. ":", "took", v1.round(os.clock() - v98, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_29)
		end
		local v101 = os.clock()
		local v102 = "EquipmentService"
		local v103 = nil
		local function INITIALIZE_29() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v102 (copy), v103 (copy), v101 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v102 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v102 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v103 and os.clock() - v101 > 0.01) then
				return v2
			end
			print("[Init]", v102 .. ":", "took", v1.round(os.clock() - v101, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_29)
		local v104 = os.clock()
		local v105 = "MusicService"
		local v106 = nil
		local function INITIALIZE_30() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v105 (copy), v106 (copy), v104 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v105 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v105 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v106 and os.clock() - v104 > 0.01) then
				return v2
			end
			print("[Init]", v105 .. ":", "took", v1.round(os.clock() - v104, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_30)
		local v107 = os.clock()
		local v108 = "SettingsService"
		local v109 = nil
		local function INITIALIZE_31() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v108 (copy), v109 (copy), v107 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v108 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v108 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v109 and os.clock() - v107 > 0.01) then
				return v2
			end
			print("[Init]", v108 .. ":", "took", v1.round(os.clock() - v107, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_31)
		local v110 = os.clock()
		local v111 = "ConsumablesService"
		local v112 = nil
		local function INITIALIZE_32() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v111 (copy), v112 (copy), v110 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v111 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v111 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v112 and os.clock() - v110 > 0.01) then
				return v2
			end
			print("[Init]", v111 .. ":", "took", v1.round(os.clock() - v110, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_32)
		local v113 = os.clock()
		local v114 = "MutationRollService"
		local v115 = nil
		local function INITIALIZE_33() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v114 (copy), v115 (copy), v113 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v114 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v114 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v115 and os.clock() - v113 > 0.01) then
				return v2
			end
			print("[Init]", v114 .. ":", "took", v1.round(os.clock() - v113, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_33)
		local v116 = os.clock()
		local v117 = "DailyLoginService"
		local v118 = nil
		local function INITIALIZE_34() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v117 (copy), v118 (copy), v116 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v117 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v117 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v118 and os.clock() - v116 > 0.01) then
				return v2
			end
			print("[Init]", v117 .. ":", "took", v1.round(os.clock() - v116, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_34)
		local v119 = os.clock()
		local v120 = "ItemSetService"
		local v121 = nil
		local function INITIALIZE_35() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v120 (copy), v121 (copy), v119 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v120 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v120 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v121 and os.clock() - v119 > 0.01) then
				return v2
			end
			print("[Init]", v120 .. ":", "took", v1.round(os.clock() - v119, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_35)
		local v122 = os.clock()
		local v123 = "EventMissionsGui"
		local v124 = nil
		local function INITIALIZE_36() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v123 (copy), v124 (copy), v122 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v123 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v123 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v124 and os.clock() - v122 > 0.01) then
				return v2
			end
			print("[Init]", v123 .. ":", "took", v1.round(os.clock() - v122, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_36)
		local v125 = os.clock()
		local v126 = "DiscoveryClient"
		local v127 = nil
		local function INITIALIZE_37() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v126 (copy), v127 (copy), v125 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v126 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v126 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v127 and os.clock() - v125 > 0.01) then
				return v2
			end
			print("[Init]", v126 .. ":", "took", v1.round(os.clock() - v125, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_37)
		local v128 = os.clock()
		local v129 = "UINavigator"
		local v130 = nil
		local function INITIALIZE_38() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v129 (copy), v130 (copy), v128 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v129 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v129 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v130 and os.clock() - v128 > 0.01) then
				return v2
			end
			print("[Init]", v129 .. ":", "took", v1.round(os.clock() - v128, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_38)
		local v131 = os.clock()
		local v132 = "HorseShopSlot"
		local v133 = nil
		local function INITIALIZE_39() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v132 (copy), v133 (copy), v131 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v132 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v132 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v133 and os.clock() - v131 > 0.01) then
				return v2
			end
			print("[Init]", v132 .. ":", "took", v1.round(os.clock() - v131, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_39)
	end
	local v134 = os.clock()
	local v135 = "WorldTeleportClient"
	local v136 = nil
	local function INITIALIZE_40() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v135 (copy), v136 (copy), v134 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v135 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v135 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v136 and os.clock() - v134 > 0.01) then
			return v2
		end
		print("[Init]", v135 .. ":", "took", v1.round(os.clock() - v134, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_40)
	local v137 = os.clock()
	local v138 = "EventTable"
	local v139 = nil
	local function INITIALIZE_41() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v138 (copy), v139 (copy), v137 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v138 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v138 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v139 and os.clock() - v137 > 0.01) then
			return v2
		end
		print("[Init]", v138 .. ":", "took", v1.round(os.clock() - v137, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_41)
	if v2.IsMainWorld() then
		local v140 = os.clock()
		local v141 = "PollsBinder"
		local v142 = nil
		local function INITIALIZE_42() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v141 (copy), v142 (copy), v140 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v141 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v141 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v142 and os.clock() - v140 > 0.01) then
				return v2
			end
			print("[Init]", v141 .. ":", "took", v1.round(os.clock() - v140, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_42)
		local v143 = os.clock()
		local v144 = "TrailsClient"
		local v145 = nil
		local function INITIALIZE_43() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v144 (copy), v145 (copy), v143 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v144 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v144 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v145 and os.clock() - v143 > 0.01) then
				return v2
			end
			print("[Init]", v144 .. ":", "took", v1.round(os.clock() - v143, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_43)
	end
	if not v2.IsMarketWorld() then
		if not v2.IsCompHub() then
			local v146 = os.clock()
			local v147 = "TameContestClient"
			local v148 = nil
			local function INITIALIZE_42() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v147 (copy), v148 (copy), v146 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v147 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v147 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v148 and os.clock() - v146 > 0.01) then
					return v2
				end
				print("[Init]", v147 .. ":", "took", v1.round(os.clock() - v146, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_42)
			local v149 = os.clock()
			local v150 = "TreasureChests"
			local v151 = nil
			local function INITIALIZE_43() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v150 (copy), v151 (copy), v149 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v150 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v150 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v151 and os.clock() - v149 > 0.01) then
					return v2
				end
				print("[Init]", v150 .. ":", "took", v1.round(os.clock() - v149, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_43)
			local v152 = os.clock()
			local v153 = "HorseTrainingClient"
			local v154 = nil
			local function INITIALIZE_44() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v153 (copy), v154 (copy), v152 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v153 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v153 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v154 and os.clock() - v152 > 0.01) then
					return v2
				end
				print("[Init]", v153 .. ":", "took", v1.round(os.clock() - v152, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_44)
			local v155 = os.clock()
			local v156 = "DynamicNPCDialogClient"
			local v157 = nil
			local function INITIALIZE_45() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v156 (copy), v157 (copy), v155 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v156 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v156 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v157 and os.clock() - v155 > 0.01) then
					return v2
				end
				print("[Init]", v156 .. ":", "took", v1.round(os.clock() - v155, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_45)
			local v158 = os.clock()
			local v159 = "DynamicNPC"
			local v160 = nil
			local function INITIALIZE_46() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v159 (copy), v160 (copy), v158 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v159 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v159 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v160 and os.clock() - v158 > 0.01) then
					return v2
				end
				print("[Init]", v159 .. ":", "took", v1.round(os.clock() - v158, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_46)
		end
		local v161 = os.clock()
		local v162 = "CurrencyNodeClass"
		local v163 = nil
		local function INITIALIZE_42() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v162 (copy), v163 (copy), v161 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v162 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v162 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v163 and os.clock() - v161 > 0.01) then
				return v2
			end
			print("[Init]", v162 .. ":", "took", v1.round(os.clock() - v161, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_42)
		local v164 = os.clock()
		local v165 = "FerrisWheel"
		local v166 = nil
		local function INITIALIZE_43() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v165 (copy), v166 (copy), v164 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v165 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v165 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v166 and os.clock() - v164 > 0.01) then
				return v2
			end
			print("[Init]", v165 .. ":", "took", v1.round(os.clock() - v164, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_43)
		local v167 = os.clock()
		local v168 = "Windmill"
		local v169 = nil
		local function INITIALIZE_44() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v168 (copy), v169 (copy), v167 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v168 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v168 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v169 and os.clock() - v167 > 0.01) then
				return v2
			end
			print("[Init]", v168 .. ":", "took", v1.round(os.clock() - v167, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_44)
		local v170 = os.clock()
		local v171 = "Vegetation"
		local v172 = nil
		local function INITIALIZE_45() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v171 (copy), v172 (copy), v170 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v171 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v171 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v172 and os.clock() - v170 > 0.01) then
				return v2
			end
			print("[Init]", v171 .. ":", "took", v1.round(os.clock() - v170, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_45)
		local v173 = os.clock()
		local v174 = "BounceBinder"
		local v175 = nil
		local function INITIALIZE_46() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v174 (copy), v175 (copy), v173 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v174 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v174 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v175 and os.clock() - v173 > 0.01) then
				return v2
			end
			print("[Init]", v174 .. ":", "took", v1.round(os.clock() - v173, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_46)
		local v176 = os.clock()
		local v177 = "MobAnimator"
		local v178 = nil
		local function INITIALIZE_47() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v177 (copy), v178 (copy), v176 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v177 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v177 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v178 and os.clock() - v176 > 0.01) then
				return v2
			end
			print("[Init]", v177 .. ":", "took", v1.round(os.clock() - v176, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_47)
		local v179 = os.clock()
		local v180 = "Jump"
		local v181 = nil
		local function INITIALIZE_48() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v180 (copy), v181 (copy), v179 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v180 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v180 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v181 and os.clock() - v179 > 0.01) then
				return v2
			end
			print("[Init]", v180 .. ":", "took", v1.round(os.clock() - v179, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_48)
		local v182 = os.clock()
		local v183 = "BoostPad"
		local v184 = nil
		local function INITIALIZE_49() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v183 (copy), v184 (copy), v182 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v183 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v183 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v184 and os.clock() - v182 > 0.01) then
				return v2
			end
			print("[Init]", v183 .. ":", "took", v1.round(os.clock() - v182, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_49)
		local v185 = os.clock()
		local v186 = "BuildService"
		local v187 = nil
		local function INITIALIZE_50() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v186 (copy), v187 (copy), v185 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v186 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v186 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v187 and os.clock() - v185 > 0.01) then
				return v2
			end
			print("[Init]", v186 .. ":", "took", v1.round(os.clock() - v185, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_50)
		local v188 = os.clock()
		local v189 = "ReleaseCountdown"
		local v190 = nil
		local function INITIALIZE_51() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v189 (copy), v190 (copy), v188 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v189 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v189 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v190 and os.clock() - v188 > 0.01) then
				return v2
			end
			print("[Init]", v189 .. ":", "took", v1.round(os.clock() - v188, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_51)
		local v191 = os.clock()
		local v192 = "Resource"
		local v193 = nil
		local function INITIALIZE_52() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v192 (copy), v193 (copy), v191 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v192 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v192 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v193 and os.clock() - v191 > 0.01) then
				return v2
			end
			print("[Init]", v192 .. ":", "took", v1.round(os.clock() - v191, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_52)
		local v194 = os.clock()
		local v195 = "BossSpawn"
		local v196 = nil
		local function INITIALIZE_53() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v195 (copy), v196 (copy), v194 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v195 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v195 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v196 and os.clock() - v194 > 0.01) then
				return v2
			end
			print("[Init]", v195 .. ":", "took", v1.round(os.clock() - v194, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_53)
		local v197 = os.clock()
		local v198 = "BossDefeatGui"
		local v199 = nil
		local function INITIALIZE_54() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v198 (copy), v199 (copy), v197 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v198 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v198 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v199 and os.clock() - v197 > 0.01) then
				return v2
			end
			print("[Init]", v198 .. ":", "took", v1.round(os.clock() - v197, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_54)
		local v200 = os.clock()
		local v201 = "BuildClient"
		local v202 = nil
		local function INITIALIZE_55() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v201 (copy), v202 (copy), v200 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v201 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v201 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v202 and os.clock() - v200 > 0.01) then
				return v2
			end
			print("[Init]", v201 .. ":", "took", v1.round(os.clock() - v200, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_55)
		local v203 = os.clock()
		local v204 = "NoBuildZone"
		local v205 = nil
		local function INITIALIZE_56() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v204 (copy), v205 (copy), v203 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v204 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v204 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v205 and os.clock() - v203 > 0.01) then
				return v2
			end
			print("[Init]", v204 .. ":", "took", v1.round(os.clock() - v203, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_56)
		local v206 = os.clock()
		local v207 = "ClientGlobalBosses"
		local v208 = nil
		local function INITIALIZE_57() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v207 (copy), v208 (copy), v206 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v207 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v207 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v208 and os.clock() - v206 > 0.01) then
				return v2
			end
			print("[Init]", v207 .. ":", "took", v1.round(os.clock() - v206, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_57)
		if not v2.IsCompHub() then
			local v209 = os.clock()
			local v210 = "FishingSpots"
			local v211 = nil
			local function INITIALIZE_58() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v210 (copy), v211 (copy), v209 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v210 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v210 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v211 and os.clock() - v209 > 0.01) then
					return v2
				end
				print("[Init]", v210 .. ":", "took", v1.round(os.clock() - v209, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_58)
		end
		local v212 = os.clock()
		local v213 = "PurchaseableBinder"
		local v214 = nil
		local function INITIALIZE_58() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v213 (copy), v214 (copy), v212 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v213 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v213 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v214 and os.clock() - v212 > 0.01) then
				return v2
			end
			print("[Init]", v213 .. ":", "took", v1.round(os.clock() - v212, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_58)
		local v215 = os.clock()
		local v216 = "WorldLoreBinder"
		local v217 = nil
		local function INITIALIZE_59() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v216 (copy), v217 (copy), v215 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v216 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v216 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v217 and os.clock() - v215 > 0.01) then
				return v2
			end
			print("[Init]", v216 .. ":", "took", v1.round(os.clock() - v215, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_59)
		local v218 = os.clock()
		local v219 = "GachaMachineGui"
		local v220 = nil
		local function INITIALIZE_60() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v219 (copy), v220 (copy), v218 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v219 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v219 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v220 and os.clock() - v218 > 0.01) then
				return v2
			end
			print("[Init]", v219 .. ":", "took", v1.round(os.clock() - v218, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_60)
		local v221 = os.clock()
		local v222 = "SpawnClient"
		local v223 = nil
		local function INITIALIZE_61() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v222 (copy), v223 (copy), v221 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v222 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v222 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v223 and os.clock() - v221 > 0.01) then
				return v2
			end
			print("[Init]", v222 .. ":", "took", v1.round(os.clock() - v221, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_61)
		local v224 = os.clock()
		local v225 = "Timer"
		local v226 = nil
		local function INITIALIZE_62() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v225 (copy), v226 (copy), v224 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v225 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v225 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v226 and os.clock() - v224 > 0.01) then
				return v2
			end
			print("[Init]", v225 .. ":", "took", v1.round(os.clock() - v224, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_62)
		local v227 = os.clock()
		local v228 = "GachaBinder"
		local v229 = nil
		local function INITIALIZE_63() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v228 (copy), v229 (copy), v227 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v228 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v228 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v229 and os.clock() - v227 > 0.01) then
				return v2
			end
			print("[Init]", v228 .. ":", "took", v1.round(os.clock() - v227, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_63)
		local v230 = os.clock()
		local v231 = "PlushMachine"
		local v232 = nil
		local function INITIALIZE_64() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v231 (copy), v232 (copy), v230 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v231 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v231 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v232 and os.clock() - v230 > 0.01) then
				return v2
			end
			print("[Init]", v231 .. ":", "took", v1.round(os.clock() - v230, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_64)
		local v233 = os.clock()
		local v234 = "PlushMachineBoard"
		local v235 = nil
		local function INITIALIZE_65() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v234 (copy), v235 (copy), v233 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v234 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v234 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v235 and os.clock() - v233 > 0.01) then
				return v2
			end
			print("[Init]", v234 .. ":", "took", v1.round(os.clock() - v233, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_65)
		local v236 = os.clock()
		local v237 = "PlushMachineBinder"
		local v238 = nil
		local function INITIALIZE_66() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v237 (copy), v238 (copy), v236 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v237 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v237 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v238 and os.clock() - v236 > 0.01) then
				return v2
			end
			print("[Init]", v237 .. ":", "took", v1.round(os.clock() - v236, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_66)
		local v239 = os.clock()
		local v240 = "PlushMaterialShopGui"
		local v241 = nil
		local function INITIALIZE_67() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v240 (copy), v241 (copy), v239 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v240 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v240 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v241 and os.clock() - v239 > 0.01) then
				return v2
			end
			print("[Init]", v240 .. ":", "took", v1.round(os.clock() - v239, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_67)
		local v242 = os.clock()
		local v243 = "PlushMachineMaterialGui"
		local v244 = nil
		local function INITIALIZE_68() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v243 (copy), v244 (copy), v242 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v243 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v243 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v244 and os.clock() - v242 > 0.01) then
				return v2
			end
			print("[Init]", v243 .. ":", "took", v1.round(os.clock() - v242, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_68)
		local v245 = os.clock()
		local v246 = "FarmingClient"
		local v247 = nil
		local function INITIALIZE_69() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v246 (copy), v247 (copy), v245 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v246 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v246 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v247 and os.clock() - v245 > 0.01) then
				return v2
			end
			print("[Init]", v246 .. ":", "took", v1.round(os.clock() - v245, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_69)
		if not v2.IsCompHub() then
			local v248 = os.clock()
			local v249 = "FishClient"
			local v250 = nil
			local function INITIALIZE_70() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v249 (copy), v250 (copy), v248 (copy), v1 (copy) ]]
				local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v249 (ref) ]]
					return Sonar(p1)
				end)
				if not v13_2 then
					task.spawn(function() --[[ Line: 26 | Upvalues: v249 (ref), v2 (copy) ]]
						error("Initialization error for " .. p1 .. " - " .. v2)
					end)
				end
				if not (v250 and os.clock() - v248 > 0.01) then
					return v2
				end
				print("[Init]", v249 .. ":", "took", v1.round(os.clock() - v248, 0.01), "seconds")
				return v2
			end
			task.spawn(INITIALIZE_70)
		end
		local v251 = os.clock()
		local v252 = "TrickerTreatService"
		local v253 = nil
		local function INITIALIZE_70() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v252 (copy), v253 (copy), v251 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v252 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v252 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v253 and os.clock() - v251 > 0.01) then
				return v2
			end
			print("[Init]", v252 .. ":", "took", v1.round(os.clock() - v251, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_70)
		local v254 = os.clock()
		local v255 = "ObbyStartService"
		local v256 = nil
		local function INITIALIZE_71() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v255 (copy), v256 (copy), v254 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v255 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v255 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v256 and os.clock() - v254 > 0.01) then
				return v2
			end
			print("[Init]", v255 .. ":", "took", v1.round(os.clock() - v254, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_71)
	end
	if v2.IsCompHub() then
		local v257 = os.clock()
		local v258 = "MapVotingGui"
		local v259 = nil
		local function INITIALIZE_42() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v258 (copy), v259 (copy), v257 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v258 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v258 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v259 and os.clock() - v257 > 0.01) then
				return v2
			end
			print("[Init]", v258 .. ":", "took", v1.round(os.clock() - v257, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_42)
		local v260 = os.clock()
		local v261 = "WeatherService"
		local v262 = nil
		local function INITIALIZE_43() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v261 (copy), v262 (copy), v260 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v261 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v261 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v262 and os.clock() - v260 > 0.01) then
				return v2
			end
			print("[Init]", v261 .. ":", "took", v1.round(os.clock() - v260, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_43)
	end
	local v263 = os.clock()
	local v264 = "WinterEventService"
	local v265 = nil
	local function INITIALIZE_42() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v264 (copy), v265 (copy), v263 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v264 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v264 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v265 and os.clock() - v263 > 0.01) then
			return v2
		end
		print("[Init]", v264 .. ":", "took", v1.round(os.clock() - v263, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_42)
	local v266 = os.clock()
	local v267 = "AchievementGui"
	local v268 = nil
	local function INITIALIZE_43() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v267 (copy), v268 (copy), v266 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v267 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v267 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v268 and os.clock() - v266 > 0.01) then
			return v2
		end
		print("[Init]", v267 .. ":", "took", v1.round(os.clock() - v266, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_43)
	local v269 = os.clock()
	local v270 = "EquipmentShopGui"
	local v271 = nil
	local function INITIALIZE_44() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v270 (copy), v271 (copy), v269 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v270 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v270 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v271 and os.clock() - v269 > 0.01) then
			return v2
		end
		print("[Init]", v270 .. ":", "took", v1.round(os.clock() - v269, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_44)
	local v272 = os.clock()
	local v273 = "ShopGui"
	local v274 = nil
	local function INITIALIZE_45() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v273 (copy), v274 (copy), v272 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v273 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v273 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v274 and os.clock() - v272 > 0.01) then
			return v2
		end
		print("[Init]", v273 .. ":", "took", v1.round(os.clock() - v272, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_45)
	local v275 = os.clock()
	local v276 = "JournalGui"
	local v277 = nil
	local function INITIALIZE_46() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v276 (copy), v277 (copy), v275 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v276 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v276 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v277 and os.clock() - v275 > 0.01) then
			return v2
		end
		print("[Init]", v276 .. ":", "took", v1.round(os.clock() - v275, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_46)
	local v278 = os.clock()
	local v279 = "SellingAnimalClient"
	local v280 = nil
	local function INITIALIZE_47() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v279 (copy), v280 (copy), v278 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v279 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v279 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v280 and os.clock() - v278 > 0.01) then
			return v2
		end
		print("[Init]", v279 .. ":", "took", v1.round(os.clock() - v278, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_47)
	local v281 = os.clock()
	local v282 = "DisplayAnimalClient"
	local v283 = nil
	local function INITIALIZE_48() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v282 (copy), v283 (copy), v281 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v282 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v282 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v283 and os.clock() - v281 > 0.01) then
			return v2
		end
		print("[Init]", v282 .. ":", "took", v1.round(os.clock() - v281, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_48)
	local v284 = os.clock()
	local v285 = "NotificationsClient"
	local v286 = nil
	local function INITIALIZE_49() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v285 (copy), v286 (copy), v284 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v285 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v285 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v286 and os.clock() - v284 > 0.01) then
			return v2
		end
		print("[Init]", v285 .. ":", "took", v1.round(os.clock() - v284, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_49)
	local v287 = os.clock()
	local v288 = "GlobalLeaderboardClient"
	local v289 = nil
	local function INITIALIZE_50() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v288 (copy), v289 (copy), v287 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v288 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v288 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v289 and os.clock() - v287 > 0.01) then
			return v2
		end
		print("[Init]", v288 .. ":", "took", v1.round(os.clock() - v287, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_50)
	local v290 = os.clock()
	local v291 = "MessagesClient"
	local v292 = nil
	local function INITIALIZE_51() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v291 (copy), v292 (copy), v290 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v291 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v291 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v292 and os.clock() - v290 > 0.01) then
			return v2
		end
		print("[Init]", v291 .. ":", "took", v1.round(os.clock() - v290, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_51)
	local v293 = os.clock()
	local v294 = "HotbarService"
	local v295 = nil
	local function INITIALIZE_52() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v294 (copy), v295 (copy), v293 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v294 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v294 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v295 and os.clock() - v293 > 0.01) then
			return v2
		end
		print("[Init]", v294 .. ":", "took", v1.round(os.clock() - v293, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_52)
	local v296 = os.clock()
	local v297 = "WorldClientInit"
	local v298 = nil
	local function INITIALIZE_53() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v297 (copy), v298 (copy), v296 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v297 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v297 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v298 and os.clock() - v296 > 0.01) then
			return v2
		end
		print("[Init]", v297 .. ":", "took", v1.round(os.clock() - v296, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_53)
	local v299 = os.clock()
	local v300 = "ShopService"
	local v301 = nil
	local function INITIALIZE_54() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v300 (copy), v301 (copy), v299 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v300 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v300 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v301 and os.clock() - v299 > 0.01) then
			return v2
		end
		print("[Init]", v300 .. ":", "took", v1.round(os.clock() - v299, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_54)
	local v302 = os.clock()
	local v303 = "Tool"
	local v304 = nil
	local function INITIALIZE_55() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v303 (copy), v304 (copy), v302 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v303 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v303 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v304 and os.clock() - v302 > 0.01) then
			return v2
		end
		print("[Init]", v303 .. ":", "took", v1.round(os.clock() - v302, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_55)
	local v305 = os.clock()
	local v306 = "ButterflyNode"
	local v307 = nil
	local function INITIALIZE_56() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v306 (copy), v307 (copy), v305 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v306 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v306 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v307 and os.clock() - v305 > 0.01) then
			return v2
		end
		print("[Init]", v306 .. ":", "took", v1.round(os.clock() - v305, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_56)
	local v308 = os.clock()
	local v309 = "Zone"
	local v310 = nil
	local function INITIALIZE_57() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v309 (copy), v310 (copy), v308 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v309 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v309 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v310 and os.clock() - v308 > 0.01) then
			return v2
		end
		print("[Init]", v309 .. ":", "took", v1.round(os.clock() - v308, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_57)
	local v311 = os.clock()
	local v312 = "Ailment"
	local v313 = nil
	local function INITIALIZE_58() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v312 (copy), v313 (copy), v311 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v312 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v312 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v313 and os.clock() - v311 > 0.01) then
			return v2
		end
		print("[Init]", v312 .. ":", "took", v1.round(os.clock() - v311, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_58)
	local v314 = os.clock()
	local v315 = "InitDeveloperTools"
	local v316 = nil
	local function INITIALIZE_59() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v315 (copy), v316 (copy), v314 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v315 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v315 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v316 and os.clock() - v314 > 0.01) then
			return v2
		end
		print("[Init]", v315 .. ":", "took", v1.round(os.clock() - v314, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_59)
	local v317 = os.clock()
	local v318 = "CmdrInit"
	local v319 = nil
	local function INITIALIZE_60() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v318 (copy), v319 (copy), v317 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v318 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v318 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v319 and os.clock() - v317 > 0.01) then
			return v2
		end
		print("[Init]", v318 .. ":", "took", v1.round(os.clock() - v317, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_60)
	local v320 = os.clock()
	local v321 = "DayCycleService"
	local v322 = nil
	local function INITIALIZE_61() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v321 (copy), v322 (copy), v320 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v321 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v321 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v322 and os.clock() - v320 > 0.01) then
			return v2
		end
		print("[Init]", v321 .. ":", "took", v1.round(os.clock() - v320, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_61)
	local v323 = os.clock()
	local v324 = "NightLight"
	local v325 = nil
	local function INITIALIZE_62() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v324 (copy), v325 (copy), v323 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v324 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v324 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v325 and os.clock() - v323 > 0.01) then
			return v2
		end
		print("[Init]", v324 .. ":", "took", v1.round(os.clock() - v323, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_62)
	local v326 = os.clock()
	local v327 = "TimedTips"
	local v328 = nil
	local function INITIALIZE_63() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v327 (copy), v328 (copy), v326 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v327 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v327 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v328 and os.clock() - v326 > 0.01) then
			return v2
		end
		print("[Init]", v327 .. ":", "took", v1.round(os.clock() - v326, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_63)
	local v329 = os.clock()
	local v330 = "NPCShopGui"
	local v331 = nil
	local function INITIALIZE_64() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v330 (copy), v331 (copy), v329 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v330 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v330 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v331 and os.clock() - v329 > 0.01) then
			return v2
		end
		print("[Init]", v330 .. ":", "took", v1.round(os.clock() - v329, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_64)
	local v332 = os.clock()
	local v333 = "NPCSellGui"
	local v334 = nil
	local function INITIALIZE_65() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v333 (copy), v334 (copy), v332 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v333 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v333 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v334 and os.clock() - v332 > 0.01) then
			return v2
		end
		print("[Init]", v333 .. ":", "took", v1.round(os.clock() - v332, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_65)
	local v335 = os.clock()
	local v336 = "FoldersGui"
	local v337 = nil
	local function INITIALIZE_66() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v336 (copy), v337 (copy), v335 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v336 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v336 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v337 and os.clock() - v335 > 0.01) then
			return v2
		end
		print("[Init]", v336 .. ":", "took", v1.round(os.clock() - v335, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_66)
	local v338 = os.clock()
	local v339 = "RotatingRay"
	local v340 = nil
	local function INITIALIZE_67() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v339 (copy), v340 (copy), v338 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v339 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v339 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v340 and os.clock() - v338 > 0.01) then
			return v2
		end
		print("[Init]", v339 .. ":", "took", v1.round(os.clock() - v338, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_67)
	local v341 = os.clock()
	local v342 = "AchivementBinder"
	local v343 = nil
	local function INITIALIZE_68() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v342 (copy), v343 (copy), v341 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v342 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v342 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v343 and os.clock() - v341 > 0.01) then
			return v2
		end
		print("[Init]", v342 .. ":", "took", v1.round(os.clock() - v341, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_68)
	local v344 = os.clock()
	local v345 = "JoustingService"
	local v346 = nil
	local function INITIALIZE_69() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v345 (copy), v346 (copy), v344 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v345 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v345 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v346 and os.clock() - v344 > 0.01) then
			return v2
		end
		print("[Init]", v345 .. ":", "took", v1.round(os.clock() - v344, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_69)
	if not v2.IsCompHub() then
		local v347 = os.clock()
		local v348 = "StoryClient"
		local v349 = nil
		local function INITIALIZE_70() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v348 (copy), v349 (copy), v347 (copy), v1 (copy) ]]
			local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v348 (ref) ]]
				return Sonar(p1)
			end)
			if not v13_2 then
				task.spawn(function() --[[ Line: 26 | Upvalues: v348 (ref), v2 (copy) ]]
					error("Initialization error for " .. p1 .. " - " .. v2)
				end)
			end
			if not (v349 and os.clock() - v347 > 0.01) then
				return v2
			end
			print("[Init]", v348 .. ":", "took", v1.round(os.clock() - v347, 0.01), "seconds")
			return v2
		end
		task.spawn(INITIALIZE_70)
	end
	local v350 = os.clock()
	local v351 = "LeaderboardClient"
	local v352 = nil
	local function INITIALIZE_70() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v351 (copy), v352 (copy), v350 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v351 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v351 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v352 and os.clock() - v350 > 0.01) then
			return v2
		end
		print("[Init]", v351 .. ":", "took", v1.round(os.clock() - v350, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_70)
	local v353 = os.clock()
	local v354 = "MapGui"
	local v355 = nil
	local function INITIALIZE_71() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v354 (copy), v355 (copy), v353 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v354 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v354 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v355 and os.clock() - v353 > 0.01) then
			return v2
		end
		print("[Init]", v354 .. ":", "took", v1.round(os.clock() - v353, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_71)
	local v356 = os.clock()
	local v357 = "WorldStockHorse"
	local v358 = nil
	local function INITIALIZE_72() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v357 (copy), v358 (copy), v356 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v357 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v357 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v358 and os.clock() - v356 > 0.01) then
			return v2
		end
		print("[Init]", v357 .. ":", "took", v1.round(os.clock() - v356, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_72)
	local v359 = os.clock()
	local v360 = "WorldStockAccessory"
	local v361 = nil
	local function INITIALIZE_73() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v360 (copy), v361 (copy), v359 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v360 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v360 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v361 and os.clock() - v359 > 0.01) then
			return v2
		end
		print("[Init]", v360 .. ":", "took", v1.round(os.clock() - v359, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_73)
	local v362 = os.clock()
	local v363 = "AbuseClient"
	local v364 = nil
	local function INITIALIZE_74() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v363 (copy), v364 (copy), v362 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v363 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v363 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v364 and os.clock() - v362 > 0.01) then
			return v2
		end
		print("[Init]", v363 .. ":", "took", v1.round(os.clock() - v362, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_74)
	local v365 = os.clock()
	local v366 = "SpecialSpawnedHorses"
	local v367 = nil
	local function INITIALIZE_75() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v366 (copy), v367 (copy), v365 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v366 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v366 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v367 and os.clock() - v365 > 0.01) then
			return v2
		end
		print("[Init]", v366 .. ":", "took", v1.round(os.clock() - v365, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_75)
	local v368 = os.clock()
	local v369 = "StallCustomizeGui"
	local v370 = nil
	local function INITIALIZE_76() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v369 (copy), v370 (copy), v368 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v369 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v369 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v370 and os.clock() - v368 > 0.01) then
			return v2
		end
		print("[Init]", v369 .. ":", "took", v1.round(os.clock() - v368, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_76)
	local v371 = os.clock()
	local v372 = "AtlasModeration"
	local v373 = nil
	local function INITIALIZE_77() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v372 (copy), v373 (copy), v371 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v372 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v372 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v373 and os.clock() - v371 > 0.01) then
			return v2
		end
		print("[Init]", v372 .. ":", "took", v1.round(os.clock() - v371, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_77)
	local v374 = os.clock()
	local v375 = "StableClubsGui"
	local v376 = nil
	local function INITIALIZE_78() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v375 (copy), v376 (copy), v374 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v375 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v375 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v376 and os.clock() - v374 > 0.01) then
			return v2
		end
		print("[Init]", v375 .. ":", "took", v1.round(os.clock() - v374, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_78)
	local v377 = os.clock()
	local v378 = "TradingCatalogGui"
	local v379 = nil
	local function INITIALIZE_79() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v378 (copy), v379 (copy), v377 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v378 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v378 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v379 and os.clock() - v377 > 0.01) then
			return v2
		end
		print("[Init]", v378 .. ":", "took", v1.round(os.clock() - v377, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_79)
	local v380 = os.clock()
	local v381 = "EventJournalGui"
	local v382 = nil
	local function INITIALIZE_80() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v381 (copy), v382 (copy), v380 (copy), v1 (copy) ]]
		local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v381 (ref) ]]
			return Sonar(p1)
		end)
		if not v13_2 then
			task.spawn(function() --[[ Line: 26 | Upvalues: v381 (ref), v2 (copy) ]]
				error("Initialization error for " .. p1 .. " - " .. v2)
			end)
		end
		if not (v382 and os.clock() - v380 > 0.01) then
			return v2
		end
		print("[Init]", v381 .. ":", "took", v1.round(os.clock() - v380, 0.01), "seconds")
		return v2
	end
	task.spawn(INITIALIZE_80)
end
local v383 = os.clock()
local v384 = "CarClient"
local v385 = nil
local function INITIALIZE_81() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v384 (copy), v385 (copy), v383 (copy), v1 (copy) ]]
	local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v384 (ref) ]]
		return Sonar(p1)
	end)
	if not v13_2 then
		task.spawn(function() --[[ Line: 26 | Upvalues: v384 (ref), v2 (copy) ]]
			error("Initialization error for " .. p1 .. " - " .. v2)
		end)
	end
	if not (v385 and os.clock() - v383 > 0.01) then
		return v2
	end
	print("[Init]", v384 .. ":", "took", v1.round(os.clock() - v383, 0.01), "seconds")
	return v2
end
task.spawn(INITIALIZE_81)
local v386 = os.clock()
local v387 = "WebsiteGameEventSign"
local v388 = nil
local function INITIALIZE_82() --[[ INITIALIZE | Line: 20 | Upvalues: Sonar (copy), v387 (copy), v388 (copy), v386 (copy), v1 (copy) ]]
	local v13_2, v2 = pcall(function() --[[ Line: 21 | Upvalues: Sonar (ref), v387 (ref) ]]
		return Sonar(p1)
	end)
	if not v13_2 then
		task.spawn(function() --[[ Line: 26 | Upvalues: v387 (ref), v2 (copy) ]]
			error("Initialization error for " .. p1 .. " - " .. v2)
		end)
	end
	if not (v388 and os.clock() - v386 > 0.01) then
		return v2
	end
	print("[Init]", v387 .. ":", "took", v1.round(os.clock() - v386, 0.01), "seconds")
	return v2
end
task.spawn(INITIALIZE_82)
return {}