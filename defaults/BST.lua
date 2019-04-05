-- BEASTMASTER --
function refresh_BST()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_BST()
	elseif displaySet == 0 then -- Use Paulu's Default BST display
		--1-- Set
		Set_Display(1)
		--2-- Pet Display
		Pet_Display(2)
		--3-- Call Beast
		Ability_Display(3,104)
		--4-- Reward
		Ability_Display(4,103)
		--5-- Sic/Ready
		--Ability_Display(5,102)
		Sic_Ready_Display(5,0)
		--6-- Spur
		Ability_Display(6,45,456)
		--7-- Snarl
		Ability_Display(7,107)	
		--8-- Sub Jobs --
		Subjob_Display(8)		
		--9--
		Empty(9)
		--10-- 
		Empty(10)
	end
end