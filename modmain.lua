PrefabFiles = {
	"future_flingomatic",
}
Assets = {
	Asset("ATLAS", "images/inventoryimages/future_flingomatic.xml"),
	Asset("IMAGE", "images/inventoryimages/future_flingomatic.tex"),
}
GetPlayer = GLOBAL.GetPlayer
IsHUDPaused = GLOBAL.IsPaused
TheInput = GLOBAL.TheInput
TheFrontEnd = GLOBAL.TheFrontEnd
TheSim = GLOBAL.TheSim
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local RECIPE_GAME_TYPE = GLOBAL.RECIPE_GAME_TYPE

--------------------------------------------------
---- Future Ice Flingomatic
--------------------------------------------------
if GetModConfigData("FutureIceFlingomatic") ~= false then
	GLOBAL.STRINGS.NAMES.FUTURE_FLINGOMATIC = "Future Flingomatic"
	GLOBAL.STRINGS.RECIPE_DESC.FUTURE_FLINGOMATIC = "Best to plan ahead"
	GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.FUTURE_FLINGOMATIC = "Here's where I would put my Flingomatic... if I had one!"
	local future_flingomatic = GLOBAL.Recipe("future_flingomatic", {Ingredient("twigs", 1)}, RECIPETABS.TOWN, TECH.NONE, RECIPE_GAME_TYPE.COMMON, "firesuppressor_placer")
	future_flingomatic.atlas = "images/inventoryimages/future_flingomatic.xml"
end
--------------------------------------------------
---- Better Ice Flingomatic
--------------------------------------------------
if GetModConfigData("BetterIceFlingomatic") ~= false then
	AddPrefabPostInit("firesuppressor", function(inst)
		table.insert(inst.components.firedetector.NOTAGS, "campfire")
	end)
end
--------------------------------------------------
---- Ice Flingomatic Range Check
--------------------------------------------------
if GetModConfigData("IceFlingomaticRange") ~= false then
	
	function IceRange(inst)
		inst:AddComponent("future_flingomatic_comp")
		inst.components.inspectable.getstatus = function(inst)
			inst.components.future_flingomatic_comp:TogglePlacer()
			return "WORKING"
		end
	end
	AddPrefabPostInit("firesuppressor", IceRange)
end