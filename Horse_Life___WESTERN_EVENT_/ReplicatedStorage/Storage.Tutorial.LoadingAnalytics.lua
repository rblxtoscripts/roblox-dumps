-- https://lua.expert/
return {
	function(p1) --[[ Line: 2 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "LoadingScreen",
			progression02 = "GotIntoGame",
			progression03 = "",
			score = p1
		}
	end,
	function(p1) --[[ Line: 12 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "LoadingScreen",
			progression02 = "CreatedClientWrapper",
			progression03 = "",
			score = p1
		}
	end,
	function(p1) --[[ Line: 22 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "LoadingScreen",
			progression02 = "CreatedSubWrappers",
			progression03 = "",
			score = p1
		}
	end,
	function(p1) --[[ Line: 32 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "LoadingScreen",
			progression02 = "LoadedClientModules",
			progression03 = "",
			score = p1
		}
	end,
	function(p1) --[[ Line: 42 ]]
		return {
			progressionStatus = "Complete",
			progression01 = "LoadingScreen",
			progression02 = "FinishedLoading",
			progression03 = "",
			score = p1
		}
	end
}