local db = TukuiCF["actionbar"]

if not db.enable then return end


----- [[     Stance Bar Mouseover     ]] -----

if not db.hideshapeshift then
	if db.shapeshift_mouseover == true then
		local function shapeshift_mouseover(alpha)
			TukuiShapeShiftBarBackground:SetAlpha(alpha)
			
			if TukuiDB.myclass == "SHAMAN" then
				for i = 1, 12 do
					local pb = _G["MultiCastActionButton"..i]
					pb:SetAlpha(alpha)
				end
				for i = 1, 4 do
					local pb = _G["MultiCastSlotButton"..i]
					pb:SetAlpha(alpha)
				end
				_G["MultiCastSummonSpellButton"]:SetAlpha(alpha)
				_G["MultiCastRecallSpellButton"]:SetAlpha(alpha)
			else
				for i = 1, 10 do
					local pb = _G["ShapeshiftButton"..i]
					pb:SetAlpha(alpha)
				end
			end
		end

		if TukuiDB.myclass == "SHAMAN" then
			TukuiShiftBar:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			TukuiShiftBar:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			MultiCastSummonSpellButton:SetAlpha(0)
			MultiCastSummonSpellButton:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			MultiCastSummonSpellButton:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			MultiCastRecallSpellButton:SetAlpha(0)
			MultiCastRecallSpellButton:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			MultiCastRecallSpellButton:HookScript("OnLeave", function(self)  shapeshift_mouseover(0) end)
			MultiCastFlyoutFrameOpenButton:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			MultiCastFlyoutFrameOpenButton:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)		
			MultiCastFlyoutFrame:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			MultiCastFlyoutFrame:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)		
			MultiCastActionBarFrame:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			MultiCastActionBarFrame:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)		

			for i = 1, 4 do
				local pb = _G["MultiCastSlotButton"..i]
				pb:SetAlpha(0)
				pb:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
				pb:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			end
			
			for i = 1, 4 do
				local pb = _G["MultiCastActionButton"..i]
				pb:SetAlpha(0)
				pb:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
				pb:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			end
		else
			TukuiShapeShiftBarBackground:SetAlpha(0)
			TukuiShapeShiftBarBackground:SetScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			TukuiShapeShiftBarBackground:SetScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			TukuiShiftBar:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
			TukuiShiftBar:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			
			for i = 1, 10 do
				local pb = _G["ShapeshiftButton"..i]
				pb:SetAlpha(0)
				pb:HookScript("OnEnter", function(self) shapeshift_mouseover(1) end)
				pb:HookScript("OnLeave", function(self) shapeshift_mouseover(0) end)
			end
		end
	end
end


----- [[     Split Bar Mouseover     ]] -----

if db.split_bar == true and db.split_bar_mouseover == true then
	local function split_bar_alpha(alpha)
		TukuiLeftSplitBarBackground:SetAlpha(alpha)
		TukuiRightSplitBarBackground:SetAlpha(alpha)
		
		if MultiBarLeft:IsShown() then
			for i=1, 12 do
				local pb = _G["MultiBarLeftButton"..i]
				pb:SetAlpha(alpha)
			end
			MultiBarLeft:SetAlpha(alpha)
		end
	end

	TukuiLeftSplitBarBackground:SetAlpha(0)
	TukuiRightSplitBarBackground:SetAlpha(0)
	TukuiLeftSplitBarBackground:SetScript("OnEnter", function(self) split_bar_alpha(1) end)
	TukuiLeftSplitBarBackground:SetScript("OnLeave", function(self) split_bar_alpha(0) end)
	TukuiRightSplitBarBackground:SetScript("OnEnter", function(self) split_bar_alpha(1) end)
	TukuiRightSplitBarBackground:SetScript("OnLeave", function(self) split_bar_alpha(0) end)

	for i = 1, 12 do
		local pb = _G["MultiBarLeftButton"..i]
		pb:SetAlpha(0)
		pb:HookScript("OnEnter", function(self) split_bar_alpha(1) end)
		pb:HookScript("OnLeave", function(self) split_bar_alpha(0) end)
	end
end


----- [[     Pet Bar Mouseover     ]] -----

