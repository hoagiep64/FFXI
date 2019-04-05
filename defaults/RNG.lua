-- RANGER --
function refresh_RNG()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_RNG()
	elseif displaySet == 0 then -- Use Paulu's Default RNG display
		--1-- Set
		Set_Display(1)
		--2-- Meditate
		Range_Display(2)
		--3-- Sharpshot
		Ability_Display(3,124,72)
		--4-- Velocity Shot
		Ability_Display(4,129,371)
		--5-- Barrage
		Ability_Display(5,125,73)
		--6-- Double Shot
		Ability_Display(6,126,433)
		--7-- Decoy Shot
		Ability_Display(7,52,482)
		--8-- Sub Jobs --
		Subjob_Display(8)		
		--9--
		Empty(9)
		--10-- 
		Empty(10)
	end
end