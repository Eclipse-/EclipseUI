local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["chat"].enable ~= true then return end

-----------------------------------------------------------------------
-- SETUP TUKUI CHATS
-----------------------------------------------------------------------

local TukuiChat = CreateFrame("Frame")
local _G = _G
local origs = {}
local type = type

-- function to rename channel and other stuff
local AddMessage = function(self, text, ...)
	if(type(text) == "string") then
		text = text:gsub('|h%[(%d+)%. .-%]|h', '|h[%1]|h')
	end
	return origs[self](self, text, ...)
end

-- localize this later k tukz? DON'T FORGET!
_G.CHAT_BATTLEGROUND_GET = "|Hchannel:Battleground|h"..L.chat_BATTLEGROUND_GET.."|h %s:\32"
_G.CHAT_BATTLEGROUND_LEADER_GET = "|Hchannel:Battleground|h"..L.chat_BATTLEGROUND_LEADER_GET.."|h %s:\32"
_G.CHAT_BN_WHISPER_GET = L.chat_BN_WHISPER_GET.." %s:\32"
_G.CHAT_GUILD_GET = "|Hchannel:Guild|h"..L.chat_GUILD_GET.."|h %s:\32"
_G.CHAT_OFFICER_GET = "|Hchannel:o|h"..L.chat_OFFICER_GET.."|h %s:\32"
_G.CHAT_PARTY_GET = "|Hchannel:Party|h"..L.chat_PARTY_GET.."|h %s:\32"
_G.CHAT_PARTY_GUIDE_GET = "|Hchannel:party|h"..L.chat_PARTY_GUIDE_GET.."|h %s:\32"
_G.CHAT_PARTY_LEADER_GET = "|Hchannel:party|h"..L.chat_PARTY_LEADER_GET.."|h %s:\32"
_G.CHAT_RAID_GET = "|Hchannel:raid|h"..L.chat_RAID_GET.."|h %s:\32"
_G.CHAT_RAID_LEADER_GET = "|Hchannel:raid|h"..L.chat_RAID_LEADER_GET.."|h %s:\32"
_G.CHAT_RAID_WARNING_GET = L.chat_RAID_WARNING_GET.." %s:\32"
_G.CHAT_SAY_GET = "%s:\32"
_G.CHAT_WHISPER_GET = L.chat_WHISPER_GET.." %s:\32"
_G.CHAT_YELL_GET = "%s:\32"
 
_G.CHAT_FLAG_AFK = "|cffFF0000"..L.chat_FLAG_AFK.."|r "
_G.CHAT_FLAG_DND = "|cffE7E716"..L.chat_FLAG_DND.."|r "
_G.CHAT_FLAG_GM = "|cff4154F5"..L.chat_FLAG_GM.."|r "
 
_G.ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h[%s]|h "..L.chat_ERR_FRIEND_ONLINE_SS.."!"
_G.ERR_FRIEND_OFFLINE_S = "%s "..L.chat_ERR_FRIEND_OFFLINE_S.."!"

-- Hide friends micro button (added in 3.3.5)
FriendsMicroButton:Kill()

-- hide chat bubble menu button
ChatFrameMenuButton:Kill()

