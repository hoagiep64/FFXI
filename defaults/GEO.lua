-- GEOMANCER -- JobDisplay.lua
function refresh_GEO()
	if displaySet == 1 then
		custom_GEO()
		return
	elseif displaySet == 0 then
		--1--
		Set_Display(1)
		--2-- Colure Active (Indi Spell Active)
		Buff_Display(2,612)
		--3-- Pet Display
		Pet_Display(3)
		--4-- Ecl.Attr./Last.Eman.
		Ability_Display(4,244)
		--5-- Dematerialize
		Ability_Display(5,248)
		--6-- Entrust
		Ability_Display(6,93,584)
		--7-- Theurgic Focus
		Ability_Display(7,247,569)
		--8-- Subjob
		Subjob_Display(8)
		
		Empty(9)
		Empty(10)
		return
	end
end