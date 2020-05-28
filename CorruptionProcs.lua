-- Corruption Procs library.
local CP = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceEvent-3.0")

-- Unit id for the active player.
local ME = "player"

-- The active auras in the previous timestep.
local ACTIVE_AURAS = {}

-- The spellname of the aura we want to track.
local SURGING_VITALITY = "Surging Vitality"

-- Frame of the aura we want to track.
local SV_BAR_FRAME = CreateFrame("frame","MyAddonFrame")
SV_BAR_FRAME:SetBackdrop({
			--				 bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
			bgFile="Interface\\Buttons\\GreenGradient",
			tile=1, tileSize=32, edgeSize=32,
			insets={left=11, right=12, top=12, bottom=11}
})
SV_BAR_FRAME:SetWidth(440)
SV_BAR_FRAME:SetHeight(50)
SV_BAR_FRAME:SetPoint("CENTER", UIParent)
SV_BAR_FRAME:EnableMouse(true)
SV_BAR_FRAME:SetMovable(true)
SV_BAR_FRAME:RegisterForDrag("LeftButton")
SV_BAR_FRAME:SetScript("OnDragStart", function(self) self:StartMoving() end)
SV_BAR_FRAME:SetScript("OnDragStart", function(self) self:StartMoving() end)
SV_BAR_FRAME:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
SV_BAR_FRAME:SetFrameStrata("FULLSCREEN_DIALOG")
local fs = SV_BAR_FRAME:CreateFontString(nil, "OVERLAY", "GameFontNormal")
fs:SetPoint("CENTER")
fs:SetText("Surging Vitality")
fs:SetTextColor(51, 51, 51, 1.0)
SV_BAR_FRAME:Hide()


-- AceAddon lifecycle methods.

function CP:OnInitialize()
	 print("Corruption Procs activated.")
end

function CP:OnEnable()
	 self:RegisterEvent("UNIT_AURA")
end

-- AceEvents.

function CP:UNIT_AURA(event, unitID)
	 if unitID == ME then
			-- Collect all the auras active in the new timestep.
			local new_active_auras = {}
			local index = 1
			name, icon, count, debuffClass, duration, expirationTime, unitCaster, isStealable, _, spellId = UnitAura(ME, index)
			while(name) do
				 new_active_auras[name] = true
				 index = index + 1
				 name, icon, count, debuffClass, duration, expirationTime, unitCaster, isStealable, _, spellId = UnitAura(ME, index)
			end

			-- Compare the new auras against the auras against the previous timestep.
			if new_active_auras[SURGING_VITALITY] then
				 if ACTIVE_AURAS[SURGING_VITALITY] == nil then
						enableSurgingVitality()
				 end
			else
				 if ACTIVE_AURAS[SURGING_VITALITY] then
						disableSurgingVitality()
         end
			end

			-- Set the currently active auras for the next timestep to use.
			ACTIVE_AURAS = new_active_auras
	 end
end

-- Utilities.

function enableSurgingVitality()
	 SV_BAR_FRAME:Show()
end

function disableSurgingVitality()
	 SV_BAR_FRAME:Hide()
end
