-- RED MAGE --
function refresh_RDM()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_RDM()
	elseif displaySet == 0 then -- Use Paulu's Default RDM display
		--1-- Set
		Set_Display(1)
		--2-- Sabotaur
		Ability_Display(2,36,454)
		--3-- Composure 
		Ability_Display(3,50,419)
		--4-- Convert
		Ability_Display(4,49)
		--5-- Refresh
		Buff_Display(5,43)
		--6-- Haste
		Buff_Display(6,33)
		--7-- Enspell
		Enspell_Display(7)
		--8-- Sub Jobs --
		Subjob_Display(8)		
		--9--
		Empty(9)
		--10-- 
		Empty(10)
		--TP_Display(10)
	end
end