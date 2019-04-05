-- BLACKMAGE --
function refresh_BLM()
	if displaySet == 1 then
		custom_BLM()
	elseif displaySet == 0 then
		--1-- Set Display
		Set_Display(1)		
		--2-- Mana Wall
		Ability_Display(2,39,437)
		--3-- Manawell
		Ability_Display(3,35,229)
		--4-- Elemental Seal
		Ability_Display(4,38,79)
		--5-- Enmity Douse
		Ability_Display(5,34)
		--6-- Cascade
		Ability_Display(6,12,598)
		--7-- Subjob
		Subjob_Display(7)
		--8-- MP
		MPP_Display(8)
		Empty(9)
		Empty(10)
	end
end