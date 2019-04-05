-- PALADIN --
function refresh_PLD()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_PLD()
	elseif displaySet == 0 then -- Use Paulu's Default PLD display
		--1-- Set
		Set_Display(1)
		--2-- Sentinel
		Ability_Display(2,75,62) -- Sentinel
		--3-- Palisade
		Ability_Display(3,42,478) -- Palisade
		--4-- Rampart
		Ability_Display(4,77) -- Rampart
		--5-- Fealty
		Ability_Display(5,78,344) -- Fealty
		--6-- Shield Bash
		Ability_Display(6,73) -- Shield Bash
		--7--
		Spell_Display(7,112) -- Flash
		--8--
		Subjob_Display(8)	
		--9--
		Empty(9)	
		--10-- 
		Empty(10)
	end
end