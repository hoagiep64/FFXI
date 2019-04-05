-- SCHOLAR --
function refresh_SCH()
	if displaySet == 1 then
		custom_SCH()
	elseif displaySet == 0 then
		--1-- Set
		Set_Display(1)
		--2-- Strategem
		Strategem_Display(2)
		--3-- Sublimation
		Ability_Display(3,234,188)
		--4-- Modus Veritas
		Ability_Display(4,230)
		--5-- Arts
		Arts_Display(5)
		--6-- Subjob
		Subjob_Display(6)
		Empty(7)
		Empty(8)
		Empty(9)
		Empty(10)
		
	end
end