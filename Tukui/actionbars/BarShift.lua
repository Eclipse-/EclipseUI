local db = TukuiCF["actionbar"]

if not db.enable then return end

---------------------------------------------------------------------------
-- Setup Shapeshift Bar
---------------------------------------------------------------------------

local DummyShift = CreateFrame("Frame","DummyShiftBar",UIParent)
local TukuiShift = CreateFrame("Frame","TukuiShiftBar",UIParent)
if TukuiDB.myclass ~= "SHAMAN" and db.vertical_shapeshift == true then
	TukuiDB.CreatePanel(TukuiShift, db.stancebuttonsize, db.stancebuttonsize / 2, "TOPLEFT", 8, -40)
else
	TukuiDB.CreatePanel(TukuiShift, db.stancebuttonsize / 2, db.stancebuttonsize, "TOPLEFT", 8, -40)
end
TukuiShift:SetScript("OnEnter", TukuiDB.SetModifiedBackdrop)
TukuiShift:SetScript("OnLeave", TukuiDB.SetOriginalBackdrop)

TukuiShift:SetAlpha(0)
TukuiShift:SetMovable(true)
TukuiShift:SetUserPlaced(true)
local ssmove = false
local function showmovebutton()
	-- don't allow moving while in combat
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end

	if ssmove == false then
		ssmove = true
		TukuiShift:SetAlpha(1)
		TukuiShift:EnableMouse(true)
		TukuiShift:RegisterForDrag("LeftButton", "RightButton")
		TukuiShift:SetScript("OnDragStart", function(self) self:StartMoving() end)
		TukuiShift:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	elseif ssmove == true then
		ssmove = false
		TukuiShift:SetAlpha(0)
		TukuiShift:EnableMouse(false)
	end
end
SLASH_SHOWMOVEBUTTON1 = "/mss"
SlashCmdList["SHOWMOVEBUTTON"] = showmovebutton

-- hide it if not needed and stop executing code
if db.hideshapeshift == true then TukuiShift:Hide() return end

-- create the shapeshift bar if we enabled it
local bar = CreateFrame("Frame", "TukuiShapeShift", TukuiShift, "SecureHandlerStateTemplate")
bar:ClearAllPoints()
bar:SetAllPoints(TukuiShift)

local States = {
	["DRUID"] = "show",
	["WARRIOR"] = "show",
	["PALADIN"] = "show",
	["DEATHKNIGHT"] = "show",
	["ROGUE"] = "show,",
	["PRIEST"] = "show,",
	["HUNTER"] = "show,",
	["WARLOCK"] = "show,",
}

bar:RegisterEvent("PLAYER_LOGIN")
bar:RegisterEvent("PLAYER_ENTERING_WORLD")
bar:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
bar:RegisterEvent("UPDATE_SHAPESHIFT_USABLE")
bar:RegisterEvent("UPDATE_SHAPESHIFT_COOLDOWN")
bar:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
bar:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
bar:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LOGIN" then
		local button
		for i = 1, NUM_SHAPESHIFT_SLOTS do
			button = _G["ShapeshiftButton"..i]
			button:ClearAllPoints()
			button:SetSize(db.stancebuttonsize, db.stancebuttonsize)
			button:SetParent(DummyShift)
			if i == 1 then
				if db.vertical_shapeshift == true then
					button:SetPoint("TOPLEFT", TukuiShiftBar, "BOTTOMLEFT", 0, -3)
				else
					button:SetPoint("TOPLEFT", TukuiShiftBar, "TOPRIGHT", 3, 0)
				end
			else
				local previous = _G["ShapeshiftButton"..i-1]
				if db.vertical_shapeshift == true then
					button:SetPoint("TOP", previous, "BOTTOM", 0, -db.buttonspacing)
				else
					button:SetPoint("LEFT", previous, "RIGHT", db.buttonspacing, 0)
				end
			end
			local _, name = GetShapeshiftFormInfo(i)
			if name then
				button:Show()
			end
		end
		RegisterStateDriver(self, "visibility", States[TukuiDB.myclass] or "hide")
	elseif event == "UPDATE_SHAPESHIFT_FORMS" then
		-- Update Shapeshift Bar Button Visibility
		-- I seriously don't know if it's the best way to do it on spec changes or when we learn a new stance.
		if InCombatLockdown() then return end -- > just to be safe ;p
		local button
		for i = 1, NUM_SHAPESHIFT_SLOTS do
			button = _G["ShapeshiftButton"..i]
			local _, name = GetShapeshiftFormInfo(i)
			if name then
				button:Show()
			else
				button:Hide()
			end
		end
		TukuiDB.TukuiShiftBarUpdate()
	elseif event == "PLAYER_ENTERING_WORLD" then
		TukuiDB.StyleShift()
	else
		TukuiDB.TukuiShiftBarUpdate()
	end
end)