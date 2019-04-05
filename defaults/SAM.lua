-- SAMUARI --
function refresh_SAM()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_SAM()
	elseif displaySet == 0 then -- Use Paulu's Default SAM display
		--1-- Set
		Set_Display(1)
		Hasso_Seigan_Display(2)
		Ability_Display(3,134) -- Meditate
		Ability_Display(4,54,483) -- Hagakure
		Ability_Display(5,132) -- Konzen-ittai
		Ability_Display(6,140,408) -- Sekkanoki
		Ability_Display(7,141,440)	-- Sengikori
		Subjob_Display(8)		
		Range_Display(9) -- Range/Ammo
		TP_Display(10)
	end
end