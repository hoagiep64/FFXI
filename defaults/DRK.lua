-- DARK KNIGHT --

function refresh_DRK()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_DRK()
	elseif displaySet == 0 then -- Use Paulu's Default DRK display
		--1-- Set
		Set_Display(1)
		--2-- Sentinel
		Ability_Display(2,87,64) -- Last Resort
		--3-- Weapon Bash
		Ability_Display(3,88) -- Weapon Bash
		--4-- Souleater
		Ability_Display(4,85,63) -- Souleater
		--5-- Diabolic Eye
		Ability_Display(5,90,346) -- Diabolic Eye
		--6-- Dark Seal
		Ability_Display(6,89,345) -- Dark Seal
		--7-- 
		Subjob_Display(7)	
		--8--
		Empty(8)		
		--9--
		Empty(9)	
		--10-- 
		Empty(10)
	end
end