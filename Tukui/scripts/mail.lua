-- All credits to the author of MailGet2

function MG_Show()
	if (MG_OldShow) then
		MG_OldShow()
	end
	
	OpenMailTakeButton:Show();
end

function MG_Hide()
	if (MG_OldHide) then
		MG_OldHide()
	end
	
	OpenMailTakeButton:Hide();
end

function MG_GetMailItems()
	_, _, _, _, money, _, _, hasItem = GetInboxHeaderInfo(MG_MailItemIndex);
	MG_MailIndexes = nil;
	MG_MailIndexes = {}
	counter = 0;
	
	if (hasItem) or (money > 0) then
		if (money > 0) then
			MG_TakeMoney = true
		end
		for i=1,ATTACHMENTS_MAX_RECEIVE do
			if (GetInboxItem(MG_MailItemIndex, i)) then
				MG_MailQueue[i] = GetInboxItemLink(MG_MailItemIndex, i);
				counter = counter + 1;
				MG_MailIndexes[counter] = i;
			end
		end
		MG_TakingSmall = true;
		MG_TakingBig = false;
		MG_FlushQueue(1);
	end
end

function MG_OnEvent(event)
	if (MG_TakingSmall) then
		if (OpenMailFrame:IsShown()) then
			if (MG_TakeIndex > 1) and (MG_ReceivedItem) then
				MG_ReceivedItem = false;
				MG_FlushQueue(MG_TakeIndex);
			end
		end
	end
	
	if (MG_TakingBig) then
		if (MailFrame:IsShown()) then
			MG_FlushBigQueue(MG_TakeIndex);
		end
	end
end

function MG_FlushQueue(index)
	itemIndex = MG_MailIndexes[index];
	if (MG_MailQueue[itemIndex]) then
		-- take the item, set a global index variable to index+1, wait for event to take next item
		TakeInboxItem(MG_MailItemIndex, itemIndex);
		MG_ReceivedItem = true;
		MG_TakeIndex = index + 1;
	else
		-- take money if it has some
		if (MG_TakeMoney) then
			MG_TakeMoney = false;
			TakeInboxMoney(MG_MailItemIndex);
		end
		return;
	end
end

function MG_Next()
	MG_MailIndex = MG_MailIndex + 1;
	MG_NextScript();
end

function MG_Prev()
	MG_MailIndex = MG_MailIndex - 1;
	MG_PrevScript();
end

function MG_OpenMail(button)
	local button_text = button:GetName();
	local button_num = tonumber(string.sub(button_text, 9, 9));
	MG_MailItemIndex = MG_MailIndex * button_num;
	button.oldscript(button);
end

function MG_GetAllMailItems()
	MG_AllItems = {}
	MG_HasMoney = {}
	MG_MailIndexes = {}
	MG_MailQueue = {}
	counter = 0;
	local MG_TotalMoney = 0;
	local bPrintMoney = false;
	
	i = GetInboxNumItems();
	
	while (i > 0) do
		packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, hasItem, wasRead, wasReturned, textCreated, canReply, isGM = GetInboxHeaderInfo(i);
		
		if (hasItem) or (money > 0) then
			if (money > 0) then
				MG_HasMoney[i] = true
				bPrintMoney = true;
				MG_TotalMoney = MG_TotalMoney + money;
				
				if ((MGDB['take_ah']) and (canReply ~= true)) then
					index = i .. "/auction";
					counter = counter + 1;
					MG_MailIndexes[counter] = index;
				end
			end
			
			if (((CODAmount > 0) and (MGDB['pay_cod'])) or (CODAmount == 0)) then
				for n=1,ATTACHMENTS_MAX_RECEIVE do
					if (GetInboxItem(i, n)) then
						index = i .. "/" .. n;
						counter = counter + 1;
						MG_MailQueue[index] = GetInboxItemLink(i, n);
						MG_MailIndexes[counter] = index;
					end
				end
			end
		end
		i = i - 1;
	end
	
	local gold = math.floor( MG_TotalMoney / 10000 );
	local silver = math.floor( (MG_TotalMoney % 10000) / 100 );
	local copper = math.floor( (MG_TotalMoney % 10000) % 100 );

	if( bPrintMoney ) then
		print( string.format("Mail: |cFFFFFF00%u|rg |cFF888888%u|rs |cFFFF8800%u|rc received.", gold, silver, copper) );
	end
	
	MG_TakingSmall = false;
	MG_TakingBig = true;
	MG_FlushBigQueue(1);
end

function MG_FlushBigQueue(index)
	if (MG_MailIndexes[index]) then
		itemIndex = MG_MailIndexes[index];
		list = MG_strsplit('/', itemIndex);
		if (list[2] == "auction") then
			i = tonumber(list[1]);
			TakeInboxMoney(i);
			MG_TakeIndex = index + 1;
		else
			i = tonumber(list[1]);
			n = tonumber(list[2]);
			
			if (MG_HasMoney[i]) then
				TakeInboxMoney(i);
				MG_HasMoney[i] = false;
				MG_TakeIndex = index;
			else
				if (MG_MailQueue[itemIndex]) then
					-- take the item, set a global index variable to index+1, wait for event to take next item
					TakeInboxItem(i, n);
					MG_TakeIndex = index + 1;
				else
					return;
				end
			end
		end
	else
		CheckInbox(); -- to clear stupid mail icon from minimap
		return
	end
end

