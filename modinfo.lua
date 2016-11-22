--------------------------------------------------
---- This Mod By Talent. 327358@QQ.com
--------------------------------------------------
name = "[T] Ice Flingomatic Plugins(EN)"
description = "Better Ice Flingomatic & Ice Flingomatic Range & Future Ice Flingomatic"
author = "Talent"
version = "1.1"
forumthread = "None"
icon_atlas = "Ta_IFP.xml"
icon = "Ta_IFP.tex"
--------------------------------------------------
---- Compatibility
--------------------------------------------------
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
api_version = 6

--------------------------------------------------
---- Config
--------------------------------------------------
configuration_options =
{
	{
		name = "BetterIceFlingomatic",
		label = "Better Ice Flingomatic",
		options =
					{
						{description = "On", data = true},
						{description = "Off", data = false},
					},
		default = "true",
	},
	{
		name = "IceFlingomaticRange",
		label = "Ice Flingomatic Range",
		options =
					{
						{description = "On", data = true},
						{description = "Off", data = false},
					},
		default = "true",
	},
	{
		name = "FutureIceFlingomatic",
		label = "Future Ice Flingomatic",
		options =
					{
						{description = "On", data = true},
						{description = "Off", data = false},
					},
		default = "true",
	},
}
