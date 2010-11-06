--[[    
	
	!!YOU CAN KEEP THIS FILE WHEN UPDATING!!

	Here is an example of how the font configuration works:

	TukuiCF["fonts"] = {
		["example_font"] = TukuiCF.media.example_font, 		// Here you choose what font you'd like to use, either link from the media table or direct file link.
		["example_font_size"] = 11, 										// Size of your chosen font.
		["example_font_style"] = "", 										// Style of your chosen font, examples: "OUTLINE", "THICKOUTLINE", "MONOCHROME".
		["example_font_shadow"] = true, 								// If you want shadows around your chosen font. 
		["example_xy_position"] = { 1, -1 },							// Sets the X or/and Y positions of the text we are formatting. We only do this because each font anchors differently.
	}
	
]] --

TukuiCF["fonts"] = {
	----- [[     General Fonts     ]] -----
	
	["general_font"] = TukuiCF.media.custom_font_3,	
	["general_font_size"] = 11,
	["general_font_style"] = "THINOUTLINE",
	
	["damage_font"] = TukuiCF.media.dmgfont,
	
	
	----- [[     Datatext Fonts     ]] -----
	
	["datatext_font"] = TukuiCF.media.custom_font_1,
	["datatext_font_size"] = 12,
	["datatext_font_style"] = "MONOCHROMEOUTLINE",
	["datatext_font_shadow"] = false,
	
	["datatext_xy_position"] = { 0, 1 },

	
	----- [[     Chat & Chat Tab Fonts     ]] -----
	
	["chat_font"] = TukuiCF.media.custom_font_3,
	["chat_font_style"] = "",
	["chat_font_shadow"] = false,

	["chat_tab_font"] = TukuiCF.media.custom_font_1,
	["chat_tab_font_size"] = 12,
	["chat_tab_font_style"] = "MONOCHROMEOUTLINE",
	["chat_tab_font_shadow"] = false,
	
	["chat_tab_xy_position"] = { 0, -3 },

	
	----- [[     Actionbar Fonts     ]] -----
	
	["actionbar_font"] = TukuiCF.media.custom_font_1,
	["actionbar_font_size"] = 12,
	["actionbar_font_style"] = "MONOCHROMEOUTLINE",
	["actionbar_font_shadow"] = false,

	["actionbar_cooldown_font_size"] = 12, -- set this seperately because of font scaling

	["actionbar_count_xy_position"] = { -1, 2 },
	["actionbar_hotkey_xy_position"] = { -1, -1 },
	["actionbar_macro_xy_position"] = { 0, 2 },
	
	
	----- [[     Auras Fonts     ]] -----
	
	["aura_font"] = TukuiCF.media.custom_font_1,
	["aura_font_size"] = 12,
	["aura_font_style"] = "MONOCHROMEOUTLINE",
	["aura_font_shadow"] = false,
	
	["aura_count_xy_position"] = { 4, -1 },
	["aura_duration_xy_position"] = { 1, -12 },

	
	----- [[     Bag Fonts     ]] -----
	
	["bag_font"] = TukuiCF.media.custom_font_1,
	["bag_font_size"] = 12,
	["bag_font_style"] = "MONOCHROMEOUTLINE",
	["bag_font_shadow"] = false,

	["bag_count_xy_position"] = { -1, 1 },
	["bag_button_xy_position"] = { 1, 1 },
	
	
	----- [[     Nameplate Fonts     ]] -----
	
	["nameplate_font"] = TukuiCF.media.custom_font_1,
	["nameplate_font_size"] = 10,
	["nameplate_font_style"] = "MONOCHROMEOUTLINE",
	["nameplate_font_shadow"] = false,


	----- [[     Map Fonts     ]] -----
	
	["map_font"] = TukuiCF.media.custom_font_1,
	["map_font_size"] = 12,
	["map_font_style"] = "MONOCHROMEOUTLINE",
	["map_font_shadow"] = false, -- this won't affect the map buttons

	["map_button_xy_position"] = { 1, 1 },
	
	
	----- [[     Unitframe Fonts     ]] -----
	
	["unitframe_font"] = TukuiCF.media.custom_font_1,
	["unitframe_font_size"] = 12,
	["unitframe_font_style"] = "MONOCHROMEOUTLINE",
	["unitframe_font_shadow"] = false, -- this won't affect the unitframe buttons
	["unitframe_y_position"] = { 1 }, -- purely for adjusting the Y positions on the info panel and castbar
	
	["unitframe_aura_font"] = TukuiCF.media.custom_font_1,
	["unitframe_aura_font_size"] = 12,
	["unitframe_aura_font_style"] = "MONOCHROMEOUTLINE",
	["unitframe_aura_xy_position"] = { 1, 4 },
	
	["unitframe_auracount_font_size"] = 12,
	["unitframe_auracount_position"] = { -1, 1 },
	
	
	----- [[     Tooltip Fonts     ]] -----
	
	["tooltip_font"] = TukuiCF.media.custom_font_3,
	["tooltip_font_size"] = 11,
	["tooltip_font_style"] = "OUTLINE",
	["tooltip_font_shadow"] = true, -- only affects tooltip health bar text

	["tooltip_health_xy_position"] = { 0, 6 },

}