-- set the chat style
local function SetChatStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat.."Tab"]
	
	-- always set alpha to 1, don't fade it anymore
	tab:SetAlpha(1)
	tab.SetAlpha = UIFrameFadeRemoveFrame
	
	if not C["chat"].background then
		-- hide text when setting chat
		_G[chat.."TabText"]:Hide()
		
		-- now show text if mouse is found over tab.
		tab:HookScript("OnEnter", function() _G[chat.."TabText"]:Show() end)
		tab:HookScript("OnLeave", function() _G[chat.."TabText"]:Hide() end)
	end

	-- yeah baby
	_G[chat]:SetClampRectInsets(0,0,0,0)
	
	-- Removes crap from the bottom of the chatbox so it can go to the bottom of the screen.
	_G[chat]:SetClampedToScreen(false)
	
	-- Stop the chat chat from fading out
	_G[chat]:SetFading(false)
	
	-- move the chat edit box
	_G[chat.."EditBox"]:ClearAllPoints()
	_G[chat.."EditBox"]:Point("TOPLEFT", TukuiTabsLeftBackground or TukuiInfoLeft, 2, -2)
	_G[chat.."EditBox"]:Point("BOTTOMRIGHT", TukuiTabsLeftBackground or TukuiInfoLeft, -2, 2)	
	
	-- Hide textures
	for j = 1, #CHAT_FRAME_TEXTURES do
		_G[chat..CHAT_FRAME_TEXTURES[j]]:SetTexture(nil)
	end

	-- Removes Default ChatFrame Tabs texture				
	_G[format("ChatFrame%sTabLeft", id)]:Kill()
	_G[format("ChatFrame%sTabMiddle", id)]:Kill()
	_G[format("ChatFrame%sTabRight", id)]:Kill()

	_G[format("ChatFrame%sTabSelectedLeft", id)]:Kill()
	_G[format("ChatFrame%sTabSelectedMiddle", id)]:Kill()
	_G[format("ChatFrame%sTabSelectedRight", id)]:Kill()
	
	_G[format("ChatFrame%sTabHighlightLeft", id)]:Kill()
	_G[format("ChatFrame%sTabHighlightMiddle", id)]:Kill()
	_G[format("ChatFrame%sTabHighlightRight", id)]:Kill()

	-- Killing off the new chat tab selected feature
	_G[format("ChatFrame%sTabSelectedLeft", id)]:Kill()
	_G[format("ChatFrame%sTabSelectedMiddle", id)]:Kill()
	_G[format("ChatFrame%sTabSelectedRight", id)]:Kill()

	-- Kills off the new method of handling the Chat Frame scroll buttons as well as the resize button
	-- Note: This also needs to include the actual frame textures for the ButtonFrame onHover
	_G[format("ChatFrame%sButtonFrameUpButton", id)]:Kill()
	_G[format("ChatFrame%sButtonFrameDownButton", id)]:Kill()
	_G[format("ChatFrame%sButtonFrameBottomButton", id)]:Kill()
	_G[format("ChatFrame%sButtonFrameMinimizeButton", id)]:Kill()
	_G[format("ChatFrame%sButtonFrame", id)]:Kill()

	-- Kills off the retarded new circle around the editbox
	_G[format("ChatFrame%sEditBoxFocusLeft", id)]:Kill()
	_G[format("ChatFrame%sEditBoxFocusMid", id)]:Kill()
	_G[format("ChatFrame%sEditBoxFocusRight", id)]:Kill()

	-- Kill off editbox artwork
	local a, b, c = select(6, _G[chat.."EditBox"]:GetRegions()) a:Kill() b:Kill() c:Kill()
	
	-- Disable alt key usage
	_G[chat.."EditBox"]:SetAltArrowKeyMode(false)
	
	-- hide editbox on login
	_G[chat.."EditBox"]:Hide()

	-- script to hide editbox instead of fading editbox to 0.35 alpha via IM Style
	_G[chat.."EditBox"]:HookScript("OnEditFocusLost", function(self) self:Hide() end)
	
	-- hide edit box every time we click on a tab
	_G[chat.."Tab"]:HookScript("OnClick", function() _G[chat.."EditBox"]:Hide() end)
	
	-- create our own texture for edit box
	local EditBoxBackground = CreateFrame("frame", "TukuiChatchatEditBoxBackground", _G[chat.."EditBox"])
	EditBoxBackground:CreatePanel("Default", 1, 1, "LEFT", _G[chat.."EditBox"], "LEFT", 0, 0)
	EditBoxBackground:ClearAllPoints()
	EditBoxBackground:SetAllPoints(TukuiTabsLeftBackground or TukuiInfoLeft)
	EditBoxBackground:SetFrameStrata("LOW")
	EditBoxBackground:SetFrameLevel(1)
	
	if EditBoxBackground.shadow then
		EditBoxBackground.shadow:Kill()
	end

	local function colorize(r,g,b)
		EditBoxBackground:SetBackdropBorderColor(r, g, b)
	end
	
	-- update border color according where we talk
	hooksecurefunc("ChatEdit_UpdateHeader", function()
		local type = _G[chat.."EditBox"]:GetAttribute("chatType")
		if ( type == "CHANNEL" ) then
		local id = GetChannelName(_G[chat.."EditBox"]:GetAttribute("channelTarget"))
			if id == 0 then
				colorize(unpack(C.media.bordercolor))
			else
				colorize(ChatTypeInfo[type..id].r,ChatTypeInfo[type..id].g,ChatTypeInfo[type..id].b)
			end
		else
			colorize(ChatTypeInfo[type].r,ChatTypeInfo[type].g,ChatTypeInfo[type].b)
		end
	end)
	
	if _G[chat] ~= _G["ChatFrame2"] then
		origs[_G[chat]] = _G[chat].AddMessage
		_G[chat].AddMessage = AddMessage
	end
	
	_G[chat.."TabText"]:SetFont(unpack(T.Fonts.cTab.setfont))
	_G[chat.."TabText"]:SetTextColor(unpack(C["datatext"].color))
	_G[chat.."TabText"].SetTextColor = T.dummy
	_G[chat.."TabText"]:SetShadowOffset(0, 0)
	_G[chat.."TabText"]:ClearAllPoints()
	_G[chat.."TabText"]:Point("CENTER", _G[chat.."Tab"], "CENTER", 0, -3)
	_G[chat.."TabText"].SetPoint = T.dummy
	_G[chat]:SetFont(unpack(T.Fonts.cGeneral.setfont))
