-- BARD --
function refresh_BRD()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_BRD()
	elseif displaySet == 0 then -- Use Paulu's Default BRD display
		--1-- Set
		Set_Display(1)
		--2-- Marcato
		Ability_Display(2,48,231)
		--3-- Troubadour
		Ability_Display(3,110,348)
		--4-- Nightingale
		Ability_Display(4,109,347)
		--5-- Subjob
		Subjob_Display(5)
		Empty(6)
		Empty(7)
		Empty(8)
		Empty(9)
		Empty(10)
	end
end