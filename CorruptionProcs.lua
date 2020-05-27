local CorruptionProcs = LibStub("AceAddon-3.0"):NewAddon("MyAddon")

function CorruptionProcs:OnInitialize()
	 print("Corruption Procs activated with AceAddon")
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