function MG_strsplit(delimiter, text)
	local list = {}
	local pos = 1
	if strfind("", delimiter, 1) then -- this would result in endless loops
		error("delimiter matches empty string!")
	end
	while 1 do
		local first, last = strfind(text, delimiter, pos)
		if first then -- found?
			tinsert(list, strsub(text, pos, first-1))
			pos = last + 1
		else
			tinsert(list, strsub(text, pos))
			break
		end
	end
	return list
end

function MG_ToggleAH()
	MGDB['take_ah'] = OpenMailTakeAH:GetChecked();
end

function MG_ShowOMTA()
	OpenMailTakeAH:SetChecked(MGDB['take_ah']);
end

function MG_ToggleCOD()
	MGDB['pay_cod'] = OpenMailPayCOD:GetChecked();
end

function MG_ShowOMTA()
	OpenMailPayCOD:SetChecked(MGDB['pay_cod']);
end

local g_frame = CreateFrame( "Frame", "G_FRAME" );
g_frame:RegisterEvent( "PLAYER_LOGIN" );
g_frame:SetScript( "OnEvent", GlobalEventHandler );

-- Initialize variables

g_version = 2.0;
g_wow_version = 3.2;
g_interface = 30200;

MGDB = {}
if (MGDB['take_ah'] == nil) then
	MGDB['take_ah'] = false;
end
if (MGDB['pay_cod'] == nil) then
	MGDB['pay_cod'] = false;
end

--make new button

mailButton = CreateFrame("Button", "OpenMailTakeButton", OpenMail, "UIPanelButtonTemplate");
mailButton:Hide();
mailButton:SetWidth(OpenMailReplyButton:GetWidth()-5);
mailButton:SetHeight(OpenMailReplyButton:GetHeight());
mailButton:SetFrameStrata('DIALOG');
mailButton:SetPoint("right","OpenMailReplyButton","left");
mailButton:SetText('Take All');
mailButton:SetScript('OnClick', MG_GetMailItems);
mailButton:SetScript('OnEvent', MG_OnEvent);
mailButton:RegisterEvent('PLAYER_MONEY');
mailButton:RegisterEvent('CHAT_MSG_LOOT');

--some default variables

MG_MailIndex = 1;
MG_MailItemIndex = 0;
MG_MailQueue = {}
MG_MailIndexes = {}
MG_TakeIndex = 1;
MG_TakeMoney = false;

--set some scripts

MG_NextScript = InboxNextPageButton:GetScript('OnClick');
MG_PrevScript = InboxPrevPageButton:GetScript('OnClick');

InboxNextPageButton:SetScript('OnClick', MG_Next);
InboxPrevPageButton:SetScript('OnClick', MG_Prev);

for i=1,7 do 
	mailboxbutton = getglobal('MailItem' .. i .. 'Button');
	mailboxbutton.oldscript = mailboxbutton:GetScript('OnClick');
	mailboxbutton:SetScript('OnClick', MG_OpenMail);
end


if (OpenMailFrame:GetScript('OnShow')) then
	MG_OldShow = OpenMailFrame:GetScript('OnShow');
end

if (OpenMailFrame:GetScript('OnHide')) then
	MG_OldHide = OpenMailFrame:GetScript('OnHide');
end

OpenMailFrame:SetScript('OnShow', MG_Show);
OpenMailFrame:SetScript('OnHide', MG_Hide);

bigMailButton = CreateFrame("Button", "MailFrameTakeButton", InboxFrame);
bigMailButton:SetWidth(OpenMailReplyButton:GetWidth());
bigMailButton:SetHeight(OpenMailReplyButton:GetHeight());
bigMailButton:SetPoint("top","MailFrame","top", -60, -43);
bigMailButton:SetScript("OnClick", MG_GetAllMailItems);
bigMailButton:SetScript("OnEnter", function()
	bigMailButton:SetBackdropBorderColor(RAID_CLASS_COLORS[TukuiDB.myclass].r, RAID_CLASS_COLORS[TukuiDB.myclass].g, RAID_CLASS_COLORS[TukuiDB.myclass].b)
end)
bigMailButton:SetScript("OnLeave", function()
	bigMailButton:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor))
end)

bigMailButton.text = bigMailButton:CreateFontString(nil, "OVERLAY")
bigMailButton.text:SetAllPoints(bigMailButton)
bigMailButton.text:SetFont(TukuiCF["fonts"].general_font, TukuiCF["fonts"].general_font_size, TukuiCF["fonts"].general_font_style)
bigMailButton.text:SetText("Take All");

TukuiDB.SkinFadedPanel(bigMailButton)

--OptionsCheckButtonTemplate
checkButton = CreateFrame("CheckButton", "OpenMailTakeAH", bigMailButton, "OptionsCheckButtonTemplate");
checkButton:SetPoint("left", bigMailButton, "right", 20, 10);
-- checkButton:SetFrameStrata('DIALOG');
OpenMailTakeAHText:SetText('Take AH Winnings');
OpenMailTakeAH:SetScript('OnClick', MG_ToggleAH);
OpenMailTakeAH:SetScript('OnShow', MG_ShowOMTA);
OpenMailTakeAH:SetScale(.75);

--OptionsCheckButtonTemplate
checkButton2 = CreateFrame("CheckButton", "OpenMailPayCOD", bigMailButton, "OptionsCheckButtonTemplate");
checkButton2:SetPoint("left", bigMailButton, "right", 20, -11);
checkButton2:SetFrameStrata('DIALOG');
OpenMailPayCODText:SetText('Pay CODs automatically');
OpenMailPayCOD:SetScript('OnClick', MG_ToggleCOD);
OpenMailPayCOD:SetScript('OnShow', MG_ShowCOD);
OpenMailPayCOD:SetScale(.75);