end
-- Setup chatframes 1 to 10 on login.
local function SetupChat(self)	
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		SetChatStyle(frame)
	end

	-- Remember last channel
	ChatTypeInfo.WHISPER.sticky = 1
	ChatTypeInfo.BN_WHISPER.sticky = 1
	ChatTypeInfo.OFFICER.sticky = 1
	ChatTypeInfo.RAID_WARNING.sticky = 1
	ChatTypeInfo.CHANNEL.sticky = 1
end

local function SetupChatPosAndFont(self)	
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format("ChatFrame%s", i)]
		local id = chat:GetID()
		local _, fontSize = FCF_GetChatWindowInfo(id)
		
		FCF_SetChatWindowFontSize(nil, chat, fontSize)
		
		-- force chat position on #1 and #4, needed if we change ui scale or resolution
		-- also set original width and height of chatframes 1 and 4 if first time we run tukui.
		-- doing resize of chat also here for users that hit "cancel" when default installation is show.
				
		if i == 1 then
			chat:ClearAllPoints()
			chat:Point("TOPLEFT", TukuiTabsLeft, "BOTTOMLEFT", 0, -4)
			chat:Point("BOTTOMRIGHT", TukuiInfoLeft, "TOPRIGHT", 0, 4)
			FCF_SavePositionAndDimensions(chat)
		elseif i == 4 then
			if not chat.isDocked then
				chat:ClearAllPoints()
				chat:Point("TOPLEFT", TukuiTabsRight, "BOTTOMLEFT", 0, -4)
				chat:Point("BOTTOMRIGHT", TukuiInfoRight, "TOPRIGHT", 0, 4)
				FCF_SavePositionAndDimensions(chat)
				
				if C["chat"].justifyRight == true then
					chat:SetJustifyH("RIGHT") 
				end
			end
		end
		chat:SetHeight(0)
		chat:SetWidth(0)
	end

	-- reposition battle.net popup over chat #1
	BNToastFrame:HookScript("OnShow", function(self)
		self:ClearAllPoints()
		self:Point("BOTTOMLEFT", TukuiChatLeft, "TOPLEFT", 0, 3)
	end)
	
		
	-- derp blizzard
	local func = ChatEdit_UpdateHeader
	
	ChatEdit_UpdateHeader = function(editBox)
		local header = _G[editBox:GetName().."Header"]
		header:ClearAllPoints()
		header:SetPoint("LEFT", editBox, "LEFT", 15, 0)
		
		if header:GetRight() ~= nil and header:GetLeft() ~= nil then
			func(editBox)
		end
	end
end

TukuiChat:RegisterEvent("ADDON_LOADED")
TukuiChat:RegisterEvent("UPDATE_CHAT_WINDOWS")
TukuiChat:RegisterEvent("PLAYER_ENTERING_WORLD")
TukuiChat:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" then
		if addon == "Blizzard_CombatLog" then
			self:UnregisterEvent("ADDON_LOADED")
			SetupChat(self)
		end
	elseif event == "PLAYER_ENTERING_WORLD" then
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		SetupChatPosAndFont(self)
	elseif event == "UPDATE_CHAT_WINDOWS" then
		SetupChatPosAndFont(self)
	end
end)

-- Setup temp chat (BN, WHISPER) when needed.
local function SetupTempChat()
	local frame = FCF_GetCurrentChatFrame()
	SetChatStyle(frame)
end
hooksecurefunc("FCF_OpenTemporaryWindow", SetupTempChat)