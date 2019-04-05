--MONK--
function refresh_MNK()
	if displaySet == 1 then
		custom_MNK()
	elseif displaySet == 0 then
		--1-- Set
		Set_Display()
		--2-- Impetus
		Ability_Display(2,31,461)
		--3-- Footwork
		Ability_Display(3,21,406)
		--4-- Focus
		Ability_Display(4,13,59)
		--5-- Dodge
		Ability_Display(5,14,60)
		--6-- Chakra
		Ability_Display(6,15)
		--7/8-- Subjob
		Subjob_Display(7)
		Empty(8)
		Empty(9)
		Empty(10)
	end
end