if (db.petbar_mouseover == true) or (db.rightbar_mouseover == true and db.rightbars > 0) then
	function petbar_mouseover(alpha)
		TukuiPetActionBarBackground:SetAlpha(alpha)
		
		for i=1, NUM_PET_ACTION_SLOTS do
			local pb = _G["PetActionButton"..i]
			pb:SetAlpha(alpha)
		end
	end

	if db.petbar_mouseover == true and db.rightbars == 0 then
		TukuiPetActionBarBackground:SetAlpha(0)
		TukuiPetActionBarBackground:SetScript("OnEnter", function(self) petbar_mouseover(1) end)
		TukuiPetActionBarBackground:SetScript("OnLeave", function(self) petbar_mouseover(0) end)

		for i=1, NUM_PET_ACTION_SLOTS do
			local pb = _G["PetActionButton"..i]
			pb:SetAlpha(0)
			pb:HookScript("OnEnter", function(self) petbar_mouseover(1) end)
			pb:HookScript("OnLeave", function(self) petbar_mouseover(0) end)
		end
	end
end


----- [[     Right Bar Mouseover     ]] -----

if db.rightbar_mouseover == true and db.rightbars > 0 then
	local function rightbar_alpha(alpha)
		TukuiActionBarBackgroundRight:SetAlpha(alpha)
		
		if not db.split_bar and db.rightbars > 2 then
			if MultiBarLeft:IsShown() then
				for i=1, 12 do
					local pb = _G["MultiBarLeftButton"..i]
					pb:SetAlpha(alpha)
				end
				MultiBarLeft:SetAlpha(alpha)
			end
		end
		if db.rightbars > 1 then
			if MultiBarBottomRight:IsShown() then
				for i=1, 12 do
					local pb = _G["MultiBarBottomRightButton"..i]
					pb:SetAlpha(alpha)
				end
				MultiBarBottomRight:SetAlpha(alpha)
			end
		end
		if db.rightbars > 0 then
			if MultiBarRight:IsShown() then
				for i=1, 12 do
					local pb = _G["MultiBarRightButton"..i]
					pb:SetAlpha(alpha)
				end
				MultiBarRight:SetAlpha(alpha)
			end
		end
	end

	TukuiActionBarBackgroundRight:SetAlpha(0)
	TukuiActionBarBackgroundRight:SetScript("OnEnter", function(self) petbar_mouseover(1) rightbar_alpha(1) end)
	TukuiActionBarBackgroundRight:SetScript("OnLeave", function(self) petbar_mouseover(0) rightbar_alpha(0) end)

	for i=1, 12 do
		local pb = _G["MultiBarRightButton"..i]
		pb:SetAlpha(0)
		pb:HookScript("OnEnter", function(self) petbar_mouseover(1) rightbar_alpha(1) end)
		pb:HookScript("OnLeave", function(self) petbar_mouseover(0) rightbar_alpha(0) end)
		
		if not db.split_bar then
			local pb = _G["MultiBarLeftButton"..i]
			pb:SetAlpha(0)
			pb:HookScript("OnEnter", function(self) petbar_mouseover(1) rightbar_alpha(1) end)
			pb:HookScript("OnLeave", function(self) petbar_mouseover(0) rightbar_alpha(0) end)
		end
		
		local pb = _G["MultiBarBottomRightButton"..i]
		pb:SetAlpha(0)
		pb:HookScript("OnEnter", function(self) petbar_mouseover(1) rightbar_alpha(1) end)
		pb:HookScript("OnLeave", function(self) petbar_mouseover(0) rightbar_alpha(0) end)
	end
	
	TukuiPetActionBarBackground:SetAlpha(0)
	TukuiPetActionBarBackground:SetScript("OnEnter", function(self) petbar_mouseover(1) rightbar_alpha(1) end)
	TukuiPetActionBarBackground:SetScript("OnLeave", function(self) petbar_mouseover(0) rightbar_alpha(0) end)
	
	for i=1, NUM_PET_ACTION_SLOTS do
		local pb = _G["PetActionButton"..i]
		pb:SetAlpha(0)
		pb:HookScript("OnEnter", function(self) petbar_mouseover(1) rightbar_alpha(1) end)
		pb:HookScript("OnLeave", function(self) petbar_mouseover(0) rightbar_alpha(0) end)
	end
end