----- [[     General Settings     ]] -----

TukuiCF["general"] = {
	["autoscale"] = true,                  -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.71,                    -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["overridelowtohigh"] = false,         -- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
	["multisampleprotect"] = true,         -- i don't recommend this because of shitty border but, voila!
	
	["game_texture"] = TukuiCF["media"].custom_texture_1,
}


----- [[     Unitframe Settings     ]] -----

TukuiCF["unitframes"] = {
	-- general options
	["enable"] = true,                     -- do i really need to explain this?

	["unitcastbar"] = true,                -- enable tukui castbar
	["cblatency"] = false,                 -- enable castbar latency
	["cbicons"] = true,                    -- enable icons on castbar
	["cbclasscolor"] = true,

	["auratimer"] = true,                  -- enable timers on buffs/debuffs
	["auratextscale"] = 11,                -- the font size of buffs/debuffs timers on unitframes
	["aurarows"] = 2, 
	
	["playerauras"] = false,               -- enable auras
	["targetauras"] = true,                -- enable auras on target unit frame

	["highThreshold"] = 80,                -- hunter high threshold
	["lowThreshold"] = 20,                 -- global low threshold, for low mana warning.

	["targetpowerpvponly"] = true,         -- enable power text on pvp target only

	["totdebuffs"] = false,                -- enable tot debuffs (high reso only)
	["focusdebuffs"] = false,              -- enable focus debuffs 

	["showfocustarget"] = false,           -- show focus target
	["showtotalhpmp"] = false,             -- change the display of info text on player and target with XXXX/Total.
	["showsmooth"] = true,                 -- enable smooth bar
	["showthreat"] = true,                 -- enable the threat bar anchored to info left panel.

	["charportrait"] = true,              -- do i really need to explain this?
	["maintank"] = false,  					-- enable maintank
	["mainassist"] = false,					-- enable mainassist

	["combatfeedback"] = true,             -- enable combattext on player and target.

	["playeraggro"] = true,                -- color player border to red if you have aggro on current target.
	
	["positionbychar"] = true,             -- save X, Y position with /uf (movable frame) per character instead of per account.
	
	["healcomm"] = false,                  -- enable healprediction support.

	["classcolor"] = false,
		["health_color"] = { .15, .15, .15 },
		["health_bg_color"] = { .05, .05, .05 },
	
	-- raid layout
	["showrange"] = true,                  -- show range opacity on raidframes
	["raidalphaoor"] = 0.3,                -- alpha of unitframes when unit is out of range
	["showsymbols"] = true,	               -- show symbol.
	["aggro"] = true,                      -- show aggro on all raids layouts
	["raidunitdebuffwatch"] = true,        -- track important spell to watch in pve for grid mode.
	["gridhealthvertical"] = true,         -- enable vertical grow on health bar for grid mode.
	["showplayerinparty"] = false,         -- show my player frame in party
	
	-- boss frames
	["showboss"] = true,                   -- enable boss unit frames for PVELOL encounters.

	-- priest only plugin
	["ws_show_player"] = true,             -- show weakened soul bar on player unit
	["ws_show_target"] = true,             -- show weakened soul bar on target unit
	
	-- death knight only plugin
	["runebar"] = true,                    -- enable tukui runebar plugin
	
	-- shaman only plugin
	["totemtimer"] = true,                 -- enable tukui totem timer plugin
}


----- [[     Arena Settings     ]] -----

TukuiCF["arena"] = {
	["unitframes"] = true,                 -- enable tukz arena unitframes (requirement : tukui unitframes enabled)
	["spelltracker"] = true,               -- enable tukz enemy spell tracker (an afflicted3 or interruptbar alternative)
}


----- [[     Actionbar Settings     ]] -----

TukuiCF["actionbar"] = {
	["enable"] = true,                     -- enable tukz action bars
	["hotkey"] = true,                     -- enable hotkey display because it was a lot requested
	["hideshapeshift"] = false,            -- hide shapeshift or totembar because it was a lot requested.
	["bottomrows"] = 1,                    -- numbers of row you want to show at the bottom (select between 1 and 2 only)
	["rightbars"] = 1,                     -- numbers of right bar you want
	["showgrid"] = true,                   -- show grid on empty button
	
	["split_bar"] = true,
	["mainbar_swap"] = false,
	["vertical_rightbars"] = false,
	["vertical_shapeshift"] = false,
	
	["tukui_default"] = true,
	
	["buttonsize"] = 27,
	["petbuttonsize"] = 27,
	["stancebuttonsize"] = 27,
	["buttonspacing"] = 3,
	
	["split_bar_mouseover"] = false,
	["rightbar_mouseover"] = false,
	["petbar_mouseover"] = false,
	["shapeshift_mouseover"] = false,
}


