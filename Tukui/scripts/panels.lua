----- [[     Local Variables     ]] -----

local panels = TukuiCF["panels"]
local chat = TukuiCF["chat"]
local db = TukuiCF["actionbar"]


----- [[     Top "Art" Panel     ]] -----

local tbar = CreateFrame("Frame", "TukuiTopBar", UIParent)
TukuiDB.CreatePanel(tbar, (GetScreenWidth() * UIParent:GetEffectiveScale()) * 2, 22, "TOP", UIParent, "TOP", 0, TukuiDB.Scale(5))
tbar:SetFrameLevel(0)


----- [[     Bottom "Art" Panel     ]] -----

local bbar = CreateFrame("Frame", "TukuiBottomBar", UIParent)
TukuiDB.CreatePanel(bbar, (GetScreenWidth() * UIParent:GetEffectiveScale()) * 2, 22, "BOTTOM", UIParent, "BOTTOM", 0, TukuiDB.Scale(-5))
bbar:SetFrameLevel(0)


----- [[     Left Data Panel     ]] -----

local dleft = CreateFrame("Frame", "TukuiDataLeft", UIParent)
TukuiDB.CreatePanel(dleft,panels.tinfowidth, panels.infoheight, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", TukuiDB.Scale(8), TukuiDB.Scale(8))


----- [[     Right Data Panel     ]] -----

local dright = CreateFrame("Frame", "TukuiDataRight", UIParent)
TukuiDB.CreatePanel(dright, panels.tinfowidth, panels.infoheight, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", TukuiDB.Scale(-8), TukuiDB.Scale(8))


----- [[     Left Chat Background and Tabs     ]] -----

local cleft = CreateFrame("Frame", "TukuiChatLeft", UIParent)
TukuiDB.CreateFadedPanel(cleft, panels.tinfowidth, chat.chatheight - 3, "BOTTOM", dleft, "TOP", 0, TukuiDB.Scale(3))

local cltabs = CreateFrame("Frame", "TukuiChatLeftTabs", UIParent)
TukuiDB.CreatePanel(cltabs, panels.tinfowidth, panels.infoheight, "BOTTOM", cleft, "TOP", 0, TukuiDB.Scale(3))


----- [[     Right Chat Background and Tabs     ]] -----

local cright = CreateFrame("Frame", "TukuiChatRight", UIParent)
TukuiDB.CreateFadedPanel(cright, panels.tinfowidth, chat.chatheight - 3, "BOTTOM", dright, "TOP", 0, TukuiDB.Scale(3))

local crtabs = CreateFrame("Frame", "TukuiChatRightTabs", UIParent)
TukuiDB.CreatePanel(crtabs, panels.tinfowidth, panels.infoheight, "BOTTOM", cright, "TOP", 0, TukuiDB.Scale(3))


----- [[     Dummy Frames     ]] -----

local barbg = CreateFrame("Frame", "TukuiActionBarBackground", UIParent)
if db.tukui_default == true and not TukuiDB.lowversion then
	barbg:SetWidth((db.buttonsize * 24) + (db.buttonspacing * 23))
else
	barbg:SetWidth((db.buttonsize * 12) + (db.buttonspacing * 11))
end
barbg:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 8)
if db.bottomrows == 2 then
	barbg:SetHeight((db.buttonsize * 2) + (db.buttonspacing * 1))
else
	barbg:SetHeight(db.buttonsize)
end


if db.split_bar == true then
	local leftsbg = CreateFrame("Frame", "TukuiLeftSplitBarBackground", UIParent)
	leftsbg:SetWidth((db.buttonsize * 3) + (db.buttonspacing * 2))
	leftsbg:SetPoint("RIGHT", barbg, "LEFT", -10, 0)

	if db.bottomrows == 2 then
		leftsbg:SetHeight((db.buttonsize * 2) + (db.buttonspacing * 1))
	else
		leftsbg:SetHeight(db.buttonsize)
	end

	local rightsbg = CreateFrame("Frame", "TukuiRightSplitBarBackground", UIParent)
	rightsbg:SetWidth((db.buttonsize * 3) + (db.buttonspacing * 2))
	rightsbg:SetPoint("LEFT", barbg, "RIGHT", 10, 0)

	if db.bottomrows == 2 then
		rightsbg:SetHeight((db.buttonsize * 2) + (db.buttonspacing * 1))
	else
		rightsbg:SetHeight(db.buttonsize)
	end
end


local rightbbg = CreateFrame("Frame", "TukuiActionBarBackgroundRight", UIParent)
rightbbg:SetPoint("BOTTOMRIGHT", crtabs, "TOPRIGHT", 0, 3)
if db.vertical_rightbars == true then
	rightbbg:SetHeight((db.buttonsize * 12) + (db.buttonspacing * 11))
	if db.rightbars == 1 then
		rightbbg:SetWidth(db.buttonsize)
	elseif db.split_bar == true and db.rightbars >= 2 then
		rightbbg:SetWidth((db.buttonsize * 2) + (db.buttonspacing * 1))
	elseif not db.split_bar and db.rightbars == 3 then
		rightbbg:SetWidth((db.buttonsize * 3) + (db.buttonspacing * 2))
	else
		rightbbg:Hide()
	end
else
	rightbbg:SetWidth((db.buttonsize * 12) + (db.buttonspacing * 11))
	if db.rightbars == 1 then
		rightbbg:SetHeight(db.buttonsize)
	elseif db.split_bar == true and db.rightbars >= 2 then
		rightbbg:SetHeight((db.buttonsize * 2) + (db.buttonspacing * 1))
	elseif not db.split_bar and db.rightbars == 3 then
		rightbbg:SetHeight((db.buttonsize * 3) + (db.buttonspacing * 2))
	else
		rightbbg:Hide()
	end
end


local petbg = CreateFrame("Frame", "TukuiPetActionBarBackground", UIParent)
if db.vertical_rightbars == true then
	petbg:SetWidth(db.petbuttonsize)
	petbg:SetHeight((db.petbuttonsize * NUM_PET_ACTION_SLOTS) + (db.buttonspacing * 9))

	if db.rightbars > 0 then
		petbg:SetPoint("BOTTOMRIGHT", rightbbg, "BOTTOMLEFT", -3, 0)
	else
		petbg:SetPoint("BOTTOMRIGHT", crtabs, "TOPRIGHT", 0, 3)
	end
else
	petbg:SetWidth((db.petbuttonsize * NUM_PET_ACTION_SLOTS) + (db.buttonspacing * 9))
	petbg:SetHeight(db.petbuttonsize)

	if db.rightbars > 0 then
		petbg:SetPoint("BOTTOMRIGHT", rightbbg, "TOPRIGHT", 0, 3)
	else
		petbg:SetPoint("BOTTOMRIGHT", crtabs, "TOPRIGHT", 0, 3)
	end
end

if not db.hideshapeshift then
	local shiftbg = CreateFrame("Frame", "TukuiShapeShiftBarBackground", UIParent)
	shiftbg:RegisterEvent("PLAYER_LOGIN")
	shiftbg:RegisterEvent("PLAYER_ENTERING_WORLD")
	shiftbg:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
	shiftbg:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
	shiftbg:SetScript("OnEvent", function(self, event, ...)
		local forms = GetNumShapeshiftForms()
		if forms > 0 then
			if db.vertical_shapeshift == true then
				shiftbg:SetWidth(db.stancebuttonsize)
				shiftbg:SetHeight((db.stancebuttonsize * forms) + ((db.buttonspacing * forms) - 3 ))

				shiftbg:SetPoint("TOPLEFT", _G["ShapeshiftButton1"], "TOPLEFT")
			else
				shiftbg:SetWidth((db.stancebuttonsize * forms) + ((db.buttonspacing * forms) - 3))
				shiftbg:SetHeight(db.stancebuttonsize)

				shiftbg:SetPoint("TOPLEFT", _G["ShapeshiftButton1"], "TOPLEFT")
			end
		end
	end)
end

----- [[     Battleground Statistics Frame     ]] -----

if TukuiCF["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiInfoLeftBattleGround", UIParent)
	TukuiDB.CreatePanel(bgframe, 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(dleft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end