-- PUPUARI --
function refresh_PUP()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_PUP()
	elseif displaySet == 0 then -- Use Paulu's Default PUP display
		--1-- Set
		Set_Display(1)
		--2-- Activate / Deus Ex Automata
		local activate_recast = windower.ffxi.get_ability_recasts()[205]
		if activate_recast == 0 then
			Ability_Display(2,205)
		else
			Ability_Display(2,115)
		end
		--3-- Repair
		Ability_Display(3,206)
		--4-- Maintenance
		Ability_Display(4,214)
		--5-- Cooldown
		Ability_Display(5,114)
		--6-- Tactical Switch
		Ability_Display(6,213)	
		--7-- Role Reversal
		Ability_Display(7,211)
		--8-- Sub Jobs --
		Subjob_Display(8)	
		--9-- Range/Ammo
		Ammo_Display(9)
		--10-- 
		Empty(10)
	end
end