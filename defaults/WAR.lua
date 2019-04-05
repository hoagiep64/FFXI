--WARRIOR--
function refresh_WAR()
	if displaySet == 1 then
		custom_WAR()
		return
	elseif displaySet == 0 then
		--1-- Set
		Set_Display(1) -- Set
		--2-- Berserk
		Ability_Display(2,1,56) -- Berserk
		--3-- Warcry
		Ability_Display(3,2,68) -- Warcry
		--4-- Bloodrage
		Ability_Display(4,11,460) -- Bloodrage
		--5-- Retaliation
		Ability_Display(5,8,405) -- Retaliation
		--6-- Restraint
		Ability_Display(6,9,435) -- Restraint
		--7-- Aggressor
		Ability_Display(7,4,58) -- Aggressor 
		--8-- Subjob Display
		Subjob_Display(8)
		Empty(9)
		Empty(10)
		return
	end
end