local CP = LibStub("AceAddon-3.0"):NewAddon("MyAddon", "AceEvent-3.0")

function CP:OnInitialize()
	 print("Corruption Procs activated with AceAddon")
end

function CP:OnEnable()
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

function CP:COMBAT_LOG_EVENT_UNFILTERED()
	 local _, event, _,_,_,_,_, destGUID, _,_,_, spellId, spellName = CombatLogGetCurrentEventInfo()
	 print("new event")
	 print(spellName)
end

function ShowFrame()
	 local f = CreateFrame("Frame",nil,UIParent)
	 f:SetFrameStrata("BACKGROUND")
	 f:SetWidth(128)
	 f:SetHeight(64)

	 local t = f:CreateTexture(nil,"BACKGROUND")
	 t:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Factions.blp")
	 t:SetAllPoints(f)
	 f.texture = t

	 f:SetPoint("CENTER",0,0)
	 f:Show()
end
