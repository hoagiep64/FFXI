-- SUMMONER --
function refresh_SMN()
	local pet = windower.ffxi.get_mob_by_target('pet')
	
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_SMN()
	elseif displaySet == 0 then -- Use Paulu's Default SMN display
		--1-- Set
		Set_Display(1)
		--2-- Avatar's Favor
		Favor_Display(2)
		if pet ~= nil then
			--3-- Blood Pact: Rage
			Ability_Display(3,173)	
			--4-- Blood Pact: Ward
			Ability_Display(4,174)
			--5--
			Pet_Display(5)
			--6-- Apogee
			Ability_Display(6,108,583)
			--7-- Mana Cede
			Ability_Display(7,71)
			--8-- Elemental Siphon
			Ability_Display(8,175)
			--9-- Sub Jobs --
			Subjob_Display(9)
		else
			--3-- Apogee
			Ability_Display(3,108,583)
			--4-- Mana Cede
			Ability_Display(4,71)
			--5-- Elemental Siphon
			Ability_Display(5,175)
			--6-- Sub Jobs --
			Subjob_Display(6)
			Empty(7)
			Empty(8)
			Empty(9)
		end
		--10-- 
		Empty(10)
	end
end