-- CORSAIR --
function refresh_COR()
	if displaySet == 1 then -- Checks for User's custom display labels
		custom_COR()
	elseif displaySet == 0 then -- Use Paulu's Default COR display
		--1-- Set
		Set_Display(1)
		--2-- Range Display
		Range_Display(2)
		--3-- Triple Shot
		Ability_Display(3,84,467)
		--4-- Phantom Roll / Bust
		Phantom_Roll_Display(4)
		--5-- Crooker Cards
		Ability_Display(5,96,601)
		--6-- Random Deal
		Ability_Display(6,196)
		--7-- Quickdraw
		Quickdraw_Display(7)
		--8-- Subjob
		Subjob_Display(8)
		--9--
		Empty(9)
		--10--
		Empty(10)
	end
end