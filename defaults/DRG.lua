-- DRGUARI --
function refresh_DRG()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_DRG()
	elseif displaySet == 0 then -- Use Paulu's Default DRG display
		--1-- Set
		Set_Display(1)
		--2-- Jump
		Ability_Display(2,158)
		--3-- Spirit Jump
		Ability_Display(3,166)
		--4-- High Jump
		Ability_Display(4,159)
		--5-- Soul Jump
		Ability_Display(5,167)
		--6-- Super Jump
		Ability_Display(6,160)
		--7-- Angon
		Ability_Display(7,165)
		--8-- Subjob
		Subjob_Display(8)
		--9-- Pet_Display
		Pet_Display(9)
		Empty(10)
	end
end