----- [[     Panel Settings     ]] -----

TukuiCF["panels"] = {
	["tinfowidth"] = 370,
	["infoheight"] = 21, -- controls the height of datatext panels
}


----- [[     Nameplate Settings     ]] -----

TukuiCF["nameplate"] = {
	["enable"] = true,                     -- enable nice skinned nameplates that fit into tukui
}


----- [[     Bag Settings     ]] -----

TukuiCF["bags"] = {
	["enable"] = true,                     -- enable an all in one bag mod that fit tukui perfectly
}


----- [[     Map Settings     ]] -----

TukuiCF["map"] = {
	["enable"] = true,                     -- reskin the map to fit tukui
}


----- [[     Loot Settings     ]] -----

TukuiCF["loot"] = {
	["lootframe"] = true,                  -- reskin the loot frame to fit tukui
	["rolllootframe"] = true,              -- reskin the roll frame to fit tukui
	["autogreed"] = true,                  -- auto-dez or auto-greed item at max level, auto-greed Frozen orb
}


----- [[     Cooldown Settings     ]] -----

TukuiCF["cooldown"] = {
	["enable"] = true,                     -- do i really need to explain this?
	["treshold"] = 8,                      -- show decimal under X seconds and text turn red
}


----- [[     Datatext Settings     ]] -----

TukuiCF["datatext"] = {
	["bags"] = 0,                          -- show space used in bags on panels
	["gold"] = 0,                          -- show your current gold on panels
	["guild"] = 0,                         -- show number on guildmate connected on panels
	["dur"] = 0,                           -- show your equipment durability on panels.
	["friends"] = 4,                       -- show number of friends connected.
	["dps_text"] = 0,                      -- show a dps meter on panels
	["hps_text"] = 0,                      -- show a heal meter on panels
	["power"] = 6,                         -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 0,                         -- show your haste rating on panels.
	["crit"] = 0,                          -- show your crit rating on panels.
	["avd"] = 0,                           -- show your current avoidance against the level of the mob your targeting
	["armor"] = 3,                         -- show your armor value against the level mob you are currently targeting
	["currency"] = 5,                      -- show your tracked currency on panels

	["hitrating"] = 2,
	["wintergrasp"] = 1,
	
	["location"] = true,
		["coords"] = true,
	
	["battleground"] = false,               -- enable 3 stats in battleground only that replace stat1,stat2,stat3.
	
	["classcolor"] = true,
		["color"] = { .9, .3, .3 },
}


----- [[     Chat Settings     ]] -----

TukuiCF["chat"] = {
	["enable"] = true,                     -- blah
	["whispersound"] = true,               -- play a sound when receiving whisper
	
	["chatheight"] = 120,						-- Set the height of your chat here!
}


----- [[     Tooltip Settings     ]] -----

TukuiCF["tooltip"] = {
	["enable"] = true,                     -- true to enable this mod, false to disable
	["hidecombat"] = false,                -- hide bottom-right tooltip when in combat
	["hidebuttons"] = false,               -- always hide action bar buttons tooltip.
	["hideuf"] = false,                    -- hide tooltip on unitframes
	["cursor"] = false,                    -- tooltip via cursor only
}


----- [[     Merchant Settings     ]] -----

TukuiCF["merchant"] = {
	["sellgrays"] = true,                  -- automaticly sell grays?
	["autorepair"] = true,                 -- automaticly repair?
}


----- [[     Error Settings     ]] -----

TukuiCF["error"] = {
	["enable"] = true,                     -- true to enable this mod, false to disable
	filter = {                             -- what messages to not hide
		["Inventory is full."] = true,     -- inventory is full will not be hidden by default
	},
}


----- [[     Invite Settings     ]] -----

TukuiCF["invite"] = { 
	["autoaccept"] = true,                 -- auto-accept invite from guildmate and friends.
}


----- [[     Buff Reminder Settings     ]] -----

TukuiCF["buffreminder"] = {
	["enable"] = true,                     -- this is now the new innerfire warning script for all armor/aspect class.
	["sound"] = true,                      -- enable warning sound notification for reminder.
}


----- [[     Other Settings     ]] -----

TukuiCF["others"] = {
	["pvpautorelease"] = true,             -- enable auto-release in bg or wintergrasp. (not working for shaman, sorry)
}