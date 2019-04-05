-- RUNEFENCER --
function refresh_RUN()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_RUN()
	elseif displaySet == 0 then -- Use Paulu's Default RUN display
		--1-- Set
		Set_Display(1)
		--2-- Vivacious Pulse
		Ability_Display(2,242)
		--3-- One for All 
		Ability_Display(3,118,538)
		--4-- Swordplay
		Ability_Display(4,24,532)
		--5-- Battuta
		Ability_Display(5,120,570)
		--6-- Vallation
		Ability_Display(6,23,531)
		--7-- Valiance
		Ability_Display(7,113,535)
		--8-- Sub Jobs --
		Subjob_Display(8)		
		--9--
		Empty(9)
		--10-- 
		Empty(10)
		--TP_Display(10)
	end
end