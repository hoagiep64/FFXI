-- BLUUARI --
function refresh_BLU()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_BLU()
	elseif displaySet == 0 then -- Use Paulu's Default BLU display
		--1-- Set
		Set_Display(1)
		--2-- Unbridled Learning
		Ability_Display(2,81,485)
		--3-- Diffusion
		Ability_Display(3,184,356)
		--4-- Chain Affinity
		Ability_Display(4,181,164)
		--5-- Burst Affinity
		Ability_Display(5,182,165)
		--6-- Subjob
		Subjob_Display(6)
		--7--
		Empty(7)
		--8--
		Empty(8)
		--9--
		Empty(9)
		--10--
		Empty(10)
	end
end